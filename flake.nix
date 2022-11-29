
{
  description = "A set of tools to flash an annepro2 keyboard with custom firmware.";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    flake-utils.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let 
        pkgs = import nixpkgs {
          system = system;
        };
        annepro2tools = pkgs.callPackage ./annepro2-tools.nix {};
      in
      {
        defaultPackage = annepro2tools;
        packages = annepro2tools;
      }
    );
  
}

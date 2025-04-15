
provider "aws" {
  region = "eu-west-2"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
  backend "s3" {
    bucket = "038462757951-nexus-cod-development-terraform-s3-backend"
    key    = "terraform/test/development.tfstate"
    region = "eu-west-2"
  }
}

resource "aws_s3_bucket" "this" {
  bucket = "test-codebuild-bucket-vbollineni"

  tags = {
    Name        = "test-codebuild-bucket-vbollineni"
    Environment = "Dev"
  }
}

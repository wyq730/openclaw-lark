#!/usr/bin/env bash
set -euo pipefail

pnpm install
pnpm build

rm -rf build && mkdir build
npm pack --pack-destination build

rm -rf ~/.openclaw/extensions/openclaw-lark && mkdir -p ~/.openclaw/extensions/openclaw-lark
tar -xzf build/*.tgz --strip-components=1 -C ~/.openclaw/extensions/openclaw-lark
cd ~/.openclaw/extensions/openclaw-lark && npm install --registry=http://mirrors.cloud.tencent.com/npm/

echo "Succeeded."

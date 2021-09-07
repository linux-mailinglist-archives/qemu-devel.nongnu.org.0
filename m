Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74291402911
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:39:57 +0200 (CEST)
Received: from localhost ([::1]:41218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaOK-0007c0-G5
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa7I-0001h7-8D
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:22:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa7G-0007Cs-1v
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QymyblDEC6rv1SaxuKQC3kFmPh5fKbgp+9dEys/vwcY=;
 b=TQ9Jsw1lTUoZOTPcfc2lInqsIqUae2bfjgCfQqI9rIPC41J6f4+KGUrbSWx2PmRQChpELu
 U4ACHR7KtHN10Okkis07dP0IOU8tuqcAzEH6PlMTsm0KXHSTHEMmlOWqMsNSq5muWTe5dJ
 z97j09fZK12BAehDQMgeYjmdUxc8hbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-UiGAd1t9Na-el_nVXqaVaQ-1; Tue, 07 Sep 2021 08:22:14 -0400
X-MC-Unique: UiGAd1t9Na-el_nVXqaVaQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE181835DE0
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:22:13 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7893560C05;
 Tue,  7 Sep 2021 12:22:04 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 11/32] build-sys: add a cargo-wrapper script
Date: Tue,  7 Sep 2021 16:19:22 +0400
Message-Id: <20210907121943.3498701-12-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Introduce a script to help calling cargo from Rust.

This script will help to invoke cargo in different ways. For now, it
supports building static libraries and binaries. It sets up a common
environment, run the compiler with config-host options (config-target to
be added later when needed) and grep the compile output for the linker
flags. Finally it copies the built artefact to the expected meson output
directory, and create a file with the linker arguments.

cargo is the most convenient way to build Rust code, with various
crate dependencies, tests, and has features that meson lacks in general
for Rust.

Trying to convert projects to meson automatically is an option I
considered seriously (see for ex https://github.com/badboy/bygge for
ninja conversion), but the complexity of the task makes this endeavour
out of scope at this point. External dependencies would suffer various
issues that would be hard to implement and get accepted.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build               |   4 +
 scripts/cargo_wrapper.py  | 182 ++++++++++++++++++++++++++++++++++++++
 scripts/configh_to_cfg.py |  44 +++++++++
 3 files changed, 230 insertions(+)
 create mode 100644 scripts/cargo_wrapper.py
 create mode 100644 scripts/configh_to_cfg.py

diff --git a/meson.build b/meson.build
index 63b61a2bc8..a21c70d77f 100644
--- a/meson.build
+++ b/meson.build
@@ -110,6 +110,10 @@ bzip2 = find_program('bzip2', required: install_edk2_blobs)
 
 cargo = find_program('cargo', required: get_option('with_rust'))
 with_rust = cargo.found()
+cargo_wrapper = [
+  find_program('scripts/cargo_wrapper.py'),
+  '--configh', meson.current_build_dir() / 'config-host.h'
+]
 
 if with_rust
   rust_target_triple = get_option('with_rust_target')
diff --git a/scripts/cargo_wrapper.py b/scripts/cargo_wrapper.py
new file mode 100644
index 0000000000..75518e8c02
--- /dev/null
+++ b/scripts/cargo_wrapper.py
@@ -0,0 +1,182 @@
+#!/usr/bin/env python3
+# Copyright (c) 2020 Red Hat, Inc.
+#
+# Author:
+#  Marc-André Lureau <marcandre.lureau@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+import argparse
+import configparser
+import distutils.file_util
+import json
+import logging
+import os
+import os.path
+import re
+import subprocess
+import sys
+from pathlib import Path
+from typing import Any, Dict, List, Tuple
+
+from configh_to_cfg import generate_cfg
+
+
+def get_rustc_target_spec(target_triple: str) -> Any:
+    cmd = [
+        "rustc",
+        "+nightly",
+        "-Z",
+        "unstable-options",
+        "--print",
+        "target-spec-json",
+    ]
+    if target_triple:
+        cmd += ["--target", target_triple]
+
+    out = subprocess.check_output(cmd)
+    return json.loads(out)
+
+
+def get_exe_suffix(target_triple: str) -> str:
+    try:
+        # this will fail if nightly is not installed
+        spec = get_rustc_target_spec(target_triple)
+        return spec.get("exe-suffix", "")
+    except: # pylint: disable=W0702
+        # let's implement a simple fallback
+        if 'windows' in target_triple:
+            return '.exe'
+        return ''
+
+
+def get_cargo_target_dir(args: argparse.Namespace) -> str:
+    # avoid conflict with qemu "target" directory
+    return os.path.join(args.build_dir, "rs-target")
+
+
+def get_manifest_path(args: argparse.Namespace) -> str:
+    return os.path.join(args.src_dir, "Cargo.toml")
+
+
+def get_cargo_rustc(
+    cargo_rustc_args: List[str], args: argparse.Namespace
+) -> Tuple[Dict[str, Any], List[str]]:
+    cfg = [c for h in args.configh for c in generate_cfg(h)]
+    target_dir = get_cargo_target_dir(args)
+    manifest_path = get_manifest_path(args)
+
+    env = {}
+    env["MESON_CURRENT_BUILD_DIR"] = args.build_dir
+    env["MESON_BUILD_ROOT"] = args.build_root
+    env["WINAPI_NO_BUNDLED_LIBRARIES"] = "1"
+    cargo_cmd = [
+        "cargo",
+        "rustc",
+        "--target-dir",
+        target_dir,
+        "--manifest-path",
+        manifest_path,
+    ]
+    cargo_cmd += cargo_rustc_args
+    if args.target_triple:
+        cargo_cmd += ["--target", args.target_triple]
+    if args.build_type == "release":
+        cargo_cmd += ["--release"]
+    cargo_cmd += ["--"] + cfg + args.EXTRA
+
+    return (env, cargo_cmd)
+
+
+def run_cargo(env: Dict[str, Any], cargo_cmd: List[str]) -> str:
+    envlog = " ".join(["{}={}".format(k, v) for k, v in env.items()])
+    cmdlog = " ".join(cargo_cmd)
+    logging.debug("Running %s %s", envlog, cmdlog)
+    try:
+        out = subprocess.check_output(
+            cargo_cmd,
+            env=dict(os.environ, **env),
+            stderr=subprocess.STDOUT,
+            universal_newlines=True,
+        )
+    except subprocess.CalledProcessError as err:
+        print("Environment: " + envlog)
+        print("Command: " + cmdlog)
+        print(err.output)
+        sys.exit(1)
+
+    return out
+
+
+def build_lib(args: argparse.Namespace) -> None:
+    logging.debug('build-lib')
+    target_dir = get_cargo_target_dir(args)
+    manifest_path = get_manifest_path(args)
+    # let's pretend it's an INI file to avoid extra toml dependency
+    config = configparser.ConfigParser()
+    config.read(manifest_path)
+    package_name = config["package"]["name"].strip('"').replace('-', '_')
+    liba = os.path.join(
+        target_dir, args.target_triple, args.build_type, "lib" + package_name + ".a"
+    )
+    libargs = os.path.join(args.build_dir, "lib" + package_name + ".args")
+
+    env, cargo_cmd = get_cargo_rustc(["--lib"], args)
+    cargo_cmd += ["--print", "native-static-libs"]
+    out = run_cargo(env, cargo_cmd)
+    native_static_libs = re.search(r"native-static-libs:(.*)", out)
+    link_args = native_static_libs.group(1)
+    with open(libargs, "w") as file:
+        print(link_args, file=file)
+    logging.debug("cp %s %s", liba, args.build_dir)
+    distutils.file_util.copy_file(liba, args.build_dir, update=True)
+
+
+def build_bin(args: argparse.Namespace) -> None:
+    logging.debug('build-bin')
+    env, cargo_cmd = get_cargo_rustc(["--bin", args.bin], args)
+    exe_suffix = get_exe_suffix(args.target_triple)
+    run_cargo(env, cargo_cmd)
+    target_dir = get_cargo_target_dir(args)
+    path = os.path.join(
+        target_dir, args.target_triple, args.build_type, args.bin + exe_suffix
+    )
+    dest = args.build_dir
+    if args.rename:
+        dest = Path(dest) / args.rename
+    logging.debug("cp %s %s", path, dest)
+    distutils.file_util.copy_file(path, dest, update=True)
+
+
+def main() -> None:
+    parser = argparse.ArgumentParser()
+    parser.add_argument("-v", "--verbose", action='store_true')
+    parser.add_argument("--configh", action='append', default=[])
+    parser.add_argument("build_dir")
+    parser.add_argument("src_dir")
+    parser.add_argument("build_root")
+    parser.add_argument("build_type")
+    parser.add_argument("target_triple")
+    subparsers = parser.add_subparsers()
+
+    buildlib = subparsers.add_parser("build-lib")
+    buildlib.add_argument("EXTRA", nargs="*")
+    buildlib.set_defaults(func=build_lib)
+
+    buildbin = subparsers.add_parser("build-bin")
+    buildbin.add_argument("--rename")
+    buildbin.add_argument("bin")
+    buildbin.add_argument("EXTRA", nargs="*")
+    buildbin.set_defaults(func=build_bin)
+
+    args = parser.parse_args()
+    if args.verbose:
+        logging.basicConfig(level=logging.DEBUG)
+    logging.debug('args: %s', args)
+
+    args.func(args)
+
+
+if __name__ == "__main__":
+    main()
diff --git a/scripts/configh_to_cfg.py b/scripts/configh_to_cfg.py
new file mode 100644
index 0000000000..b8f0c2da9a
--- /dev/null
+++ b/scripts/configh_to_cfg.py
@@ -0,0 +1,44 @@
+#!/usr/bin/env python3
+# Copyright (c) 2020 Red Hat, Inc.
+#
+# Author:
+#  Marc-André Lureau <marcandre.lureau@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+import argparse
+from typing import List
+
+
+def cfg_name(name: str) -> str:
+    if name.startswith("CONFIG_") or name.startswith("TARGET_") or name.startswith("HAVE_"):
+        return name
+    return ""
+
+
+def generate_cfg(header: str) -> List[str]:
+    with open(header, encoding="utf-8") as cfg:
+        config = [l.split()[1:] for l in cfg if l.startswith("#define")]
+
+    cfg_list = []
+    for cfg in config:
+        name = cfg_name(cfg[0])
+        if not name:
+            continue
+        if len(cfg) >= 2 and cfg[1] != "1":
+            continue
+        cfg_list.append("--cfg")
+        cfg_list.append(name)
+    return cfg_list
+
+
+def main() -> None:
+    parser = argparse.ArgumentParser()
+    parser.add_argument("HEADER")
+    args = parser.parse_args()
+    print(" ".join(generate_cfg(args.HEADER)))
+
+
+if __name__ == "__main__":
+    main()
-- 
2.33.0.113.g6c40894d24



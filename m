Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D4140293E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:53:47 +0200 (CEST)
Received: from localhost ([::1]:39136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNabi-0000jN-P4
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa9B-0006RL-5K
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:24:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa97-00088P-4F
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:24:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fbBTM1e8ZMRefW54scV5nkMLt1N7KS1x+oha0mIM9NI=;
 b=PQUz2UVT6pa1ybZCSkYzbXQZLYQDRadCZUZlaRSfcd/tCqJFAhWbd9+LZyM6IggrLm7wxA
 2vKS30OpZNz7hcf9jLIKT0N6uhpCaCpv57KCI3Q79iUhd8ds+E6Sg5xn+2XZ7CnBDxVm5H
 RF9VcF3tsh8uq0IEnS3RNM0sbM9KHJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-Rwbpqst-M4Gpb_IzXs_1Bw-1; Tue, 07 Sep 2021 08:24:10 -0400
X-MC-Unique: Rwbpqst-M4Gpb_IzXs_1Bw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8066D80292A
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:24:09 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13B6D60C05;
 Tue,  7 Sep 2021 12:23:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 19/32] tests: check Rust and C CABI diffs
Date: Tue,  7 Sep 2021 16:19:30 +0400
Message-Id: <20210907121943.3498701-20-marcandre.lureau@redhat.com>
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build              |  3 +++
 Cargo.lock               |  7 +++++++
 Cargo.toml               |  1 +
 scripts/diff_commands.py | 40 ++++++++++++++++++++++++++++++++++++++++
 tests/Cargo.toml         | 13 +++++++++++++
 tests/meson.build        | 29 +++++++++++++++++++++++++----
 tests/qapi-cabi.rs       |  5 +++++
 tests/qapi_ffi.rs        |  8 ++++++++
 8 files changed, 102 insertions(+), 4 deletions(-)
 create mode 100644 scripts/diff_commands.py
 create mode 100644 tests/Cargo.toml
 create mode 100644 tests/qapi-cabi.rs
 create mode 100644 tests/qapi_ffi.rs

diff --git a/meson.build b/meson.build
index b45f409eb4..74e90059c2 100644
--- a/meson.build
+++ b/meson.build
@@ -118,6 +118,7 @@ cargo_wrapper = [
   find_program('scripts/cargo_wrapper.py'),
   '--configh', meson.current_build_dir() / 'config-host.h'
 ]
+diff_commands = find_program('scripts/diff_commands.py')
 
 if with_rust
   rust_target_triple = get_option('with_rust_target')
@@ -212,7 +213,9 @@ iokit = []
 emulator_link_args = []
 nvmm =not_found
 hvf = not_found
+exe_suffix = ''
 if targetos == 'windows'
+  exe_suffix = '.exe'
   socket = cc.find_library('ws2_32')
   winmm = cc.find_library('winmm')
 
diff --git a/Cargo.lock b/Cargo.lock
index 8dc2dd9da7..f2cd0ee96e 100644
--- a/Cargo.lock
+++ b/Cargo.lock
@@ -61,3 +61,10 @@ dependencies = [
  "libc",
  "memoffset",
 ]
+
+[[package]]
+name = "qemu-tests"
+version = "0.0.1"
+dependencies = [
+ "common",
+]
diff --git a/Cargo.toml b/Cargo.toml
index 14131eed3c..f4a078e62d 100644
--- a/Cargo.toml
+++ b/Cargo.toml
@@ -1,4 +1,5 @@
 [workspace]
 members = [
   "rust/common",
+  "tests",
 ]
diff --git a/scripts/diff_commands.py b/scripts/diff_commands.py
new file mode 100644
index 0000000000..eecc03dd76
--- /dev/null
+++ b/scripts/diff_commands.py
@@ -0,0 +1,40 @@
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
+import difflib
+import subprocess
+import sys
+
+
+def main() -> None:
+    parser = argparse.ArgumentParser()
+    parser.add_argument("EXE1")
+    parser.add_argument("EXE2")
+    args = parser.parse_args()
+
+    exe1_out = subprocess.check_output(args.EXE1, universal_newlines=True)
+    exe2_out = subprocess.check_output(args.EXE2, universal_newlines=True)
+    out_diff = difflib.unified_diff(
+        exe1_out.splitlines(True),
+        exe2_out.splitlines(True),
+        fromfile=args.EXE1,
+        tofile=args.EXE2,
+    )
+    has_diff = False
+    for line in out_diff:
+        has_diff = True
+        sys.stdout.write(line)
+
+    if has_diff:
+        sys.exit(1)
+
+
+if __name__ == "__main__":
+    main()
diff --git a/tests/Cargo.toml b/tests/Cargo.toml
new file mode 100644
index 0000000000..7a4f6060b1
--- /dev/null
+++ b/tests/Cargo.toml
@@ -0,0 +1,13 @@
+[package]
+name = "qemu-tests"
+version = "0.0.1"
+edition = "2018"
+publish = false
+
+[dependencies]
+common = { path = "../rust/common" }
+
+[[bin]]
+name = "qapi-cabi-rs"
+path = "qapi-cabi.rs"
+doc = false
diff --git a/tests/meson.build b/tests/meson.build
index 7292fe20df..f9af42caba 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -52,6 +52,19 @@ if with_rust
                                command: [ qapi_gen, '-o', meson.current_build_dir(),
                                           '-r', '-b', '-p', 'test-', '@INPUT0@' ],
                                depend_files: qapi_gen_depends)
+  qapi_cabi_rs = custom_target('qapi-cabi-rs',
+                               output: ['qapi-cabi-rs' + exe_suffix],
+                               build_always_stale: true,
+                               depends: [test_qapi_rs],
+                               command: [cargo_wrapper,
+                                         meson.current_build_dir(),
+                                         meson.current_source_dir(),
+                                         meson.build_root(),
+                                         rs_build_type,
+                                         rust_target_triple,
+                                         'build-bin',
+                                         'qapi-cabi-rs',
+                                         '--', '--cfg', 'QAPI_CABI'])
 endif
 
 # meson doesn't like generated output in other directories
@@ -75,10 +88,18 @@ testqapi = declare_dependency(link_with: libtestqapi,
                               dependencies: [qemuutil],
                               sources: [genh, test_qapi_headers])
 
-executable('qapi-cabi',
-           files('qapi-cabi.c'),
-           dependencies: testqapi,
-           c_args: ['-DQAPI_CABI'])
+qapi_cabi = executable('qapi-cabi',
+                       files('qapi-cabi.c'),
+                       dependencies: testqapi,
+                       c_args: ['-DQAPI_CABI'])
+
+if with_rust
+  test('Test QAPI CABI diff',
+       diff_commands,
+       args: [qapi_cabi.full_path(), qapi_cabi_rs.full_path()],
+       depends: [qapi_cabi, qapi_cabi_rs],
+       suite: ['qapi'])
+endif
 
 test_deps = {
   'test-qht-par': qht_bench,
diff --git a/tests/qapi-cabi.rs b/tests/qapi-cabi.rs
new file mode 100644
index 0000000000..0b4b99cc78
--- /dev/null
+++ b/tests/qapi-cabi.rs
@@ -0,0 +1,5 @@
+mod qapi_ffi;
+
+fn main() {
+    qapi_ffi::cabi()
+}
diff --git a/tests/qapi_ffi.rs b/tests/qapi_ffi.rs
new file mode 100644
index 0000000000..d50a02efbe
--- /dev/null
+++ b/tests/qapi_ffi.rs
@@ -0,0 +1,8 @@
+#![allow(dead_code)]
+
+use common::libc;
+
+include!(concat!(
+    env!("MESON_BUILD_ROOT"),
+    "/tests/test-qapi-ffi-types.rs"
+));
-- 
2.33.0.113.g6c40894d24



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7511C4028F7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:37:21 +0200 (CEST)
Received: from localhost ([::1]:35720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaLo-0003oF-Go
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa9i-0007S3-TL
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:24:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa9Z-0008H2-52
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:24:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gk4x+XbLHcqFfUpeSw0A0MHUBHJf0doVmVjshzimK5w=;
 b=IxXjzvvEG6D6aHIL1Fkrr77x7wW5h73NnB+X6UcE/gZawbESfy7isudeZeddMEBCKcRnCU
 ntrjBIoQg42zI13oR9xx3BhCmSFLzNUYvSSnU4a4URJ+Vvm2jOcqCQ67OKRQZtmjtWppkP
 dvmZhCLPRL9Ni1h/ZbDXi+T+heE7e7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-jX6zQ6ENMtiyeZGmy8fXRA-1; Tue, 07 Sep 2021 08:24:35 -0400
X-MC-Unique: jX6zQ6ENMtiyeZGmy8fXRA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C222107ACC7
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:24:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3E6460657;
 Tue,  7 Sep 2021 12:24:25 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 21/32] tests/rust: build a common library,
 checking bindings compile
Date: Tue,  7 Sep 2021 16:19:32 +0400
Message-Id: <20210907121943.3498701-22-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Meson doesn't integrate very smoothly with Cargo. Use the cargo-wrapper
script as a custom_target() always stale to build the Rust code. The
"build-lib" command will produce a static library in the meson expected
output directory, as well as link flags that must be employed to do the
final link.

Those link flags can't be queried during configure time (Cargo doesn't
have a user-queriable configure step), so we pass them to the linker
thanks to @file argument support at build time.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/Cargo.toml  |  4 ++++
 tests/lib.rs      |  2 ++
 tests/meson.build | 20 +++++++++++++++++++-
 tests/qapi.rs     | 11 +++++++++++
 4 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 tests/lib.rs
 create mode 100644 tests/qapi.rs

diff --git a/tests/Cargo.toml b/tests/Cargo.toml
index 7a4f6060b1..8a014dff89 100644
--- a/tests/Cargo.toml
+++ b/tests/Cargo.toml
@@ -7,6 +7,10 @@ publish = false
 [dependencies]
 common = { path = "../rust/common" }
 
+[lib]
+path = "lib.rs"
+crate-type = ["staticlib"]
+
 [[bin]]
 name = "qapi-cabi-rs"
 path = "qapi-cabi.rs"
diff --git a/tests/lib.rs b/tests/lib.rs
new file mode 100644
index 0000000000..e6fdf60a55
--- /dev/null
+++ b/tests/lib.rs
@@ -0,0 +1,2 @@
+mod qapi_ffi;
+mod qapi;
diff --git a/tests/meson.build b/tests/meson.build
index f9af42caba..09aa2bdf55 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -45,7 +45,10 @@ test_qapi_files = custom_target('Test QAPI files',
                                 depend_files: qapi_gen_depends)
 
 if with_rust
-  test_qapi_rs_outputs = ['test-qapi-ffi-types.rs']
+  test_qapi_rs_outputs = [
+    'test-qapi-ffi-types.rs',
+    'test-qapi-types.rs',
+  ]
   test_qapi_rs = custom_target('Test QAPI Rust binding',
                                output: test_qapi_rs_outputs,
                                input: test_qapi_inputs,
@@ -65,6 +68,21 @@ if with_rust
                                          'build-bin',
                                          'qapi-cabi-rs',
                                          '--', '--cfg', 'QAPI_CABI'])
+  libtest_rs = custom_target('Test Rust library',
+                             build_by_default: true,
+                             output: ['libqemu_tests.args', 'libqemu_tests.a'],
+                             build_always_stale: true,
+                             depends: [test_qapi_rs],
+                             command: [cargo_wrapper,
+                                       meson.current_build_dir(),
+                                       meson.current_source_dir(),
+                                       meson.build_root(),
+                                       rs_build_type,
+                                       rust_target_triple,
+                                       'build-lib'])
+  libtest_rs = declare_dependency(
+    link_args: '@' + libtest_rs[0].full_path(),
+    sources: libtest_rs)
 endif
 
 # meson doesn't like generated output in other directories
diff --git a/tests/qapi.rs b/tests/qapi.rs
new file mode 100644
index 0000000000..93e3e714e7
--- /dev/null
+++ b/tests/qapi.rs
@@ -0,0 +1,11 @@
+#![allow(dead_code)]
+#![allow(non_camel_case_types)]
+
+use common::*;
+
+new_ptr!();
+
+include!(concat!(
+    env!("MESON_BUILD_ROOT"),
+    "/tests/test-qapi-types.rs"
+));
-- 
2.33.0.113.g6c40894d24



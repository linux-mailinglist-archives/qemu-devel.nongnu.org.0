Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4C6402956
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:04:05 +0200 (CEST)
Received: from localhost ([::1]:36742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNalg-0001pY-BN
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNaAT-0008Fo-6b
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:25:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNaAQ-00006t-IH
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=89LlslZG8FOzbo9cnS9vGM+7j7JqNGCajUpflvHBaoE=;
 b=isfkG+hS876lNcH2EdEmIFwPKA9GiFYvuERNXjKbiiLCAQyjp1MkNusvSZejpw8pDOQ7UQ
 JhNuJ7OHkew5uNKN6GQHlBR7PyooMkZpCZMt9clfY5d9Dpqanty0+udtysJcP/GmHxWilt
 hXyFYI+2giCN+l0kFVpfT0X7i5W1DE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-fhDCwfTEPVmXqur3MZMfuw-1; Tue, 07 Sep 2021 08:25:32 -0400
X-MC-Unique: fhDCwfTEPVmXqur3MZMfuw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28D24835DE0
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:25:32 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C39A5D9DE;
 Tue,  7 Sep 2021 12:25:06 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 25/32] qga/rust: build a qga-cabi-rs executable (ABI from
 Rust)
Date: Tue,  7 Sep 2021 16:19:36 +0400
Message-Id: <20210907121943.3498701-26-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 qga/Cargo.toml   |  5 +++++
 qga/meson.build  | 15 +++++++++++++++
 qga/qapi-cabi.rs |  6 ++++++
 3 files changed, 26 insertions(+)
 create mode 100644 qga/qapi-cabi.rs

diff --git a/qga/Cargo.toml b/qga/Cargo.toml
index 807acc947e..d262b847fa 100644
--- a/qga/Cargo.toml
+++ b/qga/Cargo.toml
@@ -10,3 +10,8 @@ common = { path = "../rust/common" }
 [lib]
 path = "lib.rs"
 crate-type = ["staticlib"]
+
+[[bin]]
+name = "qapi-cabi-rs"
+path = "qapi-cabi.rs"
+doc = false
diff --git a/qga/meson.build b/qga/meson.build
index 88d59bef0c..fd840f5c73 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -81,6 +81,21 @@ if with_rust
   qga_rs = declare_dependency(
     link_args: '@' + cargo_qga[0].full_path(),
     sources: cargo_qga)
+
+  cargo_qga_cabi = custom_target('qga-qapi-cabi-rs',
+                                 output: ['qapi-cabi-rs' + exe_suffix],
+                                 build_always_stale: true,
+                                 depends: [qapi_gen_rs_files],
+                                 command: [cargo_wrapper,
+                                           meson.current_build_dir(),
+                                           meson.current_source_dir(),
+                                           meson.build_root(),
+                                           rs_build_type,
+                                           rust_target_triple,
+                                           'build-bin',
+                                           'qapi-cabi-rs',
+                                           '--', '--cfg', 'QAPI_CABI'])
+
 endif
 
 qga = executable('qemu-ga', qga_ss.sources(),
diff --git a/qga/qapi-cabi.rs b/qga/qapi-cabi.rs
new file mode 100644
index 0000000000..d98a819ef7
--- /dev/null
+++ b/qga/qapi-cabi.rs
@@ -0,0 +1,6 @@
+pub use common::{err, Error, Result};
+mod qapi_ffi;
+
+fn main() {
+    qapi_ffi::cabi()
+}
-- 
2.33.0.113.g6c40894d24



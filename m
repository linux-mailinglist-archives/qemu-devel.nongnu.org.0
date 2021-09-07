Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D22740292D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:48:20 +0200 (CEST)
Received: from localhost ([::1]:55742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaWR-0000sl-9G
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNaAt-0000JX-Ec
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:26:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNaAr-0000Jp-Ru
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:26:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mdv3b2msb03EqP0PY7CD7P4L1hhwmn0WvmDdViJ4O/8=;
 b=O+TztxIRxb7QJwjawMwZukKj6CstMSJejGWekt1rAwentIbpkiC/LGe7mwZVu/BGacbsWH
 9ApSqZFEhOS8q1r09FW4V+f2N8ZhCsGgU5RYyZV5yqsp+O9KICecjTIvEI+VHdbscpaeIC
 o95jDqsteoHDxwNNe6LtZFjZ8p80xO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-7yy-U3vFM0SkPpKHajt3_Q-1; Tue, 07 Sep 2021 08:25:58 -0400
X-MC-Unique: 7yy-U3vFM0SkPpKHajt3_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBC321940931
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:25:57 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 756F21B46B;
 Tue,  7 Sep 2021 12:25:49 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 27/32] qga/rust: build high-level Rust QAPI types
Date: Tue,  7 Sep 2021 16:19:38 +0400
Message-Id: <20210907121943.3498701-28-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 qga/lib.rs      | 1 +
 qga/meson.build | 1 +
 qga/qapi.rs     | 6 ++++++
 3 files changed, 8 insertions(+)
 create mode 100644 qga/qapi.rs

diff --git a/qga/lib.rs b/qga/lib.rs
index 17cf43a5e9..7f62788ff6 100644
--- a/qga/lib.rs
+++ b/qga/lib.rs
@@ -1 +1,2 @@
+mod qapi;
 mod qapi_ffi;
diff --git a/qga/meson.build b/qga/meson.build
index f2064c1874..16775bc905 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -58,6 +58,7 @@ qga_rs = declare_dependency()
 if with_rust
   qga_qapi_rs_outputs = [
     'qga-qapi-ffi-types.rs',
+    'qga-qapi-types.rs',
   ]
 
   qapi_gen_rs_files = custom_target('QGA QAPI Rust bindings',
diff --git a/qga/qapi.rs b/qga/qapi.rs
new file mode 100644
index 0000000000..e4b9113300
--- /dev/null
+++ b/qga/qapi.rs
@@ -0,0 +1,6 @@
+#![allow(dead_code)]
+use common::*;
+
+new_ptr!();
+
+include!(concat!(env!("MESON_BUILD_ROOT"), "/qga/qga-qapi-types.rs"));
-- 
2.33.0.113.g6c40894d24



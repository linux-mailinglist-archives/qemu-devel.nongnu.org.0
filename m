Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814A73089DC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 16:26:14 +0100 (CET)
Received: from localhost ([::1]:44768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Vf2-0005Zz-WD
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 10:26:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l5Vd4-00052t-KI
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:24:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l5Vd1-0001h1-SR
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:24:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611933846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P3YrYrHR7uw5Jlty7lDGrYK0LziiINywKdBVMj/5OoE=;
 b=IDS9qIN9LngKPu+yILAS2bO/KLrD4zdMnuANdPb1y3fm18A0e2AFEOKWA00qHC5lxf7VMk
 aKS5DyN15lE8T+T0ydKWiS6r8hbVYQ9/g6bvGcA7seg1PTG9ePFhCYGeXDEEASjKC33Brl
 yI+rNGh+5IA24IKRkurOZQVGpYekCLE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-5f2o6eCdPvm4Z5c7RB5zHg-1; Fri, 29 Jan 2021 10:24:04 -0500
X-MC-Unique: 5f2o6eCdPvm4Z5c7RB5zHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA0828144E0
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 15:24:02 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C7AB5C1B4;
 Fri, 29 Jan 2021 15:23:54 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2] spice: delay starting until display are initialized
Date: Fri, 29 Jan 2021 19:23:51 +0400
Message-Id: <20210129152351.161971-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

QEMU used to run qemu_spice.display_init() before vm_start(), and
QXL/display interfaces where started then. Now, vm_start() happens
before QXL/display interfaces are added and Spice server doesn't
automatically start them in this case (fixed in spice git)

Fixes Spice regression introduced after 5.2, with refactoring commits
b4e1a34211 ("vl: remove separate preconfig main_loop") and
facf7c60ee ("vl: initialize displays _after_ exiting preconfiguration"),
probably others.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/qemu-spice.h | 1 +
 ui/spice-core.c         | 9 ++++++++-
 ui/spice-display.c      | 2 ++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/ui/qemu-spice.h b/include/ui/qemu-spice.h
index 2beb792972..71ecd6cfd1 100644
--- a/include/ui/qemu-spice.h
+++ b/include/ui/qemu-spice.h
@@ -28,6 +28,7 @@
 
 void qemu_spice_input_init(void);
 void qemu_spice_display_init(void);
+void qemu_spice_display_init_done(void);
 bool qemu_spice_have_display_interface(QemuConsole *con);
 int qemu_spice_add_display_interface(QXLInstance *qxlin, QemuConsole *con);
 int qemu_spice_migrate_info(const char *hostname, int port, int tls_port,
diff --git a/ui/spice-core.c b/ui/spice-core.c
index 514c0f9754..beee932f55 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -625,6 +625,14 @@ static void vm_change_state_handler(void *opaque, int running,
     }
 }
 
+void qemu_spice_display_init_done(void)
+{
+    if (runstate_is_running()) {
+        qemu_spice_display_start();
+    }
+    qemu_add_vm_change_state_handler(vm_change_state_handler, NULL);
+}
+
 static void qemu_spice_init(void)
 {
     QemuOpts *opts = QTAILQ_FIRST(&qemu_spice_opts.head);
@@ -796,7 +804,6 @@ static void qemu_spice_init(void)
 
     qemu_spice_input_init();
 
-    qemu_add_vm_change_state_handler(vm_change_state_handler, NULL);
     qemu_spice_display_stop();
 
     g_free(x509_key_file);
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 0178d5766d..3d3e3bcb22 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -1188,4 +1188,6 @@ void qemu_spice_display_init(void)
         }
         qemu_spice_display_init_one(con);
     }
+
+    qemu_spice_display_init_done();
 }
-- 
2.29.0



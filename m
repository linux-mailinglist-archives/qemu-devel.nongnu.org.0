Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2D1310543
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 07:58:43 +0100 (CET)
Received: from localhost ([::1]:38190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7v4j-0002fo-Dv
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 01:58:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v2p-00011D-Fq
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v2m-00014d-W2
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612508199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8g1I8TeDpgfKcKJDVZonGOBO0NvoFOy6rkm/tg58S+0=;
 b=BXCp3zcLw9rTBIC2DxlaLXqHpK1hFmzqrzQEWg+9fP0y1Vyuv/oIncWg+t/Y1HrbZfvJBm
 Y96sbiP03fFcZtc1KSuNI7Uo53ojPH4OgmOqtbjaHJPHvjulrlvrJxkf6JAAqE/CK6EYLH
 YlmcWcjNflO5q99ME7v0HtcXW4YtjJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-4hHaveykOKiBznk_-XyHUA-1; Fri, 05 Feb 2021 01:56:37 -0500
X-MC-Unique: 4hHaveykOKiBznk_-XyHUA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CC48801977
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 06:56:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B05862461;
 Fri,  5 Feb 2021 06:56:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 938BC18003AF; Fri,  5 Feb 2021 07:56:20 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/24] spice: delay starting until display are initialized
Date: Fri,  5 Feb 2021 07:56:00 +0100
Message-Id: <20210205065620.1726554-5-kraxel@redhat.com>
In-Reply-To: <20210205065620.1726554-1-kraxel@redhat.com>
References: <20210205065620.1726554-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
Message-Id: <20210129152351.161971-1-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/qemu-spice.h | 1 +
 ui/spice-core.c         | 9 ++++++++-
 ui/spice-display.c      | 2 ++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/ui/qemu-spice.h b/include/ui/qemu-spice.h
index 2beb7929728c..71ecd6cfd106 100644
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
index 514c0f975443..beee932f5546 100644
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
index 0178d5766d2c..3d3e3bcb2246 100644
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
2.29.2



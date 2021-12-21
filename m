Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB4647BB02
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:24:21 +0100 (CET)
Received: from localhost ([::1]:53518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZVU-00057G-0H
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:24:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZA1-0003rm-PA
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:02:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZA0-00021e-39
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:02:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yy7mIZIXs4aytO347LRaT/OfoSNmk0dCfOOTskWgU68=;
 b=fDxXZqaLxjEcAO0WvnVAe2nETmScfFgfqmiGN7qLwySQJ+qxn5oCceFD2Ns1p3UwQE7bjW
 EjGADdunxiik60UpGoUhTP6Gp6KSE548y/6/3rhMR1yS6c4RHpugAc7YO1T5gaqmwSWY7d
 KzoTMgHn5RutBe7pL+jIq4j/ywkiOoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-aKw7BnK-OJKy4qszrlgxig-1; Tue, 21 Dec 2021 02:02:06 -0500
X-MC-Unique: aKw7BnK-OJKy4qszrlgxig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64C82802C92;
 Tue, 21 Dec 2021 07:02:05 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2ED0538E09;
 Tue, 21 Dec 2021 07:01:58 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 10/36] ui: factor out qemu_console_set_display_gl_ctx()
Date: Tue, 21 Dec 2021 10:58:29 +0400
Message-Id: <20211221065855.142578-11-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The next patch will make use of this function to dissociate
DisplayChangeListener from GL context.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/ui/console.h |  3 +++
 ui/console.c         | 22 ++++++++++++++--------
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 65e6bbcab8ae..fb10e6d60cd7 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -411,6 +411,9 @@ void graphic_hw_gl_flushed(QemuConsole *con);
 
 void qemu_console_early_init(void);
 
+void qemu_console_set_display_gl_ctx(QemuConsole *con,
+                                     DisplayChangeListener *dcl);
+
 QemuConsole *qemu_console_lookup_by_index(unsigned int index);
 QemuConsole *qemu_console_lookup_by_device(DeviceState *dev, uint32_t head);
 QemuConsole *qemu_console_lookup_by_device_name(const char *device_id,
diff --git a/ui/console.c b/ui/console.c
index dcc21eb5b244..7b83e6cdea77 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1443,6 +1443,19 @@ static bool dpy_compatible_with(QemuConsole *con,
     return true;
 }
 
+void qemu_console_set_display_gl_ctx(QemuConsole *con,
+                                     DisplayChangeListener *dcl)
+{
+    /* display has opengl support */
+    assert(dcl->con);
+    if (dcl->con->gl) {
+        fprintf(stderr, "can't register two opengl displays (%s, %s)\n",
+                dcl->ops->dpy_name, dcl->con->gl->ops->dpy_name);
+        exit(1);
+    }
+    dcl->con->gl = dcl;
+}
+
 void register_displaychangelistener(DisplayChangeListener *dcl)
 {
     static const char nodev[] =
@@ -1453,14 +1466,7 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
     assert(!dcl->ds);
 
     if (dcl->ops->dpy_gl_ctx_create) {
-        /* display has opengl support */
-        assert(dcl->con);
-        if (dcl->con->gl) {
-            fprintf(stderr, "can't register two opengl displays (%s, %s)\n",
-                    dcl->ops->dpy_name, dcl->con->gl->ops->dpy_name);
-            exit(1);
-        }
-        dcl->con->gl = dcl;
+        qemu_console_set_display_gl_ctx(dcl->con, dcl);
     }
 
     if (dcl->con) {
-- 
2.34.1.8.g35151cf07204



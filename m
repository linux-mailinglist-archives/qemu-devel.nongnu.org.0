Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BB14BA038
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:34:32 +0100 (CET)
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKfzQ-0007Vc-Pz
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:34:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nKfTJ-0008OF-NU
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:01:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nKfTH-0001fJ-Ay
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:01:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645099274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yQ+dWvvRK/WAqV3N1iOJs9kcGEkqiUKSdEo65+Rdm2k=;
 b=Hyqs7F88oOCiVQDlp4MHTZsQIFvE/63xxayybl3AhXOKkC1B48jrEV37njOhEIIRDKzo9v
 dtOrtHAEganOhhVGe/m8T7d2nrJYzNhljv7J/HG9A10VI+GWovWniiI4vEsylX665n/SPg
 XwzuxZSmQB70SQjWVHWsiRP79h7Cntc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-ao7C21CZP-WC7SadAJtx_g-1; Thu, 17 Feb 2022 07:01:11 -0500
X-MC-Unique: ao7C21CZP-WC7SadAJtx_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F2101876545;
 Thu, 17 Feb 2022 12:01:10 +0000 (UTC)
Received: from localhost (unknown [10.39.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 266EB7C0CD;
 Thu, 17 Feb 2022 12:01:08 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/12] ui/dbus: associate the DBusDisplayConsole listener
 with the given console
Date: Thu, 17 Feb 2022 15:58:24 +0400
Message-Id: <20220217115829.2314347-8-marcandre.lureau@redhat.com>
In-Reply-To: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
References: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com, akihiko.odaki@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

DBusDisplayConsole is specific to a given QemuConsole.

Fixes: commit 142ca628 ("ui: add a D-Bus display backend")
Reported-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/dbus.h         |  3 +++
 ui/dbus-console.c | 27 +++++++++++++--------------
 ui/dbus.c         |  2 +-
 3 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/ui/dbus.h b/ui/dbus.h
index 64c77cab4441..5f5c1f759c9b 100644
--- a/ui/dbus.h
+++ b/ui/dbus.h
@@ -79,6 +79,9 @@ dbus_display_console_new(DBusDisplay *display, QemuConsole *con);
 int
 dbus_display_console_get_index(DBusDisplayConsole *ddc);
 
+
+extern const DisplayChangeListenerOps dbus_console_dcl_ops;
+
 #define DBUS_DISPLAY_TYPE_LISTENER dbus_display_listener_get_type()
 G_DECLARE_FINAL_TYPE(DBusDisplayListener,
                      dbus_display_listener,
diff --git a/ui/dbus-console.c b/ui/dbus-console.c
index e062f721d761..898a4ac8a5ba 100644
--- a/ui/dbus-console.c
+++ b/ui/dbus-console.c
@@ -36,7 +36,6 @@ struct _DBusDisplayConsole {
     DisplayChangeListener dcl;
 
     DBusDisplay *display;
-    QemuConsole *con;
     GHashTable *listeners;
     QemuDBusDisplay1Console *iface;
 
@@ -118,7 +117,7 @@ dbus_gl_scanout_update(DisplayChangeListener *dcl,
 {
 }
 
-static const DisplayChangeListenerOps dbus_console_dcl_ops = {
+const DisplayChangeListenerOps dbus_console_dcl_ops = {
     .dpy_name                = "dbus-console",
     .dpy_gfx_switch          = dbus_gfx_switch,
     .dpy_gfx_update          = dbus_gfx_update,
@@ -191,7 +190,7 @@ dbus_console_set_ui_info(DBusDisplayConsole *ddc,
         .height = arg_height,
     };
 
-    if (!dpy_ui_info_supported(ddc->con)) {
+    if (!dpy_ui_info_supported(ddc->dcl.con)) {
         g_dbus_method_invocation_return_error(invocation,
                                               DBUS_DISPLAY_ERROR,
                                               DBUS_DISPLAY_ERROR_UNSUPPORTED,
@@ -199,7 +198,7 @@ dbus_console_set_ui_info(DBusDisplayConsole *ddc,
         return DBUS_METHOD_INVOCATION_HANDLED;
     }
 
-    dpy_set_ui_info(ddc->con, &info, false);
+    dpy_set_ui_info(ddc->dcl.con, &info, false);
     qemu_dbus_display1_console_complete_set_uiinfo(ddc->iface, invocation);
     return DBUS_METHOD_INVOCATION_HANDLED;
 }
@@ -335,8 +334,8 @@ dbus_mouse_rel_motion(DBusDisplayConsole *ddc,
         return DBUS_METHOD_INVOCATION_HANDLED;
     }
 
-    qemu_input_queue_rel(ddc->con, INPUT_AXIS_X, dx);
-    qemu_input_queue_rel(ddc->con, INPUT_AXIS_Y, dy);
+    qemu_input_queue_rel(ddc->dcl.con, INPUT_AXIS_X, dx);
+    qemu_input_queue_rel(ddc->dcl.con, INPUT_AXIS_Y, dy);
     qemu_input_event_sync();
 
     qemu_dbus_display1_mouse_complete_rel_motion(ddc->iface_mouse,
@@ -362,8 +361,8 @@ dbus_mouse_set_pos(DBusDisplayConsole *ddc,
         return DBUS_METHOD_INVOCATION_HANDLED;
     }
 
-    width = qemu_console_get_width(ddc->con, 0);
-    height = qemu_console_get_height(ddc->con, 0);
+    width = qemu_console_get_width(ddc->dcl.con, 0);
+    height = qemu_console_get_height(ddc->dcl.con, 0);
     if (x >= width || y >= height) {
         g_dbus_method_invocation_return_error(
             invocation, DBUS_DISPLAY_ERROR,
@@ -371,8 +370,8 @@ dbus_mouse_set_pos(DBusDisplayConsole *ddc,
             "Invalid mouse position");
         return DBUS_METHOD_INVOCATION_HANDLED;
     }
-    qemu_input_queue_abs(ddc->con, INPUT_AXIS_X, x, 0, width);
-    qemu_input_queue_abs(ddc->con, INPUT_AXIS_Y, y, 0, height);
+    qemu_input_queue_abs(ddc->dcl.con, INPUT_AXIS_X, x, 0, width);
+    qemu_input_queue_abs(ddc->dcl.con, INPUT_AXIS_Y, y, 0, height);
     qemu_input_event_sync();
 
     qemu_dbus_display1_mouse_complete_set_abs_position(ddc->iface_mouse,
@@ -388,7 +387,7 @@ dbus_mouse_press(DBusDisplayConsole *ddc,
 {
     trace_dbus_mouse_press(button);
 
-    qemu_input_queue_btn(ddc->con, button, true);
+    qemu_input_queue_btn(ddc->dcl.con, button, true);
     qemu_input_event_sync();
 
     qemu_dbus_display1_mouse_complete_press(ddc->iface_mouse, invocation);
@@ -403,7 +402,7 @@ dbus_mouse_release(DBusDisplayConsole *ddc,
 {
     trace_dbus_mouse_release(button);
 
-    qemu_input_queue_btn(ddc->con, button, false);
+    qemu_input_queue_btn(ddc->dcl.con, button, false);
     qemu_input_event_sync();
 
     qemu_dbus_display1_mouse_complete_release(ddc->iface_mouse, invocation);
@@ -424,7 +423,7 @@ dbus_mouse_mode_change(Notifier *notify, void *data)
 
 int dbus_display_console_get_index(DBusDisplayConsole *ddc)
 {
-    return qemu_console_get_index(ddc->con);
+    return qemu_console_get_index(ddc->dcl.con);
 }
 
 DBusDisplayConsole *
@@ -446,7 +445,7 @@ dbus_display_console_new(DBusDisplay *display, QemuConsole *con)
                         "g-object-path", path,
                         NULL);
     ddc->display = display;
-    ddc->con = con;
+    ddc->dcl.con = con;
     /* handle errors, and skip non graphics? */
     qemu_console_fill_device_address(
         con, device_addr, sizeof(device_addr), NULL);
diff --git a/ui/dbus.c b/ui/dbus.c
index f00a44421cf7..22c82d2f323a 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -52,7 +52,7 @@ static bool
 dbus_is_compatible_dcl(DisplayGLCtx *dgc,
                        DisplayChangeListener *dcl)
 {
-    return dcl->ops == &dbus_gl_dcl_ops;
+    return dcl->ops == &dbus_gl_dcl_ops || dcl->ops == &dbus_console_dcl_ops;
 }
 
 static const DisplayGLCtxOps dbus_gl_ops = {
-- 
2.34.1.428.gdcc0cd074f0c



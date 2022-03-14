Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 622374D85BB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:09:54 +0100 (CET)
Received: from localhost ([::1]:47582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTkSP-0002tl-G8
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:09:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nTkJ5-0004J5-Il
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:00:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nTkJ3-0002vy-M8
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647262812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VTLNQ2w+rMItS2fOJeJOBwWN+fp7niRU59e/o1Jngm4=;
 b=CqLuH7NHhBc4xR28Tc06ojMzKyHgWvmkHr1QSd7A2py/CKbryhOHtFVaIp1hOuqGHu2g5R
 1w/vTscyvH370UsDQTXf4pZWSjPlbF3JX4znXO8ty9HCkpcy/MTVizaMFJZY47Lx07cTj7
 yOR0ZfrqftdMJ6+LLemWMttyqcnKHa8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-hnf9Dvj_Mxq8MBwBVZiUBQ-1; Mon, 14 Mar 2022 09:00:09 -0400
X-MC-Unique: hnf9Dvj_Mxq8MBwBVZiUBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADFB818A6585;
 Mon, 14 Mar 2022 13:00:08 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B677407EE73;
 Mon, 14 Mar 2022 13:00:07 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 04/12] ui/dbus: associate the DBusDisplayConsole listener with
 the given console
Date: Mon, 14 Mar 2022 16:59:32 +0400
Message-Id: <20220314125940.1866728-5-marcandre.lureau@redhat.com>
In-Reply-To: <20220314125940.1866728-1-marcandre.lureau@redhat.com>
References: <20220314125940.1866728-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

DBusDisplayConsole is specific to a given QemuConsole.

Fixes: commit 142ca628 ("ui: add a D-Bus display backend")
Reported-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
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
2.35.1.273.ge6ebfd0e8cbb



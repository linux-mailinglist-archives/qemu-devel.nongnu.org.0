Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2BF5FEDB2
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 13:58:36 +0200 (CEST)
Received: from localhost ([::1]:52758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojJKk-0000hp-21
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 07:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ojJGq-0005Tc-BZ
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:54:32 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ojJGl-0005Sp-QI
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:54:30 -0400
Received: by mail-pg1-x52b.google.com with SMTP id l6so4110350pgu.7
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 04:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NJTKYhXP6KQqPLql89oAik8xVrKAW3B3ZIjX6e1DLWs=;
 b=Bbj3QbdwLFkenW+5KJRmSfQyrj1XY0SQxh5Fq8HPiNMHMfrOI5mPJaJyExtoLio202
 GEaIh1zG6xcCQKwKtnx/o0V6EeHKMct2uESGLdY04XGIqFqSdnl/peRVIBiMpmAqZe+M
 0A5CkEe0M+SY/zXV/CC4Z2+5+VchzmQxWrab+z5eYvJgJQXjZlx1bvLA4o7n1i6h2hVp
 lc84N7mOgQgoaNsC0uhT5eelMa6DmWajfmUn8FArFGAw892LLTOYA34LJc5CZCYjtOdw
 WIAVCKcFHJlIe8NxWQ8aIqtWeR7zgaWmlKnzLMEZdIiHBnfAeosTN+0O35NJMD70dVuk
 QWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NJTKYhXP6KQqPLql89oAik8xVrKAW3B3ZIjX6e1DLWs=;
 b=1HdfcSH8J5BrdoezCeInVrx/cO0fdilLpBqVXQXcv4/HCfNWiB3OFWXvMiTAQGk2ZR
 W1DqojL4N9hEF5bqgnKc685LpbrV6uh4zgKmcDDmmTwahn+lc84FdpxYfWETdRYxAhmu
 lnoZhBzygbUQ7m5c4EMXljfYgcBbpe+FmsiA43YEnaBQQWbSfs4piQzQKgFIopTDk7nz
 H7koF5nyIaLlDuD7C9pT+RKuM+KclcRgtoug/0bifnsBVUu23vmxSHPXF83QvaCemjxI
 XjL5MT+SFDdU5dCjWJCzPanFVXCfL/WfzjhGNAT3igkKYTie0ZcJxIBncB6ea4u6K1yn
 cq0A==
X-Gm-Message-State: ACrzQf0dfvIzdhz+MotIOsdu+4ToVPePoG7WHB3sU5XSMPnX3tVp3235
 DsQhlrBRVLXz1oelkxfUr9S/kLCDybd1dWKU
X-Google-Smtp-Source: AMsMyM5SpvcxLzjfHfnH2pHi+6x81/bt5ZHy/EYdyW0okDmYs34un5ye1heOmhIpVBz2oADPBwtQyQ==
X-Received: by 2002:a05:6a00:1145:b0:52b:78c:fa26 with SMTP id
 b5-20020a056a00114500b0052b078cfa26mr5027309pfm.27.1665748464359; 
 Fri, 14 Oct 2022 04:54:24 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a170903244300b00174f7d107c8sm1555065pls.293.2022.10.14.04.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 04:54:23 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] input: Allow to choose console with qemu_input_is_absolute
Date: Fri, 14 Oct 2022 20:54:16 +0900
Message-Id: <20221014115416.63819-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Although an input is routed depending on the console,
qemu_input_is_absolute() had no mechanism to specify the console.

Accept QemuConsole as an argument for qemu_input_is_absolute, and let
the display know the absolute/relative state for a particular console.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/ui/input.h |  2 +-
 ui/cocoa.m         |  2 +-
 ui/dbus-console.c  |  6 +++---
 ui/gtk.c           | 12 ++++++------
 ui/input.c         | 29 +++++++----------------------
 ui/sdl2.c          | 26 +++++++++++++-------------
 ui/spice-input.c   |  2 +-
 ui/trace-events    |  1 -
 ui/vnc.c           |  2 +-
 9 files changed, 33 insertions(+), 49 deletions(-)

diff --git a/include/ui/input.h b/include/ui/input.h
index c86219a1c1..ed081c95fe 100644
--- a/include/ui/input.h
+++ b/include/ui/input.h
@@ -54,7 +54,7 @@ void qemu_input_queue_btn(QemuConsole *src, InputButton btn, bool down);
 void qemu_input_update_buttons(QemuConsole *src, uint32_t *button_map,
                                uint32_t button_old, uint32_t button_new);
 
-bool qemu_input_is_absolute(void);
+bool qemu_input_is_absolute(QemuConsole *con);
 int qemu_input_scale_axis(int value,
                           int min_in, int max_in,
                           int min_out, int max_out);
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 660d3e0935..8836bdc801 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1993,7 +1993,7 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
     COCOA_DEBUG("qemu_cocoa: cocoa_refresh\n");
     graphic_hw_update(NULL);
 
-    if (qemu_input_is_absolute()) {
+    if (qemu_input_is_absolute(dcl->con)) {
         dispatch_async(dispatch_get_main_queue(), ^{
             if (![cocoaView isAbsoluteEnabled]) {
                 if ([cocoaView isMouseGrabbed]) {
diff --git a/ui/dbus-console.c b/ui/dbus-console.c
index 898a4ac8a5..a943a60e63 100644
--- a/ui/dbus-console.c
+++ b/ui/dbus-console.c
@@ -326,7 +326,7 @@ dbus_mouse_rel_motion(DBusDisplayConsole *ddc,
 {
     trace_dbus_mouse_rel_motion(dx, dy);
 
-    if (qemu_input_is_absolute()) {
+    if (qemu_input_is_absolute(ddc->dcl.con)) {
         g_dbus_method_invocation_return_error(
             invocation, DBUS_DISPLAY_ERROR,
             DBUS_DISPLAY_ERROR_INVALID,
@@ -353,7 +353,7 @@ dbus_mouse_set_pos(DBusDisplayConsole *ddc,
 
     trace_dbus_mouse_set_pos(x, y);
 
-    if (!qemu_input_is_absolute()) {
+    if (!qemu_input_is_absolute(ddc->dcl.con)) {
         g_dbus_method_invocation_return_error(
             invocation, DBUS_DISPLAY_ERROR,
             DBUS_DISPLAY_ERROR_INVALID,
@@ -417,7 +417,7 @@ dbus_mouse_mode_change(Notifier *notify, void *data)
         container_of(notify, DBusDisplayConsole, mouse_mode_notifier);
 
     g_object_set(ddc->iface_mouse,
-                 "is-absolute", qemu_input_is_absolute(),
+                 "is-absolute", qemu_input_is_absolute(ddc->dcl.con),
                  NULL);
 }
 
diff --git a/ui/gtk.c b/ui/gtk.c
index 92daaa6a6e..42744c601d 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -202,7 +202,7 @@ static void gd_update_cursor(VirtualConsole *vc)
     }
 
     window = gtk_widget_get_window(GTK_WIDGET(vc->gfx.drawing_area));
-    if (s->full_screen || qemu_input_is_absolute() || s->ptr_owner == vc) {
+    if (s->full_screen || qemu_input_is_absolute(vc->gfx.dcl.con) || s->ptr_owner == vc) {
         gdk_window_set_cursor(window, s->null_cursor);
     } else {
         gdk_window_set_cursor(window, NULL);
@@ -450,7 +450,7 @@ static void gd_mouse_set(DisplayChangeListener *dcl,
     GdkDisplay *dpy;
     gint x_root, y_root;
 
-    if (qemu_input_is_absolute()) {
+    if (qemu_input_is_absolute(dcl->con)) {
         return;
     }
 
@@ -681,7 +681,7 @@ static void gd_mouse_mode_change(Notifier *notify, void *data)
 
     s = container_of(notify, GtkDisplayState, mouse_mode_notifier);
     /* release the grab at switching to absolute mode */
-    if (qemu_input_is_absolute() && s->ptr_owner) {
+    if (s->ptr_owner && qemu_input_is_absolute(s->ptr_owner->gfx.dcl.con)) {
         if (!s->ptr_owner->window) {
             gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(s->grab_item),
                                            FALSE);
@@ -897,7 +897,7 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
     x = (motion->x - mx) / vc->gfx.scale_x * ws;
     y = (motion->y - my) / vc->gfx.scale_y * ws;
 
-    if (qemu_input_is_absolute()) {
+    if (qemu_input_is_absolute(vc->gfx.dcl.con)) {
         if (x < 0 || y < 0 ||
             x >= surface_width(vc->gfx.ds) ||
             y >= surface_height(vc->gfx.ds)) {
@@ -917,7 +917,7 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
     s->last_y = y;
     s->last_set = TRUE;
 
-    if (!qemu_input_is_absolute() && s->ptr_owner == vc) {
+    if (!qemu_input_is_absolute(vc->gfx.dcl.con) && s->ptr_owner == vc) {
         GdkScreen *screen = gtk_widget_get_screen(vc->gfx.drawing_area);
         GdkDisplay *dpy = gtk_widget_get_display(widget);
         GdkWindow *win = gtk_widget_get_window(widget);
@@ -959,7 +959,7 @@ static gboolean gd_button_event(GtkWidget *widget, GdkEventButton *button,
 
     /* implicitly grab the input at the first click in the relative mode */
     if (button->button == 1 && button->type == GDK_BUTTON_PRESS &&
-        !qemu_input_is_absolute() && s->ptr_owner != vc) {
+        !qemu_input_is_absolute(vc->gfx.dcl.con) && s->ptr_owner != vc) {
         if (!vc->window) {
             gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(s->grab_item),
                                            TRUE);
diff --git a/ui/input.c b/ui/input.c
index e2a90af889..491e8f2ffb 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -58,7 +58,7 @@ QemuInputHandlerState *qemu_input_handler_register(DeviceState *dev,
     s->id = id++;
     QTAILQ_INSERT_TAIL(&handlers, s, node);
 
-    qemu_input_check_mode_change();
+    notifier_list_notify(&mouse_mode_notifiers, NULL);
     return s;
 }
 
@@ -66,21 +66,21 @@ void qemu_input_handler_activate(QemuInputHandlerState *s)
 {
     QTAILQ_REMOVE(&handlers, s, node);
     QTAILQ_INSERT_HEAD(&handlers, s, node);
-    qemu_input_check_mode_change();
+    notifier_list_notify(&mouse_mode_notifiers, NULL);
 }
 
 void qemu_input_handler_deactivate(QemuInputHandlerState *s)
 {
     QTAILQ_REMOVE(&handlers, s, node);
     QTAILQ_INSERT_TAIL(&handlers, s, node);
-    qemu_input_check_mode_change();
+    notifier_list_notify(&mouse_mode_notifiers, NULL);
 }
 
 void qemu_input_handler_unregister(QemuInputHandlerState *s)
 {
     QTAILQ_REMOVE(&handlers, s, node);
     g_free(s);
-    qemu_input_check_mode_change();
+    notifier_list_notify(&mouse_mode_notifiers, NULL);
 }
 
 void qemu_input_handler_bind(QemuInputHandlerState *s,
@@ -490,12 +490,12 @@ void qemu_input_update_buttons(QemuConsole *src, uint32_t *button_map,
     }
 }
 
-bool qemu_input_is_absolute(void)
+bool qemu_input_is_absolute(QemuConsole *con)
 {
     QemuInputHandlerState *s;
 
     s = qemu_input_find_handler(INPUT_EVENT_MASK_REL | INPUT_EVENT_MASK_ABS,
-                                NULL);
+                                con);
     return (s != NULL) && (s->handler->mask & INPUT_EVENT_MASK_ABS);
 }
 
@@ -543,21 +543,6 @@ void qemu_input_queue_abs(QemuConsole *src, InputAxis axis, int value,
     qemu_input_event_send(src, &evt);
 }
 
-void qemu_input_check_mode_change(void)
-{
-    static int current_is_absolute;
-    int is_absolute;
-
-    is_absolute = qemu_input_is_absolute();
-
-    if (is_absolute != current_is_absolute) {
-        trace_input_mouse_mode(is_absolute);
-        notifier_list_notify(&mouse_mode_notifiers, NULL);
-    }
-
-    current_is_absolute = is_absolute;
-}
-
 void qemu_add_mouse_mode_change_notifier(Notifier *notify)
 {
     notifier_list_add(&mouse_mode_notifiers, notify);
@@ -618,5 +603,5 @@ void hmp_mouse_set(Monitor *mon, const QDict *qdict)
         error_report("Mouse at index '%d' not found", index);
     }
 
-    qemu_input_check_mode_change();
+    notifier_list_notify(&mouse_mode_notifiers, NULL);
 }
diff --git a/ui/sdl2.c b/ui/sdl2.c
index 8cb77416af..6644cbca1c 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -181,7 +181,7 @@ static void sdl_hide_cursor(struct sdl2_console *scon)
     SDL_ShowCursor(SDL_DISABLE);
     SDL_SetCursor(sdl_cursor_hidden);
 
-    if (!qemu_input_is_absolute()) {
+    if (!qemu_input_is_absolute(scon->dcl.con)) {
         SDL_SetRelativeMouseMode(SDL_TRUE);
     }
 }
@@ -192,12 +192,12 @@ static void sdl_show_cursor(struct sdl2_console *scon)
         return;
     }
 
-    if (!qemu_input_is_absolute()) {
+    if (!qemu_input_is_absolute(scon->dcl.con)) {
         SDL_SetRelativeMouseMode(SDL_FALSE);
     }
 
     if (guest_cursor &&
-        (gui_grab || qemu_input_is_absolute() || absolute_enabled)) {
+        (gui_grab || qemu_input_is_absolute(scon->dcl.con) || absolute_enabled)) {
         SDL_SetCursor(guest_sprite);
     } else {
         SDL_SetCursor(sdl_cursor_normal);
@@ -223,7 +223,7 @@ static void sdl_grab_start(struct sdl2_console *scon)
     }
     if (guest_cursor) {
         SDL_SetCursor(guest_sprite);
-        if (!qemu_input_is_absolute() && !absolute_enabled) {
+        if (!qemu_input_is_absolute(scon->dcl.con) && !absolute_enabled) {
             SDL_WarpMouseInWindow(scon->real_window, guest_x, guest_y);
         }
     } else {
@@ -258,7 +258,7 @@ static void absolute_mouse_grab(struct sdl2_console *scon)
 
 static void sdl_mouse_mode_change(Notifier *notify, void *data)
 {
-    if (qemu_input_is_absolute()) {
+    if (qemu_input_is_absolute(sdl2_console[0].dcl.con)) {
         if (!absolute_enabled) {
             absolute_enabled = 1;
             SDL_SetRelativeMouseMode(SDL_FALSE);
@@ -289,7 +289,7 @@ static void sdl_send_mouse_event(struct sdl2_console *scon, int dx, int dy,
         prev_state = state;
     }
 
-    if (qemu_input_is_absolute()) {
+    if (qemu_input_is_absolute(scon->dcl.con)) {
         qemu_input_queue_abs(scon->dcl.con, INPUT_AXIS_X,
                              x, 0, surface_width(scon->surface));
         qemu_input_queue_abs(scon->dcl.con, INPUT_AXIS_Y,
@@ -476,7 +476,7 @@ static void handle_mousemotion(SDL_Event *ev)
         return;
     }
 
-    if (qemu_input_is_absolute() || absolute_enabled) {
+    if (qemu_input_is_absolute(scon->dcl.con) || absolute_enabled) {
         int scr_w, scr_h;
         SDL_GetWindowSize(scon->real_window, &scr_w, &scr_h);
         max_x = scr_w - 1;
@@ -492,7 +492,7 @@ static void handle_mousemotion(SDL_Event *ev)
             sdl_grab_start(scon);
         }
     }
-    if (gui_grab || qemu_input_is_absolute() || absolute_enabled) {
+    if (gui_grab || qemu_input_is_absolute(scon->dcl.con) || absolute_enabled) {
         sdl_send_mouse_event(scon, ev->motion.xrel, ev->motion.yrel,
                              ev->motion.x, ev->motion.y, ev->motion.state);
     }
@@ -509,7 +509,7 @@ static void handle_mousebutton(SDL_Event *ev)
     }
 
     bev = &ev->button;
-    if (!gui_grab && !qemu_input_is_absolute()) {
+    if (!gui_grab && !qemu_input_is_absolute(scon->dcl.con)) {
         if (ev->type == SDL_MOUSEBUTTONUP && bev->button == SDL_BUTTON_LEFT) {
             /* start grabbing all events */
             sdl_grab_start(scon);
@@ -582,7 +582,7 @@ static void handle_windowevent(SDL_Event *ev)
         }
         /* fall through */
     case SDL_WINDOWEVENT_ENTER:
-        if (!gui_grab && (qemu_input_is_absolute() || absolute_enabled)) {
+        if (!gui_grab && (qemu_input_is_absolute(scon->dcl.con) || absolute_enabled)) {
             absolute_mouse_grab(scon);
         }
         /* If a new console window opened using a hotkey receives the
@@ -712,9 +712,9 @@ static void sdl_mouse_warp(DisplayChangeListener *dcl,
         if (!guest_cursor) {
             sdl_show_cursor(scon);
         }
-        if (gui_grab || qemu_input_is_absolute() || absolute_enabled) {
+        if (gui_grab || qemu_input_is_absolute(scon->dcl.con) || absolute_enabled) {
             SDL_SetCursor(guest_sprite);
-            if (!qemu_input_is_absolute() && !absolute_enabled) {
+            if (!qemu_input_is_absolute(scon->dcl.con) && !absolute_enabled) {
                 SDL_WarpMouseInWindow(scon->real_window, x, y);
             }
         }
@@ -752,7 +752,7 @@ static void sdl_mouse_define(DisplayChangeListener *dcl,
         return;
     }
     if (guest_cursor &&
-        (gui_grab || qemu_input_is_absolute() || absolute_enabled)) {
+        (gui_grab || qemu_input_is_absolute(dcl->con) || absolute_enabled)) {
         SDL_SetCursor(guest_sprite);
     }
 }
diff --git a/ui/spice-input.c b/ui/spice-input.c
index bbd502564e..a5c5d78474 100644
--- a/ui/spice-input.c
+++ b/ui/spice-input.c
@@ -224,7 +224,7 @@ static const SpiceTabletInterface tablet_interface = {
 static void mouse_mode_notifier(Notifier *notifier, void *data)
 {
     QemuSpicePointer *pointer = container_of(notifier, QemuSpicePointer, mouse_mode);
-    bool is_absolute  = qemu_input_is_absolute();
+    bool is_absolute  = qemu_input_is_absolute(NULL);
 
     if (pointer->absolute == is_absolute) {
         return;
diff --git a/ui/trace-events b/ui/trace-events
index 977577fbba..8c727519e8 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -91,7 +91,6 @@ input_event_btn(int conidx, const char *btn, bool down) "con %d, button %s, down
 input_event_rel(int conidx, const char *axis, int value) "con %d, axis %s, value %d"
 input_event_abs(int conidx, const char *axis, int value) "con %d, axis %s, value 0x%x"
 input_event_sync(void) ""
-input_mouse_mode(int absolute) "absolute %d"
 
 # sdl2-input.c
 sdl2_process_key(int sdl_scancode, int qcode, const char *action) "translated SDL scancode %d to QKeyCode %d (%s)"
diff --git a/ui/vnc.c b/ui/vnc.c
index acb3629cd8..d7c3f82dca 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -1785,7 +1785,7 @@ uint32_t read_u32(uint8_t *data, size_t offset)
 static void check_pointer_type_change(Notifier *notifier, void *data)
 {
     VncState *vs = container_of(notifier, VncState, mouse_mode_notifier);
-    int absolute = qemu_input_is_absolute();
+    int absolute = qemu_input_is_absolute(vs->vd->dcl.con);
 
     if (vnc_has_feature(vs, VNC_FEATURE_POINTER_TYPE_CHANGE) && vs->absolute != absolute) {
         vnc_lock_output(vs);
-- 
2.37.3



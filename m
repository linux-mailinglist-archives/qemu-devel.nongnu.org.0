Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7804B38FB
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 03:45:23 +0100 (CET)
Received: from localhost ([::1]:59212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJ4t8-0006kW-3q
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 21:45:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4qc-00042f-EY
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:42:46 -0500
Received: from [2607:f8b0:4864:20::42b] (port=35402
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4qZ-0000Oh-9f
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:42:45 -0500
Received: by mail-pf1-x42b.google.com with SMTP id l19so17362328pfu.2
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 18:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Oo+7YkdGjZIOZ1b0IjVuhZUDl1Vixbs3EROq+q1xqw=;
 b=Fr9swWKOPkq7Sb5GT2PpQyFs8mA5tV6uLlCXJOV0lgr2F2/vuf334GlfjgtbFtLRsF
 HwkFBUKXlkv8NI+5IPRbLHZryN93g6sXf110jkzM6Q236OiIAm7v0FFJCLVql0GQVJkL
 Z7oOmnu6w4v9IJJpG32QQ/JGy7mRePTrlYPgzhdkdj+6Dr8ldrU3yQko73riIDHmGKQz
 R2dgWpf479KrVFvWFwxNV9kiHb7Aagj1vKvFMVhObNm791N0gTKdwUz0DwmUqiH1AwLP
 NISMWSLXF116RjV2QV0euA9EVh4AHRqLs8jiwgCIbO2FzYnRVxxkXEpHUHnPCLKPDpZJ
 vlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Oo+7YkdGjZIOZ1b0IjVuhZUDl1Vixbs3EROq+q1xqw=;
 b=l0BQJbEQaU/vc7IrDunNF5HSyRA80jb/N1yo8MmWHZ/RYDDruR0WfzwOwYikfu5T4Z
 lswbPynQY4DUCKJQhA5TMjNWUiqPvhCWnv0V0OMXxDfhCAo3axLrYATLBF5TGJbZxiAg
 L4gM+TKawi6vbxQASi3RMVl/l/dMisLBv5BUHzU3IOSCZdWe0K+bMECvMiBWZJM3E9Ot
 vctQ2eDGSg6k9MJw6aI+Tz5HJ4OJHVwP+LerplH+bYLuRy/9NI6LOeJgqUEjeKV4hoZQ
 tT8PxHLwJPFkdgwnb3D0mfaL/NStiTDPCH1uTKTJf7QLaq9RTz+YkguexAHTGmI0bcaC
 fjgQ==
X-Gm-Message-State: AOAM533OEqTezG9bP0dD7d9q0gGPXC6MnFLncgL+kqMuUNUVmuFjzUrJ
 DVF9i4Toka2SxpOjERZTD6EUVOvO4tE=
X-Google-Smtp-Source: ABdhPJyDwvrB3atUheKG7hPsP/86bFiqNSn2dQEXk7til0e2Zop7PcSCSxdd5UjQIsOGyC+hty9E+A==
X-Received: by 2002:a05:6a02:19b:: with SMTP id
 bj27mr371161pgb.574.1644720161360; 
 Sat, 12 Feb 2022 18:42:41 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d85b:35dd:dae2:b7a9])
 by smtp.gmail.com with ESMTPSA id l11sm9128954pjm.23.2022.02.12.18.42.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 12 Feb 2022 18:42:41 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 1/6] ui/dbus: Share one listener for a console
Date: Sun, 13 Feb 2022 11:42:17 +0900
Message-Id: <20220213024222.3548-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220213024222.3548-1-akihiko.odaki@gmail.com>
References: <20220213024222.3548-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes surface texture double free with multiple connections and
out-of-sync display size with multiple displays.

This also reduces resource usage a little and allows to remove code to
support multiple listeners for OpenGL displays.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/dbus-console.c  | 109 +++---------
 ui/dbus-listener.c | 401 +++++++++++++++++++++++++++++++++------------
 ui/dbus.h          |  32 +++-
 3 files changed, 344 insertions(+), 198 deletions(-)

diff --git a/ui/dbus-console.c b/ui/dbus-console.c
index e062f721d76..ec035c427db 100644
--- a/ui/dbus-console.c
+++ b/ui/dbus-console.c
@@ -33,11 +33,10 @@
 
 struct _DBusDisplayConsole {
     GDBusObjectSkeleton parent_instance;
-    DisplayChangeListener dcl;
 
     DBusDisplay *display;
     QemuConsole *con;
-    GHashTable *listeners;
+    DBusDisplayListener *listener;
     QemuDBusDisplay1Console *iface;
 
     QemuDBusDisplay1Keyboard *iface_kbd;
@@ -54,7 +53,7 @@ G_DEFINE_TYPE(DBusDisplayConsole,
               dbus_display_console,
               G_TYPE_DBUS_OBJECT_SKELETON)
 
-static void
+void
 dbus_display_console_set_size(DBusDisplayConsole *ddc,
                               uint32_t width, uint32_t height)
 {
@@ -64,78 +63,9 @@ dbus_display_console_set_size(DBusDisplayConsole *ddc,
                  NULL);
 }
 
-static void
-dbus_gfx_switch(DisplayChangeListener *dcl,
-                struct DisplaySurface *new_surface)
-{
-    DBusDisplayConsole *ddc = container_of(dcl, DBusDisplayConsole, dcl);
-
-    dbus_display_console_set_size(ddc,
-                                  surface_width(new_surface),
-                                  surface_height(new_surface));
-}
-
-static void
-dbus_gfx_update(DisplayChangeListener *dcl,
-                int x, int y, int w, int h)
-{
-}
-
-static void
-dbus_gl_scanout_disable(DisplayChangeListener *dcl)
-{
-}
-
-static void
-dbus_gl_scanout_texture(DisplayChangeListener *dcl,
-                        uint32_t tex_id,
-                        bool backing_y_0_top,
-                        uint32_t backing_width,
-                        uint32_t backing_height,
-                        uint32_t x, uint32_t y,
-                        uint32_t w, uint32_t h)
-{
-    DBusDisplayConsole *ddc = container_of(dcl, DBusDisplayConsole, dcl);
-
-    dbus_display_console_set_size(ddc, w, h);
-}
-
-static void
-dbus_gl_scanout_dmabuf(DisplayChangeListener *dcl,
-                       QemuDmaBuf *dmabuf)
-{
-    DBusDisplayConsole *ddc = container_of(dcl, DBusDisplayConsole, dcl);
-
-    dbus_display_console_set_size(ddc,
-                                  dmabuf->width,
-                                  dmabuf->height);
-}
-
-static void
-dbus_gl_scanout_update(DisplayChangeListener *dcl,
-                       uint32_t x, uint32_t y,
-                       uint32_t w, uint32_t h)
-{
-}
-
-static const DisplayChangeListenerOps dbus_console_dcl_ops = {
-    .dpy_name                = "dbus-console",
-    .dpy_gfx_switch          = dbus_gfx_switch,
-    .dpy_gfx_update          = dbus_gfx_update,
-    .dpy_gl_scanout_disable  = dbus_gl_scanout_disable,
-    .dpy_gl_scanout_texture  = dbus_gl_scanout_texture,
-    .dpy_gl_scanout_dmabuf   = dbus_gl_scanout_dmabuf,
-    .dpy_gl_update           = dbus_gl_scanout_update,
-};
-
 static void
 dbus_display_console_init(DBusDisplayConsole *object)
 {
-    DBusDisplayConsole *ddc = DBUS_DISPLAY_CONSOLE(object);
-
-    ddc->listeners = g_hash_table_new_full(g_str_hash, g_str_equal,
-                                            NULL, g_object_unref);
-    ddc->dcl.ops = &dbus_console_dcl_ops;
 }
 
 static void
@@ -143,10 +73,10 @@ dbus_display_console_dispose(GObject *object)
 {
     DBusDisplayConsole *ddc = DBUS_DISPLAY_CONSOLE(object);
 
-    unregister_displaychangelistener(&ddc->dcl);
     g_clear_object(&ddc->iface_kbd);
     g_clear_object(&ddc->iface);
-    g_clear_pointer(&ddc->listeners, g_hash_table_unref);
+    dbus_display_listener_unref_all_connections(ddc->listener);
+    g_clear_object(&ddc->listener);
     g_clear_pointer(&ddc->kbd, qkbd_state_free);
 
     G_OBJECT_CLASS(dbus_display_console_parent_class)->dispose(object);
@@ -161,14 +91,14 @@ dbus_display_console_class_init(DBusDisplayConsoleClass *klass)
 }
 
 static void
-listener_vanished_cb(DBusDisplayListener *listener)
+listener_vanished_cb(DBusDisplayListenerConnection *ddlc)
 {
-    DBusDisplayConsole *ddc = dbus_display_listener_get_console(listener);
-    const char *name = dbus_display_listener_get_bus_name(listener);
+    DBusDisplayConsole *ddc = dbus_display_listener_connection_get_console(ddlc);
+    const char *name = dbus_display_listener_connection_get_bus_name(ddlc);
 
     trace_dbus_listener_vanished(name);
 
-    g_hash_table_remove(ddc->listeners, name);
+    g_object_unref(ddlc);
     qkbd_state_lift_all_keys(ddc->kbd);
 }
 
@@ -211,15 +141,15 @@ dbus_console_register_listener(DBusDisplayConsole *ddc,
                                GVariant *arg_listener)
 {
     const char *sender = g_dbus_method_invocation_get_sender(invocation);
-    GDBusConnection *listener_conn;
+    GDBusConnection *conn;
     g_autoptr(GError) err = NULL;
     g_autoptr(GSocket) socket = NULL;
     g_autoptr(GSocketConnection) socket_conn = NULL;
     g_autofree char *guid = g_dbus_generate_guid();
-    DBusDisplayListener *listener;
+    DBusDisplayListenerConnection *listener_conn;
     int fd;
 
-    if (sender && g_hash_table_contains(ddc->listeners, sender)) {
+    if (sender && dbus_display_listener_has_connection(ddc->listener, sender)) {
         g_dbus_method_invocation_return_error(
             invocation,
             DBUS_DISPLAY_ERROR,
@@ -254,7 +184,7 @@ dbus_console_register_listener(DBusDisplayConsole *ddc,
     qemu_dbus_display1_console_complete_register_listener(
         ddc->iface, invocation, NULL);
 
-    listener_conn = g_dbus_connection_new_sync(
+    conn = g_dbus_connection_new_sync(
         G_IO_STREAM(socket_conn),
         guid,
         G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER,
@@ -264,16 +194,15 @@ dbus_console_register_listener(DBusDisplayConsole *ddc,
         return DBUS_METHOD_INVOCATION_HANDLED;
     }
 
-    listener = dbus_display_listener_new(sender, listener_conn, ddc);
-    if (!listener) {
+    listener_conn = dbus_display_listener_add_connection(ddc->listener,
+                                                         sender, conn);
+    if (!listener_conn) {
         return DBUS_METHOD_INVOCATION_HANDLED;
     }
 
-    g_hash_table_insert(ddc->listeners,
-                        (gpointer)dbus_display_listener_get_bus_name(listener),
-                        listener);
-    g_object_connect(listener_conn,
-                     "swapped-signal::closed", listener_vanished_cb, listener,
+    g_object_connect(conn,
+                     "swapped-signal::closed", listener_vanished_cb,
+                     listener_conn,
                      NULL);
 
     trace_dbus_registered_listener(sender);
@@ -489,7 +418,7 @@ dbus_display_console_new(DBusDisplay *display, QemuConsole *con)
     g_dbus_object_skeleton_add_interface(G_DBUS_OBJECT_SKELETON(ddc),
         G_DBUS_INTERFACE_SKELETON(ddc->iface_mouse));
 
-    register_displaychangelistener(&ddc->dcl);
+    ddc->listener = dbus_display_listener_new(ddc);
     ddc->mouse_mode_notifier.notify = dbus_mouse_mode_change;
     qemu_add_mouse_mode_change_notifier(&ddc->mouse_mode_notifier);
 
diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
index 81c119b13a2..e4242d69de2 100644
--- a/ui/dbus-listener.c
+++ b/ui/dbus-listener.c
@@ -31,18 +31,36 @@
 #include "ui/egl-context.h"
 #include "trace.h"
 
-struct _DBusDisplayListener {
+struct _DBusDisplayListenerConnection {
     GObject parent;
 
     char *bus_name;
-    DBusDisplayConsole *console;
+    DBusDisplayListener *listener;
     GDBusConnection *conn;
 
     QemuDBusDisplay1Listener *proxy;
+};
+
+G_DEFINE_TYPE(DBusDisplayListenerConnection,
+              dbus_display_listener_connection,
+              G_TYPE_OBJECT)
+
+struct _DBusDisplayListener {
+    GObject parent;
+
+    GHashTable *conns;
+    DBusDisplayConsole *console;
 
     DisplayChangeListener dcl;
     DisplaySurface *ds;
     QemuGLShader *gls;
+    GUnixFDList *dmabuf_fd_list;
+    uint32_t dmabuf_width;
+    uint32_t dmabuf_height;
+    uint32_t dmabuf_stride;
+    uint32_t dmabuf_fourcc;
+    uint64_t dmabuf_modifier;
+    bool dmabuf_y0_top;
     int gl_updates;
 };
 
@@ -53,65 +71,98 @@ static void dbus_update_gl_cb(GObject *source_object,
                            gpointer user_data)
 {
     g_autoptr(GError) err = NULL;
-    DBusDisplayListener *ddl = user_data;
+    DBusDisplayListenerConnection *ddlc = user_data;
 
-    if (!qemu_dbus_display1_listener_call_update_dmabuf_finish(ddl->proxy,
+    if (!qemu_dbus_display1_listener_call_update_dmabuf_finish(ddlc->proxy,
                                                                res, &err)) {
         error_report("Failed to call update: %s", err->message);
     }
 
-    graphic_hw_gl_block(ddl->dcl.con, false);
-    g_object_unref(ddl);
+    graphic_hw_gl_block(ddlc->listener->dcl.con, false);
+    g_object_unref(ddlc);
 }
 
 static void dbus_call_update_gl(DBusDisplayListener *ddl,
                                 int x, int y, int w, int h)
 {
-    graphic_hw_gl_block(ddl->dcl.con, true);
-    glFlush();
-    qemu_dbus_display1_listener_call_update_dmabuf(ddl->proxy,
-        x, y, w, h,
-        G_DBUS_CALL_FLAGS_NONE,
-        DBUS_DEFAULT_TIMEOUT, NULL,
-        dbus_update_gl_cb,
-        g_object_ref(ddl));
+    GHashTableIter iter;
+    gpointer ddlc;
+
+    g_hash_table_iter_init(&iter, ddl->conns);
+    while (g_hash_table_iter_next(&iter, NULL, &ddlc)) {
+        graphic_hw_gl_block(ddl->dcl.con, true);
+        glFlush();
+        qemu_dbus_display1_listener_call_update_dmabuf(
+            ((DBusDisplayListenerConnection *)ddlc)->proxy,
+            x, y, w, h,
+            G_DBUS_CALL_FLAGS_NONE,
+            DBUS_DEFAULT_TIMEOUT, NULL,
+            dbus_update_gl_cb,
+            g_object_ref(ddlc));
+    }
 }
 
 static void dbus_scanout_disable(DisplayChangeListener *dcl)
 {
     DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
+    GHashTableIter iter;
+    gpointer ddlc;
 
     ddl->ds = NULL;
-    qemu_dbus_display1_listener_call_disable(
-        ddl->proxy, G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+
+    g_hash_table_iter_init(&iter, ddl->conns);
+    while (g_hash_table_iter_next(&iter, NULL, &ddlc)) {
+        qemu_dbus_display1_listener_call_disable(
+            ((DBusDisplayListenerConnection *)ddlc)->proxy,
+            G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+    }
 }
 
 static void dbus_scanout_dmabuf(DisplayChangeListener *dcl,
                                 QemuDmaBuf *dmabuf)
 {
     DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
+    GHashTableIter iter;
+    gpointer ddlc;
     g_autoptr(GError) err = NULL;
     g_autoptr(GUnixFDList) fd_list = NULL;
 
-    fd_list = g_unix_fd_list_new();
-    if (g_unix_fd_list_append(fd_list, dmabuf->fd, &err) != 0) {
+    if (ddl->dmabuf_fd_list) {
+        g_clear_object(&ddl->dmabuf_fd_list);
+    }
+
+    ddl->dmabuf_fd_list = g_unix_fd_list_new();
+    if (g_unix_fd_list_append(ddl->dmabuf_fd_list, dmabuf->fd, &err) != 0) {
+        g_clear_object(&ddl->dmabuf_fd_list);
         error_report("Failed to setup dmabuf fdlist: %s", err->message);
         return;
     }
 
-    qemu_dbus_display1_listener_call_scanout_dmabuf(
-        ddl->proxy,
-        g_variant_new_handle(0),
-        dmabuf->width,
-        dmabuf->height,
-        dmabuf->stride,
-        dmabuf->fourcc,
-        dmabuf->modifier,
-        dmabuf->y0_top,
-        G_DBUS_CALL_FLAGS_NONE,
-        -1,
-        fd_list,
-        NULL, NULL, NULL);
+    ddl->dmabuf_width = dmabuf->width;
+    ddl->dmabuf_height = dmabuf->height;
+    ddl->dmabuf_stride = dmabuf->stride;
+    ddl->dmabuf_fourcc = dmabuf->fourcc;
+    ddl->dmabuf_modifier = dmabuf->modifier;
+    ddl->dmabuf_y0_top = dmabuf->y0_top;
+
+    dbus_display_console_set_size(ddl->console, dmabuf->width, dmabuf->height);
+
+    g_hash_table_iter_init(&iter, ddl->conns);
+    while (g_hash_table_iter_next(&iter, NULL, &ddlc)) {
+        qemu_dbus_display1_listener_call_scanout_dmabuf(
+            ((DBusDisplayListenerConnection *)ddlc)->proxy,
+            g_variant_new_handle(0),
+            ddl->dmabuf_width,
+            ddl->dmabuf_height,
+            ddl->dmabuf_stride,
+            ddl->dmabuf_fourcc,
+            ddl->dmabuf_modifier,
+            ddl->dmabuf_y0_top,
+            G_DBUS_CALL_FLAGS_NONE,
+            -1,
+            ddl->dmabuf_fd_list,
+            NULL, NULL, NULL);
+    }
 }
 
 static void dbus_scanout_texture(DisplayChangeListener *dcl,
@@ -150,11 +201,16 @@ static void dbus_cursor_dmabuf(DisplayChangeListener *dcl,
     DisplaySurface *ds;
     GVariant *v_data = NULL;
     egl_fb cursor_fb;
+    GHashTableIter iter;
+    gpointer ddlc;
 
     if (!dmabuf) {
-        qemu_dbus_display1_listener_call_mouse_set(
-            ddl->proxy, 0, 0, false,
-            G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+        g_hash_table_iter_init(&iter, ddl->conns);
+        while (g_hash_table_iter_next(&iter, NULL, &ddlc)) {
+            qemu_dbus_display1_listener_call_mouse_set(
+                ((DBusDisplayListenerConnection *)ddlc)->proxy, 0, 0, false,
+                G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+        }
         return;
     }
 
@@ -174,28 +230,37 @@ static void dbus_cursor_dmabuf(DisplayChangeListener *dcl,
         TRUE,
         (GDestroyNotify)qemu_free_displaysurface,
         ds);
-    qemu_dbus_display1_listener_call_cursor_define(
-        ddl->proxy,
-        surface_width(ds),
-        surface_height(ds),
-        hot_x,
-        hot_y,
-        v_data,
-        G_DBUS_CALL_FLAGS_NONE,
-        -1,
-        NULL,
-        NULL,
-        NULL);
+
+    g_hash_table_iter_init(&iter, ddl->conns);
+    while (g_hash_table_iter_next(&iter, NULL, &ddlc)) {
+        qemu_dbus_display1_listener_call_cursor_define(
+            ((DBusDisplayListenerConnection *)ddlc)->proxy,
+            surface_width(ds),
+            surface_height(ds),
+            hot_x,
+            hot_y,
+            v_data,
+            G_DBUS_CALL_FLAGS_NONE,
+            -1,
+            NULL,
+            NULL,
+            NULL);
+    }
 }
 
 static void dbus_cursor_position(DisplayChangeListener *dcl,
                                  uint32_t pos_x, uint32_t pos_y)
 {
     DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
+    GHashTableIter iter;
+    gpointer ddlc;
 
-    qemu_dbus_display1_listener_call_mouse_set(
-        ddl->proxy, pos_x, pos_y, true,
-        G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+    g_hash_table_iter_init(&iter, ddl->conns);
+    while (g_hash_table_iter_next(&iter, NULL, &ddlc)) {
+        qemu_dbus_display1_listener_call_mouse_set(
+            ((DBusDisplayListenerConnection *)ddlc)->proxy,
+            pos_x, pos_y, true, G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+    }
 }
 
 static void dbus_release_dmabuf(DisplayChangeListener *dcl,
@@ -254,6 +319,8 @@ static void dbus_gfx_update(DisplayChangeListener *dcl,
     pixman_image_t *img;
     GVariant *v_data;
     size_t stride;
+    GHashTableIter iter;
+    gpointer ddlc;
 
     assert(ddl->ds);
     stride = w * DIV_ROUND_UP(PIXMAN_FORMAT_BPP(surface_format(ddl->ds)), 8);
@@ -273,11 +340,16 @@ static void dbus_gfx_update(DisplayChangeListener *dcl,
         TRUE,
         (GDestroyNotify)pixman_image_unref,
         img);
-    qemu_dbus_display1_listener_call_update(ddl->proxy,
-        x, y, w, h, pixman_image_get_stride(img), pixman_image_get_format(img),
-        v_data,
-        G_DBUS_CALL_FLAGS_NONE,
-        DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);
+
+    g_hash_table_iter_init(&iter, ddl->conns);
+    while (g_hash_table_iter_next(&iter, NULL, &ddlc)) {
+        qemu_dbus_display1_listener_call_update(
+            ((DBusDisplayListenerConnection *)ddlc)->proxy,
+            x, y, w, h, pixman_image_get_stride(img), pixman_image_get_format(img),
+            v_data,
+            G_DBUS_CALL_FLAGS_NONE,
+            DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);
+    }
 }
 
 static void dbus_gl_gfx_switch(DisplayChangeListener *dcl,
@@ -293,6 +365,8 @@ static void dbus_gl_gfx_switch(DisplayChangeListener *dcl,
         int width = surface_width(ddl->ds);
         int height = surface_height(ddl->ds);
 
+        dbus_display_console_set_size(ddl->console, width, height);
+
         surface_gl_create_texture(ddl->gls, ddl->ds);
         /* TODO: lazy send dmabuf (there are unnecessary sent otherwise) */
         dbus_scanout_texture(&ddl->dcl, ddl->ds->texture, false,
@@ -305,6 +379,8 @@ static void dbus_gfx_switch(DisplayChangeListener *dcl,
 {
     DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
     GVariant *v_data = NULL;
+    GHashTableIter iter;
+    gpointer ddlc;
 
     ddl->ds = new_surface;
     if (!ddl->ds) {
@@ -312,6 +388,10 @@ static void dbus_gfx_switch(DisplayChangeListener *dcl,
         return;
     }
 
+    dbus_display_console_set_size(ddl->console,
+                                  surface_width(ddl->ds),
+                                  surface_height(ddl->ds));
+
     v_data = g_variant_new_from_data(
         G_VARIANT_TYPE("ay"),
         surface_data(ddl->ds),
@@ -319,23 +399,34 @@ static void dbus_gfx_switch(DisplayChangeListener *dcl,
         TRUE,
         (GDestroyNotify)pixman_image_unref,
         pixman_image_ref(ddl->ds->image));
-    qemu_dbus_display1_listener_call_scanout(ddl->proxy,
-        surface_width(ddl->ds),
-        surface_height(ddl->ds),
-        surface_stride(ddl->ds),
-        surface_format(ddl->ds),
-        v_data,
-        G_DBUS_CALL_FLAGS_NONE,
-        DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);
+
+    g_hash_table_iter_init(&iter, ddl->conns);
+    while (g_hash_table_iter_next(&iter, NULL, &ddlc)) {
+        qemu_dbus_display1_listener_call_scanout(
+            ((DBusDisplayListenerConnection *)ddlc)->proxy,
+            surface_width(ddl->ds),
+            surface_height(ddl->ds),
+            surface_stride(ddl->ds),
+            surface_format(ddl->ds),
+            v_data,
+            G_DBUS_CALL_FLAGS_NONE,
+            DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);
+    }
 }
 
 static void dbus_mouse_set(DisplayChangeListener *dcl,
                            int x, int y, int on)
 {
     DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
+    GHashTableIter iter;
+    gpointer ddlc;
 
-    qemu_dbus_display1_listener_call_mouse_set(
-        ddl->proxy, x, y, on, G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+    g_hash_table_iter_init(&iter, ddl->conns);
+    while (g_hash_table_iter_next(&iter, NULL, &ddlc)) {
+        qemu_dbus_display1_listener_call_mouse_set(
+            ((DBusDisplayListenerConnection *)ddlc)->proxy,
+            x, y, on, G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+    }
 }
 
 static void dbus_cursor_define(DisplayChangeListener *dcl,
@@ -343,6 +434,8 @@ static void dbus_cursor_define(DisplayChangeListener *dcl,
 {
     DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
     GVariant *v_data = NULL;
+    GHashTableIter iter;
+    gpointer ddlc;
 
     cursor_get(c);
     v_data = g_variant_new_from_data(
@@ -353,18 +446,21 @@ static void dbus_cursor_define(DisplayChangeListener *dcl,
         (GDestroyNotify)cursor_put,
         c);
 
-    qemu_dbus_display1_listener_call_cursor_define(
-        ddl->proxy,
-        c->width,
-        c->height,
-        c->hot_x,
-        c->hot_y,
-        v_data,
-        G_DBUS_CALL_FLAGS_NONE,
-        -1,
-        NULL,
-        NULL,
-        NULL);
+    g_hash_table_iter_init(&iter, ddl->conns);
+    while (g_hash_table_iter_next(&iter, NULL, &ddlc)) {
+        qemu_dbus_display1_listener_call_cursor_define(
+            ((DBusDisplayListenerConnection *)ddlc)->proxy,
+            c->width,
+            c->height,
+            c->hot_x,
+            c->hot_y,
+            v_data,
+            G_DBUS_CALL_FLAGS_NONE,
+            -1,
+            NULL,
+            NULL,
+            NULL);
+    }
 }
 
 const DisplayChangeListenerOps dbus_gl_dcl_ops = {
@@ -400,9 +496,8 @@ dbus_display_listener_dispose(GObject *object)
     DBusDisplayListener *ddl = DBUS_DISPLAY_LISTENER(object);
 
     unregister_displaychangelistener(&ddl->dcl);
-    g_clear_object(&ddl->conn);
-    g_clear_pointer(&ddl->bus_name, g_free);
-    g_clear_object(&ddl->proxy);
+    g_clear_object(&ddl->dmabuf_fd_list);
+    g_clear_pointer(&ddl->conns, g_hash_table_unref);
     g_clear_pointer(&ddl->gls, qemu_gl_fini_shader);
 
     G_OBJECT_CLASS(dbus_display_listener_parent_class)->dispose(object);
@@ -435,46 +530,146 @@ dbus_display_listener_class_init(DBusDisplayListenerClass *klass)
 static void
 dbus_display_listener_init(DBusDisplayListener *ddl)
 {
+    ddl->conns = g_hash_table_new_full(g_str_hash, g_str_equal, NULL, NULL);
 }
 
-const char *
-dbus_display_listener_get_bus_name(DBusDisplayListener *ddl)
-{
-    return ddl->bus_name ?: "p2p";
-}
-
-DBusDisplayConsole *
-dbus_display_listener_get_console(DBusDisplayListener *ddl)
+DBusDisplayListenerConnection *
+dbus_display_listener_add_connection(DBusDisplayListener *ddl,
+                                     const char *bus_name,
+                                     GDBusConnection *conn)
 {
-    return ddl->console;
-}
-
-DBusDisplayListener *
-dbus_display_listener_new(const char *bus_name,
-                          GDBusConnection *conn,
-                          DBusDisplayConsole *console)
-{
-    DBusDisplayListener *ddl;
-    QemuConsole *con;
+    DBusDisplayListenerConnection *ddlc;
+    QemuDBusDisplay1Listener *proxy;
     g_autoptr(GError) err = NULL;
 
-    ddl = g_object_new(DBUS_DISPLAY_TYPE_LISTENER, NULL);
-    ddl->proxy =
+    proxy =
         qemu_dbus_display1_listener_proxy_new_sync(conn,
             G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START,
             NULL,
             "/org/qemu/Display1/Listener",
             NULL,
             &err);
-    if (!ddl->proxy) {
+    if (!proxy) {
         error_report("Failed to setup proxy: %s", err->message);
         g_object_unref(conn);
-        g_object_unref(ddl);
         return NULL;
     }
 
-    ddl->bus_name = g_strdup(bus_name);
-    ddl->conn = conn;
+    ddlc = g_object_new(DBUS_DISPLAY_TYPE_LISTENER_CONNECTION, NULL);
+    ddlc->listener = g_object_ref(ddl);
+    ddlc->proxy = proxy;
+    ddlc->bus_name = g_strdup(bus_name);
+    ddlc->conn = conn;
+
+    g_hash_table_insert(ddl->conns, ddlc->bus_name, ddlc);
+
+    if (display_opengl) {
+        if (ddl->dmabuf_fd_list) {
+            qemu_dbus_display1_listener_call_scanout_dmabuf(
+                ddlc->proxy,
+                g_variant_new_handle(0),
+                ddl->dmabuf_width,
+                ddl->dmabuf_height,
+                ddl->dmabuf_stride,
+                ddl->dmabuf_fourcc,
+                ddl->dmabuf_modifier,
+                ddl->dmabuf_y0_top,
+                G_DBUS_CALL_FLAGS_NONE,
+                -1,
+                ddl->dmabuf_fd_list,
+                NULL, NULL, NULL);
+        }
+    } else {
+        if (ddl->ds) {
+            GVariant *v_data = NULL;
+
+            v_data = g_variant_new_from_data(
+                G_VARIANT_TYPE("ay"),
+                surface_data(ddl->ds),
+                surface_stride(ddl->ds) * surface_height(ddl->ds),
+                TRUE,
+                (GDestroyNotify)pixman_image_unref,
+                pixman_image_ref(ddl->ds->image));
+
+            qemu_dbus_display1_listener_call_scanout(
+                ((DBusDisplayListenerConnection *)ddlc)->proxy,
+                surface_width(ddl->ds),
+                surface_height(ddl->ds),
+                surface_stride(ddl->ds),
+                surface_format(ddl->ds),
+                v_data,
+                G_DBUS_CALL_FLAGS_NONE,
+                DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);
+        }
+    }
+
+    return ddlc;
+}
+
+bool
+dbus_display_listener_has_connection(DBusDisplayListener *ddl,
+                                     const char *bus_name)
+{
+    return g_hash_table_contains(ddl->conns, bus_name);
+}
+
+void
+dbus_display_listener_unref_all_connections(DBusDisplayListener *ddl)
+{
+    GHashTableIter iter;
+    gpointer ddlc;
+
+    g_hash_table_iter_init(&iter, ddl->conns);
+    while (g_hash_table_iter_next(&iter, NULL, &ddlc)) {
+        g_object_unref(ddlc);
+    }
+}
+
+static void
+dbus_display_listener_connection_dispose(GObject *object)
+{
+    DBusDisplayListenerConnection *ddlc =
+        DBUS_DISPLAY_LISTENER_CONNECTION(object);
+
+    g_hash_table_remove(ddlc->listener->conns, ddlc->bus_name);
+    g_clear_object(&ddlc->listener);
+    g_clear_object(&ddlc->conn);
+    g_clear_pointer(&ddlc->bus_name, g_free);
+    g_clear_object(&ddlc->proxy);
+
+    G_OBJECT_CLASS(dbus_display_listener_connection_parent_class)->dispose(object);
+}
+
+static void
+dbus_display_listener_connection_class_init(DBusDisplayListenerConnectionClass *klass)
+{
+    G_OBJECT_CLASS(klass)->dispose = dbus_display_listener_connection_dispose;
+}
+
+static void
+dbus_display_listener_connection_init(DBusDisplayListenerConnection *ddl)
+{
+}
+
+const char *
+dbus_display_listener_connection_get_bus_name(DBusDisplayListenerConnection *ddlc)
+{
+    return ddlc->bus_name ?: "p2p";
+}
+
+DBusDisplayConsole *
+dbus_display_listener_connection_get_console(DBusDisplayListenerConnection *ddlc)
+{
+    return ddlc->listener->console;
+}
+
+DBusDisplayListener *
+dbus_display_listener_new(DBusDisplayConsole *console)
+{
+    DBusDisplayListener *ddl;
+    QemuConsole *con;
+
+    ddl = g_object_new(DBUS_DISPLAY_TYPE_LISTENER, NULL);
     ddl->console = console;
 
     con = qemu_console_lookup_by_index(dbus_display_console_get_index(console));
diff --git a/ui/dbus.h b/ui/dbus.h
index 64c77cab444..fd24b299bbf 100644
--- a/ui/dbus.h
+++ b/ui/dbus.h
@@ -76,9 +76,19 @@ G_DECLARE_FINAL_TYPE(DBusDisplayConsole,
 DBusDisplayConsole *
 dbus_display_console_new(DBusDisplay *display, QemuConsole *con);
 
+void
+dbus_display_console_set_size(DBusDisplayConsole *ddc,
+                              uint32_t width, uint32_t height);
+
 int
 dbus_display_console_get_index(DBusDisplayConsole *ddc);
 
+G_DECLARE_FINAL_TYPE(DBusDisplayListenerConnection,
+                     dbus_display_listener_connection,
+                     DBUS_DISPLAY,
+                     LISTENER_CONNECTION,
+                     GObject)
+
 #define DBUS_DISPLAY_TYPE_LISTENER dbus_display_listener_get_type()
 G_DECLARE_FINAL_TYPE(DBusDisplayListener,
                      dbus_display_listener,
@@ -86,16 +96,28 @@ G_DECLARE_FINAL_TYPE(DBusDisplayListener,
                      LISTENER,
                      GObject)
 
+#define DBUS_DISPLAY_TYPE_LISTENER_CONNECTION \
+    dbus_display_listener_connection_get_type()
 DBusDisplayListener *
-dbus_display_listener_new(const char *bus_name,
-                          GDBusConnection *conn,
-                          DBusDisplayConsole *console);
+dbus_display_listener_new(DBusDisplayConsole *console);
+
+DBusDisplayListenerConnection *
+dbus_display_listener_add_connection(DBusDisplayListener *ddl,
+                                     const char *bus_name,
+                                     GDBusConnection *conn);
+
+bool
+dbus_display_listener_has_connection(DBusDisplayListener *ddl,
+                                     const char *bus_name);
+
+void
+dbus_display_listener_unref_all_connections(DBusDisplayListener *ddl);
 
 DBusDisplayConsole *
-dbus_display_listener_get_console(DBusDisplayListener *ddl);
+dbus_display_listener_connection_get_console(DBusDisplayListenerConnection *ddlc);
 
 const char *
-dbus_display_listener_get_bus_name(DBusDisplayListener *ddl);
+dbus_display_listener_connection_get_bus_name(DBusDisplayListenerConnection *ddlc);
 
 extern const DisplayChangeListenerOps dbus_gl_dcl_ops;
 extern const DisplayChangeListenerOps dbus_dcl_ops;
-- 
2.32.0 (Apple Git-132)



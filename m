Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1604BA08F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 14:03:31 +0100 (CET)
Received: from localhost ([::1]:35874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKgRW-0005nh-TO
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 08:03:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nKfUH-0000TZ-Pr
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:02:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nKfUE-0001qh-V1
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:02:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645099333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wDtTxFL4F7lhqGLAAYPwbVV5bgNCFBgMT5QwhR/w63o=;
 b=gJuCLQ+jUbd6ttRPimrU/njQb5i7yqQAmtPJvL85uY7v7SjEpV4J4lfW8baWMI9ieSxUGW
 XkvmZtG7NfbC3Ennb5z7RuK2di+KqQNF9+X66CLIYCE8wtej//D6/51lU993ujMaHw0W61
 Rtd1EAEuCd0IWmEAaeByh23gCbdo9Ec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-g_WWAkXVNpa8nJ2VuIYTsg-1; Thu, 17 Feb 2022 07:02:10 -0500
X-MC-Unique: g_WWAkXVNpa8nJ2VuIYTsg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D553A344AF;
 Thu, 17 Feb 2022 12:02:09 +0000 (UTC)
Received: from localhost (unknown [10.39.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C10B6E1E3;
 Thu, 17 Feb 2022 12:01:35 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/12] ui/dbus: fix texture sharing
Date: Thu, 17 Feb 2022 15:58:29 +0400
Message-Id: <20220217115829.2314347-13-marcandre.lureau@redhat.com>
In-Reply-To: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
References: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

The DBus listener naively create, update and destroy textures without
taking into account other listeners. The texture were shared, but
texture update was unnecessarily duplicated.

Teach DisplayGLCtx to do optionally shared texture handling. This is
only implemented for DBus display at this point, however the same
infrastructure could potentially be used for egl-headless & VNC
listeners for example, or other future combinations.

Reported-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h | 10 ++++++++++
 ui/console.c         | 26 ++++++++++++++++++++++++++
 ui/dbus-listener.c   | 11 -----------
 ui/dbus.c            | 24 ++++++++++++++++++++++++
 4 files changed, 60 insertions(+), 11 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 18a10c0b7db0..0f84861933e1 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -290,10 +290,20 @@ typedef struct DisplayGLCtxOps {
                                QEMUGLContext ctx);
     int (*dpy_gl_ctx_make_current)(DisplayGLCtx *dgc,
                                    QEMUGLContext ctx);
+    void (*dpy_gl_ctx_create_texture)(DisplayGLCtx *dgc,
+                                      DisplaySurface *surface);
+    void (*dpy_gl_ctx_destroy_texture)(DisplayGLCtx *dgc,
+                                      DisplaySurface *surface);
+    void (*dpy_gl_ctx_update_texture)(DisplayGLCtx *dgc,
+                                      DisplaySurface *surface,
+                                      int x, int y, int w, int h);
 } DisplayGLCtxOps;
 
 struct DisplayGLCtx {
     const DisplayGLCtxOps *ops;
+#ifdef CONFIG_OPENGL
+    QemuGLShader *gls; /* optional shared shader */
+#endif
 };
 
 DisplayState *init_displaystate(void);
diff --git a/ui/console.c b/ui/console.c
index 102fcf0a5068..b9188559fb12 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1066,6 +1066,27 @@ static void displaychangelistener_gfx_switch(DisplayChangeListener *dcl,
     }
 }
 
+static void dpy_gfx_create_texture(QemuConsole *con, DisplaySurface *surface)
+{
+    if (con->gl && con->gl->ops->dpy_gl_ctx_create_texture) {
+        con->gl->ops->dpy_gl_ctx_create_texture(con->gl, surface);
+    }
+}
+
+static void dpy_gfx_destroy_texture(QemuConsole *con, DisplaySurface *surface)
+{
+    if (con->gl && con->gl->ops->dpy_gl_ctx_destroy_texture) {
+        con->gl->ops->dpy_gl_ctx_destroy_texture(con->gl, surface);
+    }
+}
+
+static void dpy_gfx_update_texture(QemuConsole *con, DisplaySurface *surface,
+                                   int x, int y, int w, int h)
+{
+    if (con->gl && con->gl->ops->dpy_gl_ctx_update_texture) {
+        con->gl->ops->dpy_gl_ctx_update_texture(con->gl, surface, x, y, w, h);
+    }
+}
 
 static void displaychangelistener_display_console(DisplayChangeListener *dcl,
                                                   QemuConsole *con,
@@ -1078,6 +1099,7 @@ static void displaychangelistener_display_console(DisplayChangeListener *dcl,
     if (!con || !console_compatible_with(con, dcl, errp)) {
         if (!dummy) {
             dummy = qemu_create_placeholder_surface(640, 480, nodev);
+            dpy_gfx_create_texture(con, dummy);
         }
         displaychangelistener_gfx_switch(dcl, dummy);
         return;
@@ -1098,6 +1120,7 @@ static void displaychangelistener_display_console(DisplayChangeListener *dcl,
                                          con->scanout.texture.width,
                                          con->scanout.texture.height);
     } else if (con->scanout.kind == SCANOUT_SURFACE) {
+        dpy_gfx_create_texture(con, con->surface);
         displaychangelistener_gfx_switch(dcl, con->surface);
     }
 
@@ -1634,6 +1657,7 @@ void dpy_gfx_update(QemuConsole *con, int x, int y, int w, int h)
     if (!qemu_console_is_visible(con)) {
         return;
     }
+    dpy_gfx_update_texture(con, con->surface, x, y, w, h);
     QLIST_FOREACH(dcl, &s->listeners, next) {
         if (con != (dcl->con ? dcl->con : active_console)) {
             continue;
@@ -1678,12 +1702,14 @@ void dpy_gfx_replace_surface(QemuConsole *con,
 
     con->scanout.kind = SCANOUT_SURFACE;
     con->surface = surface;
+    dpy_gfx_create_texture(con, surface);
     QLIST_FOREACH(dcl, &s->listeners, next) {
         if (con != (dcl->con ? dcl->con : active_console)) {
             continue;
         }
         displaychangelistener_gfx_switch(dcl, surface);
     }
+    dpy_gfx_destroy_texture(con, old_surface);
     qemu_free_displaysurface(old_surface);
 }
 
diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
index 81c119b13a2c..a287edd2fc15 100644
--- a/ui/dbus-listener.c
+++ b/ui/dbus-listener.c
@@ -42,7 +42,6 @@ struct _DBusDisplayListener {
 
     DisplayChangeListener dcl;
     DisplaySurface *ds;
-    QemuGLShader *gls;
     int gl_updates;
 };
 
@@ -240,10 +239,6 @@ static void dbus_gl_gfx_update(DisplayChangeListener *dcl,
 {
     DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
 
-    if (ddl->ds) {
-        surface_gl_update_texture(ddl->gls, ddl->ds, x, y, w, h);
-    }
-
     ddl->gl_updates++;
 }
 
@@ -285,15 +280,11 @@ static void dbus_gl_gfx_switch(DisplayChangeListener *dcl,
 {
     DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
 
-    if (ddl->ds) {
-        surface_gl_destroy_texture(ddl->gls, ddl->ds);
-    }
     ddl->ds = new_surface;
     if (ddl->ds) {
         int width = surface_width(ddl->ds);
         int height = surface_height(ddl->ds);
 
-        surface_gl_create_texture(ddl->gls, ddl->ds);
         /* TODO: lazy send dmabuf (there are unnecessary sent otherwise) */
         dbus_scanout_texture(&ddl->dcl, ddl->ds->texture, false,
                              width, height, 0, 0, width, height);
@@ -403,7 +394,6 @@ dbus_display_listener_dispose(GObject *object)
     g_clear_object(&ddl->conn);
     g_clear_pointer(&ddl->bus_name, g_free);
     g_clear_object(&ddl->proxy);
-    g_clear_pointer(&ddl->gls, qemu_gl_fini_shader);
 
     G_OBJECT_CLASS(dbus_display_listener_parent_class)->dispose(object);
 }
@@ -414,7 +404,6 @@ dbus_display_listener_constructed(GObject *object)
     DBusDisplayListener *ddl = DBUS_DISPLAY_LISTENER(object);
 
     if (display_opengl) {
-        ddl->gls = qemu_gl_init_shader();
         ddl->dcl.ops = &dbus_gl_dcl_ops;
     } else {
         ddl->dcl.ops = &dbus_dcl_ops;
diff --git a/ui/dbus.c b/ui/dbus.c
index 22c82d2f323a..8e2e4c9cad28 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -55,11 +55,33 @@ dbus_is_compatible_dcl(DisplayGLCtx *dgc,
     return dcl->ops == &dbus_gl_dcl_ops || dcl->ops == &dbus_console_dcl_ops;
 }
 
+static void
+dbus_create_texture(DisplayGLCtx *ctx, DisplaySurface *surface)
+{
+    surface_gl_create_texture(ctx->gls, surface);
+}
+
+static void
+dbus_destroy_texture(DisplayGLCtx *ctx, DisplaySurface *surface)
+{
+    surface_gl_destroy_texture(ctx->gls, surface);
+}
+
+static void
+dbus_update_texture(DisplayGLCtx *ctx, DisplaySurface *surface,
+                    int x, int y, int w, int h)
+{
+    surface_gl_update_texture(ctx->gls, surface, x, y, w, h);
+}
+
 static const DisplayGLCtxOps dbus_gl_ops = {
     .dpy_gl_ctx_is_compatible_dcl = dbus_is_compatible_dcl,
     .dpy_gl_ctx_create       = dbus_create_context,
     .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
     .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
+    .dpy_gl_ctx_create_texture = dbus_create_texture,
+    .dpy_gl_ctx_destroy_texture = dbus_destroy_texture,
+    .dpy_gl_ctx_update_texture = dbus_update_texture,
 };
 
 static NotifierList dbus_display_notifiers =
@@ -90,6 +112,7 @@ dbus_display_init(Object *o)
     g_autoptr(GDBusObjectSkeleton) vm = NULL;
 
     dd->glctx.ops = &dbus_gl_ops;
+    dd->glctx.gls = qemu_gl_init_shader();
     dd->iface = qemu_dbus_display1_vm_skeleton_new();
     dd->consoles = g_ptr_array_new_with_free_func(g_object_unref);
 
@@ -126,6 +149,7 @@ dbus_display_finalize(Object *o)
     g_clear_object(&dd->iface);
     g_free(dd->dbus_addr);
     g_free(dd->audiodev);
+    g_clear_pointer(&dd->glctx.gls, qemu_gl_fini_shader);
     dbus_display = NULL;
 }
 
-- 
2.34.1.428.gdcc0cd074f0c



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228F44D85B7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:07:58 +0100 (CET)
Received: from localhost ([::1]:40548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTkQX-0006wA-7J
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:07:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nTkJa-0004fP-QX
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:00:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nTkJY-00037Z-8i
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:00:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647262843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KkQnyUCGjkrsCbou8EryJJhDknNNAec4lt7j2S6Ur9g=;
 b=O/g1OKLr8YUD3wAOOeFcWGsXeJVzjQ85ynbIqe+oRFU5asRPV8bQwBC7E/SzGfc86HFWZ3
 UKSYjTVJg/G3Q2FjNOXuAPMl0vTmiLddQ5LJVTLKgT+o9pt4VUxM0rcifVjr0340kNeG1B
 78uSH5iC6GryBuBQA4CahQShnMLtC3k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-xplI0cWGNI2MNQMdlp0ahw-1; Mon, 14 Mar 2022 09:00:40 -0400
X-MC-Unique: xplI0cWGNI2MNQMdlp0ahw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E0BA3C1EA52;
 Mon, 14 Mar 2022 13:00:39 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C49D9463E09;
 Mon, 14 Mar 2022 13:00:37 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 10/12] ui/dbus: fix texture sharing
Date: Mon, 14 Mar 2022 16:59:38 +0400
Message-Id: <20220314125940.1866728-11-marcandre.lureau@redhat.com>
In-Reply-To: <20220314125940.1866728-1-marcandre.lureau@redhat.com>
References: <20220314125940.1866728-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The DBus listener naively create, update and destroy textures without
taking into account other listeners. The texture were shared, but
texture update was unnecessarily duplicated.

Teach DisplayGLCtx to do optionally shared texture handling. This is
only implemented for DBus display at this point, however the same
infrastructure could potentially be used for other future combinations.

Reported-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h | 10 ++++++++++
 ui/console.c         | 26 ++++++++++++++++++++++++++
 ui/dbus-listener.c   | 11 -----------
 ui/dbus.c            | 26 ++++++++++++++++++++++++++
 4 files changed, 62 insertions(+), 11 deletions(-)

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
index 06ba82db61c9..5bfecea4549e 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1073,6 +1073,27 @@ static void displaychangelistener_gfx_switch(DisplayChangeListener *dcl,
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
@@ -1085,6 +1106,7 @@ static void displaychangelistener_display_console(DisplayChangeListener *dcl,
     if (!con || !console_compatible_with(con, dcl, errp)) {
         if (!dummy) {
             dummy = qemu_create_placeholder_surface(640, 480, nodev);
+            dpy_gfx_create_texture(con, dummy);
         }
         displaychangelistener_gfx_switch(dcl, dummy, TRUE);
         return;
@@ -1105,6 +1127,7 @@ static void displaychangelistener_display_console(DisplayChangeListener *dcl,
                                          con->scanout.texture.width,
                                          con->scanout.texture.height);
     } else if (con->scanout.kind == SCANOUT_SURFACE) {
+        dpy_gfx_create_texture(con, con->surface);
         displaychangelistener_gfx_switch(dcl, con->surface, TRUE);
     }
 }
@@ -1637,6 +1660,7 @@ void dpy_gfx_update(QemuConsole *con, int x, int y, int w, int h)
     if (!qemu_console_is_visible(con)) {
         return;
     }
+    dpy_gfx_update_texture(con, con->surface, x, y, w, h);
     QLIST_FOREACH(dcl, &s->listeners, next) {
         if (con != (dcl->con ? dcl->con : active_console)) {
             continue;
@@ -1681,12 +1705,14 @@ void dpy_gfx_replace_surface(QemuConsole *con,
 
     con->scanout.kind = SCANOUT_SURFACE;
     con->surface = surface;
+    dpy_gfx_create_texture(con, surface);
     QLIST_FOREACH(dcl, &s->listeners, next) {
         if (con != (dcl->con ? dcl->con : active_console)) {
             continue;
         }
         displaychangelistener_gfx_switch(dcl, surface, FALSE);
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
index 22c82d2f323a..7a87612379e8 100644
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
@@ -90,6 +112,9 @@ dbus_display_init(Object *o)
     g_autoptr(GDBusObjectSkeleton) vm = NULL;
 
     dd->glctx.ops = &dbus_gl_ops;
+    if (display_opengl) {
+        dd->glctx.gls = qemu_gl_init_shader();
+    }
     dd->iface = qemu_dbus_display1_vm_skeleton_new();
     dd->consoles = g_ptr_array_new_with_free_func(g_object_unref);
 
@@ -126,6 +151,7 @@ dbus_display_finalize(Object *o)
     g_clear_object(&dd->iface);
     g_free(dd->dbus_addr);
     g_free(dd->audiodev);
+    g_clear_pointer(&dd->glctx.gls, qemu_gl_fini_shader);
     dbus_display = NULL;
 }
 
-- 
2.35.1.273.ge6ebfd0e8cbb



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F4A427D9E
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:23:40 +0200 (CEST)
Received: from localhost ([::1]:45918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJoh-00051S-4j
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJeR-0003NR-MQ
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:13:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJeO-0000IH-Up
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:13:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633813980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ywbaU1V2fW7TiFORe1WiPNnKZFKy77Atow8j3ixu0QQ=;
 b=RN2XWfx0xVWMCDvm9+y6sRDxCNuWldEvYl9R9d32CtAhg6rWVGwWhDpYAptl0++Q43UvXv
 mhh3jvF8eDqZ5e9GDOWigI0NatkdWU7m3vnWOcKvBy2ZSqNFxH0yrKeZfpeBr63sRaWDYx
 Lke6UMde2BuqpJ+Li96HrGVSnZiz1ng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-AUEE8O91Pp2tN7g6a7seAg-1; Sat, 09 Oct 2021 17:12:57 -0400
X-MC-Unique: AUEE8O91Pp2tN7g6a7seAg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79A0010A8E01
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:12:56 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 680535C1B4;
 Sat,  9 Oct 2021 21:12:40 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/37] ui: split the GL context in a different object
Date: Sun, 10 Oct 2021 01:08:18 +0400
Message-Id: <20211009210838.2219430-18-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This will allow to have one GL context but a variable number of
listeners.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h       | 34 ++++++++++++++++++++++------------
 include/ui/egl-context.h   |  6 +++---
 include/ui/gtk.h           | 11 ++++++-----
 include/ui/sdl2.h          |  7 ++++---
 include/ui/spice-display.h |  1 +
 ui/console.c               | 26 ++++++++++++++++----------
 ui/egl-context.c           |  6 +++---
 ui/egl-headless.c          | 21 ++++++++++++++-------
 ui/gtk-egl.c               | 10 +++++-----
 ui/gtk-gl-area.c           |  8 ++++----
 ui/gtk.c                   | 24 ++++++++++++++++--------
 ui/sdl2-gl.c               | 10 +++++-----
 ui/sdl2.c                  | 13 +++++++++----
 ui/spice-display.c         | 18 +++++++++++-------
 14 files changed, 119 insertions(+), 76 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index cd6f103bd9..7a35c4fc6a 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -174,6 +174,7 @@ typedef struct QemuDmaBuf {
 } QemuDmaBuf;
 
 typedef struct DisplayState DisplayState;
+typedef struct DisplayGLCtx DisplayGLCtx;
 
 typedef struct DisplayChangeListenerOps {
     const char *dpy_name;
@@ -208,16 +209,6 @@ typedef struct DisplayChangeListenerOps {
     void (*dpy_cursor_define)(DisplayChangeListener *dcl,
                               QEMUCursor *cursor);
 
-    /* required if GL */
-    QEMUGLContext (*dpy_gl_ctx_create)(DisplayChangeListener *dcl,
-                                       QEMUGLParams *params);
-    /* required if GL */
-    void (*dpy_gl_ctx_destroy)(DisplayChangeListener *dcl,
-                               QEMUGLContext ctx);
-    /* required if GL */
-    int (*dpy_gl_ctx_make_current)(DisplayChangeListener *dcl,
-                                   QEMUGLContext ctx);
-
     /* required if GL */
     void (*dpy_gl_scanout_disable)(DisplayChangeListener *dcl);
     /* required if GL */
@@ -258,6 +249,26 @@ struct DisplayChangeListener {
     QLIST_ENTRY(DisplayChangeListener) next;
 };
 
+typedef struct DisplayGLCtxOps {
+    /*
+     * We only check if the GLCtx is compatible with a DCL via ops. A natural
+     * evolution of this would be a callback to check some runtime requirements
+     * and allow various DCL kinds.
+     */
+    const DisplayChangeListenerOps *compatible_dcl;
+
+    QEMUGLContext (*dpy_gl_ctx_create)(DisplayGLCtx *dgc,
+                                       QEMUGLParams *params);
+    void (*dpy_gl_ctx_destroy)(DisplayGLCtx *dgc,
+                               QEMUGLContext ctx);
+    int (*dpy_gl_ctx_make_current)(DisplayGLCtx *dgc,
+                                   QEMUGLContext ctx);
+} DisplayGLCtxOps;
+
+struct DisplayGLCtx {
+    const DisplayGLCtxOps *ops;
+};
+
 DisplayState *init_displaystate(void);
 DisplaySurface *qemu_create_displaysurface_from(int width, int height,
                                                 pixman_format_code_t format,
@@ -404,8 +415,7 @@ void graphic_hw_gl_block(QemuConsole *con, bool block);
 
 void qemu_console_early_init(void);
 
-void qemu_console_set_display_gl_ctx(QemuConsole *con,
-                                     DisplayChangeListener *dcl);
+void qemu_console_set_display_gl_ctx(QemuConsole *con, DisplayGLCtx *ctx);
 
 QemuConsole *qemu_console_lookup_by_index(unsigned int index);
 QemuConsole *qemu_console_lookup_by_device(DeviceState *dev, uint32_t head);
diff --git a/include/ui/egl-context.h b/include/ui/egl-context.h
index 9374fe41e3..c2761d747a 100644
--- a/include/ui/egl-context.h
+++ b/include/ui/egl-context.h
@@ -4,10 +4,10 @@
 #include "ui/console.h"
 #include "ui/egl-helpers.h"
 
-QEMUGLContext qemu_egl_create_context(DisplayChangeListener *dcl,
+QEMUGLContext qemu_egl_create_context(DisplayGLCtx *dgc,
                                       QEMUGLParams *params);
-void qemu_egl_destroy_context(DisplayChangeListener *dcl, QEMUGLContext ctx);
-int qemu_egl_make_context_current(DisplayChangeListener *dcl,
+void qemu_egl_destroy_context(DisplayGLCtx *dgc, QEMUGLContext ctx);
+int qemu_egl_make_context_current(DisplayGLCtx *dgc,
                                   QEMUGLContext ctx);
 
 #endif /* EGL_CONTEXT_H */
diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 7d22affd38..101b147d1b 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -35,6 +35,7 @@ typedef struct GtkDisplayState GtkDisplayState;
 
 typedef struct VirtualGfxConsole {
     GtkWidget *drawing_area;
+    DisplayGLCtx dgc;
     DisplayChangeListener dcl;
     QKbdState *kbd;
     DisplaySurface *ds;
@@ -165,7 +166,7 @@ void gd_egl_update(DisplayChangeListener *dcl,
 void gd_egl_refresh(DisplayChangeListener *dcl);
 void gd_egl_switch(DisplayChangeListener *dcl,
                    DisplaySurface *surface);
-QEMUGLContext gd_egl_create_context(DisplayChangeListener *dcl,
+QEMUGLContext gd_egl_create_context(DisplayGLCtx *dgc,
                                     QEMUGLParams *params);
 void gd_egl_scanout_disable(DisplayChangeListener *dcl);
 void gd_egl_scanout_texture(DisplayChangeListener *dcl,
@@ -187,7 +188,7 @@ void gd_egl_flush(DisplayChangeListener *dcl,
 void gd_egl_scanout_flush(DisplayChangeListener *dcl,
                           uint32_t x, uint32_t y, uint32_t w, uint32_t h);
 void gtk_egl_init(DisplayGLMode mode);
-int gd_egl_make_current(DisplayChangeListener *dcl,
+int gd_egl_make_current(DisplayGLCtx *dgc,
                         QEMUGLContext ctx);
 
 /* ui/gtk-gl-area.c */
@@ -198,9 +199,9 @@ void gd_gl_area_update(DisplayChangeListener *dcl,
 void gd_gl_area_refresh(DisplayChangeListener *dcl);
 void gd_gl_area_switch(DisplayChangeListener *dcl,
                        DisplaySurface *surface);
-QEMUGLContext gd_gl_area_create_context(DisplayChangeListener *dcl,
+QEMUGLContext gd_gl_area_create_context(DisplayGLCtx *dgc,
                                         QEMUGLParams *params);
-void gd_gl_area_destroy_context(DisplayChangeListener *dcl,
+void gd_gl_area_destroy_context(DisplayGLCtx *dgc,
                                 QEMUGLContext ctx);
 void gd_gl_area_scanout_dmabuf(DisplayChangeListener *dcl,
                                QemuDmaBuf *dmabuf);
@@ -215,7 +216,7 @@ void gd_gl_area_scanout_disable(DisplayChangeListener *dcl);
 void gd_gl_area_scanout_flush(DisplayChangeListener *dcl,
                               uint32_t x, uint32_t y, uint32_t w, uint32_t h);
 void gtk_gl_area_init(void);
-int gd_gl_area_make_current(DisplayChangeListener *dcl,
+int gd_gl_area_make_current(DisplayGLCtx *dgc,
                             QEMUGLContext ctx);
 
 /* gtk-clipboard.c */
diff --git a/include/ui/sdl2.h b/include/ui/sdl2.h
index f85c117a78..71bcf7ebda 100644
--- a/include/ui/sdl2.h
+++ b/include/ui/sdl2.h
@@ -16,6 +16,7 @@
 #endif
 
 struct sdl2_console {
+    DisplayGLCtx dgc;
     DisplayChangeListener dcl;
     DisplaySurface *surface;
     DisplayOptions *opts;
@@ -65,10 +66,10 @@ void sdl2_gl_switch(DisplayChangeListener *dcl,
 void sdl2_gl_refresh(DisplayChangeListener *dcl);
 void sdl2_gl_redraw(struct sdl2_console *scon);
 
-QEMUGLContext sdl2_gl_create_context(DisplayChangeListener *dcl,
+QEMUGLContext sdl2_gl_create_context(DisplayGLCtx *dgc,
                                      QEMUGLParams *params);
-void sdl2_gl_destroy_context(DisplayChangeListener *dcl, QEMUGLContext ctx);
-int sdl2_gl_make_context_current(DisplayChangeListener *dcl,
+void sdl2_gl_destroy_context(DisplayGLCtx *dgc, QEMUGLContext ctx);
+int sdl2_gl_make_context_current(DisplayGLCtx *dgc,
                                  QEMUGLContext ctx);
 
 void sdl2_gl_scanout_disable(DisplayChangeListener *dcl);
diff --git a/include/ui/spice-display.h b/include/ui/spice-display.h
index ed298d58f0..a2fbf62c52 100644
--- a/include/ui/spice-display.h
+++ b/include/ui/spice-display.h
@@ -86,6 +86,7 @@ typedef struct SimpleSpiceCursor SimpleSpiceCursor;
 
 struct SimpleSpiceDisplay {
     DisplaySurface *ds;
+    DisplayGLCtx dgc;
     DisplayChangeListener dcl;
     void *buf;
     int bufsize;
diff --git a/ui/console.c b/ui/console.c
index 75e432106b..e5a2c84dd9 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -127,7 +127,7 @@ struct QemuConsole {
     DisplayState *ds;
     DisplaySurface *surface;
     int dcls;
-    DisplayChangeListener *gl;
+    DisplayGLCtx *gl;
     int gl_block;
     QEMUTimer *gl_unblock_timer;
     int window_id;
@@ -1516,17 +1516,24 @@ static bool dpy_compatible_with(QemuConsole *con,
     return true;
 }
 
-void qemu_console_set_display_gl_ctx(QemuConsole *con,
-                                     DisplayChangeListener *dcl)
+void qemu_console_set_display_gl_ctx(QemuConsole *con, DisplayGLCtx *gl)
 {
     /* display has opengl support */
-    assert(dcl->con);
-    if (dcl->con->gl) {
-        fprintf(stderr, "can't register two opengl displays (%s, %s)\n",
-                dcl->ops->dpy_name, dcl->con->gl->ops->dpy_name);
+    assert(con);
+    if (con->gl) {
+        error_report("The console already has an OpenGL context.");
         exit(1);
     }
-    dcl->con->gl = dcl;
+    con->gl = gl;
+}
+
+static bool dpy_gl_compatible_with(QemuConsole *con, DisplayChangeListener *dcl)
+{
+    if (!con->gl) {
+        return true;
+    }
+
+    return con->gl->ops->compatible_dcl == dcl->ops;
 }
 
 void register_displaychangelistener(DisplayChangeListener *dcl)
@@ -1538,8 +1545,7 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
 
     assert(!dcl->ds);
 
-    if (dcl->con && dcl->con->gl &&
-        dcl->con->gl != dcl) {
+    if (dcl->con && !dpy_gl_compatible_with(dcl->con, dcl)) {
         error_report("Display %s is incompatible with the GL context",
                      dcl->ops->dpy_name);
         exit(1);
diff --git a/ui/egl-context.c b/ui/egl-context.c
index 368ffa49d8..eb5f520fc4 100644
--- a/ui/egl-context.c
+++ b/ui/egl-context.c
@@ -1,7 +1,7 @@
 #include "qemu/osdep.h"
 #include "ui/egl-context.h"
 
-QEMUGLContext qemu_egl_create_context(DisplayChangeListener *dcl,
+QEMUGLContext qemu_egl_create_context(DisplayGLCtx *dgc,
                                       QEMUGLParams *params)
 {
    EGLContext ctx;
@@ -24,12 +24,12 @@ QEMUGLContext qemu_egl_create_context(DisplayChangeListener *dcl,
    return ctx;
 }
 
-void qemu_egl_destroy_context(DisplayChangeListener *dcl, QEMUGLContext ctx)
+void qemu_egl_destroy_context(DisplayGLCtx *dgc, QEMUGLContext ctx)
 {
     eglDestroyContext(qemu_egl_display, ctx);
 }
 
-int qemu_egl_make_context_current(DisplayChangeListener *dcl,
+int qemu_egl_make_context_current(DisplayGLCtx *dgc,
                                   QEMUGLContext ctx)
 {
    return eglMakeCurrent(qemu_egl_display,
diff --git a/ui/egl-headless.c b/ui/egl-headless.c
index 08327c40c6..94082a9da9 100644
--- a/ui/egl-headless.c
+++ b/ui/egl-headless.c
@@ -38,12 +38,12 @@ static void egl_gfx_switch(DisplayChangeListener *dcl,
     edpy->ds = new_surface;
 }
 
-static QEMUGLContext egl_create_context(DisplayChangeListener *dcl,
+static QEMUGLContext egl_create_context(DisplayGLCtx *dgc,
                                         QEMUGLParams *params)
 {
     eglMakeCurrent(qemu_egl_display, EGL_NO_SURFACE, EGL_NO_SURFACE,
                    qemu_egl_rn_ctx);
-    return qemu_egl_create_context(dcl, params);
+    return qemu_egl_create_context(dgc, params);
 }
 
 static void egl_scanout_disable(DisplayChangeListener *dcl)
@@ -157,10 +157,6 @@ static const DisplayChangeListenerOps egl_ops = {
     .dpy_gfx_update          = egl_gfx_update,
     .dpy_gfx_switch          = egl_gfx_switch,
 
-    .dpy_gl_ctx_create       = egl_create_context,
-    .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
-    .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
-
     .dpy_gl_scanout_disable  = egl_scanout_disable,
     .dpy_gl_scanout_texture  = egl_scanout_texture,
     .dpy_gl_scanout_dmabuf   = egl_scanout_dmabuf,
@@ -170,6 +166,13 @@ static const DisplayChangeListenerOps egl_ops = {
     .dpy_gl_update           = egl_scanout_flush,
 };
 
+static const DisplayGLCtxOps eglctx_ops = {
+    .compatible_dcl          = &egl_ops,
+    .dpy_gl_ctx_create       = egl_create_context,
+    .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
+    .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
+};
+
 static void early_egl_headless_init(DisplayOptions *opts)
 {
     display_opengl = 1;
@@ -188,6 +191,8 @@ static void egl_headless_init(DisplayState *ds, DisplayOptions *opts)
     }
 
     for (idx = 0;; idx++) {
+        DisplayGLCtx *ctx;
+
         con = qemu_console_lookup_by_index(idx);
         if (!con || !qemu_console_is_graphic(con)) {
             break;
@@ -197,7 +202,9 @@ static void egl_headless_init(DisplayState *ds, DisplayOptions *opts)
         edpy->dcl.con = con;
         edpy->dcl.ops = &egl_ops;
         edpy->gls = qemu_gl_init_shader();
-        qemu_console_set_display_gl_ctx(con, &edpy->dcl);
+        ctx = g_new0(DisplayGLCtx, 1);
+        ctx->ops = &eglctx_ops;
+        qemu_console_set_display_gl_ctx(con, ctx);
         register_displaychangelistener(&edpy->dcl);
     }
 }
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 0f64baee63..7087e5a5cf 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -176,14 +176,14 @@ void gd_egl_switch(DisplayChangeListener *dcl,
     }
 }
 
-QEMUGLContext gd_egl_create_context(DisplayChangeListener *dcl,
+QEMUGLContext gd_egl_create_context(DisplayGLCtx *dgc,
                                     QEMUGLParams *params)
 {
-    VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
+    VirtualConsole *vc = container_of(dgc, VirtualConsole, gfx.dgc);
 
     eglMakeCurrent(qemu_egl_display, vc->gfx.esurface,
                    vc->gfx.esurface, vc->gfx.ectx);
-    return qemu_egl_create_context(dcl, params);
+    return qemu_egl_create_context(dgc, params);
 }
 
 void gd_egl_scanout_disable(DisplayChangeListener *dcl)
@@ -335,10 +335,10 @@ void gtk_egl_init(DisplayGLMode mode)
     display_opengl = 1;
 }
 
-int gd_egl_make_current(DisplayChangeListener *dcl,
+int gd_egl_make_current(DisplayGLCtx *dgc,
                         QEMUGLContext ctx)
 {
-    VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
+    VirtualConsole *vc = container_of(dgc, VirtualConsole, gfx.dgc);
 
     return eglMakeCurrent(qemu_egl_display, vc->gfx.esurface,
                           vc->gfx.esurface, ctx);
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 5e79505291..cd6c455f22 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -157,10 +157,10 @@ void gd_gl_area_switch(DisplayChangeListener *dcl,
     }
 }
 
-QEMUGLContext gd_gl_area_create_context(DisplayChangeListener *dcl,
+QEMUGLContext gd_gl_area_create_context(DisplayGLCtx *dgc,
                                         QEMUGLParams *params)
 {
-    VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
+    VirtualConsole *vc = container_of(dgc, VirtualConsole, gfx.dgc);
     GdkWindow *window;
     GdkGLContext *ctx;
     GError *err = NULL;
@@ -186,7 +186,7 @@ QEMUGLContext gd_gl_area_create_context(DisplayChangeListener *dcl,
     return ctx;
 }
 
-void gd_gl_area_destroy_context(DisplayChangeListener *dcl, QEMUGLContext ctx)
+void gd_gl_area_destroy_context(DisplayGLCtx *dgc, QEMUGLContext ctx)
 {
     /* FIXME */
 }
@@ -264,7 +264,7 @@ void gtk_gl_area_init(void)
     display_opengl = 1;
 }
 
-int gd_gl_area_make_current(DisplayChangeListener *dcl,
+int gd_gl_area_make_current(DisplayGLCtx *dgc,
                             QEMUGLContext ctx)
 {
     gdk_gl_context_make_current(ctx);
diff --git a/ui/gtk.c b/ui/gtk.c
index 71bfe29793..db9bcb6f1a 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -606,9 +606,6 @@ static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_mouse_set        = gd_mouse_set,
     .dpy_cursor_define    = gd_cursor_define,
 
-    .dpy_gl_ctx_create       = gd_gl_area_create_context,
-    .dpy_gl_ctx_destroy      = gd_gl_area_destroy_context,
-    .dpy_gl_ctx_make_current = gd_gl_area_make_current,
     .dpy_gl_scanout_texture  = gd_gl_area_scanout_texture,
     .dpy_gl_scanout_disable  = gd_gl_area_scanout_disable,
     .dpy_gl_update           = gd_gl_area_scanout_flush,
@@ -617,8 +614,14 @@ static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_has_dmabuf          = gd_has_dmabuf,
 };
 
-#ifdef CONFIG_X11
+static const DisplayGLCtxOps gl_area_ctx_ops = {
+    .compatible_dcl          = &dcl_gl_area_ops,
+    .dpy_gl_ctx_create       = gd_gl_area_create_context,
+    .dpy_gl_ctx_destroy      = gd_gl_area_destroy_context,
+    .dpy_gl_ctx_make_current = gd_gl_area_make_current,
+};
 
+#ifdef CONFIG_X11
 static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_name             = "gtk-egl",
     .dpy_gfx_update       = gd_egl_update,
@@ -628,9 +631,6 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_mouse_set        = gd_mouse_set,
     .dpy_cursor_define    = gd_cursor_define,
 
-    .dpy_gl_ctx_create       = gd_egl_create_context,
-    .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
-    .dpy_gl_ctx_make_current = gd_egl_make_current,
     .dpy_gl_scanout_disable  = gd_egl_scanout_disable,
     .dpy_gl_scanout_texture  = gd_egl_scanout_texture,
     .dpy_gl_scanout_dmabuf   = gd_egl_scanout_dmabuf,
@@ -641,6 +641,12 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_has_dmabuf          = gd_has_dmabuf,
 };
 
+static const DisplayGLCtxOps egl_ctx_ops = {
+    .compatible_dcl          = &dcl_egl_ops,
+    .dpy_gl_ctx_create       = gd_egl_create_context,
+    .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
+    .dpy_gl_ctx_make_current = gd_egl_make_current,
+};
 #endif
 
 #endif /* CONFIG_OPENGL */
@@ -2008,6 +2014,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
             g_signal_connect(vc->gfx.drawing_area, "realize",
                              G_CALLBACK(gl_area_realize), vc);
             vc->gfx.dcl.ops = &dcl_gl_area_ops;
+            vc->gfx.dgc.ops = &gl_area_ctx_ops;
         } else {
 #ifdef CONFIG_X11
             vc->gfx.drawing_area = gtk_drawing_area_new();
@@ -2022,6 +2029,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
             gtk_widget_set_double_buffered(vc->gfx.drawing_area, FALSE);
 #pragma GCC diagnostic pop
             vc->gfx.dcl.ops = &dcl_egl_ops;
+            vc->gfx.dgc.ops = &egl_ctx_ops;
             vc->gfx.has_dmabuf = qemu_egl_has_dmabuf();
 #else
             abort();
@@ -2057,7 +2065,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
     vc->gfx.dcl.con = con;
 
     if (display_opengl) {
-        qemu_console_set_display_gl_ctx(con, &vc->gfx.dcl);
+        qemu_console_set_display_gl_ctx(con, &vc->gfx.dgc);
     }
     register_displaychangelistener(&vc->gfx.dcl);
 
diff --git a/ui/sdl2-gl.c b/ui/sdl2-gl.c
index 5b950fbbea..39cab8cde7 100644
--- a/ui/sdl2-gl.c
+++ b/ui/sdl2-gl.c
@@ -132,10 +132,10 @@ void sdl2_gl_redraw(struct sdl2_console *scon)
     }
 }
 
-QEMUGLContext sdl2_gl_create_context(DisplayChangeListener *dcl,
+QEMUGLContext sdl2_gl_create_context(DisplayGLCtx *dgc,
                                      QEMUGLParams *params)
 {
-    struct sdl2_console *scon = container_of(dcl, struct sdl2_console, dcl);
+    struct sdl2_console *scon = container_of(dgc, struct sdl2_console, dgc);
     SDL_GLContext ctx;
 
     assert(scon->opengl);
@@ -167,17 +167,17 @@ QEMUGLContext sdl2_gl_create_context(DisplayChangeListener *dcl,
     return (QEMUGLContext)ctx;
 }
 
-void sdl2_gl_destroy_context(DisplayChangeListener *dcl, QEMUGLContext ctx)
+void sdl2_gl_destroy_context(DisplayGLCtx *dgc, QEMUGLContext ctx)
 {
     SDL_GLContext sdlctx = (SDL_GLContext)ctx;
 
     SDL_GL_DeleteContext(sdlctx);
 }
 
-int sdl2_gl_make_context_current(DisplayChangeListener *dcl,
+int sdl2_gl_make_context_current(DisplayGLCtx *dgc,
                                  QEMUGLContext ctx)
 {
-    struct sdl2_console *scon = container_of(dcl, struct sdl2_console, dcl);
+    struct sdl2_console *scon = container_of(dgc, struct sdl2_console, dgc);
     SDL_GLContext sdlctx = (SDL_GLContext)ctx;
 
     assert(scon->opengl);
diff --git a/ui/sdl2.c b/ui/sdl2.c
index bb186a381a..0bd30504cf 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -778,13 +778,17 @@ static const DisplayChangeListenerOps dcl_gl_ops = {
     .dpy_mouse_set           = sdl_mouse_warp,
     .dpy_cursor_define       = sdl_mouse_define,
 
-    .dpy_gl_ctx_create       = sdl2_gl_create_context,
-    .dpy_gl_ctx_destroy      = sdl2_gl_destroy_context,
-    .dpy_gl_ctx_make_current = sdl2_gl_make_context_current,
     .dpy_gl_scanout_disable  = sdl2_gl_scanout_disable,
     .dpy_gl_scanout_texture  = sdl2_gl_scanout_texture,
     .dpy_gl_update           = sdl2_gl_scanout_flush,
 };
+
+static const DisplayGLCtxOps gl_ctx_ops = {
+    .compatible_dcl          = &dcl_gl_ops,
+    .dpy_gl_ctx_create       = sdl2_gl_create_context,
+    .dpy_gl_ctx_destroy      = sdl2_gl_destroy_context,
+    .dpy_gl_ctx_make_current = sdl2_gl_make_context_current,
+};
 #endif
 
 static void sdl2_display_early_init(DisplayOptions *o)
@@ -860,6 +864,7 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
 #ifdef CONFIG_OPENGL
         sdl2_console[i].opengl = display_opengl;
         sdl2_console[i].dcl.ops = display_opengl ? &dcl_gl_ops : &dcl_2d_ops;
+        sdl2_console[i].dgc.ops = display_opengl ? &gl_ctx_ops : NULL;
 #else
         sdl2_console[i].opengl = 0;
         sdl2_console[i].dcl.ops = &dcl_2d_ops;
@@ -867,7 +872,7 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
         sdl2_console[i].dcl.con = con;
         sdl2_console[i].kbd = qkbd_state_init(con);
         if (display_opengl) {
-            qemu_console_set_display_gl_ctx(con, &sdl2_console[i].dcl);
+            qemu_console_set_display_gl_ctx(con, &sdl2_console[i].dgc);
         }
         register_displaychangelistener(&sdl2_console[i].dcl);
 
diff --git a/ui/spice-display.c b/ui/spice-display.c
index ec501f129f..798e0f6167 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -908,12 +908,12 @@ static void spice_gl_switch(DisplayChangeListener *dcl,
     }
 }
 
-static QEMUGLContext qemu_spice_gl_create_context(DisplayChangeListener *dcl,
+static QEMUGLContext qemu_spice_gl_create_context(DisplayGLCtx *dgc,
                                                   QEMUGLParams *params)
 {
     eglMakeCurrent(qemu_egl_display, EGL_NO_SURFACE, EGL_NO_SURFACE,
                    qemu_egl_rn_ctx);
-    return qemu_egl_create_context(dcl, params);
+    return qemu_egl_create_context(dgc, params);
 }
 
 static void qemu_spice_gl_scanout_disable(DisplayChangeListener *dcl)
@@ -1105,10 +1105,6 @@ static const DisplayChangeListenerOps display_listener_gl_ops = {
     .dpy_mouse_set           = display_mouse_set,
     .dpy_cursor_define       = display_mouse_define,
 
-    .dpy_gl_ctx_create       = qemu_spice_gl_create_context,
-    .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
-    .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
-
     .dpy_gl_scanout_disable  = qemu_spice_gl_scanout_disable,
     .dpy_gl_scanout_texture  = qemu_spice_gl_scanout_texture,
     .dpy_gl_scanout_dmabuf   = qemu_spice_gl_scanout_dmabuf,
@@ -1118,6 +1114,13 @@ static const DisplayChangeListenerOps display_listener_gl_ops = {
     .dpy_gl_update           = qemu_spice_gl_update,
 };
 
+static const DisplayGLCtxOps gl_ctx_ops = {
+    .compatible_dcl          = &display_listener_gl_ops,
+    .dpy_gl_ctx_create       = qemu_spice_gl_create_context,
+    .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
+    .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
+};
+
 #endif /* HAVE_SPICE_GL */
 
 static void qemu_spice_display_init_one(QemuConsole *con)
@@ -1130,6 +1133,7 @@ static void qemu_spice_display_init_one(QemuConsole *con)
 #ifdef HAVE_SPICE_GL
     if (spice_opengl) {
         ssd->dcl.ops = &display_listener_gl_ops;
+        ssd->dgc.ops = &gl_ctx_ops;
         ssd->gl_unblock_bh = qemu_bh_new(qemu_spice_gl_unblock_bh, ssd);
         ssd->gl_unblock_timer = timer_new_ms(QEMU_CLOCK_REALTIME,
                                              qemu_spice_gl_block_timer, ssd);
@@ -1156,7 +1160,7 @@ static void qemu_spice_display_init_one(QemuConsole *con)
     qemu_spice_create_host_memslot(ssd);
 
     if (spice_opengl) {
-        qemu_console_set_display_gl_ctx(con, &ssd->dcl);
+        qemu_console_set_display_gl_ctx(con, &ssd->dgc);
     }
     register_displaychangelistener(&ssd->dcl);
 }
-- 
2.33.0.721.g106298f7f9



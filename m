Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BAB47BB40
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:42:47 +0100 (CET)
Received: from localhost ([::1]:52192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZnK-0007QI-74
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:42:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZAy-0005uh-0t
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:03:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZAv-00025l-4H
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:03:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0XmaWU22xZifElMEq63eAPJ22WB/aAoJVypSzIxJk10=;
 b=C1fz0ydqxoHYodzrDtwZDz+t5hf0f5+kq8L5JEy9DzUZkFJ0xNQNHU1+7c0mXXtk87FDSt
 odnXDFERFRJqeAv0at397a+DTDdaYg2pgCWaIe/exfuRC1TsrjJkNKrXSFDWIvIprNqmPm
 QgUTY4vLWjSPbiWo66q6PJPw3sHYT/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-XIHM-629MDCEy-zj2PXnxA-1; Tue, 21 Dec 2021 02:03:01 -0500
X-MC-Unique: XIHM-629MDCEy-zj2PXnxA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AA31801B31;
 Tue, 21 Dec 2021 07:03:00 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0A857EA36;
 Tue, 21 Dec 2021 07:02:57 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 16/36] ui: split the GL context in a different object
Date: Tue, 21 Dec 2021 10:58:35 +0400
Message-Id: <20211221065855.142578-17-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

This will allow to have one GL context but a variable number of
listeners.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
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
index 3ff51b492e5b..fe08b4dd040f 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -179,6 +179,7 @@ typedef struct QemuDmaBuf {
 } QemuDmaBuf;
 
 typedef struct DisplayState DisplayState;
+typedef struct DisplayGLCtx DisplayGLCtx;
 
 typedef struct DisplayChangeListenerOps {
     const char *dpy_name;
@@ -213,16 +214,6 @@ typedef struct DisplayChangeListenerOps {
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
@@ -263,6 +254,26 @@ struct DisplayChangeListener {
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
@@ -409,8 +420,7 @@ void graphic_hw_gl_block(QemuConsole *con, bool block);
 
 void qemu_console_early_init(void);
 
-void qemu_console_set_display_gl_ctx(QemuConsole *con,
-                                     DisplayChangeListener *dcl);
+void qemu_console_set_display_gl_ctx(QemuConsole *con, DisplayGLCtx *ctx);
 
 QemuConsole *qemu_console_lookup_by_index(unsigned int index);
 QemuConsole *qemu_console_lookup_by_device(DeviceState *dev, uint32_t head);
diff --git a/include/ui/egl-context.h b/include/ui/egl-context.h
index 9374fe41e32b..c2761d747a4e 100644
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
index 7d22affd381a..101b147d1b98 100644
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
index f85c117a78f2..71bcf7ebdaee 100644
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
index ed298d58f06c..a2fbf62c528e 100644
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
index 13c0d001c096..78583df92035 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -78,7 +78,7 @@ struct QemuConsole {
     DisplayState *ds;
     DisplaySurface *surface;
     int dcls;
-    DisplayChangeListener *gl;
+    DisplayGLCtx *gl;
     int gl_block;
     QEMUTimer *gl_unblock_timer;
     int window_id;
@@ -1458,17 +1458,24 @@ static bool dpy_compatible_with(QemuConsole *con,
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
@@ -1480,8 +1487,7 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
 
     assert(!dcl->ds);
 
-    if (dcl->con && dcl->con->gl &&
-        dcl->con->gl != dcl) {
+    if (dcl->con && !dpy_gl_compatible_with(dcl->con, dcl)) {
         error_report("Display %s is incompatible with the GL context",
                      dcl->ops->dpy_name);
         exit(1);
diff --git a/ui/egl-context.c b/ui/egl-context.c
index 368ffa49d82f..eb5f520fc4da 100644
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
index 08327c40c6ee..94082a9da951 100644
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
index e891b61048a8..e3bd4bc27431 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -197,14 +197,14 @@ void gd_egl_switch(DisplayChangeListener *dcl,
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
@@ -360,10 +360,10 @@ void gtk_egl_init(DisplayGLMode mode)
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
index f1c7636cba98..fc5a082eb846 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -170,10 +170,10 @@ void gd_gl_area_switch(DisplayChangeListener *dcl,
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
@@ -199,7 +199,7 @@ QEMUGLContext gd_gl_area_create_context(DisplayChangeListener *dcl,
     return ctx;
 }
 
-void gd_gl_area_destroy_context(DisplayChangeListener *dcl, QEMUGLContext ctx)
+void gd_gl_area_destroy_context(DisplayGLCtx *dgc, QEMUGLContext ctx)
 {
     /* FIXME */
 }
@@ -278,7 +278,7 @@ void gtk_gl_area_init(void)
     display_opengl = 1;
 }
 
-int gd_gl_area_make_current(DisplayChangeListener *dcl,
+int gd_gl_area_make_current(DisplayGLCtx *dgc,
                             QEMUGLContext ctx)
 {
     gdk_gl_context_make_current(ctx);
diff --git a/ui/gtk.c b/ui/gtk.c
index 077d38145de8..6a1f65d51894 100644
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
@@ -2034,6 +2040,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
             g_signal_connect(vc->gfx.drawing_area, "realize",
                              G_CALLBACK(gl_area_realize), vc);
             vc->gfx.dcl.ops = &dcl_gl_area_ops;
+            vc->gfx.dgc.ops = &gl_area_ctx_ops;
         } else {
 #ifdef CONFIG_X11
             vc->gfx.drawing_area = gtk_drawing_area_new();
@@ -2048,6 +2055,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
             gtk_widget_set_double_buffered(vc->gfx.drawing_area, FALSE);
 #pragma GCC diagnostic pop
             vc->gfx.dcl.ops = &dcl_egl_ops;
+            vc->gfx.dgc.ops = &egl_ctx_ops;
             vc->gfx.has_dmabuf = qemu_egl_has_dmabuf();
 #else
             abort();
@@ -2083,7 +2091,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
     vc->gfx.dcl.con = con;
 
     if (display_opengl) {
-        qemu_console_set_display_gl_ctx(con, &vc->gfx.dcl);
+        qemu_console_set_display_gl_ctx(con, &vc->gfx.dgc);
     }
     register_displaychangelistener(&vc->gfx.dcl);
 
diff --git a/ui/sdl2-gl.c b/ui/sdl2-gl.c
index 5b950fbbea2f..39cab8cde737 100644
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
index bb186a381acd..0bd30504cfcc 100644
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
index ec501f129f07..798e0f6167e7 100644
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
2.34.1.8.g35151cf07204



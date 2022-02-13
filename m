Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337F54B38FA
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 03:45:23 +0100 (CET)
Received: from localhost ([::1]:59218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJ4t8-0006kn-9r
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 21:45:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4qf-00047t-J8
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:42:49 -0500
Received: from [2607:f8b0:4864:20::102d] (port=43777
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4qc-0000PU-HW
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:42:49 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 t14-20020a17090a3e4e00b001b8f6032d96so12486757pjm.2
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 18:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bDhwIRRH8sI88SCEI0ZDajrtC+beGEIGxpKzd29C+tI=;
 b=h+e+KnDzJz7Qa/JlDoJKHN3P/ZRhl5fsxcytWJBCnqAxdxPL4lcvfVwLc6E7IyHu/u
 gBu9vhVKop4aj6Wf9Qn+FbC6dsJK4DwsQErDcSoJQGE4LWPMxvsUSHQL7WHcy6yFaSe6
 eWh8dcX5joMbUYHuv+Lxczsp9Eul5ap/edjjLSQs7qj42KHM7zBhm1ckmPHfuSl2FKMS
 SpqZp2rNh/95PO+Ti5rz0rXVOCm48ptEsINdKRqx1TNEKMNShLYNIb5m1DvH/SjGlRZK
 CitruO5yEh3tnzWX+9ej0VozOOipDo6OqxRuHBylrj56CTveBoRogEivmQqaj5cTlcZj
 PORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bDhwIRRH8sI88SCEI0ZDajrtC+beGEIGxpKzd29C+tI=;
 b=xJ4FzTngHQk0JbrSZjL/q6qkFKotFRvVkBZ/+PDSY7+9Y54eMrpt6PTET8J9+J+Sq3
 Ab2+YYG31jTBHXXDd943bGyo+ouM0nMIDwnI6Il9ySYra6HdYzDhS7+1id+480OaJYrV
 Z52rCJYsbhlOXlMK9xo4M59uCml2gt08x6/WKp+/7ef6xEctlFIxWuAtzJ/p+g7YUXpu
 uBHj4d1HfdRmu37XjdF0eZdHLtEtR3E45UCDj1zIoTAfLXD8oBcWKfk2VyG3tOuyPGHp
 dnf8mQneRwFu7ZBPxZEGAEyFvbVtD3gmczqUIXYMubBra7yamISZvrNewgIcRXJZvvNN
 hE/w==
X-Gm-Message-State: AOAM533+C8EXnWBqLsF4SDHbMfspry4rM3B7qQrybziXOK8Dbl9IWA+e
 q1SwOisnVokk+AF4JFDShbbS+rL6soE=
X-Google-Smtp-Source: ABdhPJzCb37oHrdITReHYeL5aDTbV8k9DmYCh88/+grMEqBI02BG1FXv2JeOoxQ+OmNzSrL3bPhv8w==
X-Received: by 2002:a17:90b:103:: with SMTP id p3mr7718531pjz.53.1644720164914; 
 Sat, 12 Feb 2022 18:42:44 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d85b:35dd:dae2:b7a9])
 by smtp.gmail.com with ESMTPSA id l11sm9128954pjm.23.2022.02.12.18.42.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 12 Feb 2022 18:42:44 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 3/6] Revert "ui: split the GL context in a different object"
Date: Sun, 13 Feb 2022 11:42:19 +0900
Message-Id: <20220213024222.3548-4-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220213024222.3548-1-akihiko.odaki@gmail.com>
References: <20220213024222.3548-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102d.google.com
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

This reverts commit 5e79d516e8ac818d2a90aae9f787775055434ee9.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 include/ui/console.h       | 34 ++++++++++++----------------------
 include/ui/egl-context.h   |  6 +++---
 include/ui/gtk.h           | 11 +++++------
 include/ui/sdl2.h          |  7 +++----
 include/ui/spice-display.h |  1 -
 ui/console.c               | 26 ++++++++++----------------
 ui/dbus-listener.c         | 16 ++++++++++++++--
 ui/dbus.c                  | 22 ----------------------
 ui/dbus.h                  |  4 ----
 ui/egl-context.c           |  6 +++---
 ui/egl-headless.c          | 21 +++++++--------------
 ui/gtk-egl.c               | 10 +++++-----
 ui/gtk-gl-area.c           |  8 ++++----
 ui/gtk.c                   | 24 ++++++++----------------
 ui/sdl2-gl.c               | 10 +++++-----
 ui/sdl2.c                  | 13 ++++---------
 ui/spice-display.c         | 18 +++++++-----------
 17 files changed, 90 insertions(+), 147 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index eefd7e4dc1f..58722312534 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -179,7 +179,6 @@ typedef struct QemuDmaBuf {
 } QemuDmaBuf;
 
 typedef struct DisplayState DisplayState;
-typedef struct DisplayGLCtx DisplayGLCtx;
 
 typedef struct DisplayChangeListenerOps {
     const char *dpy_name;
@@ -214,6 +213,16 @@ typedef struct DisplayChangeListenerOps {
     void (*dpy_cursor_define)(DisplayChangeListener *dcl,
                               QEMUCursor *cursor);
 
+    /* required if GL */
+    QEMUGLContext (*dpy_gl_ctx_create)(DisplayChangeListener *dcl,
+                                       QEMUGLParams *params);
+    /* required if GL */
+    void (*dpy_gl_ctx_destroy)(DisplayChangeListener *dcl,
+                               QEMUGLContext ctx);
+    /* required if GL */
+    int (*dpy_gl_ctx_make_current)(DisplayChangeListener *dcl,
+                                   QEMUGLContext ctx);
+
     /* required if GL */
     void (*dpy_gl_scanout_disable)(DisplayChangeListener *dcl);
     /* required if GL */
@@ -254,26 +263,6 @@ struct DisplayChangeListener {
     QLIST_ENTRY(DisplayChangeListener) next;
 };
 
-typedef struct DisplayGLCtxOps {
-    /*
-     * We only check if the GLCtx is compatible with a DCL via ops. A natural
-     * evolution of this would be a callback to check some runtime requirements
-     * and allow various DCL kinds.
-     */
-    const DisplayChangeListenerOps *compatible_dcl;
-
-    QEMUGLContext (*dpy_gl_ctx_create)(DisplayGLCtx *dgc,
-                                       QEMUGLParams *params);
-    void (*dpy_gl_ctx_destroy)(DisplayGLCtx *dgc,
-                               QEMUGLContext ctx);
-    int (*dpy_gl_ctx_make_current)(DisplayGLCtx *dgc,
-                                   QEMUGLContext ctx);
-} DisplayGLCtxOps;
-
-struct DisplayGLCtx {
-    const DisplayGLCtxOps *ops;
-};
-
 DisplayState *init_displaystate(void);
 DisplaySurface *qemu_create_displaysurface_from(int width, int height,
                                                 pixman_format_code_t format,
@@ -420,7 +409,8 @@ void graphic_hw_gl_block(QemuConsole *con, bool block);
 
 void qemu_console_early_init(void);
 
-void qemu_console_set_display_gl_ctx(QemuConsole *con, DisplayGLCtx *ctx);
+void qemu_console_set_display_gl_ctx(QemuConsole *con,
+                                     DisplayChangeListener *dcl);
 
 QemuConsole *qemu_console_lookup_by_index(unsigned int index);
 QemuConsole *qemu_console_lookup_by_device(DeviceState *dev, uint32_t head);
diff --git a/include/ui/egl-context.h b/include/ui/egl-context.h
index c2761d747a4..9374fe41e32 100644
--- a/include/ui/egl-context.h
+++ b/include/ui/egl-context.h
@@ -4,10 +4,10 @@
 #include "ui/console.h"
 #include "ui/egl-helpers.h"
 
-QEMUGLContext qemu_egl_create_context(DisplayGLCtx *dgc,
+QEMUGLContext qemu_egl_create_context(DisplayChangeListener *dcl,
                                       QEMUGLParams *params);
-void qemu_egl_destroy_context(DisplayGLCtx *dgc, QEMUGLContext ctx);
-int qemu_egl_make_context_current(DisplayGLCtx *dgc,
+void qemu_egl_destroy_context(DisplayChangeListener *dcl, QEMUGLContext ctx);
+int qemu_egl_make_context_current(DisplayChangeListener *dcl,
                                   QEMUGLContext ctx);
 
 #endif /* EGL_CONTEXT_H */
diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 101b147d1b9..7d22affd381 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -35,7 +35,6 @@ typedef struct GtkDisplayState GtkDisplayState;
 
 typedef struct VirtualGfxConsole {
     GtkWidget *drawing_area;
-    DisplayGLCtx dgc;
     DisplayChangeListener dcl;
     QKbdState *kbd;
     DisplaySurface *ds;
@@ -166,7 +165,7 @@ void gd_egl_update(DisplayChangeListener *dcl,
 void gd_egl_refresh(DisplayChangeListener *dcl);
 void gd_egl_switch(DisplayChangeListener *dcl,
                    DisplaySurface *surface);
-QEMUGLContext gd_egl_create_context(DisplayGLCtx *dgc,
+QEMUGLContext gd_egl_create_context(DisplayChangeListener *dcl,
                                     QEMUGLParams *params);
 void gd_egl_scanout_disable(DisplayChangeListener *dcl);
 void gd_egl_scanout_texture(DisplayChangeListener *dcl,
@@ -188,7 +187,7 @@ void gd_egl_flush(DisplayChangeListener *dcl,
 void gd_egl_scanout_flush(DisplayChangeListener *dcl,
                           uint32_t x, uint32_t y, uint32_t w, uint32_t h);
 void gtk_egl_init(DisplayGLMode mode);
-int gd_egl_make_current(DisplayGLCtx *dgc,
+int gd_egl_make_current(DisplayChangeListener *dcl,
                         QEMUGLContext ctx);
 
 /* ui/gtk-gl-area.c */
@@ -199,9 +198,9 @@ void gd_gl_area_update(DisplayChangeListener *dcl,
 void gd_gl_area_refresh(DisplayChangeListener *dcl);
 void gd_gl_area_switch(DisplayChangeListener *dcl,
                        DisplaySurface *surface);
-QEMUGLContext gd_gl_area_create_context(DisplayGLCtx *dgc,
+QEMUGLContext gd_gl_area_create_context(DisplayChangeListener *dcl,
                                         QEMUGLParams *params);
-void gd_gl_area_destroy_context(DisplayGLCtx *dgc,
+void gd_gl_area_destroy_context(DisplayChangeListener *dcl,
                                 QEMUGLContext ctx);
 void gd_gl_area_scanout_dmabuf(DisplayChangeListener *dcl,
                                QemuDmaBuf *dmabuf);
@@ -216,7 +215,7 @@ void gd_gl_area_scanout_disable(DisplayChangeListener *dcl);
 void gd_gl_area_scanout_flush(DisplayChangeListener *dcl,
                               uint32_t x, uint32_t y, uint32_t w, uint32_t h);
 void gtk_gl_area_init(void);
-int gd_gl_area_make_current(DisplayGLCtx *dgc,
+int gd_gl_area_make_current(DisplayChangeListener *dcl,
                             QEMUGLContext ctx);
 
 /* gtk-clipboard.c */
diff --git a/include/ui/sdl2.h b/include/ui/sdl2.h
index 71bcf7ebdae..f85c117a78f 100644
--- a/include/ui/sdl2.h
+++ b/include/ui/sdl2.h
@@ -16,7 +16,6 @@
 #endif
 
 struct sdl2_console {
-    DisplayGLCtx dgc;
     DisplayChangeListener dcl;
     DisplaySurface *surface;
     DisplayOptions *opts;
@@ -66,10 +65,10 @@ void sdl2_gl_switch(DisplayChangeListener *dcl,
 void sdl2_gl_refresh(DisplayChangeListener *dcl);
 void sdl2_gl_redraw(struct sdl2_console *scon);
 
-QEMUGLContext sdl2_gl_create_context(DisplayGLCtx *dgc,
+QEMUGLContext sdl2_gl_create_context(DisplayChangeListener *dcl,
                                      QEMUGLParams *params);
-void sdl2_gl_destroy_context(DisplayGLCtx *dgc, QEMUGLContext ctx);
-int sdl2_gl_make_context_current(DisplayGLCtx *dgc,
+void sdl2_gl_destroy_context(DisplayChangeListener *dcl, QEMUGLContext ctx);
+int sdl2_gl_make_context_current(DisplayChangeListener *dcl,
                                  QEMUGLContext ctx);
 
 void sdl2_gl_scanout_disable(DisplayChangeListener *dcl);
diff --git a/include/ui/spice-display.h b/include/ui/spice-display.h
index e271e011da1..df146773040 100644
--- a/include/ui/spice-display.h
+++ b/include/ui/spice-display.h
@@ -86,7 +86,6 @@ typedef struct SimpleSpiceCursor SimpleSpiceCursor;
 
 struct SimpleSpiceDisplay {
     DisplaySurface *ds;
-    DisplayGLCtx dgc;
     DisplayChangeListener dcl;
     void *buf;
     int bufsize;
diff --git a/ui/console.c b/ui/console.c
index 78583df9203..13c0d001c09 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -78,7 +78,7 @@ struct QemuConsole {
     DisplayState *ds;
     DisplaySurface *surface;
     int dcls;
-    DisplayGLCtx *gl;
+    DisplayChangeListener *gl;
     int gl_block;
     QEMUTimer *gl_unblock_timer;
     int window_id;
@@ -1458,24 +1458,17 @@ static bool dpy_compatible_with(QemuConsole *con,
     return true;
 }
 
-void qemu_console_set_display_gl_ctx(QemuConsole *con, DisplayGLCtx *gl)
+void qemu_console_set_display_gl_ctx(QemuConsole *con,
+                                     DisplayChangeListener *dcl)
 {
     /* display has opengl support */
-    assert(con);
-    if (con->gl) {
-        error_report("The console already has an OpenGL context.");
+    assert(dcl->con);
+    if (dcl->con->gl) {
+        fprintf(stderr, "can't register two opengl displays (%s, %s)\n",
+                dcl->ops->dpy_name, dcl->con->gl->ops->dpy_name);
         exit(1);
     }
-    con->gl = gl;
-}
-
-static bool dpy_gl_compatible_with(QemuConsole *con, DisplayChangeListener *dcl)
-{
-    if (!con->gl) {
-        return true;
-    }
-
-    return con->gl->ops->compatible_dcl == dcl->ops;
+    dcl->con->gl = dcl;
 }
 
 void register_displaychangelistener(DisplayChangeListener *dcl)
@@ -1487,7 +1480,8 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
 
     assert(!dcl->ds);
 
-    if (dcl->con && !dpy_gl_compatible_with(dcl->con, dcl)) {
+    if (dcl->con && dcl->con->gl &&
+        dcl->con->gl != dcl) {
         error_report("Display %s is incompatible with the GL context",
                      dcl->ops->dpy_name);
         exit(1);
diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
index e4242d69de2..b3ca348c4e5 100644
--- a/ui/dbus-listener.c
+++ b/ui/dbus-listener.c
@@ -102,6 +102,14 @@ static void dbus_call_update_gl(DBusDisplayListener *ddl,
     }
 }
 
+static QEMUGLContext dbus_create_context(DisplayChangeListener *dcl,
+                                         QEMUGLParams *params)
+{
+    eglMakeCurrent(qemu_egl_display, EGL_NO_SURFACE, EGL_NO_SURFACE,
+                   qemu_egl_rn_ctx);
+    return qemu_egl_create_context(dcl, params);
+}
+
 static void dbus_scanout_disable(DisplayChangeListener *dcl)
 {
     DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
@@ -463,7 +471,7 @@ static void dbus_cursor_define(DisplayChangeListener *dcl,
     }
 }
 
-const DisplayChangeListenerOps dbus_gl_dcl_ops = {
+static const DisplayChangeListenerOps dbus_gl_dcl_ops = {
     .dpy_name                = "dbus-gl",
     .dpy_gfx_update          = dbus_gl_gfx_update,
     .dpy_gfx_switch          = dbus_gl_gfx_switch,
@@ -472,6 +480,10 @@ const DisplayChangeListenerOps dbus_gl_dcl_ops = {
     .dpy_mouse_set           = dbus_mouse_set,
     .dpy_cursor_define       = dbus_cursor_define,
 
+    .dpy_gl_ctx_create       = dbus_create_context,
+    .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
+    .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
+
     .dpy_gl_scanout_disable  = dbus_scanout_disable,
     .dpy_gl_scanout_texture  = dbus_scanout_texture,
     .dpy_gl_scanout_dmabuf   = dbus_scanout_dmabuf,
@@ -481,7 +493,7 @@ const DisplayChangeListenerOps dbus_gl_dcl_ops = {
     .dpy_gl_update           = dbus_scanout_update,
 };
 
-const DisplayChangeListenerOps dbus_dcl_ops = {
+static const DisplayChangeListenerOps dbus_dcl_ops = {
     .dpy_name                = "dbus",
     .dpy_gfx_update          = dbus_gfx_update,
     .dpy_gfx_switch          = dbus_gfx_switch,
diff --git a/ui/dbus.c b/ui/dbus.c
index 0074424c1fe..040a2a3fd8b 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -30,7 +30,6 @@
 #include "sysemu/sysemu.h"
 #include "ui/dbus-module.h"
 #include "ui/egl-helpers.h"
-#include "ui/egl-context.h"
 #include "audio/audio.h"
 #include "audio/audio_int.h"
 #include "qapi/error.h"
@@ -40,21 +39,6 @@
 
 static DBusDisplay *dbus_display;
 
-static QEMUGLContext dbus_create_context(DisplayGLCtx *dgc,
-                                         QEMUGLParams *params)
-{
-    eglMakeCurrent(qemu_egl_display, EGL_NO_SURFACE, EGL_NO_SURFACE,
-                   qemu_egl_rn_ctx);
-    return qemu_egl_create_context(dgc, params);
-}
-
-static const DisplayGLCtxOps dbus_gl_ops = {
-    .compatible_dcl          = &dbus_gl_dcl_ops,
-    .dpy_gl_ctx_create       = dbus_create_context,
-    .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
-    .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
-};
-
 static NotifierList dbus_display_notifiers =
     NOTIFIER_LIST_INITIALIZER(dbus_display_notifiers);
 
@@ -82,7 +66,6 @@ dbus_display_init(Object *o)
     DBusDisplay *dd = DBUS_DISPLAY(o);
     g_autoptr(GDBusObjectSkeleton) vm = NULL;
 
-    dd->glctx.ops = &dbus_gl_ops;
     dd->iface = qemu_dbus_display1_vm_skeleton_new();
     dd->consoles = g_ptr_array_new_with_free_func(g_object_unref);
 
@@ -131,11 +114,6 @@ dbus_display_add_console(DBusDisplay *dd, int idx, Error **errp)
     con = qemu_console_lookup_by_index(idx);
     assert(con);
 
-    if (qemu_console_is_graphic(con) &&
-        dd->gl_mode != DISPLAYGL_MODE_OFF) {
-        qemu_console_set_display_gl_ctx(con, &dd->glctx);
-    }
-
     dbus_console = dbus_display_console_new(dd, con);
     g_ptr_array_insert(dd->consoles, idx, dbus_console);
     g_dbus_object_manager_server_export(dd->server,
diff --git a/ui/dbus.h b/ui/dbus.h
index fd24b299bbf..a6c7dd84287 100644
--- a/ui/dbus.h
+++ b/ui/dbus.h
@@ -45,7 +45,6 @@ struct DBusDisplay {
     bool p2p;
     char *dbus_addr;
     char *audiodev;
-    DisplayGLCtx glctx;
 
     GDBusConnection *bus;
     GDBusObjectManagerServer *server;
@@ -119,9 +118,6 @@ dbus_display_listener_connection_get_console(DBusDisplayListenerConnection *ddlc
 const char *
 dbus_display_listener_connection_get_bus_name(DBusDisplayListenerConnection *ddlc);
 
-extern const DisplayChangeListenerOps dbus_gl_dcl_ops;
-extern const DisplayChangeListenerOps dbus_dcl_ops;
-
 #define TYPE_CHARDEV_DBUS "chardev-dbus"
 
 typedef struct DBusChardevClass {
diff --git a/ui/egl-context.c b/ui/egl-context.c
index eb5f520fc4d..368ffa49d82 100644
--- a/ui/egl-context.c
+++ b/ui/egl-context.c
@@ -1,7 +1,7 @@
 #include "qemu/osdep.h"
 #include "ui/egl-context.h"
 
-QEMUGLContext qemu_egl_create_context(DisplayGLCtx *dgc,
+QEMUGLContext qemu_egl_create_context(DisplayChangeListener *dcl,
                                       QEMUGLParams *params)
 {
    EGLContext ctx;
@@ -24,12 +24,12 @@ QEMUGLContext qemu_egl_create_context(DisplayGLCtx *dgc,
    return ctx;
 }
 
-void qemu_egl_destroy_context(DisplayGLCtx *dgc, QEMUGLContext ctx)
+void qemu_egl_destroy_context(DisplayChangeListener *dcl, QEMUGLContext ctx)
 {
     eglDestroyContext(qemu_egl_display, ctx);
 }
 
-int qemu_egl_make_context_current(DisplayGLCtx *dgc,
+int qemu_egl_make_context_current(DisplayChangeListener *dcl,
                                   QEMUGLContext ctx)
 {
    return eglMakeCurrent(qemu_egl_display,
diff --git a/ui/egl-headless.c b/ui/egl-headless.c
index 94082a9da95..08327c40c6e 100644
--- a/ui/egl-headless.c
+++ b/ui/egl-headless.c
@@ -38,12 +38,12 @@ static void egl_gfx_switch(DisplayChangeListener *dcl,
     edpy->ds = new_surface;
 }
 
-static QEMUGLContext egl_create_context(DisplayGLCtx *dgc,
+static QEMUGLContext egl_create_context(DisplayChangeListener *dcl,
                                         QEMUGLParams *params)
 {
     eglMakeCurrent(qemu_egl_display, EGL_NO_SURFACE, EGL_NO_SURFACE,
                    qemu_egl_rn_ctx);
-    return qemu_egl_create_context(dgc, params);
+    return qemu_egl_create_context(dcl, params);
 }
 
 static void egl_scanout_disable(DisplayChangeListener *dcl)
@@ -157,6 +157,10 @@ static const DisplayChangeListenerOps egl_ops = {
     .dpy_gfx_update          = egl_gfx_update,
     .dpy_gfx_switch          = egl_gfx_switch,
 
+    .dpy_gl_ctx_create       = egl_create_context,
+    .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
+    .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
+
     .dpy_gl_scanout_disable  = egl_scanout_disable,
     .dpy_gl_scanout_texture  = egl_scanout_texture,
     .dpy_gl_scanout_dmabuf   = egl_scanout_dmabuf,
@@ -166,13 +170,6 @@ static const DisplayChangeListenerOps egl_ops = {
     .dpy_gl_update           = egl_scanout_flush,
 };
 
-static const DisplayGLCtxOps eglctx_ops = {
-    .compatible_dcl          = &egl_ops,
-    .dpy_gl_ctx_create       = egl_create_context,
-    .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
-    .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
-};
-
 static void early_egl_headless_init(DisplayOptions *opts)
 {
     display_opengl = 1;
@@ -191,8 +188,6 @@ static void egl_headless_init(DisplayState *ds, DisplayOptions *opts)
     }
 
     for (idx = 0;; idx++) {
-        DisplayGLCtx *ctx;
-
         con = qemu_console_lookup_by_index(idx);
         if (!con || !qemu_console_is_graphic(con)) {
             break;
@@ -202,9 +197,7 @@ static void egl_headless_init(DisplayState *ds, DisplayOptions *opts)
         edpy->dcl.con = con;
         edpy->dcl.ops = &egl_ops;
         edpy->gls = qemu_gl_init_shader();
-        ctx = g_new0(DisplayGLCtx, 1);
-        ctx->ops = &eglctx_ops;
-        qemu_console_set_display_gl_ctx(con, ctx);
+        qemu_console_set_display_gl_ctx(con, &edpy->dcl);
         register_displaychangelistener(&edpy->dcl);
     }
 }
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index e3bd4bc2743..e891b61048a 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -197,14 +197,14 @@ void gd_egl_switch(DisplayChangeListener *dcl,
     }
 }
 
-QEMUGLContext gd_egl_create_context(DisplayGLCtx *dgc,
+QEMUGLContext gd_egl_create_context(DisplayChangeListener *dcl,
                                     QEMUGLParams *params)
 {
-    VirtualConsole *vc = container_of(dgc, VirtualConsole, gfx.dgc);
+    VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
     eglMakeCurrent(qemu_egl_display, vc->gfx.esurface,
                    vc->gfx.esurface, vc->gfx.ectx);
-    return qemu_egl_create_context(dgc, params);
+    return qemu_egl_create_context(dcl, params);
 }
 
 void gd_egl_scanout_disable(DisplayChangeListener *dcl)
@@ -360,10 +360,10 @@ void gtk_egl_init(DisplayGLMode mode)
     display_opengl = 1;
 }
 
-int gd_egl_make_current(DisplayGLCtx *dgc,
+int gd_egl_make_current(DisplayChangeListener *dcl,
                         QEMUGLContext ctx)
 {
-    VirtualConsole *vc = container_of(dgc, VirtualConsole, gfx.dgc);
+    VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
     return eglMakeCurrent(qemu_egl_display, vc->gfx.esurface,
                           vc->gfx.esurface, ctx);
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index fc5a082eb84..f1c7636cba9 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -170,10 +170,10 @@ void gd_gl_area_switch(DisplayChangeListener *dcl,
     }
 }
 
-QEMUGLContext gd_gl_area_create_context(DisplayGLCtx *dgc,
+QEMUGLContext gd_gl_area_create_context(DisplayChangeListener *dcl,
                                         QEMUGLParams *params)
 {
-    VirtualConsole *vc = container_of(dgc, VirtualConsole, gfx.dgc);
+    VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
     GdkWindow *window;
     GdkGLContext *ctx;
     GError *err = NULL;
@@ -199,7 +199,7 @@ QEMUGLContext gd_gl_area_create_context(DisplayGLCtx *dgc,
     return ctx;
 }
 
-void gd_gl_area_destroy_context(DisplayGLCtx *dgc, QEMUGLContext ctx)
+void gd_gl_area_destroy_context(DisplayChangeListener *dcl, QEMUGLContext ctx)
 {
     /* FIXME */
 }
@@ -278,7 +278,7 @@ void gtk_gl_area_init(void)
     display_opengl = 1;
 }
 
-int gd_gl_area_make_current(DisplayGLCtx *dgc,
+int gd_gl_area_make_current(DisplayChangeListener *dcl,
                             QEMUGLContext ctx)
 {
     gdk_gl_context_make_current(ctx);
diff --git a/ui/gtk.c b/ui/gtk.c
index a8567b9ddc8..ca29dde6cbd 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -606,6 +606,9 @@ static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_mouse_set        = gd_mouse_set,
     .dpy_cursor_define    = gd_cursor_define,
 
+    .dpy_gl_ctx_create       = gd_gl_area_create_context,
+    .dpy_gl_ctx_destroy      = gd_gl_area_destroy_context,
+    .dpy_gl_ctx_make_current = gd_gl_area_make_current,
     .dpy_gl_scanout_texture  = gd_gl_area_scanout_texture,
     .dpy_gl_scanout_disable  = gd_gl_area_scanout_disable,
     .dpy_gl_update           = gd_gl_area_scanout_flush,
@@ -614,14 +617,8 @@ static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_has_dmabuf          = gd_has_dmabuf,
 };
 
-static const DisplayGLCtxOps gl_area_ctx_ops = {
-    .compatible_dcl          = &dcl_gl_area_ops,
-    .dpy_gl_ctx_create       = gd_gl_area_create_context,
-    .dpy_gl_ctx_destroy      = gd_gl_area_destroy_context,
-    .dpy_gl_ctx_make_current = gd_gl_area_make_current,
-};
-
 #ifdef CONFIG_X11
+
 static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_name             = "gtk-egl",
     .dpy_gfx_update       = gd_egl_update,
@@ -631,6 +628,9 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_mouse_set        = gd_mouse_set,
     .dpy_cursor_define    = gd_cursor_define,
 
+    .dpy_gl_ctx_create       = gd_egl_create_context,
+    .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
+    .dpy_gl_ctx_make_current = gd_egl_make_current,
     .dpy_gl_scanout_disable  = gd_egl_scanout_disable,
     .dpy_gl_scanout_texture  = gd_egl_scanout_texture,
     .dpy_gl_scanout_dmabuf   = gd_egl_scanout_dmabuf,
@@ -641,12 +641,6 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_has_dmabuf          = gd_has_dmabuf,
 };
 
-static const DisplayGLCtxOps egl_ctx_ops = {
-    .compatible_dcl          = &dcl_egl_ops,
-    .dpy_gl_ctx_create       = gd_egl_create_context,
-    .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
-    .dpy_gl_ctx_make_current = gd_egl_make_current,
-};
 #endif
 
 #endif /* CONFIG_OPENGL */
@@ -2070,7 +2064,6 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
             g_signal_connect(vc->gfx.drawing_area, "realize",
                              G_CALLBACK(gl_area_realize), vc);
             vc->gfx.dcl.ops = &dcl_gl_area_ops;
-            vc->gfx.dgc.ops = &gl_area_ctx_ops;
         } else {
 #ifdef CONFIG_X11
             vc->gfx.drawing_area = gtk_drawing_area_new();
@@ -2085,7 +2078,6 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
             gtk_widget_set_double_buffered(vc->gfx.drawing_area, FALSE);
 #pragma GCC diagnostic pop
             vc->gfx.dcl.ops = &dcl_egl_ops;
-            vc->gfx.dgc.ops = &egl_ctx_ops;
             vc->gfx.has_dmabuf = qemu_egl_has_dmabuf();
 #else
             abort();
@@ -2121,7 +2113,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
     vc->gfx.dcl.con = con;
 
     if (display_opengl) {
-        qemu_console_set_display_gl_ctx(con, &vc->gfx.dgc);
+        qemu_console_set_display_gl_ctx(con, &vc->gfx.dcl);
     }
     register_displaychangelistener(&vc->gfx.dcl);
 
diff --git a/ui/sdl2-gl.c b/ui/sdl2-gl.c
index 39cab8cde73..5b950fbbea2 100644
--- a/ui/sdl2-gl.c
+++ b/ui/sdl2-gl.c
@@ -132,10 +132,10 @@ void sdl2_gl_redraw(struct sdl2_console *scon)
     }
 }
 
-QEMUGLContext sdl2_gl_create_context(DisplayGLCtx *dgc,
+QEMUGLContext sdl2_gl_create_context(DisplayChangeListener *dcl,
                                      QEMUGLParams *params)
 {
-    struct sdl2_console *scon = container_of(dgc, struct sdl2_console, dgc);
+    struct sdl2_console *scon = container_of(dcl, struct sdl2_console, dcl);
     SDL_GLContext ctx;
 
     assert(scon->opengl);
@@ -167,17 +167,17 @@ QEMUGLContext sdl2_gl_create_context(DisplayGLCtx *dgc,
     return (QEMUGLContext)ctx;
 }
 
-void sdl2_gl_destroy_context(DisplayGLCtx *dgc, QEMUGLContext ctx)
+void sdl2_gl_destroy_context(DisplayChangeListener *dcl, QEMUGLContext ctx)
 {
     SDL_GLContext sdlctx = (SDL_GLContext)ctx;
 
     SDL_GL_DeleteContext(sdlctx);
 }
 
-int sdl2_gl_make_context_current(DisplayGLCtx *dgc,
+int sdl2_gl_make_context_current(DisplayChangeListener *dcl,
                                  QEMUGLContext ctx)
 {
-    struct sdl2_console *scon = container_of(dgc, struct sdl2_console, dgc);
+    struct sdl2_console *scon = container_of(dcl, struct sdl2_console, dcl);
     SDL_GLContext sdlctx = (SDL_GLContext)ctx;
 
     assert(scon->opengl);
diff --git a/ui/sdl2.c b/ui/sdl2.c
index 46a252d7d9d..628ae33245f 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -783,16 +783,12 @@ static const DisplayChangeListenerOps dcl_gl_ops = {
     .dpy_mouse_set           = sdl_mouse_warp,
     .dpy_cursor_define       = sdl_mouse_define,
 
-    .dpy_gl_scanout_disable  = sdl2_gl_scanout_disable,
-    .dpy_gl_scanout_texture  = sdl2_gl_scanout_texture,
-    .dpy_gl_update           = sdl2_gl_scanout_flush,
-};
-
-static const DisplayGLCtxOps gl_ctx_ops = {
-    .compatible_dcl          = &dcl_gl_ops,
     .dpy_gl_ctx_create       = sdl2_gl_create_context,
     .dpy_gl_ctx_destroy      = sdl2_gl_destroy_context,
     .dpy_gl_ctx_make_current = sdl2_gl_make_context_current,
+    .dpy_gl_scanout_disable  = sdl2_gl_scanout_disable,
+    .dpy_gl_scanout_texture  = sdl2_gl_scanout_texture,
+    .dpy_gl_update           = sdl2_gl_scanout_flush,
 };
 #endif
 
@@ -869,7 +865,6 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
 #ifdef CONFIG_OPENGL
         sdl2_console[i].opengl = display_opengl;
         sdl2_console[i].dcl.ops = display_opengl ? &dcl_gl_ops : &dcl_2d_ops;
-        sdl2_console[i].dgc.ops = display_opengl ? &gl_ctx_ops : NULL;
 #else
         sdl2_console[i].opengl = 0;
         sdl2_console[i].dcl.ops = &dcl_2d_ops;
@@ -877,7 +872,7 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
         sdl2_console[i].dcl.con = con;
         sdl2_console[i].kbd = qkbd_state_init(con);
         if (display_opengl) {
-            qemu_console_set_display_gl_ctx(con, &sdl2_console[i].dgc);
+            qemu_console_set_display_gl_ctx(con, &sdl2_console[i].dcl);
         }
         register_displaychangelistener(&sdl2_console[i].dcl);
 
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 1043f47f945..bf057bc95f5 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -908,12 +908,12 @@ static void spice_gl_switch(DisplayChangeListener *dcl,
     }
 }
 
-static QEMUGLContext qemu_spice_gl_create_context(DisplayGLCtx *dgc,
+static QEMUGLContext qemu_spice_gl_create_context(DisplayChangeListener *dcl,
                                                   QEMUGLParams *params)
 {
     eglMakeCurrent(qemu_egl_display, EGL_NO_SURFACE, EGL_NO_SURFACE,
                    qemu_egl_rn_ctx);
-    return qemu_egl_create_context(dgc, params);
+    return qemu_egl_create_context(dcl, params);
 }
 
 static void qemu_spice_gl_scanout_disable(DisplayChangeListener *dcl)
@@ -1105,6 +1105,10 @@ static const DisplayChangeListenerOps display_listener_gl_ops = {
     .dpy_mouse_set           = display_mouse_set,
     .dpy_cursor_define       = display_mouse_define,
 
+    .dpy_gl_ctx_create       = qemu_spice_gl_create_context,
+    .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
+    .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
+
     .dpy_gl_scanout_disable  = qemu_spice_gl_scanout_disable,
     .dpy_gl_scanout_texture  = qemu_spice_gl_scanout_texture,
     .dpy_gl_scanout_dmabuf   = qemu_spice_gl_scanout_dmabuf,
@@ -1114,13 +1118,6 @@ static const DisplayChangeListenerOps display_listener_gl_ops = {
     .dpy_gl_update           = qemu_spice_gl_update,
 };
 
-static const DisplayGLCtxOps gl_ctx_ops = {
-    .compatible_dcl          = &display_listener_gl_ops,
-    .dpy_gl_ctx_create       = qemu_spice_gl_create_context,
-    .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
-    .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
-};
-
 #endif /* HAVE_SPICE_GL */
 
 static void qemu_spice_display_init_one(QemuConsole *con)
@@ -1133,7 +1130,6 @@ static void qemu_spice_display_init_one(QemuConsole *con)
 #ifdef HAVE_SPICE_GL
     if (spice_opengl) {
         ssd->dcl.ops = &display_listener_gl_ops;
-        ssd->dgc.ops = &gl_ctx_ops;
         ssd->gl_unblock_bh = qemu_bh_new(qemu_spice_gl_unblock_bh, ssd);
         ssd->gl_unblock_timer = timer_new_ms(QEMU_CLOCK_REALTIME,
                                              qemu_spice_gl_block_timer, ssd);
@@ -1163,7 +1159,7 @@ static void qemu_spice_display_init_one(QemuConsole *con)
     qemu_spice_create_host_memslot(ssd);
 
     if (spice_opengl) {
-        qemu_console_set_display_gl_ctx(con, &ssd->dgc);
+        qemu_console_set_display_gl_ctx(con, &ssd->dcl);
     }
     register_displaychangelistener(&ssd->dcl);
 }
-- 
2.32.0 (Apple Git-132)



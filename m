Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 103CC31F6C9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 10:50:58 +0100 (CET)
Received: from localhost ([::1]:41966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD2R7-0007J8-2v
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 04:50:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD2NW-00042U-Ja
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:47:14 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD2NU-0008S0-7D
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:47:14 -0500
Received: by mail-pl1-x630.google.com with SMTP id d13so3088658plg.0
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 01:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ex5kmAen+OVpKYF+AlPg+DNhxWVi0qpCDvMpTmugDSo=;
 b=aKOUQMxLSMJ5PNRx4a38231j6ofe+opZ6tKvd657lQtXVnxewidCKpOt9GU6xpFgJa
 tLoaPc4WtgGTVjDaajQhfyfbbvGQWMj8+yY0GmmDlWcds7x9I7M2KzMTAKq057LMjnbB
 nFMzAGcyB/d85vu7Qz0VxLTNX8MpjTiB2bikRdP3U3NtvtqYSSGQLIITJNKk868JdXwX
 BuGWf4pHjQ/jQr8ItNLTkiEhHM7NckWXMRI+5p3EorerF/IWcfkW+6q1+uau52bFXHgZ
 KXtW8YlcosjVg9IaKtG/JxbmlimWurSXbqvR3BHN933USkln2YkA9hutDDwUEjGKGcHg
 I6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ex5kmAen+OVpKYF+AlPg+DNhxWVi0qpCDvMpTmugDSo=;
 b=MBASVzKSLX+86jAmX0WTSo37smtNi5B4X0/NGDHGaQipnB/G32gqd+eHGUj22RaeNC
 iwabqeYiIVaLgsYUyhD4BcPH+NlVXCxfqllRhPQ2ayXgadQI2cS1MVwLFYKDozwAf5aw
 XDP91rWypY7tPSsOHfEsTbOFRSQRm5svZukDjam0OUCqaWHclE+XHbnlzh7Fu/LdYQ+d
 TyNaUuZn35FxtdopuPPFSFCZde2Iy/F5FZotpVOtQpOqp3NyBb+buf6Tv1wCsO0pZMyU
 gNvF94w7OMK51JhJiPSNEIbiEYZCKyGXZptxlvEgtN3jSHdwmRdpy19gt+Hr2+2Hxy1+
 7tpQ==
X-Gm-Message-State: AOAM530Y3TMLJBIBgEattb0D0lutmpBo1rKrdkLjzhFUDg9B9O+pjwNm
 Ey6iiuth7kQLANoPb4SaXai6GLU3WyCfUA==
X-Google-Smtp-Source: ABdhPJzMEP8Zm8Kr0w7oujcQGWRNnlMGV0h6LG07G197FE/RzfLhq4J0Tl0wKY3UifYuXyEgG7Di4Q==
X-Received: by 2002:a17:902:7782:b029:e3:2881:9eeb with SMTP id
 o2-20020a1709027782b02900e328819eebmr8144439pll.29.1613728029376; 
 Fri, 19 Feb 2021 01:47:09 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d8f0:71c1:3d6a:4f53])
 by smtp.gmail.com with ESMTPSA id g3sm9017068pfq.42.2021.02.19.01.47.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 01:47:09 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/console: Remove dpy_gl_ctx_get_current
Date: Fri, 19 Feb 2021 18:47:02 +0900
Message-Id: <20210219094702.90789-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is not used, and it is unlikely that a new use case will emerge
anytime soon because the scope of OpenGL contexts are limited due to
the nature of the frontend, VirGL, processing simple commands from the
guest.

Remove the function and ease implementing a new OpenGL backend a little.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 include/ui/console.h     | 2 --
 include/ui/egl-context.h | 1 -
 include/ui/gtk.h         | 1 -
 include/ui/sdl2.h        | 1 -
 ui/console.c             | 6 ------
 ui/egl-context.c         | 5 -----
 ui/egl-headless.c        | 1 -
 ui/gtk-gl-area.c         | 5 -----
 ui/gtk.c                 | 2 --
 ui/sdl2-gl.c             | 8 --------
 ui/sdl2.c                | 1 -
 ui/spice-display.c       | 1 -
 12 files changed, 34 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 5dd21976a37..f81ad1c5693 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -201,7 +201,6 @@ typedef struct DisplayChangeListenerOps {
                                QEMUGLContext ctx);
     int (*dpy_gl_ctx_make_current)(DisplayChangeListener *dcl,
                                    QEMUGLContext ctx);
-    QEMUGLContext (*dpy_gl_ctx_get_current)(DisplayChangeListener *dcl);
 
     void (*dpy_gl_scanout_disable)(DisplayChangeListener *dcl);
     void (*dpy_gl_scanout_texture)(DisplayChangeListener *dcl,
@@ -303,7 +302,6 @@ QEMUGLContext dpy_gl_ctx_create(QemuConsole *con,
                                 QEMUGLParams *params);
 void dpy_gl_ctx_destroy(QemuConsole *con, QEMUGLContext ctx);
 int dpy_gl_ctx_make_current(QemuConsole *con, QEMUGLContext ctx);
-QEMUGLContext dpy_gl_ctx_get_current(QemuConsole *con);
 
 bool console_has_gl(QemuConsole *con);
 bool console_has_gl_dmabuf(QemuConsole *con);
diff --git a/include/ui/egl-context.h b/include/ui/egl-context.h
index f004ce11a7b..9374fe41e32 100644
--- a/include/ui/egl-context.h
+++ b/include/ui/egl-context.h
@@ -9,6 +9,5 @@ QEMUGLContext qemu_egl_create_context(DisplayChangeListener *dcl,
 void qemu_egl_destroy_context(DisplayChangeListener *dcl, QEMUGLContext ctx);
 int qemu_egl_make_context_current(DisplayChangeListener *dcl,
                                   QEMUGLContext ctx);
-QEMUGLContext qemu_egl_get_current_context(DisplayChangeListener *dcl);
 
 #endif /* EGL_CONTEXT_H */
diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 3f395d7f943..c82c4a569a6 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -143,7 +143,6 @@ void gd_gl_area_scanout_texture(DisplayChangeListener *dcl,
 void gd_gl_area_scanout_flush(DisplayChangeListener *dcl,
                               uint32_t x, uint32_t y, uint32_t w, uint32_t h);
 void gtk_gl_area_init(void);
-QEMUGLContext gd_gl_area_get_current_context(DisplayChangeListener *dcl);
 int gd_gl_area_make_current(DisplayChangeListener *dcl,
                             QEMUGLContext ctx);
 
diff --git a/include/ui/sdl2.h b/include/ui/sdl2.h
index 0875b8d56b7..f85c117a78f 100644
--- a/include/ui/sdl2.h
+++ b/include/ui/sdl2.h
@@ -70,7 +70,6 @@ QEMUGLContext sdl2_gl_create_context(DisplayChangeListener *dcl,
 void sdl2_gl_destroy_context(DisplayChangeListener *dcl, QEMUGLContext ctx);
 int sdl2_gl_make_context_current(DisplayChangeListener *dcl,
                                  QEMUGLContext ctx);
-QEMUGLContext sdl2_gl_get_current_context(DisplayChangeListener *dcl);
 
 void sdl2_gl_scanout_disable(DisplayChangeListener *dcl);
 void sdl2_gl_scanout_texture(DisplayChangeListener *dcl,
diff --git a/ui/console.c b/ui/console.c
index d80ce7037c3..c0b1a3689c3 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1803,12 +1803,6 @@ int dpy_gl_ctx_make_current(QemuConsole *con, QEMUGLContext ctx)
     return con->gl->ops->dpy_gl_ctx_make_current(con->gl, ctx);
 }
 
-QEMUGLContext dpy_gl_ctx_get_current(QemuConsole *con)
-{
-    assert(con->gl);
-    return con->gl->ops->dpy_gl_ctx_get_current(con->gl);
-}
-
 void dpy_gl_scanout_disable(QemuConsole *con)
 {
     assert(con->gl);
diff --git a/ui/egl-context.c b/ui/egl-context.c
index 4aa1cbb50c2..368ffa49d82 100644
--- a/ui/egl-context.c
+++ b/ui/egl-context.c
@@ -35,8 +35,3 @@ int qemu_egl_make_context_current(DisplayChangeListener *dcl,
    return eglMakeCurrent(qemu_egl_display,
                          EGL_NO_SURFACE, EGL_NO_SURFACE, ctx);
 }
-
-QEMUGLContext qemu_egl_get_current_context(DisplayChangeListener *dcl)
-{
-    return eglGetCurrentContext();
-}
diff --git a/ui/egl-headless.c b/ui/egl-headless.c
index fe2a0d1eab9..da377a74af6 100644
--- a/ui/egl-headless.c
+++ b/ui/egl-headless.c
@@ -160,7 +160,6 @@ static const DisplayChangeListenerOps egl_ops = {
     .dpy_gl_ctx_create       = egl_create_context,
     .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
     .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
-    .dpy_gl_ctx_get_current  = qemu_egl_get_current_context,
 
     .dpy_gl_scanout_disable  = egl_scanout_disable,
     .dpy_gl_scanout_texture  = egl_scanout_texture,
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 98c22d23f50..169a06f828a 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -211,11 +211,6 @@ void gtk_gl_area_init(void)
     display_opengl = 1;
 }
 
-QEMUGLContext gd_gl_area_get_current_context(DisplayChangeListener *dcl)
-{
-    return gdk_gl_context_get_current();
-}
-
 int gd_gl_area_make_current(DisplayChangeListener *dcl,
                             QEMUGLContext ctx)
 {
diff --git a/ui/gtk.c b/ui/gtk.c
index 26665cd2e65..96629c3085a 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -639,7 +639,6 @@ static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_gl_ctx_create       = gd_gl_area_create_context,
     .dpy_gl_ctx_destroy      = gd_gl_area_destroy_context,
     .dpy_gl_ctx_make_current = gd_gl_area_make_current,
-    .dpy_gl_ctx_get_current  = gd_gl_area_get_current_context,
     .dpy_gl_scanout_texture  = gd_gl_area_scanout_texture,
     .dpy_gl_update           = gd_gl_area_scanout_flush,
 };
@@ -658,7 +657,6 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_gl_ctx_create       = gd_egl_create_context,
     .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
     .dpy_gl_ctx_make_current = gd_egl_make_current,
-    .dpy_gl_ctx_get_current  = qemu_egl_get_current_context,
     .dpy_gl_scanout_disable  = gd_egl_scanout_disable,
     .dpy_gl_scanout_texture  = gd_egl_scanout_texture,
     .dpy_gl_scanout_dmabuf   = gd_egl_scanout_dmabuf,
diff --git a/ui/sdl2-gl.c b/ui/sdl2-gl.c
index c73d273bf80..82139ba49e8 100644
--- a/ui/sdl2-gl.c
+++ b/ui/sdl2-gl.c
@@ -185,14 +185,6 @@ int sdl2_gl_make_context_current(DisplayChangeListener *dcl,
     return SDL_GL_MakeCurrent(scon->real_window, sdlctx);
 }
 
-QEMUGLContext sdl2_gl_get_current_context(DisplayChangeListener *dcl)
-{
-    SDL_GLContext sdlctx;
-
-    sdlctx = SDL_GL_GetCurrentContext();
-    return (QEMUGLContext)sdlctx;
-}
-
 void sdl2_gl_scanout_disable(DisplayChangeListener *dcl)
 {
     struct sdl2_console *scon = container_of(dcl, struct sdl2_console, dcl);
diff --git a/ui/sdl2.c b/ui/sdl2.c
index 5e49709283e..a203cb0239e 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -781,7 +781,6 @@ static const DisplayChangeListenerOps dcl_gl_ops = {
     .dpy_gl_ctx_create       = sdl2_gl_create_context,
     .dpy_gl_ctx_destroy      = sdl2_gl_destroy_context,
     .dpy_gl_ctx_make_current = sdl2_gl_make_context_current,
-    .dpy_gl_ctx_get_current  = sdl2_gl_get_current_context,
     .dpy_gl_scanout_disable  = sdl2_gl_scanout_disable,
     .dpy_gl_scanout_texture  = sdl2_gl_scanout_texture,
     .dpy_gl_update           = sdl2_gl_scanout_flush,
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 0178d5766d2..6a5e189a672 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -1102,7 +1102,6 @@ static const DisplayChangeListenerOps display_listener_gl_ops = {
     .dpy_gl_ctx_create       = qemu_spice_gl_create_context,
     .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
     .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
-    .dpy_gl_ctx_get_current  = qemu_egl_get_current_context,
 
     .dpy_gl_scanout_disable  = qemu_spice_gl_scanout_disable,
     .dpy_gl_scanout_texture  = qemu_spice_gl_scanout_texture,
-- 
2.24.3 (Apple Git-128)



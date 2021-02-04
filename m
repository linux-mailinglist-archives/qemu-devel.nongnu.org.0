Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232C930F147
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:55:56 +0100 (CET)
Received: from localhost ([::1]:54558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cIl-0008KG-6F
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l7cGu-0006ai-EH
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:54:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l7cGs-0007n7-FY
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:54:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612436037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ufzcxut9hqsDbgsGTw4h3BfUlLSPZwvpQca4XVetbak=;
 b=NCkRYc9ehTE4jMVXmrtr9aD1P1qC8iKBjYrPQnvdEiidFtwRDQNAYUxwVB7EXGhYQpsm+A
 EYt/jT9jx7Lk95F/FURYoprKE67fsnztrF8YUHpW62ahFLDfUIojnLo7JjqLk1ibR8GOjt
 iUX1HT34ZeVpZhlFuZEN6HyyMfDlh7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-WSHMVjhjPICGdWorSw-Yyw-1; Thu, 04 Feb 2021 05:53:56 -0500
X-MC-Unique: WSHMVjhjPICGdWorSw-Yyw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 207091084D9E
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 10:53:55 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19DD95B695;
 Thu,  4 Feb 2021 10:53:41 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/20] ui: remove gl_ctx_get_current
Date: Thu,  4 Feb 2021 14:52:18 +0400
Message-Id: <20210204105232.834642-7-marcandre.lureau@redhat.com>
In-Reply-To: <20210204105232.834642-1-marcandre.lureau@redhat.com>
References: <20210204105232.834642-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

There are no users left.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h     | 2 --
 include/ui/egl-context.h | 1 -
 include/ui/sdl2.h        | 1 -
 ui/console.c             | 6 ------
 ui/egl-context.c         | 5 -----
 ui/egl-headless.c        | 1 -
 ui/gtk.c                 | 2 --
 ui/sdl2-gl.c             | 8 --------
 ui/sdl2.c                | 1 -
 ui/spice-display.c       | 1 -
 10 files changed, 28 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 7a3fc11abf..ce6c72e37c 100644
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
index f004ce11a7..9374fe41e3 100644
--- a/include/ui/egl-context.h
+++ b/include/ui/egl-context.h
@@ -9,6 +9,5 @@ QEMUGLContext qemu_egl_create_context(DisplayChangeListener *dcl,
 void qemu_egl_destroy_context(DisplayChangeListener *dcl, QEMUGLContext ctx);
 int qemu_egl_make_context_current(DisplayChangeListener *dcl,
                                   QEMUGLContext ctx);
-QEMUGLContext qemu_egl_get_current_context(DisplayChangeListener *dcl);
 
 #endif /* EGL_CONTEXT_H */
diff --git a/include/ui/sdl2.h b/include/ui/sdl2.h
index 0875b8d56b..f85c117a78 100644
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
index d80ce7037c..c0b1a3689c 100644
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
index 4aa1cbb50c..368ffa49d8 100644
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
index fe2a0d1eab..da377a74af 100644
--- a/ui/egl-headless.c
+++ b/ui/egl-headless.c
@@ -160,7 +160,6 @@ static const DisplayChangeListenerOps egl_ops = {
     .dpy_gl_ctx_create       = egl_create_context,
     .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
     .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
-    .dpy_gl_ctx_get_current  = qemu_egl_get_current_context,
 
     .dpy_gl_scanout_disable  = egl_scanout_disable,
     .dpy_gl_scanout_texture  = egl_scanout_texture,
diff --git a/ui/gtk.c b/ui/gtk.c
index e1ee0840b3..a0e6b60ac4 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -637,7 +637,6 @@ static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_gl_ctx_create       = gd_gl_area_create_context,
     .dpy_gl_ctx_destroy      = gd_gl_area_destroy_context,
     .dpy_gl_ctx_make_current = gd_gl_area_make_current,
-    .dpy_gl_ctx_get_current  = gd_gl_area_get_current_context,
     .dpy_gl_scanout_texture  = gd_gl_area_scanout_texture,
     .dpy_gl_update           = gd_gl_area_scanout_flush,
 };
@@ -654,7 +653,6 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_gl_ctx_create       = gd_egl_create_context,
     .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
     .dpy_gl_ctx_make_current = gd_egl_make_current,
-    .dpy_gl_ctx_get_current  = qemu_egl_get_current_context,
     .dpy_gl_scanout_disable  = gd_egl_scanout_disable,
     .dpy_gl_scanout_texture  = gd_egl_scanout_texture,
     .dpy_gl_scanout_dmabuf   = gd_egl_scanout_dmabuf,
diff --git a/ui/sdl2-gl.c b/ui/sdl2-gl.c
index c73d273bf8..82139ba49e 100644
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
index 5e49709283..a203cb0239 100644
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
index 0178d5766d..6a5e189a67 100644
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
2.29.0



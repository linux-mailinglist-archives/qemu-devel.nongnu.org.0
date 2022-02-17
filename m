Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598024BA023
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:29:52 +0100 (CET)
Received: from localhost ([::1]:37162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKfux-0002Xb-ES
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:29:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nKfT8-0008Ac-P0
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:01:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nKfT6-0001e9-Kq
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:01:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645099264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=07fm8LkSpDlrVD4DOtbSfH4o9GmCmMBJi3+LNFNUmSk=;
 b=C9VAxDLW/JWZZ8N4IbKpWvDb45ueI5AZM5aInh2dXUo+H1+/HkpIAJT3wOEXDr5hcdSGAH
 Ox6uGKzIf4stVoqWjRs2rv9ZS8I1MM1MZ98j6nA8tyux6TO0wvGJqHcuJnQ390Ugzem019
 C/3N+SIGeGSRn/OIPEEizWootSg+ruY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-kuqrFFDZO0KAs5_afTb9eQ-1; Thu, 17 Feb 2022 07:01:00 -0500
X-MC-Unique: kuqrFFDZO0KAs5_afTb9eQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3AA4344B7;
 Thu, 17 Feb 2022 12:00:59 +0000 (UTC)
Received: from localhost (unknown [10.39.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7053B6F12F;
 Thu, 17 Feb 2022 12:00:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/12] ui/console: move dcl compatiblity check to a callback
Date: Thu, 17 Feb 2022 15:58:22 +0400
Message-Id: <20220217115829.2314347-6-marcandre.lureau@redhat.com>
In-Reply-To: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
References: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
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

As expected from the "compatible_dcl" comment, a simple comparison of
ops isn't enough. The following patch will fix a regression introduced
by this limited check by extending the compatibility callback for
egl-headless.

For now, this patch simply replaces the the "compatible_dcl" ops pointer
with a "dpy_gl_ctx_is_compatible_ctx" callback.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h |  9 ++-------
 ui/console.c         |  3 ++-
 ui/dbus.c            |  9 ++++++++-
 ui/egl-headless.c    |  9 ++++++++-
 ui/gtk.c             | 18 ++++++++++++++++--
 ui/sdl2.c            |  9 ++++++++-
 ui/spice-display.c   |  9 ++++++++-
 7 files changed, 52 insertions(+), 14 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index f590819880b5..18a10c0b7db0 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -282,13 +282,8 @@ struct DisplayChangeListener {
 };
 
 typedef struct DisplayGLCtxOps {
-    /*
-     * We only check if the GLCtx is compatible with a DCL via ops. A natural
-     * evolution of this would be a callback to check some runtime requirements
-     * and allow various DCL kinds.
-     */
-    const DisplayChangeListenerOps *compatible_dcl;
-
+    bool (*dpy_gl_ctx_is_compatible_dcl)(DisplayGLCtx *dgc,
+                                         DisplayChangeListener *dcl);
     QEMUGLContext (*dpy_gl_ctx_create)(DisplayGLCtx *dgc,
                                        QEMUGLParams *params);
     void (*dpy_gl_ctx_destroy)(DisplayGLCtx *dgc,
diff --git a/ui/console.c b/ui/console.c
index 57e431d9e609..c9318552871b 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1482,7 +1482,8 @@ static bool dpy_compatible_with(QemuConsole *con,
 
     flags = con->hw_ops->get_flags ? con->hw_ops->get_flags(con->hw) : 0;
 
-    if (console_has_gl(con) && con->gl->ops->compatible_dcl != dcl->ops) {
+    if (console_has_gl(con) &&
+        !con->gl->ops->dpy_gl_ctx_is_compatible_dcl(con->gl, dcl)) {
         error_setg(errp, "Display %s is incompatible with the GL context",
                    dcl->ops->dpy_name);
         return false;
diff --git a/ui/dbus.c b/ui/dbus.c
index 0074424c1fed..f00a44421cf7 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -48,8 +48,15 @@ static QEMUGLContext dbus_create_context(DisplayGLCtx *dgc,
     return qemu_egl_create_context(dgc, params);
 }
 
+static bool
+dbus_is_compatible_dcl(DisplayGLCtx *dgc,
+                       DisplayChangeListener *dcl)
+{
+    return dcl->ops == &dbus_gl_dcl_ops;
+}
+
 static const DisplayGLCtxOps dbus_gl_ops = {
-    .compatible_dcl          = &dbus_gl_dcl_ops,
+    .dpy_gl_ctx_is_compatible_dcl = dbus_is_compatible_dcl,
     .dpy_gl_ctx_create       = dbus_create_context,
     .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
     .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
diff --git a/ui/egl-headless.c b/ui/egl-headless.c
index 94082a9da951..9aff115280bc 100644
--- a/ui/egl-headless.c
+++ b/ui/egl-headless.c
@@ -166,8 +166,15 @@ static const DisplayChangeListenerOps egl_ops = {
     .dpy_gl_update           = egl_scanout_flush,
 };
 
+static bool
+egl_is_compatible_dcl(DisplayGLCtx *dgc,
+                      DisplayChangeListener *dcl)
+{
+    return dcl->ops == &egl_ops;
+}
+
 static const DisplayGLCtxOps eglctx_ops = {
-    .compatible_dcl          = &egl_ops,
+    .dpy_gl_ctx_is_compatible_dcl = egl_is_compatible_dcl,
     .dpy_gl_ctx_create       = egl_create_context,
     .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
     .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
diff --git a/ui/gtk.c b/ui/gtk.c
index a8567b9ddc8f..1b24a67d7964 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -614,8 +614,15 @@ static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_has_dmabuf          = gd_has_dmabuf,
 };
 
+static bool
+gd_gl_area_is_compatible_dcl(DisplayGLCtx *dgc,
+                             DisplayChangeListener *dcl)
+{
+    return dcl->ops == &dcl_gl_area_ops;
+}
+
 static const DisplayGLCtxOps gl_area_ctx_ops = {
-    .compatible_dcl          = &dcl_gl_area_ops,
+    .dpy_gl_ctx_is_compatible_dcl = gd_gl_area_is_compatible_dcl,
     .dpy_gl_ctx_create       = gd_gl_area_create_context,
     .dpy_gl_ctx_destroy      = gd_gl_area_destroy_context,
     .dpy_gl_ctx_make_current = gd_gl_area_make_current,
@@ -641,8 +648,15 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_has_dmabuf          = gd_has_dmabuf,
 };
 
+static bool
+gd_egl_is_compatible_dcl(DisplayGLCtx *dgc,
+                         DisplayChangeListener *dcl)
+{
+    return dcl->ops == &dcl_egl_ops;
+}
+
 static const DisplayGLCtxOps egl_ctx_ops = {
-    .compatible_dcl          = &dcl_egl_ops,
+    .dpy_gl_ctx_is_compatible_dcl = gd_egl_is_compatible_dcl,
     .dpy_gl_ctx_create       = gd_egl_create_context,
     .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
     .dpy_gl_ctx_make_current = gd_egl_make_current,
diff --git a/ui/sdl2.c b/ui/sdl2.c
index 46a252d7d9d7..d3741f9b754d 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -788,8 +788,15 @@ static const DisplayChangeListenerOps dcl_gl_ops = {
     .dpy_gl_update           = sdl2_gl_scanout_flush,
 };
 
+static bool
+sdl2_gl_is_compatible_dcl(DisplayGLCtx *dgc,
+                          DisplayChangeListener *dcl)
+{
+    return dcl->ops == &dcl_gl_ops;
+}
+
 static const DisplayGLCtxOps gl_ctx_ops = {
-    .compatible_dcl          = &dcl_gl_ops,
+    .dpy_gl_ctx_is_compatible_dcl = sdl2_gl_is_compatible_dcl,
     .dpy_gl_ctx_create       = sdl2_gl_create_context,
     .dpy_gl_ctx_destroy      = sdl2_gl_destroy_context,
     .dpy_gl_ctx_make_current = sdl2_gl_make_context_current,
diff --git a/ui/spice-display.c b/ui/spice-display.c
index a3078adf91ec..494168e7fe75 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -1125,8 +1125,15 @@ static const DisplayChangeListenerOps display_listener_gl_ops = {
     .dpy_gl_update           = qemu_spice_gl_update,
 };
 
+static bool
+qemu_spice_is_compatible_dcl(DisplayGLCtx *dgc,
+                             DisplayChangeListener *dcl)
+{
+    return dcl->ops == &display_listener_gl_ops;
+}
+
 static const DisplayGLCtxOps gl_ctx_ops = {
-    .compatible_dcl          = &display_listener_gl_ops,
+    .dpy_gl_ctx_is_compatible_dcl = qemu_spice_is_compatible_dcl,
     .dpy_gl_ctx_create       = qemu_spice_gl_create_context,
     .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
     .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
-- 
2.34.1.428.gdcc0cd074f0c



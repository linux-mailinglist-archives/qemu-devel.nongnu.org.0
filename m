Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79796B751B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:03:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbfxO-0004AH-Hs; Mon, 13 Mar 2023 07:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbfx8-0003bb-UB
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:02:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbfx6-0004Bm-9r
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678705371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hf121Qn75yq3DG5gMnWdxhFcrOF5SNTyR9wizYrqteM=;
 b=S5+ExvuCSeBdIpdlQyzv9nYphOL1m7KWa6jLN7imLCkANoXV3vTaAGRaIzvBQvyK9k0HQB
 T7Nw6ZzaMjyBbWdAtQcWlZY++vC35KnaF5iGOWbW0s7/V9wabhGdreQf6e1j9yFNpwl3og
 kxipb/R2PwADLDb9tHanJcsUhLQhCo8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-0qajasqHNEuFvXhjH5hwKw-1; Mon, 13 Mar 2023 07:02:49 -0400
X-MC-Unique: 0qajasqHNEuFvXhjH5hwKw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A1B385A588;
 Mon, 13 Mar 2023 11:02:49 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A296BC017D7;
 Mon, 13 Mar 2023 11:02:48 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PULL 18/18] ui/dbus: restrict opengl to gbm-enabled config
Date: Mon, 13 Mar 2023 15:01:26 +0400
Message-Id: <20230313110126.383392-19-marcandre.lureau@redhat.com>
In-Reply-To: <20230313110126.383392-1-marcandre.lureau@redhat.com>
References: <20230313110126.383392-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

We can enable EGL later for non-GBM hosts.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 ui/dbus-listener.c | 10 +++++-----
 ui/dbus.c          | 12 +++++++++++-
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
index 85692f1b27..911acdc529 100644
--- a/ui/dbus-listener.c
+++ b/ui/dbus-listener.c
@@ -50,7 +50,7 @@ struct _DBusDisplayListener {
 
 G_DEFINE_TYPE(DBusDisplayListener, dbus_display_listener, G_TYPE_OBJECT)
 
-#ifdef CONFIG_OPENGL
+#ifdef CONFIG_GBM
 static void dbus_update_gl_cb(GObject *source_object,
                            GAsyncResult *res,
                            gpointer user_data)
@@ -239,7 +239,7 @@ static void dbus_refresh(DisplayChangeListener *dcl)
     graphic_hw_update(dcl->con);
 }
 
-#ifdef CONFIG_OPENGL
+#ifdef CONFIG_GBM
 static void dbus_gl_gfx_update(DisplayChangeListener *dcl,
                                int x, int y, int w, int h)
 {
@@ -302,7 +302,7 @@ static void dbus_gfx_update(DisplayChangeListener *dcl,
         DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);
 }
 
-#ifdef CONFIG_OPENGL
+#ifdef CONFIG_GBM
 static void dbus_gl_gfx_switch(DisplayChangeListener *dcl,
                                struct DisplaySurface *new_surface)
 {
@@ -369,7 +369,7 @@ static void dbus_cursor_define(DisplayChangeListener *dcl,
         NULL);
 }
 
-#ifdef CONFIG_OPENGL
+#ifdef CONFIG_GBM
 const DisplayChangeListenerOps dbus_gl_dcl_ops = {
     .dpy_name                = "dbus-gl",
     .dpy_gfx_update          = dbus_gl_gfx_update,
@@ -417,7 +417,7 @@ dbus_display_listener_constructed(GObject *object)
     DBusDisplayListener *ddl = DBUS_DISPLAY_LISTENER(object);
 
     ddl->dcl.ops = &dbus_dcl_ops;
-#ifdef CONFIG_OPENGL
+#ifdef CONFIG_GBM
     if (display_opengl) {
         ddl->dcl.ops = &dbus_gl_dcl_ops;
     }
diff --git a/ui/dbus.c b/ui/dbus.c
index 904f5a0a6d..0513de9918 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -47,8 +47,10 @@ static DBusDisplay *dbus_display;
 static QEMUGLContext dbus_create_context(DisplayGLCtx *dgc,
                                          QEMUGLParams *params)
 {
+#ifdef CONFIG_GBM
     eglMakeCurrent(qemu_egl_display, EGL_NO_SURFACE, EGL_NO_SURFACE,
                    qemu_egl_rn_ctx);
+#endif
     return qemu_egl_create_context(dgc, params);
 }
 
@@ -56,7 +58,11 @@ static bool
 dbus_is_compatible_dcl(DisplayGLCtx *dgc,
                        DisplayChangeListener *dcl)
 {
-    return dcl->ops == &dbus_gl_dcl_ops || dcl->ops == &dbus_console_dcl_ops;
+    return
+#ifdef CONFIG_GBM
+        dcl->ops == &dbus_gl_dcl_ops ||
+#endif
+        dcl->ops == &dbus_console_dcl_ops;
 }
 
 static void
@@ -459,7 +465,11 @@ early_dbus_init(DisplayOptions *opts)
     DisplayGLMode mode = opts->has_gl ? opts->gl : DISPLAYGL_MODE_OFF;
 
     if (mode != DISPLAYGL_MODE_OFF) {
+#ifdef CONFIG_OPENGL
         egl_init(opts->u.dbus.rendernode, mode, &error_fatal);
+#else
+        error_report("dbus: GL rendering is not supported");
+#endif
     }
 
     type_register(&dbus_vc_type_info);
-- 
2.39.2



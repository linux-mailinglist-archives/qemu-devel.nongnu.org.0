Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF836B8220
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 21:03:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pboNs-0003ms-Qp; Mon, 13 Mar 2023 16:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pboNq-0003f9-CB
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 16:03:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pboNo-0004ou-Gb
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 16:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678737779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jx68OH9uSqJsl2epJljgu4Vz2IzzXMSo66ohY3gl2bA=;
 b=eO4XtUMLLcPZpEnP/uiTCNsUgnZtcJL2JmL8QhC2bpc9wHwfUvCDb8f/kY+nWgY+aiCxzY
 59VaBQoNHFtc630/c4jVOV0hbIjNozmffqg0yjWPWR7973azjd8TqhL2SI6iBwlvKXFzPA
 SVKrmh2fFbY/G7bPr/ycbe264haRiuI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-tAjrtTdaO5Koud-1RmLdRg-1; Mon, 13 Mar 2023 16:02:56 -0400
X-MC-Unique: tAjrtTdaO5Koud-1RmLdRg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3392C100F83C;
 Mon, 13 Mar 2023 20:02:55 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8677400F51;
 Mon, 13 Mar 2023 20:02:53 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL v2 17/18] ui/dbus: do not require opengl & gbm
Date: Tue, 14 Mar 2023 00:01:33 +0400
Message-Id: <20230313200134.503083-18-marcandre.lureau@redhat.com>
In-Reply-To: <20230313200134.503083-1-marcandre.lureau@redhat.com>
References: <20230313200134.503083-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
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

Allow to build & use the DBus display without 3d/GPU acceleration support.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build             |  4 ++--
 ui/dbus-listener.c      | 15 +++++++++++++--
 ui/dbus.c               |  8 ++++++++
 tests/qtest/meson.build |  2 +-
 ui/meson.build          |  4 ++--
 5 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index 6bcab8bf0d..29f8644d6d 100644
--- a/meson.build
+++ b/meson.build
@@ -1746,8 +1746,8 @@ dbus_display = get_option('dbus_display') \
            error_message: '-display dbus requires glib>=2.64') \
   .require(gdbus_codegen.found(),
            error_message: gdbus_codegen_error.format('-display dbus')) \
-  .require(opengl.found() and gbm.found(),
-           error_message: '-display dbus requires epoxy/egl and gbm') \
+  .require(targetos != 'windows',
+           error_message: '-display dbus is not available on Windows') \
   .allowed()
 
 have_virtfs = get_option('virtfs') \
diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
index 2e87ed7e9a..85692f1b27 100644
--- a/ui/dbus-listener.c
+++ b/ui/dbus-listener.c
@@ -27,9 +27,11 @@
 #include "dbus.h"
 #include <gio/gunixfdlist.h>
 
+#ifdef CONFIG_OPENGL
 #include "ui/shader.h"
 #include "ui/egl-helpers.h"
 #include "ui/egl-context.h"
+#endif
 #include "trace.h"
 
 struct _DBusDisplayListener {
@@ -48,6 +50,7 @@ struct _DBusDisplayListener {
 
 G_DEFINE_TYPE(DBusDisplayListener, dbus_display_listener, G_TYPE_OBJECT)
 
+#ifdef CONFIG_OPENGL
 static void dbus_update_gl_cb(GObject *source_object,
                            GAsyncResult *res,
                            gpointer user_data)
@@ -229,12 +232,14 @@ static void dbus_gl_refresh(DisplayChangeListener *dcl)
         ddl->gl_updates = 0;
     }
 }
+#endif
 
 static void dbus_refresh(DisplayChangeListener *dcl)
 {
     graphic_hw_update(dcl->con);
 }
 
+#ifdef CONFIG_OPENGL
 static void dbus_gl_gfx_update(DisplayChangeListener *dcl,
                                int x, int y, int w, int h)
 {
@@ -242,6 +247,7 @@ static void dbus_gl_gfx_update(DisplayChangeListener *dcl,
 
     ddl->gl_updates++;
 }
+#endif
 
 static void dbus_gfx_update(DisplayChangeListener *dcl,
                             int x, int y, int w, int h)
@@ -296,6 +302,7 @@ static void dbus_gfx_update(DisplayChangeListener *dcl,
         DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);
 }
 
+#ifdef CONFIG_OPENGL
 static void dbus_gl_gfx_switch(DisplayChangeListener *dcl,
                                struct DisplaySurface *new_surface)
 {
@@ -311,6 +318,7 @@ static void dbus_gl_gfx_switch(DisplayChangeListener *dcl,
                              width, height, 0, 0, width, height);
     }
 }
+#endif
 
 static void dbus_gfx_switch(DisplayChangeListener *dcl,
                             struct DisplaySurface *new_surface)
@@ -361,6 +369,7 @@ static void dbus_cursor_define(DisplayChangeListener *dcl,
         NULL);
 }
 
+#ifdef CONFIG_OPENGL
 const DisplayChangeListenerOps dbus_gl_dcl_ops = {
     .dpy_name                = "dbus-gl",
     .dpy_gfx_update          = dbus_gl_gfx_update,
@@ -378,6 +387,7 @@ const DisplayChangeListenerOps dbus_gl_dcl_ops = {
     .dpy_gl_release_dmabuf   = dbus_release_dmabuf,
     .dpy_gl_update           = dbus_scanout_update,
 };
+#endif
 
 const DisplayChangeListenerOps dbus_dcl_ops = {
     .dpy_name                = "dbus",
@@ -406,11 +416,12 @@ dbus_display_listener_constructed(GObject *object)
 {
     DBusDisplayListener *ddl = DBUS_DISPLAY_LISTENER(object);
 
+    ddl->dcl.ops = &dbus_dcl_ops;
+#ifdef CONFIG_OPENGL
     if (display_opengl) {
         ddl->dcl.ops = &dbus_gl_dcl_ops;
-    } else {
-        ddl->dcl.ops = &dbus_dcl_ops;
     }
+#endif
 
     G_OBJECT_CLASS(dbus_display_listener_parent_class)->constructed(object);
 }
diff --git a/ui/dbus.c b/ui/dbus.c
index ebf03bd84d..904f5a0a6d 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -30,8 +30,10 @@
 #include "qom/object_interfaces.h"
 #include "sysemu/sysemu.h"
 #include "ui/dbus-module.h"
+#ifdef CONFIG_OPENGL
 #include "ui/egl-helpers.h"
 #include "ui/egl-context.h"
+#endif
 #include "audio/audio.h"
 #include "audio/audio_int.h"
 #include "qapi/error.h"
@@ -41,6 +43,7 @@
 
 static DBusDisplay *dbus_display;
 
+#ifdef CONFIG_OPENGL
 static QEMUGLContext dbus_create_context(DisplayGLCtx *dgc,
                                          QEMUGLParams *params)
 {
@@ -84,6 +87,7 @@ static const DisplayGLCtxOps dbus_gl_ops = {
     .dpy_gl_ctx_destroy_texture = dbus_destroy_texture,
     .dpy_gl_ctx_update_texture = dbus_update_texture,
 };
+#endif
 
 static NotifierList dbus_display_notifiers =
     NOTIFIER_LIST_INITIALIZER(dbus_display_notifiers);
@@ -112,10 +116,12 @@ dbus_display_init(Object *o)
     DBusDisplay *dd = DBUS_DISPLAY(o);
     g_autoptr(GDBusObjectSkeleton) vm = NULL;
 
+#ifdef CONFIG_OPENGL
     dd->glctx.ops = &dbus_gl_ops;
     if (display_opengl) {
         dd->glctx.gls = qemu_gl_init_shader();
     }
+#endif
     dd->iface = qemu_dbus_display1_vm_skeleton_new();
     dd->consoles = g_ptr_array_new_with_free_func(g_object_unref);
 
@@ -152,7 +158,9 @@ dbus_display_finalize(Object *o)
     g_clear_object(&dd->iface);
     g_free(dd->dbus_addr);
     g_free(dd->audiodev);
+#ifdef CONFIG_OPENGL
     g_clear_pointer(&dd->glctx.gls, qemu_gl_fini_shader);
+#endif
     dbus_display = NULL;
 }
 
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c9292b64fb..85ea4e8d99 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -101,7 +101,7 @@ qtests_i386 = \
    'numa-test'
   ]
 
-if dbus_display
+if dbus_display and targetos != 'windows'
   qtests_i386 += ['dbus-display-test']
 endif
 
diff --git a/ui/meson.build b/ui/meson.build
index 0b2d0d21d1..330369707d 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -85,7 +85,7 @@ if dbus_display
                                           '--generate-c-code', '@BASENAME@'])
   dbus_display1_lib = static_library('dbus-display1', dbus_display1, dependencies: gio)
   dbus_display1_dep = declare_dependency(link_with: dbus_display1_lib, include_directories: include_directories('.'))
-  dbus_ss.add(when: [gio, pixman, opengl, gbm, dbus_display1_dep],
+  dbus_ss.add(when: [gio, pixman, dbus_display1_dep],
               if_true: [files(
                 'dbus-chardev.c',
                 'dbus-clipboard.c',
@@ -93,7 +93,7 @@ if dbus_display
                 'dbus-error.c',
                 'dbus-listener.c',
                 'dbus.c',
-              )])
+              ), opengl, gbm])
   ui_modules += {'dbus' : dbus_ss}
 endif
 
-- 
2.39.2



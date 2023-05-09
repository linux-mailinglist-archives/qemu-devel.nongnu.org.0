Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0C96FC7A0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 15:14:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwN9p-0001ls-02; Tue, 09 May 2023 09:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <belmouss@redhat.com>)
 id 1pwM2x-0001Iy-Mf
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:02:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <belmouss@redhat.com>)
 id 1pwM2v-0006Gr-Ow
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683633738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=lRavhxs9SddL6sGI5PJONjIycY7aXY/CxW0tnnL8twc=;
 b=LvOALbT8b1h6+0yJBB5G6hShd1G/DzyCdXVPhJSWy59kqAwUwjp9Lsuj7WPW4CAlNkxX2N
 AdbjD80nIKDSLLi/gtEBPjj9yHKNPAHGW3RJRcEPki+MAgEdeUASrHCTdE6Ol99S+j3oD1
 98Y0rPms1yaJkp1VAWVnWN0K3agilsI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-mwl0LOi7N-2WjiTG6EGa8A-1; Tue, 09 May 2023 07:59:43 -0400
X-MC-Unique: mwl0LOi7N-2WjiTG6EGa8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D11B280D5A4;
 Tue,  9 May 2023 11:59:42 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.45.226.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEBC71121318;
 Tue,  9 May 2023 11:59:40 +0000 (UTC)
From: Bilal Elmoussaoui <belmouss@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 chergert@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bilal Elmoussaoui <belmouss@redhat.com>
Subject: [PATCH] ui/dbus: Implement damage regions for GL
Date: Tue,  9 May 2023 13:59:40 +0200
Message-Id: <20230509115940.114033-1-belmouss@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=belmouss@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 09 May 2023 09:13:29 -0400
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

From: Christian Hergert <chergert@redhat.com>

Currently, when using `-display dbus,gl=on` all updates to the client
become "full scanout" updates, meaning there is no way for the client to
limit damage regions to the display server.

Instead of using an "update count", this patch tracks the damage region
and propagates it to the client.

This was less of an issue when clients were using GtkGLArea for
rendering,
as you'd be doing full-surface redraw. To be efficient, the client needs
both a DMA-BUF and the damage region to be updated.

In the future, when additional methods are allowed on the D-Bus
interface,
this should likely be updated to send damage regions as a single RPC to
avoid additional message processing.

Currently, Linux does not propagate damage rectangles when using the
virtio-gpu drm driver. That means compositors such as Mutter which
utilize
drmModePageFlip() will be sending full or near-full surface damages.

https://lists.freedesktop.org/archives/dri-devel/2023-March/395164.html
contains a patch to fix that too.

Signed-off-by: Bilal Elmoussaoui <belmouss@redhat.com>
---
 meson.build        |  8 ++++++++
 ui/dbus-listener.c | 25 +++++++++++++++++++------
 ui/meson.build     |  2 +-
 3 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index 229eb585f7..72678ef78e 100644
--- a/meson.build
+++ b/meson.build
@@ -1761,6 +1761,14 @@ dbus_display = get_option('dbus_display') \
            error_message: '-display dbus is not available on Windows') \
   .allowed()
 
+cairo = not_found
+if dbus_display
+  cairo = dependency('cairo',
+                     kwargs: static_kwargs,
+                     method: 'pkg-config',
+                    )
+endif
+
 have_virtfs = get_option('virtfs') \
     .require(targetos == 'linux' or targetos == 'darwin',
              error_message: 'virtio-9p (virtfs) requires Linux or macOS') \
diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
index 911acdc529..047be5cb3a 100644
--- a/ui/dbus-listener.c
+++ b/ui/dbus-listener.c
@@ -25,6 +25,7 @@
 #include "qemu/error-report.h"
 #include "sysemu/sysemu.h"
 #include "dbus.h"
+#include <cairo.h>
 #include <gio/gunixfdlist.h>
 
 #ifdef CONFIG_OPENGL
@@ -43,9 +44,10 @@ struct _DBusDisplayListener {
 
     QemuDBusDisplay1Listener *proxy;
 
+    cairo_region_t *gl_damage;
+
     DisplayChangeListener dcl;
     DisplaySurface *ds;
-    int gl_updates;
 };
 
 G_DEFINE_TYPE(DBusDisplayListener, dbus_display_listener, G_TYPE_OBJECT)
@@ -226,10 +228,17 @@ static void dbus_gl_refresh(DisplayChangeListener *dcl)
         return;
     }
 
-    if (ddl->gl_updates) {
-        dbus_call_update_gl(ddl, 0, 0,
-                            surface_width(ddl->ds), surface_height(ddl->ds));
-        ddl->gl_updates = 0;
+    if (ddl->gl_damage) {
+        int n_rects = cairo_region_num_rectangles(ddl->gl_damage);
+
+        for (int i = 0; i < n_rects; i++) {
+            cairo_rectangle_int_t rect;
+
+            cairo_region_get_rectangle(ddl->gl_damage, i, &rect);
+            dbus_call_update_gl(ddl, rect.x, rect.y, rect.width, rect.height);
+        }
+
+        g_clear_pointer(&ddl->gl_damage, cairo_region_destroy);
     }
 }
 #endif
@@ -245,7 +254,11 @@ static void dbus_gl_gfx_update(DisplayChangeListener *dcl,
 {
     DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
 
-    ddl->gl_updates++;
+    if (ddl->gl_damage == NULL) {
+        ddl->gl_damage = cairo_region_create();
+    }
+    cairo_region_union_rectangle(ddl->gl_damage,
+                                 &(cairo_rectangle_int_t) {x, y, w, h});
 }
 #endif
 
diff --git a/ui/meson.build b/ui/meson.build
index 330369707d..8b4004ff01 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -85,7 +85,7 @@ if dbus_display
                                           '--generate-c-code', '@BASENAME@'])
   dbus_display1_lib = static_library('dbus-display1', dbus_display1, dependencies: gio)
   dbus_display1_dep = declare_dependency(link_with: dbus_display1_lib, include_directories: include_directories('.'))
-  dbus_ss.add(when: [gio, pixman, dbus_display1_dep],
+  dbus_ss.add(when: [gio, pixman, dbus_display1_dep, cairo],
               if_true: [files(
                 'dbus-chardev.c',
                 'dbus-clipboard.c',
-- 
2.40.0



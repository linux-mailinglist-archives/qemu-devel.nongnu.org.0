Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5A16FC7A1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 15:14:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwN9n-0001lK-Ok; Tue, 09 May 2023 09:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pwLMK-0006IY-R2
 for qemu-devel@nongnu.org; Tue, 09 May 2023 07:18:20 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pwLMI-0005Yy-AJ
 for qemu-devel@nongnu.org; Tue, 09 May 2023 07:18:20 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 573FA11EEDF;
 Tue,  9 May 2023 11:18:16 +0000 (UTC)
From: ~bilelmoussaoui <bilelmoussaoui@git.sr.ht>
Date: Tue, 09 May 2023 12:54:39 +0200
Subject: [PATCH qemu] ui/dbus: Implement damage regions for GL
Message-ID: <168363109623.17426.18065034431761880917-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: chergert@redhat.com, marcandre.lureau@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-To: ~bilelmoussaoui <bil.elmoussaoui@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Christian Hergert <chergert@redhat.com>

Currently, when using `-display dbus,gl=3Don` all updates to the client
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
@@ -1761,6 +1761,14 @@ dbus_display =3D get_option('dbus_display') \
            error_message: '-display dbus is not available on Windows') \
   .allowed()
=20
+cairo =3D not_found
+if dbus_display
+  cairo =3D dependency('cairo',
+                     kwargs: static_kwargs,
+                     method: 'pkg-config',
+                    )
+endif
+
 have_virtfs =3D get_option('virtfs') \
     .require(targetos =3D=3D 'linux' or targetos =3D=3D 'darwin',
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
=20
 #ifdef CONFIG_OPENGL
@@ -43,9 +44,10 @@ struct _DBusDisplayListener {
=20
     QemuDBusDisplay1Listener *proxy;
=20
+    cairo_region_t *gl_damage;
+
     DisplayChangeListener dcl;
     DisplaySurface *ds;
-    int gl_updates;
 };
=20
 G_DEFINE_TYPE(DBusDisplayListener, dbus_display_listener, G_TYPE_OBJECT)
@@ -226,10 +228,17 @@ static void dbus_gl_refresh(DisplayChangeListener *dcl)
         return;
     }
=20
-    if (ddl->gl_updates) {
-        dbus_call_update_gl(ddl, 0, 0,
-                            surface_width(ddl->ds), surface_height(ddl->ds));
-        ddl->gl_updates =3D 0;
+    if (ddl->gl_damage) {
+        int n_rects =3D cairo_region_num_rectangles(ddl->gl_damage);
+
+        for (int i =3D 0; i < n_rects; i++) {
+            cairo_rectangle_int_t rect;
+
+            cairo_region_get_rectangle(ddl->gl_damage, i, &rect);
+            dbus_call_update_gl(ddl, rect.x, rect.y, rect.width, rect.height=
);
+        }
+
+        g_clear_pointer(&ddl->gl_damage, cairo_region_destroy);
     }
 }
 #endif
@@ -245,7 +254,11 @@ static void dbus_gl_gfx_update(DisplayChangeListener *dc=
l,
 {
     DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayListener, dcl);
=20
-    ddl->gl_updates++;
+    if (ddl->gl_damage =3D=3D NULL) {
+        ddl->gl_damage =3D cairo_region_create();
+    }
+    cairo_region_union_rectangle(ddl->gl_damage,
+                                 &(cairo_rectangle_int_t) {x, y, w, h});
 }
 #endif
=20
diff --git a/ui/meson.build b/ui/meson.build
index 330369707d..8b4004ff01 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -85,7 +85,7 @@ if dbus_display
                                           '--generate-c-code', '@BASENAME@'])
   dbus_display1_lib =3D static_library('dbus-display1', dbus_display1, depen=
dencies: gio)
   dbus_display1_dep =3D declare_dependency(link_with: dbus_display1_lib, inc=
lude_directories: include_directories('.'))
-  dbus_ss.add(when: [gio, pixman, dbus_display1_dep],
+  dbus_ss.add(when: [gio, pixman, dbus_display1_dep, cairo],
               if_true: [files(
                 'dbus-chardev.c',
                 'dbus-clipboard.c',
--=20
2.38.4


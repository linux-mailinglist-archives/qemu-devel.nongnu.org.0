Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C062032D3BB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 13:58:09 +0100 (CET)
Received: from localhost ([::1]:60438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHnYO-0004OC-Rl
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 07:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnT2-0007iB-Lq
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnT0-0005AM-Lg
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614862354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vr4Zw3ru1zrZD6wmWyWnSYOy/5MlBYbHLhIE/0AGPrw=;
 b=esTnGsnas6DSdIhbduIJt8tZrWrvpgYt6ZAUXEi6KdTIBSACa0Q1koK2ndjGgdjyKaXkaE
 ZcdS+rH6eyC4clq9QQDmzGi1NjUqhGUmtadjhfdOfkaeQlpdmA6LxMizILlVMOMs9oAqKH
 rOZrKC+OIL7M2Nh3RBu50PHz0eYoIAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-tbwew71RPfOOFkBmN2KhEQ-1; Thu, 04 Mar 2021 07:52:31 -0500
X-MC-Unique: tbwew71RPfOOFkBmN2KhEQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CFAE19067E1;
 Thu,  4 Mar 2021 12:52:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-129.ams2.redhat.com
 [10.36.115.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7231D1725E;
 Thu,  4 Mar 2021 12:52:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9B9A01800638; Thu,  4 Mar 2021 09:37:05 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/8] ui/console: Pass placeholder surface to displays
Date: Thu,  4 Mar 2021 09:37:04 +0100
Message-Id: <20210304083705.1046645-8-kraxel@redhat.com>
In-Reply-To: <20210304083705.1046645-1-kraxel@redhat.com>
References: <20210304083705.1046645-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

ui/console used to accept NULL as graphic console surface, but its
semantics was inconsistent among displays:
- cocoa and gtk-egl perform NULL dereference.
- egl-headless, spice and spice-egl do nothing.
- gtk releases underlying resources.
- sdl2-2d and sdl2-gl destroys the window.
- vnc shows a message, "Display output is not active."

Fortunately, only virtio-gpu and virtio-gpu-3d assign NULL so
we can study them to figure out the desired behavior. They assign
NULL *except* for the primary display when the device is realized,
reset, or its scanout is disabled. This effectively destroys
windows for the (uninitialized) secondary displays.

To implement the consistent behavior of display device
realization/reset, this change embeds it to the operation
switching the surface. When NULL was given as a new surface when
switching, ui/console will instead passes a placeholder down
to each display listeners.

sdl destroys the window for a secondary console if its surface is a
placeholder. The other displays simply shows the placeholder.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210225101316.83940-2-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console.c       | 17 ++++++++++++++++-
 ui/gtk.c           |  4 ----
 ui/sdl2-2d.c       |  7 ++-----
 ui/sdl2-gl.c       |  4 ++--
 ui/spice-display.c |  6 +++---
 ui/vnc.c           | 10 ----------
 6 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 32823faf4147..171a7bf14b94 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1675,11 +1675,26 @@ void dpy_gfx_update_full(QemuConsole *con)
 void dpy_gfx_replace_surface(QemuConsole *con,
                              DisplaySurface *surface)
 {
+    static const char placeholder_msg[] = "Display output is not active.";
     DisplayState *s = con->ds;
     DisplaySurface *old_surface = con->surface;
     DisplayChangeListener *dcl;
+    int width;
+    int height;
 
-    assert(old_surface != surface || surface == NULL);
+    if (!surface) {
+        if (old_surface) {
+            width = surface_width(old_surface);
+            height = surface_height(old_surface);
+        } else {
+            width = 640;
+            height = 480;
+        }
+
+        surface = qemu_create_placeholder_surface(width, height, placeholder_msg);
+    }
+
+    assert(old_surface != surface);
 
     con->surface = surface;
     QLIST_FOREACH(dcl, &s->listeners, next) {
diff --git a/ui/gtk.c b/ui/gtk.c
index c32ee34edcaf..3edaf041defc 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -567,10 +567,6 @@ static void gd_switch(DisplayChangeListener *dcl,
     }
     vc->gfx.ds = surface;
 
-    if (!surface) {
-        return;
-    }
-
     if (surface->format == PIXMAN_x8r8g8b8) {
         /*
          * PIXMAN_x8r8g8b8 == CAIRO_FORMAT_RGB24
diff --git a/ui/sdl2-2d.c b/ui/sdl2-2d.c
index a2ea85127d57..bfebbdeaea8c 100644
--- a/ui/sdl2-2d.c
+++ b/ui/sdl2-2d.c
@@ -32,14 +32,11 @@ void sdl2_2d_update(DisplayChangeListener *dcl,
                     int x, int y, int w, int h)
 {
     struct sdl2_console *scon = container_of(dcl, struct sdl2_console, dcl);
-    DisplaySurface *surf = qemu_console_surface(dcl->con);
+    DisplaySurface *surf = scon->surface;
     SDL_Rect rect;
     size_t surface_data_offset;
     assert(!scon->opengl);
 
-    if (!surf) {
-        return;
-    }
     if (!scon->texture) {
         return;
     }
@@ -75,7 +72,7 @@ void sdl2_2d_switch(DisplayChangeListener *dcl,
         scon->texture = NULL;
     }
 
-    if (!new_surface) {
+    if (is_placeholder(new_surface) && qemu_console_get_index(dcl->con)) {
         sdl2_window_destroy(scon);
         return;
     }
diff --git a/ui/sdl2-gl.c b/ui/sdl2-gl.c
index fd594d746110..a21d2deed916 100644
--- a/ui/sdl2-gl.c
+++ b/ui/sdl2-gl.c
@@ -86,7 +86,7 @@ void sdl2_gl_switch(DisplayChangeListener *dcl,
 
     scon->surface = new_surface;
 
-    if (!new_surface) {
+    if (is_placeholder(new_surface) && qemu_console_get_index(dcl->con)) {
         qemu_gl_fini_shader(scon->gls);
         scon->gls = NULL;
         sdl2_window_destroy(scon);
@@ -112,7 +112,7 @@ void sdl2_gl_refresh(DisplayChangeListener *dcl)
     assert(scon->opengl);
 
     graphic_hw_update(dcl->con);
-    if (scon->updates && scon->surface) {
+    if (scon->updates && scon->real_window) {
         scon->updates = 0;
         sdl2_gl_render_surface(scon);
     }
diff --git a/ui/spice-display.c b/ui/spice-display.c
index ad93b953a90c..d22781a23d06 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -388,7 +388,7 @@ void qemu_spice_display_switch(SimpleSpiceDisplay *ssd,
     SimpleSpiceUpdate *update;
     bool need_destroy;
 
-    if (surface && ssd->surface &&
+    if (ssd->surface &&
         surface_width(surface) == pixman_image_get_width(ssd->surface) &&
         surface_height(surface) == pixman_image_get_height(ssd->surface) &&
         surface_format(surface) == pixman_image_get_format(ssd->surface)) {
@@ -410,8 +410,8 @@ void qemu_spice_display_switch(SimpleSpiceDisplay *ssd,
 
     /* full mode switch */
     trace_qemu_spice_display_surface(ssd->qxl.id,
-                                     surface ? surface_width(surface)  : 0,
-                                     surface ? surface_height(surface) : 0,
+                                     surface_width(surface),
+                                     surface_height(surface),
                                      false);
 
     memset(&ssd->dirty, 0, sizeof(ssd->dirty));
diff --git a/ui/vnc.c b/ui/vnc.c
index 4d2151272e56..310abc937812 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -790,20 +790,10 @@ static bool vnc_check_pageflip(DisplaySurface *s1,
 static void vnc_dpy_switch(DisplayChangeListener *dcl,
                            DisplaySurface *surface)
 {
-    static const char placeholder_msg[] =
-        "Display output is not active.";
-    static DisplaySurface *placeholder;
     VncDisplay *vd = container_of(dcl, VncDisplay, dcl);
     bool pageflip = vnc_check_pageflip(vd->ds, surface);
     VncState *vs;
 
-    if (surface == NULL) {
-        if (placeholder == NULL) {
-            placeholder = qemu_create_placeholder_surface(640, 480, placeholder_msg);
-        }
-        surface = placeholder;
-    }
-
     vnc_abort_display_jobs(vd);
     vd->ds = surface;
 
-- 
2.29.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D219B324DC6
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:18:22 +0100 (CET)
Received: from localhost ([::1]:47124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDiv-0006W2-R7
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lFDeO-0001jx-GC
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:13:40 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:37757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lFDeM-0008AI-Cf
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:13:40 -0500
Received: by mail-pg1-x529.google.com with SMTP id o10so3478065pgg.4
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 02:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QiN+GjduDTDob/L43vMiFo+zjJBBP+f5w+hvQdungSM=;
 b=U3+Ql3gHc2rFHLKUU/6sE9CeSkxa7LX9+X3TVkZssj2D6MIrZookut0uOClV6io+Rt
 ssew5q9MDI62J7Ddmdkj/MI61GPfBC19GmR/Sli2uQTrh7Ov5BJKJlmjvPsOe5ljlQz4
 GpLNs00BtlfAWr8VMvJ2pY021HbTwUt0bJxJY5bD96D2d9yKMvP3pFxKRFmgilu1wfty
 WHo9QIvZpO8uUKMwdyk62AgUIUAoZBz6aRo+W/5hWyhIMpFaSB5OrpboqF9Ya1XajoPZ
 o9aal8DeVSgwwVHdsC7UucgpzcPjsNCwUIjD238kb0Zg76Pkj1rpNPuWPaCASH0iTtsy
 BfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QiN+GjduDTDob/L43vMiFo+zjJBBP+f5w+hvQdungSM=;
 b=mmxJbhNQsROOwDWlH9DK6hkpiLq1CDs90KODhDolrhDt+wAK8zfrlIAuSfm/pVKMtj
 B6qoCirEaojyzCG0A+MVCoLhh2ftS4LffSvh1u/uMp4RmjippuzPk269ktmsEzcnJ4AC
 DoKZ5WERiXnDwKQdSIZiw/3fF+Yq//HoeVPicqC0iBhkzpuL0E0tjqNfp7j8EKy/2gqw
 ZZ3azxzWwvWDEf5/QbqQE5APnOYsXZ7oAWK9TdKK7hKZwtMufB0Ux8rhnSyhQkIUOD2Y
 0fO9vg1SqU6iYf55zA/RW/q00Z3nss26eReYZI/sC9RnZOMSpryvAGwUsXYs4eIF03AW
 UxaA==
X-Gm-Message-State: AOAM533TpSYm9kI+roSe1babzHihXHXCY7TTv9Zz27rVDUQeH2Lmbst1
 3C9SiUYmjw/Myf1xJofkQcC3r7WJfcaP0w==
X-Google-Smtp-Source: ABdhPJwTHi9UEr70dpOOC25mwqjoRALuMJ6IwTJ0bpcdTWV7dtpLWBhF9u95vA/d4g09w1SI39Mnng==
X-Received: by 2002:a63:5c08:: with SMTP id q8mr2367108pgb.390.1614248016504; 
 Thu, 25 Feb 2021 02:13:36 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:29a8:515b:7b7:9008])
 by smtp.gmail.com with ESMTPSA id o18sm5630833pjq.44.2021.02.25.02.13.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Feb 2021 02:13:36 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v4 2/3] ui/console: Pass placeholder surface to displays
Date: Thu, 25 Feb 2021 19:13:15 +0900
Message-Id: <20210225101316.83940-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210225101316.83940-1-akihiko.odaki@gmail.com>
References: <20210225101316.83940-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x529.google.com
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 qemu Developers <qemu-devel@nongnu.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 ui/console.c       | 17 ++++++++++++++++-
 ui/gtk.c           |  4 ----
 ui/sdl2-2d.c       |  7 ++-----
 ui/sdl2-gl.c       |  4 ++--
 ui/spice-display.c |  6 +++---
 ui/vnc.c           | 10 ----------
 6 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 32823faf414..171a7bf14b9 100644
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
+
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
 
-    assert(old_surface != surface || surface == NULL);
+    assert(old_surface != surface);
 
     con->surface = surface;
     QLIST_FOREACH(dcl, &s->listeners, next) {
diff --git a/ui/gtk.c b/ui/gtk.c
index 79dc2401203..a4a5f981e2a 100644
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
index a2ea85127d5..bfebbdeaea8 100644
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
index fd594d74611..a21d2deed91 100644
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
index 6f32b66a6e7..222c7c20a2a 100644
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
index 4d2151272e5..310abc93781 100644
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
2.24.3 (Apple Git-128)



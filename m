Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E084324899
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 02:39:35 +0100 (CET)
Received: from localhost ([::1]:50392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF5cs-0000C7-ID
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 20:39:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lF5Zx-0007J6-0G
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:36:34 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:52425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lF5Zr-0004sq-3R
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:36:32 -0500
Received: by mail-pj1-x102e.google.com with SMTP id kr16so2529588pjb.2
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 17:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A5FQVryJkKp6u0IFNKShPGPlugCcW1tPLd28cMt7h/g=;
 b=gdzxWGmMRqLI0saU92/iPkVm/osz6b9NFOG7n2lkYNL1NbVqk+Y6DjxZNA/+M5eL/1
 3IcRsG+6HxoajqKZE6qDeWdiy6yJeyMBzr8xc2AlP8gc+VsAGCUQ1QjzUBw97NmNdfll
 FPZ8A/z6bs32OzBiwVlhgeSqHHx+iHoKhFZHy13HYgcsEoBa+pJlnXZHcsPFz6v0TsJy
 Df6LKfAJhwPfRMm6cYPop7QNpPYgbMkOK+ZXywEIVXerIbzWFIiiK+47JJGVV1pkgjzq
 SAXYk7SynUj3GjvSQcw5IGbeMqEgZdA+QILbhggc04NMVGBbYHMHWIBKsQlgPIhJ0jop
 heZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A5FQVryJkKp6u0IFNKShPGPlugCcW1tPLd28cMt7h/g=;
 b=YqAXcjkStPvDLNeKuHNa1TGa7dJf626ADQqlxfTaoAqYZ1VJDVJvX0KBqRacyQBXjS
 tg3+TRyO5YuYjcWF+78qOQ5qsIRG2amx08ixzT3tlr3umDkUE898htAzhxe2HoqX8yKe
 6P7o54DVPzaaiIvmTzQ4dfqs7m8k3hyPRi7U9UfObBopJVnT2BSjo5qskZV2rNoBJO80
 e3uFIekKlm1QsT0UtzRUyPAEUVGW5JoMSXnJwNfAkLuSf1vRfH5DItn+2VTBnQsXN9IL
 UguBIXUjvM1Q55lxaK6BEa33hhG8LiR183icFiufcKRGGZ/eqaG9yUquNVVg9hiSoiGi
 CAaA==
X-Gm-Message-State: AOAM531mgRFbN+ihPAkF7ZqVX38Ucv9bdlMOMqe2RCi7660ZH7a9FoVS
 qV+9ZJRoBiG0ImmfYdBtNYeXIMADp8piCQ==
X-Google-Smtp-Source: ABdhPJzhsq689qJPuZVzTltruaPBleR+6bVyv1H2DCnU7+vhjghb5Ufx138GUIMcMDV/KLau+Lu8LA==
X-Received: by 2002:a17:90a:5d87:: with SMTP id
 t7mr741049pji.175.1614216984282; 
 Wed, 24 Feb 2021 17:36:24 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:29a8:515b:7b7:9008])
 by smtp.gmail.com with ESMTPSA id 137sm3817135pgb.80.2021.02.24.17.36.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Feb 2021 17:36:23 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3 2/3] ui/console: Pass placeholder surface to displays
Date: Thu, 25 Feb 2021 10:36:08 +0900
Message-Id: <20210225013609.73388-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210225013609.73388-1-akihiko.odaki@gmail.com>
References: <20210224110656.5pctwd7hdpvqi2na@sirius.home.kraxel.org>
 <20210225013609.73388-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102e.google.com
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
 ui/console.c       | 45 +++++++++++++++++++++++++++++++--------------
 ui/gtk.c           |  4 ----
 ui/sdl2-2d.c       |  7 ++-----
 ui/sdl2-gl.c       |  4 ++--
 ui/spice-display.c |  6 +++---
 ui/vnc.c           | 10 ----------
 6 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 0caa39a6ed3..75e54651b5b 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1088,6 +1088,29 @@ static void console_putchar(QemuConsole *s, int ch)
     }
 }
 
+static void dpy_gfx_switch(DisplayChangeListener *dcl, DisplaySurface *surface)
+{
+    static DisplaySurface *placeholder;
+    static const char placeholder_msg[] = "Display output is not active.";
+    DisplaySurface *broadcast;
+
+    if (!dcl->ops->dpy_gfx_switch) {
+        return;
+    }
+
+    if (surface) {
+        broadcast = surface;
+    } else {
+        if (!placeholder) {
+            placeholder = qemu_create_placeholder_surface(640, 480, placeholder_msg);
+        }
+
+        broadcast = placeholder;
+    }
+
+    dcl->ops->dpy_gfx_switch(dcl, broadcast);
+}
+
 void console_select(unsigned int index)
 {
     DisplayChangeListener *dcl;
@@ -1104,9 +1127,7 @@ void console_select(unsigned int index)
                 if (dcl->con != NULL) {
                     continue;
                 }
-                if (dcl->ops->dpy_gfx_switch) {
-                    dcl->ops->dpy_gfx_switch(dcl, s->surface);
-                }
+                dpy_gfx_switch(dcl, s->surface);
             }
             if (s->surface) {
                 dpy_gfx_update(s, 0, 0, surface_width(s->surface),
@@ -1545,15 +1566,13 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
     } else {
         con = active_console;
     }
-    if (dcl->ops->dpy_gfx_switch) {
-        if (con) {
-            dcl->ops->dpy_gfx_switch(dcl, con->surface);
-        } else {
-            if (!dummy) {
-                dummy = qemu_create_placeholder_surface(640, 480, nodev);
-            }
-            dcl->ops->dpy_gfx_switch(dcl, dummy);
+    if (con) {
+        dpy_gfx_switch(dcl, con->surface);
+    } else {
+        if (!dummy) {
+            dummy = qemu_create_placeholder_surface(640, 480, nodev);
         }
+        dpy_gfx_switch(dcl, dummy);
     }
     text_console_update_cursor(NULL);
 }
@@ -1685,9 +1704,7 @@ void dpy_gfx_replace_surface(QemuConsole *con,
         if (con != (dcl->con ? dcl->con : active_console)) {
             continue;
         }
-        if (dcl->ops->dpy_gfx_switch) {
-            dcl->ops->dpy_gfx_switch(dcl, surface);
-        }
+        dpy_gfx_switch(dcl, surface);
     }
     qemu_free_displaysurface(old_surface);
 }
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



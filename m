Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85F732051B
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 12:39:59 +0100 (CET)
Received: from localhost ([::1]:39934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDQcA-0007Dx-9s
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 06:39:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lDQaa-0006jU-Ow
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 06:38:20 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:34819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lDQaY-0002pK-MS
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 06:38:20 -0500
Received: by mail-pj1-x102b.google.com with SMTP id e9so5790646pjj.0
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 03:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SwgMkpNKM1+VEZ2jCT/Y+i+eShsgjra0a21NxLZIL+M=;
 b=S+lSJcQ8OF2s+31vbnA+3A6nWM4d7whH98snhqHmXWqXhLd9NUPGpIsDn3pSsMsgyT
 h/+8T9V04Q1kByG73JPRYvCbQ0+rgwandqKme+9YO2M4rn7eZYF6m56g/KbIYNGWjojt
 G2QRJ55cDFM1Xae1n2wBJ81rYu+Rdr5+EJOI8O7D4dNDYNRcRBIqN/3Y+1k6tCouP85J
 hQeH4donOm65Kp5mvJtN1+GEFSO85RytI1k7saPq5oJ5B1jKUwoWCWQuYtMTItqe93yA
 OcuybJVVowSG/MItI1fOn3QB11RjxIQKzElO+hr/JvnDAf/uqir+mC6sqKHiUm02Q5M2
 Es8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SwgMkpNKM1+VEZ2jCT/Y+i+eShsgjra0a21NxLZIL+M=;
 b=cLe8Jh4kFukD30JDhEuiMma1I75fBUz+2LDS3fPXuyHCnRX5pGZV2oj+IMhwfHmi53
 SSFeH6k2iRcDRYKdT9wzarxhfwXUPQa6w2J7FsO11T9Dl54NafWN5CfzaXKMUImUcDOl
 eS6w264B31emSD3hRey+9cqWS630fDRGUdO9cPuNMhO9YcMGYb95nIqWKI2euFHVrXRg
 bFB6yfInAGAi4g8UQbin5NDxhn/dnZe0qDD/BZeshfm9LaUaU7mPV/nieLUwENx5cQ4z
 LMq/MGN03lRUB771MTESqUVLHqRtJXLhRDaRJoHzlKE1jY867JIIJqqcNDIFggmhrJ/i
 7FEw==
X-Gm-Message-State: AOAM530JSRxthpg2nOaqve6SgefhJoFjem3Gj9eil19HFestHvOWtPoO
 8AIKs4pdWfS0jmJAf956iSFLVr1IuFwHvg==
X-Google-Smtp-Source: ABdhPJwG3WZfyJtFjKX+NwF9ZPF/XJAZreHs1p7TwaMhRpveP5jx2nvPlChAWDtlI/jp7XsO0gNuoQ==
X-Received: by 2002:a17:90a:c84:: with SMTP id
 v4mr14015528pja.228.1613821096194; 
 Sat, 20 Feb 2021 03:38:16 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d8f0:71c1:3d6a:4f53])
 by smtp.gmail.com with ESMTPSA id dw23sm11331247pjb.3.2021.02.20.03.38.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Feb 2021 03:38:15 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] ui/console: Pass placeholder surface to displays
Date: Sat, 20 Feb 2021 20:38:10 +0900
Message-Id: <20210220113810.78371-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210219144848.wy7wmel4lixaqkyb@sirius.home.kraxel.org>
References: <20210219144848.wy7wmel4lixaqkyb@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102b.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
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

sdl calls is_placeholder when switching surfaces, and
destroys the window if the given surface was a placeholder. The
other displays simply shows the placeholder when the console is
inactive.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 include/ui/console.h |  6 ++++++
 ui/console.c         | 46 ++++++++++++++++++++++++++++++--------------
 ui/gtk.c             |  4 ----
 ui/sdl2-2d.c         |  7 ++-----
 ui/sdl2-gl.c         |  4 ++--
 ui/spice-display.c   |  6 +++---
 ui/vnc.c             | 10 ----------
 7 files changed, 45 insertions(+), 38 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index d30e972d0b5..e0ac3850858 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -106,6 +106,7 @@ struct QemuConsoleClass {
 };
 
 #define QEMU_ALLOCATED_FLAG     0x01
+#define QEMU_PLACEHOLDER_FLAG   0x02
 
 typedef struct DisplaySurface {
     pixman_format_code_t format;
@@ -281,6 +282,11 @@ static inline int is_buffer_shared(DisplaySurface *surface)
     return !(surface->flags & QEMU_ALLOCATED_FLAG);
 }
 
+static inline int is_placeholder(DisplaySurface *surface)
+{
+    return surface->flags & QEMU_PLACEHOLDER_FLAG;
+}
+
 void register_displaychangelistener(DisplayChangeListener *dcl);
 void update_displaychangelistener(DisplayChangeListener *dcl,
                                   uint64_t interval);
diff --git a/ui/console.c b/ui/console.c
index c5d11bc7017..b786c36d5b1 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1088,6 +1088,30 @@ static void console_putchar(QemuConsole *s, int ch)
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
+            placeholder = qemu_create_message_surface(640, 480, placeholder_msg);
+            placeholder->flags |= QEMU_PLACEHOLDER_FLAG;
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
@@ -1104,9 +1128,7 @@ void console_select(unsigned int index)
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
@@ -1545,15 +1567,13 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
     } else {
         con = active_console;
     }
-    if (dcl->ops->dpy_gfx_switch) {
-        if (con) {
-            dcl->ops->dpy_gfx_switch(dcl, con->surface);
-        } else {
-            if (!dummy) {
-                dummy = qemu_create_message_surface(640, 480, nodev);
-            }
-            dcl->ops->dpy_gfx_switch(dcl, dummy);
+    if (con) {
+        dpy_gfx_switch(dcl, con->surface);
+    } else {
+        if (!dummy) {
+            dummy = qemu_create_message_surface(640, 480, nodev);
         }
+        dpy_gfx_switch(dcl, dummy);
     }
     text_console_update_cursor(NULL);
 }
@@ -1685,9 +1705,7 @@ void dpy_gfx_replace_surface(QemuConsole *con,
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
index a2ea85127d5..ddd2e05734e 100644
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
+    if (is_placeholder(new_surface)) {
         sdl2_window_destroy(scon);
         return;
     }
diff --git a/ui/sdl2-gl.c b/ui/sdl2-gl.c
index fd594d74611..a68697714f0 100644
--- a/ui/sdl2-gl.c
+++ b/ui/sdl2-gl.c
@@ -86,7 +86,7 @@ void sdl2_gl_switch(DisplayChangeListener *dcl,
 
     scon->surface = new_surface;
 
-    if (!new_surface) {
+    if (is_placeholder(new_surface)) {
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
index 16bb3be770b..310abc93781 100644
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
-            placeholder = qemu_create_message_surface(640, 480, placeholder_msg);
-        }
-        surface = placeholder;
-    }
-
     vnc_abort_display_jobs(vd);
     vd->ds = surface;
 
-- 
2.24.3 (Apple Git-128)



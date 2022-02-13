Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD414B38FE
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 03:47:42 +0100 (CET)
Received: from localhost ([::1]:37402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJ4vN-0002jA-GR
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 21:47:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4qd-00043T-0E
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:42:47 -0500
Received: from [2607:f8b0:4864:20::432] (port=43566
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4qa-0000PF-Ih
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:42:46 -0500
Received: by mail-pf1-x432.google.com with SMTP id d187so23136523pfa.10
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 18:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s14nHJYWUMABjD8z5BWel6EnhPPQ5KGxmb4e3RIkyLE=;
 b=YvmKTRWTTukN6W7xBbrT6kbErKIHtfhCaoUwXMvlXCdaxyqXkWph79XKBQdA5X1g2z
 VgZEuWNYV2ohs0aza4pmcMhOs+kAXjfIIY5dwFKp2MCPBfGyf3/809W8Y2Qfk/aCy4xe
 +FfdQafFpRp8wFaOy9IDmwEowLbwmgq01r4yt+yGUqnMaEFr32ERr3xnIVqWTmvhEECg
 nxYpcePqnj3UM8HrRJqE+fRZFA3/sYs/8fGuMDedjQLq/2pnNxGXN42QFa5ay+J3Lsew
 Rd/SfNiC3ckIfkEFTGr9/WTh8FqjOPHFborbTdtPdJm+i7wpRirr9S7NFUuwSnv8wjgG
 13WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s14nHJYWUMABjD8z5BWel6EnhPPQ5KGxmb4e3RIkyLE=;
 b=FselpHssXP/Luup/USNoi8GNm0L9j8uN5MBtZK+2w2+OWQtZZIx0PNswHtkyo75PST
 0fQRyzk/9DbQjzm7c8ABxdab6yev6sNaSS4mkKeg6lMvjdLQXb25bc2H752HYB6Nm4LK
 /an3lU7EqsS0zihY4pfm/sPj3nSw7hlVqqcEBssVaY8Nrzlj5gPhvZgAd9HXHVnwr2f0
 5/eAGKJxwl3FgxHTQjFl2trYH8UtpyinA0WUaSyeuZC0qzOBYaknwyfFT91V97glarp2
 AUH2m2nFJ8T874Z3qIXBfrd12anVLXBSK165GWyG4QyrQf3HGZlwidkoqNuqfuq2rx4b
 Ol0A==
X-Gm-Message-State: AOAM530TLqNP5ibOsct/viZE6q22y1tde3qarMLbay4i3p/B8/JVL5X2
 G1gWChmC9PHJFRe3PPV6vkbzRRF+e/k=
X-Google-Smtp-Source: ABdhPJx8peoAhCHMs1V6KaR6OpOTWe3zvdj+6aEEEQ/EcA9t+aMoqv8+PREEYv+Dt5f5dyyFkKgykw==
X-Received: by 2002:a63:41c6:: with SMTP id o189mr6668380pga.414.1644720163088; 
 Sat, 12 Feb 2022 18:42:43 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d85b:35dd:dae2:b7a9])
 by smtp.gmail.com with ESMTPSA id l11sm9128954pjm.23.2022.02.12.18.42.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 12 Feb 2022 18:42:42 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 2/6] Revert "console: save current scanout details"
Date: Sun, 13 Feb 2022 11:42:18 +0900
Message-Id: <20220213024222.3548-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220213024222.3548-1-akihiko.odaki@gmail.com>
References: <20220213024222.3548-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit ebced091854517f063c46ce8e522ebc45e9bccdf.

This fixes the compatibility between egl-headless and displays
using console_select, most importantly vnc.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 include/ui/console.h |  27 -------
 ui/console.c         | 165 ++++++++++++++-----------------------------
 2 files changed, 54 insertions(+), 138 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index f590819880b..eefd7e4dc1f 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -108,17 +108,6 @@ struct QemuConsoleClass {
 #define QEMU_ALLOCATED_FLAG     0x01
 #define QEMU_PLACEHOLDER_FLAG   0x02
 
-typedef struct ScanoutTexture {
-    uint32_t backing_id;
-    bool backing_y_0_top;
-    uint32_t backing_width;
-    uint32_t backing_height;
-    uint32_t x;
-    uint32_t y;
-    uint32_t width;
-    uint32_t height;
-} ScanoutTexture;
-
 typedef struct DisplaySurface {
     pixman_format_code_t format;
     pixman_image_t *image;
@@ -189,22 +178,6 @@ typedef struct QemuDmaBuf {
     bool      draw_submitted;
 } QemuDmaBuf;
 
-enum display_scanout {
-    SCANOUT_NONE,
-    SCANOUT_SURFACE,
-    SCANOUT_TEXTURE,
-    SCANOUT_DMABUF,
-};
-
-typedef struct DisplayScanout {
-    enum display_scanout kind;
-    union {
-        /* DisplaySurface *surface; is kept in QemuConsole */
-        ScanoutTexture texture;
-        QemuDmaBuf *dmabuf;
-    };
-} DisplayScanout;
-
 typedef struct DisplayState DisplayState;
 typedef struct DisplayGLCtx DisplayGLCtx;
 
diff --git a/ui/console.c b/ui/console.c
index 40eebb6d2cc..78583df9203 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -77,7 +77,6 @@ struct QemuConsole {
     console_type_t console_type;
     DisplayState *ds;
     DisplaySurface *surface;
-    DisplayScanout scanout;
     int dcls;
     DisplayGLCtx *gl;
     int gl_block;
@@ -147,7 +146,6 @@ static void dpy_refresh(DisplayState *s);
 static DisplayState *get_alloc_displaystate(void);
 static void text_console_update_cursor_timer(void);
 static void text_console_update_cursor(void *opaque);
-static bool displaychangelistener_has_dmabuf(DisplayChangeListener *dcl);
 
 static void gui_update(void *opaque)
 {
@@ -483,8 +481,6 @@ static void text_console_resize(QemuConsole *s)
     TextCell *cells, *c, *c1;
     int w1, x, y, last_width;
 
-    assert(s->scanout.kind == SCANOUT_SURFACE);
-
     last_width = s->width;
     s->width = surface_width(s->surface) / FONT_WIDTH;
     s->height = surface_height(s->surface) / FONT_HEIGHT;
@@ -1056,48 +1052,6 @@ static void console_putchar(QemuConsole *s, int ch)
     }
 }
 
-static void displaychangelistener_display_console(DisplayChangeListener *dcl,
-                                                  QemuConsole *con)
-{
-    static const char nodev[] =
-        "This VM has no graphic display device.";
-    static DisplaySurface *dummy;
-
-    if (!con) {
-        if (!dcl->ops->dpy_gfx_switch) {
-            return;
-        }
-        if (!dummy) {
-            dummy = qemu_create_placeholder_surface(640, 480, nodev);
-        }
-        dcl->ops->dpy_gfx_switch(dcl, dummy);
-        return;
-    }
-
-    if (con->scanout.kind == SCANOUT_DMABUF &&
-        displaychangelistener_has_dmabuf(dcl)) {
-        dcl->ops->dpy_gl_scanout_dmabuf(dcl, con->scanout.dmabuf);
-    } else if (con->scanout.kind == SCANOUT_TEXTURE &&
-               dcl->ops->dpy_gl_scanout_texture) {
-        dcl->ops->dpy_gl_scanout_texture(dcl,
-                                         con->scanout.texture.backing_id,
-                                         con->scanout.texture.backing_y_0_top,
-                                         con->scanout.texture.backing_width,
-                                         con->scanout.texture.backing_height,
-                                         con->scanout.texture.x,
-                                         con->scanout.texture.y,
-                                         con->scanout.texture.width,
-                                         con->scanout.texture.height);
-    } else if (con->scanout.kind == SCANOUT_SURFACE &&
-               dcl->ops->dpy_gfx_switch) {
-        dcl->ops->dpy_gfx_switch(dcl, con->surface);
-    }
-
-    dcl->ops->dpy_gfx_update(dcl, 0, 0,
-                             qemu_console_get_width(con, 0),
-                             qemu_console_get_height(con, 0));
-}
-
 void console_select(unsigned int index)
 {
     DisplayChangeListener *dcl;
@@ -1114,7 +1068,13 @@ void console_select(unsigned int index)
                 if (dcl->con != NULL) {
                     continue;
                 }
-                displaychangelistener_display_console(dcl, s);
+                if (dcl->ops->dpy_gfx_switch) {
+                    dcl->ops->dpy_gfx_switch(dcl, s->surface);
+                }
+            }
+            if (s->surface) {
+                dpy_gfx_update(s, 0, 0, surface_width(s->surface),
+                               surface_height(s->surface));
             }
         }
         if (ds->have_text) {
@@ -1520,6 +1480,9 @@ static bool dpy_gl_compatible_with(QemuConsole *con, DisplayChangeListener *dcl)
 
 void register_displaychangelistener(DisplayChangeListener *dcl)
 {
+    static const char nodev[] =
+        "This VM has no graphic display device.";
+    static DisplaySurface *dummy;
     QemuConsole *con;
 
     assert(!dcl->ds);
@@ -1544,7 +1507,16 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
     } else {
         con = active_console;
     }
-    displaychangelistener_display_console(dcl, con);
+    if (dcl->ops->dpy_gfx_switch) {
+        if (con) {
+            dcl->ops->dpy_gfx_switch(dcl, con->surface);
+        } else {
+            if (!dummy) {
+                dummy = qemu_create_placeholder_surface(640, 480, nodev);
+            }
+            dcl->ops->dpy_gfx_switch(dcl, dummy);
+        }
+    }
     text_console_update_cursor(NULL);
 }
 
@@ -1625,9 +1597,13 @@ void dpy_gfx_update(QemuConsole *con, int x, int y, int w, int h)
 {
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
-    int width = qemu_console_get_width(con, x + w);
-    int height = qemu_console_get_height(con, y + h);
+    int width = w;
+    int height = h;
 
+    if (con->surface) {
+        width = surface_width(con->surface);
+        height = surface_height(con->surface);
+    }
     x = MAX(x, 0);
     y = MAX(y, 0);
     x = MIN(x, width);
@@ -1650,10 +1626,12 @@ void dpy_gfx_update(QemuConsole *con, int x, int y, int w, int h)
 
 void dpy_gfx_update_full(QemuConsole *con)
 {
-    int w = qemu_console_get_width(con, 0);
-    int h = qemu_console_get_height(con, 0);
-
-    dpy_gfx_update(con, 0, 0, w, h);
+    if (!con->surface) {
+        return;
+    }
+    dpy_gfx_update(con, 0, 0,
+                   surface_width(con->surface),
+                   surface_height(con->surface));
 }
 
 void dpy_gfx_replace_surface(QemuConsole *con,
@@ -1680,7 +1658,6 @@ void dpy_gfx_replace_surface(QemuConsole *con,
 
     assert(old_surface != surface);
 
-    con->scanout.kind = SCANOUT_SURFACE;
     con->surface = surface;
     QLIST_FOREACH(dcl, &s->listeners, next) {
         if (con != (dcl->con ? dcl->con : active_console)) {
@@ -1856,9 +1833,6 @@ void dpy_gl_scanout_disable(QemuConsole *con)
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
 
-    if (con->scanout.kind != SCANOUT_SURFACE) {
-        con->scanout.kind = SCANOUT_NONE;
-    }
     QLIST_FOREACH(dcl, &s->listeners, next) {
         dcl->ops->dpy_gl_scanout_disable(dcl);
     }
@@ -1875,11 +1849,6 @@ void dpy_gl_scanout_texture(QemuConsole *con,
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
 
-    con->scanout.kind = SCANOUT_TEXTURE;
-    con->scanout.texture = (ScanoutTexture) {
-        backing_id, backing_y_0_top, backing_width, backing_height,
-        x, y, width, height
-    };
     QLIST_FOREACH(dcl, &s->listeners, next) {
         dcl->ops->dpy_gl_scanout_texture(dcl, backing_id,
                                          backing_y_0_top,
@@ -1894,8 +1863,6 @@ void dpy_gl_scanout_dmabuf(QemuConsole *con,
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
 
-    con->scanout.kind = SCANOUT_DMABUF;
-    con->scanout.dmabuf = dmabuf;
     QLIST_FOREACH(dcl, &s->listeners, next) {
         dcl->ops->dpy_gl_scanout_dmabuf(dcl, dmabuf);
     }
@@ -2022,8 +1989,10 @@ QemuConsole *graphic_console_init(DeviceState *dev, uint32_t head,
     s = qemu_console_lookup_unused();
     if (s) {
         trace_console_gfx_reuse(s->index);
-        width = qemu_console_get_width(s, 0);
-        height = qemu_console_get_height(s, 0);
+        if (s->surface) {
+            width = surface_width(s->surface);
+            height = surface_height(s->surface);
+        }
     } else {
         trace_console_gfx_new();
         s = new_console(ds, GRAPHIC_CONSOLE, head);
@@ -2052,8 +2021,13 @@ void graphic_console_close(QemuConsole *con)
     static const char unplugged[] =
         "Guest display has been unplugged";
     DisplaySurface *surface;
-    int width = qemu_console_get_width(con, 640);
-    int height = qemu_console_get_height(con, 480);
+    int width = 640;
+    int height = 480;
+
+    if (con->surface) {
+        width = surface_width(con->surface);
+        height = surface_height(con->surface);
+    }
 
     trace_console_gfx_close(con->index);
     object_property_set_link(OBJECT(con), "device", NULL, &error_abort);
@@ -2205,19 +2179,7 @@ int qemu_console_get_width(QemuConsole *con, int fallback)
     if (con == NULL) {
         con = active_console;
     }
-    if (con == NULL) {
-        return fallback;
-    }
-    switch (con->scanout.kind) {
-    case SCANOUT_DMABUF:
-        return con->scanout.dmabuf->width;
-    case SCANOUT_TEXTURE:
-        return con->scanout.texture.width;
-    case SCANOUT_SURFACE:
-        return surface_width(con->surface);
-    default:
-        return fallback;
-    }
+    return con ? surface_width(con->surface) : fallback;
 }
 
 int qemu_console_get_height(QemuConsole *con, int fallback)
@@ -2225,19 +2187,7 @@ int qemu_console_get_height(QemuConsole *con, int fallback)
     if (con == NULL) {
         con = active_console;
     }
-    if (con == NULL) {
-        return fallback;
-    }
-    switch (con->scanout.kind) {
-    case SCANOUT_DMABUF:
-        return con->scanout.dmabuf->height;
-    case SCANOUT_TEXTURE:
-        return con->scanout.texture.height;
-    case SCANOUT_SURFACE:
-        return surface_height(con->surface);
-    default:
-        return fallback;
-    }
+    return con ? surface_height(con->surface) : fallback;
 }
 
 static void vc_chr_accept_input(Chardev *chr)
@@ -2303,13 +2253,12 @@ static void text_console_do_init(Chardev *chr, DisplayState *ds)
     s->total_height = DEFAULT_BACKSCROLL;
     s->x = 0;
     s->y = 0;
-    if (s->scanout.kind != SCANOUT_SURFACE) {
-        if (active_console && active_console->scanout.kind == SCANOUT_SURFACE) {
-            g_width = qemu_console_get_width(active_console, g_width);
-            g_height = qemu_console_get_height(active_console, g_height);
+    if (!s->surface) {
+        if (active_console && active_console->surface) {
+            g_width = surface_width(active_console->surface);
+            g_height = surface_height(active_console->surface);
         }
         s->surface = qemu_create_displaysurface(g_width, g_height);
-        s->scanout.kind = SCANOUT_SURFACE;
     }
 
     s->hw_ops = &text_console_ops;
@@ -2368,7 +2317,6 @@ static void vc_chr_open(Chardev *chr,
         s = new_console(NULL, TEXT_CONSOLE, 0);
     } else {
         s = new_console(NULL, TEXT_CONSOLE_FIXED_SIZE, 0);
-        s->scanout.kind = SCANOUT_SURFACE;
         s->surface = qemu_create_displaysurface(width, height);
     }
 
@@ -2392,13 +2340,13 @@ static void vc_chr_open(Chardev *chr,
 
 void qemu_console_resize(QemuConsole *s, int width, int height)
 {
-    DisplaySurface *surface = qemu_console_surface(s);
+    DisplaySurface *surface;
 
     assert(s->console_type == GRAPHIC_CONSOLE);
 
-    if (surface && (surface->flags & QEMU_ALLOCATED_FLAG) &&
-        pixman_image_get_width(surface->image) == width &&
-        pixman_image_get_height(surface->image) == height) {
+    if (s->surface && (s->surface->flags & QEMU_ALLOCATED_FLAG) &&
+        pixman_image_get_width(s->surface->image) == width &&
+        pixman_image_get_height(s->surface->image) == height) {
         return;
     }
 
@@ -2408,12 +2356,7 @@ void qemu_console_resize(QemuConsole *s, int width, int height)
 
 DisplaySurface *qemu_console_surface(QemuConsole *console)
 {
-    switch (console->scanout.kind) {
-    case SCANOUT_SURFACE:
-        return console->surface;
-    default:
-        return NULL;
-    }
+    return console->surface;
 }
 
 PixelFormat qemu_default_pixelformat(int bpp)
-- 
2.32.0 (Apple Git-132)



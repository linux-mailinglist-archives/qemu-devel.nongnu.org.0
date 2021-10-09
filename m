Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0876A427D97
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:19:47 +0200 (CEST)
Received: from localhost ([::1]:34246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJkw-0005br-1L
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJep-0004N1-Ps
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:13:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJen-0000Ka-Kh
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633814005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gdrh1WttbD9Ef6H6OHMMRjJzHyjSEtMuirKIItNL+tg=;
 b=Fuy1T3sE5RJeOk7TrFplO0+pWKxFJMnfAz39x5tmUR9AcIpGhPksN2+kAJTl6oh3O63rm+
 4X8eHT9TJ2iYtTer+a6k9ehSaG6IGEtwoPyLhkz9qYckeBvg2Ew/q5qTKghIrA3E5kMAhD
 agq7gmx9cx8V9bZTc5TiYyUjrZqBjwE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-pe4cHEoHMBGk2MfckisC3g-1; Sat, 09 Oct 2021 17:13:23 -0400
X-MC-Unique: pe4cHEoHMBGk2MfckisC3g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC165180830F
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:13:22 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D08060622;
 Sat,  9 Oct 2021 21:13:12 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/37] console: save current scanout details
Date: Sun, 10 Oct 2021 01:08:20 +0400
Message-Id: <20211009210838.2219430-20-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Add a new DisplayScanout structure to save the current scanout details.
This allows to attach later UI backends and set the scanout.

Introduce displaychangelistener_display_console() helper function to
handle the dpy_gfx_switch/gl_scanout() & dpy_gfx_update() calls.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h |  27 +++++++
 ui/console.c         | 165 +++++++++++++++++++++++++++++--------------
 2 files changed, 138 insertions(+), 54 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index b23ae283be..ab55d71894 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -108,6 +108,17 @@ struct QemuConsoleClass {
 #define QEMU_ALLOCATED_FLAG     0x01
 #define QEMU_PLACEHOLDER_FLAG   0x02
 
+typedef struct ScanoutTexture {
+    uint32_t backing_id;
+    bool backing_y_0_top;
+    uint32_t backing_width;
+    uint32_t backing_height;
+    uint32_t x;
+    uint32_t y;
+    uint32_t width;
+    uint32_t height;
+} ScanoutTexture;
+
 typedef struct DisplaySurface {
     pixman_format_code_t format;
     pixman_image_t *image;
@@ -173,6 +184,22 @@ typedef struct QemuDmaBuf {
     bool      allow_fences;
 } QemuDmaBuf;
 
+enum display_scanout {
+    SCANOUT_NONE,
+    SCANOUT_SURFACE,
+    SCANOUT_TEXTURE,
+    SCANOUT_DMABUF,
+};
+
+typedef struct DisplayScanout {
+    enum display_scanout kind;
+    union {
+        /* DisplaySurface *surface; is kept in QemuConsole */
+        ScanoutTexture texture;
+        QemuDmaBuf *dmabuf;
+    };
+} DisplayScanout;
+
 typedef struct DisplayState DisplayState;
 typedef struct DisplayGLCtx DisplayGLCtx;
 
diff --git a/ui/console.c b/ui/console.c
index e5a2c84dd9..a1c6a78523 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -126,6 +126,7 @@ struct QemuConsole {
     console_type_t console_type;
     DisplayState *ds;
     DisplaySurface *surface;
+    DisplayScanout scanout;
     int dcls;
     DisplayGLCtx *gl;
     int gl_block;
@@ -197,6 +198,7 @@ static void dpy_refresh(DisplayState *s);
 static DisplayState *get_alloc_displaystate(void);
 static void text_console_update_cursor_timer(void);
 static void text_console_update_cursor(void *opaque);
+static bool displaychangelistener_has_dmabuf(DisplayChangeListener *dcl);
 
 static void gui_update(void *opaque)
 {
@@ -532,6 +534,8 @@ static void text_console_resize(QemuConsole *s)
     TextCell *cells, *c, *c1;
     int w1, x, y, last_width;
 
+    assert(s->scanout.kind == SCANOUT_SURFACE);
+
     last_width = s->width;
     s->width = surface_width(s->surface) / FONT_WIDTH;
     s->height = surface_height(s->surface) / FONT_HEIGHT;
@@ -1103,6 +1107,48 @@ static void console_putchar(QemuConsole *s, int ch)
     }
 }
 
+static void displaychangelistener_display_console(DisplayChangeListener *dcl,
+                                                  QemuConsole *con)
+{
+    static const char nodev[] =
+        "This VM has no graphic display device.";
+    static DisplaySurface *dummy;
+
+    if (!con) {
+        if (!dcl->ops->dpy_gfx_switch) {
+            return;
+        }
+        if (!dummy) {
+            dummy = qemu_create_placeholder_surface(640, 480, nodev);
+        }
+        dcl->ops->dpy_gfx_switch(dcl, dummy);
+        return;
+    }
+
+    if (con->scanout.kind == SCANOUT_DMABUF &&
+        displaychangelistener_has_dmabuf(dcl)) {
+        dcl->ops->dpy_gl_scanout_dmabuf(dcl, con->scanout.dmabuf);
+    } else if (con->scanout.kind == SCANOUT_TEXTURE &&
+               dcl->ops->dpy_gl_scanout_texture) {
+        dcl->ops->dpy_gl_scanout_texture(dcl,
+                                         con->scanout.texture.backing_id,
+                                         con->scanout.texture.backing_y_0_top,
+                                         con->scanout.texture.backing_width,
+                                         con->scanout.texture.backing_height,
+                                         con->scanout.texture.x,
+                                         con->scanout.texture.y,
+                                         con->scanout.texture.width,
+                                         con->scanout.texture.height);
+    } else if (con->scanout.kind == SCANOUT_SURFACE &&
+               dcl->ops->dpy_gfx_switch) {
+        dcl->ops->dpy_gfx_switch(dcl, con->surface);
+    }
+
+    dcl->ops->dpy_gfx_update(dcl, 0, 0,
+                             qemu_console_get_width(con, 0),
+                             qemu_console_get_height(con, 0));
+}
+
 void console_select(unsigned int index)
 {
     DisplayChangeListener *dcl;
@@ -1119,13 +1165,7 @@ void console_select(unsigned int index)
                 if (dcl->con != NULL) {
                     continue;
                 }
-                if (dcl->ops->dpy_gfx_switch) {
-                    dcl->ops->dpy_gfx_switch(dcl, s->surface);
-                }
-            }
-            if (s->surface) {
-                dpy_gfx_update(s, 0, 0, surface_width(s->surface),
-                               surface_height(s->surface));
+                displaychangelistener_display_console(dcl, s);
             }
         }
         if (ds->have_text) {
@@ -1538,9 +1578,6 @@ static bool dpy_gl_compatible_with(QemuConsole *con, DisplayChangeListener *dcl)
 
 void register_displaychangelistener(DisplayChangeListener *dcl)
 {
-    static const char nodev[] =
-        "This VM has no graphic display device.";
-    static DisplaySurface *dummy;
     QemuConsole *con;
 
     assert(!dcl->ds);
@@ -1565,16 +1602,7 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
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
-        }
-    }
+    displaychangelistener_display_console(dcl, con);
     text_console_update_cursor(NULL);
 }
 
@@ -1655,13 +1683,9 @@ void dpy_gfx_update(QemuConsole *con, int x, int y, int w, int h)
 {
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
-    int width = w;
-    int height = h;
+    int width = qemu_console_get_width(con, x + w);
+    int height = qemu_console_get_height(con, y + h);
 
-    if (con->surface) {
-        width = surface_width(con->surface);
-        height = surface_height(con->surface);
-    }
     x = MAX(x, 0);
     y = MAX(y, 0);
     x = MIN(x, width);
@@ -1684,12 +1708,10 @@ void dpy_gfx_update(QemuConsole *con, int x, int y, int w, int h)
 
 void dpy_gfx_update_full(QemuConsole *con)
 {
-    if (!con->surface) {
-        return;
-    }
-    dpy_gfx_update(con, 0, 0,
-                   surface_width(con->surface),
-                   surface_height(con->surface));
+    int w = qemu_console_get_width(con, 0);
+    int h = qemu_console_get_height(con, 0);
+
+    dpy_gfx_update(con, 0, 0, w, h);
 }
 
 void dpy_gfx_replace_surface(QemuConsole *con,
@@ -1716,6 +1738,7 @@ void dpy_gfx_replace_surface(QemuConsole *con,
 
     assert(old_surface != surface);
 
+    con->scanout.kind = SCANOUT_SURFACE;
     con->surface = surface;
     QLIST_FOREACH(dcl, &s->listeners, next) {
         if (con != (dcl->con ? dcl->con : active_console)) {
@@ -1891,6 +1914,9 @@ void dpy_gl_scanout_disable(QemuConsole *con)
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
 
+    if (con->scanout.kind != SCANOUT_SURFACE) {
+        con->scanout.kind = SCANOUT_NONE;
+    }
     QLIST_FOREACH(dcl, &s->listeners, next) {
         dcl->ops->dpy_gl_scanout_disable(dcl);
     }
@@ -1907,6 +1933,11 @@ void dpy_gl_scanout_texture(QemuConsole *con,
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
 
+    con->scanout.kind = SCANOUT_TEXTURE;
+    con->scanout.texture = (ScanoutTexture) {
+        backing_id, backing_y_0_top, backing_width, backing_height,
+        x, y, width, height
+    };
     QLIST_FOREACH(dcl, &s->listeners, next) {
         dcl->ops->dpy_gl_scanout_texture(dcl, backing_id,
                                          backing_y_0_top,
@@ -1921,6 +1952,8 @@ void dpy_gl_scanout_dmabuf(QemuConsole *con,
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
 
+    con->scanout.kind = SCANOUT_DMABUF;
+    con->scanout.dmabuf = dmabuf;
     QLIST_FOREACH(dcl, &s->listeners, next) {
         dcl->ops->dpy_gl_scanout_dmabuf(dcl, dmabuf);
     }
@@ -2047,10 +2080,8 @@ QemuConsole *graphic_console_init(DeviceState *dev, uint32_t head,
     s = qemu_console_lookup_unused();
     if (s) {
         trace_console_gfx_reuse(s->index);
-        if (s->surface) {
-            width = surface_width(s->surface);
-            height = surface_height(s->surface);
-        }
+        width = qemu_console_get_width(s, 0);
+        height = qemu_console_get_height(s, 0);
     } else {
         trace_console_gfx_new();
         s = new_console(ds, GRAPHIC_CONSOLE, head);
@@ -2079,13 +2110,8 @@ void graphic_console_close(QemuConsole *con)
     static const char unplugged[] =
         "Guest display has been unplugged";
     DisplaySurface *surface;
-    int width = 640;
-    int height = 480;
-
-    if (con->surface) {
-        width = surface_width(con->surface);
-        height = surface_height(con->surface);
-    }
+    int width = qemu_console_get_width(con, 640);
+    int height = qemu_console_get_height(con, 480);
 
     trace_console_gfx_close(con->index);
     object_property_set_link(OBJECT(con), "device", NULL, &error_abort);
@@ -2237,7 +2263,19 @@ int qemu_console_get_width(QemuConsole *con, int fallback)
     if (con == NULL) {
         con = active_console;
     }
-    return con ? surface_width(con->surface) : fallback;
+    if (con == NULL) {
+        return fallback;
+    }
+    switch (con->scanout.kind) {
+    case SCANOUT_DMABUF:
+        return con->scanout.dmabuf->width;
+    case SCANOUT_TEXTURE:
+        return con->scanout.texture.width;
+    case SCANOUT_SURFACE:
+        return surface_width(con->surface);
+    default:
+        return fallback;
+    }
 }
 
 int qemu_console_get_height(QemuConsole *con, int fallback)
@@ -2245,7 +2283,19 @@ int qemu_console_get_height(QemuConsole *con, int fallback)
     if (con == NULL) {
         con = active_console;
     }
-    return con ? surface_height(con->surface) : fallback;
+    if (con == NULL) {
+        return fallback;
+    }
+    switch (con->scanout.kind) {
+    case SCANOUT_DMABUF:
+        return con->scanout.dmabuf->height;
+    case SCANOUT_TEXTURE:
+        return con->scanout.texture.height;
+    case SCANOUT_SURFACE:
+        return surface_height(con->surface);
+    default:
+        return fallback;
+    }
 }
 
 static void vc_chr_set_echo(Chardev *chr, bool echo)
@@ -2305,12 +2355,13 @@ static void text_console_do_init(Chardev *chr, DisplayState *ds)
     s->total_height = DEFAULT_BACKSCROLL;
     s->x = 0;
     s->y = 0;
-    if (!s->surface) {
-        if (active_console && active_console->surface) {
-            g_width = surface_width(active_console->surface);
-            g_height = surface_height(active_console->surface);
+    if (s->scanout.kind != SCANOUT_SURFACE) {
+        if (active_console && active_console->scanout.kind == SCANOUT_SURFACE) {
+            g_width = qemu_console_get_width(active_console, g_width);
+            g_height = qemu_console_get_height(active_console, g_height);
         }
         s->surface = qemu_create_displaysurface(g_width, g_height);
+        s->scanout.kind = SCANOUT_SURFACE;
     }
 
     s->hw_ops = &text_console_ops;
@@ -2369,6 +2420,7 @@ static void vc_chr_open(Chardev *chr,
         s = new_console(NULL, TEXT_CONSOLE, 0);
     } else {
         s = new_console(NULL, TEXT_CONSOLE_FIXED_SIZE, 0);
+        s->scanout.kind = SCANOUT_SURFACE;
         s->surface = qemu_create_displaysurface(width, height);
     }
 
@@ -2392,13 +2444,13 @@ static void vc_chr_open(Chardev *chr,
 
 void qemu_console_resize(QemuConsole *s, int width, int height)
 {
-    DisplaySurface *surface;
+    DisplaySurface *surface = qemu_console_surface(s);
 
     assert(s->console_type == GRAPHIC_CONSOLE);
 
-    if (s->surface && (s->surface->flags & QEMU_ALLOCATED_FLAG) &&
-        pixman_image_get_width(s->surface->image) == width &&
-        pixman_image_get_height(s->surface->image) == height) {
+    if (surface && (surface->flags & QEMU_ALLOCATED_FLAG) &&
+        pixman_image_get_width(surface->image) == width &&
+        pixman_image_get_height(surface->image) == height) {
         return;
     }
 
@@ -2408,7 +2460,12 @@ void qemu_console_resize(QemuConsole *s, int width, int height)
 
 DisplaySurface *qemu_console_surface(QemuConsole *console)
 {
-    return console->surface;
+    switch (console->scanout.kind) {
+    case SCANOUT_SURFACE:
+        return console->surface;
+    default:
+        return NULL;
+    }
 }
 
 PixelFormat qemu_default_pixelformat(int bpp)
-- 
2.33.0.721.g106298f7f9



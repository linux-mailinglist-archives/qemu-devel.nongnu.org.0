Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A583389AE
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:09:50 +0100 (CET)
Received: from localhost ([::1]:44510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKejt-0000is-NK
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:09:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKedu-0000e6-9B
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:03:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKedq-0003Eb-BX
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U56jl4RwrMMI3LkyODtdHAQLikCIdgIcdSjtLAbLA58=;
 b=KHIRl327LVl8VSKP6ssVRCBq77T0RaQjSlbYQyojRxaNhSQenivyTHw8sZBXtkAoMgsllH
 MUTGadgH1O5dOr4yE8wMw8ouNhXGMLxM2f4jPJXsp4Xk+o6xeJHhOKsDRDWtWU4gvCQHv8
 QKC2S3mijF6dXk3XMiJrRa5ECInP4Jc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-y7vQeKOyPO6N994Q2HxSeQ-1; Fri, 12 Mar 2021 05:03:31 -0500
X-MC-Unique: y7vQeKOyPO6N994Q2HxSeQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7520817468
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:03:30 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C92F56B8E5;
 Fri, 12 Mar 2021 10:03:20 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 13/27] console: save current scanout details
Date: Fri, 12 Mar 2021 14:00:54 +0400
Message-Id: <20210312100108.2706195-14-marcandre.lureau@redhat.com>
In-Reply-To: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Add a new DisplayScanout structure to save the current scanout details.
This allows to attach later UI backends and set the scanout.

Introduce displaychangelistener_display_console() helper function to
handle the dpy_gfx_switch/gl_scanout() & dpy_gfx_update() calls.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h |  27 ++++++++
 ui/console.c         | 161 ++++++++++++++++++++++++++++---------------
 2 files changed, 134 insertions(+), 54 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 793f4c09ee..31141955d9 100644
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
@@ -170,6 +181,22 @@ typedef struct QemuDmaBuf {
     bool      y0_top;
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
index 07357fd328..3c3be032ad 100644
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
@@ -1103,6 +1107,45 @@ static void console_putchar(QemuConsole *s, int ch)
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
+    if (con->scanout.kind == SCANOUT_DMABUF && displaychangelistener_has_dmabuf(dcl)) {
+        dcl->ops->dpy_gl_scanout_dmabuf(dcl, con->scanout.dmabuf);
+    } else if (con->scanout.kind == SCANOUT_TEXTURE && dcl->ops->dpy_gl_scanout_texture) {
+        dcl->ops->dpy_gl_scanout_texture(dcl,
+                                         con->scanout.texture.backing_id,
+                                         con->scanout.texture.backing_y_0_top,
+                                         con->scanout.texture.backing_width,
+                                         con->scanout.texture.backing_height,
+                                         con->scanout.texture.x,
+                                         con->scanout.texture.y,
+                                         con->scanout.texture.width,
+                                         con->scanout.texture.height);
+    } else if (con->scanout.kind == SCANOUT_SURFACE && dcl->ops->dpy_gfx_switch) {
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
@@ -1119,13 +1162,7 @@ void console_select(unsigned int index)
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
@@ -1538,9 +1575,6 @@ static bool dpy_gl_compatible_with(QemuConsole *con, DisplayChangeListener *dcl)
 
 void register_displaychangelistener(DisplayChangeListener *dcl)
 {
-    static const char nodev[] =
-        "This VM has no graphic display device.";
-    static DisplaySurface *dummy;
     QemuConsole *con;
     Error *err = NULL;
 
@@ -1567,16 +1601,7 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
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
 
@@ -1656,13 +1681,9 @@ void dpy_gfx_update(QemuConsole *con, int x, int y, int w, int h)
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
@@ -1685,12 +1706,10 @@ void dpy_gfx_update(QemuConsole *con, int x, int y, int w, int h)
 
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
@@ -1717,6 +1736,7 @@ void dpy_gfx_replace_surface(QemuConsole *con,
 
     assert(old_surface != surface);
 
+    con->scanout.kind = SCANOUT_SURFACE;
     con->surface = surface;
     QLIST_FOREACH(dcl, &s->listeners, next) {
         if (con != (dcl->con ? dcl->con : active_console)) {
@@ -1892,6 +1912,9 @@ void dpy_gl_scanout_disable(QemuConsole *con)
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
 
+    if (con->scanout.kind != SCANOUT_SURFACE) {
+        con->scanout.kind = SCANOUT_NONE;
+    }
     QLIST_FOREACH(dcl, &s->listeners, next) {
         dcl->ops->dpy_gl_scanout_disable(dcl);
     }
@@ -1908,6 +1931,10 @@ void dpy_gl_scanout_texture(QemuConsole *con,
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
 
+    con->scanout.kind = SCANOUT_TEXTURE;
+    con->scanout.texture = (ScanoutTexture) {
+        backing_id, backing_y_0_top, backing_width, backing_height, x, y, width, height
+    };
     QLIST_FOREACH(dcl, &s->listeners, next) {
         dcl->ops->dpy_gl_scanout_texture(dcl, backing_id,
                                          backing_y_0_top,
@@ -1922,6 +1949,8 @@ void dpy_gl_scanout_dmabuf(QemuConsole *con,
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
 
+    con->scanout.kind = SCANOUT_DMABUF;
+    con->scanout.dmabuf = dmabuf;
     QLIST_FOREACH(dcl, &s->listeners, next) {
         dcl->ops->dpy_gl_scanout_dmabuf(dcl, dmabuf);
     }
@@ -2048,10 +2077,8 @@ QemuConsole *graphic_console_init(DeviceState *dev, uint32_t head,
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
@@ -2080,13 +2107,8 @@ void graphic_console_close(QemuConsole *con)
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
@@ -2238,7 +2260,19 @@ int qemu_console_get_width(QemuConsole *con, int fallback)
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
@@ -2246,7 +2280,19 @@ int qemu_console_get_height(QemuConsole *con, int fallback)
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
@@ -2306,12 +2352,13 @@ static void text_console_do_init(Chardev *chr, DisplayState *ds)
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
@@ -2370,6 +2417,7 @@ static void vc_chr_open(Chardev *chr,
         s = new_console(NULL, TEXT_CONSOLE, 0);
     } else {
         s = new_console(NULL, TEXT_CONSOLE_FIXED_SIZE, 0);
+        s->scanout.kind = SCANOUT_SURFACE;
         s->surface = qemu_create_displaysurface(width, height);
     }
 
@@ -2393,13 +2441,13 @@ static void vc_chr_open(Chardev *chr,
 
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
 
@@ -2409,7 +2457,12 @@ void qemu_console_resize(QemuConsole *s, int width, int height)
 
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
2.29.0



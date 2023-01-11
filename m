Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD54C665415
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 06:57:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFU75-0004r7-EO; Wed, 11 Jan 2023 00:57:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1pFU73-0004pZ-Oz
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 00:57:25 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1pFU71-0005DT-CD
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 00:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673416643; x=1704952643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k3AaNblU9GBmE26WWB9Eo1ysXLTOXSfSGl+DRnzDVPk=;
 b=CqWcWnkFHqtuMmOdGpaqSPSpmWv3n3N6h5eN2F4nFOVIUFXh0HU48BUN
 Po6walpnvcxLqlGHixQBb+xO3x7eUD4SiTU5ZTKBqBfrc2YKTej3aBwPb
 wIp8b+RTYaYFHX8bQkN5Qa05gI4vIG+O7/fwi9Wr1Q3OuUr1guGC2LsW3
 gTu/9hJI7tcaMCtP849cIzBr/rq0tWo2Npo4/rXwm8pTJGovPCHWqiCiZ
 oGFipUiTu9lEMQAAFkVUKWBwrO155pXwfZ3TndCfbI17JKtKTMPb09irp
 MgizhuOHkxQFBtsjeU1Mk4CfOGGv6nzBeyuru10r18R1KGnzhp3F+yzd4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="311147389"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="311147389"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 21:57:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="650621156"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="650621156"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 21:57:07 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC v1 2/2] spice: Add an option to forward the dmabuf directly to
 the encoder
Date: Tue, 10 Jan 2023 21:37:07 -0800
Message-Id: <20230111053707.781484-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230111053707.781484-1-vivek.kasireddy@intel.com>
References: <20230111053707.781484-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=vivek.kasireddy@intel.com; helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This patch adds support for gl=on and port != 0. In other words,
with this option enabled, it should be possible to stream the
content associated with the dmabuf without making any additional
copies.

The encoder (that is part of Spice Server) extracts the dmabuf
fd from the drawable (RedDrawable) which in turn gets it from
the scanout. Once the encoder is done encoding the dmabuf, it
triggers an async that would indicate to Qemu to unblock the
pipeline.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/ui/spice-display.h |   2 +
 qemu-options.hx            |   6 ++-
 ui/spice-core.c            |  22 ++++++--
 ui/spice-display.c         | 106 ++++++++++++++++++++++++++-----------
 4 files changed, 101 insertions(+), 35 deletions(-)

diff --git a/include/ui/spice-display.h b/include/ui/spice-display.h
index e271e011da..4f9b3aa2d9 100644
--- a/include/ui/spice-display.h
+++ b/include/ui/spice-display.h
@@ -62,6 +62,7 @@ enum {
     QXL_COOKIE_TYPE_RENDER_UPDATE_AREA,
     QXL_COOKIE_TYPE_POST_LOAD_MONITORS_CONFIG,
     QXL_COOKIE_TYPE_GL_DRAW_DONE,
+    QXL_COOKIE_TYPE_DMABUF_ENCODE_DONE,
 };
 
 typedef struct QXLCookie {
@@ -153,6 +154,7 @@ struct SimpleSpiceCursor {
 };
 
 extern bool spice_opengl;
+extern bool spice_dmabuf_encode;
 
 int qemu_spice_rect_is_empty(const QXLRect* r);
 void qemu_spice_rect_union(QXLRect *dest, const QXLRect *r);
diff --git a/qemu-options.hx b/qemu-options.hx
index aab8df0922..3016f8a6f7 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2143,7 +2143,7 @@ DEF("spice", HAS_ARG, QEMU_OPTION_spice,
     "       [,disable-agent-file-xfer=on|off][,agent-mouse=[on|off]]\n"
     "       [,playback-compression=[on|off]][,seamless-migration=[on|off]]\n"
     "       [,preferred-codec=<encoder>:<codec>\n"
-    "       [,gl=[on|off]][,rendernode=<file>]\n"
+    "       [,gl=[on|off]][,rendernode=<file>][,dmabuf-encode=[on|off]]\n"
     "   enable spice\n"
     "   at least one of {port, tls-port} is mandatory\n",
     QEMU_ARCH_ALL)
@@ -2248,6 +2248,10 @@ SRST
     ``rendernode=<file>``
         DRM render node for OpenGL rendering. If not specified, it will
         pick the first available. (Since 2.9)
+
+    ``dmabuf-encode=[on|off]``
+        Forward the dmabuf directly to the encoder (Gstreamer).
+        Default is off.
 ERST
 
 DEF("portrait", 0, QEMU_OPTION_portrait,
diff --git a/ui/spice-core.c b/ui/spice-core.c
index 6e00211e3a..c9b856b056 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -494,6 +494,9 @@ static QemuOptsList qemu_spice_opts = {
         },{
             .name = "rendernode",
             .type = QEMU_OPT_STRING,
+        },{
+            .name = "dmabuf-encode",
+            .type = QEMU_OPT_BOOL,
 #endif
         },
         { /* end of list */ }
@@ -843,11 +846,24 @@ static void qemu_spice_init(void)
     g_free(password);
 
 #ifdef HAVE_SPICE_GL
+    if (qemu_opt_get_bool(opts, "dmabuf-encode", 0)) {
+        spice_dmabuf_encode = 1;
+    }
     if (qemu_opt_get_bool(opts, "gl", 0)) {
-        if ((port != 0) || (tls_port != 0)) {
-            error_report("SPICE GL support is local-only for now and "
-                         "incompatible with -spice port/tls-port");
+        if (((port != 0) || (tls_port != 0)) && !spice_dmabuf_encode) {
+            error_report("Add dmabuf-encode=on option to enable GL streaming");
             exit(1);
+        } else if (spice_dmabuf_encode) {
+            if (port == 0 && tls_port == 0) {
+                error_report("dmabuf-encode=on is only meant to be used for "
+                             "non-local displays");
+                exit(1);
+            }
+            if (g_strcmp0(preferred_codec, "gstreamer:h264")) {
+                error_report("dmabuf-encode=on currently only works and tested"
+                             "with gstreamer:h264");
+                exit(1);
+            }
         }
         if (egl_rendernode_init(qemu_opt_get(opts, "rendernode"),
                                 DISPLAYGL_MODE_ON) != 0) {
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 494168e7fe..d02ebd7f24 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -28,6 +28,7 @@
 #include "ui/spice-display.h"
 
 bool spice_opengl;
+bool spice_dmabuf_encode;
 
 int qemu_spice_rect_is_empty(const QXLRect* r)
 {
@@ -117,7 +118,7 @@ void qemu_spice_wakeup(SimpleSpiceDisplay *ssd)
 }
 
 static void qemu_spice_create_one_update(SimpleSpiceDisplay *ssd,
-                                         QXLRect *rect)
+                                         QXLRect *rect, int fd)
 {
     SimpleSpiceUpdate *update;
     QXLDrawable *drawable;
@@ -168,15 +169,17 @@ static void qemu_spice_create_one_update(SimpleSpiceDisplay *ssd,
     image->bitmap.palette = 0;
     image->bitmap.format = SPICE_BITMAP_FMT_32BIT;
 
-    dest = pixman_image_create_bits(PIXMAN_LE_x8r8g8b8, bw, bh,
-                                    (void *)update->bitmap, bw * 4);
-    pixman_image_composite(PIXMAN_OP_SRC, ssd->surface, NULL, ssd->mirror,
-                           rect->left, rect->top, 0, 0,
-                           rect->left, rect->top, bw, bh);
-    pixman_image_composite(PIXMAN_OP_SRC, ssd->mirror, NULL, dest,
-                           rect->left, rect->top, 0, 0,
-                           0, 0, bw, bh);
-    pixman_image_unref(dest);
+    if (fd == 0) {
+        dest = pixman_image_create_bits(PIXMAN_LE_x8r8g8b8, bw, bh,
+                                        (void *)update->bitmap, bw * 4);
+        pixman_image_composite(PIXMAN_OP_SRC, ssd->surface, NULL, ssd->mirror,
+                               rect->left, rect->top, 0, 0,
+                               rect->left, rect->top, bw, bh);
+        pixman_image_composite(PIXMAN_OP_SRC, ssd->mirror, NULL, dest,
+                               rect->left, rect->top, 0, 0,
+                               0, 0, bw, bh);
+        pixman_image_unref(dest);
+    }
 
     cmd->type = QXL_CMD_DRAW;
     cmd->data = (uintptr_t)drawable;
@@ -220,7 +223,7 @@ static void qemu_spice_create_update(SimpleSpiceDisplay *ssd)
                         .left   = x,
                         .right  = x + bw,
                     };
-                    qemu_spice_create_one_update(ssd, &update);
+                    qemu_spice_create_one_update(ssd, &update, 0);
                     dirty_top[blk] = -1;
                 }
             } else {
@@ -241,7 +244,7 @@ static void qemu_spice_create_update(SimpleSpiceDisplay *ssd)
                 .left   = x,
                 .right  = x + bw,
             };
-            qemu_spice_create_one_update(ssd, &update);
+            qemu_spice_create_one_update(ssd, &update, 0);
             dirty_top[blk] = -1;
         }
     }
@@ -642,6 +645,7 @@ static void interface_async_complete(QXLInstance *sin, uint64_t cookie_token)
     switch (cookie->type) {
 #ifdef HAVE_SPICE_GL
     case QXL_COOKIE_TYPE_GL_DRAW_DONE:
+    case QXL_COOKIE_TYPE_DMABUF_ENCODE_DONE:
     {
         SimpleSpiceDisplay *ssd = container_of(sin, SimpleSpiceDisplay, qxl);
         qemu_bh_schedule(ssd->gl_unblock_bh);
@@ -853,7 +857,8 @@ static void spice_gl_refresh(DisplayChangeListener *dcl)
     SimpleSpiceDisplay *ssd = container_of(dcl, SimpleSpiceDisplay, dcl);
     uint64_t cookie;
 
-    if (!ssd->ds || qemu_console_is_gl_blocked(ssd->dcl.con)) {
+    if (!ssd->ds || qemu_console_is_gl_blocked(ssd->dcl.con) ||
+        spice_dmabuf_encode) {
         return;
     }
 
@@ -879,6 +884,33 @@ static void spice_gl_update(DisplayChangeListener *dcl,
     ssd->gl_updates++;
 }
 
+static void spice_gl_create_update(SimpleSpiceDisplay *ssd, int fd,
+                                   uint32_t width, uint32_t height,
+                                   uint32_t stride, uint32_t format,
+                                   int y_0_top)
+{
+    uint64_t cookie;
+
+    if (spice_dmabuf_encode) {
+        QXLRect update = {
+            .top    = 0,
+            .bottom = height,
+            .left   = 0,
+            .right  = width,
+        };
+
+        qemu_mutex_lock(&ssd->lock);
+        qemu_spice_create_one_update(ssd, &update, fd);
+        cookie = (uintptr_t)qxl_cookie_new(QXL_COOKIE_TYPE_DMABUF_ENCODE_DONE,
+                                           0);
+        spice_qxl_dmabuf_encode_async(&ssd->qxl, fd, cookie);
+        qemu_mutex_unlock(&ssd->lock);
+    } else {
+        spice_qxl_gl_scanout(&ssd->qxl, fd, width, height,
+                             stride, format, y_0_top);
+    }
+}
+
 static void spice_gl_switch(DisplayChangeListener *dcl,
                             struct DisplaySurface *new_surface)
 {
@@ -891,6 +923,9 @@ static void spice_gl_switch(DisplayChangeListener *dcl,
     }
     ssd->ds = new_surface;
     if (ssd->ds) {
+        if (spice_dmabuf_encode) {
+            qemu_spice_create_host_primary(ssd);
+        }
         surface_gl_create_texture(ssd->gls, ssd->ds);
         fd = egl_get_fd_for_texture(ssd->ds->texture,
                                     &stride, &fourcc,
@@ -906,10 +941,10 @@ static void spice_gl_switch(DisplayChangeListener *dcl,
                                     fourcc);
 
         /* note: spice server will close the fd */
-        spice_qxl_gl_scanout(&ssd->qxl, fd,
-                             surface_width(ssd->ds),
-                             surface_height(ssd->ds),
-                             stride, fourcc, false);
+        spice_gl_create_update(ssd, fd, surface_width(ssd->ds),
+                               surface_height(ssd->ds), stride,
+                               fourcc, false);
+
         ssd->have_surface = true;
         ssd->have_scanout = false;
 
@@ -932,7 +967,9 @@ static void qemu_spice_gl_scanout_disable(DisplayChangeListener *dcl)
     SimpleSpiceDisplay *ssd = container_of(dcl, SimpleSpiceDisplay, dcl);
 
     trace_qemu_spice_gl_scanout_disable(ssd->qxl.id);
-    spice_qxl_gl_scanout(&ssd->qxl, -1, 0, 0, 0, 0, false);
+    if (!spice_dmabuf_encode) {
+        spice_qxl_gl_scanout(&ssd->qxl, -1, 0, 0, 0, 0, false);
+    }
     qemu_spice_gl_monitor_config(ssd, 0, 0, 0, 0);
     ssd->have_surface = false;
     ssd->have_scanout = false;
@@ -959,8 +996,9 @@ static void qemu_spice_gl_scanout_texture(DisplayChangeListener *dcl,
     trace_qemu_spice_gl_scanout_texture(ssd->qxl.id, w, h, fourcc);
 
     /* note: spice server will close the fd */
-    spice_qxl_gl_scanout(&ssd->qxl, fd, backing_width, backing_height,
-                         stride, fourcc, y_0_top);
+    spice_gl_create_update(ssd, fd, backing_width, backing_height,
+                           stride, fourcc, y_0_top);
+
     qemu_spice_gl_monitor_config(ssd, x, y, w, h);
     ssd->have_surface = false;
     ssd->have_scanout = true;
@@ -1032,7 +1070,7 @@ static void qemu_spice_gl_update(DisplayChangeListener *dcl,
     bool render_cursor = false;
     bool y_0_top = false; /* FIXME */
     uint64_t cookie;
-    int fd;
+    int fd = 0;
 
     if (!ssd->have_scanout) {
         return;
@@ -1047,7 +1085,7 @@ static void qemu_spice_gl_update(DisplayChangeListener *dcl,
         egl_fb_destroy(&ssd->blit_fb);
     }
 
-    if (ssd->guest_dmabuf_refresh) {
+    if (ssd->guest_dmabuf_refresh || spice_dmabuf_encode) {
         QemuDmaBuf *dmabuf = ssd->guest_dmabuf;
         if (render_cursor) {
             egl_dmabuf_import_texture(dmabuf);
@@ -1070,18 +1108,21 @@ static void qemu_spice_gl_update(DisplayChangeListener *dcl,
                                      dmabuf->width, dmabuf->height);
                 fd = egl_get_fd_for_texture(ssd->blit_fb.texture,
                                             &stride, &fourcc, NULL);
-                spice_qxl_gl_scanout(&ssd->qxl, fd,
-                                     dmabuf->width, dmabuf->height,
-                                     stride, fourcc, false);
+
+                spice_gl_create_update(ssd, fd, dmabuf->width, dmabuf->height,
+                                       stride, fourcc, false);
             }
         } else {
             trace_qemu_spice_gl_forward_dmabuf(ssd->qxl.id,
                                                dmabuf->width, dmabuf->height);
             /* note: spice server will close the fd, so hand over a dup */
-            spice_qxl_gl_scanout(&ssd->qxl, dup(dmabuf->fd),
-                                 dmabuf->width, dmabuf->height,
-                                 dmabuf->stride, dmabuf->fourcc,
-                                 dmabuf->y0_top);
+            fd = dup(dmabuf->fd);
+            if (fd <= 0) {
+                return;
+            }
+            spice_gl_create_update(ssd, fd, dmabuf->width,
+                                   dmabuf->height, dmabuf->stride,
+                                   dmabuf->fourcc, dmabuf->y0_top);
         }
         qemu_spice_gl_monitor_config(ssd, 0, 0, dmabuf->width, dmabuf->height);
         ssd->guest_dmabuf_refresh = false;
@@ -1103,8 +1144,11 @@ static void qemu_spice_gl_update(DisplayChangeListener *dcl,
     trace_qemu_spice_gl_update(ssd->qxl.id, w, h, x, y);
     qemu_spice_gl_block(ssd, true);
     glFlush();
-    cookie = (uintptr_t)qxl_cookie_new(QXL_COOKIE_TYPE_GL_DRAW_DONE, 0);
-    spice_qxl_gl_draw_async(&ssd->qxl, x, y, w, h, cookie);
+    if (!spice_dmabuf_encode) {
+        cookie = (uintptr_t)qxl_cookie_new(QXL_COOKIE_TYPE_GL_DRAW_DONE, 0);
+        spice_qxl_gl_draw_async(&ssd->qxl, x, y, w, h, cookie);
+    }
+    qemu_spice_wakeup(ssd);
 }
 
 static const DisplayChangeListenerOps display_listener_gl_ops = {
-- 
2.37.2



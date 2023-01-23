Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CAA6776E1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 09:58:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJseB-00053y-SC; Mon, 23 Jan 2023 03:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1pJse7-00053U-ML
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:57:43 -0500
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1pJse3-0002TJ-Rd
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:57:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674464259; x=1706000259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LA0rbr64R4MnwERitrEP/9d0s0CcFUx8zLRj4ewP6l0=;
 b=mLjciHUOjkw3KZDBX/0ebZulP/fYQUzux4/NgZYBLJN6jZzrYEGtLmFE
 fSvSg+O1iSXtY+C+/r3GSnlYprSgQl3kRWAw7YldiU2am1p3ihmh4UWNz
 jid8CkRT5Sfv0xkbIuRD2ovKdbPPzTdDOCUYt1TNFDuu+rS7KDQ1nOLqS
 cWemm0k5J03UQgj99ZF2FTf9bVO3WxFGW38UM2XCwJ17lVibUO7BV6AEt
 wbdNCGHUO4Fo7YprTo/H9UQ3c+mKRLHDgJ2csxIFYD96GDve6BmObZUPc
 U5ZqRh90BadbHGs837C2PT8N7szUJQMAMMBOXeCjwqE0205w8/2IESUGo A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="412227802"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="412227802"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 00:57:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="639057582"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="639057582"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 00:57:28 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC v2 2/2] spice: Add an option to forward the dmabuf directly to
 the encoder (v2)
Date: Mon, 23 Jan 2023 00:37:55 -0800
Message-Id: <20230123083755.1038286-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230123083755.1038286-1-vivek.kasireddy@intel.com>
References: <20230123083755.1038286-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=vivek.kasireddy@intel.com; helo=mga05.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
content associated with the dmabuf to a remote client.

Here is the flow of things from the Qemu side:
- Call gl_scanout (to update the fd) and gl_draw_async just like
  in the local display case.
- Additionally, create an update with the cmd set to QXL_CMD_DRAW
  to trigger the creation of a new drawable (associated with the fd)
  by the Spice server.
- Wait (or block) until the Encoder is done encoding the content.
- Unblock the pipeline once the async completion cookie is received.

v2:
- Use the existing gl_scanout and gl_draw_async APIs instead of
  adding new ones.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/ui/spice-display.h |  1 +
 qemu-options.hx            |  6 ++-
 ui/spice-core.c            | 22 +++++++++--
 ui/spice-display.c         | 75 ++++++++++++++++++++++++++++----------
 4 files changed, 81 insertions(+), 23 deletions(-)

diff --git a/include/ui/spice-display.h b/include/ui/spice-display.h
index e271e011da..df74f5ee9b 100644
--- a/include/ui/spice-display.h
+++ b/include/ui/spice-display.h
@@ -153,6 +153,7 @@ struct SimpleSpiceCursor {
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
index 494168e7fe..90ada643a2 100644
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
+                                         QXLRect *rect, bool dmabuf)
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
+    if (!dmabuf) {
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
+                    qemu_spice_create_one_update(ssd, &update, false);
                     dirty_top[blk] = -1;
                 }
             } else {
@@ -241,7 +244,7 @@ static void qemu_spice_create_update(SimpleSpiceDisplay *ssd)
                 .left   = x,
                 .right  = x + bw,
             };
-            qemu_spice_create_one_update(ssd, &update);
+            qemu_spice_create_one_update(ssd, &update, false);
             dirty_top[blk] = -1;
         }
     }
@@ -848,9 +851,26 @@ static void qemu_spice_gl_block_timer(void *opaque)
     warn_report("spice: no gl-draw-done within one second");
 }
 
+static void spice_gl_create_update(SimpleSpiceDisplay *ssd,
+                                   uint32_t width, uint32_t height)
+{
+    QXLRect update = {
+        .top    = 0,
+        .bottom = height,
+        .left   = 0,
+        .right  = width,
+    };
+
+    WITH_QEMU_LOCK_GUARD(&ssd->lock) {
+        qemu_spice_create_one_update(ssd, &update, true);
+    }
+    qemu_spice_wakeup(ssd);
+}
+
 static void spice_gl_refresh(DisplayChangeListener *dcl)
 {
     SimpleSpiceDisplay *ssd = container_of(dcl, SimpleSpiceDisplay, dcl);
+    bool local_display = spice_dmabuf_encode ? false : true;
     uint64_t cookie;
 
     if (!ssd->ds || qemu_console_is_gl_blocked(ssd->dcl.con)) {
@@ -865,7 +885,11 @@ static void spice_gl_refresh(DisplayChangeListener *dcl)
         spice_qxl_gl_draw_async(&ssd->qxl, 0, 0,
                                 surface_width(ssd->ds),
                                 surface_height(ssd->ds),
-                                cookie);
+                                cookie, local_display);
+        if (!local_display) {
+            spice_gl_create_update(ssd, surface_width(ssd->ds),
+                                   surface_height(ssd->ds));
+        }
         ssd->gl_updates = 0;
     }
 }
@@ -891,6 +915,9 @@ static void spice_gl_switch(DisplayChangeListener *dcl,
     }
     ssd->ds = new_surface;
     if (ssd->ds) {
+        if (spice_dmabuf_encode) {
+            qemu_spice_create_host_primary(ssd);
+        }
         surface_gl_create_texture(ssd->gls, ssd->ds);
         fd = egl_get_fd_for_texture(ssd->ds->texture,
                                     &stride, &fourcc,
@@ -909,7 +936,9 @@ static void spice_gl_switch(DisplayChangeListener *dcl,
         spice_qxl_gl_scanout(&ssd->qxl, fd,
                              surface_width(ssd->ds),
                              surface_height(ssd->ds),
-                             stride, fourcc, false);
+                             stride, fourcc, false,
+                             spice_dmabuf_encode ? false : true);
+
         ssd->have_surface = true;
         ssd->have_scanout = false;
 
@@ -932,7 +961,8 @@ static void qemu_spice_gl_scanout_disable(DisplayChangeListener *dcl)
     SimpleSpiceDisplay *ssd = container_of(dcl, SimpleSpiceDisplay, dcl);
 
     trace_qemu_spice_gl_scanout_disable(ssd->qxl.id);
-    spice_qxl_gl_scanout(&ssd->qxl, -1, 0, 0, 0, 0, false);
+    spice_qxl_gl_scanout(&ssd->qxl, -1, 0, 0, 0, 0, false,
+                         spice_dmabuf_encode ? false : true);
     qemu_spice_gl_monitor_config(ssd, 0, 0, 0, 0);
     ssd->have_surface = false;
     ssd->have_scanout = false;
@@ -960,7 +990,9 @@ static void qemu_spice_gl_scanout_texture(DisplayChangeListener *dcl,
 
     /* note: spice server will close the fd */
     spice_qxl_gl_scanout(&ssd->qxl, fd, backing_width, backing_height,
-                         stride, fourcc, y_0_top);
+                         stride, fourcc, y_0_top,
+                         spice_dmabuf_encode ? false : true);
+
     qemu_spice_gl_monitor_config(ssd, x, y, w, h);
     ssd->have_surface = false;
     ssd->have_scanout = true;
@@ -1031,6 +1063,7 @@ static void qemu_spice_gl_update(DisplayChangeListener *dcl,
     EGLint stride = 0, fourcc = 0;
     bool render_cursor = false;
     bool y_0_top = false; /* FIXME */
+    bool local_display = spice_dmabuf_encode ? false : true;
     uint64_t cookie;
     int fd;
 
@@ -1072,7 +1105,7 @@ static void qemu_spice_gl_update(DisplayChangeListener *dcl,
                                             &stride, &fourcc, NULL);
                 spice_qxl_gl_scanout(&ssd->qxl, fd,
                                      dmabuf->width, dmabuf->height,
-                                     stride, fourcc, false);
+                                     stride, fourcc, false, local_display);
             }
         } else {
             trace_qemu_spice_gl_forward_dmabuf(ssd->qxl.id,
@@ -1081,7 +1114,7 @@ static void qemu_spice_gl_update(DisplayChangeListener *dcl,
             spice_qxl_gl_scanout(&ssd->qxl, dup(dmabuf->fd),
                                  dmabuf->width, dmabuf->height,
                                  dmabuf->stride, dmabuf->fourcc,
-                                 dmabuf->y0_top);
+                                 dmabuf->y0_top, local_display);
         }
         qemu_spice_gl_monitor_config(ssd, 0, 0, dmabuf->width, dmabuf->height);
         ssd->guest_dmabuf_refresh = false;
@@ -1104,7 +1137,11 @@ static void qemu_spice_gl_update(DisplayChangeListener *dcl,
     qemu_spice_gl_block(ssd, true);
     glFlush();
     cookie = (uintptr_t)qxl_cookie_new(QXL_COOKIE_TYPE_GL_DRAW_DONE, 0);
-    spice_qxl_gl_draw_async(&ssd->qxl, x, y, w, h, cookie);
+    spice_qxl_gl_draw_async(&ssd->qxl, x, y, w, h, cookie, local_display);
+    if (!local_display) {
+        spice_gl_create_update(ssd, surface_width(ssd->ds),
+                               surface_height(ssd->ds));
+    }
 }
 
 static const DisplayChangeListenerOps display_listener_gl_ops = {
-- 
2.37.2



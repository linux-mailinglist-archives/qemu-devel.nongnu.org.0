Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357FB324DC1
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:15:52 +0100 (CET)
Received: from localhost ([::1]:38662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDgV-0002uw-7H
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:15:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lFDeK-0001bW-5D
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:13:36 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:44794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lFDeI-00087A-9C
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:13:35 -0500
Received: by mail-pg1-x52a.google.com with SMTP id a4so3450934pgc.11
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 02:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vzsU3EZ+pZWfLMIpGq3G9wRVI9sKDLLj/9kfAiMMjFA=;
 b=OJczgHQE9N/wEllN4sChY8bFrZt2hG/oOAEAFJwKlasmr4ZZtDOe47Ary9p80oGBHF
 QPEtXuEA+AWd0R7OSh9GlW3tzmkyVA7Op+lryMApY1LhsSB2kt82hs0LvilBPFkAqsWI
 rwo0x1sIxpcxbfrYI48sgcK3RjmBo+vohXW298CNhlDDG0Ummp/nJ4txbl5AWYalvBm8
 sWtfqxC0lTj8WoaoAqb3YsyJ126gW2+eQsVJjqBnGfsVHYnnysAnmcF+Y3kRBaHVcsK1
 PvD7saD0bJL4jii44zHYYC5Qn417CY9gYn1VGqQXFl7eQwEO+rAmtx7XYH5GWSnaiNpH
 jctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vzsU3EZ+pZWfLMIpGq3G9wRVI9sKDLLj/9kfAiMMjFA=;
 b=naUBqHibm33WHScStoC5D2l6ZrUYDQbbAb+kn1ujymb3/KwrvwVpGN9/3TmGonzd4s
 wsQrndWm3pqhRSFaf+RASMM2D2TnP+/CNpQfD9+BwQ2uhO+2FkaedBBq3JuI6wG46uXs
 8/R8oqPQ/T2VeFRFInOpOAyND3tOxHfci+LdRaVUtYnpZyu057/Z/BYy/aVYcTQ0T8N0
 b8li9+tGxXieY0l5W3oI5I4TphUt4OP+Jyrsfgwg/08u9QKpYc3x3P2klKrz+FHNW5N9
 JWs7FOJ6Eh754SuD/ZgCJcrq1OLVP1zXYT4q3pPNR7HvO4GggZuIrYe7zhnCRYdf2kS6
 0MCw==
X-Gm-Message-State: AOAM533t08sXVN6yBVs/RiWdlt4R3u5PiFbvE0bRHHX/1JJoj/j8FcIB
 8X61EXc4wCPyXcDPgXIdqF7Kv6wiE/JKPg==
X-Google-Smtp-Source: ABdhPJwiGgtT8FSs2EeB6bw+NNRXWDZyfyqzHK4yrpCtGa9GKWoUVvwoRD6NDoXRBoswCeOw+SckQA==
X-Received: by 2002:a63:505d:: with SMTP id q29mr2319904pgl.218.1614248012559; 
 Thu, 25 Feb 2021 02:13:32 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:29a8:515b:7b7:9008])
 by smtp.gmail.com with ESMTPSA id o18sm5630833pjq.44.2021.02.25.02.13.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Feb 2021 02:13:32 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v4 1/3] ui/console: Add placeholder flag to message surface
Date: Thu, 25 Feb 2021 19:13:14 +0900
Message-Id: <20210225101316.83940-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52a.google.com
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

The surfaces created with former qemu_create_message_surface
did not display the content from the guest and always contained
simple messages describing the reason.

A display backend may want to hide the window showing such a
surface. This change renames the function to
qemu_create_placeholder_surface, and adds "placeholder" flag; the
display can check the flag to decide to do anything special like
hiding the window.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 hw/display/vhost-user-gpu.c |  4 ++--
 hw/display/virtio-gpu.c     |  6 +++---
 include/ui/console.h        | 10 ++++++++--
 ui/console.c                | 11 ++++++-----
 ui/vnc.c                    |  2 +-
 5 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 4d8cb3525bf..3e911da795e 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -194,8 +194,8 @@ vhost_user_gpu_handle_display(VhostUserGPU *g, VhostUserGpuMsg *msg)
         con = s->con;
 
         if (m->scanout_id == 0 && m->width == 0) {
-            s->ds = qemu_create_message_surface(640, 480,
-                                                "Guest disabled display.");
+            s->ds = qemu_create_placeholder_surface(640, 480,
+                                                    "Guest disabled display.");
             dpy_gfx_replace_surface(con, s->ds);
         } else {
             s->ds = qemu_create_displaysurface(m->width, m->height);
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 2e4a9822b6a..c1f17bec17e 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -338,9 +338,9 @@ static void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id)
 
     if (scanout_id == 0) {
         /* primary head */
-        ds = qemu_create_message_surface(scanout->width  ?: 640,
-                                         scanout->height ?: 480,
-                                         "Guest disabled display.");
+        ds = qemu_create_placeholder_surface(scanout->width  ?: 640,
+                                             scanout->height ?: 480,
+                                             "Guest disabled display.");
     }
     dpy_gfx_replace_surface(scanout->con, ds);
     scanout->resource_id = 0;
diff --git a/include/ui/console.h b/include/ui/console.h
index d30e972d0b5..c960b7066cc 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -106,6 +106,7 @@ struct QemuConsoleClass {
 };
 
 #define QEMU_ALLOCATED_FLAG     0x01
+#define QEMU_PLACEHOLDER_FLAG   0x02
 
 typedef struct DisplaySurface {
     pixman_format_code_t format;
@@ -259,8 +260,8 @@ DisplaySurface *qemu_create_displaysurface_from(int width, int height,
                                                 pixman_format_code_t format,
                                                 int linesize, uint8_t *data);
 DisplaySurface *qemu_create_displaysurface_pixman(pixman_image_t *image);
-DisplaySurface *qemu_create_message_surface(int w, int h,
-                                            const char *msg);
+DisplaySurface *qemu_create_placeholder_surface(int w, int h,
+                                                const char *msg);
 PixelFormat qemu_default_pixelformat(int bpp);
 
 DisplaySurface *qemu_create_displaysurface(int width, int height);
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
index c5d11bc7017..32823faf414 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1436,8 +1436,8 @@ DisplaySurface *qemu_create_displaysurface_pixman(pixman_image_t *image)
     return surface;
 }
 
-DisplaySurface *qemu_create_message_surface(int w, int h,
-                                            const char *msg)
+DisplaySurface *qemu_create_placeholder_surface(int w, int h,
+                                                const char *msg)
 {
     DisplaySurface *surface = qemu_create_displaysurface(w, h);
     pixman_color_t bg = color_table_rgb[0][QEMU_COLOR_BLACK];
@@ -1454,6 +1454,7 @@ DisplaySurface *qemu_create_message_surface(int w, int h,
                                  x+i, y, FONT_WIDTH, FONT_HEIGHT);
         qemu_pixman_image_unref(glyph);
     }
+    surface->flags |= QEMU_PLACEHOLDER_FLAG;
     return surface;
 }
 
@@ -1550,7 +1551,7 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
             dcl->ops->dpy_gfx_switch(dcl, con->surface);
         } else {
             if (!dummy) {
-                dummy = qemu_create_message_surface(640, 480, nodev);
+                dummy = qemu_create_placeholder_surface(640, 480, nodev);
             }
             dcl->ops->dpy_gfx_switch(dcl, dummy);
         }
@@ -1998,7 +1999,7 @@ QemuConsole *graphic_console_init(DeviceState *dev, uint32_t head,
                                  &error_abort);
     }
 
-    surface = qemu_create_message_surface(width, height, noinit);
+    surface = qemu_create_placeholder_surface(width, height, noinit);
     dpy_gfx_replace_surface(s, surface);
     return s;
 }
@@ -2027,7 +2028,7 @@ void graphic_console_close(QemuConsole *con)
     if (con->gl) {
         dpy_gl_scanout_disable(con);
     }
-    surface = qemu_create_message_surface(width, height, unplugged);
+    surface = qemu_create_placeholder_surface(width, height, unplugged);
     dpy_gfx_replace_surface(con, surface);
 }
 
diff --git a/ui/vnc.c b/ui/vnc.c
index 16bb3be770b..4d2151272e5 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -799,7 +799,7 @@ static void vnc_dpy_switch(DisplayChangeListener *dcl,
 
     if (surface == NULL) {
         if (placeholder == NULL) {
-            placeholder = qemu_create_message_surface(640, 480, placeholder_msg);
+            placeholder = qemu_create_placeholder_surface(640, 480, placeholder_msg);
         }
         surface = placeholder;
     }
-- 
2.24.3 (Apple Git-128)



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340EC32489A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 02:39:54 +0100 (CET)
Received: from localhost ([::1]:51076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF5dB-0000Vf-82
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 20:39:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lF5Zk-0007F4-Ty
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:36:20 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lF5Zj-0004pQ-1f
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:36:20 -0500
Received: by mail-pj1-x1035.google.com with SMTP id l18so2565936pji.3
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 17:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8oxkoxN//QQLuaW0dfZteKbaDZnub+kYtwDVQhHQUgY=;
 b=WZ3Nn3Yl0+IkhiUL+r+33f7DAs8H2jkrhE6R1vylhf7DDLbg5luYw2ekTsmji6kH8D
 F9YbP6pfOM1zqAz3+WdQRFiK+Al22kML1emlERtlRWQpok3bhPGTZxNqaCvNEaMJogWw
 Sfcw4Iy/vkONsSF+LRka9CGPnmCAk7oRTX44n52k6upvqyuWIIoRN3hOHiP/SB8fjGpJ
 C/Mcpxx8uyxmm976d8QGv0zeHsZrcOaviEftk6fnSxPAGqJTGuYqYn8Tu7GCwENNrQ3S
 FDqTA6DsfpZYvNoI8E7F0s5HFM8wbN30E98XXZorsF3ePj7qHgFjCVkbQ6gcqVxlZxxX
 7Dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8oxkoxN//QQLuaW0dfZteKbaDZnub+kYtwDVQhHQUgY=;
 b=FbfUwQaGoUlqzifDXNtyBCuONUzqHmA0/xJqjr9q6AKHh7KWTazU0vGMvu0K4O+M9D
 tmzIyDzm32+Jr3py5qG/Hvgf2G7C7EnWNz0OVtfAW3T7KieMIIiOed4BqOdVWS3MmrrE
 a7aKsKjgpARWGJPUsJKe9OhpUKC7seWBU+xNpPt+WmQJf/c4cJo9Vw3KigGayLwwrmAS
 m/hsyxrOETFUK0gnwZsgu6cPiAM0YXOAL/KUFbwnQM6A9TxCaMjwAAVB7pCspBxLN2u1
 1iy84t04omFHhqnCvz1NLXToW1ZmeK9dDzX0wi4eHaGyiC6aMaQ1Jn2jZ0zHnb85Rbbu
 Zr7g==
X-Gm-Message-State: AOAM530sJIlOnOshqI1cer6X3Za1+9ddj6pSYxcaMpOMnlqJKasBQlWD
 33xXyzBxHe9rrWXQsneZBP3M6yO+Hlon4w==
X-Google-Smtp-Source: ABdhPJxDC63gjeTxNlmKIZlIyRm/gcwq1DfHQSriHLAx4FAxmZNjFCR6IH6XuY4YbitGM0Ij3ngiFw==
X-Received: by 2002:a17:90a:4306:: with SMTP id
 q6mr741423pjg.138.1614216977221; 
 Wed, 24 Feb 2021 17:36:17 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:29a8:515b:7b7:9008])
 by smtp.gmail.com with ESMTPSA id 137sm3817135pgb.80.2021.02.24.17.36.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Feb 2021 17:36:16 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3 1/3] ui/console: Add placeholder flag to message surface
Date: Thu, 25 Feb 2021 10:36:07 +0900
Message-Id: <20210225013609.73388-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210224110656.5pctwd7hdpvqi2na@sirius.home.kraxel.org>
References: <20210224110656.5pctwd7hdpvqi2na@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1035.google.com
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
 ui/console.c                | 10 +++++-----
 ui/vnc.c                    |  2 +-
 5 files changed, 19 insertions(+), 13 deletions(-)

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
index c5d11bc7017..0caa39a6ed3 100644
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
@@ -1550,7 +1550,7 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
             dcl->ops->dpy_gfx_switch(dcl, con->surface);
         } else {
             if (!dummy) {
-                dummy = qemu_create_message_surface(640, 480, nodev);
+                dummy = qemu_create_placeholder_surface(640, 480, nodev);
             }
             dcl->ops->dpy_gfx_switch(dcl, dummy);
         }
@@ -1998,7 +1998,7 @@ QemuConsole *graphic_console_init(DeviceState *dev, uint32_t head,
                                  &error_abort);
     }
 
-    surface = qemu_create_message_surface(width, height, noinit);
+    surface = qemu_create_placeholder_surface(width, height, noinit);
     dpy_gfx_replace_surface(s, surface);
     return s;
 }
@@ -2027,7 +2027,7 @@ void graphic_console_close(QemuConsole *con)
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



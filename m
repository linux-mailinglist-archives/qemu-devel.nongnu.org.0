Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1188D32D39F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 13:53:34 +0100 (CET)
Received: from localhost ([::1]:50174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHnTx-0008Sg-4S
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 07:53:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnSu-0007T8-4y
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnSq-00055G-Vs
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614862343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sZZk+tO54fxLHLeJm0a6RFGZZkq8fdPwF6t0fJXPEjU=;
 b=HVo/CTJ81vbNV1OHNDmBh67IjsL3t1q50UxXKvBGhsXXLztdzDalPQRhu5q0zG0XL96WmI
 nPk/CdVFeye9IH48/c/+qYp+EydrlPqnM84UAVrwXtGUP+Ba2yp+/4ZEhyOGzpX+xFLeCf
 dMLg9TW5jbeu37Nn6CTeQi8+XhefowI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-45dXDVPGOhanEPIayWwwxw-1; Thu, 04 Mar 2021 07:52:21 -0500
X-MC-Unique: 45dXDVPGOhanEPIayWwwxw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3F72108BD0A;
 Thu,  4 Mar 2021 12:52:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-129.ams2.redhat.com
 [10.36.115.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67947608BA;
 Thu,  4 Mar 2021 12:52:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 81AB31800637; Thu,  4 Mar 2021 09:37:05 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/8] ui/console: Add placeholder flag to message surface
Date: Thu,  4 Mar 2021 09:37:03 +0100
Message-Id: <20210304083705.1046645-7-kraxel@redhat.com>
In-Reply-To: <20210304083705.1046645-1-kraxel@redhat.com>
References: <20210304083705.1046645-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

The surfaces created with former qemu_create_message_surface
did not display the content from the guest and always contained
simple messages describing the reason.

A display backend may want to hide the window showing such a
surface. This change renames the function to
qemu_create_placeholder_surface, and adds "placeholder" flag; the
display can check the flag to decide to do anything special like
hiding the window.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210225101316.83940-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h        | 10 ++++++++--
 hw/display/vhost-user-gpu.c |  4 ++--
 hw/display/virtio-gpu.c     |  6 +++---
 ui/console.c                | 11 ++++++-----
 ui/vnc.c                    |  2 +-
 5 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index d30e972d0b57..c960b7066ccd 100644
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
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 4d8cb3525bfc..3e911da795ea 100644
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
index 2e4a9822b6a4..c1f17bec17e4 100644
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
diff --git a/ui/console.c b/ui/console.c
index c5d11bc7017f..32823faf4147 100644
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
index 16bb3be770b2..4d2151272e56 100644
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
2.29.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3305132D3BE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 13:59:49 +0100 (CET)
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHnZz-0006TO-Oi
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 07:59:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnT3-0007k4-LH
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnT2-0005BA-3o
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614862355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VCrcx5KnxDYf0WVWh41HGB+RrfSfd+rZwguNloOHZBQ=;
 b=LO9jXdpjvUHGo9KRkLwfS1NgoczjhEfzeMAkTS1m+wSV9kjG3fd7YzJQuhMgUGX3/r0+tA
 GKVDVaWC3Tb9wrI7mQw1ILGCUXIOynNIX4mORXlbw5vwc+CTrSxbXQWneHsY//Vrwn58Od
 e9KdUSYG69kIz2XntSFwkxYkILkx5Qw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-jO5k3Bm9Nd-WaL5HIaX3tg-1; Thu, 04 Mar 2021 07:52:31 -0500
X-MC-Unique: jO5k3Bm9Nd-WaL5HIaX3tg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D77B1005D4D;
 Thu,  4 Mar 2021 12:52:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-129.ams2.redhat.com
 [10.36.115.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71BAF5C1C2;
 Thu,  4 Mar 2021 12:52:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AC0C8180063D; Thu,  4 Mar 2021 09:37:05 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/8] virtio-gpu: Do not distinguish the primary console
Date: Thu,  4 Mar 2021 09:37:05 +0100
Message-Id: <20210304083705.1046645-9-kraxel@redhat.com>
In-Reply-To: <20210304083705.1046645-1-kraxel@redhat.com>
References: <20210304083705.1046645-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

In the past, virtio-gpu set NULL as the surface for the secondary
consoles to hide its window. The distinction is now handled in
ui/console and the display backends and virtio-gpu does no longer
have to do that.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210225101316.83940-3-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/vhost-user-gpu.c  |  6 ++----
 hw/display/virtio-gpu-3d.c   | 10 +++-------
 hw/display/virtio-gpu-base.c |  3 ---
 hw/display/virtio-gpu.c      |  9 +--------
 4 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 3e911da795ea..a01f9315e199 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -193,10 +193,8 @@ vhost_user_gpu_handle_display(VhostUserGPU *g, VhostUserGpuMsg *msg)
         s = &g->parent_obj.scanout[m->scanout_id];
         con = s->con;
 
-        if (m->scanout_id == 0 && m->width == 0) {
-            s->ds = qemu_create_placeholder_surface(640, 480,
-                                                    "Guest disabled display.");
-            dpy_gfx_replace_surface(con, s->ds);
+        if (m->width == 0) {
+            dpy_gfx_replace_surface(con, NULL);
         } else {
             s->ds = qemu_create_displaysurface(m->width, m->height);
             /* replace surface on next update */
diff --git a/hw/display/virtio-gpu-3d.c b/hw/display/virtio-gpu-3d.c
index 0b0c11474dd3..9eb489077b17 100644
--- a/hw/display/virtio-gpu-3d.c
+++ b/hw/display/virtio-gpu-3d.c
@@ -179,10 +179,8 @@ static void virgl_cmd_set_scanout(VirtIOGPU *g,
             info.width, info.height,
             ss.r.x, ss.r.y, ss.r.width, ss.r.height);
     } else {
-        if (ss.scanout_id != 0) {
-            dpy_gfx_replace_surface(
-                g->parent_obj.scanout[ss.scanout_id].con, NULL);
-        }
+        dpy_gfx_replace_surface(
+            g->parent_obj.scanout[ss.scanout_id].con, NULL);
         dpy_gl_scanout_disable(g->parent_obj.scanout[ss.scanout_id].con);
     }
     g->parent_obj.scanout[ss.scanout_id].resource_id = ss.resource_id;
@@ -595,9 +593,7 @@ void virtio_gpu_virgl_reset(VirtIOGPU *g)
 
     virgl_renderer_reset();
     for (i = 0; i < g->parent_obj.conf.max_outputs; i++) {
-        if (i != 0) {
-            dpy_gfx_replace_surface(g->parent_obj.scanout[i].con, NULL);
-        }
+        dpy_gfx_replace_surface(g->parent_obj.scanout[i].con, NULL);
         dpy_gl_scanout_disable(g->parent_obj.scanout[i].con);
     }
 }
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 4a57350917cd..25f8920fdb67 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -193,9 +193,6 @@ virtio_gpu_base_device_realize(DeviceState *qdev,
     for (i = 0; i < g->conf.max_outputs; i++) {
         g->scanout[i].con =
             graphic_console_init(DEVICE(g), i, &virtio_gpu_ops, g);
-        if (i > 0) {
-            dpy_gfx_replace_surface(g->scanout[i].con, NULL);
-        }
     }
 
     return true;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index c1f17bec17e4..c9f5e36fd076 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -325,7 +325,6 @@ static void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id)
 {
     struct virtio_gpu_scanout *scanout = &g->parent_obj.scanout[scanout_id];
     struct virtio_gpu_simple_resource *res;
-    DisplaySurface *ds = NULL;
 
     if (scanout->resource_id == 0) {
         return;
@@ -336,13 +335,7 @@ static void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id)
         res->scanout_bitmask &= ~(1 << scanout_id);
     }
 
-    if (scanout_id == 0) {
-        /* primary head */
-        ds = qemu_create_placeholder_surface(scanout->width  ?: 640,
-                                             scanout->height ?: 480,
-                                             "Guest disabled display.");
-    }
-    dpy_gfx_replace_surface(scanout->con, ds);
+    dpy_gfx_replace_surface(scanout->con, NULL);
     scanout->resource_id = 0;
     scanout->ds = NULL;
     scanout->width = 0;
-- 
2.29.2



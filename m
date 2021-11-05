Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 306014462C0
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 12:33:06 +0100 (CET)
Received: from localhost ([::1]:46258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mixSy-0001Co-RF
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 07:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mixQz-0000Ge-BQ
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 07:31:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mixQu-0005gz-Pn
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 07:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636111855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sz+ztSdf9OvDhhII4ky1/JIbp6rFCOj+PUGmfgQIy8Q=;
 b=U82RADn+4MqSVg4MMg0ZKuIs2TBd7N4qKM3jwHgxQeTl3Af5a+5+knMAwt9/UuqAUCCc3T
 o8eE30ggDXIR9rbBN37HYRzcRTFlk0j/HPkKgkINmRCAYwEse9lQS5nSyLBEqG83zDW9oW
 VXnOX3pen1tEfFU7XM2TTHVA0Xrp4Lg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-CB2_tzUQOXq34MwGxK1A9w-1; Fri, 05 Nov 2021 07:30:51 -0400
X-MC-Unique: CB2_tzUQOXq34MwGxK1A9w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7F9118125C2;
 Fri,  5 Nov 2021 11:30:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED83319739;
 Fri,  5 Nov 2021 11:30:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DA7B41805C87; Fri,  5 Nov 2021 12:30:43 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/6] virtio-gpu: splitting one extended mode guest fb into
 n-scanouts
Date: Fri,  5 Nov 2021 12:30:38 +0100
Message-Id: <20211105113043.4059361-2-kraxel@redhat.com>
In-Reply-To: <20211105113043.4059361-1-kraxel@redhat.com>
References: <20211105113043.4059361-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dongwon Kim <dongwon.kim@intel.com>

When guest is running Linux/X11 with extended multiple displays mode enabled,
the guest shares one scanout resource each time containing whole surface
rather than sharing individual display output separately. This extended frame
is properly splited and rendered on the corresponding scanout surfaces but
not in case of blob-resource (zero copy).

This code change lets the qemu split this one large surface data into multiple
in case of blob-resource as well so that each sub frame then can be blitted
properly to each scanout.

v2: resizing qemu console in virtio_gpu_update_dmabuf to scanout's width and
    height

v3: updating stub function of virtio_gpu_update_dmabuf to match the type

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
Message-Id: <20211104065153.28897-5-dongwon.kim@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h        |  5 +++--
 include/ui/console.h                  |  4 ++++
 hw/display/virtio-gpu-udmabuf-stubs.c |  3 ++-
 hw/display/virtio-gpu-udmabuf.c       | 22 ++++++++++++++--------
 hw/display/virtio-gpu.c               |  4 ++--
 5 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 24c6628944ea..acfba7c76c10 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -187,7 +187,7 @@ struct VirtIOGPU {
 
     struct {
         QTAILQ_HEAD(, VGPUDMABuf) bufs;
-        VGPUDMABuf *primary;
+        VGPUDMABuf *primary[VIRTIO_GPU_MAX_SCANOUTS];
     } dmabuf;
 };
 
@@ -273,7 +273,8 @@ void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res);
 int virtio_gpu_update_dmabuf(VirtIOGPU *g,
                              uint32_t scanout_id,
                              struct virtio_gpu_simple_resource *res,
-                             struct virtio_gpu_framebuffer *fb);
+                             struct virtio_gpu_framebuffer *fb,
+                             struct virtio_gpu_rect *r);
 
 /* virtio-gpu-3d.c */
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
diff --git a/include/ui/console.h b/include/ui/console.h
index b6bedc5f4152..6d678924f6fd 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -167,6 +167,10 @@ typedef struct QemuDmaBuf {
     uint32_t  fourcc;
     uint64_t  modifier;
     uint32_t  texture;
+    uint32_t  x;
+    uint32_t  y;
+    uint32_t  scanout_width;
+    uint32_t  scanout_height;
     bool      y0_top;
     void      *sync;
     int       fence_fd;
diff --git a/hw/display/virtio-gpu-udmabuf-stubs.c b/hw/display/virtio-gpu-udmabuf-stubs.c
index 81f661441ab9..f692e1351034 100644
--- a/hw/display/virtio-gpu-udmabuf-stubs.c
+++ b/hw/display/virtio-gpu-udmabuf-stubs.c
@@ -20,7 +20,8 @@ void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res)
 int virtio_gpu_update_dmabuf(VirtIOGPU *g,
                              uint32_t scanout_id,
                              struct virtio_gpu_simple_resource *res,
-                             struct virtio_gpu_framebuffer *fb)
+                             struct virtio_gpu_framebuffer *fb,
+                             struct virtio_gpu_rect *r)
 {
     /* nothing (stub) */
     return 0;
diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index 60ea7f8f4972..1597921c51fc 100644
--- a/hw/display/virtio-gpu-udmabuf.c
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -171,7 +171,8 @@ static VGPUDMABuf
 *virtio_gpu_create_dmabuf(VirtIOGPU *g,
                           uint32_t scanout_id,
                           struct virtio_gpu_simple_resource *res,
-                          struct virtio_gpu_framebuffer *fb)
+                          struct virtio_gpu_framebuffer *fb,
+                          struct virtio_gpu_rect *r)
 {
     VGPUDMABuf *dmabuf;
 
@@ -183,6 +184,10 @@ static VGPUDMABuf
     dmabuf->buf.width = fb->width;
     dmabuf->buf.height = fb->height;
     dmabuf->buf.stride = fb->stride;
+    dmabuf->buf.x = r->x;
+    dmabuf->buf.y = r->y;
+    dmabuf->buf.scanout_width = r->width;
+    dmabuf->buf.scanout_height = r->height;
     dmabuf->buf.fourcc = qemu_pixman_to_drm_format(fb->format);
     dmabuf->buf.fd = res->dmabuf_fd;
     dmabuf->buf.allow_fences = true;
@@ -196,24 +201,25 @@ static VGPUDMABuf
 int virtio_gpu_update_dmabuf(VirtIOGPU *g,
                              uint32_t scanout_id,
                              struct virtio_gpu_simple_resource *res,
-                             struct virtio_gpu_framebuffer *fb)
+                             struct virtio_gpu_framebuffer *fb,
+                             struct virtio_gpu_rect *r)
 {
     struct virtio_gpu_scanout *scanout = &g->parent_obj.scanout[scanout_id];
     VGPUDMABuf *new_primary, *old_primary = NULL;
 
-    new_primary = virtio_gpu_create_dmabuf(g, scanout_id, res, fb);
+    new_primary = virtio_gpu_create_dmabuf(g, scanout_id, res, fb, r);
     if (!new_primary) {
         return -EINVAL;
     }
 
-    if (g->dmabuf.primary) {
-        old_primary = g->dmabuf.primary;
+    if (g->dmabuf.primary[scanout_id]) {
+        old_primary = g->dmabuf.primary[scanout_id];
     }
 
-    g->dmabuf.primary = new_primary;
+    g->dmabuf.primary[scanout_id] = new_primary;
     qemu_console_resize(scanout->con,
-                        new_primary->buf.width,
-                        new_primary->buf.height);
+                        new_primary->buf.scanout_width,
+                        new_primary->buf.scanout_height);
     dpy_gl_scanout_dmabuf(scanout->con, &new_primary->buf);
 
     if (old_primary) {
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 182e0868b09d..d78b9700c7de 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -517,9 +517,9 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
                 console_has_gl(scanout->con)) {
                 dpy_gl_update(scanout->con, 0, 0, scanout->width,
                               scanout->height);
-                return;
             }
         }
+        return;
     }
 
     if (!res->blob &&
@@ -627,7 +627,7 @@ static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
 
     if (res->blob) {
         if (console_has_gl(scanout->con)) {
-            if (!virtio_gpu_update_dmabuf(g, scanout_id, res, fb)) {
+            if (!virtio_gpu_update_dmabuf(g, scanout_id, res, fb, r)) {
                 virtio_gpu_update_scanout(g, scanout_id, res, r);
                 return;
             }
-- 
2.31.1



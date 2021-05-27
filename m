Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0E13930F7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:34:44 +0200 (CEST)
Received: from localhost ([::1]:60918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmH5v-0001eL-BC
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGxa-0001N2-4w
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:26:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGxQ-0005OU-Da
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:26:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622125555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EFDwQ4UxlnwSROT5+1at07w+rc4xeGFWdv3s4uvQ+k4=;
 b=DzuDkCF5PWidqBYc2GIf6kcI8oq2j9EcUBpSeDURGHwQgEYWzeHgrIAEWeACwGaS8qoLn/
 Fauv7OlHB6+W1AFsmswyhbmd3iIQJBiltS/1iJ95D1kU54vmSNUtV9Pb536P8KidkgzWvu
 wEfImSoCzNU7FRu9G+Okm70JsNTRW98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-qjy_MEa7P5CYVWDPGRXESQ-1; Thu, 27 May 2021 10:25:53 -0400
X-MC-Unique: qjy_MEa7P5CYVWDPGRXESQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 570091013720;
 Thu, 27 May 2021 14:25:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE4C95D9CC;
 Thu, 27 May 2021 14:25:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1331F180086E; Thu, 27 May 2021 16:23:42 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/23] virtio-gpu: Add helpers to create and destroy dmabuf
 objects
Date: Thu, 27 May 2021 16:23:37 +0200
Message-Id: <20210527142340.1352791-21-kraxel@redhat.com>
In-Reply-To: <20210527142340.1352791-1-kraxel@redhat.com>
References: <20210527142340.1352791-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

These helpers can be useful for creating dmabuf objects from blobs
and submitting them to the UI.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Message-Id: <20210526231429.1045476-12-vivek.kasireddy@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h  | 15 ++++++++
 hw/display/virtio-gpu-udmabuf.c | 65 +++++++++++++++++++++++++++++++++
 stubs/virtio-gpu-udmabuf.c      |  9 +++++
 3 files changed, 89 insertions(+)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 66e7aaad0e98..bcf54d970f24 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -150,6 +150,12 @@ struct VirtIOGPUBaseClass {
     DEFINE_PROP_UINT32("xres", _state, _conf.xres, 1024), \
     DEFINE_PROP_UINT32("yres", _state, _conf.yres, 768)
 
+typedef struct VGPUDMABuf {
+    QemuDmaBuf buf;
+    uint32_t scanout_id;
+    QTAILQ_ENTRY(VGPUDMABuf) next;
+} VGPUDMABuf;
+
 struct VirtIOGPU {
     VirtIOGPUBase parent_obj;
 
@@ -178,6 +184,11 @@ struct VirtIOGPU {
         uint32_t req_3d;
         uint32_t bytes_3d;
     } stats;
+
+    struct {
+        QTAILQ_HEAD(, VGPUDMABuf) bufs;
+        VGPUDMABuf *primary;
+    } dmabuf;
 };
 
 struct VirtIOGPUClass {
@@ -259,6 +270,10 @@ void virtio_gpu_update_cursor_data(VirtIOGPU *g,
 bool virtio_gpu_have_udmabuf(void);
 void virtio_gpu_init_udmabuf(struct virtio_gpu_simple_resource *res);
 void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res);
+int virtio_gpu_update_dmabuf(VirtIOGPU *g,
+                             uint32_t scanout_id,
+                             struct virtio_gpu_simple_resource *res,
+                             struct virtio_gpu_framebuffer *fb);
 
 /* virtio-gpu-3d.c */
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index 71c4672e327a..3c01a415e71b 100644
--- a/hw/display/virtio-gpu-udmabuf.c
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -156,3 +156,68 @@ void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res)
         virtio_gpu_destroy_udmabuf(res);
     }
 }
+
+static void virtio_gpu_free_dmabuf(VirtIOGPU *g, VGPUDMABuf *dmabuf)
+{
+    struct virtio_gpu_scanout *scanout;
+
+    scanout = &g->parent_obj.scanout[dmabuf->scanout_id];
+    dpy_gl_release_dmabuf(scanout->con, &dmabuf->buf);
+    QTAILQ_REMOVE(&g->dmabuf.bufs, dmabuf, next);
+    g_free(dmabuf);
+}
+
+static VGPUDMABuf
+*virtio_gpu_create_dmabuf(VirtIOGPU *g,
+                          uint32_t scanout_id,
+                          struct virtio_gpu_simple_resource *res,
+                          struct virtio_gpu_framebuffer *fb)
+{
+    VGPUDMABuf *dmabuf;
+
+    if (res->dmabuf_fd < 0) {
+        return NULL;
+    }
+
+    dmabuf = g_new0(VGPUDMABuf, 1);
+    dmabuf->buf.width = fb->width;
+    dmabuf->buf.height = fb->height;
+    dmabuf->buf.stride = fb->stride;
+    dmabuf->buf.fourcc = qemu_pixman_to_drm_format(fb->format);
+    dmabuf->buf.fd = res->dmabuf_fd;
+
+    dmabuf->scanout_id = scanout_id;
+    QTAILQ_INSERT_HEAD(&g->dmabuf.bufs, dmabuf, next);
+
+    return dmabuf;
+}
+
+int virtio_gpu_update_dmabuf(VirtIOGPU *g,
+                             uint32_t scanout_id,
+                             struct virtio_gpu_simple_resource *res,
+                             struct virtio_gpu_framebuffer *fb)
+{
+    struct virtio_gpu_scanout *scanout = &g->parent_obj.scanout[scanout_id];
+    VGPUDMABuf *new_primary, *old_primary = NULL;
+
+    new_primary = virtio_gpu_create_dmabuf(g, scanout_id, res, fb);
+    if (!new_primary) {
+        return -EINVAL;
+    }
+
+    if (g->dmabuf.primary) {
+        old_primary = g->dmabuf.primary;
+    }
+
+    g->dmabuf.primary = new_primary;
+    qemu_console_resize(scanout->con,
+                        new_primary->buf.width,
+                        new_primary->buf.height);
+    dpy_gl_scanout_dmabuf(scanout->con, &new_primary->buf);
+
+    if (old_primary) {
+        virtio_gpu_free_dmabuf(g, old_primary);
+    }
+
+    return 0;
+}
diff --git a/stubs/virtio-gpu-udmabuf.c b/stubs/virtio-gpu-udmabuf.c
index e962e00d86d3..81f661441ab9 100644
--- a/stubs/virtio-gpu-udmabuf.c
+++ b/stubs/virtio-gpu-udmabuf.c
@@ -16,3 +16,12 @@ void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res)
 {
     /* nothing (stub) */
 }
+
+int virtio_gpu_update_dmabuf(VirtIOGPU *g,
+                             uint32_t scanout_id,
+                             struct virtio_gpu_simple_resource *res,
+                             struct virtio_gpu_framebuffer *fb)
+{
+    /* nothing (stub) */
+    return 0;
+}
-- 
2.31.1



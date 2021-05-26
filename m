Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11474392335
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 01:28:57 +0200 (CEST)
Received: from localhost ([::1]:46064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm2xL-0004w0-KT
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lm2vY-0002eK-4d
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:27:04 -0400
Received: from mga01.intel.com ([192.55.52.88]:11252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lm2vV-0001wp-G1
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:27:03 -0400
IronPort-SDR: NT3wiNzm9SAPr/D587uSNpqirscWr4UKmQfQ/GPD6QCNejD/f4ws4R46qzfXhz3Y8MLq7PMC7o
 6HVwPoKhoFkA==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223801552"
X-IronPort-AV: E=Sophos;i="5.82,333,1613462400"; d="scan'208";a="223801552"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 16:26:58 -0700
IronPort-SDR: 0A83hRhNWyrNWHB0eXJARnMxAju87Qfawinj/3ZCflxmV82088u2azW/G/EoQeYAyxgo/JPIvV
 95Pf21mGBSuQ==
X-IronPort-AV: E=Sophos;i="5.82,333,1613462400"; d="scan'208";a="477188164"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 16:26:57 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/14] virtio-gpu: Add helpers to create and destroy dmabuf
 objects
Date: Wed, 26 May 2021 16:14:26 -0700
Message-Id: <20210526231429.1045476-12-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526231429.1045476-1-vivek.kasireddy@intel.com>
References: <20210526231429.1045476-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=vivek.kasireddy@intel.com; helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These helpers can be useful for creating dmabuf objects from blobs
and submitting them to the UI.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu-udmabuf.c | 65 +++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-gpu.h  | 15 ++++++++
 stubs/virtio-gpu-udmabuf.c      |  9 +++++
 3 files changed, 89 insertions(+)

diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index 71c4672e32..3c01a415e7 100644
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
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 66e7aaad0e..bcf54d970f 100644
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
diff --git a/stubs/virtio-gpu-udmabuf.c b/stubs/virtio-gpu-udmabuf.c
index e962e00d86..81f661441a 100644
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
2.30.2



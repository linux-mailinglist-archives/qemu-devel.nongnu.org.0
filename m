Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D6137A287
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:50:30 +0200 (CEST)
Received: from localhost ([::1]:54498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgO61-00032t-Lq
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNdf-00083A-U8
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:17 -0400
Received: from mga17.intel.com ([192.55.52.151]:32226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNdb-0004x4-Pc
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:11 -0400
IronPort-SDR: yGZ8nsB88wbvnlgzdAT/7kfLWXVkTe9QdBrIpF9Py+gr2MP16IbKm9Mi1onudkZIxavJ1ZFQ3x
 pC4vMFlSyjkQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179649391"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="179649391"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
IronPort-SDR: 0GDQX+dP7NE90kHtS43Go0Weu4C52YHKjWJsl6SH03ka1jIf6ha0DSvGQ2nNdFtVpTtUh1+U2o
 zUVAPUquxZ5g==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="536892203"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/20] virtio-gpu: Add helpers to create and destroy dmabuf
 objects
Date: Tue, 11 May 2021 01:08:08 -0700
Message-Id: <20210511080818.366985-11-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511080818.366985-1-vivek.kasireddy@intel.com>
References: <20210511080818.366985-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=vivek.kasireddy@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These helpers can be useful for creating dmabuf objects from blobs
and submitting them to the UI.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu-udmabuf.c | 74 +++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-gpu.h  | 15 +++++++
 2 files changed, 89 insertions(+)

diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index df79535a3a..a9cb83d686 100644
--- a/hw/display/virtio-gpu-udmabuf.c
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -168,6 +168,71 @@ void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res)
     }
 }
 
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
+    VGPUDMABuf *new_primary, *old_primary;
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
+			new_primary->buf.width,
+                        new_primary->buf.height);
+    dpy_gl_scanout_dmabuf(scanout->con, &new_primary->buf);
+
+    if (old_primary) {
+        virtio_gpu_free_dmabuf(g, old_primary);
+    }
+
+    return 0;
+}
+
 #else
 
 bool virtio_gpu_have_udmabuf(void)
@@ -187,4 +252,13 @@ void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res)
     /* nothing (stub) */
 }
 
+int virtio_gpu_update_dmabuf(VirtIOGPU *g,
+                             uint32_t scanout_id,
+                             struct virtio_gpu_simple_resource *res,
+                             struct virtio_gpu_framebuffer *fb)
+{
+    /* nothing (stub) */
+    return 0;
+}
+
 #endif
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index fa6ee5ac98..31b2bcc57b 100644
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
 void *virtio_gpu_init_udmabuf(struct virtio_gpu_simple_resource *res);
 void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res);
+int virtio_gpu_update_dmabuf(VirtIOGPU *g,
+                             uint32_t scanout_id,
+                             struct virtio_gpu_simple_resource *res,
+                             struct virtio_gpu_framebuffer *fb);
 
 /* virtio-gpu-3d.c */
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
-- 
2.30.2



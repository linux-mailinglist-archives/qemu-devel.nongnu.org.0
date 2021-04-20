Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150C33652FC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 09:13:36 +0200 (CEST)
Received: from localhost ([::1]:53222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYkZj-0005dM-6w
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 03:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lYkSN-0003Tp-Si
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 03:05:59 -0400
Received: from mga17.intel.com ([192.55.52.151]:17757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lYkSJ-0002nI-Ii
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 03:05:59 -0400
IronPort-SDR: S+vWrhBOPYpTt0B9c0l0Qsy1hUb+itILmSIksAhiKCuRqKkXwqZMaRpOi/y2F9nz8+TP7K2Nhx
 7Y3OnIdzfTbg==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="175563731"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; d="scan'208";a="175563731"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 00:05:37 -0700
IronPort-SDR: dteRHkuOwvWiD1j9V7sI3AlfrmiXRejqwmjYinD2hvliTlc3/z656Y/MLZSalBJh5mFJiQXjfZ
 eP4EuNfRfFRA==
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; d="scan'208";a="420293144"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 00:05:37 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/12] virtio-gpu: Add helpers to create and destroy dmabuf
 objects
Date: Mon, 19 Apr 2021 23:53:44 -0700
Message-Id: <20210420065347.2685768-10-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210420065347.2685768-1-vivek.kasireddy@intel.com>
References: <20210420065347.2685768-1-vivek.kasireddy@intel.com>
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These helpers can be useful for creating dmabuf objects from blobs
and submitting them to the UI.

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu-udmabuf.c | 87 +++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-gpu.h  | 15 ++++++
 2 files changed, 102 insertions(+)

diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index 8bbce08550..40a5da0d30 100644
--- a/hw/display/virtio-gpu-udmabuf.c
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -167,6 +167,84 @@ void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res)
     }
 }
 
+static void virtio_gpu_free_one_dmabuf(VirtIOGPU *g, VGPUDMABuf *dmabuf,
+                                       uint32_t scanout_id)
+{
+    struct virtio_gpu_scanout *scanout = &g->parent_obj.scanout[scanout_id];
+
+    QTAILQ_REMOVE(&g->dmabuf.bufs, dmabuf, next);
+    dpy_gl_release_dmabuf(scanout->con, &dmabuf->buf);
+    g_free(dmabuf);
+}
+
+static void virtio_gpu_free_dmabufs(VirtIOGPU *g,
+                                    uint32_t scanout_id)
+{
+    VGPUDMABuf *dmabuf, *tmp;
+
+    QTAILQ_FOREACH_SAFE(dmabuf, &g->dmabuf.bufs, next, tmp) {
+        if (dmabuf != g->dmabuf.primary &&
+            dmabuf->scanout_id == scanout_id) {
+            virtio_gpu_free_one_dmabuf(g, dmabuf, scanout_id);
+            break;
+        }
+    }
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
+    VGPUDMABuf *primary;
+    bool free_bufs = false;
+
+    primary = virtio_gpu_create_dmabuf(g, scanout_id, res, fb);
+    if (!primary) {
+        return -EINVAL;
+    }
+
+    if (g->dmabuf.primary != primary) {
+        g->dmabuf.primary = primary;
+        qemu_console_resize(scanout->con,
+                            primary->buf.width, primary->buf.height);
+        dpy_gl_scanout_dmabuf(scanout->con, &primary->buf);
+        free_bufs = true;
+    }
+
+    if (free_bufs) {
+        virtio_gpu_free_dmabufs(g, scanout_id);
+    }
+
+    return 0;
+}
+
 #else
 
 bool virtio_gpu_have_udmabuf(void)
@@ -185,4 +263,13 @@ void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res)
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
index a65215dc52..1efb97136d 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -149,6 +149,12 @@ struct VirtIOGPUBaseClass {
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
 
@@ -179,6 +185,11 @@ struct VirtIOGPU {
         uint32_t req_3d;
         uint32_t bytes_3d;
     } stats;
+
+    struct {
+        QTAILQ_HEAD(, VGPUDMABuf) bufs;
+        VGPUDMABuf *primary;
+    } dmabuf;
 };
 
 struct VhostUserGPU {
@@ -236,6 +247,10 @@ void virtio_gpu_process_cmdq(VirtIOGPU *g);
 bool virtio_gpu_have_udmabuf(void);
 void virtio_gpu_init_udmabuf(struct virtio_gpu_simple_resource *res);
 void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res);
+int virtio_gpu_update_dmabuf(VirtIOGPU *g,
+                             uint32_t scanout_id,
+                             struct virtio_gpu_simple_resource *res,
+                             struct virtio_gpu_framebuffer *fb);
 
 /* virtio-gpu-3d.c */
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
-- 
2.26.2



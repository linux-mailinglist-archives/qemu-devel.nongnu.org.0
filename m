Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999E434F779
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 05:28:14 +0200 (CEST)
Received: from localhost ([::1]:57396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRRWf-0002dc-Mm
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 23:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lRRQg-0002ll-9i
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 23:22:02 -0400
Received: from mga18.intel.com ([134.134.136.126]:53070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lRRQe-00057q-2m
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 23:22:01 -0400
IronPort-SDR: kwSZ5aHihTNRDFKOxoTzqCRTmXe9nMwkZJ4vv/EDcVhkqwXvL6+WaJJ+NfSrfVEL7ksLMqQRPy
 PRhT572Rpdcw==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="179449776"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="179449776"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 20:21:35 -0700
IronPort-SDR: xLcEk+NSXZ0Bl8MyDZwEGKi5f3QTbnFc3WV1BWQgni8jg0BWnuRpyc8sitOC5df1+vpVzHjbUv
 1FnxEHNQoNPA==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="418454141"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 20:21:35 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/11] virtio-gpu: Add helpers to create and destroy dmabuf
 objects
Date: Tue, 30 Mar 2021 20:09:59 -0700
Message-Id: <20210331031001.1564125-10-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
References: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=vivek.kasireddy@intel.com; helo=mga18.intel.com
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
 hw/display/virtio-gpu-udmabuf.c | 88 +++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-gpu.h  | 15 ++++++
 2 files changed, 103 insertions(+)

diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index bbcaf27b56..bda8af5458 100644
--- a/hw/display/virtio-gpu-udmabuf.c
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -166,6 +166,85 @@ void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res)
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
+static VGPUDMABuf *virtio_gpu_create_dmabuf(VirtIOGPU *g,
+                                            uint32_t scanout_id,
+                                            struct virtio_gpu_simple_resource *res,
+                                            struct virtio_gpu_framebuffer *fb)
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
+int virtio_gpu_dmabuf_update(VirtIOGPU *g,
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
+    dpy_gl_update(scanout->con, 0, 0, primary->buf.width, primary->buf.height);
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
@@ -184,4 +263,13 @@ void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res)
     /* nothing (stub) */
 }
 
+int virtio_gpu_dmabuf_update(VirtIOGPU *g,
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
index a65215dc52..8b6bf851da 100644
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
+int virtio_gpu_dmabuf_update(VirtIOGPU *g,
+                             uint32_t scanout_id,
+                             struct virtio_gpu_simple_resource *res,
+                             struct virtio_gpu_framebuffer *fb);
 
 /* virtio-gpu-3d.c */
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
-- 
2.26.2



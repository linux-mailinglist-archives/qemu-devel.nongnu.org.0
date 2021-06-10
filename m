Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279D43A3791
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 01:03:03 +0200 (CEST)
Received: from localhost ([::1]:52616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrThW-0001zM-7O
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 19:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lrTg8-0007hm-DP
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 19:01:36 -0400
Received: from mga17.intel.com ([192.55.52.151]:53003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lrTg6-0007CA-7U
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 19:01:36 -0400
IronPort-SDR: pJrEjXBoqu0HzN6itOGIpeF02GMAPRXxmh0KFWmDs+5vwrTJFqzizxijKtgNJEg07Uwcge6yex
 4beOsR0ML7hw==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="185796186"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="185796186"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:01:08 -0700
IronPort-SDR: M7v2seMkRiBr2B3RaJ3ziTPItiPTNWcGPnwDBBkBJv2VG6jLfj98ars5jTKUT+72YrUaqR/dVu
 6bT1nGJ6yu/w==
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="419888377"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:01:08 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] virtio-gpu: Add dmabuf helpers for synchronization
Date: Thu, 10 Jun 2021 15:48:36 -0700
Message-Id: <20210610224837.670192-8-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610224837.670192-1-vivek.kasireddy@intel.com>
References: <20210610224837.670192-1-vivek.kasireddy@intel.com>
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

These helpers will be used in the next subsequent patches to
wait until a dmabuf object (via a texture) has been used
by the UI to render and submit its buffer.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu-udmabuf.c | 28 ++++++++++++++++++++++++++++
 include/hw/virtio/virtio-gpu.h  |  2 ++
 stubs/virtio-gpu-udmabuf.c      |  6 ++++++
 3 files changed, 36 insertions(+)

diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index 33e329e8aa..8c1b6f8763 100644
--- a/hw/display/virtio-gpu-udmabuf.c
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -167,6 +167,34 @@ static void virtio_gpu_free_dmabuf(VirtIOGPU *g, VGPUDMABuf *dmabuf)
     g_free(dmabuf);
 }
 
+static VGPUDMABuf
+*virtio_gpu_find_dmabuf(VirtIOGPU *g,
+                        struct virtio_gpu_simple_resource *res)
+{
+    VGPUDMABuf *dmabuf, *tmp;
+
+    QTAILQ_FOREACH_SAFE(dmabuf, &g->dmabuf.bufs, next, tmp) {
+        if (dmabuf->buf.fd == res->dmabuf_fd) {
+            return dmabuf;
+        }
+    }
+
+    return NULL;
+}
+
+void virtio_gpu_resource_wait_sync(VirtIOGPU *g,
+                                   struct virtio_gpu_simple_resource *res)
+{
+    struct virtio_gpu_scanout *scanout;
+    VGPUDMABuf *dmabuf;
+
+    dmabuf = virtio_gpu_find_dmabuf(g, res);
+    if (dmabuf && dmabuf->buf.sync) {
+        scanout = &g->parent_obj.scanout[dmabuf->scanout_id];
+        dpy_gl_wait_dmabuf(scanout->con, &dmabuf->buf);
+    }
+}
+
 static VGPUDMABuf
 *virtio_gpu_create_dmabuf(VirtIOGPU *g,
                           uint32_t scanout_id,
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index bcf54d970f..9b9b499d06 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -274,6 +274,8 @@ int virtio_gpu_update_dmabuf(VirtIOGPU *g,
                              uint32_t scanout_id,
                              struct virtio_gpu_simple_resource *res,
                              struct virtio_gpu_framebuffer *fb);
+void virtio_gpu_resource_wait_sync(VirtIOGPU *g,
+                                   struct virtio_gpu_simple_resource *res);
 
 /* virtio-gpu-3d.c */
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
diff --git a/stubs/virtio-gpu-udmabuf.c b/stubs/virtio-gpu-udmabuf.c
index 81f661441a..59dab1a66c 100644
--- a/stubs/virtio-gpu-udmabuf.c
+++ b/stubs/virtio-gpu-udmabuf.c
@@ -25,3 +25,9 @@ int virtio_gpu_update_dmabuf(VirtIOGPU *g,
     /* nothing (stub) */
     return 0;
 }
+
+void virtio_gpu_resource_wait_sync(VirtIOGPU *g,
+                                   struct virtio_gpu_simple_resource *res)
+{
+    /* nothing (stub) */
+}
-- 
2.30.2



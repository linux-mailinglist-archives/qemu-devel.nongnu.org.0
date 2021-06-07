Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0785939EA3F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 01:40:19 +0200 (CEST)
Received: from localhost ([::1]:37490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqOqu-0003cO-IZ
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 19:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lqOoy-0001bq-Rk
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 19:38:16 -0400
Received: from mga06.intel.com ([134.134.136.31]:2273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lqOow-00071e-R1
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 19:38:16 -0400
IronPort-SDR: LXuayxLVuqC+5EGJnn5hfGn8zYeH/FmPxOVu7CsMroEe7SMjq2RYPK86j5ApsGKiOBsWODmH6K
 DtZxMxK8UqSw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="265889552"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="265889552"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 16:38:03 -0700
IronPort-SDR: l/zINiWlQKZnIy7XNYBSXINVDPjE0kB8I2pyusHylyqARwZrLVHH3YEsJ65m1KPMsxloBwCoLu
 bvQWGJzEXxHg==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="551403362"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 16:38:03 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 5/5] virtio-gpu: Make resource_flush wait on the sync
 object for blobs
Date: Mon,  7 Jun 2021 16:25:30 -0700
Message-Id: <20210607232530.454435-6-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607232530.454435-1-vivek.kasireddy@intel.com>
References: <20210607232530.454435-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=vivek.kasireddy@intel.com; helo=mga06.intel.com
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
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To make sure that the Guest would not use the backing storage
associated with a blob resource before or at the same time when
the Host does a blit with it, resource_flush needs to wait on
the sync object associated with the blob. Doing this would prevent
tearing/flickering or other issues when using blob resources.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 hw/display/virtio-gpu-udmabuf.c | 28 ++++++++++++++++++++++++++++
 hw/display/virtio-gpu.c         |  1 +
 include/hw/virtio/virtio-gpu.h  |  2 ++
 3 files changed, 31 insertions(+)

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
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 4d549377cb..dd037137e9 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -523,6 +523,7 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
                 console_has_gl(scanout->con)) {
                 dpy_gl_update(scanout->con, 0, 0, scanout->width,
                               scanout->height);
+                virtio_gpu_resource_wait_sync(g, res);
                 return;
             }
         }
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
-- 
2.30.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD5F40A025
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 00:36:09 +0200 (CEST)
Received: from localhost ([::1]:53636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPuYa-00082x-94
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 18:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1mPuWf-0005R1-O9
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:34:09 -0400
Received: from mga01.intel.com ([192.55.52.88]:34064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1mPuWc-000845-Ak
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:34:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="244139499"
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="244139499"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 15:33:53 -0700
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="432749428"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 15:33:52 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 1/2] virtio-gpu: Add support for VIRTIO_GPU_F_RELEASE_FENCE
Date: Mon, 13 Sep 2021 15:20:35 -0700
Message-Id: <20210913222036.3193732-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913222036.3193732-1-vivek.kasireddy@intel.com>
References: <20210913222036.3193732-1-vivek.kasireddy@intel.com>
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

To support this feature, we add a new queue named rel_fenceq to
enqueue finished set_scanout_blob cmds.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu-base.c                |  3 ++
 hw/display/virtio-gpu-udmabuf.c             |  4 +-
 hw/display/virtio-gpu.c                     | 54 ++++++++++++++++++++-
 include/hw/virtio/virtio-gpu.h              |  6 +++
 include/standard-headers/linux/virtio_gpu.h |  2 +
 5 files changed, 66 insertions(+), 3 deletions(-)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index c8da4806e0..0218a6d3d2 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -211,6 +211,9 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
     if (virtio_gpu_blob_enabled(g->conf)) {
         features |= (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
     }
+    if (virtio_gpu_relfence_enabled(g->conf)) {
+        features |= (1 << VIRTIO_GPU_F_RELEASE_FENCE);
+    }
 
     return features;
 }
diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index c6f7f58784..adb3fd4e0c 100644
--- a/hw/display/virtio-gpu-udmabuf.c
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -157,7 +157,7 @@ void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res)
     }
 }
 
-static void virtio_gpu_free_dmabuf(VirtIOGPU *g, VGPUDMABuf *dmabuf)
+void virtio_gpu_free_dmabuf(VirtIOGPU *g, VGPUDMABuf *dmabuf)
 {
     struct virtio_gpu_scanout *scanout;
 
@@ -216,7 +216,7 @@ int virtio_gpu_update_dmabuf(VirtIOGPU *g,
                         new_primary->buf.height);
     dpy_gl_scanout_dmabuf(scanout->con, &new_primary->buf);
 
-    if (old_primary) {
+    if (old_primary && !virtio_gpu_relfence_enabled(g->parent_obj.conf)) {
         virtio_gpu_free_dmabuf(g, old_primary);
     }
 
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 182e0868b0..115c7033aa 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -771,6 +771,11 @@ static void virtio_gpu_set_scanout_blob(VirtIOGPU *g,
 
     virtio_gpu_do_set_scanout(g, ss.scanout_id,
                               &fb, res, &ss.r, &cmd->error);
+
+    if (virtio_gpu_relfence_enabled(g->parent_obj.conf)) {
+        cmd->finished = true;
+        cmd->error = VIRTIO_GPU_RESP_OK_NODATA;
+    }
 }
 
 int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
@@ -1038,12 +1043,43 @@ void virtio_gpu_process_cmdq(VirtIOGPU *g)
                 fprintf(stderr, "inflight: %3d (+)\r", g->inflight);
             }
         } else {
-            g_free(cmd);
+            if (cmd->cmd_hdr.type == VIRTIO_GPU_CMD_SET_SCANOUT_BLOB &&
+                cmd->error == VIRTIO_GPU_RESP_OK_NODATA) {
+                QTAILQ_INSERT_TAIL(&g->rel_fenceq, cmd, next);
+            } else {
+                g_free(cmd);
+            }
         }
     }
     g->processing_cmdq = false;
 }
 
+static void virtio_gpu_process_rel_fenceq(VirtIOGPU *g)
+{
+    struct virtio_gpu_simple_resource *res;
+    struct virtio_gpu_set_scanout_blob ss;
+    struct virtio_gpu_ctrl_command *cmd, *tmp;
+    VGPUDMABuf *dmabuf, *temp;
+
+    QTAILQ_FOREACH_SAFE(dmabuf, &g->dmabuf.bufs, next, temp) {
+        if (dmabuf->buf.fence_fd < 0) {
+            QTAILQ_FOREACH_SAFE(cmd, &g->rel_fenceq, next, tmp) {
+                VIRTIO_GPU_FILL_CMD(ss);
+                virtio_gpu_bswap_32(&ss, sizeof(ss));
+                res = virtio_gpu_find_check_resource(g, ss.resource_id, true,
+                                                     __func__, &cmd->error);
+                if (res && dmabuf->buf.fd == res->dmabuf_fd) {
+                    virtio_gpu_ctrl_response_nodata(g, cmd,
+                                                    VIRTIO_GPU_RESP_OK_NODATA);
+                    QTAILQ_REMOVE(&g->rel_fenceq, cmd, next);
+                    g_free(cmd);
+                }
+            }
+            virtio_gpu_free_dmabuf(g, dmabuf);
+        }
+    }
+}
+
 static void virtio_gpu_process_fenceq(VirtIOGPU *g)
 {
     struct virtio_gpu_ctrl_command *cmd, *tmp;
@@ -1064,6 +1100,12 @@ static void virtio_gpu_handle_gl_flushed(VirtIOGPUBase *b)
 {
     VirtIOGPU *g = container_of(b, VirtIOGPU, parent_obj);
 
+    if (virtio_gpu_relfence_enabled(g->parent_obj.conf)) {
+        virtio_gpu_process_rel_fenceq(g);
+    }
+    if (g->parent_obj.renderer_blocked) {
+        return;
+    }
     virtio_gpu_process_fenceq(g);
     virtio_gpu_process_cmdq(g);
 }
@@ -1323,6 +1365,13 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
         }
     }
 
+    if (virtio_gpu_relfence_enabled(g->parent_obj.conf)) {
+        if (!virtio_gpu_blob_enabled(g->parent_obj.conf)) {
+            error_setg(errp, "cannot enable relfence without blob resources");
+            return;
+        }
+    }
+
     if (!virtio_gpu_base_device_realize(qdev,
                                         virtio_gpu_handle_ctrl_cb,
                                         virtio_gpu_handle_cursor_cb,
@@ -1337,6 +1386,7 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
     QTAILQ_INIT(&g->reslist);
     QTAILQ_INIT(&g->cmdq);
     QTAILQ_INIT(&g->fenceq);
+    QTAILQ_INIT(&g->rel_fenceq);
 }
 
 void virtio_gpu_reset(VirtIODevice *vdev)
@@ -1418,6 +1468,8 @@ static Property virtio_gpu_properties[] = {
                      256 * MiB),
     DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
                     VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
+    DEFINE_PROP_BIT("relfence", VirtIOGPU, parent_obj.conf.flags,
+                    VIRTIO_GPU_FLAG_RELFENCE_ENABLED, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 24c6628944..60dd2b8985 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -90,6 +90,7 @@ enum virtio_gpu_base_conf_flags {
     VIRTIO_GPU_FLAG_EDID_ENABLED,
     VIRTIO_GPU_FLAG_DMABUF_ENABLED,
     VIRTIO_GPU_FLAG_BLOB_ENABLED,
+    VIRTIO_GPU_FLAG_RELFENCE_ENABLED,
 };
 
 #define virtio_gpu_virgl_enabled(_cfg) \
@@ -102,6 +103,8 @@ enum virtio_gpu_base_conf_flags {
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
 #define virtio_gpu_blob_enabled(_cfg) \
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
+#define virtio_gpu_relfence_enabled(_cfg) \
+    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_RELFENCE_ENABLED))
 
 struct virtio_gpu_base_conf {
     uint32_t max_outputs;
@@ -170,6 +173,7 @@ struct VirtIOGPU {
     QTAILQ_HEAD(, virtio_gpu_simple_resource) reslist;
     QTAILQ_HEAD(, virtio_gpu_ctrl_command) cmdq;
     QTAILQ_HEAD(, virtio_gpu_ctrl_command) fenceq;
+    QTAILQ_HEAD(, virtio_gpu_ctrl_command) rel_fenceq;
 
     uint64_t hostmem;
 
@@ -274,6 +278,8 @@ int virtio_gpu_update_dmabuf(VirtIOGPU *g,
                              uint32_t scanout_id,
                              struct virtio_gpu_simple_resource *res,
                              struct virtio_gpu_framebuffer *fb);
+void virtio_gpu_free_dmabuf(VirtIOGPU *g,
+                            VGPUDMABuf *dmabuf);
 
 /* virtio-gpu-3d.c */
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standard-headers/linux/virtio_gpu.h
index 1357e4774e..4331f999c4 100644
--- a/include/standard-headers/linux/virtio_gpu.h
+++ b/include/standard-headers/linux/virtio_gpu.h
@@ -60,6 +60,8 @@
  */
 #define VIRTIO_GPU_F_RESOURCE_BLOB       3
 
+#define VIRTIO_GPU_F_RELEASE_FENCE       4
+
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
 
-- 
2.30.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7344B38F5DD
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 00:51:41 +0200 (CEST)
Received: from localhost ([::1]:49466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llJQC-00057z-7i
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 18:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1llJIN-0006zi-TU
 for qemu-devel@nongnu.org; Mon, 24 May 2021 18:43:35 -0400
Received: from mga05.intel.com ([192.55.52.43]:11775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1llJIM-0006or-0C
 for qemu-devel@nongnu.org; Mon, 24 May 2021 18:43:35 -0400
IronPort-SDR: yXONNY2ywx2MUAHl/+SzC8Msjc+CKY/c6lXMqwH+D+mlu98enng+LlK5ET9Vq6X3Zy29MNYnJ6
 xK5b0hb+VJ+g==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="287620904"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="287620904"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 15:43:17 -0700
IronPort-SDR: GKDjz4foCEAuxYKHEEFrt0Wz3+4QwRRt++JgwW7Q7n6poEd2ot18FrWlY270sFsxr9o5Q9dZRU
 zct9gmJf+SrA==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="546246760"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 15:43:17 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/13] virtio-gpu: Add initial definitions for blob
 resources
Date: Mon, 24 May 2021 15:30:57 -0700
Message-Id: <20210524223103.922910-8-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524223103.922910-1-vivek.kasireddy@intel.com>
References: <20210524223103.922910-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=vivek.kasireddy@intel.com; helo=mga05.intel.com
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

Add the property bit, configuration flag and other relevant
macros and definitions associated with this feature.

Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu-base.c   |  3 +++
 hw/display/virtio-gpu.c        | 14 ++++++++++++++
 include/hw/virtio/virtio-gpu.h |  3 +++
 3 files changed, 20 insertions(+)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index afb3ee7d9a..dd294276cb 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -208,6 +208,9 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
     if (virtio_gpu_edid_enabled(g->conf)) {
         features |= (1 << VIRTIO_GPU_F_EDID);
     }
+    if (virtio_gpu_blob_enabled(g->conf)) {
+        features |= (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
+    }
 
     return features;
 }
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 7a0db3a860..f77a7fc7dd 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1108,6 +1108,18 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
     VirtIODevice *vdev = VIRTIO_DEVICE(qdev);
     VirtIOGPU *g = VIRTIO_GPU(qdev);
 
+    if (virtio_gpu_blob_enabled(g->parent_obj.conf)) {
+        if (!virtio_gpu_have_udmabuf()) {
+            error_setg(errp, "cannot enable blob resources without udmabuf");
+            return;
+        }
+
+        if (virtio_gpu_virgl_enabled(g->parent_obj.conf)) {
+            error_setg(errp, "blobs and virgl are not compatible (yet)");
+            return;
+        }
+    }
+
     if (!virtio_gpu_base_device_realize(qdev,
                                         virtio_gpu_handle_ctrl_cb,
                                         virtio_gpu_handle_cursor_cb,
@@ -1201,6 +1213,8 @@ static Property virtio_gpu_properties[] = {
     VIRTIO_GPU_BASE_PROPERTIES(VirtIOGPU, parent_obj.conf),
     DEFINE_PROP_SIZE("max_hostmem", VirtIOGPU, conf_max_hostmem,
                      256 * MiB),
+    DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
+                    VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index dad9a1d221..66e7aaad0e 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -89,6 +89,7 @@ enum virtio_gpu_base_conf_flags {
     VIRTIO_GPU_FLAG_STATS_ENABLED,
     VIRTIO_GPU_FLAG_EDID_ENABLED,
     VIRTIO_GPU_FLAG_DMABUF_ENABLED,
+    VIRTIO_GPU_FLAG_BLOB_ENABLED,
 };
 
 #define virtio_gpu_virgl_enabled(_cfg) \
@@ -99,6 +100,8 @@ enum virtio_gpu_base_conf_flags {
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_EDID_ENABLED))
 #define virtio_gpu_dmabuf_enabled(_cfg) \
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
+#define virtio_gpu_blob_enabled(_cfg) \
+    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
 
 struct virtio_gpu_base_conf {
     uint32_t max_outputs;
-- 
2.30.2



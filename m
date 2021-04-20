Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844FA3652DC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 09:08:06 +0200 (CEST)
Received: from localhost ([::1]:34892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYkUP-0006EY-Ho
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 03:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lYkSJ-0003IX-5y
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 03:05:55 -0400
Received: from mga17.intel.com ([192.55.52.151]:17757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lYkSH-0002nI-7c
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 03:05:54 -0400
IronPort-SDR: xqId6ZwdAVAVXB71GY6ivNBm9E8Y8hSbCSOPJS5XroFDGGawda+0dVFMLnUBRn4l/jKPTwlZiZ
 CARybnbgaDpg==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="175563728"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; d="scan'208";a="175563728"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 00:05:37 -0700
IronPort-SDR: kxXuujgMa28mkOTs67L+rZqslSWpAJIH1UmAjGedDkIWew65VJ1QQfIvexgMVMVk/2NhfHhjCp
 dgFHM98kTHPw==
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; d="scan'208";a="420293135"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 00:05:37 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/12] virtio-gpu: Add initial definitions for blob
 resources
Date: Mon, 19 Apr 2021 23:53:41 -0700
Message-Id: <20210420065347.2685768-7-vivek.kasireddy@intel.com>
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the property bit, configuration flag and other relevant
macros and definitions associated with this feature.

Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu-base.c   |  3 +++
 hw/display/virtio-gpu.c        | 14 ++++++++++++++
 include/hw/virtio/virtio-gpu.h |  3 +++
 3 files changed, 20 insertions(+)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 25f8920fdb..70e4d53d26 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -210,6 +210,9 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
     if (virtio_gpu_edid_enabled(g->conf)) {
         features |= (1 << VIRTIO_GPU_F_EDID);
     }
+    if (virtio_gpu_blob_enabled(g->conf)) {
+        features |= (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
+    }
 
     return features;
 }
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 85c8eb749d..8b67d39889 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1176,6 +1176,18 @@ static void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
 #endif
     }
 
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
@@ -1292,6 +1304,8 @@ static Property virtio_gpu_properties[] = {
     DEFINE_PROP_BIT("stats", VirtIOGPU, parent_obj.conf.flags,
                     VIRTIO_GPU_FLAG_STATS_ENABLED, false),
 #endif
+    DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
+                    VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 879f4cfff6..415aeddb07 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -85,6 +85,7 @@ enum virtio_gpu_base_conf_flags {
     VIRTIO_GPU_FLAG_STATS_ENABLED,
     VIRTIO_GPU_FLAG_EDID_ENABLED,
     VIRTIO_GPU_FLAG_DMABUF_ENABLED,
+    VIRTIO_GPU_FLAG_BLOB_ENABLED,
 };
 
 #define virtio_gpu_virgl_enabled(_cfg) \
@@ -95,6 +96,8 @@ enum virtio_gpu_base_conf_flags {
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_EDID_ENABLED))
 #define virtio_gpu_dmabuf_enabled(_cfg) \
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
+#define virtio_gpu_blob_enabled(_cfg) \
+    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
 
 struct virtio_gpu_base_conf {
     uint32_t max_outputs;
-- 
2.26.2



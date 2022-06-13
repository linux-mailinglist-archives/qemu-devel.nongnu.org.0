Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B93D6547F77
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 08:23:14 +0200 (CEST)
Received: from localhost ([::1]:52838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0dTl-0002nv-FN
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 02:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o0dOE-0000O7-HF
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 02:17:35 -0400
Received: from mga03.intel.com ([134.134.136.65]:32806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o0dO7-0005Vs-JW
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 02:17:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655101043; x=1686637043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GP51qLt1vIw10Qn2ckQiyo2AsRIDCvKVJfy/CW5j34Y=;
 b=kntSfnd65TvDPGTCV9ZCJKmtrsSdhnGy6QKVozBO5hqu+ASm0r1+vNTM
 jZdB6qTrqvdCS21d/70zbvhw8rdnOkVQ/vlzgLu3fKgcEZuF4vkWe5QQg
 K1VrUWQROmCkmjSBEIPdcYw3W7X7Y/TQ+SHDduu41XElvmP4II7x89Fp4
 Q7h1ga5uK1VSGvFeMZEiNtMec7SRwnq0czytpzWMAGy42D6iVxca4UprH
 wccyIijgCeR+aecgkDg8n0/BxsvlutTEnIRLaNyXGFNZOD7oy03VrkyiK
 f/Siyq4XDGz9bvlSXnZtk2bgKSNYaraSUGmr/34mYIVt7KWdNK/Ef4LYU g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="279229916"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="279229916"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2022 23:17:19 -0700
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="910205031"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.123])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2022 23:17:16 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: eric.auger@redhat.com
Cc: qemu-devel@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 pbonzini@redhat.com, yu.c.zhang@intel.com, chuanxiao.dong@intel.com,
 tina.zhang@intel.com
Subject: [PATCH 2/3] virtio-iommu: Use recursive lock to avoid deadlock
Date: Mon, 13 Jun 2022 14:10:09 +0800
Message-Id: <20220613061010.2674054-3-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613061010.2674054-1-zhenzhong.duan@intel.com>
References: <20220613061010.2674054-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=zhenzhong.duan@intel.com; helo=mga03.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When switching address space with mutex lock hold, mapping will be
replayed for assigned device. This will trigger relock deadlock.

Also release the mutex resource in unrealize routine.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 hw/virtio/virtio-iommu.c         | 20 +++++++++++---------
 include/hw/virtio/virtio-iommu.h |  2 +-
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index ff718107ee02..73d5bde9d122 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -78,7 +78,7 @@ static bool virtio_iommu_device_bypassed(IOMMUDevice *sdev)
 
     sid = virtio_iommu_get_bdf(sdev);
 
-    qemu_mutex_lock(&s->mutex);
+    qemu_rec_mutex_lock(&s->mutex);
     /* need to check bypass before system reset */
     if (!s->endpoints) {
         bypassed = s->config.bypass;
@@ -93,7 +93,7 @@ static bool virtio_iommu_device_bypassed(IOMMUDevice *sdev)
     }
 
 unlock:
-    qemu_mutex_unlock(&s->mutex);
+    qemu_rec_mutex_unlock(&s->mutex);
     return bypassed;
 }
 
@@ -745,7 +745,7 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
             tail.status = VIRTIO_IOMMU_S_DEVERR;
             goto out;
         }
-        qemu_mutex_lock(&s->mutex);
+        qemu_rec_mutex_lock(&s->mutex);
         switch (head.type) {
         case VIRTIO_IOMMU_T_ATTACH:
             tail.status = virtio_iommu_handle_attach(s, iov, iov_cnt);
@@ -774,7 +774,7 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
         default:
             tail.status = VIRTIO_IOMMU_S_UNSUPP;
         }
-        qemu_mutex_unlock(&s->mutex);
+        qemu_rec_mutex_unlock(&s->mutex);
 
 out:
         sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
@@ -862,7 +862,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     sid = virtio_iommu_get_bdf(sdev);
 
     trace_virtio_iommu_translate(mr->parent_obj.name, sid, addr, flag);
-    qemu_mutex_lock(&s->mutex);
+    qemu_rec_mutex_lock(&s->mutex);
 
     ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
     if (!ep) {
@@ -946,7 +946,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     trace_virtio_iommu_translate_out(addr, entry.translated_addr, sid);
 
 unlock:
-    qemu_mutex_unlock(&s->mutex);
+    qemu_rec_mutex_unlock(&s->mutex);
     return entry;
 }
 
@@ -1035,7 +1035,7 @@ static void virtio_iommu_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
 
     sid = virtio_iommu_get_bdf(sdev);
 
-    qemu_mutex_lock(&s->mutex);
+    qemu_rec_mutex_lock(&s->mutex);
 
     if (!s->endpoints) {
         goto unlock;
@@ -1049,7 +1049,7 @@ static void virtio_iommu_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
     g_tree_foreach(ep->domain->mappings, virtio_iommu_remap, mr);
 
 unlock:
-    qemu_mutex_unlock(&s->mutex);
+    qemu_rec_mutex_unlock(&s->mutex);
 }
 
 static int virtio_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu_mr,
@@ -1167,7 +1167,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_PROBE);
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS_CONFIG);
 
-    qemu_mutex_init(&s->mutex);
+    qemu_rec_mutex_init(&s->mutex);
 
     s->as_by_busptr = g_hash_table_new_full(NULL, NULL, NULL, g_free);
 
@@ -1195,6 +1195,8 @@ static void virtio_iommu_device_unrealize(DeviceState *dev)
         g_tree_destroy(s->endpoints);
     }
 
+    qemu_rec_mutex_destroy(&s->mutex);
+
     virtio_delete_queue(s->req_vq);
     virtio_delete_queue(s->event_vq);
     virtio_cleanup(vdev);
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 102eeefa731d..2ad5ee320be9 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -58,7 +58,7 @@ struct VirtIOIOMMU {
     ReservedRegion *reserved_regions;
     uint32_t nb_reserved_regions;
     GTree *domains;
-    QemuMutex mutex;
+    QemuRecMutex mutex;
     GTree *endpoints;
     bool boot_bypass;
 };
-- 
2.25.1



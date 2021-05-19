Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2C6389437
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:56:52 +0200 (CEST)
Received: from localhost ([::1]:35004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPV5-00062P-PW
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP7F-0006dp-Iy
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:32:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP7C-00064r-JD
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:32:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3EN2RtzwvYrUtWholmNU/bVJLAfkhNFdmmfMWBtVVPE=;
 b=UiRi7O0MaoTO7YnbL951I3Ph1ORYNhdU38JsmO50vBNI8rbHz3id2aXUK5nUxtjdxm9XK4
 qp494CU1JlzU8M2/EN5b78xlWPGEOxrPuOLnObqeGTYlP8SBCiV47Cv2nQ2pJz9y5wbCPI
 Wvy2Qh0DJABy/o800PZzpoDwVsXOh+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-9KOtJN-6Nf6rUjMRoktSIA-1; Wed, 19 May 2021 12:32:08 -0400
X-MC-Unique: 9KOtJN-6Nf6rUjMRoktSIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE60F107ACC7;
 Wed, 19 May 2021 16:32:06 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C205B5D6AC;
 Wed, 19 May 2021 16:31:54 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 23/29] vhost: Use a tree to store memory mappings
Date: Wed, 19 May 2021 18:28:57 +0200
Message-Id: <20210519162903.1172366-24-eperezma@redhat.com>
In-Reply-To: <20210519162903.1172366-1-eperezma@redhat.com>
References: <20210519162903.1172366-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the moment, the tree is only used to store 1:1 maps of the qemu
virtual addresses of shadow virtqueue vring and the guest's addresses.
In other words, the tree only serves to check if the address the guest
exposed is valid at the moment qemu receives the miss.

It does not work if device has restrictions in its iova
range at the moment.

Updates to tree are protected by BQL, each one always run from main
event loop context. vhost_device_iotlb_miss runs in the same one on
reading it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost.h |   3 +
 hw/virtio/vhost.c         | 121 ++++++++++++++++++++++++++++++--------
 2 files changed, 99 insertions(+), 25 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index c97a4c0017..773f882145 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -2,6 +2,7 @@
 #define VHOST_H
 
 #include "hw/virtio/vhost-backend.h"
+#include "hw/virtio/vhost-iova-tree.h"
 #include "hw/virtio/virtio.h"
 #include "exec/memory.h"
 
@@ -88,6 +89,8 @@ struct vhost_dev {
     bool log_enabled;
     bool shadow_vqs_enabled;
     uint64_t log_size;
+    /* IOVA mapping used by Shadow Virtqueue */
+    VhostIOVATree iova_map;
     struct {
         hwaddr first;
         hwaddr last;
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index c8fa9df9b3..925d2146a4 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1013,31 +1013,45 @@ static int vhost_memory_region_lookup(struct vhost_dev *hdev,
 
 int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write)
 {
-    IOMMUTLBEntry iotlb;
+    IOMMUAccessFlags perm;
     uint64_t uaddr, len;
     int ret = -EFAULT;
 
-    RCU_READ_LOCK_GUARD();
-
     trace_vhost_iotlb_miss(dev, 1);
 
     if (dev->shadow_vqs_enabled) {
-        uaddr = iova;
-        len = 4096;
-        ret = vhost_backend_update_device_iotlb(dev, iova, uaddr, len,
-                                                IOMMU_RW);
-        if (ret) {
-            trace_vhost_iotlb_miss(dev, 2);
-            error_report("Fail to update device iotlb");
+        /* Shadow virtqueue translations in its Virtual Address Space */
+        const VhostDMAMap *result;
+        const VhostDMAMap needle = {
+            .iova = iova,
+        };
+
+        result = vhost_iova_tree_find_taddr(&dev->iova_map, &needle);
+
+        if (unlikely(!result)) {
+            goto out;
         }
 
-        return ret;
-    }
+        iova = result->iova;
+        uaddr = (uint64_t)result->translated_addr;
+        /*
+         * In IOVATree, result.iova + result.size is the last element of iova.
+         * For vhost, it is one past that last element.
+         */
+        len = result->size + 1;
+        perm = result->perm;
+    } else {
+        IOMMUTLBEntry iotlb;
+
+        RCU_READ_LOCK_GUARD();
+        iotlb = address_space_get_iotlb_entry(dev->vdev->dma_as,
+                                              iova, write,
+                                              MEMTXATTRS_UNSPECIFIED);
+
+        if (iotlb.target_as == NULL) {
+            goto out;
+        }
 
-    iotlb = address_space_get_iotlb_entry(dev->vdev->dma_as,
-                                          iova, write,
-                                          MEMTXATTRS_UNSPECIFIED);
-    if (iotlb.target_as != NULL) {
         ret = vhost_memory_region_lookup(dev, iotlb.translated_addr,
                                          &uaddr, &len);
         if (ret) {
@@ -1049,14 +1063,14 @@ int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write)
 
         len = MIN(iotlb.addr_mask + 1, len);
         iova = iova & ~iotlb.addr_mask;
+        perm = iotlb.perm;
+    }
 
-        ret = vhost_backend_update_device_iotlb(dev, iova, uaddr,
-                                                len, iotlb.perm);
-        if (ret) {
-            trace_vhost_iotlb_miss(dev, 4);
-            error_report("Fail to update device iotlb");
-            goto out;
-        }
+    ret = vhost_backend_update_device_iotlb(dev, iova, uaddr, len, perm);
+    if (ret) {
+        trace_vhost_iotlb_miss(dev, 4);
+        error_report("Fail to update device iotlb");
+        goto out;
     }
 
     trace_vhost_iotlb_miss(dev, 2);
@@ -1249,7 +1263,7 @@ static int vhost_sw_live_migration_stop(struct vhost_dev *dev)
     if (r) {
         error_report("Fail to invalidate device iotlb");
     }
-
+    vhost_iova_tree_destroy(&dev->iova_map);
     for (idx = 0; idx < dev->nvqs; ++idx) {
         struct vhost_virtqueue *vq = dev->vqs + idx;
         if (vhost_dev_has_iommu(dev) &&
@@ -1279,6 +1293,26 @@ static int vhost_sw_live_migration_stop(struct vhost_dev *dev)
     return 0;
 }
 
+static bool vhost_shadow_vq_start_store_sections(struct vhost_dev *dev)
+{
+    int idx;
+
+    for (idx = 0; idx < dev->n_mem_sections; ++idx) {
+        size_t region_size = dev->mem->regions[idx].memory_size;
+        VhostDMAMap region = {
+            .iova = dev->mem->regions[idx].userspace_addr,
+            .translated_addr = (void *)dev->mem->regions[idx].userspace_addr,
+            .size = region_size - 1,
+            .perm = VHOST_ACCESS_RW,
+        };
+
+        VhostDMAMapNewRC r = vhost_iova_tree_insert(&dev->iova_map, &region);
+        assert(r == VHOST_DMA_MAP_OK);
+    }
+
+    return true;
+}
+
 /*
  * Start shadow virtqueue in a given queue.
  * In failure case, this function leaves queue working as regular vhost mode.
@@ -1292,9 +1326,37 @@ static bool vhost_sw_live_migration_start_vq(struct vhost_dev *dev,
     struct vhost_vring_state s = {
         .index = idx,
     };
+    VhostDMAMap driver_region, device_region;
+
     int r;
     bool ok;
 
+    assert(dev->shadow_vqs[idx] != NULL);
+    vhost_shadow_vq_get_vring_addr(dev->shadow_vqs[idx], &addr);
+    driver_region = (VhostDMAMap) {
+        .iova = addr.desc_user_addr,
+        .translated_addr = (void *)addr.desc_user_addr,
+
+        /*
+         * DMAMAp.size include the last byte included in the range, while
+         * sizeof marks one past it. Substract one byte to make them match.
+         */
+        .size = vhost_shadow_vq_driver_area_size(dev->shadow_vqs[idx]) - 1,
+        .perm = VHOST_ACCESS_RO,
+    };
+    device_region = (VhostDMAMap) {
+        .iova = addr.used_user_addr,
+        .translated_addr = (void *)addr.used_user_addr,
+        .size = vhost_shadow_vq_device_area_size(dev->shadow_vqs[idx]) - 1,
+        .perm = VHOST_ACCESS_RW,
+    };
+
+    r = vhost_iova_tree_insert(&dev->iova_map, &driver_region);
+    assert(r == VHOST_DMA_MAP_OK);
+
+    r = vhost_iova_tree_insert(&dev->iova_map, &device_region);
+    assert(r == VHOST_DMA_MAP_OK);
+
     vhost_virtqueue_stop(dev, dev->vdev, &dev->vqs[idx], dev->vq_index + idx);
     ok = vhost_shadow_vq_start(dev, idx, dev->shadow_vqs[idx]);
     if (unlikely(!ok)) {
@@ -1302,7 +1364,6 @@ static bool vhost_sw_live_migration_start_vq(struct vhost_dev *dev,
     }
 
     /* From this point, vhost_virtqueue_start can reset these changes */
-    vhost_shadow_vq_get_vring_addr(dev->shadow_vqs[idx], &addr);
     r = dev->vhost_ops->vhost_set_vring_addr(dev, &addr);
     if (unlikely(r != 0)) {
         VHOST_OPS_DEBUG("vhost_set_vring_addr for shadow vq failed");
@@ -1315,6 +1376,7 @@ static bool vhost_sw_live_migration_start_vq(struct vhost_dev *dev,
         goto err;
     }
 
+
     if (vhost_dev_has_iommu(dev) && dev->vhost_ops->vhost_set_iotlb_callback) {
         /*
          * Update used ring information for IOTLB to work correctly,
@@ -1357,6 +1419,15 @@ static int vhost_sw_live_migration_start(struct vhost_dev *dev)
         error_report("Fail to invalidate device iotlb");
     }
 
+    /*
+     * Create new iova mappings. SVQ always expose qemu's VA.
+     * TODO: Fine tune the exported mapping. Default vhost does not expose
+     * everything.
+     */
+
+    vhost_iova_tree_new(&dev->iova_map);
+    vhost_shadow_vq_start_store_sections(dev);
+
     /* Can be read by vhost_virtqueue_mask, from vm exit */
     dev->shadow_vqs_enabled = true;
     for (idx = 0; idx < dev->nvqs; ++idx) {
-- 
2.27.0



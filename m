Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE1541E84F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 09:26:34 +0200 (CEST)
Received: from localhost ([::1]:55810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWCwD-0004oe-Jd
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 03:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mWCjS-0005df-BN
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:13:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mWCjQ-0005vm-Is
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633072400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ijz1uGxJNfAOPp7OTbE3hzeXRghB2rBlM3NdVAU5g8=;
 b=A6wGdxePAhLmxqhQCm8LrwWP8zlTlAKPfBldDk5bL5Ko1MN77vobA2NsFI7Oenl0CNwzez
 OA7Mf/VJlGgT2MWciLR+F31uHhBalCrcDRvY62yPqTs4SQwx9tFIeXrUf91Rt8Y5Z3ropW
 DkU+4y2TVx7R930J8PcWpEzoW2BKGNQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-o688-fhbPV-e_6AtC9NjVg-1; Fri, 01 Oct 2021 03:13:18 -0400
X-MC-Unique: o688-fhbPV-e_6AtC9NjVg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8960819067E0;
 Fri,  1 Oct 2021 07:13:17 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94D9C1980E;
 Fri,  1 Oct 2021 07:13:14 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 19/20] vhost: Use a tree to store memory mappings
Date: Fri,  1 Oct 2021 09:06:02 +0200
Message-Id: <20211001070603.307037-20-eperezma@redhat.com>
In-Reply-To: <20211001070603.307037-1-eperezma@redhat.com>
References: <20211001070603.307037-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Track memory translations of devices with IOMMU (all vhost-vdpa
devices at the moment). It does not work if device has restrictions in
its iova range at the moment.

Updates to tree are protected by BQL, each one always run from main
event loop context.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h |  3 ++
 hw/virtio/vhost-vdpa.c         | 59 ++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 9044ae694b..7353e36884 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -15,6 +15,7 @@
 #include <gmodule.h>
 
 #include "qemu/queue.h"
+#include "hw/virtio/vhost-iova-tree.h"
 #include "hw/virtio/virtio.h"
 
 typedef struct VhostVDPAHostNotifier {
@@ -29,6 +30,8 @@ typedef struct vhost_vdpa {
     uint64_t host_features;
     uint64_t guest_features;
     bool shadow_vqs_enabled;
+    /* IOVA mapping used by Shadow Virtqueue */
+    VhostIOVATree *iova_map;
     GPtrArray *shadow_vqs;
     struct vhost_dev *dev;
     QLIST_ENTRY(vhost_vdpa) entry;
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index bb7010ddb5..a9c680b487 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -395,6 +395,7 @@ static void vhost_vdpa_svq_cleanup(struct vhost_dev *dev)
         vhost_svq_stop(dev, idx, g_ptr_array_index(v->shadow_vqs, idx));
     }
     g_ptr_array_free(v->shadow_vqs, true);
+    g_clear_pointer(&v->iova_map, vhost_iova_tree_unref);
 }
 
 static int vhost_vdpa_cleanup(struct vhost_dev *dev)
@@ -753,6 +754,22 @@ static bool  vhost_vdpa_force_iommu(struct vhost_dev *dev)
     return true;
 }
 
+/**
+ * Maps QEMU vaddr memory to device in a suitable way for shadow virtqueue:
+ * - It always reference qemu memory address, not guest's memory.
+ * - TODO It's always in range of device.
+ *
+ * It returns the translated address
+ */
+static int vhost_vdpa_svq_map(struct vhost_vdpa *v, VhostDMAMap *map)
+{
+    int r = vhost_iova_tree_alloc(v->iova_map, map);
+    assert(r == VHOST_DMA_MAP_OK);
+
+    return vhost_vdpa_dma_map(v, map->iova, map->size, map->translated_addr,
+                              false);
+}
+
 static int vhost_vdpa_vring_pause(struct vhost_dev *dev)
 {
     int r;
@@ -771,6 +788,7 @@ static int vhost_vdpa_vring_pause(struct vhost_dev *dev)
  */
 static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned idx)
 {
+    VhostDMAMap device_region, driver_region;
     struct vhost_vdpa *v = dev->opaque;
     VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, idx);
     EventNotifier *vhost_call_notifier = vhost_svq_get_svq_call_notifier(svq);
@@ -789,6 +807,33 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned idx)
     bool b;
 
     vhost_svq_get_vring_addr(svq, &addr);
+    driver_region = (VhostDMAMap) {
+        .translated_addr = (void *)addr.desc_user_addr,
+
+        /*
+         * DMAMAp.size include the last byte included in the range, while
+         * sizeof marks one past it. Substract one byte to make them match.
+         */
+        .size = vhost_svq_driver_area_size(svq) - 1,
+        .perm = VHOST_ACCESS_RO,
+    };
+    device_region = (VhostDMAMap) {
+        .translated_addr = (void *)addr.used_user_addr,
+        .size = vhost_svq_device_area_size(svq) - 1,
+        .perm = VHOST_ACCESS_RW,
+    };
+
+    r = vhost_vdpa_svq_map(v, &driver_region);
+    assert(r == 0);
+    r = vhost_vdpa_svq_map(v, &device_region);
+    assert(r == 0);
+
+    /* Expose IOVA addresses to vDPA device */
+    addr.avail_user_addr = driver_region.iova + addr.avail_user_addr
+                           - addr.desc_user_addr;
+    addr.desc_user_addr = driver_region.iova;
+    addr.used_user_addr = device_region.iova;
+
     r = vhost_vdpa_set_vring_addr(dev, &addr);
     if (unlikely(r)) {
         error_report("vhost_set_vring_addr for shadow vq failed");
@@ -822,6 +867,17 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned idx)
     return true;
 }
 
+/**
+ * Enable or disable shadow virtqueue in a vhost vdpa device.
+ *
+ * This function is idempotent, to call it many times with the same value for
+ * enable_svq will simply return success.
+ *
+ * @v       The vhost vdpa device
+ * @enable  The value of shadow virtqueue we want.
+ *
+ * Returns the number of queues changed.
+ */
 static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable)
 {
     struct vhost_dev *hdev = v->dev;
@@ -833,6 +889,8 @@ static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable)
     }
 
     if (enable) {
+        v->iova_map = vhost_iova_tree_new();
+
         /* Allocate resources */
         assert(v->shadow_vqs->len == 0);
         for (n = 0; n < hdev->nvqs; ++n) {
@@ -907,6 +965,7 @@ static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable)
     if (!enable) {
         /* Resources cleanup */
         g_ptr_array_set_size(v->shadow_vqs, 0);
+        g_clear_pointer(&v->iova_map, vhost_iova_tree_unref);
     }
 
     return n;
-- 
2.27.0



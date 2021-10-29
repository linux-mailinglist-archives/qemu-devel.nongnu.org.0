Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3BD4402DA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:06:30 +0200 (CEST)
Received: from localhost ([::1]:34632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXCv-000339-F4
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWrg-0006R8-Dg
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:44:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWre-00033Y-Ln
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635533070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oDdvf2V5s477wTn0WzMmebl1rwoC0/0i5yrK+I/M82E=;
 b=X1RmX6q3bT9UKiQfABgDKG8ZpGq1kM3W7qwOEsFqEo6675ejivtRn6x9qerFG6ctJ0UTDE
 Sv5Rrr8vRa2u/5h98Nshn8mbwx1VhG7I/XRqsOqxc9qjt46Q1AYIssFa2UfwJR3vI9RMr5
 AkWHl98/OBn7fwsD8UgJN1y0xaLfdvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-TPrsrzBIMfuL1ZQH41fYbQ-1; Fri, 29 Oct 2021 14:44:26 -0400
X-MC-Unique: TPrsrzBIMfuL1ZQH41fYbQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4ED9F5721D;
 Fri, 29 Oct 2021 18:44:25 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34B335F4E1;
 Fri, 29 Oct 2021 18:44:21 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 25/26] vhost: Use a tree to store memory mappings
Date: Fri, 29 Oct 2021 20:35:24 +0200
Message-Id: <20211029183525.1776416-26-eperezma@redhat.com>
In-Reply-To: <20211029183525.1776416-1-eperezma@redhat.com>
References: <20211029183525.1776416-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>
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
 hw/virtio/vhost-vdpa.c         | 50 +++++++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 2f57b17208..365b102c14 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -14,6 +14,7 @@
 
 #include <gmodule.h>
 
+#include "hw/virtio/vhost-iova-tree.h"
 #include "hw/virtio/virtio.h"
 #include "standard-headers/linux/vhost_types.h"
 
@@ -30,6 +31,8 @@ typedef struct vhost_vdpa {
     MemoryListener listener;
     struct vhost_vdpa_iova_range iova_range;
     bool shadow_vqs_enabled;
+    /* IOVA mapping used by Shadow Virtqueue */
+    VhostIOVATree *iova_map;
     GPtrArray *shadow_vqs;
     struct vhost_dev *dev;
     int kick_fd[VIRTIO_QUEUE_MAX];
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index e1c55e43e7..a827ecbe4f 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -466,6 +466,7 @@ static void vhost_vdpa_svq_cleanup(struct vhost_dev *dev)
         vhost_svq_stop(dev, idx, g_ptr_array_index(v->shadow_vqs, idx));
     }
     g_ptr_array_free(v->shadow_vqs, true);
+    g_clear_pointer(&v->iova_map, vhost_iova_tree_unref);
 }
 
 static int vhost_vdpa_cleanup(struct vhost_dev *dev)
@@ -822,6 +823,22 @@ static bool  vhost_vdpa_force_iommu(struct vhost_dev *dev)
     return true;
 }
 
+/**
+ * Maps QEMU vaddr memory to device in a suitable way for shadow virtqueue:
+ * - It always reference qemu memory address, not guest's memory.
+ * - TODO It's always in range of device.
+ *
+ * It returns the translated address
+ */
+static int vhost_vdpa_svq_map(struct vhost_vdpa *v, DMAMap *map)
+{
+    int r = vhost_iova_tree_map_alloc(v->iova_map, map);
+    assert(r == IOVA_OK);
+
+    return vhost_vdpa_dma_map(v, map->iova, map->size,
+                              (void *)map->translated_addr, false);
+}
+
 static int vhost_vdpa_vring_pause(struct vhost_dev *dev)
 {
     int r;
@@ -872,8 +889,36 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned idx,
     if (svq_mode) {
         const EventNotifier *vhost_kick = vhost_svq_get_dev_kick_notifier(svq);
         const EventNotifier *vhost_call = vhost_svq_get_svq_call_notifier(svq);
+        DMAMap device_region, driver_region;
 
         vhost_svq_get_vring_addr(svq, &addr);
+        driver_region = (DMAMap) {
+            .translated_addr = (hwaddr)addr.desc_user_addr,
+
+            /*
+             * DMAMAp.size include the last byte included in the range, while
+             * sizeof marks one past it. Substract one byte to make them match.
+             */
+            .size = vhost_svq_driver_area_size(svq) - 1,
+            .perm = VHOST_ACCESS_RO,
+        };
+        device_region = (DMAMap) {
+            .translated_addr = (hwaddr)addr.used_user_addr,
+            .size = vhost_svq_device_area_size(svq) - 1,
+            .perm = VHOST_ACCESS_RW,
+        };
+
+        r = vhost_vdpa_svq_map(v, &driver_region);
+        assert(r == 0);
+        r = vhost_vdpa_svq_map(v, &device_region);
+        assert(r == 0);
+
+        /* Expose IOVA addresses to vDPA device */
+        addr.avail_user_addr = driver_region.iova + addr.avail_user_addr
+                               - addr.desc_user_addr;
+        addr.desc_user_addr = driver_region.iova;
+        addr.used_user_addr = device_region.iova;
+
         if (n->addr) {
             r = virtio_queue_set_host_notifier_mr(dev->vdev, idx, &n->mr,
                                                   false);
@@ -885,7 +930,6 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned idx,
             assert(r == 0);
             vhost_svq_set_host_mr_notifier(svq, n->addr);
         }
-
         vhost_svq_set_guest_call_notifier(svq, v->call_fd[idx]);
         vhost_svq_start(dev, idx, svq, v->kick_fd[idx]);
 
@@ -1001,6 +1045,7 @@ static bool vhost_vdpa_valid_features(struct vhost_dev *hdev,
 void vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable, Error **errp)
 {
     struct vhost_dev *hdev = v->dev;
+    hwaddr iova_first = v->iova_range.first, iova_last = v->iova_range.last;
     unsigned n;
     int r;
     uint64_t svq_features = hdev->features | BIT_ULL(VIRTIO_F_IOMMU_PLATFORM) |
@@ -1017,6 +1062,8 @@ void vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable, Error **errp)
             return;
         }
 
+        v->iova_map = vhost_iova_tree_new(iova_first, iova_last);
+
         /* Allocate resources */
         assert(v->shadow_vqs->len == 0);
         for (n = 0; n < hdev->nvqs; ++n) {
@@ -1093,6 +1140,7 @@ err_svq_new:
     if (!enable) {
         /* Resources cleanup */
         g_ptr_array_set_size(v->shadow_vqs, 0);
+        g_clear_pointer(&v->iova_map, vhost_iova_tree_unref);
     }
 }
 
-- 
2.27.0



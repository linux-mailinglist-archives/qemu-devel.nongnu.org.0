Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAED4B5A99
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:41:11 +0100 (CET)
Received: from localhost ([::1]:33252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJhDi-00006L-CD
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:41:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJgqa-00030D-6R
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:17:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJgqX-0001Fp-Gh
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644866231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tjxJgOxnjRa+v8NoOmbIpBO0uh0wXGghit6m6dUS0Po=;
 b=TTBqhWd1YVfWzn2anlMqIS9nco2ernFxoiZA3JXmGmlS/NmbN44auuUVKz9xV1/qjPCHs3
 PzWbFdZCi5LxLQrFnjmcq2JXEY5imBqvmK9JxZQD47hE4NeUWhBmLlNaaLE1k0vmoPNYth
 HSi3NfYQELkr55v9jTETAVUyjGwWdK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-0_tYXlXHPPSU2bTZM3p-Xw-1; Mon, 14 Feb 2022 14:17:08 -0500
X-MC-Unique: 0_tYXlXHPPSU2bTZM3p-Xw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B06F1091DA1;
 Mon, 14 Feb 2022 19:17:07 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0F114BC45;
 Mon, 14 Feb 2022 19:17:04 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 5/9] vhost: Add custom used buffer callback
Date: Mon, 14 Feb 2022 20:16:31 +0100
Message-Id: <20220214191635.1604932-6-eperezma@redhat.com>
In-Reply-To: <20220214191635.1604932-1-eperezma@redhat.com>
References: <20220214191635.1604932-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The callback allows SVQ users to know the VirtQueue requests and
responses. QEMU can use this to synchronize virtio device model state,
allowing to migrate it with minimum changes to the migration code.

In the case of networking, this will be used to inspect control
virtqueue messages.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h | 10 +++++++++-
 include/hw/virtio/vhost-vdpa.h     |  2 ++
 hw/virtio/vhost-shadow-virtqueue.c | 15 ++++++++++++++-
 hw/virtio/vhost-vdpa.c             |  4 ++--
 4 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index a2b0c6434d..f23fb93c20 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -16,6 +16,13 @@
 
 typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 
+typedef void (*VirtQueueElementCallback)(VirtIODevice *vdev,
+                                         const VirtQueueElement *elem);
+
+typedef struct VhostShadowVirtqueueOps {
+    VirtQueueElementCallback used_elem_handler;
+} VhostShadowVirtqueueOps;
+
 bool vhost_svq_valid_device_features(uint64_t *features);
 bool vhost_svq_valid_guest_features(uint64_t *features);
 bool vhost_svq_ack_guest_features(uint64_t dev_features,
@@ -39,7 +46,8 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
                      VirtQueue *vq);
 void vhost_svq_stop(VhostShadowVirtqueue *svq);
 
-VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize, VhostIOVATree *iova_map);
+VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize, VhostIOVATree *iova_map,
+                                    const VhostShadowVirtqueueOps *ops);
 
 void vhost_svq_free(VhostShadowVirtqueue *vq);
 
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index cd2388b3be..a0271534e6 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -17,6 +17,7 @@
 #include "hw/virtio/vhost-iova-tree.h"
 #include "hw/virtio/virtio.h"
 #include "standard-headers/linux/vhost_types.h"
+#include "hw/virtio/vhost-shadow-virtqueue.h"
 
 typedef struct VhostVDPAHostNotifier {
     MemoryRegion mr;
@@ -34,6 +35,7 @@ typedef struct vhost_vdpa {
     /* IOVA mapping used by Shadow Virtqueue */
     VhostIOVATree *iova_tree;
     GPtrArray *shadow_vqs;
+    const VhostShadowVirtqueueOps *shadow_vq_ops;
     struct vhost_dev *dev;
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
 } VhostVDPA;
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index ea32b7ae7f..5665947d1a 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -59,6 +59,12 @@ struct VhostShadowVirtqueue {
     /* Next VirtQueue element that guest made available */
     SVQElement *next_guest_avail_elem;
 
+    /* Optional callbacks */
+    const VhostShadowVirtqueueOps *ops;
+
+    /* Optional custom used virtqueue element handler */
+    VirtQueueElementCallback used_elem_cb;
+
     /* Next head to expose to device */
     uint16_t avail_idx_shadow;
 
@@ -509,6 +515,10 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
                 i = 0;
             }
             virtqueue_fill(vq, elem, elem->len, i++);
+
+            if (svq->ops && svq->ops->used_elem_handler) {
+                svq->ops->used_elem_handler(svq->vdev, elem);
+            }
         }
 
         virtqueue_flush(vq, i);
@@ -707,12 +717,14 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
  *
  * @qsize Shadow VirtQueue size
  * @iova_tree Tree to perform descriptors translations
+ * @used_cb Optional callback for each device's used buffer
  *
  * Returns the new virtqueue or NULL.
  *
  * In case of error, reason is reported through error_report.
  */
-VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize, VhostIOVATree *iova_tree)
+VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize, VhostIOVATree *iova_tree,
+                                    const VhostShadowVirtqueueOps *ops)
 {
     size_t desc_size = sizeof(vring_desc_t) * qsize;
     size_t device_size, driver_size;
@@ -747,6 +759,7 @@ VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize, VhostIOVATree *iova_tree)
     svq->iova_tree = iova_tree;
     svq->ring_id_maps = g_new0(SVQElement *, qsize);
     event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
+    svq->ops = ops;
     return g_steal_pointer(&svq);
 
 err_init_hdev_call:
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index c64a6802b7..5707b1952d 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -17,7 +17,6 @@
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/vhost-backend.h"
 #include "hw/virtio/virtio-net.h"
-#include "hw/virtio/vhost-shadow-virtqueue.h"
 #include "hw/virtio/vhost-vdpa.h"
 #include "exec/address-spaces.h"
 #include "qemu/main-loop.h"
@@ -1219,7 +1218,8 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
     for (unsigned n = 0; n < hdev->nvqs; ++n) {
         DMAMap device_region, driver_region;
         struct vhost_vring_addr addr;
-        VhostShadowVirtqueue *svq = vhost_svq_new(qsize, v->iova_tree);
+        VhostShadowVirtqueue *svq = vhost_svq_new(qsize, v->iova_tree,
+                                                  v->shadow_vq_ops);
         if (unlikely(!svq)) {
             error_setg(errp, "Cannot create svq %u", n);
             return -1;
-- 
2.27.0



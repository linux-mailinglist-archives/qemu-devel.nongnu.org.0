Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8C94EE02C
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 20:09:51 +0200 (CEST)
Received: from localhost ([::1]:44750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZzF0-0003qv-4g
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 14:09:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZzA9-0004ZI-TD
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:04:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZzA8-0007Nd-5Q
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:04:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648749887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UiMHdKoF14M7XsLkchjhVmy7kcgTx/QgQ5iwlpRTNy0=;
 b=Dc5pEInsCXLG3lprETn4PMefjWUp9tRYJol5j6uSL59Fms4TGjumoeVu/5/qFzaH4BXiEV
 9dnUtJGfX2Yuje1Ud+lhiUMaKX8Qln6sfvjfcdhf11XvEIZ7mbgx9/Pd3nLS1zEgrHjzBS
 qTMA1Nw7h1NPJanifgqHNQaqT/mUNF4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-Nc7-qq1zOiKQbgHbSrSfQQ-1; Thu, 31 Mar 2022 14:04:44 -0400
X-MC-Unique: Nc7-qq1zOiKQbgHbSrSfQQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C380B811E78;
 Thu, 31 Mar 2022 18:04:43 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89A9440CF8F2;
 Thu, 31 Mar 2022 18:04:41 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 11/20] vhost: Add custom used buffer callback
Date: Thu, 31 Mar 2022 20:04:01 +0200
Message-Id: <20220331180410.531837-12-eperezma@redhat.com>
In-Reply-To: <20220331180410.531837-1-eperezma@redhat.com>
References: <20220331180410.531837-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Peter Xu <peterx@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The callback allows SVQ users to know the VirtQueue requests and
responses. QEMU can use this to synchronize virtio device model state,
allowing to migrate it with minimum changes to the migration code.

In the case of networking, this will be used to inspect control
virtqueue messages.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h | 16 +++++++++++++++-
 include/hw/virtio/vhost-vdpa.h     |  2 ++
 hw/virtio/vhost-shadow-virtqueue.c |  9 ++++++++-
 hw/virtio/vhost-vdpa.c             |  3 ++-
 4 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 72aadb0aec..4ff6a0cda0 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -19,6 +19,13 @@ typedef struct SVQElement {
     VirtQueueElement elem;
 } SVQElement;
 
+typedef void (*VirtQueueElementCallback)(VirtIODevice *vdev,
+                                         const VirtQueueElement *elem);
+
+typedef struct VhostShadowVirtqueueOps {
+    VirtQueueElementCallback used_elem_handler;
+} VhostShadowVirtqueueOps;
+
 /* Shadow virtqueue to relay notifications */
 typedef struct VhostShadowVirtqueue {
     /* Shadow vring */
@@ -57,6 +64,12 @@ typedef struct VhostShadowVirtqueue {
     /* Next VirtQueue element that guest made available */
     SVQElement *next_guest_avail_elem;
 
+    /* Optional callbacks */
+    const VhostShadowVirtqueueOps *ops;
+
+    /* Optional custom used virtqueue element handler */
+    VirtQueueElementCallback used_elem_cb;
+
     /* Next head to expose to the device */
     uint16_t shadow_avail_idx;
 
@@ -83,7 +96,8 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
                      VirtQueue *vq);
 void vhost_svq_stop(VhostShadowVirtqueue *svq);
 
-VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree);
+VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
+                                    const VhostShadowVirtqueueOps *ops);
 
 void vhost_svq_free(gpointer vq);
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostShadowVirtqueue, vhost_svq_free);
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index a29dbb3f53..f1ba46a860 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -17,6 +17,7 @@
 #include "hw/virtio/vhost-iova-tree.h"
 #include "hw/virtio/virtio.h"
 #include "standard-headers/linux/vhost_types.h"
+#include "hw/virtio/vhost-shadow-virtqueue.h"
 
 typedef struct VhostVDPAHostNotifier {
     MemoryRegion mr;
@@ -35,6 +36,7 @@ typedef struct vhost_vdpa {
     /* IOVA mapping used by the Shadow Virtqueue */
     VhostIOVATree *iova_tree;
     GPtrArray *shadow_vqs;
+    const VhostShadowVirtqueueOps *shadow_vq_ops;
     struct vhost_dev *dev;
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
 } VhostVDPA;
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index cf701576d1..208832a698 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -419,6 +419,10 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
                 return;
             }
             virtqueue_fill(vq, elem, len, i++);
+
+            if (svq->ops && svq->ops->used_elem_handler) {
+                svq->ops->used_elem_handler(svq->vdev, elem);
+            }
         }
 
         virtqueue_flush(vq, i);
@@ -605,12 +609,14 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
  * shadow methods and file descriptors.
  *
  * @iova_tree: Tree to perform descriptors translations
+ * @ops: SVQ operations hooks
  *
  * Returns the new virtqueue or NULL.
  *
  * In case of error, reason is reported through error_report.
  */
-VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree)
+VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
+                                    const VhostShadowVirtqueueOps *ops)
 {
     g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
     int r;
@@ -632,6 +638,7 @@ VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree)
     event_notifier_init_fd(&svq->svq_kick, VHOST_FILE_UNBIND);
     event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
     svq->iova_tree = iova_tree;
+    svq->ops = ops;
     return g_steal_pointer(&svq);
 
 err_init_hdev_call:
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 9eeac8fa8e..ebd17b6185 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -409,7 +409,8 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
 
     shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
     for (unsigned n = 0; n < hdev->nvqs; ++n) {
-        g_autoptr(VhostShadowVirtqueue) svq = vhost_svq_new(v->iova_tree);
+        g_autoptr(VhostShadowVirtqueue) svq = vhost_svq_new(v->iova_tree,
+                                                            v->shadow_vq_ops);
 
         if (unlikely(!svq)) {
             error_setg(errp, "Cannot create svq %u", n);
-- 
2.27.0



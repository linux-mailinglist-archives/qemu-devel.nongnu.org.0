Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC1D4ECD08
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 21:10:49 +0200 (CEST)
Received: from localhost ([::1]:60388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZdiT-0005cv-0v
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 15:10:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZd76-0006mb-DY
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:32:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZd74-0006ZS-Px
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648665130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ziKG7NMrQUDfpN7hHEJ3ldSTZN61IqMf/1SSEIHh+7U=;
 b=U3pYzJWyD7o9/ZoWBChsKHS0HPKx0piUuOZcuJpBa9Mpv0VcQOuSKJcXBa1DiVG9RjGSKl
 tayKlt1sAMXRhwT7/nGv7iFnvpAunrCe7h5GKC5TzZeuh1WKM311ij1lPejTWeiqe3JJFu
 fvbsJaBf6pHI8jKimU6lmFEb6Dv6xE4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-PzzEB0v3P3CXyQ-7e3smBg-1; Wed, 30 Mar 2022 14:32:08 -0400
X-MC-Unique: PzzEB0v3P3CXyQ-7e3smBg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 554F12803587;
 Wed, 30 Mar 2022 18:32:08 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3692F57ECE5;
 Wed, 30 Mar 2022 18:32:05 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 13/19] vdpa: Add map/unmap operation callback to SVQ
Date: Wed, 30 Mar 2022 20:31:10 +0200
Message-Id: <20220330183116.358598-14-eperezma@redhat.com>
In-Reply-To: <20220330183116.358598-1-eperezma@redhat.com>
References: <20220330183116.358598-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Peter Xu <peterx@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h | 21 +++++++++++++++++++--
 hw/virtio/vhost-shadow-virtqueue.c |  8 +++++++-
 hw/virtio/vhost-vdpa.c             | 20 +++++++++++++++++++-
 3 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 4ff6a0cda0..6e61d9bfef 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -26,6 +26,15 @@ typedef struct VhostShadowVirtqueueOps {
     VirtQueueElementCallback used_elem_handler;
 } VhostShadowVirtqueueOps;
 
+typedef int (*vhost_svq_map_op)(hwaddr iova, hwaddr size, void *vaddr,
+                                bool readonly, void *opaque);
+typedef int (*vhost_svq_unmap_op)(hwaddr iova, hwaddr size, void *opaque);
+
+typedef struct VhostShadowVirtqueueMapOps {
+    vhost_svq_map_op map;
+    vhost_svq_unmap_op unmap;
+} VhostShadowVirtqueueMapOps;
+
 /* Shadow virtqueue to relay notifications */
 typedef struct VhostShadowVirtqueue {
     /* Shadow vring */
@@ -67,6 +76,12 @@ typedef struct VhostShadowVirtqueue {
     /* Optional callbacks */
     const VhostShadowVirtqueueOps *ops;
 
+    /* Device memory mapping callbacks */
+    const VhostShadowVirtqueueMapOps *map_ops;
+
+    /* Device memory mapping callbacks opaque */
+    void *map_ops_opaque;
+
     /* Optional custom used virtqueue element handler */
     VirtQueueElementCallback used_elem_cb;
 
@@ -96,8 +111,10 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
                      VirtQueue *vq);
 void vhost_svq_stop(VhostShadowVirtqueue *svq);
 
-VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
-                                    const VhostShadowVirtqueueOps *ops);
+VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_map,
+                                    const VhostShadowVirtqueueOps *ops,
+                                    const VhostShadowVirtqueueMapOps *map_ops,
+                                    void *map_ops_opaque);
 
 void vhost_svq_free(gpointer vq);
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostShadowVirtqueue, vhost_svq_free);
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 112d0daf20..714c820698 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -597,13 +597,17 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
  *
  * @iova_tree: Tree to perform descriptors translations
  * @ops: SVQ operations hooks
+ * @map_ops: SVQ mapping operation hooks
+ * @map_ops_opaque: Opaque data to pass to mapping operations
  *
  * Returns the new virtqueue or NULL.
  *
  * In case of error, reason is reported through error_report.
  */
 VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
-                                    const VhostShadowVirtqueueOps *ops)
+                                    const VhostShadowVirtqueueOps *ops,
+                                    const VhostShadowVirtqueueMapOps *map_ops,
+                                    void *map_ops_opaque)
 {
     g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
     int r;
@@ -626,6 +630,8 @@ VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
     event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
     svq->iova_tree = iova_tree;
     svq->ops = ops;
+    svq->map_ops = map_ops;
+    svq->map_ops_opaque = map_ops_opaque;
     return g_steal_pointer(&svq);
 
 err_init_hdev_call:
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index ebd17b6185..600d006d6e 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -383,6 +383,22 @@ static int vhost_vdpa_get_dev_features(struct vhost_dev *dev,
     return ret;
 }
 
+static int vhost_vdpa_svq_map(hwaddr iova, hwaddr size, void *vaddr,
+                              bool readonly, void *opaque)
+{
+    return vhost_vdpa_dma_map(opaque, iova, size, vaddr, readonly);
+}
+
+static int vhost_vdpa_svq_unmap(hwaddr iova, hwaddr size, void *opaque)
+{
+    return vhost_vdpa_dma_unmap(opaque, iova, size);
+}
+
+static const VhostShadowVirtqueueMapOps vhost_vdpa_svq_map_ops = {
+    .map = vhost_vdpa_svq_map,
+    .unmap = vhost_vdpa_svq_unmap,
+};
+
 static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
                                Error **errp)
 {
@@ -410,7 +426,9 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
     shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
     for (unsigned n = 0; n < hdev->nvqs; ++n) {
         g_autoptr(VhostShadowVirtqueue) svq = vhost_svq_new(v->iova_tree,
-                                                            v->shadow_vq_ops);
+                                                       v->shadow_vq_ops,
+                                                       &vhost_vdpa_svq_map_ops,
+                                                       v);
 
         if (unlikely(!svq)) {
             error_setg(errp, "Cannot create svq %u", n);
-- 
2.27.0



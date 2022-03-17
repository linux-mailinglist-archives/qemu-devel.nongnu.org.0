Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19B34DCD9D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 19:33:02 +0100 (CET)
Received: from localhost ([::1]:59998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUuvl-0000vO-UJ
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 14:33:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nUuns-0000z9-Fc
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:24:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nUuno-0006B4-0P
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647541487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ziKG7NMrQUDfpN7hHEJ3ldSTZN61IqMf/1SSEIHh+7U=;
 b=BmbydTYr15i+z5rhmgia7UR9Xw/DkRWP/d26Ho+vdNQIrpIpRAr3CJwu3/5I/vNlIjNz7/
 c2KNyowzQU5bPVHOPGkgJ/QmWZFtuOLiNYdkj4opuLqEMJ/KtVlxfQRehMGpfA122gPgxI
 JVWiAJdmLA6cv8dgqCv4rVBu2kT5E9g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-0B_w4FFaNwKqTrCv0Y3aIg-1; Thu, 17 Mar 2022 14:24:44 -0400
X-MC-Unique: 0B_w4FFaNwKqTrCv0Y3aIg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3FDA101B44C;
 Thu, 17 Mar 2022 18:24:43 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 401A31400E73;
 Thu, 17 Mar 2022 18:24:41 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 12/18] vdpa: Add map/unmap operation callback to SVQ
Date: Thu, 17 Mar 2022 19:23:53 +0100
Message-Id: <20220317182400.651508-13-eperezma@redhat.com>
In-Reply-To: <20220317182400.651508-1-eperezma@redhat.com>
References: <20220317182400.651508-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Liuxiangdong <liuxiangdong5@huawei.com>
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



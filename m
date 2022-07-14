Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C2957536C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 18:51:38 +0200 (CEST)
Received: from localhost ([::1]:44128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC23t-0003BW-1o
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 12:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oC1lf-0007un-6t
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 12:32:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oC1lb-0003RJ-Bm
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 12:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657816362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4vQdsUhu3kxILNSy0MroUqOwuVJYO6Gu0XFxnihaQ38=;
 b=cXAt3UC9zeHShPnVfqycMO25qp0UsBy0gHuoaOXJLHYOa8fZ+ZpCECCtdruflC7N/kzyt/
 IaSmOf8h1EzKaY2RQxynh4LrVO4pfIRLSQ8K4aDVSK2i8jpWPFKvTWidCkJCFAlk8MGuOC
 5XjsYGp8Ea5+EdNXJfhyyCP+gH1LGRc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-6u9aQOy6O4y5EwsOEV9Hdg-1; Thu, 14 Jul 2022 12:32:37 -0400
X-MC-Unique: 6u9aQOy6O4y5EwsOEV9Hdg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B54D3C01DE2;
 Thu, 14 Jul 2022 16:32:36 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6FB31121315;
 Thu, 14 Jul 2022 16:32:33 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Jason Wang <jasowang@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH v2 13/19] vhost: Add svq avail_handler callback
Date: Thu, 14 Jul 2022 18:31:44 +0200
Message-Id: <20220714163150.2536327-14-eperezma@redhat.com>
In-Reply-To: <20220714163150.2536327-1-eperezma@redhat.com>
References: <20220714163150.2536327-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows external handlers to be aware of new buffers that the guest
places in the virtqueue.

When this callback is defined the ownership of the guest's virtqueue
element is transferred to the callback. This means that if the user
wants to forward the descriptor it needs to manually inject it. The
callback is also free to process the command by itself and use the
element with svq_push.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h | 31 +++++++++++++++++++++++++++++-
 hw/virtio/vhost-shadow-virtqueue.c | 14 ++++++++++++--
 hw/virtio/vhost-vdpa.c             |  3 ++-
 3 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index b5c6e3b3b4..965ca88706 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -25,6 +25,27 @@ typedef struct SVQElement {
     unsigned int ndescs;
 } SVQElement;
 
+typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
+
+/**
+ * Callback to handle an avail buffer.
+ *
+ * @svq:  Shadow virtqueue
+ * @elem:  Element placed in the queue by the guest
+ * @vq_callback_opaque:  Opaque
+ *
+ * Returns 0 if the vq is running as expected.
+ *
+ * Note that ownership of elem is transferred to the callback.
+ */
+typedef int (*VirtQueueAvailCallback)(VhostShadowVirtqueue *svq,
+                                      SVQElement *elem,
+                                      void *vq_callback_opaque);
+
+typedef struct VhostShadowVirtqueueOps {
+    VirtQueueAvailCallback avail_handler;
+} VhostShadowVirtqueueOps;
+
 /* Shadow virtqueue to relay notifications */
 typedef struct VhostShadowVirtqueue {
     /* Shadow vring */
@@ -69,6 +90,12 @@ typedef struct VhostShadowVirtqueue {
      */
     uint16_t *desc_next;
 
+    /* Caller callbacks */
+    const VhostShadowVirtqueueOps *ops;
+
+    /* Caller callbacks opaque */
+    void *ops_opaque;
+
     /* Next head to expose to the device */
     uint16_t shadow_avail_idx;
 
@@ -102,7 +129,9 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
                      VirtQueue *vq);
 void vhost_svq_stop(VhostShadowVirtqueue *svq);
 
-VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree);
+VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
+                                    const VhostShadowVirtqueueOps *ops,
+                                    void *ops_opaque);
 
 void vhost_svq_free(gpointer vq);
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostShadowVirtqueue, vhost_svq_free);
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 31a267f721..85b2d49326 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -306,7 +306,11 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
                 break;
             }
 
-            r = vhost_svq_add_element(svq, elem);
+            if (svq->ops) {
+                r = svq->ops->avail_handler(svq, elem, svq->ops_opaque);
+            } else {
+                r = vhost_svq_add_element(svq, elem);
+            }
             if (unlikely(r != 0)) {
                 if (r == -ENOSPC) {
                     /*
@@ -681,12 +685,16 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
  * shadow methods and file descriptors.
  *
  * @iova_tree: Tree to perform descriptors translations
+ * @ops: SVQ owner callbacks
+ * @ops_opaque: ops opaque pointer
  *
  * Returns the new virtqueue or NULL.
  *
  * In case of error, reason is reported through error_report.
  */
-VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree)
+VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
+                                    const VhostShadowVirtqueueOps *ops,
+                                    void *ops_opaque)
 {
     g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
     int r;
@@ -708,6 +716,8 @@ VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree)
     event_notifier_init_fd(&svq->svq_kick, VHOST_FILE_UNBIND);
     event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
     svq->iova_tree = iova_tree;
+    svq->ops = ops;
+    svq->ops_opaque = ops_opaque;
     return g_steal_pointer(&svq);
 
 err_init_hdev_call:
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 66f054a12c..0b13e98471 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -418,8 +418,9 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
 
     shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
     for (unsigned n = 0; n < hdev->nvqs; ++n) {
-        g_autoptr(VhostShadowVirtqueue) svq = vhost_svq_new(v->iova_tree);
+        g_autoptr(VhostShadowVirtqueue) svq;
 
+        svq = vhost_svq_new(v->iova_tree, NULL, NULL);
         if (unlikely(!svq)) {
             error_setg(errp, "Cannot create svq %u", n);
             return -1;
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CA456B81A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 13:12:12 +0200 (CEST)
Received: from localhost ([::1]:51180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9lu7-0005dP-LF
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 07:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZz-0000sa-3F
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:51:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZu-0008Bb-Gj
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657277477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/arxl0NhicUjNzdDaV6yuaWp53bWftFUsUw26SLP1/c=;
 b=Y2BJc6m96lln5dNnUYpfVxlfjTh46M+5Xz9q6FUQufS50z2Dv+pnWZtTVLgDmEiZIbG8j2
 3nBwmBBIhi5BZl1rO3Fwy6XQaDUYwpIruFseFiVHkh3fF1Z+FJEFqBqXeNr+83SDwZiTaf
 oE7S4DO9Y8o+hJFHIRzmo6/ozLIrPyo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-6xhctQkTOB6SWqS9S5IryQ-1; Fri, 08 Jul 2022 06:51:01 -0400
X-MC-Unique: 6xhctQkTOB6SWqS9S5IryQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 377662999B34;
 Fri,  8 Jul 2022 10:51:01 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7196B1121314;
 Fri,  8 Jul 2022 10:50:58 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 14/22] vhost: Add custom used buffer callback
Date: Fri,  8 Jul 2022 12:50:05 +0200
Message-Id: <20220708105013.1899854-15-eperezma@redhat.com>
In-Reply-To: <20220708105013.1899854-1-eperezma@redhat.com>
References: <20220708105013.1899854-1-eperezma@redhat.com>
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

The callback allows SVQ users to know the VirtQueue requests and
responses. QEMU can use this to synchronize virtio device model state,
allowing to migrate it with minimum changes to the migration code.

If callbacks are specified at svq creation, the buffers need to be
injected to the device using vhost_svq_inject. An opaque data must be
given with it, and its returned to the callback at used_handler call.

In the case of networking, this will be used to inspect control
virtqueue messages status from the device.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h | 15 ++++++++++++++-
 hw/virtio/vhost-shadow-virtqueue.c | 22 ++++++++++++++++------
 hw/virtio/vhost-vdpa.c             |  3 ++-
 3 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 57ff97ce4f..96ce7aa62e 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -23,6 +23,15 @@ typedef struct SVQElement {
     uint32_t last_chain_id;
 } SVQElement;
 
+typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
+typedef void (*VirtQueueUsedCallback)(VhostShadowVirtqueue *svq,
+                                      void *used_elem_opaque,
+                                      uint32_t written);
+
+typedef struct VhostShadowVirtqueueOps {
+    VirtQueueUsedCallback used_handler;
+} VhostShadowVirtqueueOps;
+
 /* Shadow virtqueue to relay notifications */
 typedef struct VhostShadowVirtqueue {
     /* Shadow vring */
@@ -67,6 +76,9 @@ typedef struct VhostShadowVirtqueue {
      */
     uint16_t *desc_next;
 
+    /* Caller callbacks */
+    const VhostShadowVirtqueueOps *ops;
+
     /* Next head to expose to the device */
     uint16_t shadow_avail_idx;
 
@@ -98,7 +110,8 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
                      VirtQueue *vq);
 void vhost_svq_stop(VhostShadowVirtqueue *svq);
 
-VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree);
+VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
+                                    const VhostShadowVirtqueueOps *ops);
 
 void vhost_svq_free(gpointer vq);
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostShadowVirtqueue, vhost_svq_free);
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index f4affa52ee..40183f8afd 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -306,6 +306,7 @@ int vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov,
      * assertions.
      */
     assert(out_num || in_num);
+    assert(svq->ops);
 
     if (unlikely(num > vhost_svq_available_slots(svq))) {
         error_report("Injecting in a full queue");
@@ -508,7 +509,6 @@ static size_t vhost_svq_flush(VhostShadowVirtqueue *svq,
         while (true) {
             uint32_t len;
             SVQElement svq_elem;
-            g_autofree VirtQueueElement *elem = NULL;
 
             if (unlikely(i >= svq->vring.num)) {
                 qemu_log_mask(LOG_GUEST_ERROR,
@@ -523,13 +523,20 @@ static size_t vhost_svq_flush(VhostShadowVirtqueue *svq,
                 break;
             }
 
-            elem = g_steal_pointer(&svq_elem.opaque);
-            virtqueue_fill(vq, elem, len, i++);
+            if (svq->ops) {
+                svq->ops->used_handler(svq, svq_elem.opaque, len);
+            } else {
+                g_autofree VirtQueueElement *elem = NULL;
+                elem = g_steal_pointer(&svq_elem.opaque);
+                virtqueue_fill(vq, elem, len, i++);
+            }
             ret++;
         }
 
-        virtqueue_flush(vq, i);
-        event_notifier_set(&svq->svq_call);
+        if (i > 0) {
+            virtqueue_flush(vq, i);
+            event_notifier_set(&svq->svq_call);
+        }
 
         if (check_for_avail_queue && svq->next_guest_avail_elem) {
             /*
@@ -758,12 +765,14 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
  * shadow methods and file descriptors.
  *
  * @iova_tree: Tree to perform descriptors translations
+ * @ops: SVQ owner callbacks
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
@@ -785,6 +794,7 @@ VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree)
     event_notifier_init_fd(&svq->svq_kick, VHOST_FILE_UNBIND);
     event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
     svq->iova_tree = iova_tree;
+    svq->ops = ops;
     return g_steal_pointer(&svq);
 
 err_init_hdev_call:
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index fccfc832ea..25f7146fe4 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -418,8 +418,9 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
 
     shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
     for (unsigned n = 0; n < hdev->nvqs; ++n) {
-        g_autoptr(VhostShadowVirtqueue) svq = vhost_svq_new(v->iova_tree);
+        g_autoptr(VhostShadowVirtqueue) svq;
 
+        svq = vhost_svq_new(v->iova_tree, NULL);
         if (unlikely(!svq)) {
             error_setg(errp, "Cannot create svq %u", n);
             return -1;
-- 
2.31.1



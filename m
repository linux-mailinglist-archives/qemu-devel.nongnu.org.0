Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D69569232
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 20:53:24 +0200 (CEST)
Received: from localhost ([::1]:39050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9A9L-0004Je-GZ
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 14:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xO-0005Q8-LY
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xB-0000qU-CU
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657132847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SqUrno67AFLGn35GLz5YA8v1mqjELXgVV+L32CRV+uY=;
 b=TwtJr/dRyT00SiExbmedYcwiWVKK2Y2NpgCNIcC2jY1mXsI8IAHYt0auK0LJ2Pq7ekds95
 ydefzEDBRIr/NbV7nEbUsVxjSej81MU6ec4ItQFayOYIQ7COy1t/zMU0SM0IRFknHpYSLD
 3DTPeK/sdnBhTxo9yfIiReUPk7kL/uY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-68l15BzuMpCHJNkc8uLr_Q-1; Wed, 06 Jul 2022 14:40:40 -0400
X-MC-Unique: 68l15BzuMpCHJNkc8uLr_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA874833961;
 Wed,  6 Jul 2022 18:40:39 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1221C1415116;
 Wed,  6 Jul 2022 18:40:36 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [RFC PATCH v9 09/23] vhost: Add SVQElement
Date: Wed,  6 Jul 2022 20:39:54 +0200
Message-Id: <20220706184008.1649478-10-eperezma@redhat.com>
In-Reply-To: <20220706184008.1649478-1-eperezma@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow SVQ to add metadata to the different queue elements. To
simplify changes, only store actual element at this patch.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  8 ++++--
 hw/virtio/vhost-shadow-virtqueue.c | 41 ++++++++++++++++++++----------
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 0fbdd69153..e434dc63b0 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -15,6 +15,10 @@
 #include "standard-headers/linux/vhost_types.h"
 #include "hw/virtio/vhost-iova-tree.h"
 
+typedef struct SVQElement {
+    VirtQueueElement *elem;
+} SVQElement;
+
 typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 typedef int (*ShadowVirtQueueStart)(VhostShadowVirtqueue *svq,
                                     void *opaque);
@@ -55,8 +59,8 @@ typedef struct VhostShadowVirtqueue {
     /* IOVA mapping */
     VhostIOVATree *iova_tree;
 
-    /* Map for use the guest's descriptors */
-    VirtQueueElement **ring_id_maps;
+    /* Each element context */
+    SVQElement *ring_id_maps;
 
     /* Next VirtQueue element that guest made available */
     VirtQueueElement *next_guest_avail_elem;
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 46d3c1d74f..913bca8769 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -237,7 +237,7 @@ static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
         return false;
     }
 
-    svq->ring_id_maps[qemu_head] = elem;
+    svq->ring_id_maps[qemu_head].elem = elem;
     return true;
 }
 
@@ -385,15 +385,25 @@ static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
     return i;
 }
 
-static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
-                                           uint32_t *len)
+static bool vhost_svq_is_empty_elem(SVQElement elem)
+{
+    return elem.elem == NULL;
+}
+
+static SVQElement vhost_svq_empty_elem(void)
+{
+    return (SVQElement){};
+}
+
+static SVQElement vhost_svq_get_buf(VhostShadowVirtqueue *svq, uint32_t *len)
 {
     const vring_used_t *used = svq->vring.used;
     vring_used_elem_t used_elem;
+    SVQElement svq_elem = vhost_svq_empty_elem();
     uint16_t last_used, last_used_chain, num;
 
     if (!vhost_svq_more_used(svq)) {
-        return NULL;
+        return svq_elem;
     }
 
     /* Only get used array entries after they have been exposed by dev */
@@ -406,24 +416,25 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
     if (unlikely(used_elem.id >= svq->vring.num)) {
         qemu_log_mask(LOG_GUEST_ERROR, "Device %s says index %u is used",
                       svq->vdev->name, used_elem.id);
-        return NULL;
+        return svq_elem;
     }
 
-    if (unlikely(!svq->ring_id_maps[used_elem.id])) {
+    svq_elem = svq->ring_id_maps[used_elem.id];
+    svq->ring_id_maps[used_elem.id] = vhost_svq_empty_elem();
+    if (unlikely(vhost_svq_is_empty_elem(svq_elem))) {
         qemu_log_mask(LOG_GUEST_ERROR,
             "Device %s says index %u is used, but it was not available",
             svq->vdev->name, used_elem.id);
-        return NULL;
+        return svq_elem;
     }
 
-    num = svq->ring_id_maps[used_elem.id]->in_num +
-          svq->ring_id_maps[used_elem.id]->out_num;
+    num = svq_elem.elem->in_num + svq_elem.elem->out_num;
     last_used_chain = vhost_svq_last_desc_of_chain(svq, num, used_elem.id);
     svq->desc_next[last_used_chain] = svq->free_head;
     svq->free_head = used_elem.id;
 
     *len = used_elem.len;
-    return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
+    return svq_elem;
 }
 
 /**
@@ -454,6 +465,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
         vhost_svq_disable_notification(svq);
         while (true) {
             uint32_t len;
+            SVQElement svq_elem;
             g_autofree VirtQueueElement *elem = NULL;
 
             if (unlikely(i >= svq->vring.num)) {
@@ -464,11 +476,12 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
                 return;
             }
 
-            elem = vhost_svq_get_buf(svq, &len);
-            if (!elem) {
+            svq_elem = vhost_svq_get_buf(svq, &len);
+            if (vhost_svq_is_empty_elem(svq_elem)) {
                 break;
             }
 
+            elem = g_steal_pointer(&svq_elem.elem);
             virtqueue_fill(vq, elem, len, i++);
         }
 
@@ -611,7 +624,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
     memset(svq->vring.desc, 0, driver_size);
     svq->vring.used = qemu_memalign(qemu_real_host_page_size(), device_size);
     memset(svq->vring.used, 0, device_size);
-    svq->ring_id_maps = g_new0(VirtQueueElement *, svq->vring.num);
+    svq->ring_id_maps = g_new0(SVQElement, svq->vring.num);
     svq->desc_next = g_new0(uint16_t, svq->vring.num);
     for (unsigned i = 0; i < svq->vring.num - 1; i++) {
         svq->desc_next[i] = cpu_to_le16(i + 1);
@@ -636,7 +649,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
 
     for (unsigned i = 0; i < svq->vring.num; ++i) {
         g_autofree VirtQueueElement *elem = NULL;
-        elem = g_steal_pointer(&svq->ring_id_maps[i]);
+        elem = g_steal_pointer(&svq->ring_id_maps[i].elem);
         if (elem) {
             virtqueue_detach_element(svq->vq, elem, 0);
         }
-- 
2.31.1



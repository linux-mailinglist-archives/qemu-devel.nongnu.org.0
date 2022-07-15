Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FFC576620
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 19:35:09 +0200 (CEST)
Received: from localhost ([::1]:55746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCPDY-0000ez-DZ
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 13:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCOyE-0005O7-EU
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:19:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCOyB-0005tG-Lw
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657905555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tq5ZOp4oFPUNGw/PfAIhXLL0S4qhqlNmbps1kNQIPjM=;
 b=Ch0LnfcUAmLa3O5E27tj+wnWQcYcoI1nJiEi/p3suaARZB3eJBxIx07Os+1+70NVig4cHR
 +0sw1YVxOlcaWWA0v1t0+Ek/UVaRRrZKbToi5+5jzmQ9lqpVBp3AbDcUKq6XlBK6y371E/
 E+bEP+VNb0r3hzid9ZNdXc331MaGHwM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418--UcohZjENZqKwt-evFvN-g-1; Fri, 15 Jul 2022 13:19:05 -0400
X-MC-Unique: -UcohZjENZqKwt-evFvN-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69869101A589;
 Fri, 15 Jul 2022 17:19:05 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77F0140E8B06;
 Fri, 15 Jul 2022 17:19:02 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eli Cohen <eli@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Parav Pandit <parav@mellanox.com>,
 Markus Armbruster <armbru@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eric Blake <eblake@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 08/19] vhost: Add SVQDescState
Date: Fri, 15 Jul 2022 19:18:23 +0200
Message-Id: <20220715171834.2666455-9-eperezma@redhat.com>
In-Reply-To: <20220715171834.2666455-1-eperezma@redhat.com>
References: <20220715171834.2666455-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This will allow SVQ to add context to the different queue elements.

This patch only store the actual element, no functional change intended.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  8 ++++++--
 hw/virtio/vhost-shadow-virtqueue.c | 16 ++++++++--------
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index c132c994e9..d646c35054 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -15,6 +15,10 @@
 #include "standard-headers/linux/vhost_types.h"
 #include "hw/virtio/vhost-iova-tree.h"
 
+typedef struct SVQDescState {
+    VirtQueueElement *elem;
+} SVQDescState;
+
 /* Shadow virtqueue to relay notifications */
 typedef struct VhostShadowVirtqueue {
     /* Shadow vring */
@@ -47,8 +51,8 @@ typedef struct VhostShadowVirtqueue {
     /* IOVA mapping */
     VhostIOVATree *iova_tree;
 
-    /* Map for use the guest's descriptors */
-    VirtQueueElement **ring_id_maps;
+    /* SVQ vring descriptors state */
+    SVQDescState *desc_state;
 
     /* Next VirtQueue element that guest made available */
     VirtQueueElement *next_guest_avail_elem;
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index b005a457c6..d12f5afffb 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -256,7 +256,7 @@ static int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
         return -EINVAL;
     }
 
-    svq->ring_id_maps[qemu_head] = elem;
+    svq->desc_state[qemu_head].elem = elem;
     vhost_svq_kick(svq);
     return 0;
 }
@@ -410,21 +410,21 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
         return NULL;
     }
 
-    if (unlikely(!svq->ring_id_maps[used_elem.id])) {
+    if (unlikely(!svq->desc_state[used_elem.id].elem)) {
         qemu_log_mask(LOG_GUEST_ERROR,
             "Device %s says index %u is used, but it was not available",
             svq->vdev->name, used_elem.id);
         return NULL;
     }
 
-    num = svq->ring_id_maps[used_elem.id]->in_num +
-          svq->ring_id_maps[used_elem.id]->out_num;
+    num = svq->desc_state[used_elem.id].elem->in_num +
+          svq->desc_state[used_elem.id].elem->out_num;
     last_used_chain = vhost_svq_last_desc_of_chain(svq, num, used_elem.id);
     svq->desc_next[last_used_chain] = svq->free_head;
     svq->free_head = used_elem.id;
 
     *len = used_elem.len;
-    return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
+    return g_steal_pointer(&svq->desc_state[used_elem.id].elem);
 }
 
 static void vhost_svq_flush(VhostShadowVirtqueue *svq,
@@ -594,7 +594,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
     memset(svq->vring.desc, 0, driver_size);
     svq->vring.used = qemu_memalign(qemu_real_host_page_size(), device_size);
     memset(svq->vring.used, 0, device_size);
-    svq->ring_id_maps = g_new0(VirtQueueElement *, svq->vring.num);
+    svq->desc_state = g_new0(SVQDescState, svq->vring.num);
     svq->desc_next = g_new0(uint16_t, svq->vring.num);
     for (unsigned i = 0; i < svq->vring.num - 1; i++) {
         svq->desc_next[i] = cpu_to_le16(i + 1);
@@ -619,7 +619,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
 
     for (unsigned i = 0; i < svq->vring.num; ++i) {
         g_autofree VirtQueueElement *elem = NULL;
-        elem = g_steal_pointer(&svq->ring_id_maps[i]);
+        elem = g_steal_pointer(&svq->desc_state[i].elem);
         if (elem) {
             virtqueue_detach_element(svq->vq, elem, 0);
         }
@@ -631,7 +631,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
     }
     svq->vq = NULL;
     g_free(svq->desc_next);
-    g_free(svq->ring_id_maps);
+    g_free(svq->desc_state);
     qemu_vfree(svq->vring.desc);
     qemu_vfree(svq->vring.used);
 }
-- 
2.31.1



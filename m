Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F50857B377
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 11:07:16 +0200 (CEST)
Received: from localhost ([::1]:45100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE5fn-0005Sw-0S
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 05:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5cT-0008OY-PN
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:03:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5cR-0001RA-VU
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:03:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658307827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nG1vk3JRfAN8G/naqtL7sxOwdR+NkK9CJ81dnKNKHlA=;
 b=IEdJthCYNbai3eRl4CPMsaFPyuuuqPY9E4KD0nbH2oNO+3VNYAGuVUkEwYi+xs9F5VhxFn
 fht9JEcdhd/6fxua5NRNA7JTPKBePij4D7GsR7aQyu15ffTLF0zGMq2LAdGdxf47uNm+q2
 Mx7VZ03YCkMynddVGlHxII2+bzm9CV0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-r2BWci6yP6G3ylh70Cg3jA-1; Wed, 20 Jul 2022 05:03:46 -0400
X-MC-Unique: r2BWci6yP6G3ylh70Cg3jA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01F3D801585;
 Wed, 20 Jul 2022 09:03:46 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-110.pek2.redhat.com
 [10.72.13.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78DB5492C3B;
 Wed, 20 Jul 2022 09:03:43 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 09/25] vhost: Add SVQDescState
Date: Wed, 20 Jul 2022 17:02:57 +0800
Message-Id: <20220720090313.55169-10-jasowang@redhat.com>
In-Reply-To: <20220720090313.55169-1-jasowang@redhat.com>
References: <20220720090313.55169-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

This will allow SVQ to add context to the different queue elements.

This patch only store the actual element, no functional change intended.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 16 ++++++++--------
 hw/virtio/vhost-shadow-virtqueue.h |  8 ++++++--
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index e3afa2b..e4c09e2 100644
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
@@ -411,21 +411,21 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
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
@@ -595,7 +595,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
     memset(svq->vring.desc, 0, driver_size);
     svq->vring.used = qemu_memalign(qemu_real_host_page_size(), device_size);
     memset(svq->vring.used, 0, device_size);
-    svq->ring_id_maps = g_new0(VirtQueueElement *, svq->vring.num);
+    svq->desc_state = g_new0(SVQDescState, svq->vring.num);
     svq->desc_next = g_new0(uint16_t, svq->vring.num);
     for (unsigned i = 0; i < svq->vring.num - 1; i++) {
         svq->desc_next[i] = cpu_to_le16(i + 1);
@@ -620,7 +620,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
 
     for (unsigned i = 0; i < svq->vring.num; ++i) {
         g_autofree VirtQueueElement *elem = NULL;
-        elem = g_steal_pointer(&svq->ring_id_maps[i]);
+        elem = g_steal_pointer(&svq->desc_state[i].elem);
         if (elem) {
             virtqueue_detach_element(svq->vq, elem, 0);
         }
@@ -632,7 +632,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
     }
     svq->vq = NULL;
     g_free(svq->desc_next);
-    g_free(svq->ring_id_maps);
+    g_free(svq->desc_state);
     qemu_vfree(svq->vring.desc);
     qemu_vfree(svq->vring.used);
 }
diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index c132c99..d646c35 100644
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
-- 
2.7.4



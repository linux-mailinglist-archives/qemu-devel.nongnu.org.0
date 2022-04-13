Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9994FFB62
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 18:34:36 +0200 (CEST)
Received: from localhost ([::1]:43248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nefwx-0002CN-Lz
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 12:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nefun-0007pH-Ix
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 12:32:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1neful-0003A3-VC
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 12:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649867539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SYUbUdSmRvA07QsVFvK7KVzt1tQsUP6/VUOByiW71lI=;
 b=d/p41QBEgpDJ6+OfpbeB/F1kQ84qLzF7hEqIhSjt0n5BWGAyJHn8CyVbi5viQcrC5u3p1q
 3EdMRtBfjm4iVyEFvbJNopoCnbOmFD3q0Vu9vRq2QEpsI2x2KgtxnnI4hnYesm+k7lDKw/
 raIzC32Y7myrhVpqJFxTd9IX8jClsT8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-eCWUSU4NNhupquIen2WyyA-1; Wed, 13 Apr 2022 12:32:14 -0400
X-MC-Unique: eCWUSU4NNhupquIen2WyyA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 865993822200;
 Wed, 13 Apr 2022 16:32:13 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C5A5145B97E;
 Wed, 13 Apr 2022 16:32:11 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v7 01/25] vhost: Track descriptor chain in private at SVQ
Date: Wed, 13 Apr 2022 18:31:42 +0200
Message-Id: <20220413163206.1958254-2-eperezma@redhat.com>
In-Reply-To: <20220413163206.1958254-1-eperezma@redhat.com>
References: <20220413163206.1958254-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only the first one of them were properly enqueued back.

While we're at it, harden SVQ: The device could have access to modify
them, and it definitely have access when we implement packed vq. Harden
SVQ maintaining a private copy of the descriptor chain. Other fields
like buffer addresses are already maintained sepparatedly.

Fixes: 100890f7ca ("vhost: Shadow virtqueue buffers forwarding")

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  6 ++++++
 hw/virtio/vhost-shadow-virtqueue.c | 27 +++++++++++++++++++++------
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index e5e24c536d..c132c994e9 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -53,6 +53,12 @@ typedef struct VhostShadowVirtqueue {
     /* Next VirtQueue element that guest made available */
     VirtQueueElement *next_guest_avail_elem;
 
+    /*
+     * Backup next field for each descriptor so we can recover securely, not
+     * needing to trust the device access.
+     */
+    uint16_t *desc_next;
+
     /* Next head to expose to the device */
     uint16_t shadow_avail_idx;
 
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index b232803d1b..a2531d5874 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -138,6 +138,7 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
     for (n = 0; n < num; n++) {
         if (more_descs || (n + 1 < num)) {
             descs[i].flags = flags | cpu_to_le16(VRING_DESC_F_NEXT);
+            descs[i].next = cpu_to_le16(svq->desc_next[i]);
         } else {
             descs[i].flags = flags;
         }
@@ -145,10 +146,10 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
         descs[i].len = cpu_to_le32(iovec[n].iov_len);
 
         last = i;
-        i = cpu_to_le16(descs[i].next);
+        i = cpu_to_le16(svq->desc_next[i]);
     }
 
-    svq->free_head = le16_to_cpu(descs[last].next);
+    svq->free_head = le16_to_cpu(svq->desc_next[last]);
 }
 
 static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
@@ -333,13 +334,22 @@ static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
     svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
 }
 
+static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
+                                             uint16_t num, uint16_t i)
+{
+    for (uint16_t j = 0; j < num; ++j) {
+        i = le16_to_cpu(svq->desc_next[i]);
+    }
+
+    return i;
+}
+
 static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
                                            uint32_t *len)
 {
-    vring_desc_t *descs = svq->vring.desc;
     const vring_used_t *used = svq->vring.used;
     vring_used_elem_t used_elem;
-    uint16_t last_used;
+    uint16_t last_used, last_used_chain, num;
 
     if (!vhost_svq_more_used(svq)) {
         return NULL;
@@ -365,7 +375,10 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
         return NULL;
     }
 
-    descs[used_elem.id].next = svq->free_head;
+    num = svq->ring_id_maps[used_elem.id]->in_num +
+          svq->ring_id_maps[used_elem.id]->out_num;
+    last_used_chain = vhost_svq_last_desc_of_chain(svq, num, used_elem.id);
+    svq->desc_next[last_used_chain] = svq->free_head;
     svq->free_head = used_elem.id;
 
     *len = used_elem.len;
@@ -540,8 +553,9 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
     svq->vring.used = qemu_memalign(qemu_real_host_page_size, device_size);
     memset(svq->vring.used, 0, device_size);
     svq->ring_id_maps = g_new0(VirtQueueElement *, svq->vring.num);
+    svq->desc_next = g_new0(uint16_t, svq->vring.num);
     for (unsigned i = 0; i < svq->vring.num - 1; i++) {
-        svq->vring.desc[i].next = cpu_to_le16(i + 1);
+        svq->desc_next[i] = cpu_to_le16(i + 1);
     }
 }
 
@@ -574,6 +588,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
         virtqueue_detach_element(svq->vq, next_avail_elem, 0);
     }
     svq->vq = NULL;
+    g_free(svq->desc_next);
     g_free(svq->ring_id_maps);
     qemu_vfree(svq->vring.desc);
     qemu_vfree(svq->vring.used);
-- 
2.27.0



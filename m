Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A45E569241
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 20:57:21 +0200 (CEST)
Received: from localhost ([::1]:47578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9ADA-00026i-6R
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 14:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xQ-0005RP-OO
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xM-0000rv-Bh
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657132858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vHrD422Fx7h9ptVNcUIdalNxoBuTWY+5kMR5xVsqK7g=;
 b=cBjxlwb8z0KJ6KN3Qb4WmJGJ9uHqNBxWuxuppFz4iZGZCpMKzIdntqFcundjBwA7vk7Svr
 02lehSTCY7SllKtxELazDYqTXvAY5XXOT+vgoXEOUfyPl3S7YKEkXqBZgHxQrJDyOUe/eJ
 8DjXOCkBMC8Id5ZkXrqXtjl9sjrezJY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-TTQgDZ7uMVqXxDccFGLFHw-1; Wed, 06 Jul 2022 14:40:48 -0400
X-MC-Unique: TTQgDZ7uMVqXxDccFGLFHw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42DB5811E7A;
 Wed,  6 Jul 2022 18:40:48 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4C451410F3C;
 Wed,  6 Jul 2022 18:40:45 +0000 (UTC)
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
Subject: [RFC PATCH v9 12/23] vhost: Add opaque member to SVQElement
Date: Wed,  6 Jul 2022 20:39:57 +0200
Message-Id: <20220706184008.1649478-13-eperezma@redhat.com>
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

When qemu injects buffers to the vdpa device it will be used to maintain
contextual data. If SVQ has no operation, it will be used to maintain
the VirtQueueElement pointer.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  3 ++-
 hw/virtio/vhost-shadow-virtqueue.c | 13 +++++++------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 0e434e9fd0..a811f90e01 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -16,7 +16,8 @@
 #include "hw/virtio/vhost-iova-tree.h"
 
 typedef struct SVQElement {
-    VirtQueueElement *elem;
+    /* Opaque data */
+    void *opaque;
 
     /* Last descriptor of the chain */
     uint32_t last_chain_id;
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index c5e49e51c5..492bb12b5f 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -237,7 +237,7 @@ static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
  */
 static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
                           size_t out_num, const struct iovec *in_sg,
-                          size_t in_num, VirtQueueElement *elem)
+                          size_t in_num, void *opaque)
 {
     SVQElement *svq_elem;
     unsigned qemu_head;
@@ -245,13 +245,12 @@ static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
     bool ok = vhost_svq_add_split(svq, out_sg, out_num, in_sg, in_num,
                                   &qemu_head);
     if (unlikely(!ok)) {
-        g_free(elem);
         return false;
     }
 
     n = out_num + in_num;
     svq_elem = &svq->ring_id_maps[qemu_head];
-    svq_elem->elem = elem;
+    svq_elem->opaque = opaque;
     svq_elem->last_chain_id = vhost_svq_last_desc_of_chain(svq, n, qemu_head);
     return true;
 }
@@ -277,6 +276,8 @@ static bool vhost_svq_add_element(VhostShadowVirtqueue *svq,
                             elem->in_num, elem);
     if (ok) {
         vhost_svq_kick(svq);
+    } else {
+        g_free(elem);
     }
 
     return ok;
@@ -392,7 +393,7 @@ static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
 
 static bool vhost_svq_is_empty_elem(SVQElement elem)
 {
-    return elem.elem == NULL;
+    return elem.opaque == NULL;
 }
 
 static SVQElement vhost_svq_empty_elem(void)
@@ -483,7 +484,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
                 break;
             }
 
-            elem = g_steal_pointer(&svq_elem.elem);
+            elem = g_steal_pointer(&svq_elem.opaque);
             virtqueue_fill(vq, elem, len, i++);
         }
 
@@ -651,7 +652,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
 
     for (unsigned i = 0; i < svq->vring.num; ++i) {
         g_autofree VirtQueueElement *elem = NULL;
-        elem = g_steal_pointer(&svq->ring_id_maps[i].elem);
+        elem = g_steal_pointer(&svq->ring_id_maps[i].opaque);
         if (elem) {
             virtqueue_detach_element(svq->vq, elem, 0);
         }
-- 
2.31.1



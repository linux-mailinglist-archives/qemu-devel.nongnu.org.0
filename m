Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8CA56B7D1
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 12:56:36 +0200 (CEST)
Received: from localhost ([::1]:50048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9lf1-00012x-Ml
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 06:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZa-0000Qo-GB
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:50:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZY-0007uL-JA
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:50:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657277455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sN75vVtazTSWgo3MxyaSd6n17uzTq3pB/sH74PmxYsc=;
 b=PwnsqLWbSqtnYVfgxwclIKo50WChsqXMJqrsmAyQFqMVHB52hyZcT93guNLHH8K8XG+RqB
 1cg9/uQvJhFreguRJ8HDgfIUTIQnseaVl6rsee/eLX2t7hAxy7z8FE2fO+LUe8xuftfQ61
 h31FCe81g/wF+bHwtFlPnz1B8Ex4/vM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-OJm6r5d8NuCfa6xpzQmCPA-1; Fri, 08 Jul 2022 06:50:46 -0400
X-MC-Unique: OJm6r5d8NuCfa6xpzQmCPA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3C50811E7A;
 Fri,  8 Jul 2022 10:50:45 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1792D1121314;
 Fri,  8 Jul 2022 10:50:42 +0000 (UTC)
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
Subject: [PATCH 09/22] vhost: Add opaque member to SVQElement
Date: Fri,  8 Jul 2022 12:50:00 +0200
Message-Id: <20220708105013.1899854-10-eperezma@redhat.com>
In-Reply-To: <20220708105013.1899854-1-eperezma@redhat.com>
References: <20220708105013.1899854-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
index 5646d875cb..3e1bea12ca 100644
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
index 635b6b359f..01caa5887e 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -236,7 +236,7 @@ static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
  */
 static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
                           size_t out_num, const struct iovec *in_sg,
-                          size_t in_num, VirtQueueElement *elem)
+                          size_t in_num, void *opaque)
 {
     SVQElement *svq_elem;
     unsigned qemu_head;
@@ -244,13 +244,12 @@ static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
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
@@ -276,6 +275,8 @@ static bool vhost_svq_add_element(VhostShadowVirtqueue *svq,
                             elem->in_num, elem);
     if (ok) {
         vhost_svq_kick(svq);
+    } else {
+        g_free(elem);
     }
 
     return ok;
@@ -391,7 +392,7 @@ static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
 
 static bool vhost_svq_is_empty_elem(SVQElement elem)
 {
-    return elem.elem == NULL;
+    return elem.opaque == NULL;
 }
 
 static SVQElement vhost_svq_empty_elem(void)
@@ -466,7 +467,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
                 break;
             }
 
-            elem = g_steal_pointer(&svq_elem.elem);
+            elem = g_steal_pointer(&svq_elem.opaque);
             virtqueue_fill(vq, elem, len, i++);
         }
 
@@ -634,7 +635,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
 
     for (unsigned i = 0; i < svq->vring.num; ++i) {
         g_autofree VirtQueueElement *elem = NULL;
-        elem = g_steal_pointer(&svq->ring_id_maps[i].elem);
+        elem = g_steal_pointer(&svq->ring_id_maps[i].opaque);
         if (elem) {
             virtqueue_detach_element(svq->vq, elem, 0);
         }
-- 
2.31.1



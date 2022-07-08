Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3CD56B7C0
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 12:56:15 +0200 (CEST)
Received: from localhost ([::1]:48578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9leg-0008Qy-Rj
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 06:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZK-0000CH-Cs
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:50:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZI-0007qp-FU
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657277439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mWzsDwO9nIsGjL7QQb44G8D1SQOeaXUZrd+nCaIkCtM=;
 b=M0+0pbPuubnTaPrAGHrfpnEVCwq/t+RrC7PYQQ4PoyGpXW5m83qQLmFTvMof+P6qV8kWNZ
 u6kyFEDwIv071M8uQ8D1+pUvVhBPidP+zjuQ5zcTyIg93nW1qbZbGxwKlyQLFenrHVr/ud
 SxeluPRACDpDEFkTYQHyUltXq/xIJ6c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-40EVzmmTP2GzGYKOE12M8w-1; Fri, 08 Jul 2022 06:50:34 -0400
X-MC-Unique: 40EVzmmTP2GzGYKOE12M8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFDF7801231;
 Fri,  8 Jul 2022 10:50:33 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E19D11121314;
 Fri,  8 Jul 2022 10:50:30 +0000 (UTC)
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
Subject: [PATCH 05/22] vhost: Decouple vhost_svq_add_split from
 VirtQueueElement
Date: Fri,  8 Jul 2022 12:49:56 +0200
Message-Id: <20220708105013.1899854-6-eperezma@redhat.com>
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

VirtQueueElement comes from the guest, but we're heading SVQ to be able
to inject element without the guest's knowledge.

To do so, make this accept sg buffers directly, instead of using
VirtQueueElement.

Add vhost_svq_add_element to maintain element convenience

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 38 +++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 115d769b86..2d70f832e9 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -172,30 +172,32 @@ static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
 }
 
 static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
-                                VirtQueueElement *elem, unsigned *head)
+                                const struct iovec *out_sg, size_t out_num,
+                                const struct iovec *in_sg, size_t in_num,
+                                unsigned *head)
 {
     unsigned avail_idx;
     vring_avail_t *avail = svq->vring.avail;
     bool ok;
-    g_autofree hwaddr *sgs = g_new(hwaddr, MAX(elem->out_num, elem->in_num));
+    g_autofree hwaddr *sgs = NULL;
 
     *head = svq->free_head;
 
     /* We need some descriptors here */
-    if (unlikely(!elem->out_num && !elem->in_num)) {
+    if (unlikely(!out_num && !in_num)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "Guest provided element with no descriptors");
         return false;
     }
 
-    ok = vhost_svq_vring_write_descs(svq, sgs, elem->out_sg, elem->out_num,
-                                     elem->in_num > 0, false);
+    sgs = g_new(hwaddr, MAX(out_num, in_num));
+    ok = vhost_svq_vring_write_descs(svq, sgs, out_sg, out_num, in_num > 0,
+                                     false);
     if (unlikely(!ok)) {
         return false;
     }
 
-    ok = vhost_svq_vring_write_descs(svq, sgs, elem->in_sg, elem->in_num, false,
-                                     true);
+    ok = vhost_svq_vring_write_descs(svq, sgs, in_sg, in_num, false, true);
     if (unlikely(!ok)) {
         return false;
     }
@@ -222,10 +224,13 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
  * takes ownership of the element: In case of failure, it is free and the SVQ
  * is considered broken.
  */
-static bool vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
+static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
+                          size_t out_num, const struct iovec *in_sg,
+                          size_t in_num, VirtQueueElement *elem)
 {
     unsigned qemu_head;
-    bool ok = vhost_svq_add_split(svq, elem, &qemu_head);
+    bool ok = vhost_svq_add_split(svq, out_sg, out_num, in_sg, in_num,
+                                  &qemu_head);
     if (unlikely(!ok)) {
         g_free(elem);
         return false;
@@ -249,6 +254,18 @@ static void vhost_svq_kick(VhostShadowVirtqueue *svq)
     event_notifier_set(&svq->hdev_kick);
 }
 
+static bool vhost_svq_add_element(VhostShadowVirtqueue *svq,
+                                  VirtQueueElement *elem)
+{
+    bool ok = vhost_svq_add(svq, elem->out_sg, elem->out_num, elem->in_sg,
+                            elem->in_num, elem);
+    if (ok) {
+        vhost_svq_kick(svq);
+    }
+
+    return ok;
+}
+
 /**
  * Forward available buffers.
  *
@@ -301,12 +318,11 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
                 return;
             }
 
-            ok = vhost_svq_add(svq, elem);
+            ok = vhost_svq_add_element(svq, g_steal_pointer(&elem));
             if (unlikely(!ok)) {
                 /* VQ is broken, just return and ignore any other kicks */
                 return;
             }
-            vhost_svq_kick(svq);
         }
 
         virtio_queue_set_notification(svq->vq, true);
-- 
2.31.1



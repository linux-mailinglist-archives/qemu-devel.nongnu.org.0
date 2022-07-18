Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4A5577FCC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:36:28 +0200 (CEST)
Received: from localhost ([::1]:38146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDO71-0003fj-Oj
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDO1I-0000P8-VO
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:30:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDO1G-0001Ul-7p
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:30:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658140229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3nkoou4Oxj4dhaj1rNXqI5e5LTCePj0MM4Qd4yCljRo=;
 b=alIQfcqR71HmKVLwxi2U1QKkeCx4RIXCLOOUHXD3ID70mcpxn1o6H2+N4eNbzGgpOy1/bR
 M88mMsCGMLM2PU/Wp/yAVyXFpazUMdL5SezCu69EAAwCwLGqUQttaurj1vHWt9SPRIwvnn
 3Vyh5YxymmpS/i1njgKN8mKrxguUkfA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-iaa9i98mNBKtdbCxQkRIhQ-1; Mon, 18 Jul 2022 06:30:25 -0400
X-MC-Unique: iaa9i98mNBKtdbCxQkRIhQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC72E3C0D187;
 Mon, 18 Jul 2022 10:30:24 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A20912166B26;
 Mon, 18 Jul 2022 10:30:21 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: [PATCH v4 06/19] vhost: Check for queue full at vhost_svq_add
Date: Mon, 18 Jul 2022 12:29:36 +0200
Message-Id: <20220718102949.2868267-7-eperezma@redhat.com>
In-Reply-To: <20220718102949.2868267-1-eperezma@redhat.com>
References: <20220718102949.2868267-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

The series need to expose vhost_svq_add with full functionality,
including checking for full queue.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 59 +++++++++++++++++-------------
 1 file changed, 33 insertions(+), 26 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index e5a4a62daa..aee9891a67 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -233,21 +233,29 @@ static void vhost_svq_kick(VhostShadowVirtqueue *svq)
  * Add an element to a SVQ.
  *
  * The caller must check that there is enough slots for the new element. It
- * takes ownership of the element: In case of failure, it is free and the SVQ
- * is considered broken.
+ * takes ownership of the element: In case of failure not ENOSPC, it is free.
+ *
+ * Return -EINVAL if element is invalid, -ENOSPC if dev queue is full
  */
-static bool vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
+static int vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
 {
     unsigned qemu_head;
-    bool ok = vhost_svq_add_split(svq, elem, &qemu_head);
+    unsigned ndescs = elem->in_num + elem->out_num;
+    bool ok;
+
+    if (unlikely(ndescs > vhost_svq_available_slots(svq))) {
+        return -ENOSPC;
+    }
+
+    ok = vhost_svq_add_split(svq, elem, &qemu_head);
     if (unlikely(!ok)) {
         g_free(elem);
-        return false;
+        return -EINVAL;
     }
 
     svq->ring_id_maps[qemu_head] = elem;
     vhost_svq_kick(svq);
-    return true;
+    return 0;
 }
 
 /**
@@ -274,7 +282,7 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
 
         while (true) {
             VirtQueueElement *elem;
-            bool ok;
+            int r;
 
             if (svq->next_guest_avail_elem) {
                 elem = g_steal_pointer(&svq->next_guest_avail_elem);
@@ -286,25 +294,24 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
                 break;
             }
 
-            if (elem->out_num + elem->in_num > vhost_svq_available_slots(svq)) {
-                /*
-                 * This condition is possible since a contiguous buffer in GPA
-                 * does not imply a contiguous buffer in qemu's VA
-                 * scatter-gather segments. If that happens, the buffer exposed
-                 * to the device needs to be a chain of descriptors at this
-                 * moment.
-                 *
-                 * SVQ cannot hold more available buffers if we are here:
-                 * queue the current guest descriptor and ignore further kicks
-                 * until some elements are used.
-                 */
-                svq->next_guest_avail_elem = elem;
-                return;
-            }
-
-            ok = vhost_svq_add(svq, elem);
-            if (unlikely(!ok)) {
-                /* VQ is broken, just return and ignore any other kicks */
+            r = vhost_svq_add(svq, elem);
+            if (unlikely(r != 0)) {
+                if (r == -ENOSPC) {
+                    /*
+                     * This condition is possible since a contiguous buffer in
+                     * GPA does not imply a contiguous buffer in qemu's VA
+                     * scatter-gather segments. If that happens, the buffer
+                     * exposed to the device needs to be a chain of descriptors
+                     * at this moment.
+                     *
+                     * SVQ cannot hold more available buffers if we are here:
+                     * queue the current guest descriptor and ignore kicks
+                     * until some elements are used.
+                     */
+                    svq->next_guest_avail_elem = elem;
+                }
+
+                /* VQ is full or broken, just return and ignore kicks */
                 return;
             }
         }
-- 
2.31.1



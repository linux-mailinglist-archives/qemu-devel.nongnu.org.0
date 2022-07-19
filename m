Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0619F579F8B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 15:23:36 +0200 (CEST)
Received: from localhost ([::1]:50666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDnCJ-0001td-25
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 09:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDn6D-0007Wt-Gf
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:17:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDn6A-0004qf-Ry
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658236634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9NSQaMxFBqsbZB36hr3id0dMLvZuFrBmbbdTHzoh6go=;
 b=A/clC4kBFDdQzhqd2c/OKK2IHvP5ZH594QsYX113NGfvwUiaVy7bjmDA0E7BwBLgQi/DwY
 RPLFIMzaHDzSlu7MSpKwjQpkMauUsFfNdghw6y0U1w7dd/jiSN3IPebFYQucNOREPRYNew
 gKbE7t0QWQV6oiIf6+HwAeBVKjKoOlk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-SRWU885pNweu3ECvNL8Qxw-1; Tue, 19 Jul 2022 09:17:11 -0400
X-MC-Unique: SRWU885pNweu3ECvNL8Qxw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9A6585A586;
 Tue, 19 Jul 2022 13:17:10 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-77.pek2.redhat.com [10.72.12.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DE5F40CFD0A;
 Tue, 19 Jul 2022 13:17:08 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 07/24] vhost: Check for queue full at vhost_svq_add
Date: Tue, 19 Jul 2022 21:16:20 +0800
Message-Id: <20220719131637.46131-8-jasowang@redhat.com>
In-Reply-To: <20220719131637.46131-1-jasowang@redhat.com>
References: <20220719131637.46131-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

The series need to expose vhost_svq_add with full functionality,
including checking for full queue.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 59 +++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 26 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index e272c33..11302ea 100644
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
2.7.4



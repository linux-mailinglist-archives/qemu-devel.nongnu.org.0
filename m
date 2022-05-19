Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7FF52DDCA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 21:25:31 +0200 (CEST)
Received: from localhost ([::1]:43450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrlm4-0005hd-FC
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 15:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nrlam-0005OB-A1
 for qemu-devel@nongnu.org; Thu, 19 May 2022 15:13:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nrlak-0006PL-G7
 for qemu-devel@nongnu.org; Thu, 19 May 2022 15:13:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652987623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Rk5vuJjlEY7VO/1pCIBCwcJaBWNUxkAO+ircCyr+84=;
 b=f8m+oPNaG4+er28xWKz8GpdLbdmlsKoUNJ/59iOuhd5SAfqtYyrvewvZdBvEeYQVaXfWAf
 Zbc3giRTGNEsgxo9OSd7VsBnNil7AyKad2rPzAY29lr8Bw39RQ4cdnerxIrIqoB2Llh20i
 J31Od8pm3wftbgeJd3ybwPMOnAHx5BU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-LTRMZHbePYyNPZUxoVGy8w-1; Thu, 19 May 2022 15:13:40 -0400
X-MC-Unique: LTRMZHbePYyNPZUxoVGy8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3956A29AB3E1;
 Thu, 19 May 2022 19:13:40 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F4962026D6A;
 Thu, 19 May 2022 19:13:37 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eric Blake <eblake@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Subject: [RFC PATCH v8 10/21] vhost: Add vhost_svq_inject
Date: Thu, 19 May 2022 21:12:55 +0200
Message-Id: <20220519191306.821774-11-eperezma@redhat.com>
In-Reply-To: <20220519191306.821774-1-eperezma@redhat.com>
References: <20220519191306.821774-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

This allows qemu to inject buffers to the device without guest's notice.

This will be use to inject net CVQ messages to restore status in the
destination.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  5 +++
 hw/virtio/vhost-shadow-virtqueue.c | 72 +++++++++++++++++++++++++-----
 2 files changed, 65 insertions(+), 12 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 79cb2d301f..8fe0367944 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -23,6 +23,9 @@ typedef struct SVQElement {
 
     /* Length of in buffer */
     size_t in_len;
+
+    /* Buffer has been injected by QEMU, not by the guest */
+    bool not_from_guest;
 } SVQElement;
 
 typedef void (*VirtQueueElementCallback)(VirtIODevice *vdev,
@@ -115,6 +118,8 @@ typedef struct VhostShadowVirtqueue {
 
 bool vhost_svq_valid_features(uint64_t features, Error **errp);
 
+int vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov,
+                     size_t out_num, size_t in_num);
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
 void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 5a8feb1cbc..c535c99905 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -312,6 +312,43 @@ static void vhost_svq_kick(VhostShadowVirtqueue *svq)
     event_notifier_set(&svq->hdev_kick);
 }
 
+/**
+ * Inject a chain of buffers to the device
+ *
+ * @svq: Shadow VirtQueue
+ * @iov: Descriptors buffer
+ * @out_num: Number of out elements
+ * @in_num: Number of in elements
+ */
+int vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov,
+                     size_t out_num, size_t in_num)
+{
+    SVQElement *svq_elem;
+    uint16_t num_slots = (in_num ? 1 : 0) + (out_num ? 1 : 0);
+
+    /*
+     * To inject buffers in a SVQ that does not copy descriptors is not
+     * supported. All vhost_svq_inject calls are controlled by qemu so we won't
+     * hit these assertions.
+     */
+    assert(svq->copy_descs);
+    assert(num_slots > 0);
+
+    if (unlikely(svq->next_guest_avail_elem)) {
+        error_report("Injecting in a full queue");
+        return -ENOMEM;
+    }
+
+    svq_elem = virtqueue_alloc_element(sizeof(*svq_elem), out_num, in_num);
+    iov_copy(svq_elem->elem.in_sg, in_num, iov + out_num, in_num, 0, SIZE_MAX);
+    iov_copy(svq_elem->elem.out_sg, out_num, iov, out_num, 0, SIZE_MAX);
+    svq_elem->not_from_guest = true;
+    vhost_svq_add(svq, svq_elem);
+    vhost_svq_kick(svq);
+
+    return 0;
+}
+
 /**
  * Forward available buffers.
  *
@@ -350,6 +387,7 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
                 break;
             }
 
+            svq_elem->not_from_guest = false;
             elem = &svq_elem->elem;
             needed_slots = svq->copy_descs ? 1 : elem->out_num + elem->in_num;
             if (needed_slots > vhost_svq_available_slots(svq)) {
@@ -575,19 +613,24 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
                 svq->ops->used_elem_handler(svq->vdev, elem);
             }
 
-            if (unlikely(i >= svq->vring.num)) {
-                qemu_log_mask(LOG_GUEST_ERROR,
-                         "More than %u used buffers obtained in a %u size SVQ",
-                         i, svq->vring.num);
-                virtqueue_fill(vq, elem, len, i);
-                virtqueue_flush(vq, i);
-                return;
+            if (!svq_elem->not_from_guest) {
+                if (unlikely(i >= svq->vring.num)) {
+                    qemu_log_mask(
+                        LOG_GUEST_ERROR,
+                        "More than %u used buffers obtained in a %u size SVQ",
+                        i, svq->vring.num);
+                    virtqueue_fill(vq, elem, len, i);
+                    virtqueue_flush(vq, i);
+                    return;
+                }
+                virtqueue_fill(vq, elem, len, i++);
             }
-            virtqueue_fill(vq, elem, len, i++);
         }
 
-        virtqueue_flush(vq, i);
-        event_notifier_set(&svq->svq_call);
+        if (i > 0) {
+            virtqueue_flush(vq, i);
+            event_notifier_set(&svq->svq_call);
+        }
 
         if (check_for_avail_queue && svq->next_guest_avail_elem) {
             /*
@@ -755,7 +798,10 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
             if (svq->copy_descs) {
                 vhost_svq_unmap_elem(svq, svq_elem, 0, false);
             }
-            virtqueue_detach_element(svq->vq, &svq_elem->elem, 0);
+
+            if (!svq_elem->not_from_guest) {
+                virtqueue_detach_element(svq->vq, &svq_elem->elem, 0);
+            }
         }
     }
 
@@ -764,7 +810,9 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
         if (svq->copy_descs) {
             vhost_svq_unmap_elem(svq, next_avail_elem, 0, false);
         }
-        virtqueue_detach_element(svq->vq, &next_avail_elem->elem, 0);
+        if (!next_avail_elem->not_from_guest) {
+            virtqueue_detach_element(svq->vq, &next_avail_elem->elem, 0);
+        }
     }
     svq->vq = NULL;
     g_free(svq->desc_next);
-- 
2.27.0



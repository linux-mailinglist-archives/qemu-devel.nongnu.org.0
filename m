Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4B6576D92
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 13:39:30 +0200 (CEST)
Received: from localhost ([::1]:41014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCg8v-0007Vz-L4
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 07:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCg4R-00065U-Cn
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 07:34:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCg4P-00070Y-O3
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 07:34:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657971289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=01ACmeGhAIP2AtznF+uKhJzd48YalALS/Ud8+wykJbc=;
 b=PnfDRteN6dAzRAWBNa4QfBDAB1Jp/fVPNzuo3sdTVNpQYNtjxy6n50Klh+90nExaE+jW5L
 AdS2tGtu7RRsflwTbPdJYnr92H2oy8RDt4PyVMiYUi7bWC6kDZLISjI507I3F/LVLXWU9N
 AKOjm+b9avLs3KvMYZ1rzZN8/nHt3Q8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-cFsqNETOMqK5zMvKKV4Lhw-1; Sat, 16 Jul 2022 07:34:45 -0400
X-MC-Unique: cFsqNETOMqK5zMvKKV4Lhw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E457811E76;
 Sat, 16 Jul 2022 11:34:44 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88C3B40E80E0;
 Sat, 16 Jul 2022 11:34:39 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Gautam Dawar <gdawar@xilinx.com>
Subject: [RFC PATCH 06/12] vhost: Use opaque data in SVQDescState
Date: Sat, 16 Jul 2022 13:34:01 +0200
Message-Id: <20220716113407.2730331-7-eperezma@redhat.com>
In-Reply-To: <20220716113407.2730331-1-eperezma@redhat.com>
References: <20220716113407.2730331-1-eperezma@redhat.com>
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

Since we'll allow net/vhost-vdpa to add elements that don't come from
the guest, we need to store opaque data that makes sense to the caller.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  4 ++--
 hw/virtio/vhost-shadow-virtqueue.c | 20 +++++++++++---------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index d04c34a589..03eb7ff670 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -16,7 +16,7 @@
 #include "hw/virtio/vhost-iova-tree.h"
 
 typedef struct SVQDescState {
-    VirtQueueElement *elem;
+    void *data;
 
     /*
      * Number of descriptors exposed to the device. May or may not match
@@ -115,7 +115,7 @@ void vhost_svq_push_elem(VhostShadowVirtqueue *svq,
                          const VirtQueueElement *elem, uint32_t len);
 int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
                   size_t out_num, const struct iovec *in_sg, size_t in_num,
-                  VirtQueueElement *elem);
+                  void *data);
 size_t vhost_svq_poll(VhostShadowVirtqueue *svq);
 
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 29633b7a29..88e290d94b 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -237,7 +237,7 @@ static void vhost_svq_kick(VhostShadowVirtqueue *svq)
  */
 int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
                   size_t out_num, const struct iovec *in_sg, size_t in_num,
-                  VirtQueueElement *elem)
+                  void *data)
 {
     unsigned qemu_head;
     unsigned ndescs = in_num + out_num;
@@ -252,7 +252,7 @@ int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
         return -EINVAL;
     }
 
-    svq->desc_state[qemu_head].elem = elem;
+    svq->desc_state[qemu_head].data = data;
     svq->desc_state[qemu_head].ndescs = ndescs;
     vhost_svq_kick(svq);
     return 0;
@@ -389,8 +389,7 @@ static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
     return i;
 }
 
-static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
-                                           uint32_t *len)
+static void *vhost_svq_get_buf(VhostShadowVirtqueue *svq, uint32_t *len)
 {
     const vring_used_t *used = svq->vring.used;
     vring_used_elem_t used_elem;
@@ -413,7 +412,7 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
         return NULL;
     }
 
-    if (unlikely(!svq->desc_state[used_elem.id].elem)) {
+    if (unlikely(!svq->desc_state[used_elem.id].data)) {
         qemu_log_mask(LOG_GUEST_ERROR,
             "Device %s says index %u is used, but it was not available",
             svq->vdev->name, used_elem.id);
@@ -426,7 +425,7 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
     svq->free_head = used_elem.id;
 
     *len = used_elem.len;
-    return g_steal_pointer(&svq->desc_state[used_elem.id].elem);
+    return g_steal_pointer(&svq->desc_state[used_elem.id].data);
 }
 
 /**
@@ -498,8 +497,7 @@ size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
 {
     do {
         uint32_t len;
-        VirtQueueElement *elem = vhost_svq_get_buf(svq, &len);
-        if (elem) {
+        if (vhost_svq_get_buf(svq, &len)) {
             return len;
         }
 
@@ -658,8 +656,12 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
     vhost_svq_flush(svq, false);
 
     for (unsigned i = 0; i < svq->vring.num; ++i) {
+        /*
+         * We know .data is an element because external callers of
+         * vhost_svq_add use active polling, not SVQ
+         */
         g_autofree VirtQueueElement *elem = NULL;
-        elem = g_steal_pointer(&svq->desc_state[i].elem);
+        elem = g_steal_pointer(&svq->desc_state[i].data);
         if (elem) {
             virtqueue_detach_element(svq->vq, elem, 0);
         }
-- 
2.31.1



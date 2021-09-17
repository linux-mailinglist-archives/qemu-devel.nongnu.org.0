Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AC540F43D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 10:36:37 +0200 (CEST)
Received: from localhost ([::1]:59912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR9MK-0000ml-UD
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 04:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mR9Aa-0000El-J7
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:24:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mR9AY-0007NO-TN
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:24:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631867066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZodCy6rgnZqdlyonFi5E2pLTgOQPzxxyI3lrzMC0I/g=;
 b=DmS7rSvl+Y4ftEHVOu6DUXUXrW85z/uNpYRdy4RzKVjEunaoLEO1hhmDjEVWSoGS0WcGwW
 ktmBTXL52FZxBV2fcvAmaIPLJixREPalPsLhOFS8r12lX64qzq4QN4WJCV/I6gctGRY6iA
 sv91PxhCxdZ4TneMQyRfyrS26OJQ1pw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-3TdK4nAYN7KvCzwEe6VP_g-1; Fri, 17 Sep 2021 04:24:23 -0400
X-MC-Unique: 3TdK4nAYN7KvCzwEe6VP_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 094901808306;
 Fri, 17 Sep 2021 08:24:22 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-234.pek2.redhat.com
 [10.72.12.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAC575D6B1;
 Fri, 17 Sep 2021 08:24:19 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 2/2] virtio-net: fix use after unmap/free for sg
Date: Fri, 17 Sep 2021 16:24:12 +0800
Message-Id: <20210917082412.75470-3-jasowang@redhat.com>
In-Reply-To: <20210917082412.75470-1-jasowang@redhat.com>
References: <20210917082412.75470-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexander Bulekov <alxndr@bu.edu>, Jason Wang <jasowang@redhat.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When mergeable buffer is enabled, we try to set the num_buffers after
the virtqueue elem has been unmapped. This will lead several issues,
E.g a use after free when the descriptor has an address which belongs
to the non direct access region. In this case we use bounce buffer
that is allocated during address_space_map() and freed during
address_space_unmap().

Fixing this by storing the elems temporarily in an array and delay the
unmap after we set the the num_buffers.

This addresses CVE-2021-3748.

Reported-by: Alexander Bulekov <alxndr@bu.edu>
Fixes: fbe78f4f55c6 ("virtio-net support")
Cc: qemu-stable@nongnu.org
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/virtio-net.c | 39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 16d20cd..f205331 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1746,10 +1746,13 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
     VirtIONet *n = qemu_get_nic_opaque(nc);
     VirtIONetQueue *q = virtio_net_get_subqueue(nc);
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
+    VirtQueueElement *elems[VIRTQUEUE_MAX_SIZE];
+    size_t lens[VIRTQUEUE_MAX_SIZE];
     struct iovec mhdr_sg[VIRTQUEUE_MAX_SIZE];
     struct virtio_net_hdr_mrg_rxbuf mhdr;
     unsigned mhdr_cnt = 0;
-    size_t offset, i, guest_offset;
+    size_t offset, i, guest_offset, j;
+    ssize_t err;
 
     if (!virtio_net_can_receive(nc)) {
         return -1;
@@ -1780,6 +1783,12 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
 
         total = 0;
 
+        if (i == VIRTQUEUE_MAX_SIZE) {
+            virtio_error(vdev, "virtio-net unexpected long buffer chain");
+            err = size;
+            goto err;
+        }
+
         elem = virtqueue_pop(q->rx_vq, sizeof(VirtQueueElement));
         if (!elem) {
             if (i) {
@@ -1791,7 +1800,8 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
                              n->guest_hdr_len, n->host_hdr_len,
                              vdev->guest_features);
             }
-            return -1;
+            err = -1;
+            goto err;
         }
 
         if (elem->in_num < 1) {
@@ -1799,7 +1809,8 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
                          "virtio-net receive queue contains no in buffers");
             virtqueue_detach_element(q->rx_vq, elem, 0);
             g_free(elem);
-            return -1;
+            err = -1;
+            goto err;
         }
 
         sg = elem->in_sg;
@@ -1836,12 +1847,13 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
         if (!n->mergeable_rx_bufs && offset < size) {
             virtqueue_unpop(q->rx_vq, elem, total);
             g_free(elem);
-            return size;
+            err = size;
+            goto err;
         }
 
-        /* signal other side */
-        virtqueue_fill(q->rx_vq, elem, total, i++);
-        g_free(elem);
+        elems[i] = elem;
+        lens[i] = total;
+        i++;
     }
 
     if (mhdr_cnt) {
@@ -1851,10 +1863,23 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
                      &mhdr.num_buffers, sizeof mhdr.num_buffers);
     }
 
+    for (j = 0; j < i; j++) {
+        /* signal other side */
+        virtqueue_fill(q->rx_vq, elems[j], lens[j], j);
+        g_free(elems[j]);
+    }
+
     virtqueue_flush(q->rx_vq, i);
     virtio_notify(vdev, q->rx_vq);
 
     return size;
+
+err:
+    for (j = 0; j < i; j++) {
+        g_free(elems[j]);
+    }
+
+    return err;
 }
 
 static ssize_t virtio_net_do_receive(NetClientState *nc, const uint8_t *buf,
-- 
2.7.4



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EA26E8B94
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 09:42:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppOux-0003s7-4U; Thu, 20 Apr 2023 03:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1ppOuj-0003ro-M4; Thu, 20 Apr 2023 03:41:09 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1ppOuh-00014R-Tg; Thu, 20 Apr 2023 03:41:09 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1a6c5acf6ccso6597695ad.3; 
 Thu, 20 Apr 2023 00:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681976466; x=1684568466;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sQcJww+tK3jo1g57lln2zj62XytskH9OTRJmBKZntj8=;
 b=rsUpnSYBduirYt3+UL2iY7xc6fWK2Ed2XPpI4nSc1X+dvTxw6VmecnPfe+KYoSTvXO
 of8hd0u+bgAVhAmBo2auy4B1qjTidcjqyXdGcWN73zbjpRTtgTfNPu0KsgnxIEeAIQfH
 77i5BNhCqqUK+obNTk2l9IdKf9kn6se39uyO0cutvQnmNHph8KauKOsvelIMphKFYUBl
 zzYvJ+wTEVv4MI8snZenkQd+s9W151OfAHQv0FVhjnEnpepEXHgsnUsVzv8p9WOXxSOL
 oEOy4QcKK2b4vHCKsjJ3tXzlRtzMznzYIbmlpN4faJI0p0U7LKiNKEr7elnOGWExraWj
 9RyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681976466; x=1684568466;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sQcJww+tK3jo1g57lln2zj62XytskH9OTRJmBKZntj8=;
 b=DPhkdy1uIu2L+aw04QUdsM7EZA5ZdXKnlgJDPU7KQVHgnmfWlcSL/TM4ze1IuV3ea2
 BSU0TzQSmONSy9vE+PQqoYVxkWh0X72lYfSBsi7blb1B870TRRUmggEQGGGNVzgGn1/C
 aXKDxiaJ4H9mmhvIgPdIfw68h8xzdManmOSAq9JsQ7j9ix5g7OcbUBw1EJ4v4Qeb6EGE
 nc79SUWE+GKKIWXYlEN9IB8CpV1qDwbh2rAeumwixrOvmI1R0YffzMnv2aByEYEZ+jdJ
 +rjvobutfPiEJ9gLdCZKwYntaaYTazePdTJ7RACqzYxoH+YklwRPQssiI+9Wv4dn0hKh
 hbtQ==
X-Gm-Message-State: AAQBX9dVvea9wUiSWGw3/mtQh8wDMT0Opw+UpWDyLlDitc6Nv06d/c2v
 0zXqDLOUYIxo4FF/Rq5a82g=
X-Google-Smtp-Source: AKy350ZUgPW6vAw9bulzt4gMe0T90uC+XCEeed/xw2xzyLj81exlLKDERcBrPMB1H3wqs7XmFzeJDA==
X-Received: by 2002:a17:902:c408:b0:1a8:ac3:47b4 with SMTP id
 k8-20020a170902c40800b001a80ac347b4mr812611plk.20.1681976465661; 
 Thu, 20 Apr 2023 00:41:05 -0700 (PDT)
Received: from localhost ([159.226.94.115]) by smtp.gmail.com with ESMTPSA id
 c2-20020a170902d90200b001a6dc4a98f9sm586835plz.195.2023.04.20.00.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 00:41:05 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: eperezma@redhat.com,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: yin31149@gmail.com, 18801353760@163.com, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Subject: [PATCH] vhost: fix possible wrap in SVQ descriptor ring
Date: Thu, 20 Apr 2023 15:41:02 +0800
Message-Id: <20230420074102.2317-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=yin31149@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QEMU invokes vhost_svq_add() when adding a guest's element into SVQ.
In vhost_svq_add(), it uses vhost_svq_available_slots() to check
whether QEMU can add the element into the SVQ. If there is
enough space, then QEMU combines some out descriptors and
some in descriptors into one descriptor chain, and add it into
svq->vring.desc by vhost_svq_vring_write_descs().

Yet the problem is that, `svq->shadow_avail_idx - svq->shadow_used_idx`
in vhost_svq_available_slots() return the number of occupied elements,
or the number of descriptor chains, instead of the number of occupied
descriptors, which may cause wrapping in SVQ descriptor ring.

Here is an example. In vhost_handle_guest_kick(), QEMU forwards
as many available buffers to device by virtqueue_pop() and
vhost_svq_add_element(). virtqueue_pop() return a guest's element,
and use vhost_svq_add_elemnt(), a wrapper to vhost_svq_add(), to
add this element into SVQ. If QEMU invokes virtqueue_pop() and
vhost_svq_add_element() `svq->vring.num` times, vhost_svq_available_slots()
thinks QEMU just ran out of slots and everything should work fine.
But in fact, virtqueue_pop() return `svq-vring.num` elements or
descriptor chains, more than `svq->vring.num` descriptors, due to
guest memory fragmentation, and this cause wrapping in SVQ descriptor ring.

Therefore, this patch adds `num_free` field in VhostShadowVirtqueue
structure, updates this field in vhost_svq_add() and
vhost_svq_get_buf(), to record the number of free descriptors.
Then we can avoid wrap in SVQ descriptor ring by refactoring
vhost_svq_available_slots().

Fixes: 100890f7ca ("vhost: Shadow virtqueue buffers forwarding")
Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 9 ++++++++-
 hw/virtio/vhost-shadow-virtqueue.h | 3 +++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 8361e70d1b..e1c6952b10 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -68,7 +68,7 @@ bool vhost_svq_valid_features(uint64_t features, Error **errp)
  */
 static uint16_t vhost_svq_available_slots(const VhostShadowVirtqueue *svq)
 {
-    return svq->vring.num - (svq->shadow_avail_idx - svq->shadow_used_idx);
+    return svq->num_free;
 }
 
 /**
@@ -263,6 +263,9 @@ int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
         return -EINVAL;
     }
 
+    /* Update the size of SVQ vring free descriptors */
+    svq->num_free -= ndescs;
+
     svq->desc_state[qemu_head].elem = elem;
     svq->desc_state[qemu_head].ndescs = ndescs;
     vhost_svq_kick(svq);
@@ -450,6 +453,9 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
     svq->desc_next[last_used_chain] = svq->free_head;
     svq->free_head = used_elem.id;
 
+    /* Update the size of SVQ vring free descriptors */
+    svq->num_free += num;
+
     *len = used_elem.len;
     return g_steal_pointer(&svq->desc_state[used_elem.id].elem);
 }
@@ -659,6 +665,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
     svq->iova_tree = iova_tree;
 
     svq->vring.num = virtio_queue_get_num(vdev, virtio_get_queue_index(vq));
+    svq->num_free = svq->vring.num;
     driver_size = vhost_svq_driver_area_size(svq);
     device_size = vhost_svq_device_area_size(svq);
     svq->vring.desc = qemu_memalign(qemu_real_host_page_size(), driver_size);
diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 926a4897b1..6efe051a70 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -107,6 +107,9 @@ typedef struct VhostShadowVirtqueue {
 
     /* Next head to consume from the device */
     uint16_t last_used_idx;
+
+    /* Size of SVQ vring free descriptors */
+    uint16_t num_free;
 } VhostShadowVirtqueue;
 
 bool vhost_svq_valid_features(uint64_t features, Error **errp);
-- 
2.25.1



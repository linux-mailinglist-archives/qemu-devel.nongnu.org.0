Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53B4401A20
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 12:48:25 +0200 (CEST)
Received: from localhost ([::1]:48498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNCAq-0000Tb-U5
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 06:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNC6E-0004pa-QQ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:43:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNC6D-0005nS-45
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:43:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630925016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hnQjUJf863/+mR0eVjMS2XLf+nf0liaJ3GnxfaQW96o=;
 b=QjrYruLEbtV1d+G5Py21h7TXbNV7RwFmZa5OEe39fdabMjNSAqBH6w0gdzz4QGDVZq2Ll5
 ircZgq8I9NGiAZ/LKxW08HzJRh6XnJLkz8zE2zrg0QrnifA0URrIc/ENhrrxTLWfdLjAAI
 Fnb/AThUvfLt68PdTLj3MU6yCweVxZs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-2oe8JsGOMY6RoR51McHDuQ-1; Mon, 06 Sep 2021 06:43:35 -0400
X-MC-Unique: 2oe8JsGOMY6RoR51McHDuQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 r126-20020a1c4484000000b002e8858850abso2190284wma.0
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 03:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hnQjUJf863/+mR0eVjMS2XLf+nf0liaJ3GnxfaQW96o=;
 b=s0AMyLhO06yepwWyNgXQ7Xd6nS1R8+8WLmQwHBZgjlld6ulJwY1v4CRDqB4Pj0vG2X
 rLQVBNQeHn0lwaNqvbNVRmkenZ9MtgE1BQYh/SlWViKoFrT2v0dAYF/y/Ij+6n162YIG
 VFO0YXpKh5GlUmxO1kqaKDI7YORpCp3e0H7+r+aYRLENseHuryXdTreyYU7TpqECNu9e
 aqqrXIK+vwXOYaMub/iuVAKci5jH0G5cGu3/epbyJhJsD6P1ummaeKMzjY7eyE4v9X/j
 zaeSG6jk8dyvHWDj0XdVNNvBdPaRuHFfO+X0NoFrlTeJxcvBvRTQkMQRKubCwsFxT+J3
 kt/A==
X-Gm-Message-State: AOAM533A0ywLOYWbQt9oCr7Lv2CBHmHkuqlE+gpXnQiQC8XN/R9pCQiC
 82DsaqgHiU2QGqnSeAeKZNE3EXneK4fPAzaCz/fwl7ZsW+3DMccpz5MEET47V2qY5YH5WEy8+vs
 zeE8Zi34yGs7qwHXx84UGtBtvoh/KFJ7mIagSC8bZQuY4lru1ihO1O9pBvjtRfHUg
X-Received: by 2002:a1c:2313:: with SMTP id j19mr10432845wmj.189.1630925014235; 
 Mon, 06 Sep 2021 03:43:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJfm5PSRAgm++47QCA949GONjrP8h2cc7vrrvhVpxUSEbp3iABDoCQXGrsno4GUyykO8PS4Q==
X-Received: by 2002:a1c:2313:: with SMTP id j19mr10432820wmj.189.1630925013958; 
 Mon, 06 Sep 2021 03:43:33 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id k18sm6946622wmi.25.2021.09.06.03.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 03:43:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] hw/virtio: Have virtqueue_get_avail_bytes() pass
 caches arg to callees
Date: Mon,  6 Sep 2021 12:43:18 +0200
Message-Id: <20210906104318.1569967-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906104318.1569967-1-philmd@redhat.com>
References: <20210906104318.1569967-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both virtqueue_packed_get_avail_bytes() and
virtqueue_split_get_avail_bytes() access the region cache, but
their caller also does. Simplify by having virtqueue_get_avail_bytes
calling both with RCU lock held, and passing the caches as argument.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/virtio.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 7d3bf9091ee..0dbfb53e51b 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -985,28 +985,23 @@ static int virtqueue_split_read_next_desc(VirtIODevice *vdev, VRingDesc *desc,
     return VIRTQUEUE_READ_DESC_MORE;
 }
 
+/* Called within rcu_read_lock().  */
 static void virtqueue_split_get_avail_bytes(VirtQueue *vq,
                             unsigned int *in_bytes, unsigned int *out_bytes,
-                            unsigned max_in_bytes, unsigned max_out_bytes)
+                            unsigned max_in_bytes, unsigned max_out_bytes,
+                            VRingMemoryRegionCaches *caches)
 {
     VirtIODevice *vdev = vq->vdev;
     unsigned int max, idx;
     unsigned int total_bufs, in_total, out_total;
-    VRingMemoryRegionCaches *caches;
     MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
     int64_t len = 0;
     int rc;
 
-    RCU_READ_LOCK_GUARD();
-
     idx = vq->last_avail_idx;
     total_bufs = in_total = out_total = 0;
 
     max = vq->vring.num;
-    caches = vring_get_region_caches(vq);
-    if (!caches) {
-        goto err;
-    }
 
     while ((rc = virtqueue_num_heads(vq, idx)) > 0) {
         MemoryRegionCache *desc_cache = &caches->desc;
@@ -1125,32 +1120,28 @@ static int virtqueue_packed_read_next_desc(VirtQueue *vq,
     return VIRTQUEUE_READ_DESC_MORE;
 }
 
+/* Called within rcu_read_lock().  */
 static void virtqueue_packed_get_avail_bytes(VirtQueue *vq,
                                              unsigned int *in_bytes,
                                              unsigned int *out_bytes,
                                              unsigned max_in_bytes,
-                                             unsigned max_out_bytes)
+                                             unsigned max_out_bytes,
+                                             VRingMemoryRegionCaches *caches)
 {
     VirtIODevice *vdev = vq->vdev;
     unsigned int max, idx;
     unsigned int total_bufs, in_total, out_total;
     MemoryRegionCache *desc_cache;
-    VRingMemoryRegionCaches *caches;
     MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
     int64_t len = 0;
     VRingPackedDesc desc;
     bool wrap_counter;
 
-    RCU_READ_LOCK_GUARD();
     idx = vq->last_avail_idx;
     wrap_counter = vq->last_avail_wrap_counter;
     total_bufs = in_total = out_total = 0;
 
     max = vq->vring.num;
-    caches = vring_get_region_caches(vq);
-    if (!caches) {
-        goto err;
-    }
 
     for (;;) {
         unsigned int num_bufs = total_bufs;
@@ -1251,6 +1242,8 @@ void virtqueue_get_avail_bytes(VirtQueue *vq, unsigned int *in_bytes,
     uint16_t desc_size;
     VRingMemoryRegionCaches *caches;
 
+    RCU_READ_LOCK_GUARD();
+
     if (unlikely(!vq->vring.desc)) {
         goto err;
     }
@@ -1269,10 +1262,12 @@ void virtqueue_get_avail_bytes(VirtQueue *vq, unsigned int *in_bytes,
 
     if (virtio_vdev_has_feature(vq->vdev, VIRTIO_F_RING_PACKED)) {
         virtqueue_packed_get_avail_bytes(vq, in_bytes, out_bytes,
-                                         max_in_bytes, max_out_bytes);
+                                         max_in_bytes, max_out_bytes,
+                                         caches);
     } else {
         virtqueue_split_get_avail_bytes(vq, in_bytes, out_bytes,
-                                        max_in_bytes, max_out_bytes);
+                                        max_in_bytes, max_out_bytes,
+                                        caches);
     }
 
     return;
-- 
2.31.1



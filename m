Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBEB3F8D61
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:55:02 +0200 (CEST)
Received: from localhost ([::1]:39384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJaf-0008UD-Jk
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJJ9q-0006Iz-W8
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:27:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJJ9p-0007UH-62
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629998836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u6X8NyK5dk4UMskkp60riuy7ptxhQXw1NrJ4q4sajpM=;
 b=cVY++T/b6OjvNK10pSxrcasGp9tActIgol8IWAw7iWrHwbDbqtBT/Z8cUo3BQQtjSQTcg3
 tFa5c4SRG5EZYbaXp2222THNUQDK67stcI2UwFRPSKsfFNiFKJNp7mmRP4tE5bWkVg44MN
 eFkc1zsr2DU+MAJfKk+WAMOJolokXF0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-ZYgXQIfHMd-HMS0lC01rxw-1; Thu, 26 Aug 2021 13:27:15 -0400
X-MC-Unique: ZYgXQIfHMd-HMS0lC01rxw-1
Received: by mail-wm1-f72.google.com with SMTP id
 j135-20020a1c238d000000b002e87aa95b5aso3808440wmj.4
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u6X8NyK5dk4UMskkp60riuy7ptxhQXw1NrJ4q4sajpM=;
 b=cEI7893NidSOcDfpVADbulz/ZE8/BWzJfCu2vfPfca9ZDtXx60bbb3UF6EaBaRrHZL
 SoEmD95YZBwHp9HP8HHytrG+EULLvF+7fIUFmdwIBHrqA8PNhWs8JmDi5LFkTUb7hnT4
 V2BhZo/MYZOkdvF7mPiUyRr/4zqJRroZAuRazuv4UiQXHxDKhQ9YhERXoLSzgUM0nbHf
 m6Q9Aqwpff/77gg3+speiNtgF1Nh9Dj/eYuDOqZfUmSfcPPrcqWdeAX6VnjWscoN1q5t
 hKnUIlcxz1FJ62pdZ25+mbJEdHN4I66TkD11ymOQKyekCNfeasXm2CvGwg2gFYhfzb3i
 BB1Q==
X-Gm-Message-State: AOAM530lwuh82lCmLm3AGwRsakjan97p/vKevS5Wbt8TOIt0FfZ/EVFA
 g7g41Y9rIiQa0x4ZmNqr5CQlCZgl9XsNvzo2i/L0QozvIHTKJO5Bu9ldvGa0fs30YhJBx1wk7QT
 4gGMWgMP0EU1469XUlOC+nhoO30p/R2Stz/crhufkM7IOP6SzWG28RQMnlyRVW1pN
X-Received: by 2002:a5d:58c8:: with SMTP id o8mr5506609wrf.361.1629998834003; 
 Thu, 26 Aug 2021 10:27:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwErpc98NO68+MUutfIByeCyHkpxiyIPjG2+peayvoErVmjgBGYYUv9Eg0Fzv8rNcdkUG2+LA==
X-Received: by 2002:a5d:58c8:: with SMTP id o8mr5506587wrf.361.1629998833828; 
 Thu, 26 Aug 2021 10:27:13 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 f17sm3086742wmq.17.2021.08.26.10.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:27:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/3] hw/virtio: Have virtqueue_get_avail_bytes() pass
 caches arg to callees
Date: Thu, 26 Aug 2021 19:26:58 +0200
Message-Id: <20210826172658.2116840-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826172658.2116840-1-philmd@redhat.com>
References: <20210826172658.2116840-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both virtqueue_packed_get_avail_bytes() and
virtqueue_split_get_avail_bytes() access the region cache, but
their caller also does. Simplify by having virtqueue_get_avail_bytes
calling both with RCU lock held, and passing the caches as argument.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
RFC because I'm not sure this is safe enough
---
 hw/virtio/virtio.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 3a1f6c520cb..8237693a567 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -984,28 +984,23 @@ static int virtqueue_split_read_next_desc(VirtIODevice *vdev, VRingDesc *desc,
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
@@ -1124,32 +1119,28 @@ static int virtqueue_packed_read_next_desc(VirtQueue *vq,
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
@@ -1250,6 +1241,8 @@ void virtqueue_get_avail_bytes(VirtQueue *vq, unsigned int *in_bytes,
     uint16_t desc_size;
     VRingMemoryRegionCaches *caches;
 
+    RCU_READ_LOCK_GUARD();
+
     if (unlikely(!vq->vring.desc)) {
         goto err;
     }
@@ -1268,10 +1261,12 @@ void virtqueue_get_avail_bytes(VirtQueue *vq, unsigned int *in_bytes,
 
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A365422DB8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:18:08 +0200 (CEST)
Received: from localhost ([::1]:52324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXn8o-0006yC-VM
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsK-0008Mx-3z
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsD-0004VP-TC
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:00:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q07SOpmoWMqQkr35xa7p8RNS09DTdrXyjxTlsEer860=;
 b=Draewtqr08KKmN3TeWagnjXB3VVgf+e1e3+nT8KWgRPN8tkqAVzWdjU2b/LbFOTsTES7q2
 WYh/ZWxNEetWyMapTUieaKU3CK4o32aUYBk2lhwJnwwSBY69nfGKodA+Oa+SvZVvMVoT96
 pm5WStLZBrpJmuIS20bj6eVVZvPR3HI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-qGpp_669Mfm8DrRlw6lFxQ-1; Tue, 05 Oct 2021 12:00:54 -0400
X-MC-Unique: qGpp_669Mfm8DrRlw6lFxQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 10-20020a05600c240a00b0030d403f24e2so1481770wmp.9
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Q07SOpmoWMqQkr35xa7p8RNS09DTdrXyjxTlsEer860=;
 b=6irRwOlFvKlPTY0oNqYDkbDZXrpFSakkLzn8FDGKLoxLOny2pneR6OTAYAfjvnwGR8
 rBa/Ij4UUvt/HVKZlKRTlerE4SSxdSdXLyfSQ1IfCunnmYbx6KLU9DXw7dblvNoUWXBv
 nm6/B1uno45XhX1WwkCVv82eGbenRRjvGeTrMpbPeX4CquxSvMqUc//WG4uSvrDEcGad
 1eyxaGFPpcpUr22CKTSCpHxslZyKuw88Y4gg0E0912evZM7mrEGTymlnTbB05CJuvHHP
 EqtmhAsr4ulQeNcvKAyr9tKC9+yYaO7mJk+/9/3LzoXO1jyGaytLgPKLSwFLOt3OPXIU
 a39Q==
X-Gm-Message-State: AOAM531MEmVrpNsKoTbaA4x4cneZAqHGBz0vCCXU2xyjJk2TjPi/qdcK
 aSqbfSRNRXcwwmUdwvmS3wa04jDBqDhLYGo65yGQx6Y0YAFPBMTEayt84vPjx9lV2uV6vTkCDCT
 2pmRVylFhyzXTxwJJMYmQgh2oMvT0Yo2lt756ImpZlywfhoI3bRruOjF7cdkH
X-Received: by 2002:a7b:c048:: with SMTP id u8mr4250612wmc.113.1633449652345; 
 Tue, 05 Oct 2021 09:00:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7+3CLrpx7AdXXsn8wIlHw9N4N81vuYyusbvLmwYiKFT9TTzDCoQiFrOBDtoKVchki5QGg7g==
X-Received: by 2002:a7b:c048:: with SMTP id u8mr4250585wmc.113.1633449652059; 
 Tue, 05 Oct 2021 09:00:52 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id z17sm2279396wml.24.2021.10.05.09.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:00:51 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:00:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/57] hw/virtio: Have virtqueue_get_avail_bytes() pass caches
 arg to callees
Message-ID: <20211005155946.513818-3-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Both virtqueue_packed_get_avail_bytes() and
virtqueue_split_get_avail_bytes() access the region cache, but
their caller also does. Simplify by having virtqueue_get_avail_bytes
calling both with RCU lock held, and passing the caches as argument.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210906104318.1569967-4-philmd@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
---
 hw/virtio/virtio.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index dd0ab433b8..cc69a9b881 100644
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
MST



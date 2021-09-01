Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBA13FE00C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:36:48 +0200 (CEST)
Received: from localhost ([::1]:55600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTEF-0001CK-PT
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mLSaY-0006QO-7s
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:55:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mLSaW-0000xy-Nc
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:55:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630511743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2305zQIEpVXdwyQqVLSOiznLrHv27qrxbDP/CU/s2Hc=;
 b=K6CFlJRnt6syoWxis+LV9SUs/gSkwcHp82ELl6GGL2bI6KGX1w0HDJcH0I8FZ09rEJudfg
 gtV+IEoZivNe1XLyGsivNWhdSJIBuQnj11QzOZFYP5sEz1RHRfBPZB+WOo+yvbMwrXB4a8
 yoivyA2Oh2OdWNhv8kCWlUMzvO6WO9Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386--3-wATqVNAmTFBGuc_d3iA-1; Wed, 01 Sep 2021 11:55:42 -0400
X-MC-Unique: -3-wATqVNAmTFBGuc_d3iA-1
Received: by mail-ed1-f69.google.com with SMTP id
 x4-20020a50d9c4000000b003bed5199871so1504117edj.14
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 08:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2305zQIEpVXdwyQqVLSOiznLrHv27qrxbDP/CU/s2Hc=;
 b=SJD4SkkQc/rKPpfVXffcH4Vb0cPbFfb2VLgW48skm05hVr5B/j8vYS7/r9I0L7fXzI
 slqxyjWTuEQlp/dAfmxa9uss7VFCST8qxQ7L2l3UJpnoErYPUWakGl0eQQUTZlyGnhR6
 MoR4EC/SseNF6ZvviZ7v1ft46XRhdSiBaQRwiay3pcXPON5/SvRyAlPOqZkK9hvF7jhb
 iwqkziaCohVOkW4B/PGW7TtJAR1GpB01qdCPGs/2fkcZBk2KIj6gLpGjQS7yfrUBEHYb
 9bkWJjaS7/YJWQ0L8Fal+NLS7Z/jUea0y2kVRrTD68E+aTd98K0v5sWjPyGsiwaRTcnj
 YedA==
X-Gm-Message-State: AOAM533cshnMZByV7pQBMGUmSmlWoc5rOfX8P/OtbcT6NLI+fyVPDHKP
 0srj5kRNCIPt6ZRuAW2y4KzjjQtiVIvTOc8DcUZvU3t0fbCXDjV0sNMrptfuJk2PUmHzLe9VQAc
 p5br/cuOreTFeiNg=
X-Received: by 2002:a17:906:8281:: with SMTP id
 h1mr148966ejx.352.1630511741620; 
 Wed, 01 Sep 2021 08:55:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSZy29T1PKdA8Qz13Wr0L+jfKk3+UjDwNIm5oT8AXAk6cLQoQgdv+XHUGkXnGtpeEvB7c4BQ==
X-Received: by 2002:a17:906:8281:: with SMTP id
 h1mr148940ejx.352.1630511741362; 
 Wed, 01 Sep 2021 08:55:41 -0700 (PDT)
Received: from steredhat (host-79-51-2-59.retail.telecomitalia.it.
 [79.51.2.59])
 by smtp.gmail.com with ESMTPSA id b2sm39118ejj.124.2021.09.01.08.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 08:55:40 -0700 (PDT)
Date: Wed, 1 Sep 2021 17:55:38 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 3/3] hw/virtio: Have virtqueue_get_avail_bytes() pass
 caches arg to callees
Message-ID: <20210901155538.vbtxakrtbjwon3pt@steredhat>
References: <20210826172658.2116840-1-philmd@redhat.com>
 <20210826172658.2116840-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210826172658.2116840-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 26, 2021 at 07:26:58PM +0200, Philippe Mathieu-Daudé wrote:
>Both virtqueue_packed_get_avail_bytes() and
>virtqueue_split_get_avail_bytes() access the region cache, but
>their caller also does. Simplify by having virtqueue_get_avail_bytes
>calling both with RCU lock held, and passing the caches as argument.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
>RFC because I'm not sure this is safe enough

It seems safe to me.

While reviewing I saw that vring_get_region_caches() has
/* Called within rcu_read_lock().  */ comment, but it seems to me that 
we call that function in places where we haven't acquired it, which 
shouldn't be a problem, but should we remove that comment?

Thanks,
Stefano

>---
> hw/virtio/virtio.c | 29 ++++++++++++-----------------
> 1 file changed, 12 insertions(+), 17 deletions(-)
>
>diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>index 3a1f6c520cb..8237693a567 100644
>--- a/hw/virtio/virtio.c
>+++ b/hw/virtio/virtio.c
>@@ -984,28 +984,23 @@ static int virtqueue_split_read_next_desc(VirtIODevice *vdev, VRingDesc *desc,
>     return VIRTQUEUE_READ_DESC_MORE;
> }
>
>+/* Called within rcu_read_lock().  */
> static void virtqueue_split_get_avail_bytes(VirtQueue *vq,
>                             unsigned int *in_bytes, unsigned int *out_bytes,
>-                            unsigned max_in_bytes, unsigned max_out_bytes)
>+                            unsigned max_in_bytes, unsigned max_out_bytes,
>+                            VRingMemoryRegionCaches *caches)
> {
>     VirtIODevice *vdev = vq->vdev;
>     unsigned int max, idx;
>     unsigned int total_bufs, in_total, out_total;
>-    VRingMemoryRegionCaches *caches;
>     MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
>     int64_t len = 0;
>     int rc;
>
>-    RCU_READ_LOCK_GUARD();
>-
>     idx = vq->last_avail_idx;
>     total_bufs = in_total = out_total = 0;
>
>     max = vq->vring.num;
>-    caches = vring_get_region_caches(vq);
>-    if (!caches) {
>-        goto err;
>-    }
>
>     while ((rc = virtqueue_num_heads(vq, idx)) > 0) {
>         MemoryRegionCache *desc_cache = &caches->desc;
>@@ -1124,32 +1119,28 @@ static int virtqueue_packed_read_next_desc(VirtQueue *vq,
>     return VIRTQUEUE_READ_DESC_MORE;
> }
>
>+/* Called within rcu_read_lock().  */
> static void virtqueue_packed_get_avail_bytes(VirtQueue *vq,
>                                              unsigned int *in_bytes,
>                                              unsigned int *out_bytes,
>                                              unsigned max_in_bytes,
>-                                             unsigned max_out_bytes)
>+                                             unsigned max_out_bytes,
>+                                             VRingMemoryRegionCaches *caches)
> {
>     VirtIODevice *vdev = vq->vdev;
>     unsigned int max, idx;
>     unsigned int total_bufs, in_total, out_total;
>     MemoryRegionCache *desc_cache;
>-    VRingMemoryRegionCaches *caches;
>     MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
>     int64_t len = 0;
>     VRingPackedDesc desc;
>     bool wrap_counter;
>
>-    RCU_READ_LOCK_GUARD();
>     idx = vq->last_avail_idx;
>     wrap_counter = vq->last_avail_wrap_counter;
>     total_bufs = in_total = out_total = 0;
>
>     max = vq->vring.num;
>-    caches = vring_get_region_caches(vq);
>-    if (!caches) {
>-        goto err;
>-    }
>
>     for (;;) {
>         unsigned int num_bufs = total_bufs;
>@@ -1250,6 +1241,8 @@ void virtqueue_get_avail_bytes(VirtQueue *vq, unsigned int *in_bytes,
>     uint16_t desc_size;
>     VRingMemoryRegionCaches *caches;
>
>+    RCU_READ_LOCK_GUARD();
>+
>     if (unlikely(!vq->vring.desc)) {
>         goto err;
>     }
>@@ -1268,10 +1261,12 @@ void virtqueue_get_avail_bytes(VirtQueue *vq, unsigned int *in_bytes,
>
>     if (virtio_vdev_has_feature(vq->vdev, VIRTIO_F_RING_PACKED)) {
>         virtqueue_packed_get_avail_bytes(vq, in_bytes, out_bytes,
>-                                         max_in_bytes, max_out_bytes);
>+                                         max_in_bytes, max_out_bytes,
>+                                         caches);
>     } else {
>         virtqueue_split_get_avail_bytes(vq, in_bytes, out_bytes,
>-                                        max_in_bytes, max_out_bytes);
>+                                        max_in_bytes, max_out_bytes,
>+                                        caches);
>     }
>
>     return;
>-- 
>2.31.1
>
>



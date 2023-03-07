Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEEE6AE7D3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:02:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZagP-0007aX-3Q; Tue, 07 Mar 2023 12:01:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZagF-0007Vd-QL
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:00:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZagD-0002ms-UT
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:00:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678208449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/nkJwjBBoX2mGSWlBTCLH6Uj3h/eiP6Eof6C1kMm5cA=;
 b=Ys6pNegtpAL9ZJA/0vw5+MMVJemS7VkGfE9aZSYn+7hgURaqJCewbVRUArr2jEiXnNItzb
 nKKSTPAMoGwdEuG+vJ5WgArg2BIsyNlA21LqKeYxLI1y1O3e6B7Swnm4WA1PbKmdEj3ggE
 6A9jskXxTtoDCNtCenq0dnthyzoCc4o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-vwCJFwCAOmqXYcdcLLSRjg-1; Tue, 07 Mar 2023 12:00:40 -0500
X-MC-Unique: vwCJFwCAOmqXYcdcLLSRjg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi27-20020a05600c3d9b00b003e9d0925341so4999878wmb.8
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:00:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678208439;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/nkJwjBBoX2mGSWlBTCLH6Uj3h/eiP6Eof6C1kMm5cA=;
 b=FTQCoPhq4THEDONP0E+z9IpH+CC/GYN8ethB6uIyNCUushfSZw33vbxmSsDHqzMhkl
 Vla4jPSVebzCKkRov2Fy0dM7TfMru8F9GPzkQvOeslFCPXV3OTh4bW2iZHLfOkabpH5z
 ZGPokgqs6BIuWs8/93FDsSgswz1rE0OIOgwNRmi1rkE1KtlrJbLCBTWnFVok7lidX/N3
 kqGiWrco22hDaJjgFQa8SsJ6LN65hE+mwvzl3xXgbH+/slIuRCh2ALY9xqIbYgQAS9um
 pYJ1FGQbPfbZelBXdhO8/QrqnRspNYqywYts4wa4J6U7w16McToDc+GUly3gTU+laiHM
 3HgA==
X-Gm-Message-State: AO0yUKX0ds0PlJeS4S6VTXY05opsbY+lt9vfUjxXLnLeOjHzltgtWRuF
 lbe2z4nH5woUR9debhkkDgaVf5FQzAh2rYPQLhUttl+OdLSzgBTCzmr+TQJ89nvcZ84bQXpVv3d
 LTmfmoMepwZed/rA=
X-Received: by 2002:a05:6000:1809:b0:2c6:e87f:30cc with SMTP id
 m9-20020a056000180900b002c6e87f30ccmr8777008wrh.48.1678208439373; 
 Tue, 07 Mar 2023 09:00:39 -0800 (PST)
X-Google-Smtp-Source: AK7set8JWxo1GtZGT6DA6pupFQCsF2X7wDl3kMB+4n3/DyBf9GarZSPW5WRWiWbnOu5zGU3aU7w6AQ==
X-Received: by 2002:a05:6000:1809:b0:2c6:e87f:30cc with SMTP id
 m9-20020a056000180900b002c6e87f30ccmr8776997wrh.48.1678208439004; 
 Tue, 07 Mar 2023 09:00:39 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 p10-20020a5d68ca000000b002c59e001631sm13314776wrw.77.2023.03.07.09.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:00:38 -0800 (PST)
Date: Tue, 7 Mar 2023 12:00:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Carlos =?iso-8859-1?Q?L=F3pez?= <clopez@suse.de>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] virtio: fix reachable assertion due to stale value of
 cached region size
Message-ID: <20230307115951-mutt-send-email-mst@kernel.org>
References: <20230302100358.3613-1-clopez@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302100358.3613-1-clopez@suse.de>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Mar 02, 2023 at 11:03:59AM +0100, Carlos López wrote:
> In virtqueue_{split,packed}_get_avail_bytes() descriptors are read
> in a loop via MemoryRegionCache regions and calls to
> vring_{split,packed}_desc_read() - these take a region cache and the
> index of the descriptor to be read.
> 
> For direct descriptors we use a cache provided by the caller, whose
> size matches that of the virtqueue vring. We limit the number of
> descriptors we can read by the size of that vring:
> 
>     max = vq->vring.num;
>     ...
>     MemoryRegionCache *desc_cache = &caches->desc;
> 
> For indirect descriptors, we initialize a new cache and limit the
> number of descriptors by the size of the intermediate descriptor:
> 
>     len = address_space_cache_init(&indirect_desc_cache,
>                                    vdev->dma_as,
>                                    desc.addr, desc.len, false);
>     desc_cache = &indirect_desc_cache;
>     ...
>     max = desc.len / sizeof(VRingDesc);
> 
> However, the first initialization of `max` is done outside the loop
> where we process guest descriptors, while the second one is done
> inside. This means that a sequence of an indirect descriptor followed
> by a direct one will leave a stale value in `max`. If the second
> descriptor's `next` field is smaller than the stale value, but
> greater than the size of the virtqueue ring (and thus the cached
> region), a failed assertion will be triggered in
> address_space_read_cached() down the call chain.
> 
> Fix this by initializing `max` inside the loop in both functions.
> 
> Fixes: 9796d0ac8fb0 ("virtio: use address_space_map/unmap to access descriptors")
> Signed-off-by: Carlos López <clopez@suse.de>
> ---
> v2: simplify patch by removing variable cleanups
> 
>  hw/virtio/virtio.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index f35178f5fc..98c4819fcc 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -1069,7 +1069,7 @@ static void virtqueue_split_get_avail_bytes(VirtQueue *vq,
>                              VRingMemoryRegionCaches *caches)
>  {
>      VirtIODevice *vdev = vq->vdev;
> -    unsigned int max, idx;
> +    unsigned int idx;
>      unsigned int total_bufs, in_total, out_total;
>      MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
>      int64_t len = 0;
> @@ -1078,13 +1078,12 @@ static void virtqueue_split_get_avail_bytes(VirtQueue *vq,
>      idx = vq->last_avail_idx;
>      total_bufs = in_total = out_total = 0;
>  
> -    max = vq->vring.num;
> -
>      while ((rc = virtqueue_num_heads(vq, idx)) > 0) {
>          MemoryRegionCache *desc_cache = &caches->desc;
>          unsigned int num_bufs;
>          VRingDesc desc;
>          unsigned int i;
> +        unsigned int max = vq->vring.num;
>  
>          num_bufs = total_bufs;
>  
> @@ -1206,7 +1205,7 @@ static void virtqueue_packed_get_avail_bytes(VirtQueue *vq,
>                                               VRingMemoryRegionCaches *caches)
>  {
>      VirtIODevice *vdev = vq->vdev;
> -    unsigned int max, idx;
> +    unsigned int idx;
>      unsigned int total_bufs, in_total, out_total;
>      MemoryRegionCache *desc_cache;
>      MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
> @@ -1218,14 +1217,14 @@ static void virtqueue_packed_get_avail_bytes(VirtQueue *vq,
>      wrap_counter = vq->last_avail_wrap_counter;
>      total_bufs = in_total = out_total = 0;
>  
> -    max = vq->vring.num;
> -
>      for (;;) {
>          unsigned int num_bufs = total_bufs;
>          unsigned int i = idx;
>          int rc;
> +        unsigned int max = vq->vring.num;
>  
>          desc_cache = &caches->desc;
> +

OK and let's not add cosmetics with a bugfix unnecessarily?

>          vring_packed_desc_read(vdev, &desc, desc_cache, idx, true);
>          if (!is_desc_avail(desc.flags, wrap_counter)) {
>              break;
> -- 
> 2.35.3



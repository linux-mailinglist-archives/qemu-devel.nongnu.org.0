Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A626A768E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 23:03:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXUXi-0003Uv-EJ; Wed, 01 Mar 2023 17:03:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXUXg-0003Un-F1
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 17:03:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXUXe-00084m-S7
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 17:03:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677708197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DRu/xWCMk4OQTUeWjrgfpWO59a6QNy75U92eeQL+1fQ=;
 b=a1J8aUjOX9FgOlkCktz9c/MMOdbsaqXAs1vUCROyqhc96sKtWSsg2QoYn/Ylx6bqTI5bgE
 b3xgdvN2e+7ePGiJl/2oDB48mV8kuQMxgjh1Vp022rWH5+D1hTFGPL5xhg8e8/qtm+a+CZ
 p1VxNPZ4Lh6Ugm2IJDLjoDkNA5DEx2c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-368-SG8JF4O5PB2h7dNdGycErQ-1; Wed, 01 Mar 2023 17:03:16 -0500
X-MC-Unique: SG8JF4O5PB2h7dNdGycErQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 c7-20020a7bc847000000b003e00be23a70so288579wml.2
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 14:03:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677708195;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DRu/xWCMk4OQTUeWjrgfpWO59a6QNy75U92eeQL+1fQ=;
 b=O0XrlPKBRTVoYTHGYCm2c+7JFwDdwi5z0K7oGwgnTY+PJtI6O/4TdbgciF6K7lqb7N
 wdhdKGD3a9pdpUX5n5S/Qfk0lslpOKXziWtlxCHDDSi14LvWP/zjBxeSSNarVnnotD6t
 KslMTNkF6atpWDkcLWo9YlAwIWtHMTOh+pxnJWYPZxEpmNSY6Dv3hVpQOkZ6KwsoW9tS
 GMHEdJw5HnA8EjZ7RwK78pLjLVlI9iNOXsahdAcRg41+suVr0pAbsEcqAT4C2aNQDXXo
 E9WYVpD2pWLtr0q4qjLMVuBqXbvoyhpXRLnR0d/QQr3dfAXNnvlLDRU5YBfbOELXCH7s
 LauQ==
X-Gm-Message-State: AO0yUKUhQ8PaexaIPrCzig/1yqWxx49SLq2H8jh9YBFd0fxZD6QQ+qbp
 er8kKHJ1rJpsKZafw7PArssc7yC4PjRRxrKhfI05ItNBmuG5C9fKL1hBxRYBAIGuVibwsyewVKW
 Uulh9ZhGC9ncv/gE=
X-Received: by 2002:a05:600c:81e:b0:3eb:3692:644e with SMTP id
 k30-20020a05600c081e00b003eb3692644emr5988989wmp.33.1677708195009; 
 Wed, 01 Mar 2023 14:03:15 -0800 (PST)
X-Google-Smtp-Source: AK7set+qtP7cyARwBMKjM0+oO2QOy0J0WUF4IS2HdL5Sm9cYNXESwKmz7ty3Fmtr6s8xYngHv5xSdw==
X-Received: by 2002:a05:600c:81e:b0:3eb:3692:644e with SMTP id
 k30-20020a05600c081e00b003eb3692644emr5988978wmp.33.1677708194631; 
 Wed, 01 Mar 2023 14:03:14 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 l15-20020a05600012cf00b002be505ab59asm13770891wrx.97.2023.03.01.14.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 14:03:14 -0800 (PST)
Date: Wed, 1 Mar 2023 17:03:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Carlos =?iso-8859-1?Q?L=F3pez?= <clopez@suse.de>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] virtio: fix reachable assertion due to stale value of
 cached region size
Message-ID: <20230301170016-mutt-send-email-mst@kernel.org>
References: <20230215221444.29845-1-clopez@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230215221444.29845-1-clopez@suse.de>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Feb 15, 2023 at 11:14:46PM +0100, Carlos López wrote:
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
>  hw/virtio/virtio.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index f35178f5fc..db70c4976e 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -1071,6 +1071,7 @@ static void virtqueue_split_get_avail_bytes(VirtQueue *vq,
>      VirtIODevice *vdev = vq->vdev;
>      unsigned int max, idx;
>      unsigned int total_bufs, in_total, out_total;
> +    MemoryRegionCache *desc_cache;

why are you moving desc_cache here?

>      MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
>      int64_t len = 0;
>      int rc;
> @@ -1078,15 +1079,13 @@ static void virtqueue_split_get_avail_bytes(VirtQueue *vq,
>      idx = vq->last_avail_idx;
>      total_bufs = in_total = out_total = 0;
>  
> -    max = vq->vring.num;
> -
>      while ((rc = virtqueue_num_heads(vq, idx)) > 0) {
> -        MemoryRegionCache *desc_cache = &caches->desc;
> -        unsigned int num_bufs;
> +        unsigned int num_bufs = total_bufs;
>          VRingDesc desc;
>          unsigned int i;
>  
> -        num_bufs = total_bufs;

nice cleanup but not a bugfix. Keep cleanups separate from fixes pls.

> +        desc_cache = &caches->desc;

init as part of declaration seems cleaner.

> +        max = vq->vring.num;
>  

can we move declaration of max here within the loop?
will make sure the problem does not recur.

>          if (!virtqueue_get_head(vq, idx++, &i)) {
>              goto err;
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
>  
>          desc_cache = &caches->desc;
> +        max = vq->vring.num;
> +


same question can we move declaration into the loop?

>          vring_packed_desc_read(vdev, &desc, desc_cache, idx, true);
>          if (!is_desc_avail(desc.flags, wrap_counter)) {
>              break;
> -- 
> 2.35.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD8844D333
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 09:29:09 +0100 (CET)
Received: from localhost ([::1]:38036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml5SG-0003uI-6N
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 03:29:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ml5QX-00031f-3J
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 03:27:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ml5QQ-000561-3T
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 03:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636619233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TTPg2UPzRNte4/na9y9JvufkgegGrd3/aAL9CRoKR3A=;
 b=D8Y2aD7rmwn/epPVQ//PK6sFnsjbrSlWqvVp60TSpkWtTp3EqEts+zGff7OqHEjfIKffwr
 q6DdlP2QyYHE/eF9W7BcW5PGezE5bmMWOBYukBaRdGVjCwy/OKv4ZxzcR2az7sUSnwWHe5
 UUN59LQUO/3/DSpvhIFd6dQE10YBoOk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-ysEXMN_2OUyos5JCRqH6HQ-1; Thu, 11 Nov 2021 03:27:12 -0500
X-MC-Unique: ysEXMN_2OUyos5JCRqH6HQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 g80-20020a1c2053000000b003331a764709so4425450wmg.2
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 00:27:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TTPg2UPzRNte4/na9y9JvufkgegGrd3/aAL9CRoKR3A=;
 b=svq0SsNHgWsYSMfBsCZaeK/puQWcS4N358YFlZDCnt5+zgCWOhLOzTUOMJ15yCjO5Y
 QiVCqlRBQ43wpOlWeICRqoAd33xMYdaYGmcYZCWsJs0DwRirHFACiz4hYdmrSTmFKOi1
 gaVAgs22NJeDzCq4BgLv08MeoOQFGaPebOZLukdNGSRy7fD2i2HiBVARsYeqkm2WFA3c
 Zhh6O0iIygoKSTqGYm9nQrRD3Bz39jW5zvrHgC4SIcBD0sqfqB4tRpz63FLbSS4A+RIB
 QMtBFllYnNGVVhEDZnnx87p41x5Zq6YEWNFZzJx4WmiEGxvgmCBkj1JQN9zVLkf8IfzK
 dB6Q==
X-Gm-Message-State: AOAM532cy8hXmiMnS7x5Pcf6SRBkxEyzhKQUve7iVjyZE1dI64pLdv2U
 oZQCYzMNZJN9HHM0DJjgE4SbMo+3V65WS5no2nVWn+p9Ax64HAdU3KCaAQwLYZxq4dprVheBxIp
 +2lwGHSeBIMVQ/Lk=
X-Received: by 2002:a05:600c:1993:: with SMTP id
 t19mr23773136wmq.21.1636619231055; 
 Thu, 11 Nov 2021 00:27:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2LvQxbp3jmSxgKDG7L0jfr/RSzq7tVa6hd49jArd7AWK7zz+caiicuLWgIXrV/AM4UKPa3w==
X-Received: by 2002:a05:600c:1993:: with SMTP id
 t19mr23773112wmq.21.1636619230842; 
 Thu, 11 Nov 2021 00:27:10 -0800 (PST)
Received: from redhat.com ([2.55.129.247])
 by smtp.gmail.com with ESMTPSA id w1sm7965925wmc.19.2021.11.11.00.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 00:27:10 -0800 (PST)
Date: Thu, 11 Nov 2021 03:27:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 1/2] virtio: use virtio accessor to access packed
 descriptor flags
Message-ID: <20211111032649-mutt-send-email-mst@kernel.org>
References: <20211111063854.29060-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211111063854.29060-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: eperezma@redhat.com, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 02:38:53PM +0800, Jason Wang wrote:
> We used to access packed descriptor flags via
> address_space_{write|read}_cached(). When we hit the cache, memcpy()
> is used which is not an atomic operation which may lead a wrong value
> is read or wrote.

Could you clarify where's the memcpy that you see?
Thanks!

> So this patch switches to use virito_{stw|lduw}_phys_cached() to make
> sure the aceess is atomic.
> 
> Fixes: 86044b24e865f ("virtio: basic packed virtqueue support")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/virtio/virtio.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index cc69a9b881..939bcbfeb9 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -507,11 +507,9 @@ static void vring_packed_desc_read_flags(VirtIODevice *vdev,
>                                           MemoryRegionCache *cache,
>                                           int i)
>  {
> -    address_space_read_cached(cache,
> -                              i * sizeof(VRingPackedDesc) +
> -                              offsetof(VRingPackedDesc, flags),
> -                              flags, sizeof(*flags));
> -    virtio_tswap16s(vdev, flags);
> +    hwaddr off = i * sizeof(VRingPackedDesc) + offsetof(VRingPackedDesc, flags);
> +
> +    *flags = virtio_lduw_phys_cached(vdev, cache, off);
>  }
>  
>  static void vring_packed_desc_read(VirtIODevice *vdev,
> @@ -564,8 +562,7 @@ static void vring_packed_desc_write_flags(VirtIODevice *vdev,
>  {
>      hwaddr off = i * sizeof(VRingPackedDesc) + offsetof(VRingPackedDesc, flags);
>  
> -    virtio_tswap16s(vdev, &desc->flags);
> -    address_space_write_cached(cache, off, &desc->flags, sizeof(desc->flags));
> +    virtio_stw_phys_cached(vdev, cache, off, desc->flags);
>      address_space_cache_invalidate(cache, off, sizeof(desc->flags));
>  }
>  
> -- 
> 2.25.1



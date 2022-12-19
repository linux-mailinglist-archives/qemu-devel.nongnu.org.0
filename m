Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030A4650A66
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:52:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Dkh-00078D-8v; Mon, 19 Dec 2022 05:52:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7Dkd-000783-2n
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:52:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7Dkb-0004PA-G0
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:52:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671447124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UwjWIGB9tbb6ldoLsEZYEWeESUwguUx/jAdyat2R3hQ=;
 b=RWY6MI0UOflV+vYKRKwK1ww0Z2IilRT78YCpRYynJ6r4gDIo5vLVhqXvzrQj462uitQwSG
 Ki+kvAP9vINjPMDjj9SOawICNrGZnxaify8DRX1hu8fLrB428L1PXRM89Ha4T5iLxrP42P
 uU7H9fbVR/AiX/DgkPwb+D1pz47rTG8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-499-F-mVxPaAMRWJqQMnN9n2ng-1; Mon, 19 Dec 2022 05:51:56 -0500
X-MC-Unique: F-mVxPaAMRWJqQMnN9n2ng-1
Received: by mail-qv1-f70.google.com with SMTP id
 y5-20020a0cec05000000b004f98514e3fcso5386654qvo.18
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 02:51:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UwjWIGB9tbb6ldoLsEZYEWeESUwguUx/jAdyat2R3hQ=;
 b=2mZXI/exCUyUhBpy2mwDr9vDNab3t/vy9cZLHNbVyVYm8ylUKfdYooJTk2RGyn/Wxa
 En/0r9vkrKr9KqQcy1UqFGXcvotLyC2ZysEngQTZEhImpNBzak3JCie8MlMcav3/6DkV
 H7rpenWV53LYQ0sDyFU06whd6O09te6lA2WYgJ2Fj1SnCwl1TDSsg8pAeItILMrBReah
 wzchEIwP+LxiDG7WsE9Q9Np6ZRXpnfhL9kuA8FPlxj6SIMySkqhzK+BL6dYWHYd95Aeo
 GZUL46mIeGxSX/WPIZYJo2IFNAblw99oM5B8ddGNLWkFKwuM88I0w0eq2LDFgG/L6jGO
 P+WA==
X-Gm-Message-State: ANoB5plZ7sfC3sKY9Hq162BzwPxgU9DDTDPI4l1qs80Xbr4PHkoxJpJD
 knaeXg46SPTEIt7GcpPZOllDW/OJcu7FZlUve94MXIU+EoINgYV8JWpJLGFsC/3vQouDwfSRYcL
 nQ1ZdGAkaXNJUBlg=
X-Received: by 2002:a05:622a:2586:b0:3a7:fdfa:7ee with SMTP id
 cj6-20020a05622a258600b003a7fdfa07eemr56982662qtb.43.1671447115902; 
 Mon, 19 Dec 2022 02:51:55 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6FgIXO8GjP5q65HrUxxgleXJrhpEbpDflTLgwoSx7DF+H0AjVXfCiVGW8FhsnOoUkXketh2Q==
X-Received: by 2002:a05:622a:2586:b0:3a7:fdfa:7ee with SMTP id
 cj6-20020a05622a258600b003a7fdfa07eemr56982653qtb.43.1671447115662; 
 Mon, 19 Dec 2022 02:51:55 -0800 (PST)
Received: from redhat.com ([45.144.113.29]) by smtp.gmail.com with ESMTPSA id
 a3-20020a05620a438300b006bbf85cad0fsm6694218qkp.20.2022.12.19.02.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 02:51:55 -0800 (PST)
Date: Mon, 19 Dec 2022 05:51:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Chenyi Qiang <chenyi.qiang@intel.com>
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] virtio-mem: Fix the bitmap index of the section offset
Message-ID: <20221219055124-mutt-send-email-mst@kernel.org>
References: <20221216062231.11181-1-chenyi.qiang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216062231.11181-1-chenyi.qiang@intel.com>
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

On Fri, Dec 16, 2022 at 02:22:31PM +0800, Chenyi Qiang wrote:
> vmem->bitmap indexes the memory region of the virtio-mem backend at a
> granularity of block_size. To calculate the index of target section offset,
> the block_size should be divided instead of the bitmap_size.
> 
> Fixes: 2044969f0b ("virtio-mem: Implement RamDiscardManager interface")
> Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

I see David's queueing this.

> ---
>  hw/virtio/virtio-mem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index ed170def48..e19ee817fe 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -235,7 +235,7 @@ static int virtio_mem_for_each_plugged_section(const VirtIOMEM *vmem,
>      uint64_t offset, size;
>      int ret = 0;
>  
> -    first_bit = s->offset_within_region / vmem->bitmap_size;
> +    first_bit = s->offset_within_region / vmem->block_size;
>      first_bit = find_next_bit(vmem->bitmap, vmem->bitmap_size, first_bit);
>      while (first_bit < vmem->bitmap_size) {
>          MemoryRegionSection tmp = *s;
> @@ -267,7 +267,7 @@ static int virtio_mem_for_each_unplugged_section(const VirtIOMEM *vmem,
>      uint64_t offset, size;
>      int ret = 0;
>  
> -    first_bit = s->offset_within_region / vmem->bitmap_size;
> +    first_bit = s->offset_within_region / vmem->block_size;
>      first_bit = find_next_zero_bit(vmem->bitmap, vmem->bitmap_size, first_bit);
>      while (first_bit < vmem->bitmap_size) {
>          MemoryRegionSection tmp = *s;
> -- 
> 2.17.1



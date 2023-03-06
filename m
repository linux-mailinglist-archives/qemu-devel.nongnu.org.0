Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A9D6AC7D8
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 17:25:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZDdf-0003k1-O4; Mon, 06 Mar 2023 11:24:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZDdR-0003hg-CE
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:24:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZDdO-0002x4-H4
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678119852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QyYVeGkSt8riZnCBH7hAyIrXvyqp/nlT212VL9P9nGc=;
 b=Li48ZYbiIZnE70FwYXUQCy/+sk0VFULwDHbSwk3EB8d6cLYJcHQVVBStcjAwSm+MspiL+2
 FeB0w0UGmxEpzVdCrw/xb8A/3w6wlAGtOa0UcEZ9doRlM0Ekrf8vBE57l7irNJH4kc35vh
 OjtmO24vHVQU8+sItrNYeaMSRjYFAAc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-uFwYbvGUN267CdstvMxIgw-1; Mon, 06 Mar 2023 11:24:10 -0500
X-MC-Unique: uFwYbvGUN267CdstvMxIgw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ba28-20020a0560001c1c00b002cc6d1f0c06so1628375wrb.17
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 08:24:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678119849;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QyYVeGkSt8riZnCBH7hAyIrXvyqp/nlT212VL9P9nGc=;
 b=ySrvsg0PKnMho7aKVTTHy9TYY8FcS2oHJ4Hjdn12PWmaAzeao2G6932tpfLn9iAUuc
 ZVbt4F1a+GSbTXnPa8MEK/cSxz7G/tfSU9I32ON+8gk2McVMmgpFcml63igsVQuvms/i
 veNsFh7bBS4C84FF1oMLPG02jjIVFxt2H+pFO5t+9HrrdUTDmYLovGv9QRR2GnHZ7piI
 AdQbCI71NYii0dEcCg5YG0H5GdfNWXceFqzzlMZmvUR2X8K2c6v4YVgqNWeVfpYylUfV
 BtmIfdOJgdigGfnhGkMmEao7ZIvYG5uod5QoPhuW5s0wg43qxSWiVVwPHViub3k/wTNF
 vUvA==
X-Gm-Message-State: AO0yUKVslrB8E84Yco4G3VNVvdrLUCySMxG9kfCgFtyqAHYzslDbge+l
 7c8r4OI9yDBIQ+7YIutX7UbC91aBK26gblOrCl+DaTWTm02yexV7Lh9z54gTfHnfOfN0RAES3FR
 gOl420Zg8rWCE9/k=
X-Received: by 2002:a05:6000:c4:b0:2c7:5247:e496 with SMTP id
 q4-20020a05600000c400b002c75247e496mr6247354wrx.60.1678119849478; 
 Mon, 06 Mar 2023 08:24:09 -0800 (PST)
X-Google-Smtp-Source: AK7set+Gu/5z3xDgHRZj1askcQypdy43r3UtFtyltXnm7ytCa930wRNQcXY+mbJlkeOBdX0+UAhWtg==
X-Received: by 2002:a05:6000:c4:b0:2c7:5247:e496 with SMTP id
 q4-20020a05600000c400b002c75247e496mr6247338wrx.60.1678119849181; 
 Mon, 06 Mar 2023 08:24:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a5d4e07000000b002c5694aef92sm10357530wrt.21.2023.03.06.08.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 08:24:08 -0800 (PST)
Message-ID: <75ddfe1c-8ea7-d5b7-4998-88fb6a7b4bde@redhat.com>
Date: Mon, 6 Mar 2023 17:24:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 09/13] vfio/common: Extract code from
 vfio_get_dirty_bitmap() to new function
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-10-joao.m.martins@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230304014343.33646-10-joao.m.martins@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/4/23 02:43, Joao Martins wrote:
> From: Avihai Horon <avihaih@nvidia.com>
> 
> Extract the VFIO_IOMMU_DIRTY_PAGES ioctl code in vfio_get_dirty_bitmap()
> to its own function.
> 
> This will help the code to be more readable after next patch will add
> device dirty page bitmap sync functionality.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>



Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

> ---
>   hw/vfio/common.c | 57 +++++++++++++++++++++++++++++-------------------
>   1 file changed, 35 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index aa0df0604704..b0c7d03279ab 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -1579,26 +1579,13 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
>       }
>   }
>   
> -static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
> -                                 uint64_t size, ram_addr_t ram_addr)
> +static int vfio_query_dirty_bitmap(VFIOContainer *container, VFIOBitmap *vbmap,
> +                                   hwaddr iova, hwaddr size)
>   {
>       struct vfio_iommu_type1_dirty_bitmap *dbitmap;
>       struct vfio_iommu_type1_dirty_bitmap_get *range;
> -    VFIOBitmap vbmap;
>       int ret;
>   
> -    if (!container->dirty_pages_supported) {
> -        cpu_physical_memory_set_dirty_range(ram_addr, size,
> -                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
> -                                            DIRTY_CLIENTS_NOCODE);
> -        return 0;
> -    }
> -
> -    ret = vfio_bitmap_alloc(&vbmap, size);
> -    if (ret) {
> -        return -errno;
> -    }
> -
>       dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
>   
>       dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
> @@ -1613,8 +1600,8 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>        * to qemu_real_host_page_size.
>        */
>       range->bitmap.pgsize = qemu_real_host_page_size();
> -    range->bitmap.size = vbmap.size;
> -    range->bitmap.data = (__u64 *)vbmap.bitmap;
> +    range->bitmap.size = vbmap->size;
> +    range->bitmap.data = (__u64 *)vbmap->bitmap;
>   
>       ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
>       if (ret) {
> @@ -1622,16 +1609,42 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>           error_report("Failed to get dirty bitmap for iova: 0x%"PRIx64
>                   " size: 0x%"PRIx64" err: %d", (uint64_t)range->iova,
>                   (uint64_t)range->size, errno);
> -        goto err_out;
> +    }
> +
> +    g_free(dbitmap);
> +
> +    return ret;
> +}
> +
> +static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
> +                                 uint64_t size, ram_addr_t ram_addr)
> +{
> +    VFIOBitmap vbmap;
> +    int ret;
> +
> +    if (!container->dirty_pages_supported) {
> +        cpu_physical_memory_set_dirty_range(ram_addr, size,
> +                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
> +                                            DIRTY_CLIENTS_NOCODE);
> +        return 0;
> +    }
> +
> +    ret = vfio_bitmap_alloc(&vbmap, size);
> +    if (ret) {
> +        return -errno;
> +    }
> +
> +    ret = vfio_query_dirty_bitmap(container, &vbmap, iova, size);
> +    if (ret) {
> +        goto out;
>       }
>   
>       cpu_physical_memory_set_dirty_lebitmap(vbmap.bitmap, ram_addr,
>                                              vbmap.pages);
>   
> -    trace_vfio_get_dirty_bitmap(container->fd, range->iova, range->size,
> -                                range->bitmap.size, ram_addr);
> -err_out:
> -    g_free(dbitmap);
> +    trace_vfio_get_dirty_bitmap(container->fd, iova, size, vbmap.size,
> +                                ram_addr);
> +out:
>       g_free(vbmap.bitmap);
>   
>       return ret;



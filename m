Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028F26AC0B3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:22:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAlx-0000im-N6; Mon, 06 Mar 2023 08:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZAlt-0000ie-Qk
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:20:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZAlq-0005JD-SN
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:20:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678108853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vRyo0YafZk8IhCb4dYLAB4HzY+5zwudH2Sh1pv9lHBc=;
 b=NVuLPpYNBpRdcFoIZbYh38eUahu2t58ANLYYfPHsbtXBAs7XsNcWA4xuL1az3ZKuSa077t
 99LyP9Uub/1d/4TBmSZzFZJ/FLlirecsmJ7YxcliWfXuSBPAaXGHusQAQnbTw3E5A/Midy
 MHTUmG4t3kpbnFpYuMvT0MzgoUvS9/M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-KoLUv6vmPruB0-gRrCqw7Q-1; Mon, 06 Mar 2023 08:20:52 -0500
X-MC-Unique: KoLUv6vmPruB0-gRrCqw7Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 az12-20020a05600c600c00b003e8910ec2fdso3553446wmb.6
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:20:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678108851;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vRyo0YafZk8IhCb4dYLAB4HzY+5zwudH2Sh1pv9lHBc=;
 b=q9Z91KUrS95/L7pT8CxQpQtsEyWxcXUZAEA34o90cC5rVYMjjJXHNHop14SfRuQ2yC
 3T/oDEd77aOPiQ5WDE15ZsxJ46YBI4tEuHfGmU0RNgoq++TZjq1DP7kp/+jY3o8f/328
 201NmCaEIMEOwAclwkVpHnVRJeXvESUYRyOi+ytZ9QaiXytxYwrPsUw8hM8Kytz3Jg82
 cinYjsPXuhWt7D1RQH+paJRqf0vMyYiIIJHFc5yC+z9LO1yqfbumEbVHsFOaub/1kR24
 wk0iLboyix1Dlm3CMXniXF12fMlBppxMLVSKrorSsWw7v8QU6aRMubiTnMbPLol+FPh3
 cMBQ==
X-Gm-Message-State: AO0yUKVsjRiBvQ/fLR9mZ7HpRVrM7PxYPlZxw5IG4EwlEdGv6k2JNLxI
 uABFQjrydDUtQXTSeO4yTS+ArtKW5dXrAv17r2IrCwvzQcVQdy/rEiBtBmiEpZN9MACvgS3KXpZ
 bMybnZkuI9G0coro=
X-Received: by 2002:a05:600c:3d8f:b0:3ea:f75d:4626 with SMTP id
 bi15-20020a05600c3d8f00b003eaf75d4626mr8985501wmb.38.1678108851478; 
 Mon, 06 Mar 2023 05:20:51 -0800 (PST)
X-Google-Smtp-Source: AK7set8jotgGiwiimk5fI88lIE0K1ZLnlXVttPWjwWTIWxHBn752UmFoK404caRqul9xMd0AgOSAzg==
X-Received: by 2002:a05:600c:3d8f:b0:3ea:f75d:4626 with SMTP id
 bi15-20020a05600c3d8f00b003eaf75d4626mr8985474wmb.38.1678108851135; 
 Mon, 06 Mar 2023 05:20:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 z26-20020a1c4c1a000000b003eb395a8280sm14047877wmf.37.2023.03.06.05.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:20:50 -0800 (PST)
Message-ID: <b83fceb6-7d9b-1b04-dd60-38cd0ddf5c44@redhat.com>
Date: Mon, 6 Mar 2023 14:20:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 04/13] vfio/common: Add VFIOBitmap and alloc function
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-5-joao.m.martins@oracle.com>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230304014343.33646-5-joao.m.martins@oracle.com>
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
> There are already two places where dirty page bitmap allocation and
> calculations are done in open code. With device dirty page tracking
> being added in next patches, there are going to be even more places.
> 
> To avoid code duplication, introduce VFIOBitmap struct and corresponding
> alloc function and use them where applicable.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

One minor comment, only in case you respin,

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

> ---
>   hw/vfio/common.c | 75 +++++++++++++++++++++++++++++-------------------
>   1 file changed, 46 insertions(+), 29 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 4c801513136a..151e7f40b73d 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -320,6 +320,27 @@ const MemoryRegionOps vfio_region_ops = {
>    * Device state interfaces
>    */
>   
> +typedef struct {
> +    unsigned long *bitmap;
> +    hwaddr size;
> +    hwaddr pages;
> +} VFIOBitmap;
> +
> +static int vfio_bitmap_alloc(VFIOBitmap *vbmap, hwaddr size)
> +{
> +    vbmap->pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
> +    vbmap->size = ROUND_UP(vbmap->pages, sizeof(__u64) * BITS_PER_BYTE) /
> +                                         BITS_PER_BYTE;
> +    vbmap->bitmap = g_try_malloc0(vbmap->size);
> +    if (!vbmap->bitmap) {
> +        errno = ENOMEM;
> +
> +        return -errno;

vfio_bitmap_alloc() could simply return ENOMEM now.

> +    }
> +
> +    return 0;
> +}
> +
>   bool vfio_mig_active(void)
>   {
>       VFIOGroup *group;
> @@ -468,9 +489,14 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>   {
>       struct vfio_iommu_type1_dma_unmap *unmap;
>       struct vfio_bitmap *bitmap;
> -    uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
> +    VFIOBitmap vbmap;
>       int ret;
>   
> +    ret = vfio_bitmap_alloc(&vbmap, size);
> +    if (ret) {
> +        return -errno;
> +    }
> +
>       unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
>   
>       unmap->argsz = sizeof(*unmap) + sizeof(*bitmap);
> @@ -484,35 +510,28 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>        * qemu_real_host_page_size to mark those dirty. Hence set bitmap_pgsize
>        * to qemu_real_host_page_size.
>        */
> -
>       bitmap->pgsize = qemu_real_host_page_size();
> -    bitmap->size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
> -                   BITS_PER_BYTE;
> +    bitmap->size = vbmap.size;
> +    bitmap->data = (__u64 *)vbmap.bitmap;
>   
> -    if (bitmap->size > container->max_dirty_bitmap_size) {
> -        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64,
> -                     (uint64_t)bitmap->size);
> +    if (vbmap.size > container->max_dirty_bitmap_size) {
> +        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64, vbmap.size);
>           ret = -E2BIG;
>           goto unmap_exit;
>       }
>   
> -    bitmap->data = g_try_malloc0(bitmap->size);
> -    if (!bitmap->data) {
> -        ret = -ENOMEM;
> -        goto unmap_exit;
> -    }
> -
>       ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
>       if (!ret) {
> -        cpu_physical_memory_set_dirty_lebitmap((unsigned long *)bitmap->data,
> -                iotlb->translated_addr, pages);
> +        cpu_physical_memory_set_dirty_lebitmap(vbmap.bitmap,
> +                iotlb->translated_addr, vbmap.pages);
>       } else {
>           error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %m");
>       }
>   
> -    g_free(bitmap->data);
>   unmap_exit:
>       g_free(unmap);
> +    g_free(vbmap.bitmap);
> +
>       return ret;
>   }
>   
> @@ -1329,7 +1348,7 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>   {
>       struct vfio_iommu_type1_dirty_bitmap *dbitmap;
>       struct vfio_iommu_type1_dirty_bitmap_get *range;
> -    uint64_t pages;
> +    VFIOBitmap vbmap;
>       int ret;
>   
>       if (!container->dirty_pages_supported) {
> @@ -1339,6 +1358,11 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>           return 0;
>       }
>   
> +    ret = vfio_bitmap_alloc(&vbmap, size);
> +    if (ret) {
> +        return -errno;
> +    }
> +
>       dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
>   
>       dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
> @@ -1353,15 +1377,8 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>        * to qemu_real_host_page_size.
>        */
>       range->bitmap.pgsize = qemu_real_host_page_size();
> -
> -    pages = REAL_HOST_PAGE_ALIGN(range->size) / qemu_real_host_page_size();
> -    range->bitmap.size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
> -                                         BITS_PER_BYTE;
> -    range->bitmap.data = g_try_malloc0(range->bitmap.size);
> -    if (!range->bitmap.data) {
> -        ret = -ENOMEM;
> -        goto err_out;
> -    }
> +    range->bitmap.size = vbmap.size;
> +    range->bitmap.data = (__u64 *)vbmap.bitmap;
>   
>       ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
>       if (ret) {
> @@ -1372,14 +1389,14 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>           goto err_out;
>       }
>   
> -    cpu_physical_memory_set_dirty_lebitmap((unsigned long *)range->bitmap.data,
> -                                            ram_addr, pages);
> +    cpu_physical_memory_set_dirty_lebitmap(vbmap.bitmap, ram_addr,
> +                                           vbmap.pages);
>   
>       trace_vfio_get_dirty_bitmap(container->fd, range->iova, range->size,
>                                   range->bitmap.size, ram_addr);
>   err_out:
> -    g_free(range->bitmap.data);
>       g_free(dbitmap);
> +    g_free(vbmap.bitmap);
>   
>       return ret;
>   }



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A135D6A44C1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:39:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeCV-00063I-Bf; Mon, 27 Feb 2023 09:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pWeCN-0005QX-Ft
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pWeCL-0000ei-G2
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677506988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Drwue0oif1xRoiUI9cnoovSMxO/ZrWq6JIFR1JDu7rw=;
 b=Ema92fJ5t5wa41vrtSQdFrSsPqQVNOtvvLT+yNproEQgCV1K+KFsMGMindPwy8eZKa+QW4
 2OMSxcfLEQpDjWAoSpk/g9mqFiOD4FMKJzOjH1xE/HruvYgA7SfjmwQ+mNXDnkSmMJfQV5
 +q1ZxmoH0e1uoed4mN6jM68sTigV48g=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-539-yklImrtUNcum_HgrdA9jVQ-1; Mon, 27 Feb 2023 09:09:47 -0500
X-MC-Unique: yklImrtUNcum_HgrdA9jVQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 8-20020a370508000000b00724fd33cb3eso4053121qkf.14
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:09:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Drwue0oif1xRoiUI9cnoovSMxO/ZrWq6JIFR1JDu7rw=;
 b=B5MTMrLg1tKeg60BN5On5FcJDfGwMquLyA3KDinvwtgRBnF2eP3HfOesXeTwKUJUd6
 CMO46TAAsFAB6/HOLegVG2ZUAuCyHu/Ehyawy7WYAcVE6b0wypQgnD9YM/vsBkVt+/F9
 l0lgw1b9TuxrFy6w7CNR5ftif747R/TkSHDJ/CwWxmTfUxQIeTX77CfyRrWQy7iqrZCT
 K4NR+CvQrxMUoGsh+7VKOXO7WOobwW8dvoGWOaVOSwy9v8OROaT/hKlfWazak/TbYPAc
 tkCHugEISfZWSlx1/sNCDC0mvH0aXvbC4tDc3zA+kXOK+qLtb9CfJsRYus/AN7a/7Xgi
 nyXQ==
X-Gm-Message-State: AO0yUKVaSepO2kj4DKbb2nFqe7uXuIjGP1bzyVPHqAGCp8Et1tQT7lp5
 7mWHTAuxcwyag/fm2aGjjhVYEAYMzoMEaSIAznhywSUbQAZocd8efI5m6x4Bxl3MN49b+KKSXCq
 2mspognVPsp/Qe1g=
X-Received: by 2002:a05:622a:306:b0:3bf:cd42:7724 with SMTP id
 q6-20020a05622a030600b003bfcd427724mr12815074qtw.11.1677506986666; 
 Mon, 27 Feb 2023 06:09:46 -0800 (PST)
X-Google-Smtp-Source: AK7set+fDT+shqgWai4ji925VGbdBZTok4GRoIiFfdovOxaWQlAGW6WdIDcwe8eYdSd09oiuQzk6qw==
X-Received: by 2002:a05:622a:306:b0:3bf:cd42:7724 with SMTP id
 q6-20020a05622a030600b003bfcd427724mr12815025qtw.11.1677506986292; 
 Mon, 27 Feb 2023 06:09:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 r135-20020a37448d000000b00706bc44fda8sm4945050qka.79.2023.02.27.06.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 06:09:45 -0800 (PST)
Message-ID: <55b623e9-3f5a-1353-280c-e6012b5924e6@redhat.com>
Date: Mon, 27 Feb 2023 15:09:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 07/20] vfio/common: Add VFIOBitmap and (de)alloc
 functions
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-8-avihaih@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230222174915.5647-8-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/22/23 18:49, Avihai Horon wrote:
> There are already two places where dirty page bitmap allocation and
> calculations are done in open code. With device dirty page tracking
> being added in next patches, there are going to be even more places.
> 
> To avoid code duplication, introduce VFIOBitmap struct and corresponding
> alloc and dealloc functions and use them where applicable.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>   hw/vfio/common.c | 89 ++++++++++++++++++++++++++++++++----------------
>   1 file changed, 60 insertions(+), 29 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index ac93b85632..84f08bdbbb 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -320,6 +320,41 @@ const MemoryRegionOps vfio_region_ops = {
>    * Device state interfaces
>    */
>   
> +typedef struct {
> +    unsigned long *bitmap;
> +    hwaddr size;
> +    hwaddr pages;
> +} VFIOBitmap;
> +
> +static VFIOBitmap *vfio_bitmap_alloc(hwaddr size)
> +{
> +    VFIOBitmap *vbmap = g_try_new0(VFIOBitmap, 1);

I think using g_malloc0() for the VFIOBitmap should be fine. If QEMU can
not allocate a couple of bytes, we are in trouble anyway.

Thanks,

C.


> +    if (!vbmap) {
> +        errno = ENOMEM;
> +
> +        return NULL;
> +    }
> +
> +    vbmap->pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
> +    vbmap->size = ROUND_UP(vbmap->pages, sizeof(__u64) * BITS_PER_BYTE) /
> +                                         BITS_PER_BYTE;
> +    vbmap->bitmap = g_try_malloc0(vbmap->size);
> +    if (!vbmap->bitmap) {
> +        g_free(vbmap);
> +        errno = ENOMEM;
> +
> +        return NULL;
> +    }
> +
> +    return vbmap;
> +}
> +
> +static void vfio_bitmap_dealloc(VFIOBitmap *vbmap)
> +{
> +    g_free(vbmap->bitmap);
> +    g_free(vbmap);
> +}
> +
>   bool vfio_mig_active(void)
>   {
>       VFIOGroup *group;
> @@ -470,9 +505,14 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>   {
>       struct vfio_iommu_type1_dma_unmap *unmap;
>       struct vfio_bitmap *bitmap;
> -    uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
> +    VFIOBitmap *vbmap;
>       int ret;
>   
> +    vbmap = vfio_bitmap_alloc(size);
> +    if (!vbmap) {
> +        return -errno;
> +    }
> +
>       unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
>   
>       unmap->argsz = sizeof(*unmap) + sizeof(*bitmap);
> @@ -486,35 +526,28 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>        * qemu_real_host_page_size to mark those dirty. Hence set bitmap_pgsize
>        * to qemu_real_host_page_size.
>        */
> -
>       bitmap->pgsize = qemu_real_host_page_size();
> -    bitmap->size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
> -                   BITS_PER_BYTE;
> +    bitmap->size = vbmap->size;
> +    bitmap->data = (__u64 *)vbmap->bitmap;
>   
> -    if (bitmap->size > container->max_dirty_bitmap_size) {
> -        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64,
> -                     (uint64_t)bitmap->size);
> +    if (vbmap->size > container->max_dirty_bitmap_size) {
> +        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64, vbmap->size);
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
> +        cpu_physical_memory_set_dirty_lebitmap(vbmap->bitmap,
> +                iotlb->translated_addr, vbmap->pages);
>       } else {
>           error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %m");
>       }
>   
> -    g_free(bitmap->data);
>   unmap_exit:
>       g_free(unmap);
> +    vfio_bitmap_dealloc(vbmap);
> +
>       return ret;
>   }
>   
> @@ -1331,7 +1364,7 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>   {
>       struct vfio_iommu_type1_dirty_bitmap *dbitmap;
>       struct vfio_iommu_type1_dirty_bitmap_get *range;
> -    uint64_t pages;
> +    VFIOBitmap *vbmap;
>       int ret;
>   
>       if (!container->dirty_pages_supported) {
> @@ -1341,6 +1374,11 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>           return 0;
>       }
>   
> +    vbmap = vfio_bitmap_alloc(size);
> +    if (!vbmap) {
> +        return -errno;
> +    }
> +
>       dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
>   
>       dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
> @@ -1355,15 +1393,8 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
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
> +    range->bitmap.size = vbmap->size;
> +    range->bitmap.data = (__u64 *)vbmap->bitmap;
>   
>       ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
>       if (ret) {
> @@ -1374,14 +1405,14 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>           goto err_out;
>       }
>   
> -    cpu_physical_memory_set_dirty_lebitmap((unsigned long *)range->bitmap.data,
> -                                            ram_addr, pages);
> +    cpu_physical_memory_set_dirty_lebitmap(vbmap->bitmap, ram_addr,
> +                                           vbmap->pages);
>   
>       trace_vfio_get_dirty_bitmap(container->fd, range->iova, range->size,
>                                   range->bitmap.size, ram_addr);
>   err_out:
> -    g_free(range->bitmap.data);
>       g_free(dbitmap);
> +    vfio_bitmap_dealloc(vbmap);
>   
>       return ret;
>   }



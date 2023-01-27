Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C7867F028
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 22:12:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLW0F-00037w-LP; Fri, 27 Jan 2023 16:11:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pLW07-00037L-Tm
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 16:11:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pLW04-0004ht-N4
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 16:11:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674853866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o1oyCt/2T7nnlftlqUylDK2OrrVaH4h/FQeDT0+pV/E=;
 b=Lv9pZth1tilOljuPSZyHKkv4Wop4Hs+dEQeQY0F558Jb9p9AD4OC66udSdxQaupFrZGlTS
 d2ZahtdsQaRbXh15w0EHZkISgZSsxwXBUKd2up8/dX5ixKQTQJk30Bgwtbi+/RC988vB3D
 kYeaCf5HTn2iPAcD4zPjclcI3ipCckE=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-8_WXHfAiP4OuHwvncX2ZHQ-1; Fri, 27 Jan 2023 16:11:04 -0500
X-MC-Unique: 8_WXHfAiP4OuHwvncX2ZHQ-1
Received: by mail-io1-f70.google.com with SMTP id
 e25-20020a6b6919000000b00711f1c7a595so1332542ioc.23
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 13:11:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o1oyCt/2T7nnlftlqUylDK2OrrVaH4h/FQeDT0+pV/E=;
 b=fDK5wD9rV2sqiKdj0SkJ2Y/uLeWOyHV7aAyzgqXrEsqjQDwoGikJmPs7wuQ2AKl7QW
 AP7CmOR378ve/9+RJsE59KYKPpAL5gBDepb5JRZyAFzDuspxYHmf75uuSkIpLI9ZCmqr
 ufBbcri7hJf4zJh+VyUKBJYESvG341oumqKBZB8MKpg7VokfupvXGBZZ7S79f5SLr3Ue
 9OSJEbNgwVn8ktMCH8uiX7Qeqmvyw1qSEOAkRsDRJ6yI2bIUJDAOwSCf52kT5DLyPoZd
 7hxvq+Y80VZ+Hs5+PSdVvHznjBoW5XRnwlTHxsZHp8ByX78eYKk0m/+nDDX/Cv9n0+mn
 6EYg==
X-Gm-Message-State: AO0yUKUkEF7xrVepYZIuLHpAroT6TVhgU4Z0YgR7xPCnX+aRF/qrdnQ2
 hOBIrGusqjqibZgL5bBkbjBKndVzdP0wNS7iJ/cwI5RFCZ0kktsvpRVsXx1biTkkdnET94miV+q
 vGs07+vxgSwKeu/s=
X-Received: by 2002:a05:6e02:2149:b0:310:c923:8d06 with SMTP id
 d9-20020a056e02214900b00310c9238d06mr2596226ilv.19.1674853863984; 
 Fri, 27 Jan 2023 13:11:03 -0800 (PST)
X-Google-Smtp-Source: AK7set/2FOv9ZH2U5gHHLLckFT0DP+mBEbmrjctIWjUx1qFsPTMmaeXTvTMbh3pKwDvxLtBAOIw4qQ==
X-Received: by 2002:a05:6e02:2149:b0:310:c923:8d06 with SMTP id
 d9-20020a056e02214900b00310c9238d06mr2596203ilv.19.1674853863707; 
 Fri, 27 Jan 2023 13:11:03 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 j124-20020a026382000000b003a963535db2sm1651147jac.147.2023.01.27.13.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 13:11:03 -0800 (PST)
Date: Fri, 27 Jan 2023 14:11:01 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu
 <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, "Paolo Bonzini" <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, "David Hildenbrand" <david@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH 05/18] vfio/common: Add VFIOBitmap and (de)alloc functions
Message-ID: <20230127141101.7d21f937.alex.williamson@redhat.com>
In-Reply-To: <20230126184948.10478-6-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
 <20230126184948.10478-6-avihaih@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Thu, 26 Jan 2023 20:49:35 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> There are already two places where dirty page bitmap allocation and
> calculations are done in open code. With device dirty page tracking
> being added in next patches, there are going to be even more places.
> 
> To avoid code duplication, introduce VFIOBitmap struct and corresponding
> alloc and dealloc functions and use them where applicable.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  hw/vfio/common.c | 89 ++++++++++++++++++++++++++++++++----------------
>  1 file changed, 60 insertions(+), 29 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 8e8ffbc046..e554573eb5 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -319,6 +319,41 @@ const MemoryRegionOps vfio_region_ops = {
>   * Device state interfaces
>   */
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
> +    if (!vbmap) {
> +        errno = ENOMEM;
> +
> +        return NULL;
> +    }
> +
> +    vbmap->pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
> +    vbmap->size =  ROUND_UP(vbmap->pages, sizeof(__u64) * BITS_PER_BYTE) /
> +                                          BITS_PER_BYTE;
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
>  bool vfio_mig_active(void)
>  {
>      VFIOGroup *group;
> @@ -421,9 +456,14 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>  {
>      struct vfio_iommu_type1_dma_unmap *unmap;
>      struct vfio_bitmap *bitmap;
> -    uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
> +    VFIOBitmap *vbmap;
>      int ret;
>  
> +    vbmap = vfio_bitmap_alloc(size);
> +    if (!vbmap) {
> +        return -errno;
> +    }
> +
>      unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
>  
>      unmap->argsz = sizeof(*unmap) + sizeof(*bitmap);
> @@ -437,35 +477,28 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>       * qemu_real_host_page_size to mark those dirty. Hence set bitmap_pgsize
>       * to qemu_real_host_page_size.
>       */
> -
>      bitmap->pgsize = qemu_real_host_page_size();
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

Why not pass the container to the alloc function so we can test this
consistently for each bitmap we allocate?  Thanks,

Alex



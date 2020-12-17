Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD702DCD08
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 08:44:49 +0100 (CET)
Received: from localhost ([::1]:45636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpnxw-0003ge-84
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 02:44:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kpnws-0003Gt-8p
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 02:43:42 -0500
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:46042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kpnwq-0000h5-Ji
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 02:43:42 -0500
Received: by mail-il1-x12d.google.com with SMTP id w12so744086ilm.12
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 23:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FRJB+OYXrg2hITJBDmlWmXexDtNHWPri9PE4fhBKc7M=;
 b=LL9fia6VXPMLq3hV3OTObJrf7+zr5IJghDz/YEI9SGupNj5+MP6FfUtauzA1TC3SpZ
 dbog/eq3pSHeljpsQJ/ycahnU+7n6WsgT9FcU49LzeOy/6+bgHQ7OBhHBavYLrpmcN9s
 EsLs11m5dQBP6U90k0Vlxqcuy0s3Q9e/2b1JpKnmJ4RiukpYAEIfsBMfPZm+S0FHUji8
 7JsmNT95JUQDco8xDKx6y2uDwpm/geaXNflsFpQXId87syx0SmuQoUi7Mtu9+fG0gbdj
 +Uo1idZ5KxI8gWGj5xcXmG/HJ4Z9bvJGAxITDnFvim51pxG/vTH8kVE/ZBqdzJ0j8NUR
 dVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FRJB+OYXrg2hITJBDmlWmXexDtNHWPri9PE4fhBKc7M=;
 b=cnrrZzruWxKI7kjNAcqFqPAfgKfUb7WcgfbkTzn0uh06Uo130bRlWFxz+/SU6JbY1p
 KhN0Ho5M3jsSAWncUFpYjYpfSr0EP3TET2UNYaKcOzRHZslTwiUdREHsZa/xjiycOO/V
 0LihFTPvskKdVQcr+A7z59MXz5gMn3jufmWmfHDXldm6qL3ksi/4E2NV3GDltOXo1iBF
 WP95fIICOtQkkpo+LpUVck3Hy9UDVuA1rbeEw3SD1cXpd2VoBYQo9XAtbswPido4R0NB
 WMr4ZgmdKsNzY2tMcjNdqqTjNgfOAlvkvMBvQpIc0G3WX/3bDyZzFmeZXkEArKnnLnNa
 0y0Q==
X-Gm-Message-State: AOAM530Ly+HQjNd8lNuyNcrKDbzYtmHRybaZSbBrDC9ohTvvrSL1peBy
 WhpGXiHZxN7p+Ql5IHZJA9CtunnhLC+LN83LZ+o=
X-Google-Smtp-Source: ABdhPJzA7Rn8X4ZXfmmT+1T0b8FOi1mPjV/aLxTnFMVNOpywtitGbIzgNy02nHdKvZARUULqfx7fmxp8XT/C75Dhjcw=
X-Received: by 2002:a92:9eda:: with SMTP id s87mr26001105ilk.85.1608191019214; 
 Wed, 16 Dec 2020 23:43:39 -0800 (PST)
MIME-Version: 1.0
References: <20201216141200.118742-1-david@redhat.com>
 <20201216141200.118742-5-david@redhat.com>
In-Reply-To: <20201216141200.118742-5-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 17 Dec 2020 08:43:27 +0100
Message-ID: <CAM9Jb+jD6iLQ5RVWrN9DcKX7Kg3D1-qEdwb5OOmYd2diWxoqOQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] vfio: Query and store the maximum number of DMA
 mappings
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Let's query the maximum number of DMA mappings by querying the available
> mappings when creating the container.
>
> In addition, count the number of DMA mappings and warn when we would
> exceed it. This is a preparation for RamDiscardMgr which might
> create quite some DMA mappings over time, and we at least want to warn
> early that the QEMU setup might be problematic. Use "reserved"
> terminology, so we can use this to reserve mappings before they are
> actually created.
>
> Note: don't reserve vIOMMU DMA mappings - using the vIOMMU region size
> divided by the mapping page size might be a bad indication of what will
> happen in practice - we might end up warning all the time.
>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Auger Eric <eric.auger@redhat.com>
> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
> Cc: teawater <teawaterz@linux.alibaba.com>
> Cc: Marek Kedzierski <mkedzier@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/vfio/common.c              | 34 ++++++++++++++++++++++++++++++++++
>  include/hw/vfio/vfio-common.h |  2 ++
>  2 files changed, 36 insertions(+)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 6ff1daa763..5ad88d476f 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -288,6 +288,26 @@ const MemoryRegionOps vfio_region_ops = {
>      },
>  };
>
> +static void vfio_container_dma_reserve(VFIOContainer *container,
> +                                       unsigned long dma_mappings)
> +{
> +    bool warned = container->dma_reserved > container->dma_max;
> +
> +    container->dma_reserved += dma_mappings;
> +    if (!warned && container->dma_max &&
> +        container->dma_reserved > container->dma_max) {
> +        warn_report("%s: possibly running out of DMA mappings. "
> +                    " Maximum number of DMA mappings: %d", __func__,
> +                    container->dma_max);
> +    }
> +}
> +
> +static void vfio_container_dma_unreserve(VFIOContainer *container,
> +                                         unsigned long dma_mappings)
> +{
> +    container->dma_reserved -= dma_mappings;
> +}
> +
>  /*
>   * Device state interfaces
>   */
> @@ -835,6 +855,9 @@ static void vfio_listener_region_add(MemoryListener *listener,
>          }
>      }
>
> +    /* We'll need one DMA mapping. */
> +    vfio_container_dma_reserve(container, 1);
> +
>      ret = vfio_dma_map(container, iova, int128_get64(llsize),
>                         vaddr, section->readonly);
>      if (ret) {
> @@ -879,6 +902,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
>                                       MemoryRegionSection *section)
>  {
>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +    bool unreserve_on_unmap = true;
>      hwaddr iova, end;
>      Int128 llend, llsize;
>      int ret;
> @@ -919,6 +943,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
>           * based IOMMU where a big unmap flattens a large range of IO-PTEs.
>           * That may not be true for all IOMMU types.
>           */
> +        unreserve_on_unmap = false;
>      }
>
>      iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
> @@ -970,6 +995,11 @@ static void vfio_listener_region_del(MemoryListener *listener,
>                           "0x%"HWADDR_PRIx") = %d (%m)",
>                           container, iova, int128_get64(llsize), ret);
>          }
> +
> +        /* We previously reserved one DMA mapping. */
> +        if (unreserve_on_unmap) {
> +            vfio_container_dma_unreserve(container, 1);
> +        }
>      }
>
>      memory_region_unref(section->mr);
> @@ -1735,6 +1765,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>      container->fd = fd;
>      container->error = NULL;
>      container->dirty_pages_supported = false;
> +    container->dma_max = 0;
>      QLIST_INIT(&container->giommu_list);
>      QLIST_INIT(&container->hostwin_list);
>
> @@ -1765,7 +1796,10 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>          vfio_host_win_add(container, 0, (hwaddr)-1, info->iova_pgsizes);
>          container->pgsizes = info->iova_pgsizes;
>
> +        /* The default in the kernel ("dma_entry_limit") is 65535. */
> +        container->dma_max = 65535;
>          if (!ret) {
> +            vfio_get_info_dma_avail(info, &container->dma_max);
>              vfio_get_iommu_info_migration(container, info);
>          }
>          g_free(info);
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 6141162d7a..fed0e85f66 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -88,6 +88,8 @@ typedef struct VFIOContainer {
>      uint64_t dirty_pgsizes;
>      uint64_t max_dirty_bitmap_size;
>      unsigned long pgsizes;
> +    unsigned int dma_max;
> +    unsigned long dma_reserved;
>      QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
>      QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
>      QLIST_HEAD(, VFIOGroup) group_list;

Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>


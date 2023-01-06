Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD287660907
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 22:57:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDuiB-0002DQ-JQ; Fri, 06 Jan 2023 16:57:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pDui8-0002CO-K5
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 16:57:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pDui6-00064e-Ft
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 16:57:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673042227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tu7Hw7Rjvz7VYOAU9OrdqOi3WH2kP11utav5JUCnSVA=;
 b=eMjhBhMDCylicx2CeTMOsLmyiQBEsaGdkNc+59o6+v0nH3NpKMdDpfc1zyNGa9vZRxXgEU
 h9CZD5FqI86iZxtRxASfcs/vaB++L281B7M0bWokWbJb60UIIBC5lCc+FBfwHDBgAN+4mY
 C+oZV4mKgMaJI0VCLe5ofUBeU+VSvuA=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-64-ZgKuYOzKNdyPlRToyLd7uw-1; Fri, 06 Jan 2023 16:57:05 -0500
X-MC-Unique: ZgKuYOzKNdyPlRToyLd7uw-1
Received: by mail-il1-f198.google.com with SMTP id
 h4-20020a056e021b8400b0030d901a84d9so916974ili.6
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 13:57:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tu7Hw7Rjvz7VYOAU9OrdqOi3WH2kP11utav5JUCnSVA=;
 b=0aliCJg1BiiBtjyFOUOL6wugiAwkCS215l58k1yy1w0jRoyefFe13ws8+rVk6zvBCX
 o7RsW2VkJ0ZIIdtaMXuIqBra8bhzSwABuK9s5oxDAJQ/Y1pkGdcDT5v4I8Vh/Q1KA6Of
 uAYhpfkOrnVGwcYyMSCffNz2svOt23ZKRpg2duP0BRjrBXPfGXHBVUc1HEDYQXVBtzUL
 HJqkMaAL6nME7G/uu4lt1xeVaQk0K32h7fXKh1QqTQTOjfJ8ljk08oOOmsdmRdGbrVSj
 w2DczVv5F8aZODL1kgZZ2kWx4m7owFJjfmX0a9V47OK9tqOm9+rsuwt78+pQLccr7XOl
 cQfQ==
X-Gm-Message-State: AFqh2kpE9ewrJ2KyaZt6l8MeSuAMy8tdkDmA4y43wfJh5R1SESuth22z
 6sxqsaehwPDlARtIIoUchkQMAv/CpSrtc+OSZLZzh9zSXKdFqeaH/blDeFoh5NeQ8ayoDG3WrzY
 Yu3TsNu/C2J2vyOE=
X-Received: by 2002:a92:dc8b:0:b0:30d:7ae0:1ccc with SMTP id
 c11-20020a92dc8b000000b0030d7ae01cccmr6474668iln.30.1673042221518; 
 Fri, 06 Jan 2023 13:57:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXulcZKmAr9fgP4hxbsUXYA95CcSzLeE1zOpR4T/XjgUDZ6JJbe5/bj1/TSP/ZlrPO1UwrM3ig==
X-Received: by 2002:a92:dc8b:0:b0:30d:7ae0:1ccc with SMTP id
 c11-20020a92dc8b000000b0030d7ae01cccmr6474653iln.30.1673042221200; 
 Fri, 06 Jan 2023 13:57:01 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 d186-20020a0262c3000000b00374fa5b600csm666918jac.0.2023.01.06.13.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 13:57:00 -0800 (PST)
Date: Fri, 6 Jan 2023 14:56:58 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, "Ilya Leoshkevich"
 <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "Juan Quintela"
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, John Snow
 <jsnow@redhat.com>, <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor
 Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun
 Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v5 05/14] vfio/migration: Allow migration without VFIO
 IOMMU dirty tracking support
Message-ID: <20230106145658.51c8f071.alex.williamson@redhat.com>
In-Reply-To: <20221229110345.12480-6-avihaih@nvidia.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
 <20221229110345.12480-6-avihaih@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 29 Dec 2022 13:03:36 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> Currently, if IOMMU of a VFIO container doesn't support dirty page
> tracking, migration is blocked. This is because a DMA-able VFIO device
> can dirty RAM pages without updating QEMU about it, thus breaking the
> migration.
> 
> However, this doesn't mean that migration can't be done at all.
> In such case, allow migration and let QEMU VFIO code mark the entire
> bitmap dirty.
> 
> This guarantees that all pages that might have gotten dirty are reported
> back, and thus guarantees a valid migration even without VFIO IOMMU
> dirty tracking support.
> 
> The motivation for this patch is the introduction of iommufd [1].
> iommufd can directly implement the /dev/vfio/vfio container IOCTLs by
> mapping them into its internal ops, allowing the usage of these IOCTLs
> over iommufd. However, VFIO IOMMU dirty tracking is not supported by
> this VFIO compatibility API.
> 
> This patch will allow migration by hosts that use the VFIO compatibility
> API and prevent migration regressions caused by the lack of VFIO IOMMU
> dirty tracking support.
> 
> [1]
> https://lore.kernel.org/kvm/0-v6-a196d26f289e+11787-iommufd_jgg@nvidia.com/
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  hw/vfio/common.c    | 100 ++++++++++++++++++++++++++------------------
>  hw/vfio/migration.c |   3 +-
>  2 files changed, 61 insertions(+), 42 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 130e5d1dc7..67104e2fc2 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -397,51 +397,61 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>                                   IOMMUTLBEntry *iotlb)
>  {
>      struct vfio_iommu_type1_dma_unmap *unmap;
> -    struct vfio_bitmap *bitmap;
> +    struct vfio_bitmap *vbitmap;
> +    unsigned long *bitmap;
> +    uint64_t bitmap_size;
>      uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
>      int ret;
>  
> -    unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
> +    unmap = g_malloc0(sizeof(*unmap) + sizeof(*vbitmap));
>  
> -    unmap->argsz = sizeof(*unmap) + sizeof(*bitmap);
> +    unmap->argsz = sizeof(*unmap);
>      unmap->iova = iova;
>      unmap->size = size;
> -    unmap->flags |= VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP;
> -    bitmap = (struct vfio_bitmap *)&unmap->data;
>  
> +    bitmap_size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
> +                  BITS_PER_BYTE;
> +    bitmap = g_try_malloc0(bitmap_size);
> +    if (!bitmap) {
> +        ret = -ENOMEM;
> +        goto unmap_exit;
> +    }
> +
> +    if (!container->dirty_pages_supported) {
> +        bitmap_set(bitmap, 0, pages);
> +        goto do_unmap;
> +    }
> +
> +    unmap->argsz += sizeof(*vbitmap);
> +    unmap->flags = VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP;
> +
> +    vbitmap = (struct vfio_bitmap *)&unmap->data;
> +    vbitmap->data = (__u64 *)bitmap;
>      /*
>       * cpu_physical_memory_set_dirty_lebitmap() supports pages in bitmap of
>       * qemu_real_host_page_size to mark those dirty. Hence set bitmap_pgsize
>       * to qemu_real_host_page_size.
>       */
> +    vbitmap->pgsize = qemu_real_host_page_size();
> +    vbitmap->size = bitmap_size;
>  
> -    bitmap->pgsize = qemu_real_host_page_size();
> -    bitmap->size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
> -                   BITS_PER_BYTE;
> -
> -    if (bitmap->size > container->max_dirty_bitmap_size) {
> -        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64,
> -                     (uint64_t)bitmap->size);
> +    if (bitmap_size > container->max_dirty_bitmap_size) {
> +        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64, bitmap_size);
>          ret = -E2BIG;
>          goto unmap_exit;
>      }
>  
> -    bitmap->data = g_try_malloc0(bitmap->size);
> -    if (!bitmap->data) {
> -        ret = -ENOMEM;
> -        goto unmap_exit;
> -    }
> -
> +do_unmap:
>      ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
>      if (!ret) {
> -        cpu_physical_memory_set_dirty_lebitmap((unsigned long *)bitmap->data,
> -                iotlb->translated_addr, pages);
> +        cpu_physical_memory_set_dirty_lebitmap(bitmap, iotlb->translated_addr,
> +                                               pages);
>      } else {
>          error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %m");
>      }
>  
> -    g_free(bitmap->data);
>  unmap_exit:
> +    g_free(bitmap);
>      g_free(unmap);
>      return ret;
>  }
> @@ -460,8 +470,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
>          .size = size,
>      };
>  
> -    if (iotlb && container->dirty_pages_supported &&
> -        vfio_devices_all_running_and_saving(container)) {
> +    if (iotlb && vfio_devices_all_running_and_saving(container)) {
>          return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
>      }

Seems like it would be simpler to follow the non-dirty_pages_supported
path here and follow-up with a condition to call
cpu_physical_memory_set_dirty_range() rather than try to make the
bitmap path serve double-duty.

>  
> @@ -1201,6 +1210,10 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
>          .argsz = sizeof(dirty),
>      };
>  
> +    if (!container->dirty_pages_supported) {
> +        return;
> +    }
> +
>      if (start) {
>          dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
>      } else {
> @@ -1231,11 +1244,26 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
>  static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>                                   uint64_t size, ram_addr_t ram_addr)
>  {
> -    struct vfio_iommu_type1_dirty_bitmap *dbitmap;
> +    struct vfio_iommu_type1_dirty_bitmap *dbitmap = NULL;
>      struct vfio_iommu_type1_dirty_bitmap_get *range;
> +    unsigned long *bitmap;
> +    uint64_t bitmap_size;
>      uint64_t pages;
>      int ret;
>  
> +    pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
> +    bitmap_size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
> +                                  BITS_PER_BYTE;
> +    bitmap = g_try_malloc0(bitmap_size);
> +    if (!bitmap) {
> +        return -ENOMEM;
> +    }
> +
> +    if (!container->dirty_pages_supported) {
> +        bitmap_set(bitmap, 0, pages);
> +        goto set_dirty;
> +    }

Same here, why are we bothering to allocate and mark a bitmap dirty
just to appease code we don't need instead of:

	if (!container->dirty_pages_supported) {
		cpu_physical_memory_set_dirty_range(...)
		return 0;
	}

Thanks,
Alex

> +
>      dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
>  
>      dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
> @@ -1250,15 +1278,8 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>       * to qemu_real_host_page_size.
>       */
>      range->bitmap.pgsize = qemu_real_host_page_size();
> -
> -    pages = REAL_HOST_PAGE_ALIGN(range->size) / qemu_real_host_page_size();
> -    range->bitmap.size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
> -                                         BITS_PER_BYTE;
> -    range->bitmap.data = g_try_malloc0(range->bitmap.size);
> -    if (!range->bitmap.data) {
> -        ret = -ENOMEM;
> -        goto err_out;
> -    }
> +    range->bitmap.size = bitmap_size;
> +    range->bitmap.data = (__u64 *)bitmap;
>  
>      ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
>      if (ret) {
> @@ -1268,13 +1289,13 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>          goto err_out;
>      }
>  
> -    cpu_physical_memory_set_dirty_lebitmap((unsigned long *)range->bitmap.data,
> -                                            ram_addr, pages);
> +set_dirty:
> +    cpu_physical_memory_set_dirty_lebitmap(bitmap, ram_addr, pages);
>  
> -    trace_vfio_get_dirty_bitmap(container->fd, range->iova, range->size,
> -                                range->bitmap.size, ram_addr);
> +    trace_vfio_get_dirty_bitmap(container->fd, iova, size, bitmap_size,
> +                                ram_addr);
>  err_out:
> -    g_free(range->bitmap.data);
> +    g_free(bitmap);
>      g_free(dbitmap);
>  
>      return ret;
> @@ -1409,8 +1430,7 @@ static void vfio_listener_log_sync(MemoryListener *listener,
>  {
>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>  
> -    if (vfio_listener_skipped_section(section) ||
> -        !container->dirty_pages_supported) {
> +    if (vfio_listener_skipped_section(section)) {
>          return;
>      }
>  
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 09fe7c1de2..552c2313b2 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -860,11 +860,10 @@ int64_t vfio_mig_bytes_transferred(void)
>  
>  int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>  {
> -    VFIOContainer *container = vbasedev->group->container;
>      struct vfio_region_info *info = NULL;
>      int ret = -ENOTSUP;
>  
> -    if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
> +    if (!vbasedev->enable_migration) {
>          goto add_blocker;
>      }
>  



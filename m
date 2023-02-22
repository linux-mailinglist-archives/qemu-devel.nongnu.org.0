Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC1069FF98
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:35:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUydX-0002iX-Pv; Wed, 22 Feb 2023 18:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pUydL-0002gC-Bl
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:34:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pUydI-0007cp-U2
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:34:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677108884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=10n1TDihFjS4Jf5hMkMyMPxmX5DpTkrt1dMZQm5Hvq8=;
 b=OhoL+QmNRsgtWacEYWcYbX84M2tKvAJxB+upGUlDbFM/SVGRfWO6wgQXH5Rk5GigwGkCix
 +I46VXQhMDQoeM81afxZcMlPU1D9XDZecH+jlNb2y8N1pdAO+yO2M7Jz+o/5WPxu9EfQwK
 QXcFdnMQszZHoqau9iLt98N9FDkoarA=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-187-7WtlPFyQPASu9ueVwZdZLA-1; Wed, 22 Feb 2023 18:34:42 -0500
X-MC-Unique: 7WtlPFyQPASu9ueVwZdZLA-1
Received: by mail-il1-f199.google.com with SMTP id
 v3-20020a92c6c3000000b003159a0109ceso5553851ilm.12
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:34:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=10n1TDihFjS4Jf5hMkMyMPxmX5DpTkrt1dMZQm5Hvq8=;
 b=pPJkP3a6SaAnBk8B+bAbePsWSR3nHPmjz8Kb0Y4sZGLq1SBCFx/5as57buQ3lvtWws
 h9H3GVy+LQTyw2jdAtxhLYMRUaFAAaO4k44t/EFkbuDyvXaW9D2vaCoYrgELJ+tystqi
 0W35lCDa9xLHSKlEN8oKbI5y+934rEGMe1Ya6F8+Bx1eq1rMXCaPdCcUFvI0W1aQmKBk
 fUhVnIPzfFI8le/Oj7lU7yXf4MwC3IIOBXapIZFdIRJ1H3bWhxrFARFxFlMhtrdOjoq9
 NVL6T4DyM9cC5d3xpwHVcJqhq02UKYdxJoC36kS7UiynjiJ9uPi5EtFUowfrrSdvjtIi
 46SQ==
X-Gm-Message-State: AO0yUKXw8CRvYpE9cb0IxShdLyS0HO2qtTU7fLRF9vvt9Lbit5W/tYDm
 sO5LYiaKpRInxOo37gwCwBKYyQ7x0YZIo9Jf6XsGpB3VyZ+8Lm7MJyws9l0T9sjF/g/smKVwkIj
 GZ22wqiVhF3APrRc=
X-Received: by 2002:a6b:da07:0:b0:745:a99c:af1 with SMTP id
 x7-20020a6bda07000000b00745a99c0af1mr6815297iob.6.1677108882041; 
 Wed, 22 Feb 2023 15:34:42 -0800 (PST)
X-Google-Smtp-Source: AK7set9cM1u5cZLldMWZCYVeMXaxJe787W19FWAPWldmsmp+A+ww5YcoPDtC34ct/ckWJNd0HMc0mw==
X-Received: by 2002:a6b:da07:0:b0:745:a99c:af1 with SMTP id
 x7-20020a6bda07000000b00745a99c0af1mr6815275iob.6.1677108881718; 
 Wed, 22 Feb 2023 15:34:41 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 k14-20020a6b3c0e000000b0074c7e84d0c8sm2122244iob.55.2023.02.22.15.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:34:41 -0800 (PST)
Date: Wed, 22 Feb 2023 16:34:39 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@redhat.com>, Juan Quintela <quintela@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Jason Wang" <jasowang@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "David Hildenbrand"
 <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: Re: [PATCH v2 17/20] vfio/common: Support device dirty page
 tracking with vIOMMU
Message-ID: <20230222163439.68ad5e63.alex.williamson@redhat.com>
In-Reply-To: <20230222174915.5647-18-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-18-avihaih@nvidia.com>
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

On Wed, 22 Feb 2023 19:49:12 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> Currently, device dirty page tracking with vIOMMU is not supported - RAM
> pages are perpetually marked dirty in this case.
> 
> When vIOMMU is used, IOVA ranges are DMA mapped/unmapped on the fly as
> the vIOMMU maps/unmaps them. These IOVA ranges can potentially be mapped
> anywhere in the vIOMMU IOVA space.
> 
> Due to this dynamic nature of vIOMMU mapping/unmapping, tracking only
> the currently mapped IOVA ranges, as done in the non-vIOMMU case,
> doesn't work very well.
> 
> Instead, to support device dirty tracking when vIOMMU is enabled, track
> the entire vIOMMU IOVA space. If that fails (IOVA space can be rather
> big and we might hit HW limitation), try tracking smaller range while
> marking untracked ranges dirty.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  include/hw/vfio/vfio-common.h |   2 +
>  hw/vfio/common.c              | 196 +++++++++++++++++++++++++++++++---
>  2 files changed, 181 insertions(+), 17 deletions(-)
> 
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 1f21e1fa43..1dc00cabcd 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -95,6 +95,8 @@ typedef struct VFIOContainer {
>      unsigned int dma_max_mappings;
>      IOVATree *mappings;
>      QemuMutex mappings_mutex;
> +    /* Represents the range [0, giommu_tracked_range) not inclusive */
> +    hwaddr giommu_tracked_range;
>      QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
>      QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
>      QLIST_HEAD(, VFIOGroup) group_list;
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 4a7fff6eeb..1024788bcc 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -45,6 +45,8 @@
>  #include "migration/qemu-file.h"
>  #include "sysemu/tpm.h"
>  #include "qemu/iova-tree.h"
> +#include "hw/boards.h"
> +#include "hw/mem/memory-device.h"
>  
>  VFIOGroupList vfio_group_list =
>      QLIST_HEAD_INITIALIZER(vfio_group_list);
> @@ -430,6 +432,38 @@ void vfio_unblock_multiple_devices_migration(void)
>      multiple_devices_migration_blocker = NULL;
>  }
>  
> +static uint64_t vfio_get_ram_size(void)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    uint64_t plugged_size;
> +
> +    plugged_size = get_plugged_memory_size();
> +    if (plugged_size == (uint64_t)-1) {
> +        plugged_size = 0;
> +    }
> +
> +    return ms->ram_size + plugged_size;
> +}
> +
> +static int vfio_iommu_get_max_iova(VFIOContainer *container, hwaddr *max_iova)
> +{
> +    VFIOGuestIOMMU *giommu;
> +    int ret;
> +
> +    giommu = QLIST_FIRST(&container->giommu_list);
> +    if (!giommu) {
> +        return -ENOENT;
> +    }
> +
> +    ret = memory_region_iommu_get_attr(giommu->iommu_mr, IOMMU_ATTR_MAX_IOVA,
> +                                       max_iova);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    return 0;
> +}
> +
>  static bool vfio_have_giommu(VFIOContainer *container)
>  {
>      return !QLIST_EMPTY(&container->giommu_list);
> @@ -1510,7 +1544,8 @@ static gboolean vfio_iova_tree_get_last(DMAMap *map, gpointer data)
>  }
>  
>  static struct vfio_device_feature *
> -vfio_device_feature_dma_logging_start_create(VFIOContainer *container)
> +vfio_device_feature_dma_logging_start_create(VFIOContainer *container,
> +                                             bool giommu)
>  {
>      struct vfio_device_feature *feature;
>      size_t feature_size;
> @@ -1529,6 +1564,16 @@ vfio_device_feature_dma_logging_start_create(VFIOContainer *container)
>      control = (struct vfio_device_feature_dma_logging_control *)feature->data;
>      control->page_size = qemu_real_host_page_size();
>  
> +    if (giommu) {
> +        ranges = g_malloc0(sizeof(*ranges));
> +        ranges->iova = 0;
> +        ranges->length = container->giommu_tracked_range;
> +        control->num_ranges = 1;
> +        control->ranges = (uint64_t)ranges;
> +
> +        return feature;
> +    }
> +
>      QEMU_LOCK_GUARD(&container->mappings_mutex);
>  
>      /*
> @@ -1578,12 +1623,12 @@ static void vfio_device_feature_dma_logging_start_destroy(
>      g_free(feature);
>  }
>  
> -static int vfio_devices_dma_logging_start(VFIOContainer *container)
> +static int vfio_devices_dma_logging_start(VFIOContainer *container, bool giommu)
>  {
>      struct vfio_device_feature *feature;
>      int ret;
>  
> -    feature = vfio_device_feature_dma_logging_start_create(container);
> +    feature = vfio_device_feature_dma_logging_start_create(container, giommu);
>      if (!feature) {
>          return -errno;
>      }
> @@ -1598,18 +1643,128 @@ static int vfio_devices_dma_logging_start(VFIOContainer *container)
>      return ret;
>  }
>  
> +typedef struct {
> +    hwaddr *ranges;
> +    unsigned int ranges_num;
> +} VFIOGIOMMUDeviceDTRanges;
> +
> +/*
> + * This value is used in the second attempt to start device dirty tracking with
> + * vIOMMU, or if the giommu fails to report its max iova.
> + * It should be in the middle, not too big and not too small, allowing devices
> + * with HW limitations to do device dirty tracking while covering a fair amount
> + * of the IOVA space.
> + *
> + * This arbitrary value was chosen becasue it is the minimum value of Intel
> + * IOMMU max IOVA and mlx5 devices support tracking a range of this size.
> + */
> +#define VFIO_IOMMU_DEFAULT_MAX_IOVA ((1ULL << 39) - 1)
> +
> +#define VFIO_IOMMU_RANGES_NUM 3
> +static VFIOGIOMMUDeviceDTRanges *
> +vfio_iommu_device_dirty_tracking_ranges_create(VFIOContainer *container)
> +{
> +    hwaddr iommu_max_iova = VFIO_IOMMU_DEFAULT_MAX_IOVA;
> +    hwaddr retry_iova;
> +    hwaddr ram_size = vfio_get_ram_size();
> +    VFIOGIOMMUDeviceDTRanges *dt_ranges;
> +    int ret;
> +
> +    dt_ranges = g_try_new0(VFIOGIOMMUDeviceDTRanges, 1);
> +    if (!dt_ranges) {
> +        errno = ENOMEM;
> +
> +        return NULL;
> +    }
> +
> +    dt_ranges->ranges_num = VFIO_IOMMU_RANGES_NUM;
> +
> +    dt_ranges->ranges = g_try_new0(hwaddr, dt_ranges->ranges_num);
> +    if (!dt_ranges->ranges) {
> +        g_free(dt_ranges);
> +        errno = ENOMEM;
> +
> +        return NULL;
> +    }
> +
> +    /*
> +     * With vIOMMU we try to track the entire IOVA space. As the IOVA space can
> +     * be rather big, devices might not be able to track it due to HW
> +     * limitations. In that case:
> +     * (1) Retry tracking a smaller part of the IOVA space.
> +     * (2) Retry tracking a range in the size of the physical memory.

This looks really sketchy, why do we think there's a "good enough"
value here?  If we get it wrong, the device potentially has access to
IOVA space that we're not tracking, right?

I'd think the only viable fallback if the vIOMMU doesn't report its max
IOVA is the full 64-bit address space, otherwise it seems like we need
to add a migration blocker.

BTW, virtio-iommu is actively working to support vfio devices, we
should include support for it as well as VT-d.  Thanks,

Alex

> +     */
> +    ret = vfio_iommu_get_max_iova(container, &iommu_max_iova);
> +    if (!ret) {
> +        /* Check 2^64 wrap around */
> +        if (!REAL_HOST_PAGE_ALIGN(iommu_max_iova)) {
> +            iommu_max_iova -= qemu_real_host_page_size();
> +        }
> +    }
> +
> +    retry_iova = MIN(iommu_max_iova / 2, VFIO_IOMMU_DEFAULT_MAX_IOVA);
> +
> +    dt_ranges->ranges[0] = REAL_HOST_PAGE_ALIGN(iommu_max_iova);
> +    dt_ranges->ranges[1] = REAL_HOST_PAGE_ALIGN(retry_iova);
> +    dt_ranges->ranges[2] = REAL_HOST_PAGE_ALIGN(MIN(ram_size, retry_iova / 2));
> +
> +    return dt_ranges;
> +}
> +
> +static void vfio_iommu_device_dirty_tracking_ranges_destroy(
> +    VFIOGIOMMUDeviceDTRanges *dt_ranges)
> +{
> +    g_free(dt_ranges->ranges);
> +    g_free(dt_ranges);
> +}
> +
> +static int vfio_devices_start_dirty_page_tracking(VFIOContainer *container)
> +{
> +    VFIOGIOMMUDeviceDTRanges *dt_ranges;
> +    int ret;
> +    int i;
> +
> +    if (!vfio_have_giommu(container)) {
> +        return vfio_devices_dma_logging_start(container, false);
> +    }
> +
> +    dt_ranges = vfio_iommu_device_dirty_tracking_ranges_create(container);
> +    if (!dt_ranges) {
> +        return -errno;
> +    }
> +
> +    for (i = 0; i < dt_ranges->ranges_num; i++) {
> +        container->giommu_tracked_range = dt_ranges->ranges[i];
> +        ret = vfio_devices_dma_logging_start(container, true);
> +        if (!ret) {
> +            break;
> +        }
> +
> +        if (i < dt_ranges->ranges_num - 1) {
> +            warn_report("Failed to start device dirty tracking with vIOMMU "
> +                        "with range of size 0x%" HWADDR_PRIx
> +                        ", err: %d. Retrying with range "
> +                        "of size 0x%" HWADDR_PRIx,
> +                        dt_ranges->ranges[i], ret, dt_ranges->ranges[i + 1]);
> +        } else {
> +            error_report("Failed to start device dirty tracking with vIOMMU "
> +                         "with range of size 0x%" HWADDR_PRIx ", err: %d",
> +                         dt_ranges->ranges[i], ret);
> +        }
> +    }
> +
> +    vfio_iommu_device_dirty_tracking_ranges_destroy(dt_ranges);
> +
> +    return ret;
> +}
> +
>  static void vfio_listener_log_global_start(MemoryListener *listener)
>  {
>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>      int ret;
>  
>      if (vfio_devices_all_device_dirty_tracking(container)) {
> -        if (vfio_have_giommu(container)) {
> -            /* Device dirty page tracking currently doesn't support vIOMMU */
> -            return;
> -        }
> -
> -        ret = vfio_devices_dma_logging_start(container);
> +        ret = vfio_devices_start_dirty_page_tracking(container);
>      } else {
>          ret = vfio_set_dirty_page_tracking(container, true);
>      }
> @@ -1627,11 +1782,6 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
>      int ret;
>  
>      if (vfio_devices_all_device_dirty_tracking(container)) {
> -        if (vfio_have_giommu(container)) {
> -            /* Device dirty page tracking currently doesn't support vIOMMU */
> -            return;
> -        }
> -
>          ret = vfio_devices_dma_logging_stop(container);
>      } else {
>          ret = vfio_set_dirty_page_tracking(container, false);
> @@ -1670,6 +1820,17 @@ static int vfio_device_dma_logging_report(VFIODevice *vbasedev, hwaddr iova,
>      return 0;
>  }
>  
> +static bool vfio_iommu_range_is_device_tracked(VFIOContainer *container,
> +                                               hwaddr iova, hwaddr size)
> +{
> +    /* Check for 2^64 wrap around */
> +    if (!(iova + size)) {
> +        return false;
> +    }
> +
> +    return iova + size <= container->giommu_tracked_range;
> +}
> +
>  static int vfio_devices_query_dirty_bitmap(VFIOContainer *container,
>                                             VFIOBitmap *vbmap, hwaddr iova,
>                                             hwaddr size)
> @@ -1679,10 +1840,11 @@ static int vfio_devices_query_dirty_bitmap(VFIOContainer *container,
>      int ret;
>  
>      if (vfio_have_giommu(container)) {
> -        /* Device dirty page tracking currently doesn't support vIOMMU */
> -        bitmap_set(vbmap->bitmap, 0, vbmap->pages);
> +        if (!vfio_iommu_range_is_device_tracked(container, iova, size)) {
> +            bitmap_set(vbmap->bitmap, 0, vbmap->pages);
>  
> -        return 0;
> +            return 0;
> +        }
>      }
>  
>      QLIST_FOREACH(group, &container->group_list, container_next) {



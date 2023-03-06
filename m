Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5755C6ACC46
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 19:16:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZFNP-0006au-Dw; Mon, 06 Mar 2023 13:15:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZFNM-0006Yw-LR
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:15:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZFNK-0004Xp-HX
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:15:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678126553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a/4znjcF0TTZ1Xa4DqSQbAF9Lnamu7yTIBHuvBM6KNQ=;
 b=XFjQ/OwePjUzx1X6OB+B76FLoFHGFAkZWpeWQwtrL3LEc8gKr2Or8fW5vrEkHdKlQS3hZP
 vtxikd6+AcNLh0OeE8tds2l7Ss++PBJc6hGZQUdGTC8kuTP3geOJN0yWLdoJ/BxYHBk7XY
 D/s0K4fvYHZxHFbDcAKz0eJttTymt/c=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-Ay1I5mGHPxOmwGR0C5KS8A-1; Mon, 06 Mar 2023 13:15:42 -0500
X-MC-Unique: Ay1I5mGHPxOmwGR0C5KS8A-1
Received: by mail-io1-f71.google.com with SMTP id
 v10-20020a056602058a00b007076e06ba3dso5777604iox.20
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 10:15:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678126542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a/4znjcF0TTZ1Xa4DqSQbAF9Lnamu7yTIBHuvBM6KNQ=;
 b=UwlU5dEu/MWmZW6WbVauf+oIojIBGDog0zdmOYAdYLODTW+71vhZ27h3WExDZahAfF
 ZzAfuCx18EypVgCORD02yF4yA9DrMiztWMiekM6OYj55Zpm5M/cM8rr3nkRTEpntql4m
 EUASSvRmLewGcdonWzBAVHbFlMa7gM1K3WLiuUytstxhzAiBz21oyqBNkrODu2/EWsAd
 8LlVgK79UT/nDTcP6tureA9FP/6UUyqKXbwPGPWcvUSV0s7PP1SNvJdjqCKhx46x4AyY
 xU/uITrN2Np8+7DMq8Oyk0Sef1XrwN1tSkwTJBhl0HLFoKacbJwOtWUGGkGvMUI9mD/X
 rgKQ==
X-Gm-Message-State: AO0yUKUzen2v7h3NgAAxLgDifoxXT8WWRs5RGJyfo4gcV7Nrz/YCuON7
 +6+ii0Lky0iWPoky5S1TDOvF/7rknXOk19zOK01PrMSiZHIcvTgmLCJCmj7o/LIO8QEaEfokkzI
 hCw8Pv8ivViD0v7w=
X-Received: by 2002:a05:6e02:18ce:b0:315:9b3a:2f56 with SMTP id
 s14-20020a056e0218ce00b003159b3a2f56mr9232814ilu.28.1678126541846; 
 Mon, 06 Mar 2023 10:15:41 -0800 (PST)
X-Google-Smtp-Source: AK7set9bzBY000aJyH46ly19wcwHP23WXIfvaatjxsU3w/Af2Mvyjf27MOvnanJ2cuwqSOT11eTXGA==
X-Received: by 2002:a05:6e02:18ce:b0:315:9b3a:2f56 with SMTP id
 s14-20020a056e0218ce00b003159b3a2f56mr9232790ilu.28.1678126541464; 
 Mon, 06 Mar 2023 10:15:41 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 c13-20020a02c9cd000000b003a484df1652sm3283617jap.55.2023.03.06.10.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 10:15:40 -0800 (PST)
Date: Mon, 6 Mar 2023 11:15:39 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Cedric Le Goater <clg@redhat.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
Subject: Re: [PATCH v3 07/13] vfio/common: Record DMA mapped IOVA ranges
Message-ID: <20230306111539.64370071.alex.williamson@redhat.com>
In-Reply-To: <20230304014343.33646-8-joao.m.martins@oracle.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-8-joao.m.martins@oracle.com>
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

On Sat,  4 Mar 2023 01:43:37 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> According to the device DMA logging uAPI, IOVA ranges to be logged by
> the device must be provided all at once upon DMA logging start.
> 
> As preparation for the following patches which will add device dirty
> page tracking, keep a record of all DMA mapped IOVA ranges so later they
> can be used for DMA logging start.
> 
> Note that when vIOMMU is enabled DMA mapped IOVA ranges are not tracked.
> This is due to the dynamic nature of vIOMMU DMA mapping/unmapping.

Commit log is outdated for this version.

> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  hw/vfio/common.c              | 84 +++++++++++++++++++++++++++++++++++
>  hw/vfio/trace-events          |  1 +
>  include/hw/vfio/vfio-common.h | 11 +++++
>  3 files changed, 96 insertions(+)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index ed908e303dbb..d84e5fd86bb4 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -44,6 +44,7 @@
>  #include "migration/blocker.h"
>  #include "migration/qemu-file.h"
>  #include "sysemu/tpm.h"
> +#include "qemu/iova-tree.h"

Unnecessary

>  
>  VFIOGroupList vfio_group_list =
>      QLIST_HEAD_INITIALIZER(vfio_group_list);
> @@ -1313,11 +1314,94 @@ static int vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
>      return ret;
>  }
>  
> +/*
> + * Called for the dirty tracking memory listener to calculate the iova/end
> + * for a given memory region section. The checks here, replicate the logic
> + * in vfio_listener_region_{add,del}() used for the same purpose. And thus
> + * both listener should be kept in sync.
> + */
> +static bool vfio_get_section_iova_range(VFIOContainer *container,
> +                                        MemoryRegionSection *section,
> +                                        hwaddr *out_iova, hwaddr *out_end)
> +{
> +    Int128 llend;
> +    hwaddr iova;
> +
> +    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
> +    llend = int128_make64(section->offset_within_address_space);
> +    llend = int128_add(llend, section->size);
> +    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
> +
> +    if (int128_ge(int128_make64(iova), llend)) {
> +        return false;
> +    }
> +
> +    *out_iova = iova;
> +    *out_end = int128_get64(llend) - 1;
> +    return true;
> +}

Not sure why this isn't turned into a helper here to avoid the issue
noted in the comment.  Also why do both of the existing listener
implementations resolve the end address as:

	int128_get64(int128_sub(llend, int128_one()));

While here we use:

	int128_get64(llend) - 1;

We're already out of sync.

> +
> +static void vfio_dirty_tracking_update(MemoryListener *listener,
> +                                       MemoryRegionSection *section)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer,
> +                                            tracking_listener);
> +    VFIODirtyTrackingRange *range = &container->tracking_range;
> +    hwaddr max32 = (1ULL << 32) - 1ULL;

UINT32_MAX

> +    hwaddr iova, end;
> +
> +    if (!vfio_listener_valid_section(section) ||
> +        !vfio_get_section_iova_range(container, section, &iova, &end)) {
> +        return;
> +    }
> +
> +    WITH_QEMU_LOCK_GUARD(&container->tracking_mutex) {
> +        if (iova < max32 && end <= max32) {
> +                if (range->min32 > iova) {
> +                    range->min32 = iova;
> +                }
> +                if (range->max32 < end) {
> +                    range->max32 = end;
> +                }
> +                trace_vfio_device_dirty_tracking_update(iova, end,
> +                                            range->min32, range->max32);
> +        } else {
> +                if (!range->min64 || range->min64 > iova) {
> +                    range->min64 = iova;
> +                }

I think this improperly handles a range starting at zero, min64 should
be UINT64_MAX initially.  For example, if we have ranges 0-8GB and
12-16GB, this effectively ignores the first range.  Likewise I think
range->min32 has a similar problem, it's initialized to zero, it will
never be updated to match a non-zero lowest range.  It needs to be
initialized to UINT32_MAX.

A comment describing the purpose of the 32/64 split tracking would be
useful too.

> +                if (range->max64 < end) {
> +                    range->max64 = end;
> +                }
> +                trace_vfio_device_dirty_tracking_update(iova, end,
> +                                            range->min64, range->max64);
> +        }
> +    }
> +    return;
> +}
> +
> +static const MemoryListener vfio_dirty_tracking_listener = {
> +    .name = "vfio-tracking",
> +    .region_add = vfio_dirty_tracking_update,
> +};
> +
> +static void vfio_dirty_tracking_init(VFIOContainer *container)
> +{
> +    memset(&container->tracking_range, 0, sizeof(container->tracking_range));
> +    qemu_mutex_init(&container->tracking_mutex);

As noted in other thread, this mutex seems unnecessary.

The listener needs to be embedded in an object, but it doesn't need to
be the container.  Couldn't we create:

typedef struct VFIODirtyRanges {
    VFIOContainer *container;
    VFIODirtyTrackingRange ranges;
    MemoryListener listener;
} VFIODirectRanges;

For use here?  Caller could provide VFIODirtyTrackingRange pointer for
the resulting ranges, which then gets passed to
vfio_device_feature_dma_logging_start_create()

> +    container->tracking_listener = vfio_dirty_tracking_listener;
> +    memory_listener_register(&container->tracking_listener,
> +                             container->space->as);
> +    memory_listener_unregister(&container->tracking_listener);

It's sufficiently subtle that the listener callback is synchronous and
we're done with it here for a comment.

> +    qemu_mutex_destroy(&container->tracking_mutex);
> +}
> +
>  static void vfio_listener_log_global_start(MemoryListener *listener)
>  {
>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>      int ret;
>  
> +    vfio_dirty_tracking_init(container);
> +
>      ret = vfio_set_dirty_page_tracking(container, true);
>      if (ret) {
>          vfio_set_migration_error(ret);
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 669d9fe07cd9..d97a6de17921 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -104,6 +104,7 @@ vfio_known_safe_misalignment(const char *name, uint64_t iova, uint64_t offset_wi
>  vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>  vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
>  vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
> +vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t min, uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" - 0x%"PRIx64"]"
>  vfio_disconnect_container(int fd) "close container->fd=%d"
>  vfio_put_group(int fd) "close group->fd=%d"
>  vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 87524c64a443..96791add2719 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -23,6 +23,7 @@
>  
>  #include "exec/memory.h"
>  #include "qemu/queue.h"
> +#include "qemu/iova-tree.h"

Unused.

>  #include "qemu/notify.h"
>  #include "ui/console.h"
>  #include "hw/display/ramfb.h"
> @@ -68,6 +69,13 @@ typedef struct VFIOMigration {
>      size_t data_buffer_size;
>  } VFIOMigration;
>  
> +typedef struct VFIODirtyTrackingRange {
> +    hwaddr min32;
> +    hwaddr max32;
> +    hwaddr min64;
> +    hwaddr max64;
> +} VFIODirtyTrackingRange;
> +
>  typedef struct VFIOAddressSpace {
>      AddressSpace *as;
>      QLIST_HEAD(, VFIOContainer) containers;
> @@ -89,6 +97,9 @@ typedef struct VFIOContainer {
>      uint64_t max_dirty_bitmap_size;
>      unsigned long pgsizes;
>      unsigned int dma_max_mappings;
> +    VFIODirtyTrackingRange tracking_range;
> +    QemuMutex tracking_mutex;
> +    MemoryListener tracking_listener;

Let's make this unnecessary too.  Thanks,

Alex

>      QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
>      QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
>      QLIST_HEAD(, VFIOGroup) group_list;



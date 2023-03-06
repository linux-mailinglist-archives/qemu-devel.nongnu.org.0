Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E0F6ACBF5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 19:07:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZFDG-0008R8-9h; Mon, 06 Mar 2023 13:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZFDD-0008Le-JO
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:05:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZFDB-0000Nx-Ix
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:05:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678125924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qqmoOSMaZCNa4R1e9w1zUTk5A1vOHliytpF4LJve8Xc=;
 b=f3SxFsop/xEFw1uOAuC/YRlI/VHX9/+Dt4LhSpH+IgKk/wJ0cnjvBbbHT486DPwBZ26M3X
 woHBwHipzyHZbCnD/vq1t5LxIkCtLNZ7i/MZXuej5/JYcJFWUtkmdn+nBqlkHw+jPSQ528
 lTHpp2Eo+9GtgoNWTapsR30mGt6heXw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-5pWp2vGlMze8ye5yvJ7pjQ-1; Mon, 06 Mar 2023 13:05:20 -0500
X-MC-Unique: 5pWp2vGlMze8ye5yvJ7pjQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 l12-20020ac84a8c000000b003bfe751a7fdso5671145qtq.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 10:05:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678125920;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qqmoOSMaZCNa4R1e9w1zUTk5A1vOHliytpF4LJve8Xc=;
 b=odavot531q0e3G01Te3ru3ClF4u8DtNZrNXfgqRCYEaPp+EJmEunMaLD3gFYUd51Pa
 dB9NI0ZcebldNMfGWmvjAP5mo9z3qYHSHKdIYZol8sG23alrK7oW/6MK2VfoZ7lFx9ay
 0pD0NI44wnpWKWBAxchR7qpJJAovowou2Xw/zPTSglGN2lQ7P9FfFH35ibtFveZBHkAY
 nU058uTwraN9V5/AGTClqMaSZWrrmF/HrJ+zuB68ugrLLL7XKtsHQhUlin5/otEbcg5U
 v2iOczxpKtcV+wikyVvlddtbxB39AyaPDJK/gGxKiiwBZdAyDCezgABpvoarZhKEjP6/
 xTvA==
X-Gm-Message-State: AO0yUKU2/SqEEO7DzsyQM033xK0bI1QdQG2NYP8HoTk2H80vSVMsus4n
 fM/FDfMDrtt8CWPOLEiXsnrQaPKEq275myDQ31qLmw9lS8G7zk/94m9fOs/dSp0v6orz3WXkE8T
 n3MLcY5UETrlI9qU=
X-Received: by 2002:a05:622a:1041:b0:3bf:c352:c8cc with SMTP id
 f1-20020a05622a104100b003bfc352c8ccmr20202911qte.31.1678125920312; 
 Mon, 06 Mar 2023 10:05:20 -0800 (PST)
X-Google-Smtp-Source: AK7set/HB+LAevVMc+uWVs+vSNySJIvZpP81RgZ2RbMO742dmN/RUmv15d1ChHapTQrbQ/0hyrozfA==
X-Received: by 2002:a05:622a:1041:b0:3bf:c352:c8cc with SMTP id
 f1-20020a05622a104100b003bfc352c8ccmr20202865qte.31.1678125920044; 
 Mon, 06 Mar 2023 10:05:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a05622a018c00b003b323387c1asm8113999qtw.18.2023.03.06.10.05.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 10:05:19 -0800 (PST)
Message-ID: <aa74d068-2897-88b2-a829-be477e832f20@redhat.com>
Date: Mon, 6 Mar 2023 19:05:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 07/13] vfio/common: Record DMA mapped IOVA ranges
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-8-joao.m.martins@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230304014343.33646-8-joao.m.martins@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
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
> According to the device DMA logging uAPI, IOVA ranges to be logged by
> the device must be provided all at once upon DMA logging start.
> 
> As preparation for the following patches which will add device dirty
> page tracking, keep a record of all DMA mapped IOVA ranges so later they
> can be used for DMA logging start.
> 
> Note that when vIOMMU is enabled DMA mapped IOVA ranges are not tracked.
> This is due to the dynamic nature of vIOMMU DMA mapping/unmapping.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

One question below,

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

> ---
>   hw/vfio/common.c              | 84 +++++++++++++++++++++++++++++++++++
>   hw/vfio/trace-events          |  1 +
>   include/hw/vfio/vfio-common.h | 11 +++++
>   3 files changed, 96 insertions(+)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index ed908e303dbb..d84e5fd86bb4 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -44,6 +44,7 @@
>   #include "migration/blocker.h"
>   #include "migration/qemu-file.h"
>   #include "sysemu/tpm.h"
> +#include "qemu/iova-tree.h"
>   
>   VFIOGroupList vfio_group_list =
>       QLIST_HEAD_INITIALIZER(vfio_group_list);
> @@ -1313,11 +1314,94 @@ static int vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
>       return ret;
>   }
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
> +
> +static void vfio_dirty_tracking_update(MemoryListener *listener,
> +                                       MemoryRegionSection *section)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer,
> +                                            tracking_listener);
> +    VFIODirtyTrackingRange *range = &container->tracking_range;
> +    hwaddr max32 = (1ULL << 32) - 1ULL;
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

With the memset(0) done in vfio_dirty_tracking_init(), min32 will always
be 0. Is that OK ?

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
> +    container->tracking_listener = vfio_dirty_tracking_listener;
> +    memory_listener_register(&container->tracking_listener,
> +                             container->space->as);
> +    memory_listener_unregister(&container->tracking_listener);
> +    qemu_mutex_destroy(&container->tracking_mutex);
> +}
> +
>   static void vfio_listener_log_global_start(MemoryListener *listener)
>   {
>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>       int ret;
>   
> +    vfio_dirty_tracking_init(container);
> +
>       ret = vfio_set_dirty_page_tracking(container, true);
>       if (ret) {
>           vfio_set_migration_error(ret);
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 669d9fe07cd9..d97a6de17921 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -104,6 +104,7 @@ vfio_known_safe_misalignment(const char *name, uint64_t iova, uint64_t offset_wi
>   vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>   vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
>   vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
> +vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t min, uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" - 0x%"PRIx64"]"
>   vfio_disconnect_container(int fd) "close container->fd=%d"
>   vfio_put_group(int fd) "close group->fd=%d"
>   vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 87524c64a443..96791add2719 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -23,6 +23,7 @@
>   
>   #include "exec/memory.h"
>   #include "qemu/queue.h"
> +#include "qemu/iova-tree.h"
>   #include "qemu/notify.h"
>   #include "ui/console.h"
>   #include "hw/display/ramfb.h"
> @@ -68,6 +69,13 @@ typedef struct VFIOMigration {
>       size_t data_buffer_size;
>   } VFIOMigration;
>   
> +typedef struct VFIODirtyTrackingRange {
> +    hwaddr min32;
> +    hwaddr max32;
> +    hwaddr min64;
> +    hwaddr max64;
> +} VFIODirtyTrackingRange;
> +
>   typedef struct VFIOAddressSpace {
>       AddressSpace *as;
>       QLIST_HEAD(, VFIOContainer) containers;
> @@ -89,6 +97,9 @@ typedef struct VFIOContainer {
>       uint64_t max_dirty_bitmap_size;
>       unsigned long pgsizes;
>       unsigned int dma_max_mappings;
> +    VFIODirtyTrackingRange tracking_range;
> +    QemuMutex tracking_mutex;
> +    MemoryListener tracking_listener;
>       QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
>       QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
>       QLIST_HEAD(, VFIOGroup) group_list;



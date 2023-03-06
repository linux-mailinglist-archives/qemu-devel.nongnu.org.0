Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A606AC1A6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:42:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZB6E-00055A-2J; Mon, 06 Mar 2023 08:41:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZB68-00051t-7l
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:41:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZB66-0001aY-3T
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:41:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678110108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SVNpmVOpztHaHl4r5j3ZvjfXZhmsMGytMF45RMDATS8=;
 b=T3YLoNmNILjywoOUUQ6AYbUpz3BRsjTj/suAA8nuQRnW9z87DowuaAVwnmQ2Kx1nNoROAr
 nQo/lB+o+807cF2BGmyST9FBoN9aHpxl+aurKapXp/+SVvw7x/mIVlUUgH8L8BzMLWCLtH
 3k2tqWMfPD8rtqmcPLc0C9+Gm+EM9dA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-6vAV-Y88NQ-lys6iQqI8nw-1; Mon, 06 Mar 2023 08:41:47 -0500
X-MC-Unique: 6vAV-Y88NQ-lys6iQqI8nw-1
Received: by mail-qk1-f199.google.com with SMTP id
 m25-20020ae9e019000000b007421ddd945eso5315146qkk.6
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:41:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678110107;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SVNpmVOpztHaHl4r5j3ZvjfXZhmsMGytMF45RMDATS8=;
 b=CVrCBVst6D/GifIypZ7nBA0xu5qCN+rUd7bhAMJrQ5D1UPT8nDXn4ethvIOHFkotTJ
 6hD7xJtA11yCJfeOk2YVaijQzMQcyD8PSjgjV8n/2C4V/BV212LmmIUrymRbDq8gMxZL
 bCCWwBp5H0kgUYCy4HtajU6QsMaSGeM6VroTRHMutez34gp8GRPPxDZ5FaYVTijfMeqg
 PqB1bccejMawC9YAEToDSWeuw4HalfSMng6bGLbxc29wK70/A/tK/Sex5wOEVcCE746K
 CtPpTHv+RovnAkSAR5v6vMsteaqv8UukSHrb0NNx1V7Sq11pIfINOb6uPsNiGXi13JpU
 mryQ==
X-Gm-Message-State: AO0yUKUe8yaGNIB5wvu72XTo0IOTBlFm2QUVX4Kf484r6M7YRMT79N3i
 AoCj2kgaoU0RHEJZ4S0kKH9z+oe/bjzrC5stUGrtRRrh9mX2hrX7E98sCg4Hg+nXNvZfc8FAc0g
 weT9J1IRUKR5gRHk=
X-Received: by 2002:ac8:4e4d:0:b0:3c0:14ec:bfc0 with SMTP id
 e13-20020ac84e4d000000b003c014ecbfc0mr17503326qtw.22.1678110107133; 
 Mon, 06 Mar 2023 05:41:47 -0800 (PST)
X-Google-Smtp-Source: AK7set/wsr3AR7xag+hye4vF9lOyvWe2YN3asYIZswp1G2Mu2RBBiJP/4snKCUBbWgc0zr42rjuyig==
X-Received: by 2002:ac8:4e4d:0:b0:3c0:14ec:bfc0 with SMTP id
 e13-20020ac84e4d000000b003c014ecbfc0mr17503302qtw.22.1678110106915; 
 Mon, 06 Mar 2023 05:41:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a05620a121300b007424376ca4bsm7433562qkj.18.2023.03.06.05.41.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:41:46 -0800 (PST)
Message-ID: <2d1677ea-4895-f7e9-a6dd-0973cd270e5b@redhat.com>
Date: Mon, 6 Mar 2023 14:41:43 +0100
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
Content-Transfer-Encoding: 7bit
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

The following unregister+destroy calls seem to belong to a _fini routine.
Am I missing something ?

Thanks,

C.

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



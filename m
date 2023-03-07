Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD6A6ADB70
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:09:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUFX-0003Fs-Qx; Tue, 07 Mar 2023 05:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZUFU-0003Dz-HQ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:08:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZUFS-00012I-5x
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:08:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678183725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xxFV4+MVeVAdKmWbokk9Q9aQgGKnBeNDyMpyFQKG74M=;
 b=P3o0coZdSFPOALrAwKcoDdCpm2oCxyKKKW4ktkr7xt6+DTw34aoJaU4xGzq58z2xI8i3Sy
 Q52OWsYeVyE0WxkOlNpd7Hdy9xBrZuLTAgeb1eUJpBvLOGtpw9PKsFuv5pB2N0xHl+1D97
 /yemFwyS0r1kCjAV0T2CV9XioD3ehFs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-w6qn6ir7M5iVfb45PtcERQ-1; Tue, 07 Mar 2023 05:08:42 -0500
X-MC-Unique: w6qn6ir7M5iVfb45PtcERQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 y1-20020a05620a09c100b0070630ecfd9bso7070260qky.20
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 02:08:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678183722;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xxFV4+MVeVAdKmWbokk9Q9aQgGKnBeNDyMpyFQKG74M=;
 b=wRw3vm0hqgc+mm1o8ifmmZA7prctgQgTvxtxx4dyktgJQDDUKX5mTt3xMxLBfZwviz
 fVzeOi/X73ZERFfPrUEugFP9Is7//qDajahD9jFCmGb2CVr/+DaJD9ImnxqDb0ef5SQF
 OofCJ/QYHHkV0I4AFuXtpQeTKCcG4DLifNoFKYZI6g8u1xBVl2PeDkJHGSoI9me0LL0m
 06TdcOFlwU8QoFcGj9v2Nb1KX5u8JObeU12L7ZeQon7m4NCx9XAccNakPuyaBPXndCcs
 Co5M6zB9hP3ysAO7VQG+G8EqGMQAXoGavsyN+nOhXdcASKK4seAtiEJkXGCtQIL/zzzH
 csxw==
X-Gm-Message-State: AO0yUKXZq1/qbUj/ncRux4jsx3fwzc/+dkBCHJ1TxN0cFB3Q/ZnoET1o
 wRQ3I6VTwaDVG1vkeQogMk7rKzNNwNu8/vqZUnqii8zYRpiqJBRYB2ctbsgjxR4N/FtuysVxpAA
 KTcpxaCBac/+yq9c=
X-Received: by 2002:ac8:5801:0:b0:3bf:d1b3:2be2 with SMTP id
 g1-20020ac85801000000b003bfd1b32be2mr21349509qtg.63.1678183722297; 
 Tue, 07 Mar 2023 02:08:42 -0800 (PST)
X-Google-Smtp-Source: AK7set8srZYRBi89bdnEV1tQIF3uYuhYVb5Lbbo9BzCZpJHpv4q4+3/XHe7lNe/QuhmMcrpSnLRv9g==
X-Received: by 2002:ac8:5801:0:b0:3bf:d1b3:2be2 with SMTP id
 g1-20020ac85801000000b003bfd1b32be2mr21349494qtg.63.1678183721945; 
 Tue, 07 Mar 2023 02:08:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a05620a2a5c00b007422fd3009esm9356883qkp.20.2023.03.07.02.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 02:08:41 -0800 (PST)
Message-ID: <8075fea3-fbd8-13b2-8afe-2db8f104ba5f@redhat.com>
Date: Tue, 7 Mar 2023 11:08:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 08/14] vfio/common: Record DMA mapped IOVA ranges
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Avihai Horon <avihaih@nvidia.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-9-joao.m.martins@oracle.com>
 <20230306195736.3efc6980.alex.williamson@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230306195736.3efc6980.alex.williamson@redhat.com>
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

On 3/7/23 03:57, Alex Williamson wrote:
> On Tue,  7 Mar 2023 02:02:52 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> According to the device DMA logging uAPI, IOVA ranges to be logged by
>> the device must be provided all at once upon DMA logging start.
>>
>> As preparation for the following patches which will add device dirty
>> page tracking, keep a record of all DMA mapped IOVA ranges so later they
>> can be used for DMA logging start.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>   hw/vfio/common.c              | 76 +++++++++++++++++++++++++++++++++++
>>   hw/vfio/trace-events          |  1 +
>>   include/hw/vfio/vfio-common.h | 13 ++++++
>>   3 files changed, 90 insertions(+)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 3a6491dbc523..a9b1fc999121 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -1334,11 +1334,87 @@ static int vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
>>       return ret;
>>   }
>>   
>> +static void vfio_dirty_tracking_update(MemoryListener *listener,
>> +                                       MemoryRegionSection *section)
>> +{
>> +    VFIODirtyRanges *dirty = container_of(listener, VFIODirtyRanges, listener);
>> +    VFIODirtyTrackingRange *range = &dirty->ranges;
>> +    hwaddr max32 = UINT32_MAX - 1ULL;
> 
> The -1 is wrong here, UINT32_MAX is (2^32 - 1)
> 
>> +    hwaddr iova, end;
>> +
>> +    if (!vfio_listener_valid_section(section) ||
>> +        !vfio_get_section_iova_range(dirty->container, section,
>> +                                     &iova, &end, NULL)) {
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * The address space passed to the dirty tracker is reduced to two ranges:
>> +     * one for 32-bit DMA ranges, and another one for 64-bit DMA ranges.
>> +     * The underlying reports of dirty will query a sub-interval of each of
>> +     * these ranges.
>> +     *
>> +     * The purpose of the dual range handling is to handle known cases of big
>> +     * holes in the address space, like the x86 AMD 1T hole. The alternative
>> +     * would be an IOVATree but that has a much bigger runtime overhead and
>> +     * unnecessary complexity.
>> +     */
>> +    if (iova < max32 && end <= max32) {
> 
> Nit, the first test is redundant, iova is necessarily less than end.
> 
>> +        if (range->min32 > iova) {
>> +            range->min32 = iova;
>> +        }
>> +        if (range->max32 < end) {
>> +            range->max32 = end;
>> +        }
>> +        trace_vfio_device_dirty_tracking_update(iova, end,
>> +                                    range->min32, range->max32);
>> +    } else {
>> +        if (!range->min64 || range->min64 > iova) {
> 
> The first test should be removed, we're initializing min64 to a
> non-zero value now, so if it's zero it's been set and we can't
> de-prioritize that set value.
> 
>> +            range->min64 = iova;
>> +        }
>> +        if (range->max64 < end) {
>> +            range->max64 = end;
>> +        }
>> +        trace_vfio_device_dirty_tracking_update(iova, end,
>> +                                    range->min64, range->max64);
>> +    }
>> +
>> +    return;
>> +}
>> +
>> +static const MemoryListener vfio_dirty_tracking_listener = {
>> +    .name = "vfio-tracking",
>> +    .region_add = vfio_dirty_tracking_update,
>> +};
>> +
>> +static void vfio_dirty_tracking_init(VFIOContainer *container,
>> +                                     VFIODirtyRanges *dirty)
>> +{
>> +    memset(dirty, 0, sizeof(*dirty));
>> +    dirty->ranges.min32 = UINT32_MAX;
>> +    dirty->ranges.min64 = UINT64_MAX;
>> +    dirty->listener = vfio_dirty_tracking_listener;
>> +    dirty->container = container;
>> +
> 
> I was actually thinking the caller would just pass
> VFIODirtyTrackingRange and VFIODirtyRanges would be allocated on the
> stack here, perhaps both are defined private to this file, but this
> works and we can refine later if we so decide.  

It is true that vfio_devices_dma_logging_start() only needs
a VFIODirtyTrackingRange struct and not the VFIODirtyRanges struct
which is a temporary structure for the dirty ranges calculation.
That would be nicer to have if you respin a v5.

I would rename VFIODirtyRanges to VFIODirtyRangesListener and
VFIODirtyTrackingRange to VFIODirtyRanges.

I am not sure they need to be in include/hw/vfio/vfio-common.h but
that seems to be the VFIO practice.

Thanks,

C.


> 
> Alex
> 
> 
>> +    memory_listener_register(&dirty->listener,
>> +                             container->space->as);
>> +
>> +    /*
>> +     * The memory listener is synchronous, and used to calculate the range
>> +     * to dirty tracking. Unregister it after we are done as we are not
>> +     * interested in any follow-up updates.
>> +     */
>> +    memory_listener_unregister(&dirty->listener);
>> +}
>> +
>>   static void vfio_listener_log_global_start(MemoryListener *listener)
>>   {
>>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>> +    VFIODirtyRanges dirty;
>>       int ret;
>>   
>> +    vfio_dirty_tracking_init(container, &dirty);
>> +
>>       ret = vfio_set_dirty_page_tracking(container, true);
>>       if (ret) {
>>           vfio_set_migration_error(ret);
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index 669d9fe07cd9..d97a6de17921 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -104,6 +104,7 @@ vfio_known_safe_misalignment(const char *name, uint64_t iova, uint64_t offset_wi
>>   vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>>   vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
>>   vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
>> +vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t min, uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" - 0x%"PRIx64"]"
>>   vfio_disconnect_container(int fd) "close container->fd=%d"
>>   vfio_put_group(int fd) "close group->fd=%d"
>>   vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index 87524c64a443..0f84136cceb5 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -96,6 +96,19 @@ typedef struct VFIOContainer {
>>       QLIST_ENTRY(VFIOContainer) next;
>>   } VFIOContainer;
>>   
>> +typedef struct VFIODirtyTrackingRange {
>> +    hwaddr min32;
>> +    hwaddr max32;
>> +    hwaddr min64;
>> +    hwaddr max64;
>> +} VFIODirtyTrackingRange;
>> +
>> +typedef struct VFIODirtyRanges {
>> +    VFIOContainer *container;
>> +    VFIODirtyTrackingRange ranges;
>> +    MemoryListener listener;
>> +} VFIODirtyRanges;
>> +
>>   typedef struct VFIOGuestIOMMU {
>>       VFIOContainer *container;
>>       IOMMUMemoryRegion *iommu_mr;
> 



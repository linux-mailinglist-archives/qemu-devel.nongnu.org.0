Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEF42DE04D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 10:13:23 +0100 (CET)
Received: from localhost ([::1]:57158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqBpC-0003ml-ES
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 04:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kqBnx-0003Ft-I2
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 04:12:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kqBnr-0007Au-2p
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 04:12:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608282717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i7hEcN4ulZa5ZoNRcYpGlMmDvFAborHg3oDQfCctFSA=;
 b=PVmBJrIdoQT2Fa5+rUj2AsfG+3Kb5PrTVDcSC9o0STJx8y1+ozKwOFKgBAoMT59lh8eBcp
 1w+JpNfmELqSpi7dboDSO3ig5v1xOmScjKVydujZbbdMh+6N4KwH9xYXuDp7h1GeYUXmmu
 GEc8lSxckL8oLp8pX6HGP+zdBpgKH9E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-0IcY2zdvNlez4O54yx65eA-1; Fri, 18 Dec 2020 04:11:55 -0500
X-MC-Unique: 0IcY2zdvNlez4O54yx65eA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C017800D62;
 Fri, 18 Dec 2020 09:11:54 +0000 (UTC)
Received: from [10.36.114.209] (ovpn-114-209.ams2.redhat.com [10.36.114.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72E2F6A8E4;
 Fri, 18 Dec 2020 09:11:38 +0000 (UTC)
Subject: Re: [PATCH v3 05/10] vfio: Support for RamDiscardMgr in the !vIOMMU
 case
To: Alex Williamson <alex.williamson@redhat.com>
References: <20201216141200.118742-1-david@redhat.com>
 <20201216141200.118742-6-david@redhat.com>
 <20201217113612.0410b143@omen.home>
 <ff63c12d-9d96-0650-de19-9331091aaaf7@redhat.com>
 <20201217125905.7cff1c12@omen.home>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <7d05c295-4081-f374-2a30-88165e58945a@redhat.com>
Date: Fri, 18 Dec 2020 10:11:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201217125905.7cff1c12@omen.home>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.12.20 20:59, Alex Williamson wrote:
> On Thu, 17 Dec 2020 19:55:55 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
>> On 17.12.20 19:36, Alex Williamson wrote:
>>> On Wed, 16 Dec 2020 15:11:55 +0100
>>> David Hildenbrand <david@redhat.com> wrote:
>>>   
>>>> Implement support for RamDiscardMgr, to prepare for virtio-mem
>>>> support. Instead of mapping the whole memory section, we only map
>>>> "populated" parts and update the mapping when notified about
>>>> discarding/population of memory via the RamDiscardListener. Similarly, when
>>>> syncing the dirty bitmaps, sync only the actually mapped (populated) parts
>>>> by replaying via the notifier.
>>>>
>>>> Small mapping granularity is problematic for vfio, because we might run out
>>>> of mappings. Indicate virito-mem as one of the problematic parts when
>>>> warning in vfio_container_dma_reserve() to at least make users aware that
>>>> there is such a limitation.
>>>>
>>>> Using virtio-mem with vfio is still blocked via
>>>> ram_block_discard_disable()/ram_block_discard_require() after this patch.
>>>>
>>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>>>> Cc: Alex Williamson <alex.williamson@redhat.com>
>>>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>> Cc: Igor Mammedov <imammedo@redhat.com>
>>>> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
>>>> Cc: Peter Xu <peterx@redhat.com>
>>>> Cc: Auger Eric <eric.auger@redhat.com>
>>>> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
>>>> Cc: teawater <teawaterz@linux.alibaba.com>
>>>> Cc: Marek Kedzierski <mkedzier@redhat.com>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>  hw/vfio/common.c              | 213 +++++++++++++++++++++++++++++++++-
>>>>  include/hw/vfio/vfio-common.h |  13 +++
>>>>  2 files changed, 225 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>>>> index 5ad88d476f..b1582be1e8 100644
>>>> --- a/hw/vfio/common.c
>>>> +++ b/hw/vfio/common.c
>>>> @@ -296,7 +296,8 @@ static void vfio_container_dma_reserve(VFIOContainer *container,
>>>>      container->dma_reserved += dma_mappings;
>>>>      if (!warned && container->dma_max &&
>>>>          container->dma_reserved > container->dma_max) {
>>>> -        warn_report("%s: possibly running out of DMA mappings. "
>>>> +        warn_report("%s: possibly running out of DMA mappings. E.g., try"
>>>> +                    " increasing the 'block-size' of virtio-mem devies."
>>>>                      " Maximum number of DMA mappings: %d", __func__,
>>>>                      container->dma_max);
>>>>      }
>>>> @@ -674,6 +675,146 @@ out:
>>>>      rcu_read_unlock();
>>>>  }
>>>>  
>>>> +static void vfio_ram_discard_notify_discard(RamDiscardListener *rdl,
>>>> +                                            const MemoryRegion *mr,
>>>> +                                            ram_addr_t offset, ram_addr_t size)
>>>> +{
>>>> +    VFIORamDiscardListener *vrdl = container_of(rdl, VFIORamDiscardListener,
>>>> +                                                listener);
>>>> +    const hwaddr mr_start = MAX(offset, vrdl->offset_within_region);
>>>> +    const hwaddr mr_end = MIN(offset + size,
>>>> +                              vrdl->offset_within_region + vrdl->size);
>>>> +    const hwaddr iova = mr_start - vrdl->offset_within_region +
>>>> +                        vrdl->offset_within_address_space;
>>>> +    int ret;
>>>> +
>>>> +    if (mr_start >= mr_end) {
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    /* Unmap with a single call. */
>>>> +    ret = vfio_dma_unmap(vrdl->container, iova, mr_end - mr_start, NULL);
>>>> +    if (ret) {
>>>> +        error_report("%s: vfio_dma_unmap() failed: %s", __func__,
>>>> +                     strerror(-ret));
>>>> +    }
>>>> +}
>>>> +
>>>> +static int vfio_ram_discard_notify_populate(RamDiscardListener *rdl,
>>>> +                                            const MemoryRegion *mr,
>>>> +                                            ram_addr_t offset, ram_addr_t size)
>>>> +{
>>>> +    VFIORamDiscardListener *vrdl = container_of(rdl, VFIORamDiscardListener,
>>>> +                                                listener);
>>>> +    const hwaddr mr_end = MIN(offset + size,
>>>> +                              vrdl->offset_within_region + vrdl->size);
>>>> +    hwaddr mr_start = MAX(offset, vrdl->offset_within_region);
>>>> +    hwaddr mr_next, iova;
>>>> +    void *vaddr;
>>>> +    int ret;
>>>> +
>>>> +    /*
>>>> +     * Map in (aligned within memory region) minimum granularity, so we can
>>>> +     * unmap in minimum granularity later.
>>>> +     */
>>>> +    for (; mr_start < mr_end; mr_start = mr_next) {
>>>> +        mr_next = QEMU_ALIGN_UP(mr_start + 1, vrdl->granularity);
>>>> +        mr_next = MIN(mr_next, mr_end);
>>>> +
>>>> +        iova = mr_start - vrdl->offset_within_region +
>>>> +               vrdl->offset_within_address_space;
>>>> +        vaddr = memory_region_get_ram_ptr(vrdl->mr) + mr_start;
>>>> +
>>>> +        ret = vfio_dma_map(vrdl->container, iova, mr_next - mr_start,
>>>> +                           vaddr, mr->readonly);
>>>> +        if (ret) {
>>>> +            /* Rollback */
>>>> +            vfio_ram_discard_notify_discard(rdl, mr, offset, size);
>>>> +            return ret;
>>>> +        }
>>>> +    }
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static void vfio_ram_discard_notify_discard_all(RamDiscardListener *rdl,
>>>> +                                                const MemoryRegion *mr)
>>>> +{
>>>> +    VFIORamDiscardListener *vrdl = container_of(rdl, VFIORamDiscardListener,
>>>> +                                                listener);
>>>> +    int ret;
>>>> +
>>>> +    /* Unmap with a single call. */
>>>> +    ret = vfio_dma_unmap(vrdl->container, vrdl->offset_within_address_space,
>>>> +                         vrdl->size, NULL);
>>>> +    if (ret) {
>>>> +        error_report("%s: vfio_dma_unmap() failed: %s", __func__,
>>>> +                     strerror(-ret));
>>>> +    }
>>>> +}
>>>> +
>>>> +static void vfio_register_ram_discard_notifier(VFIOContainer *container,
>>>> +                                               MemoryRegionSection *section)
>>>> +{
>>>> +    RamDiscardMgr *rdm = memory_region_get_ram_discard_mgr(section->mr);
>>>> +    RamDiscardMgrClass *rdmc = RAM_DISCARD_MGR_GET_CLASS(rdm);
>>>> +    VFIORamDiscardListener *vrdl;
>>>> +
>>>> +    vrdl = g_new0(VFIORamDiscardListener, 1);
>>>> +    vrdl->container = container;
>>>> +    vrdl->mr = section->mr;
>>>> +    vrdl->offset_within_region = section->offset_within_region;
>>>> +    vrdl->offset_within_address_space = section->offset_within_address_space;
>>>> +    vrdl->size = int128_get64(section->size);
>>>> +    vrdl->granularity = rdmc->get_min_granularity(rdm, section->mr);
>>>> +    vrdl->dma_max = vrdl->size / vrdl->granularity;
>>>> +    if (!QEMU_IS_ALIGNED(vrdl->size, vrdl->granularity) ||
>>>> +        !QEMU_IS_ALIGNED(vrdl->offset_within_region, vrdl->granularity)) {
>>>> +        vrdl->dma_max++;
>>>> +    }
>>>> +
>>>> +    /* Ignore some corner cases not relevant in practice. */
>>>> +    g_assert(QEMU_IS_ALIGNED(vrdl->offset_within_region, TARGET_PAGE_SIZE));
>>>> +    g_assert(QEMU_IS_ALIGNED(vrdl->offset_within_address_space,
>>>> +                             TARGET_PAGE_SIZE));
>>>> +    g_assert(QEMU_IS_ALIGNED(vrdl->size, TARGET_PAGE_SIZE));
>>>> +
>>>> +    /* We could consume quite some mappings later. */
>>>> +    vfio_container_dma_reserve(container, vrdl->dma_max);  
>>>
>>>
>>> Aha, I guess this is where the "reservation" aspect begins to appear.
>>> Should this be its own counter though, perhaps
>>> dma_discard_max_mappings?  The populate and discard callbacks could
>>> further divide this into used and outstanding counters.  However, TBH
>>> I'm not sure I understand the counters since this is probably the most
>>> robust mapping path where we can actually safely nak a populate  
>>
>> I'd like to be able to warn early on fundamental setup issues, not only
>> when accidentally running into these limits later.
>>
>>> callback.  Maybe rather than any of these runtime counters we should
>>> just walk the vrdl_list, calculate max mappings, and if that exceeds
>>> some large fraction of available mappings, issue a warning (not that
>>> they wouldn't be useful for tracing).  Thanks,  
>>
>> Sure, we can calculate max mappings from the vrdl_list. But which
>> fraction to chose? The reservation approach simply considers any
>> mappings (well, except IOMMU because they are kind of special)
> 
> Right, but we're looking at the address space of a device, which should
> be exclusively system memory or an IOMMU range, right?  There are IOMMUs

Yes, that's why I ignored the IOMMU case for now - RamDiscardMgr and
vIOMMUs should be mutually exclusive in an address space.

> that don't restrict the device to the IOVA window, but I'm not sure if
> we care about those.  If that's true, I'm not sure we need to worry
> about the complicated intersection of RamDiscardMgr and vIOMMU both
> creating mappings.

Yes.

> 
>> Guidance on the fraction / #mappings to assume we can use appreciated.
> 
> Can we use the number of KVM memory slots as a guide?  This is
> essentially a mechanism for sub-dividing things that exist in a KVM
> memory slot, so it seems like (dma_avail - KVM-memory-slots) should be
> greater than the # of possible granules we'd map across all the
> RamDiscardMgr regions.  Maybe a good starting point?

Good idea. I stared with "maximum #DIMMs", but then thought "what about
mapping other things, like PCI bars into address space".
#max-KVM-memory-slots should be a good starting point for now.

So, when mapping a new RamDiscardMgr I'll
1. Loop over vrdl_list and calculate the max #mappings
2. Check against "dma_max - #max-KVM-memory-slots" and issue a
RamDiscardMgr specific error message


-- 
Thanks,

David / dhildenb



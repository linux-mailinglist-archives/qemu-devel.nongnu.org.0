Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654C92F6579
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:11:52 +0100 (CET)
Received: from localhost ([::1]:53086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05Dz-0002jY-EH
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:11:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l04xP-0006OO-55
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:54:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l04xK-0007Tn-Nk
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:54:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610639675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LdnBPa8fBC55o0aursgEdu2P4RXsksgt+5kaXbNdqnU=;
 b=GwDT9i660Xk7ewx3eQxVyqPRnQb3WKsVXSYf9V22RFTuyU6219iPLqW1wIN028J7vi7Coi
 4fF08fFIuNPttoc3xgBqPXY1d1j78IfQbp/Hzzp7UYbo6K7125LRHO3mtD/jAhOm0E/Qvy
 dNB/7V5lG/VTIifyGx6FZAGyHce/4DM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-ESP2-dhTPSWWc_v0wCMyjg-1; Thu, 14 Jan 2021 10:54:33 -0500
X-MC-Unique: ESP2-dhTPSWWc_v0wCMyjg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A9C1802B42;
 Thu, 14 Jan 2021 15:54:31 +0000 (UTC)
Received: from [10.36.115.75] (ovpn-115-75.ams2.redhat.com [10.36.115.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDB1C60938;
 Thu, 14 Jan 2021 15:54:15 +0000 (UTC)
Subject: Re: [PATCH v4 04/11] vfio: Support for RamDiscardMgr in the !vIOMMU
 case
To: Alex Williamson <alex.williamson@redhat.com>
References: <20210107133423.44964-1-david@redhat.com>
 <20210107133423.44964-5-david@redhat.com>
 <20210113162745.5c92e04f@omen.home.shazbot.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <651d5ef7-096f-0b71-2190-53532dab3dd0@redhat.com>
Date: Thu, 14 Jan 2021 16:54:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210113162745.5c92e04f@omen.home.shazbot.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 14.01.21 00:27, Alex Williamson wrote:
> On Thu,  7 Jan 2021 14:34:16 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
>> Implement support for RamDiscardMgr, to prepare for virtio-mem
>> support. Instead of mapping the whole memory section, we only map
>> "populated" parts and update the mapping when notified about
>> discarding/population of memory via the RamDiscardListener. Similarly, when
>> syncing the dirty bitmaps, sync only the actually mapped (populated) parts
>> by replaying via the notifier.
>>
>> Using virtio-mem with vfio is still blocked via
>> ram_block_discard_disable()/ram_block_discard_require() after this patch.
>>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Alex Williamson <alex.williamson@redhat.com>
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
>> Cc: Peter Xu <peterx@redhat.com>
>> Cc: Auger Eric <eric.auger@redhat.com>
>> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
>> Cc: teawater <teawaterz@linux.alibaba.com>
>> Cc: Marek Kedzierski <mkedzier@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>  hw/vfio/common.c              | 200 ++++++++++++++++++++++++++++++++++
>>  include/hw/vfio/vfio-common.h |  12 ++
>>  2 files changed, 212 insertions(+)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 6ff1daa763..2bd219cf1d 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -654,6 +654,136 @@ out:
>>      rcu_read_unlock();
>>  }
>>  
>> +static void vfio_ram_discard_notify_discard(RamDiscardListener *rdl,
>> +                                            const MemoryRegion *mr,
>> +                                            ram_addr_t offset, ram_addr_t size)
>> +{
>> +    VFIORamDiscardListener *vrdl = container_of(rdl, VFIORamDiscardListener,
>> +                                                listener);
>> +    const hwaddr mr_start = MAX(offset, vrdl->offset_within_region);
>> +    const hwaddr mr_end = MIN(offset + size,
>> +                              vrdl->offset_within_region + vrdl->size);
>> +    const hwaddr iova = mr_start - vrdl->offset_within_region +
>> +                        vrdl->offset_within_address_space;
>> +    int ret;
>> +
>> +    if (mr_start >= mr_end) {
>> +        return;
>> +    }
>> +
>> +    /* Unmap with a single call. */
>> +    ret = vfio_dma_unmap(vrdl->container, iova, mr_end - mr_start, NULL);
>> +    if (ret) {
>> +        error_report("%s: vfio_dma_unmap() failed: %s", __func__,
>> +                     strerror(-ret));
>> +    }
>> +}
>> +
>> +static int vfio_ram_discard_notify_populate(RamDiscardListener *rdl,
>> +                                            const MemoryRegion *mr,
>> +                                            ram_addr_t offset, ram_addr_t size)
>> +{
>> +    VFIORamDiscardListener *vrdl = container_of(rdl, VFIORamDiscardListener,
>> +                                                listener);
>> +    const hwaddr mr_end = MIN(offset + size,
>> +                              vrdl->offset_within_region + vrdl->size);
>> +    hwaddr mr_start = MAX(offset, vrdl->offset_within_region);
>> +    hwaddr mr_next, iova;
>> +    void *vaddr;
>> +    int ret;
>> +
>> +    /*
>> +     * Map in (aligned within memory region) minimum granularity, so we can
>> +     * unmap in minimum granularity later.
>> +     */
>> +    for (; mr_start < mr_end; mr_start = mr_next) {
>> +        mr_next = ROUND_UP(mr_start + 1, vrdl->granularity);
>> +        mr_next = MIN(mr_next, mr_end);
>> +
>> +        iova = mr_start - vrdl->offset_within_region +
>> +               vrdl->offset_within_address_space;
>> +        vaddr = memory_region_get_ram_ptr(vrdl->mr) + mr_start;
>> +
>> +        ret = vfio_dma_map(vrdl->container, iova, mr_next - mr_start,
>> +                           vaddr, mr->readonly);
>> +        if (ret) {
>> +            /* Rollback */
>> +            vfio_ram_discard_notify_discard(rdl, mr, offset, size);
>> +            return ret;
>> +        }
>> +    }
>> +    return 0;
>> +}
>> +
>> +static void vfio_ram_discard_notify_discard_all(RamDiscardListener *rdl,
>> +                                                const MemoryRegion *mr)
>> +{
>> +    VFIORamDiscardListener *vrdl = container_of(rdl, VFIORamDiscardListener,
>> +                                                listener);
>> +    int ret;
>> +
>> +    /* Unmap with a single call. */
>> +    ret = vfio_dma_unmap(vrdl->container, vrdl->offset_within_address_space,
>> +                         vrdl->size, NULL);
>> +    if (ret) {
>> +        error_report("%s: vfio_dma_unmap() failed: %s", __func__,
>> +                     strerror(-ret));
>> +    }
>> +}
>> +
>> +static void vfio_register_ram_discard_notifier(VFIOContainer *container,
>> +                                               MemoryRegionSection *section)
>> +{
>> +    RamDiscardMgr *rdm = memory_region_get_ram_discard_mgr(section->mr);
>> +    RamDiscardMgrClass *rdmc = RAM_DISCARD_MGR_GET_CLASS(rdm);
>> +    VFIORamDiscardListener *vrdl;
>> +
>> +    vrdl = g_new0(VFIORamDiscardListener, 1);
>> +    vrdl->container = container;
>> +    vrdl->mr = section->mr;
>> +    vrdl->offset_within_region = section->offset_within_region;
>> +    vrdl->offset_within_address_space = section->offset_within_address_space;
>> +    vrdl->size = int128_get64(section->size);
>> +    vrdl->granularity = rdmc->get_min_granularity(rdm, section->mr);
>> +
>> +    /* Ignore some corner cases not relevant in practice. */
>> +    g_assert(QEMU_IS_ALIGNED(vrdl->offset_within_region, TARGET_PAGE_SIZE));
>> +    g_assert(QEMU_IS_ALIGNED(vrdl->offset_within_address_space,
>> +                             TARGET_PAGE_SIZE));
>> +    g_assert(QEMU_IS_ALIGNED(vrdl->size, TARGET_PAGE_SIZE));
> 
> Should probably toss in a test of vrdl->granularity vs
> container->pgsizes too, right?  Looks good otherwise:

Makes sense as a sanity check. What about

g_assert(vrdl->granularity && !is_power_of_2(vrdl->granularity));
g_assert(vrdl->granularity >= 1 << ctz64(container->pgsizes));

?

Thanks!

> 
> Reviewed-by: Alex Williamson <alex.williamson@redhat.com>
> Acked-by: Alex Williamson <alex.williamson@redhat.com>

Thanks!

-- 
Thanks,

David / dhildenb



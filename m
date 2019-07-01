Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3C050757
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 12:11:15 +0200 (CEST)
Received: from localhost ([::1]:49418 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfLwQ-0004sA-Ii
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 06:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38722)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hfLvM-0004HC-4d
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 06:10:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hfLvK-0006Gf-Md
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 06:10:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46142)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hfLvK-0006FV-DY
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 06:10:06 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9509D85550;
 Mon, 24 Jun 2019 10:09:57 +0000 (UTC)
Received: from [10.36.116.89] (ovpn-116-89.ams2.redhat.com [10.36.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 875E75C1B5;
 Mon, 24 Jun 2019 10:09:49 +0000 (UTC)
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20190624091811.30412-1-peterx@redhat.com>
 <20190624091811.30412-3-peterx@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b4e30868-dc87-99ee-0696-a796421b00fc@redhat.com>
Date: Mon, 24 Jun 2019 12:09:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190624091811.30412-3-peterx@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 24 Jun 2019 10:09:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 2/2] intel_iommu: Fix unexpected unmaps
 during global unmap
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Yan Zhao <yan.y.zhao@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 6/24/19 11:18 AM, Peter Xu wrote:
> This is an replacement work of Yan Zhao's patch:
> 
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg625340.html
> 
> vtd_address_space_unmap() will do proper page mask alignment to make
> sure each IOTLB message will have correct masks for notification
> messages (2^N-1), but sometimes it can be expanded to even supercede
> the registered range.  That could lead to unexpected UNMAP of already
> mapped regions in some other notifiers.
> 
> Instead of doing mindless expension of the start address and address
> mask, we split the range into smaller ones and guarantee that each
> small range will have correct masks (2^N-1) and at the same time we
> should also try our best to generate as less IOTLB messages as
> possible.
> 
> Reported-by: Yan Zhao <yan.y.zhao@intel.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/i386/intel_iommu.c | 67 ++++++++++++++++++++++++++-----------------
>  1 file changed, 41 insertions(+), 26 deletions(-)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 719ce19ab3..de86f53b4e 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3363,11 +3363,28 @@ VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
>      return vtd_dev_as;
>  }
>  
> +static uint64_t get_naturally_aligned_size(uint64_t start,
> +                                           uint64_t size, int gaw)
> +{
> +    uint64_t max_mask = 1ULL << gaw;
> +    uint64_t alignment = start ? start & -start : max_mask;
> +
> +    alignment = MIN(alignment, max_mask);
> +    size = MIN(size, max_mask);
this does not not prevent from invalidating beyond gaw if start != 0, right?
> +
> +    if (alignment <= size) {
> +        /* Increase the alignment of start */
I don't really get this comment
> +        return alignment;
> +    } else {
> +        /* Find the largest page mask from size */
> +        return 1ULL << (63 - clz64(size));
> +    }> +}
> +
>  /* Unmap the whole range in the notifier's scope. */
>  static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
>  {
> -    IOMMUTLBEntry entry;
> -    hwaddr size;
> +    hwaddr size, remain;
>      hwaddr start = n->start;
>      hwaddr end = n->end;
>      IntelIOMMUState *s = as->iommu_state;
> @@ -3388,39 +3405,37 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
>      }
>  
>      assert(start <= end);
> -    size = end - start;
> +    size = remain = end - start + 1;
>  
> -    if (ctpop64(size) != 1) {
> -        /*
> -         * This size cannot format a correct mask. Let's enlarge it to
> -         * suite the minimum available mask.
> -         */
> -        int n = 64 - clz64(size);
> -        if (n > s->aw_bits) {
> -            /* should not happen, but in case it happens, limit it */
> -            n = s->aw_bits;
> -        }
> -        size = 1ULL << n;
> +    while (remain >= VTD_PAGE_SIZE) {
Can't we stop as soon as entry.iova exceeds gaw as well?
> +        IOMMUTLBEntry entry;
> +        uint64_t mask = get_naturally_aligned_size(start, remain, s->aw_bits);
> +
> +        assert(mask);
> +
> +        entry.iova = start;
> +        entry.addr_mask = mask - 1;
> +        entry.target_as = &address_space_memory;
> +        entry.perm = IOMMU_NONE;
> +        /* This field is meaningless for unmap */
> +        entry.translated_addr = 0;
> +
> +        memory_region_notify_one(n, &entry);
> +
> +        start += mask;
> +        remain -= mask;
>      }
>  
> -    entry.target_as = &address_space_memory;
> -    /* Adjust iova for the size */
> -    entry.iova = n->start & ~(size - 1);
> -    /* This field is meaningless for unmap */
> -    entry.translated_addr = 0;
> -    entry.perm = IOMMU_NONE;
> -    entry.addr_mask = size - 1;
> +    assert(!remain);
>  
>      trace_vtd_as_unmap_whole(pci_bus_num(as->bus),
>                               VTD_PCI_SLOT(as->devfn),
>                               VTD_PCI_FUNC(as->devfn),
> -                             entry.iova, size);
> +                             n->start, size);
>  
> -    map.iova = entry.iova;
> -    map.size = entry.addr_mask;
> +    map.iova = n->start;
> +    map.size = size;
>      iova_tree_remove(as->iova_tree, &map);
> -
> -    memory_region_notify_one(n, &entry);
>  }
>  
>  static void vtd_address_space_unmap_all(IntelIOMMUState *s)
> 

Thanks

Eric




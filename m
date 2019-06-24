Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2817A502E8
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 09:18:35 +0200 (CEST)
Received: from localhost ([::1]:48442 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfJFK-0004Bt-CK
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 03:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50667)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <yan.y.zhao@intel.com>) id 1hfJ8M-00081m-Ea
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 03:11:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1hfJ8K-0001fx-9W
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 03:11:22 -0400
Received: from mga18.intel.com ([134.134.136.126]:61799)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1hfJ8E-0001a4-S3
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 03:11:16 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jun 2019 00:10:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,411,1557212400"; d="scan'208";a="163519186"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by orsmga003.jf.intel.com with ESMTP; 24 Jun 2019 00:10:43 -0700
Date: Mon, 24 Jun 2019 03:04:50 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Peter Xu <peterx@redhat.com>
Message-ID: <20190624070450.GC27894@joy-OptiPlex-7040>
References: <20190624063733.22079-1-peterx@redhat.com>
 <20190624063733.22079-3-peterx@redhat.com>
 <20190624064122.GB27894@joy-OptiPlex-7040>
 <20190624065750.GE6279@xz-x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624065750.GE6279@xz-x1>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.126
Subject: Re: [Qemu-devel] [PATCH 2/2] intel_iommu: Fix unexpected unmaps
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Auger Eric <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 24, 2019 at 02:57:50PM +0800, Peter Xu wrote:
> On Mon, Jun 24, 2019 at 02:41:22AM -0400, Yan Zhao wrote:
> > On Mon, Jun 24, 2019 at 02:37:33PM +0800, Peter Xu wrote:
> > > From: Paolo Bonzini <pbonzini@redhat.com>
> > > 
> > > This is an replacement work of Yan Zhao's patch:
> > > 
> > > https://www.mail-archive.com/qemu-devel@nongnu.org/msg625340.html
> > > 
> > > vtd_address_space_unmap() will do proper page mask alignment to make
> > > sure each IOTLB message will have correct masks for notification
> > > messages (2^N-1), but sometimes it can be expanded to even supercede
> > > the registered range.  That could lead to unexpected UNMAP of already
> > > mapped regions in some other notifiers.
> > > 
> > > Instead of doing mindless expension of the start address and address
> > > mask, we split the range into smaller ones and guarantee that each
> > > small range will have correct masks (2^N-1) and at the same time we
> > > should also try our best to generate as less IOTLB messages as
> > > possible.
> > > 
> > > Reported-by: Yan Zhao <yan.y.zhao@intel.com>
> > > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > > [peterx: fixup mask generation algos and other touchups, introduce
> > >  vtd_get_next_mask(), write commit message]
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > ---
> > >  hw/i386/intel_iommu.c | 70 +++++++++++++++++++++++++++----------------
> > >  1 file changed, 44 insertions(+), 26 deletions(-)
> > > 
> > > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > > index 719ce19ab3..39cedf73b8 100644
> > > --- a/hw/i386/intel_iommu.c
> > > +++ b/hw/i386/intel_iommu.c
> > > @@ -3363,11 +3363,31 @@ VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
> > >      return vtd_dev_as;
> > >  }
> > >  
> > > +static uint64_t vtd_get_next_mask(uint64_t start, uint64_t size, int gaw)
> > > +{
> > > +    /* Tries to find smallest mask from start first */
> > > +    uint64_t rmask = start & -start, max_mask = 1ULL << gaw;
> > > +
> > > +    assert(size && gaw > 0 && gaw < 64);
> > > +
> > > +    /* Zero start, or too big */
> > > +    if (!rmask || rmask > max_mask) {
> > > +        rmask = max_mask;
> > > +    }
> > > +
> > > +    /* If the start mask worked, then use it */
> > > +    if (rmask <= size) {
> > > +        return rmask;
> > > +    }
> > > +
> > > +    /* Find the largest page mask from size */
> > > +    return 1ULL << (63 - clz64(size));
> > > +}
> > > +
> > >  /* Unmap the whole range in the notifier's scope. */
> > >  static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
> > >  {
> > > -    IOMMUTLBEntry entry;
> > > -    hwaddr size;
> > > +    hwaddr size, remain;
> > >      hwaddr start = n->start;
> > >      hwaddr end = n->end;
> > >      IntelIOMMUState *s = as->iommu_state;
> > > @@ -3388,39 +3408,37 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
> > >      }
> > >  
> > >      assert(start <= end);
> > > -    size = end - start;
> > > +    size = remain = end - start + 1;
> > >  
> > > -    if (ctpop64(size) != 1) {
> > > -        /*
> > > -         * This size cannot format a correct mask. Let's enlarge it to
> > > -         * suite the minimum available mask.
> > > -         */
> > > -        int n = 64 - clz64(size);
> > > -        if (n > s->aw_bits) {
> > > -            /* should not happen, but in case it happens, limit it */
> > > -            n = s->aw_bits;
> > > -        }
> > > -        size = 1ULL << n;
> > > +    while (remain > 0) {
> > hi 
> > I think here remain should still be "remain >= VTD_PAGE_SIZE"
> > because we cannot unmap entry less than PAGE_SIZE.
> 
> Yes we can.
> 
> I'd say this is purely for protection purpose no matter what.  If we
> did write the code correctly when registering the IOMMU notifier then
> we'll always have aligned "remain" here and these checks will be
> meaningless...  So we'll definitely fail in the case you mentioned,
> imho the only difference is when it happens.
> 
> If we want to fail at the earliest point, we can probably check during
> registering of the notifiers for page alignment.
>
I think it might be helpful if there anything wrong in code.
for example, when previously, size = end - start, it will happen that
size will eventually be less than page size.

> > 
> > > +        IOMMUTLBEntry entry;
> > > +        uint64_t mask = vtd_get_next_mask(start, remain, s->aw_bits);
> > > +
> > > +        assert(mask);
> > > +
> > 
> > > +        entry.iova = start;
> > > +        entry.addr_mask = mask - 1;
> > > +        entry.target_as = &address_space_memory;
> > > +        entry.perm = IOMMU_NONE;
> > > +        /* This field is meaningless for unmap */
> > > +        entry.translated_addr = 0;
> > > +
> > > +        memory_region_notify_one(n, &entry);
> > > +
> > > +        start += mask;
> > > +        remain -= mask;
> > >      }
> > Add assert(remain) here?
> 
> Do you mean assert(!remain)?  If so, it's below [1].
> 
yes, sorry, assert(!remain) :)
> > 
> > >  
> > > -    entry.target_as = &address_space_memory;
> > > -    /* Adjust iova for the size */
> > > -    entry.iova = n->start & ~(size - 1);
> > > -    /* This field is meaningless for unmap */
> > > -    entry.translated_addr = 0;
> > > -    entry.perm = IOMMU_NONE;
> > > -    entry.addr_mask = size - 1;
> > > +    assert(!remain);
> 
> [1]
> 
> > >  
> > >      trace_vtd_as_unmap_whole(pci_bus_num(as->bus),
> > >                               VTD_PCI_SLOT(as->devfn),
> > >                               VTD_PCI_FUNC(as->devfn),
> > > -                             entry.iova, size);
> > > +                             n->start, size);
> > >  
> > > -    map.iova = entry.iova;
> > > -    map.size = entry.addr_mask;
> > > +    map.iova = n->start;
> > > +    map.size = size;
> > >      iova_tree_remove(as->iova_tree, &map);
> > > -
> > > -    memory_region_notify_one(n, &entry);
> > >  }
> > >  
> > >  static void vtd_address_space_unmap_all(IntelIOMMUState *s)
> > > -- 
> > > 2.21.0
> > > 
> 
> Regards,
> 
> -- 
> Peter Xu


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B6B500FF
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 07:30:02 +0200 (CEST)
Received: from localhost ([::1]:48014 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfHYH-0004QU-3z
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 01:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57940)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <yan.y.zhao@intel.com>) id 1hfHXV-0003zQ-HI
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 01:29:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1hfHXT-0005Vy-On
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 01:29:13 -0400
Received: from mga14.intel.com ([192.55.52.115]:11976)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1hfHXR-00056f-Ng
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 01:29:11 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jun 2019 22:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,411,1557212400"; d="scan'208";a="187807374"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by fmsmga002.fm.intel.com with ESMTP; 23 Jun 2019 22:28:48 -0700
Date: Mon, 24 Jun 2019 01:22:55 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Peter Xu <peterx@redhat.com>
Message-ID: <20190624052255.GA27894@joy-OptiPlex-7040>
References: <1560934185-14152-1-git-send-email-yan.y.zhao@intel.com>
 <39c4c32b-e34a-8d8f-abbc-ab346ec5bed7@redhat.com>
 <20190620040230.GB9073@xz-x1>
 <6829b139-3eab-449e-04d6-07f1e381316d@redhat.com>
 <20190620125955.GB9657@xz-x1> <20190620130443.GC9657@xz-x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190620130443.GC9657@xz-x1>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
Subject: Re: [Qemu-devel] [PATCH] memory: do not do out of bound notification
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Auger Eric <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 20, 2019 at 09:04:43PM +0800, Peter Xu wrote:
> On Thu, Jun 20, 2019 at 08:59:55PM +0800, Peter Xu wrote:
> > On Thu, Jun 20, 2019 at 10:35:29AM +0200, Paolo Bonzini wrote:
> > > On 20/06/19 06:02, Peter Xu wrote:
> > > > Seems workable, to be explicit - we can even cut it into chunks with
> > > > different size to be efficient.
> > > 
> > > Yes, this is not hard (completely untested):
> > > 
> > > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > > index 44b1231157..541538bc6c 100644
> > > --- a/hw/i386/intel_iommu.c
> > > +++ b/hw/i386/intel_iommu.c
> > > @@ -3388,39 +3388,34 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
> > >      }
> > >  
> > >      assert(start <= end);
> > > -    size = end - start;
> > > +    while (end > start) {
> > > +        size = end - start;
> > > +        /* Only keep the lowest bit of either size or start.  */
> > > +        size = MIN(size & -size, start & -start);
> > 
> > I feel like this can be problematic.  I'm imaging:
> > 
> > start=0x1000_0000, size=0x1000_1000
> > 
> > This will get size=0x1000 but actually we can do size=0x1000_0000 as
> > the first.
> > 
> > > +        /* Should not happen, but limit to address width too just in case */
> > > +        size = MIN(size, 1ULL << s->aw_bits);
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
> > > -    }
> > > +        assert((start & (size - 1)) == 0);
> > >  
> > > -    entry.target_as = &address_space_memory;
> > > -    /* Adjust iova for the size */
> > > -    entry.iova = n->start & ~(size - 1);
> > > -    /* This field is meaningless for unmap */
> > > -    entry.translated_addr = 0;
> > > -    entry.perm = IOMMU_NONE;
> > > -    entry.addr_mask = size - 1;
> > > +        entry.target_as = &address_space_memory;
> > > +        entry.iova = start;
> > > +        /* This field is meaningless for unmap */
> > > +        entry.translated_addr = 0;
> > > +        entry.perm = IOMMU_NONE;
> > > +        entry.addr_mask = size - 1;
> > 
> > (some of the fields can be moved out of loop because they are
> >  constants)
> > 
> > >  
> > > -    trace_vtd_as_unmap_whole(pci_bus_num(as->bus),
> > > -                             VTD_PCI_SLOT(as->devfn),
> > > -                             VTD_PCI_FUNC(as->devfn),
> > > -                             entry.iova, size);
> > > +        trace_vtd_as_unmap_whole(pci_bus_num(as->bus),
> > > +                                 VTD_PCI_SLOT(as->devfn),
> > > +                                 VTD_PCI_FUNC(as->devfn),
> > > +                                 entry.iova, size);
> > 
> > Can move this out because this is a trace only so we don't have
> > restriction on mask?
> > 
> > >  
> > > -    map.iova = entry.iova;
> > > -    map.size = entry.addr_mask;
> > > -    iova_tree_remove(as->iova_tree, &map);
> > > +        map.iova = entry.iova;
> > > +        map.size = entry.addr_mask;
> > > +        iova_tree_remove(as->iova_tree, &map);
> > 
> > Same here?
> > 
> > >  
> > > -    memory_region_notify_one(n, &entry);
> > > +        memory_region_notify_one(n, &entry);
> > > +        start += size;
> > > +    }
> > >  }
> > >  
> > >  static void vtd_address_space_unmap_all(IntelIOMMUState *s)
> > > 
> > > 
> > > Yan,
> > > 
> > > if something like this works for you, let me know and I will submit it
> > > as a proper patch.
> > > 
> > > Paolo
> > 
> > Since during review I'm thinking how to generate a correct sequence of
> > these masks... here's my try below with above issues fixed... :)
> > 
> > I've tried compile but not tested.  Yan can test it, or I can do it
> > too tomorrow after I find some machines.
> > 
> > Thanks,
> > 
> > ------------------------------------------------------------
> > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > index 44b1231157..cfbd225f0a 100644
> > --- a/hw/i386/intel_iommu.c
> > +++ b/hw/i386/intel_iommu.c
> > @@ -3363,11 +3363,32 @@ VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
> >      return vtd_dev_as;
> >  }
> > 
> > +static uint64_t vtd_get_next_mask(uint64_t start, uint64_t size, int gaw)
> > +{
> > +    /* Tries to find smallest mask from start first */
> > +    uint64_t rmask = start & -start, max_mask = 1ULL << gaw;
> > +
> > +    assert(size && gaw > 0 && gaw < 64);
> > +
> > +    /* Zero start, or too big */
> > +    if (!rmask || rmask > max_mask) {
> > +        rmask = max_mask;
> > +    }
> > +
> > +    /* If the start mask worked, then use it */
> > +    if (rmask <= size) {
> > +        return rmask;
> > +    }
> > +
> > +    /* Find the largest page mask from size */
> > +    return 1ULL << (63 - clz64(size));
> > +}
> > +
> >  /* Unmap the whole range in the notifier's scope. */
> >  static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
> >  {
> >      IOMMUTLBEntry entry;
> > -    hwaddr size;
> > +    hwaddr size, remain;
> >      hwaddr start = n->start;
> >      hwaddr end = n->end;
> >      IntelIOMMUState *s = as->iommu_state;
> > @@ -3388,39 +3409,28 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
> >      }
> > 
> >      assert(start <= end);
> > -    size = end - start;
> > -
> > -    if (ctpop64(size) != 1) {
> > -        /*
> > -         * This size cannot format a correct mask. Let's enlarge it to
> > -         * suite the minimum available mask.
> > -         */
> > -        int n = 64 - clz64(size);
> > -        if (n > s->aw_bits) {
> > -            /* should not happen, but in case it happens, limit it */
> > -            n = s->aw_bits;
> > -        }
> > -        size = 1ULL << n;
> > -    }
> > -
> > +    size = remain = end - start;
> >      entry.target_as = &address_space_memory;
> > -    /* Adjust iova for the size */
> > -    entry.iova = n->start & ~(size - 1);
> > +    entry.perm = IOMMU_NONE;
> >      /* This field is meaningless for unmap */
> >      entry.translated_addr = 0;
> > -    entry.perm = IOMMU_NONE;
> > -    entry.addr_mask = size - 1;
> > +
> > +    while (remain) {
> > +        uint64_t mask = vtd_get_next_mask(start, remain, s->aw_bits);
> > +
> > +        entry.iova = start;
> > +        entry.addr_mask = mask - 1;
> > +        memory_region_notify_one(n, &entry);
> 
> Sorry, I at least missed these lines:
> 
>            start += mask;
>            remain -= mask;
> 
> > +    }
> > 
> >      trace_vtd_as_unmap_whole(pci_bus_num(as->bus),
> >                               VTD_PCI_SLOT(as->devfn),
> >                               VTD_PCI_FUNC(as->devfn),
> > -                             entry.iova, size);
> > +                             n->start, size);
> > 
> > -    map.iova = entry.iova;
> > -    map.size = entry.addr_mask;
> > +    map.iova = n->start;
> > +    map.size = size;
> >      iova_tree_remove(as->iova_tree, &map);
> > -
> > -    memory_region_notify_one(n, &entry);
> >  }
> > 
> >  static void vtd_address_space_unmap_all(IntelIOMMUState *s)
> > ------------------------------------------------------------
> > 
> > Regards,
> > 
> > -- 
> > Peter Xu
> 
> Regards,
> 
> -- 
> Peter Xu

hi Peter and Paolo,
I tested with code and it's fine in my side.
It's base on your version with some minor modifications, such as size is
now  (end - start + 1) now.
Thanks
Yan

+static uint64_t vtd_get_next_mask(uint64_t start, uint64_t size, int gaw)
+{
+    /* Tries to find smallest mask from start first */
+    uint64_t rmask = start & -start, max_mask = 1ULL << gaw;
+    assert(size && gaw > 0 && gaw < 64);
+    /* Zero start, or too big */
+    if (!rmask || rmask > max_mask) {
+        rmask = max_mask;
+    }
+    /* If the start mask worked, then use it */
+    if (rmask <= size) {
+        return rmask;
+    }
+
+    /* Find the largest page mask from size */
+    return 1ULL << (63 - clz64(size));
+}
+
 /* Unmap the whole range in the notifier's scope. */
 static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
 {
     IOMMUTLBEntry entry;
-    hwaddr size;
+    hwaddr size, remain;
     hwaddr start = n->start;
     hwaddr end = n->end;
     IntelIOMMUState *s = as->iommu_state;
@@ -3380,48 +3398,46 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
      * VT-d spec), otherwise we need to consider overflow of 64 bits.
      */

-    if (end > VTD_ADDRESS_SIZE(s->aw_bits)) {
+    if (end > VTD_ADDRESS_SIZE(s->aw_bits) - 1) {
         /*
          * Don't need to unmap regions that is bigger than the whole
          * VT-d supported address space size
          */
-        end = VTD_ADDRESS_SIZE(s->aw_bits);
+        end = VTD_ADDRESS_SIZE(s->aw_bits) - 1;
     }

     assert(start <= end);
-    size = end - start;

-    if (ctpop64(size) != 1) {
-        /*
-         * This size cannot format a correct mask. Let's enlarge it to
-         * suite the minimum available mask.
-         */
-        int n = 64 - clz64(size);
-        if (n > s->aw_bits) {
-            /* should not happen, but in case it happens, limit it */
-            n = s->aw_bits;
-        }
-        size = 1ULL << n;
-    }
+    size = remain = end - start + 1;

     entry.target_as = &address_space_memory;
-    /* Adjust iova for the size */
-    entry.iova = n->start & ~(size - 1);
+
+    entry.perm = IOMMU_NONE;
     /* This field is meaningless for unmap */
     entry.translated_addr = 0;
-    entry.perm = IOMMU_NONE;
-    entry.addr_mask = size - 1;
+
+    while (remain >= VTD_PAGE_SIZE) {
+        uint64_t mask = vtd_get_next_mask(start, remain, s->aw_bits);
+
+        entry.iova = start;
+        entry.addr_mask = mask - 1;
+        memory_region_notify_one(n, &entry);
+        start += mask;
+        remain -= mask;
+    }
+
+    if (remain) {
+        warn_report("Unmapping unaligned range %lx-%lx", start, end);
+    }

     trace_vtd_as_unmap_whole(pci_bus_num(as->bus),
                              VTD_PCI_SLOT(as->devfn),
                              VTD_PCI_FUNC(as->devfn),
-                             entry.iova, size);
-
-    map.iova = entry.iova;
-    map.size = entry.addr_mask;
+                             n->start, size);
+    map.iova = n->start;
+    map.size = size;
     iova_tree_remove(as->iova_tree, &map);

-    memory_region_notify_one(n, &entry);
 }

 static void vtd_address_space_unmap_all(IntelIOMMUState *s)
--
2.7.4





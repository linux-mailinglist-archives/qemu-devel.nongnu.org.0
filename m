Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6029197223
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 03:46:11 +0200 (CEST)
Received: from localhost ([::1]:43328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIjVC-0001iH-6T
	for lists+qemu-devel@lfdr.de; Sun, 29 Mar 2020 21:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49370)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yan.y.zhao@intel.com>) id 1jIjUH-000176-4i
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 21:45:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1jIjUF-0000uR-4F
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 21:45:12 -0400
Received: from mga18.intel.com ([134.134.136.126]:5606)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1jIjUE-0000n7-Qu
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 21:45:11 -0400
IronPort-SDR: 23E0GxchqrD+SlIfbwDRDiL/RLuwCOhpwMWqSfKj9fB2WkadQ8LK29gb7uPL9MnULDeDwk+pzT
 Th2AEBCP+xbw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2020 18:45:02 -0700
IronPort-SDR: J306d791IhikOoTGzcE2sG1hFaYSsZcgXYZ9r2Y8kbdWY6D4aRbJt4EE4BB2sQKjhKyMibzQpJ
 6yCAB44E6I8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,322,1580803200"; d="scan'208";a="448091564"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by fmsmga005.fm.intel.com with ESMTP; 29 Mar 2020 18:45:00 -0700
Date: Sun, 29 Mar 2020 21:35:27 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH] hw/vfio: let readonly flag take effect for mmaped regions
Message-ID: <20200330013527.GA30683@joy-OptiPlex-7040>
References: <20200327111934.71066-1-yan.y.zhao@intel.com>
 <20200327112537.2efd65ac@w520.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327112537.2efd65ac@w520.home>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 134.134.136.126
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "Zeng,
 Xin" <xin.zeng@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 28, 2020 at 01:25:37AM +0800, Alex Williamson wrote:
> On Fri, 27 Mar 2020 11:19:34 +0000
> yan.y.zhao@intel.com wrote:
> 
> > From: Yan Zhao <yan.y.zhao@intel.com>
> > 
> > currently, vfio regions without VFIO_REGION_INFO_FLAG_WRITE are only
> > read-only when VFIO_REGION_INFO_FLAG_MMAP is not set.
> > 
> > regions with flag VFIO_REGION_INFO_FLAG_READ | VFIO_REGION_INFO_FLAG_MMAP
> > are only read-only in host page table for qemu.
> > 
> > This patch sets corresponding ept page entries read-only for regions
> > with flag VFIO_REGION_INFO_FLAG_READ | VFIO_REGION_INFO_FLAG_MMAP.
> > 
> > accordingly, it ignores guest write when guest writes to the read-only
> > regions are trapped.
> > 
> > Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> > Signed-off-by: Xin Zeng <xin.zeng@intel.com>
> > ---
> 
> Currently we set the r/w protection on the mmap, do I understand
> correctly that the change in the vfio code below results in KVM exiting
> to QEMU to handle a write to a read-only region and therefore we need
> the memory.c change to drop the write?  This prevents a SIGBUS or
> similar?
yes, correct. the change in memory.c is to prevent a SIGSEGV in host as
it's mmaped to read-only. we think it's better to just drop the writes
from guest rather than corrupt the qemu.

> 
> Meanwhile vfio_region_setup() uses the same vfio_region_ops for all
> regions and vfio_region_write() would still allow writes, so if the
> device were using x-no-mmap=on, I think we'd still get a write to this
> region and expect the vfio device to drop it.  Should we prevent that
> write in QEMU as well?
yes, it expects vfio device to drop it right now.
As the driver sets the flag without VFIO_REGION_INFO_FLAG_WRITE, it should
handle it properly.
both dropping in qemu and dropping in vfio device are fine to us.
we wonder which one is your preference :)


> Can you also identify what device and region requires this so that we
> can decide whether this is QEMU 5.0 or 5.1 material?  PCI BARs are of
> course always R/W and the ROM uses different ops and doesn't support
> mmap, so this is a device specific region of some sort.  Thanks,
> 
It's a virtual mdev device for which we want to emulate a virtual
read-only MMIO BAR.
Is there any consideration that PCI BARs have to be R/W ?
we didn't find it out in PCI specification.

Thanks
Yan


> 
> >  hw/vfio/common.c | 4 ++++
> >  memory.c         | 3 +++
> >  2 files changed, 7 insertions(+)
> > 
> > diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> > index 0b3593b3c0..e901621ca0 100644
> > --- a/hw/vfio/common.c
> > +++ b/hw/vfio/common.c
> > @@ -971,6 +971,10 @@ int vfio_region_mmap(VFIORegion *region)
> >                                            name, region->mmaps[i].size,
> >                                            region->mmaps[i].mmap);
> >          g_free(name);
> > +
> > +        if (!(region->flags & VFIO_REGION_INFO_FLAG_WRITE)) {
> > +            memory_region_set_readonly(&region->mmaps[i].mem, true);
> > +        }
> >          memory_region_add_subregion(region->mem, region->mmaps[i].offset,
> >                                      &region->mmaps[i].mem);
> >  
> > diff --git a/memory.c b/memory.c
> > index 601b749906..4b1071dc74 100644
> > --- a/memory.c
> > +++ b/memory.c
> > @@ -1313,6 +1313,9 @@ static void memory_region_ram_device_write(void *opaque, hwaddr addr,
> >      MemoryRegion *mr = opaque;
> >  
> >      trace_memory_region_ram_device_write(get_cpu_index(), mr, addr, data, size);
> > +    if (mr->readonly) {
> > +        return;
> > +    }
> >  
> >      switch (size) {
> >      case 1:
> 


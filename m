Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6392650990
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 13:15:59 +0200 (CEST)
Received: from localhost ([::1]:49870 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfMx3-0007Zf-Hi
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 07:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53637)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peterx@redhat.com>) id 1hfMrl-0005e2-3f
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 07:10:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1hfMrj-0007hK-1D
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 07:10:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34974)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hfMri-0007fw-PC
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 07:10:26 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A026B7FDCA;
 Mon, 24 Jun 2019 11:10:25 +0000 (UTC)
Received: from xz-x1 (ovpn-12-60.pek2.redhat.com [10.72.12.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB56D608E4;
 Mon, 24 Jun 2019 11:10:17 +0000 (UTC)
Date: Mon, 24 Jun 2019 19:10:13 +0800
From: Peter Xu <peterx@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190624111013.GL6279@xz-x1>
References: <20190624091811.30412-1-peterx@redhat.com>
 <20190624091811.30412-3-peterx@redhat.com>
 <b4e30868-dc87-99ee-0696-a796421b00fc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b4e30868-dc87-99ee-0696-a796421b00fc@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 24 Jun 2019 11:10:25 +0000 (UTC)
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
 Yan Zhao <yan.y.zhao@intel.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 24, 2019 at 12:09:48PM +0200, Auger Eric wrote:
> Hi Peter,
> 
> On 6/24/19 11:18 AM, Peter Xu wrote:
> > This is an replacement work of Yan Zhao's patch:
> > 
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg625340.html
> > 
> > vtd_address_space_unmap() will do proper page mask alignment to make
> > sure each IOTLB message will have correct masks for notification
> > messages (2^N-1), but sometimes it can be expanded to even supercede
> > the registered range.  That could lead to unexpected UNMAP of already
> > mapped regions in some other notifiers.
> > 
> > Instead of doing mindless expension of the start address and address
> > mask, we split the range into smaller ones and guarantee that each
> > small range will have correct masks (2^N-1) and at the same time we
> > should also try our best to generate as less IOTLB messages as
> > possible.
> > 
> > Reported-by: Yan Zhao <yan.y.zhao@intel.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  hw/i386/intel_iommu.c | 67 ++++++++++++++++++++++++++-----------------
> >  1 file changed, 41 insertions(+), 26 deletions(-)
> > 
> > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > index 719ce19ab3..de86f53b4e 100644
> > --- a/hw/i386/intel_iommu.c
> > +++ b/hw/i386/intel_iommu.c
> > @@ -3363,11 +3363,28 @@ VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
> >      return vtd_dev_as;
> >  }
> >  
> > +static uint64_t get_naturally_aligned_size(uint64_t start,
> > +                                           uint64_t size, int gaw)
> > +{
> > +    uint64_t max_mask = 1ULL << gaw;
> > +    uint64_t alignment = start ? start & -start : max_mask;
> > +
> > +    alignment = MIN(alignment, max_mask);
> > +    size = MIN(size, max_mask);
> this does not not prevent from invalidating beyond gaw if start != 0, right?

Yes.  But at the start of vtd_address_space_unmap(), we have:

    if (end > VTD_ADDRESS_SIZE(s->aw_bits) - 1) {
        /*
         * Don't need to unmap regions that is bigger than the whole
         * VT-d supported address space size
         */
        end = VTD_ADDRESS_SIZE(s->aw_bits) - 1;
    }

So we don't need to worry about (start+size) exceeding GAW?

[1]

> > +
> > +    if (alignment <= size) {
> > +        /* Increase the alignment of start */
> I don't really get this comment

This comment comes from Paolo, but I'll try to explain - it tries to
mean that this "alignment" will be used as an increasement to "start"
variable, so finally variable "start" will align with larger mask
size.

Better comments welcomed... :)

> > +        return alignment;
> > +    } else {
> > +        /* Find the largest page mask from size */
> > +        return 1ULL << (63 - clz64(size));
> > +    }> +}
> > +
> >  /* Unmap the whole range in the notifier's scope. */
> >  static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
> >  {
> > -    IOMMUTLBEntry entry;
> > -    hwaddr size;
> > +    hwaddr size, remain;
> >      hwaddr start = n->start;
> >      hwaddr end = n->end;
> >      IntelIOMMUState *s = as->iommu_state;
> > @@ -3388,39 +3405,37 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
> >      }
> >  
> >      assert(start <= end);
> > -    size = end - start;
> > +    size = remain = end - start + 1;
> >  
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
> > +    while (remain >= VTD_PAGE_SIZE) {
> Can't we stop as soon as entry.iova exceeds gaw as well?

As explained at [1], I think we've already checked it.

Thanks,

-- 
Peter Xu


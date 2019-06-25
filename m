Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280D152550
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 09:52:22 +0200 (CEST)
Received: from localhost ([::1]:57310 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfgFZ-0004dH-D3
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 03:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43098)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <yan.y.zhao@intel.com>) id 1hfgEr-00042g-5j
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 03:51:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1hfgEq-0002TA-1H
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 03:51:37 -0400
Received: from mga17.intel.com ([192.55.52.151]:15018)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1hfgEp-0002HM-NJ
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 03:51:35 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jun 2019 00:51:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,415,1557212400"; d="scan'208";a="359844598"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by fmsmga005.fm.intel.com with ESMTP; 25 Jun 2019 00:51:19 -0700
Date: Tue, 25 Jun 2019 03:45:26 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190625074526.GD6971@joy-OptiPlex-7040>
References: <1561432878-13754-1-git-send-email-yan.y.zhao@intel.com>
 <5481acca-fffa-e99c-dcc1-ce41119dee17@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5481acca-fffa-e99c-dcc1-ce41119dee17@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.151
Subject: Re: [Qemu-devel] [PATCH v4] memory: assert on out of scope
 notification
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 25, 2019 at 03:36:57PM +0800, Auger Eric wrote:
> Hi Yan,
> 
> [ + Peter]
> 
> 
> On 6/25/19 5:21 AM, Yan Zhao wrote:
> > It is wrong for an entry to have parts out of scope of notifier's range.
> > assert this condition.
> > 
> > Out of scope mapping/unmapping would cause problem, as in below case:
> > 
> > 1. initially there are two notifiers with ranges
> > 0-0xfedfffff, 0xfef00000-0xffffffffffffffff,
> > IOVAs from 0x3c000000 - 0x3c1fffff is in shadow page table.
> > 
> > 2. in vfio, memory_region_register_iommu_notifier() is followed by
> > memory_region_iommu_replay(), which will first call address space
> > unmap,
> > and walk and add back all entries in vtd shadow page table. e.g.
> > (1) for notifier 0-0xfedfffff,
> >     IOVAs from 0 - 0xffffffff get unmapped,
> >     and IOVAs from 0x3c000000 - 0x3c1fffff get mapped
> > (2) for notifier 0xfef00000-0xffffffffffffffff
> >     IOVAs from 0 - 0x7fffffffff get unmapped,
> >     but IOVAs from 0x3c000000 - 0x3c1fffff cannot get mapped back.
> > 
> > Cc: Eric Auger <eric.auger@redhat.com>
> > Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> > 
> > ---
> > v4:
> > 1. modified commit title
> > 2. using "assert" instead of printing warning message> (Eric Auger)
> Sorry my last reply mentioning the relevance of an assert was rather a
> question (for you and other reviewers) actually. Your bug report
> emphasized the fact that having an entry which has non inclusive overlap
> with the notifier can be dangerous.
> 
> Now we also have memory_region_notify_iommu() that loops over all
> notifiers of the iommu mr and notifies each of them with the entry. Some
> other callers than vtd (spapr_iommu.c, tz-mpc.c, s390-pci-inst.c,
> smmuv3) may hit this assert and this may cause a regression. I checked
> with smmuv3 and it looks OK.
> 
> Also if we enforce the rule that the entry span shall be within the
> notifier one, this should be documented in memory.h.
>
Yes, actually I was also this concern that if we only print warning and
do not assert, then if there's bugs in viommu (or others), only viommu (or
others) does not function well, but qemu can still boot up. if we assert
here, qemu will fail to boot up too.

so, it depends on the strict level you want. :)

> Thanks
> 
> Eric
> > 
> > v3:
> > refined code style and message format
> > 
> > v2:
> > 1. added a local variable entry_end (Eric Auger)
> > 2. using PRIx64 as format for address range in warning message
> > (Eric Auger)
> > ---
> >  memory.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/memory.c b/memory.c
> > index 0a089a7..35e8e77 100644
> > --- a/memory.c
> > +++ b/memory.c
> > @@ -1937,16 +1937,18 @@ void memory_region_notify_one(IOMMUNotifier *notifier,
> >                                IOMMUTLBEntry *entry)
> >  {
> >      IOMMUNotifierFlag request_flags;
> > +    hwaddr entry_end = entry->iova + entry->addr_mask;
> >  
> >      /*
> >       * Skip the notification if the notification does not overlap
> >       * with registered range.
> >       */
> > -    if (notifier->start > entry->iova + entry->addr_mask ||
> > -        notifier->end < entry->iova) {
> > +    if (notifier->start > entry_end || notifier->end < entry->iova) {
> >          return;
> >      }
> >  
> > +    assert(entry->iova >= notifier->start && entry_end <= notifier->end);
> > +
> >      if (entry->perm & IOMMU_RW) {
> >          request_flags = IOMMU_NOTIFIER_MAP;
> >      } else {
> > 


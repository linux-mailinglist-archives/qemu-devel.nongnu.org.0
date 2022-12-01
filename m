Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C427663F345
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 16:00:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0l1q-0006eP-E9; Thu, 01 Dec 2022 09:59:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p0l1o-0006aq-20
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 09:59:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p0l1k-0003fF-Ar
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 09:59:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669906742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qqj8qtvQ0QLHWVCtr8iS/WHEzQFm0vpmk+oWFeTi0Aw=;
 b=E3faEkFqW/byhzcYu0/1+R/JqGdwc7Gb4GBuWbg1TwVi+c9fHPuyJPSnItQF0B9MIs7wKt
 DxMPFEq6LMudxMAEIReIGVfF/9hczMncL1j4WQHr7qSQ+WLETkZHf/+DdXd3Irqrvg53FG
 2Bmnkk9o0r7t9l5oLXJJticeLNzr+ig=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-179-94H5WLzmOjmIksYQcjgkRg-1; Thu, 01 Dec 2022 09:59:00 -0500
X-MC-Unique: 94H5WLzmOjmIksYQcjgkRg-1
Received: by mail-qv1-f70.google.com with SMTP id
 ng1-20020a0562143bc100b004bb706b3a27so5399994qvb.20
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 06:59:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qqj8qtvQ0QLHWVCtr8iS/WHEzQFm0vpmk+oWFeTi0Aw=;
 b=3OlYcrI3KWzUb65IztYtKFhRKvf01gtxPKCpLq1dWSeKIOu+RRmnngpDUcgaWCdDwQ
 jD+gFwvXN3MT9S9joCquPHKU1insb6Yi02KfgzDjpkvr4hs89n+g8GIWay9Y6EXsYhmV
 zw7pmy4x1zWoofqMH8+tt6FVwGoUpvEfgo6SsXvrtR86ZpEnsvKdLUp+wCki9isnGdkr
 Ael0xBbT2KbGJbSv6YW9nNlC8UcQanCPASC3m2oNua/GZ3pJdhGrxJmhcUhfDpy1Jjpa
 lC0dyOsabcWfbWj+NpUOROtJlI+Ih2s2bdus5LKMDsYi336QsTe2Zxlzv7SXfXKSgxnm
 IgdQ==
X-Gm-Message-State: ANoB5pn4KPDf+PsmxYRKFZlJynePTPAvEo5tJ+qBBiVqVQElpwsQaMQo
 HSLaQ0yC4ke70JSnCABJTfYT7aGyoFb2c3sSYRXru4ktEbRFMwAIsEF6ZiTSwOV5VDlqPMfHBKi
 VptBmPimxOEH18Xs=
X-Received: by 2002:a05:622a:5808:b0:3a5:9170:458e with SMTP id
 fg8-20020a05622a580800b003a59170458emr62527730qtb.509.1669906740414; 
 Thu, 01 Dec 2022 06:59:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Uij5w5k7YbzwSPDYSvdHBUUfnx5V0S2g9snzjjek2a9X62sw+iSw1KhfY1/Ac1AoEdV6GFA==
X-Received: by 2002:a05:622a:5808:b0:3a5:9170:458e with SMTP id
 fg8-20020a05622a580800b003a59170458emr62527711qtb.509.1669906740061; 
 Thu, 01 Dec 2022 06:59:00 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 y26-20020a37f61a000000b006fc62eabcc9sm3285366qkj.134.2022.12.01.06.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 06:58:59 -0800 (PST)
Date: Thu, 1 Dec 2022 09:58:58 -0500
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
 viktor@daynix.com
Subject: Re: [PATCH 3/3] intel-iommu: build iova tree during IOMMU translation
Message-ID: <Y4jBMkNEFqUA7edN@x1n>
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221129081037.12099-4-jasowang@redhat.com> <Y4Yr5WvfioOJWOEX@x1n>
 <CACGkMEuC41jFin3XAVSs3ra0tmxZD7L5NeDLn5OD6ziq7z1huA@mail.gmail.com>
 <Y4d0HokcV/tg0wlk@x1n>
 <CACGkMEu-t7J=GP2ZJ3cw6X427SzzPk=XFV9tSCfffK4RKuFnAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACGkMEu-t7J=GP2ZJ3cw6X427SzzPk=XFV9tSCfffK4RKuFnAQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Dec 01, 2022 at 04:35:48PM +0800, Jason Wang wrote:
> On Wed, Nov 30, 2022 at 11:17 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Wed, Nov 30, 2022 at 02:33:51PM +0800, Jason Wang wrote:
> > > On Tue, Nov 29, 2022 at 11:57 PM Peter Xu <peterx@redhat.com> wrote:
> > > >
> > > > On Tue, Nov 29, 2022 at 04:10:37PM +0800, Jason Wang wrote:
> > > > > The IOVA tree is only built during page walk this breaks the device
> > > > > that tries to use UNMAP notifier only. One example is vhost-net, it
> > > > > tries to use UNMAP notifier when vIOMMU doesn't support DEVIOTLB_UNMAP
> > > > > notifier (e.g when dt mode is not enabled). The interesting part is
> > > > > that it doesn't use MAP since it can query the IOMMU translation by
> > > > > itself upon a IOTLB miss.
> > > > >
> > > > > This doesn't work since Qemu doesn't build IOVA tree in IOMMU
> > > > > translation which means the UNMAP notifier won't be triggered during
> > > > > the page walk since Qemu think it is never mapped. This could be
> > > > > noticed when vIOMMU is used with vhost_net but dt is disabled.
> > > > >
> > > > > Fixing this by build the iova tree during IOMMU translation, this
> > > > > makes sure the UNMAP notifier event could be identified during page
> > > > > walk. And we need to walk page table not only for UNMAP notifier but
> > > > > for MAP notifier during PSI.
> > > > >
> > > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > > ---
> > > > >  hw/i386/intel_iommu.c | 43 ++++++++++++++++++-------------------------
> > > > >  1 file changed, 18 insertions(+), 25 deletions(-)
> > > > >
> > > > > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > > > > index d025ef2873..edeb62f4b2 100644
> > > > > --- a/hw/i386/intel_iommu.c
> > > > > +++ b/hw/i386/intel_iommu.c
> > > > > @@ -1834,6 +1834,8 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
> > > > >      uint8_t access_flags;
> > > > >      bool rid2pasid = (pasid == PCI_NO_PASID) && s->root_scalable;
> > > > >      VTDIOTLBEntry *iotlb_entry;
> > > > > +    const DMAMap *mapped;
> > > > > +    DMAMap target;
> > > > >
> > > > >      /*
> > > > >       * We have standalone memory region for interrupt addresses, we
> > > > > @@ -1954,6 +1956,21 @@ out:
> > > > >      entry->translated_addr = vtd_get_slpte_addr(slpte, s->aw_bits) & page_mask;
> > > > >      entry->addr_mask = ~page_mask;
> > > > >      entry->perm = access_flags;
> > > > > +
> > > > > +    target.iova = entry->iova;
> > > > > +    target.size = entry->addr_mask;
> > > > > +    target.translated_addr = entry->translated_addr;
> > > > > +    target.perm = entry->perm;
> > > > > +
> > > > > +    mapped = iova_tree_find(vtd_as->iova_tree, &target);
> > > > > +    if (!mapped) {
> > > > > +        /* To make UNMAP notifier work, we need build iova tree here
> > > > > +         * in order to have the UNMAP iommu notifier to be triggered
> > > > > +         * during the page walk.
> > > > > +         */
> > > > > +        iova_tree_insert(vtd_as->iova_tree, &target);
> > > > > +    }
> > > > > +
> > > > >      return true;
> > > > >
> > > > >  error:
> > > > > @@ -2161,31 +2178,7 @@ static void vtd_iotlb_page_invalidate_notify(IntelIOMMUState *s,
> > > > >          ret = vtd_dev_to_context_entry(s, pci_bus_num(vtd_as->bus),
> > > > >                                         vtd_as->devfn, &ce);
> > > > >          if (!ret && domain_id == vtd_get_domain_id(s, &ce, vtd_as->pasid)) {
> > > > > -            if (vtd_as_has_map_notifier(vtd_as)) {
> > > > > -                /*
> > > > > -                 * As long as we have MAP notifications registered in
> > > > > -                 * any of our IOMMU notifiers, we need to sync the
> > > > > -                 * shadow page table.
> > > > > -                 */
> > > > > -                vtd_sync_shadow_page_table_range(vtd_as, &ce, addr, size);
> > > > > -            } else {
> > > > > -                /*
> > > > > -                 * For UNMAP-only notifiers, we don't need to walk the
> > > > > -                 * page tables.  We just deliver the PSI down to
> > > > > -                 * invalidate caches.
> > > > > -                 */
> > > > > -                IOMMUTLBEvent event = {
> > > > > -                    .type = IOMMU_NOTIFIER_UNMAP,
> > > > > -                    .entry = {
> > > > > -                        .target_as = &address_space_memory,
> > > > > -                        .iova = addr,
> > > > > -                        .translated_addr = 0,
> > > > > -                        .addr_mask = size - 1,
> > > > > -                        .perm = IOMMU_NONE,
> > > > > -                    },
> > > > > -                };
> > > > > -                memory_region_notify_iommu(&vtd_as->iommu, 0, event);

[1]

> > > >
> > > > Isn't this path the one that will be responsible for pass-through the UNMAP
> > > > events from guest to vhost when there's no MAP notifier requested?
> > >
> > > Yes, but it doesn't do the iova tree removing. More below.
> > >
> > > >
> > > > At least that's what I expected when introducing the iova tree, because for
> > > > unmap-only device hierachy I thought we didn't need the tree at all.
> > >
> > > Then the problem is the UNMAP notifier won't be trigger at all during
> > > DSI page walk in vtd_page_walk_one() because there's no DMAMap stored
> > > in the iova tree.:
> > >
> > >         if (!mapped) {
> > >             /* Skip since we didn't map this range at all */
> > >             trace_vtd_page_walk_one_skip_unmap(entry->iova, entry->addr_mask);
> > >             return 0;
> > >         }
> > >
> > > So I choose to build the iova tree in translate then we won't go
> > > within the above condition.
> >
> > That's also why it's weird because IIUC we should never walk a page table
> > at all if there's no MAP notifier regiestered.
> 
> If this is true, we probably need to document this somewhere.

Agree.  I'll post a patch.

> 
> >
> > When I'm looking at the walk callers I found that indeed there's one path
> > missing where can cause it to actually walk the pgtables without !MAP, then
> > I also noticed commit f7701e2c7983b6, and I'm wondering what we really want
> > is something like this:
> >
> > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > index a08ee85edf..c46f3db992 100644
> > --- a/hw/i386/intel_iommu.c
> > +++ b/hw/i386/intel_iommu.c
> > @@ -1536,7 +1536,7 @@ static int vtd_sync_shadow_page_table(VTDAddressSpace *vtd_as)
> >      VTDContextEntry ce;
> >      IOMMUNotifier *n;
> >
> > -    if (!(vtd_as->iommu.iommu_notify_flags & IOMMU_NOTIFIER_IOTLB_EVENTS)) {
> > +    if (!vtd_as_has_map_notifier(vtd_as)) {
> >          return 0;
> >      }
> >
> > So I'm not sure whether this patch is the problem resolver; so far I feel
> > like it's patch 2 who does the real fix.  Then we can have the above
> > oneliner so we stop any walks when there's no map notifiers.
> >
> > Thanks,
> 
> I may miss something but as state above, the problem is a missing
> UNMAP notification during DSI when there's only UNMAP notifier.

I got confused too on why we didn't notify UNMAP for DSI already, that's so
weird because I thought it should be there or it should be broken for a
long time.. as we discussed multiple times around this one:

		/*
		 * Fallback to domain selective flush if no PSI support or
		 * the size is too big.
		 */
		if (!cap_pgsel_inv(iommu->cap) ||
		    mask > cap_max_amask_val(iommu->cap))
			iommu->flush.flush_iotlb(iommu, did, 0, 0,
							DMA_TLB_DSI_FLUSH);
		else
			iommu->flush.flush_iotlb(iommu, did, addr | ih, mask,
							DMA_TLB_PSI_FLUSH);

I guess we were just always lucky?..

> 
> To solve it we might have two ways:
> 
> 1) build the iova tree during iommu translation then we can correctly
> trigger UNMAP during page walk caused by DSI
> 2) don't do the iova tree walk for !MAP notifier, need new logic to
> trigger UNMAP notifier in PSI/DSI
> 
> This patch choose to go 1) (which seems easier at least for -stable).
> Do you mean you prefer to go with 2)?

Yes.

IOVA tree is unnecessary overhead IMHO because UNMAP (both IOTLB or
DEVIOTLB unmap) shouldn't need that complexity at all.  Using the iova tree
can be accurate on which page got unmapped when the kernel driver used DSI
for a large PSI as shown above, however IMHO it needs more justification
that the pgtable walk is worth the effort.  Not to mention if a device in
QEMU that wants to use the iova tree for some reason, one can just register
with MAP and ignore all MAP events, while by default we keep UNMAP simple.

So we could do:

  (1) Rename vtd_sync_shadow_page_table() to vtd_sync_domain()
  (2) instead of optimizing dev-iotlb only there:
  
      if (!(vtd_as->iommu.iommu_notify_flags & IOMMU_NOTIFIER_IOTLB_EVENTS)) {
          return 0;
      }

      we should firstly check if UNMAP or DEVUNMAP registered, we directly
      send a notification to the whole domain.  We need to choose the event
      that the register happens with but not both.

This also reminded me that whether we should sanity check on iommu
notifiers on some invalid cases.  E.g. it seems to me when registered with
DEVIOTLB_UNMAP it should not register with either MAP or UNMAP anymore or
it doesn't make sense.

One step further, I'm wondering whether the DEV_IOTLB event should exist at
all.  Maybe we want to have DEV_IOTLB typed iommu notifier only, but then
when we got dev-iotlb PSI/DSI we notify with type=UNMAP just like normal
UNMAP events, then in above (2) we can send UNMAP constantly as long as
!MAP.  But even if so that'll just be another optional change on top.

Thanks,

-- 
Peter Xu



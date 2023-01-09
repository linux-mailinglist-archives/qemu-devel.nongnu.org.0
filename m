Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E4F662106
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:10:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEo9w-00067E-Oe; Mon, 09 Jan 2023 04:09:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pEo9h-00063z-VA
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:09:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pEo9f-0006Vu-9t
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:09:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673255353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kO2BPDlcRrQV1Fv5eTOZGXOWqR2pMDbebFwlFSLgaxM=;
 b=eWS2PxQWTJa8M1/VCGoh+IN/o14JVZLIjA/aISxf9CBBkIiQiUWOqXbo8kfwZh/frObtY+
 WRD3fG+SDTUWoJ565Ietbqujaq7Rynzq8xzpbXGibeGqfmcNyUMC3rW8rSqJ1dSojdBIUI
 /CpKaSMYXAqTkGUXy+sBfn9oMeG9Vbo=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-527-k5UWsZLUO--VL21ZDJwWBw-1; Mon, 09 Jan 2023 04:09:12 -0500
X-MC-Unique: k5UWsZLUO--VL21ZDJwWBw-1
Received: by mail-oi1-f198.google.com with SMTP id
 bp6-20020a056808238600b00360c55456bcso2281960oib.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:09:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kO2BPDlcRrQV1Fv5eTOZGXOWqR2pMDbebFwlFSLgaxM=;
 b=GrvVVus7TmJKzXbQRDe1xnoAhihkODd8oDFH243gh4QgHW+t4zNH8XejqppXbFV7yU
 paMBNaL2LxBkqP2nmh0f0x/goszmhvWoYNCYcRrJwEyCAQ2MQbbbLcue7/7qr2zcXQaT
 vzWrKFiCaDxrUyCqjuoOVVifFFN5SgzWiOPXa/tch9Ri4Cd6a358uGXQToLulVOO5vu2
 umPQiG1paJpZBtJztf+yaeBbuOzoN7fORPuwwpex4hgWnTUOj6w7/tLj4nVpOFOx0K8h
 cylZstT03QklqQMaljj4m2dQkWLXeuCGUZGByo8hmTyKQ1ANA8T7VahLH1nqPKaL5mI4
 zYGw==
X-Gm-Message-State: AFqh2ko4Xmjb/3Lh5MOhzzX6sicu6m/gkkd/hNgFldd9USg0Py5eO1Fb
 on/3n04SzqjVHG6BOY6Cldzakex5qB5tyv4bADjkdK6gy78EOXCeT4lCtWc8fAdZ7fUcQnLM1CL
 02JDv+H+ArGkdAO6OLl+MvxpXkoSJXpc=
X-Received: by 2002:a05:6870:9e9a:b0:15b:96b5:9916 with SMTP id
 pu26-20020a0568709e9a00b0015b96b59916mr41734oab.280.1673255351301; 
 Mon, 09 Jan 2023 01:09:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuC7/atj+OLHp/hntFAOONN9iO5hlc0IlF2g8O2iERYZy6GvpFxPs+Fk3ruEbG5dbXRqt+rv4NRcWNeBpS+jYs=
X-Received: by 2002:a05:6870:9e9a:b0:15b:96b5:9916 with SMTP id
 pu26-20020a0568709e9a00b0015b96b59916mr41731oab.280.1673255350993; Mon, 09
 Jan 2023 01:09:10 -0800 (PST)
MIME-Version: 1.0
References: <20221206221348.396020-1-peterx@redhat.com>
 <CACGkMEtK8w2OkeZR=Ebp3t8t6bfaJusTRyC0eB3BGyA7KuX5-g@mail.gmail.com>
 <Y6XWy9XPHqhK8BMh@x1n>
 <CACGkMEu6OC7eCyR-ztBXGMe-mtWHfLMHPVJrGWO6Rpx3bHTCPQ@mail.gmail.com>
 <Y7RmMvRNFf+YYRyH@x1n>
 <CACGkMEu+7rnSudmZBi1EZjsgD4RwYeFg_ktxqg+e3e5C9SdaaQ@mail.gmail.com>
 <Y7WXwS1qsvOorJlU@x1n>
In-Reply-To: <Y7WXwS1qsvOorJlU@x1n>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 9 Jan 2023 17:08:59 +0800
Message-ID: <CACGkMEvZh0EdwL5+3o-BNDPez12eAO8YUNq8vWyv0ZruBfw_GA@mail.gmail.com>
Subject: Re: [PATCH v3] intel-iommu: Document iova_tree
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Wed, Jan 4, 2023 at 11:14 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Jan 04, 2023 at 12:15:20PM +0800, Jason Wang wrote:
> > On Wed, Jan 4, 2023 at 1:30 AM Peter Xu <peterx@redhat.com> wrote:
> > >
> > > On Mon, Dec 26, 2022 at 12:09:52PM +0800, Jason Wang wrote:
> > > > On Sat, Dec 24, 2022 at 12:26 AM Peter Xu <peterx@redhat.com> wrote:
> > > > >
> > > > > On Fri, Dec 23, 2022 at 03:48:01PM +0800, Jason Wang wrote:
> > > > > > On Wed, Dec 7, 2022 at 6:13 AM Peter Xu <peterx@redhat.com> wrote:
> > > > > > >
> > > > > > > It seems not super clear on when iova_tree is used, and why.  Add a rich
> > > > > > > comment above iova_tree to track why we needed the iova_tree, and when we
> > > > > > > need it.
> > > > > > >
> > > > > > > Also comment for the map/unmap messages, on how they're used and
> > > > > > > implications (e.g. unmap can be larger than the mapped ranges).
> > > > > > >
> > > > > > > Suggested-by: Jason Wang <jasowang@redhat.com>
> > > > > > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > > > > > ---
> > > > > > > v3:
> > > > > > > - Adjust according to Eric's comment
> > > > > > > ---
> > > > > > >  include/exec/memory.h         | 28 ++++++++++++++++++++++++++
> > > > > > >  include/hw/i386/intel_iommu.h | 38 ++++++++++++++++++++++++++++++++++-
> > > > > > >  2 files changed, 65 insertions(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > > > > > > index 91f8a2395a..269ecb873b 100644
> > > > > > > --- a/include/exec/memory.h
> > > > > > > +++ b/include/exec/memory.h
> > > > > > > @@ -129,6 +129,34 @@ struct IOMMUTLBEntry {
> > > > > > >  /*
> > > > > > >   * Bitmap for different IOMMUNotifier capabilities. Each notifier can
> > > > > > >   * register with one or multiple IOMMU Notifier capability bit(s).
> > > > > > > + *
> > > > > > > + * Normally there're two use cases for the notifiers:
> > > > > > > + *
> > > > > > > + *   (1) When the device needs accurate synchronizations of the vIOMMU page
> > > > > > > + *       tables, it needs to register with both MAP|UNMAP notifies (which
> > > > > > > + *       is defined as IOMMU_NOTIFIER_IOTLB_EVENTS below).
> > > > > > > + *
> > > > > > > + *       Regarding to accurate synchronization, it's when the notified
> > > > > > > + *       device maintains a shadow page table and must be notified on each
> > > > > > > + *       guest MAP (page table entry creation) and UNMAP (invalidation)
> > > > > > > + *       events (e.g. VFIO). Both notifications must be accurate so that
> > > > > > > + *       the shadow page table is fully in sync with the guest view.
> > > > > > > + *
> > > > > > > + *   (2) When the device doesn't need accurate synchronizations of the
> > > > > > > + *       vIOMMU page tables, it needs to register only with UNMAP or
> > > > > > > + *       DEVIOTLB_UNMAP notifies.
> > > > > > > + *
> > > > > > > + *       It's when the device maintains a cache of IOMMU translations
> > > > > > > + *       (IOTLB) and is able to fill that cache by requesting translations
> > > > > > > + *       from the vIOMMU through a protocol similar to ATS (Address
> > > > > > > + *       Translation Service).
> > > > > > > + *
> > > > > > > + *       Note that in this mode the vIOMMU will not maintain a shadowed
> > > > > > > + *       page table for the address space, and the UNMAP messages can be
> > > > > > > + *       actually larger than the real invalidations (just like how the
> > > > > > > + *       Linux IOMMU driver normally works, where an invalidation can be
> > > > > > > + *       enlarged as long as it still covers the target range).  The IOMMU
> > > > > >
> > > > > > Just spot this when testing your fix for DSI:
> > > > > >
> > > > > >         assert(entry->iova >= notifier->start && entry_end <= notifier->end);
> > > > > >
> > > > > > Do we need to remove this (but it seems a partial revert of
> > > > > > 03c7140c1a0336af3d4fca768de791b9c0e2b128)?
> > > > >
> > > > > Replied in the othe thread.
> > > > >
> > > > > I assume this documentation patch is still correct, am I right?  It's
> > > > > talking about the possibility of enlarged invalidation range sent from the
> > > > > guest and vIOMMU.  That should still not be bigger than the registered
> > > > > range in iommu notifiers (even if bigger than the actual unmapped range).
> > > >
> > > > Adding Eugenio.
> > > >
> > > > So I think we need to evaluate the possible side effects to all the
> > > > current nmap notifiers. For example the vfio_iommu_map_notify().
> > > >
> > > > And in another thread, if we crop the size, it basically means the
> > > > notifier itself will still assume the range is valid, which is not
> > > > what is documented in this patch.
> > > >
> > > > What's more interesting I see smmu had:
> > > >
> > > > /* Unmap the whole notifier's range */
> > > > static void smmu_unmap_notifier_range(IOMMUNotifier *n)
> > > > {
> > > >     IOMMUTLBEvent event;
> > > >
> > > >     event.type = IOMMU_NOTIFIER_UNMAP;
> > > >     event.entry.target_as = &address_space_memory;
> > > >     event.entry.iova = n->start;
> > > >     event.entry.perm = IOMMU_NONE;
> > > >     event.entry.addr_mask = n->end - n->start;
> > > >
> > > >     memory_region_notify_iommu_one(n, &event);
> > > > }
> > > >
> > > > So it looks to me it's more safe to do something similar for vtd first.
> > >
> > > Jason, could you elaborate more on this one?
> >
> > I meant it's more safe to have a vtd version:
> >
> >  > > static void vtd_unmap_notifier_range(IOMMUNotifier *n)
> > > > {
> > > >     IOMMUTLBEvent event;
> > > >
> > > >     event.type = IOMMU_NOTIFIER_UNMAP;
> > > >     event.entry.target_as = &address_space_memory;
> > > >     event.entry.iova = n->start;
> > > >     event.entry.perm = IOMMU_NONE;
> > > >     event.entry.addr_mask = n->end - n->start;
> > > >
> > > >     memory_region_notify_iommu_one(n, &event);
> >
> > Or move it to the memory.c.
>
> I see.
>
> If we always do the crop in memory_region_notify_iommu_one() it'll have
> similar effect of having above helper, am I right?

Right, but we may end up twice cropping. I don't have an actual
preference, but I think we need to be consistent here.

Either:

1) cropping in the memory core and remove the iommu cropping like
smmu_unmap_notifier_range()

or

2) don't corp in the memory core but move smmu_unmap_notifier_range to
the core (still, a kind of implicit crop, since the function was
called without a range)

2) seems safer but I can go with 1 if you insist.

>
> I checked again on the VFIO code path in kernel, it (at least type1v2)
> doesn't allow unmapping of partial mapped range, but it looks always fine
> to have unmap covering not-mapped spaces.

That's my understanding as well.

>
> One more thing I noticed is there's a new flag introduced in 2021 for vfio
> to unmap the whole address space (VFIO_DMA_UNMAP_FLAG_ALL).  In the future
> we can leverage this when we want to do DSI more efficiently, but not
> immediately necessary - I think that needs a new IOMMU notifier API hook.
>

Yes.

> And if you see the impl of that new flag (in vfio_dma_do_unmap) it also
> shows that a larger range of unmap is fine to vfio, because for unmap_all
> it's the same as specifying the size to be max:
>
>         if (unmap_all) {
>                 if (iova || size)
>                         goto unlock;
>                 size = U64_MAX;
>         }
>
> >
> > >
> > > Meanwhile, I don't immediately see what's the side effect you mentioned for
> > > vfio map events.
> >
> > I don't see but it looks more safe. Do you know the reason why SMMU
> > doesn't simply do a [0, ULONG_MAX] unmap notify? (Maybe Eric know)
>
> Same here..
>
> >
> > > I thought any map event should always be in the notifier
> > > range anyway because map event only comes in page sizes and generated by
> > > vt-d page walkers (not guest driver, which is IIUC the only place where the
> > > range of invalidation can be enlarged).  So I don't expect any functional
> > > change to map events if we decide to crop the ranges unconditionally.
> >
> > If we crop the ranges, the above description:
> >
> > """
> > and the UNMAP messages can be actually larger than the real invalidations.
> > """
> >
> > doesn't apply anymore.
>
> It depends on how to define the "real invalidations".  There're two places
> that can enlarge an invalidation, here I wanted to reference the case where
> e.g. a PSI is enlarged to a DSI.  Even if that's the driver behavior, I
> wanted to make sure the qemu iommu notifiees are aware of the facts that
> unmap can be bigger than what it used to have mapped.

Ok, I think the confusion came from "real invalidations". I think
there's no way for the device to know about the real invalidation
since the driver can enlarge it at will? If this is true, is this
better to say the UNAMP messages can cover the range that is not
mapped?

Thanks

>
> Thanks,
>
> >
> > Thanks
> >
> > >  Did I miss anything?
> > >
> > > Thanks,
> > >
> > > >
> > > > Btw, I forgot the reason why we need to crop the size in the case of
> > > > device IOTLB, Eguenio do you know that?
> > > >
> > > > Thanks
> > > >
> > > > >
> > > > > Thanks,
> > > > >
> > > > > --
> > > > > Peter Xu
> > > > >
> > > >
> > >
> > > --
> > > Peter Xu
> > >
> >
>
> --
> Peter Xu
>



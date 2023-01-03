Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB2F65C509
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 18:31:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCl7c-0007ud-8E; Tue, 03 Jan 2023 12:30:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pCl7V-0007uL-Hi
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 12:30:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pCl7T-0005gW-FE
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 12:30:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672767032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xnN+lM99/xIuZx1saOzsPUZmKndocv4ngoFq8GetVzA=;
 b=FdsI9H81SB9Kk1stmsmiI/8mWx0I5nIU0FjAemyAOKxLiIJ6BX5kMTE358C5yCPej0bpvn
 /m15ZSjBCv5xIFv27KYJn9B7ARAqMUEZApi6QK5EGvA+kSZOYbHBQqSZNg9/2FattafgoH
 LGzgMM9hdBCPnQr8IbjyIETrYspstp0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-slSnc3tFOpGsK8iEK5a_Gg-1; Tue, 03 Jan 2023 12:30:28 -0500
X-MC-Unique: slSnc3tFOpGsK8iEK5a_Gg-1
Received: by mail-qk1-f199.google.com with SMTP id
 bm30-20020a05620a199e00b006ff813575b1so21428993qkb.16
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 09:30:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xnN+lM99/xIuZx1saOzsPUZmKndocv4ngoFq8GetVzA=;
 b=pl57LjD6QiirVme7iqniIxvsdLIUZ+fIhBlh7lbNKvxtO+BiER66zyXt8cZ1svO8NM
 AN6zFN58YfEA4LqwFIacQOdb1pTwxc2AXUXXvyoKxX+/tTjjAgGEKoT+RBEByckind5z
 oDasJOTWdE4RIGfqvb/KufOXBQVOY20fyYJ31LUfJ2SHjadqIUwFNUeSgNUzdBsQ1IIr
 BXsFN/uAsmLCiHQtMS3jfnMfw8syo7vBPKPFfYj+xekGeqchy8QqjbFGn7YCyhHhsb4C
 26jhobhhjfWiD/3Tngqn4YG/8eRyLVJ8b30Kp2h9eKYl2IHHkfeonT6vJyi3z57j0ndX
 8RSQ==
X-Gm-Message-State: AFqh2kqbr+HlhxrwSFEYN49H5RFr4niz4btldPIipbHDnpYjRMKGiGhN
 AgpDWTXrRiBp7P91KzANByGKQKyvuHmN0GRZ3v+MoL1boW5wx92wYZPxW7P+W0qPls9FeI/luHe
 uHA/aP9TAgw2Lv9g=
X-Received: by 2002:ac8:5199:0:b0:3a4:ff03:f1ac with SMTP id
 c25-20020ac85199000000b003a4ff03f1acmr69444591qtn.6.1672767028177; 
 Tue, 03 Jan 2023 09:30:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtW0SyMWXc9Yz5JnXiaXR6aykl9H+KD9KBoC33DLz7mbwnb5VXWoxfIPB6CrGr6ojPAQO8M3g==
X-Received: by 2002:ac8:5199:0:b0:3a4:ff03:f1ac with SMTP id
 c25-20020ac85199000000b003a4ff03f1acmr69444557qtn.6.1672767027867; 
 Tue, 03 Jan 2023 09:30:27 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-39-70-52-228-144.dsl.bell.ca.
 [70.52.228.144]) by smtp.gmail.com with ESMTPSA id
 f1-20020a05620a280100b006fa43e139b5sm22472925qkp.59.2023.01.03.09.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 09:30:27 -0800 (PST)
Date: Tue, 3 Jan 2023 12:30:26 -0500
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v3] intel-iommu: Document iova_tree
Message-ID: <Y7RmMvRNFf+YYRyH@x1n>
References: <20221206221348.396020-1-peterx@redhat.com>
 <CACGkMEtK8w2OkeZR=Ebp3t8t6bfaJusTRyC0eB3BGyA7KuX5-g@mail.gmail.com>
 <Y6XWy9XPHqhK8BMh@x1n>
 <CACGkMEu6OC7eCyR-ztBXGMe-mtWHfLMHPVJrGWO6Rpx3bHTCPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACGkMEu6OC7eCyR-ztBXGMe-mtWHfLMHPVJrGWO6Rpx3bHTCPQ@mail.gmail.com>
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

On Mon, Dec 26, 2022 at 12:09:52PM +0800, Jason Wang wrote:
> On Sat, Dec 24, 2022 at 12:26 AM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Fri, Dec 23, 2022 at 03:48:01PM +0800, Jason Wang wrote:
> > > On Wed, Dec 7, 2022 at 6:13 AM Peter Xu <peterx@redhat.com> wrote:
> > > >
> > > > It seems not super clear on when iova_tree is used, and why.  Add a rich
> > > > comment above iova_tree to track why we needed the iova_tree, and when we
> > > > need it.
> > > >
> > > > Also comment for the map/unmap messages, on how they're used and
> > > > implications (e.g. unmap can be larger than the mapped ranges).
> > > >
> > > > Suggested-by: Jason Wang <jasowang@redhat.com>
> > > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > > ---
> > > > v3:
> > > > - Adjust according to Eric's comment
> > > > ---
> > > >  include/exec/memory.h         | 28 ++++++++++++++++++++++++++
> > > >  include/hw/i386/intel_iommu.h | 38 ++++++++++++++++++++++++++++++++++-
> > > >  2 files changed, 65 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > > > index 91f8a2395a..269ecb873b 100644
> > > > --- a/include/exec/memory.h
> > > > +++ b/include/exec/memory.h
> > > > @@ -129,6 +129,34 @@ struct IOMMUTLBEntry {
> > > >  /*
> > > >   * Bitmap for different IOMMUNotifier capabilities. Each notifier can
> > > >   * register with one or multiple IOMMU Notifier capability bit(s).
> > > > + *
> > > > + * Normally there're two use cases for the notifiers:
> > > > + *
> > > > + *   (1) When the device needs accurate synchronizations of the vIOMMU page
> > > > + *       tables, it needs to register with both MAP|UNMAP notifies (which
> > > > + *       is defined as IOMMU_NOTIFIER_IOTLB_EVENTS below).
> > > > + *
> > > > + *       Regarding to accurate synchronization, it's when the notified
> > > > + *       device maintains a shadow page table and must be notified on each
> > > > + *       guest MAP (page table entry creation) and UNMAP (invalidation)
> > > > + *       events (e.g. VFIO). Both notifications must be accurate so that
> > > > + *       the shadow page table is fully in sync with the guest view.
> > > > + *
> > > > + *   (2) When the device doesn't need accurate synchronizations of the
> > > > + *       vIOMMU page tables, it needs to register only with UNMAP or
> > > > + *       DEVIOTLB_UNMAP notifies.
> > > > + *
> > > > + *       It's when the device maintains a cache of IOMMU translations
> > > > + *       (IOTLB) and is able to fill that cache by requesting translations
> > > > + *       from the vIOMMU through a protocol similar to ATS (Address
> > > > + *       Translation Service).
> > > > + *
> > > > + *       Note that in this mode the vIOMMU will not maintain a shadowed
> > > > + *       page table for the address space, and the UNMAP messages can be
> > > > + *       actually larger than the real invalidations (just like how the
> > > > + *       Linux IOMMU driver normally works, where an invalidation can be
> > > > + *       enlarged as long as it still covers the target range).  The IOMMU
> > >
> > > Just spot this when testing your fix for DSI:
> > >
> > >         assert(entry->iova >= notifier->start && entry_end <= notifier->end);
> > >
> > > Do we need to remove this (but it seems a partial revert of
> > > 03c7140c1a0336af3d4fca768de791b9c0e2b128)?
> >
> > Replied in the othe thread.
> >
> > I assume this documentation patch is still correct, am I right?  It's
> > talking about the possibility of enlarged invalidation range sent from the
> > guest and vIOMMU.  That should still not be bigger than the registered
> > range in iommu notifiers (even if bigger than the actual unmapped range).
> 
> Adding Eugenio.
> 
> So I think we need to evaluate the possible side effects to all the
> current nmap notifiers. For example the vfio_iommu_map_notify().
> 
> And in another thread, if we crop the size, it basically means the
> notifier itself will still assume the range is valid, which is not
> what is documented in this patch.
> 
> What's more interesting I see smmu had:
> 
> /* Unmap the whole notifier's range */
> static void smmu_unmap_notifier_range(IOMMUNotifier *n)
> {
>     IOMMUTLBEvent event;
> 
>     event.type = IOMMU_NOTIFIER_UNMAP;
>     event.entry.target_as = &address_space_memory;
>     event.entry.iova = n->start;
>     event.entry.perm = IOMMU_NONE;
>     event.entry.addr_mask = n->end - n->start;
> 
>     memory_region_notify_iommu_one(n, &event);
> }
> 
> So it looks to me it's more safe to do something similar for vtd first.

Jason, could you elaborate more on this one?

Meanwhile, I don't immediately see what's the side effect you mentioned for
vfio map events.  I thought any map event should always be in the notifier
range anyway because map event only comes in page sizes and generated by
vt-d page walkers (not guest driver, which is IIUC the only place where the
range of invalidation can be enlarged).  So I don't expect any functional
change to map events if we decide to crop the ranges unconditionally.  Did
I miss anything?

Thanks,

> 
> Btw, I forgot the reason why we need to crop the size in the case of
> device IOTLB, Eguenio do you know that?
> 
> Thanks
> 
> >
> > Thanks,
> >
> > --
> > Peter Xu
> >
> 

-- 
Peter Xu



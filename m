Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8DB6448B7
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 17:05:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2aRa-0000Pd-5U; Tue, 06 Dec 2022 11:05:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p2aRX-0000PK-Ku
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 11:05:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p2aRV-0008J4-8L
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 11:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670342710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DlROGIII1qCTfrYoi8EVpSOTzc9ngrjPATxkQbU/d+A=;
 b=QpGT7wlBqYzJH2mQ4wQ2Qfwuq0K8vB6FyZ9whX1l8DGqZ53zXzhBlTJedArzcgj9JP+TEb
 am0/G3pqcDW2D68olFWC/qmKBgXeGPHTF8s0eIAzUkyaobWro2DhzlIaaYWv7sfmDyCTm/
 3BqZhcefCfOU9EAjL1PD/g+K6bjBzXU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-533-CG4BawzEPiK55F50WjlhyQ-1; Tue, 06 Dec 2022 11:05:09 -0500
X-MC-Unique: CG4BawzEPiK55F50WjlhyQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 ew11-20020a05622a514b00b003a524196d31so34314974qtb.2
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 08:05:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DlROGIII1qCTfrYoi8EVpSOTzc9ngrjPATxkQbU/d+A=;
 b=NRRpfESKuOs3ziqg9u/bYur7UIhtupV/ilZwC9vBn2UNpHBleIrYYfxE1nbaDfHonr
 KTLkh4ywOPRx4PZhs5JeonbK6SRfHhC2hxPzjE3vJ+WvHB+OX4f/w7RIofzugnfdzf30
 gUpBojW1IPjW9MCpxnqdeZpOubwiroUgB1x/tTn58hOxxgSgcxFM4JYycMiSofCOzhib
 z9eBSH3J6TLDKBHvPpJhJnhh+h8D/2jNnu/Qv29DjbIZAu/1pg+BZhDZ8xjp3NV45gtO
 JJQhlg7OSYvD4uO2Ct6u98O4PvcNS7x3q+/S/VDJ5coU2/GNugqHFtHWysWkjxMQT9fk
 tHZA==
X-Gm-Message-State: ANoB5pknINyTkIkKGWbOyTfMdkdRlVuNU1sdjnsMuQJA7gtAvk8vvXuV
 xUVmfSM5qHD/wsCMCge959MzP25pzF2wTi6JDHlhyNKubr6EXPhfVVa0E7sCz5/gd4MUSTp0xjf
 PsNl+wujOj90xipY=
X-Received: by 2002:ac8:7750:0:b0:3a7:f091:bfc with SMTP id
 g16-20020ac87750000000b003a7f0910bfcmr739442qtu.650.1670342708893; 
 Tue, 06 Dec 2022 08:05:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4AmwYhTvWAa7vqkmvHtPLL1T7aaUfbJR8OqQlLAxzh9t68KkukQZ6I9L27w2Y97s5N/bZfDA==
X-Received: by 2002:ac8:7750:0:b0:3a7:f091:bfc with SMTP id
 g16-20020ac87750000000b003a7f0910bfcmr739411qtu.650.1670342708574; 
 Tue, 06 Dec 2022 08:05:08 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 c23-20020a05620a269700b006e8f8ca8287sm15055524qkp.120.2022.12.06.08.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 08:05:07 -0800 (PST)
Date: Tue, 6 Dec 2022 11:05:07 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Yi Liu <yi.l.liu@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH] intel-iommu: Document iova_tree
Message-ID: <Y49oM/xkFkIcuSxO@x1n>
References: <20221201162501.3864692-1-peterx@redhat.com>
 <CACGkMEu2NrYULRLZAUNbp5SAUVPb8nMZb9=3=JWFHciC7FAHkg@mail.gmail.com>
 <Y45+pQJtMftyIHGQ@x1n>
 <6189ef29-fe38-bc74-aff1-034eb28ab031@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6189ef29-fe38-bc74-aff1-034eb28ab031@redhat.com>
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

On Tue, Dec 06, 2022 at 02:16:32PM +0100, Eric Auger wrote:
> Hi Peter,
> On 12/6/22 00:28, Peter Xu wrote:
> > On Mon, Dec 05, 2022 at 12:23:20PM +0800, Jason Wang wrote:
> >> On Fri, Dec 2, 2022 at 12:25 AM Peter Xu <peterx@redhat.com> wrote:
> >>> It seems not super clear on when iova_tree is used, and why.  Add a rich
> >>> comment above iova_tree to track why we needed the iova_tree, and when we
> >>> need it.
> >>>
> >>> Suggested-by: Jason Wang <jasowang@redhat.com>
> >>> Signed-off-by: Peter Xu <peterx@redhat.com>
> >>> ---
> >>>  include/hw/i386/intel_iommu.h | 30 +++++++++++++++++++++++++++++-
> >>>  1 file changed, 29 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
> >>> index 46d973e629..8d130ab2e3 100644
> >>> --- a/include/hw/i386/intel_iommu.h
> >>> +++ b/include/hw/i386/intel_iommu.h
> >>> @@ -109,7 +109,35 @@ struct VTDAddressSpace {
> >>>      QLIST_ENTRY(VTDAddressSpace) next;
> >>>      /* Superset of notifier flags that this address space has */
> >>>      IOMMUNotifierFlag notifier_flags;
> >>> -    IOVATree *iova_tree;          /* Traces mapped IOVA ranges */
> >>> +    /*
> >>> +     * @iova_tree traces mapped IOVA ranges.
> >>> +     *
> >>> +     * The tree is not needed if no MAP notifiers is registered with
> >>> +     * current VTD address space, because all UNMAP (including iotlb or
> >>> +     * dev-iotlb) events can be transparently delivered to !MAP iommu
> >>> +     * notifiers.
> >> So this means the UNMAP notifier doesn't need to be as accurate as
> >> MAP. (Should we document it in the notifier headers)?
> > Yes.
> >
> >> For MAP[a, b] MAP[b, c] we can do a UNMAP[a. c].
> > IIUC a better way to say this is, for MAP[a, b] we can do an UNMAP[a-X,
> > b+Y] as long as the range covers [a, b]?
> >
> >>> +     *
> >>> +     * The tree OTOH is required for MAP typed iommu notifiers for a few
> >>> +     * reasons.
> >>> +     *
> >>> +     * Firstly, there's no way to identify whether an PSI event is MAP or
> >>> +     * UNMAP within the PSI message itself.  Without having prior knowledge
> >>> +     * of existing state vIOMMU doesn't know whether it should notify MAP
> >>> +     * or UNMAP for a PSI message it received.
> >>> +     *
> >>> +     * Secondly, PSI received from guest driver (or even a large PSI can
> >>> +     * grow into a DSI at least with Linux intel-iommu driver) can be
> >>> +     * larger in range than the newly mapped ranges for either MAP or UNMAP
> >>> +     * events.
> >> Yes, so I think we need a document that the UNMAP handler should be
> >> prepared for this.
> > How about I squash below into this same patch?
> >
> > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > index 91f8a2395a..c83bd11a68 100644
> > --- a/include/exec/memory.h
> > +++ b/include/exec/memory.h
> > @@ -129,6 +129,24 @@ struct IOMMUTLBEntry {
> >  /*
> >   * Bitmap for different IOMMUNotifier capabilities. Each notifier can
> >   * register with one or multiple IOMMU Notifier capability bit(s).
> > + *
> > + * Normally there're two use cases for the notifiers:
> > + *
> > + *   (1) When the device needs accurate synchronizations of the vIOMMU page
> accurate synchronizations sound too vague & subjective to me.

Suggestions?

> > + *       tables, it needs to register with both MAP|UNMAP notifies (which
> > + *       is defined as IOMMU_NOTIFIER_IOTLB_EVENTS below).  As long as MAP
> > + *       events are registered, the notifications will be accurate but
> > + *       there's overhead on synchronizing the guest vIOMMU page tables.
> > + *
> > + *   (2) When the device doesn't need accurate synchronizations of the
> > + *       vIOMMU page tables (when the device can both cache translations
> > + *       and requesting to translate dynamically during DMA process), it
> s/requesting/request
> > + *       needs to register only with UNMAP or DEVIOTLB_UNMAP notifies.
> would be nice to clarify the distinction between both then
> > + *       Note that in such working mode shadow page table is not used for
> > + *       vIOMMU unit on this address space, so the UNMAP messages can be
> I do not catch 'is not used for vIOMMU unit on this address space'

How about: "Note that in this working mode the vIOMMU will not maintain a
shadowed page table for the address space, and the UNMAP messages can be.."?

> > + *       actually larger than the real invalidations (just like how the
> > + *       Linux IOMMU driver normally works, where an invalidation can be
> > + *       enlarged as long as it still covers the target range).
> >   */
> >  typedef enum {
> >      IOMMU_NOTIFIER_NONE = 0,
> >
> > Thanks,
> >
> Thanks
> 
> Eric
> 

-- 
Peter Xu



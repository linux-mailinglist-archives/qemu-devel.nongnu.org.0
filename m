Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD516644E60
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 23:11:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2g8Y-0006FM-F4; Tue, 06 Dec 2022 17:10:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p2g8T-0006Ew-Gf
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 17:09:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p2g8Q-0002MY-Cd
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 17:09:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670364593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EWAbigzad6OkMhcwh6uXltF3dEj6ZxZMkGhss5t3M8c=;
 b=C2PUN8aVxXp2wtqVhxP4pgxqg4Vs8JmBi7Rj94vBCOuQUi1nVdUp2ExNpAPPS5tFP8d489
 KC0QXd8wH6eoLxdBw5eheSuUzJ/aPqMPw058kvrwiJpNgCWcAhT/rIbfjg2euIuM28yuwb
 a5awpofkwvVgZQ/gj14/kxUHQsgFohM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-536-8McjP2RSO_Ggozhj42cGTg-1; Tue, 06 Dec 2022 17:09:51 -0500
X-MC-Unique: 8McjP2RSO_Ggozhj42cGTg-1
Received: by mail-qv1-f72.google.com with SMTP id
 og17-20020a056214429100b004c6ae186493so34905789qvb.3
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 14:09:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EWAbigzad6OkMhcwh6uXltF3dEj6ZxZMkGhss5t3M8c=;
 b=abPD9snqaQNRSqIX68OrStOupq1RqhuezPG9gDzQ79vmk/lva6m0l1IPhnhw9Ziuc2
 gX/0M80LvaavmXD5/NemxNdLDpIuSi7OBuqUWEDhTiogWcEAMy6oXzm5FsMIUDg7V7JZ
 6WjF9lTAA3jnzHxZBKTcYR+BamPfTAmNtHkKnFSF72WMyUeMERy5v8ABxbhBYnmrwuTy
 5KkC9RY0cnfkoz6FrV1DGntxR/TakQSaWF0vLYCIzkZB/MOJq9QlbytE0/q94hjfpo9+
 xcmp5OZlsv5Wl8zTD5kjSBy8BWS4q281LG75nmQts4JZmeGlC81VTwoEeS019BvGIlFx
 cZQA==
X-Gm-Message-State: ANoB5pkbQgOLtBJAlDDJ+S63IlDm/7+jklbEC7kR5MrmLU6f+Jnqlb6d
 wPKGgo9PX0a/Oub5TEAcWwIXvAVFvpvlo6wrGm4IONkRCL7fu4FgLL7CjkZ3SNvxYBWgTw5FTtv
 bArEzH5KCZkypl5o=
X-Received: by 2002:ad4:48c6:0:b0:4c7:69d:75c0 with SMTP id
 v6-20020ad448c6000000b004c7069d75c0mr697408qvx.36.1670364591040; 
 Tue, 06 Dec 2022 14:09:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5dBy+C0b5TK69prCavLNvb5cg14otF7Rur+yG3o3gg4W7NmFLatGuUMHuOfseNW1TPMw8Uew==
X-Received: by 2002:ad4:48c6:0:b0:4c7:69d:75c0 with SMTP id
 v6-20020ad448c6000000b004c7069d75c0mr697401qvx.36.1670364590751; 
 Tue, 06 Dec 2022 14:09:50 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 d16-20020a05620a241000b006fa43e139b5sm7513712qkn.59.2022.12.06.14.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 14:09:50 -0800 (PST)
Date: Tue, 6 Dec 2022 17:09:49 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Yi Liu <yi.l.liu@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH] intel-iommu: Document iova_tree
Message-ID: <Y4+9razzMCfX6HxW@x1n>
References: <20221201162501.3864692-1-peterx@redhat.com>
 <CACGkMEu2NrYULRLZAUNbp5SAUVPb8nMZb9=3=JWFHciC7FAHkg@mail.gmail.com>
 <Y45+pQJtMftyIHGQ@x1n>
 <6189ef29-fe38-bc74-aff1-034eb28ab031@redhat.com>
 <Y49oM/xkFkIcuSxO@x1n>
 <e9ec1a33-f2a3-3170-298d-d0f70de59b3d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e9ec1a33-f2a3-3170-298d-d0f70de59b3d@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Tue, Dec 06, 2022 at 05:28:01PM +0100, Eric Auger wrote:
> 
> 
> On 12/6/22 17:05, Peter Xu wrote:
> > On Tue, Dec 06, 2022 at 02:16:32PM +0100, Eric Auger wrote:
> >> Hi Peter,
> >> On 12/6/22 00:28, Peter Xu wrote:
> >>> On Mon, Dec 05, 2022 at 12:23:20PM +0800, Jason Wang wrote:
> >>>> On Fri, Dec 2, 2022 at 12:25 AM Peter Xu <peterx@redhat.com> wrote:
> >>>>> It seems not super clear on when iova_tree is used, and why.  Add a rich
> >>>>> comment above iova_tree to track why we needed the iova_tree, and when we
> >>>>> need it.
> >>>>>
> >>>>> Suggested-by: Jason Wang <jasowang@redhat.com>
> >>>>> Signed-off-by: Peter Xu <peterx@redhat.com>
> >>>>> ---
> >>>>>  include/hw/i386/intel_iommu.h | 30 +++++++++++++++++++++++++++++-
> >>>>>  1 file changed, 29 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
> >>>>> index 46d973e629..8d130ab2e3 100644
> >>>>> --- a/include/hw/i386/intel_iommu.h
> >>>>> +++ b/include/hw/i386/intel_iommu.h
> >>>>> @@ -109,7 +109,35 @@ struct VTDAddressSpace {
> >>>>>      QLIST_ENTRY(VTDAddressSpace) next;
> >>>>>      /* Superset of notifier flags that this address space has */
> >>>>>      IOMMUNotifierFlag notifier_flags;
> >>>>> -    IOVATree *iova_tree;          /* Traces mapped IOVA ranges */
> >>>>> +    /*
> >>>>> +     * @iova_tree traces mapped IOVA ranges.
> >>>>> +     *
> >>>>> +     * The tree is not needed if no MAP notifiers is registered with
> >>>>> +     * current VTD address space, because all UNMAP (including iotlb or
> >>>>> +     * dev-iotlb) events can be transparently delivered to !MAP iommu
> >>>>> +     * notifiers.
> >>>> So this means the UNMAP notifier doesn't need to be as accurate as
> >>>> MAP. (Should we document it in the notifier headers)?
> >>> Yes.
> >>>
> >>>> For MAP[a, b] MAP[b, c] we can do a UNMAP[a. c].
> >>> IIUC a better way to say this is, for MAP[a, b] we can do an UNMAP[a-X,
> >>> b+Y] as long as the range covers [a, b]?
> >>>
> >>>>> +     *
> >>>>> +     * The tree OTOH is required for MAP typed iommu notifiers for a few
> >>>>> +     * reasons.
> >>>>> +     *
> >>>>> +     * Firstly, there's no way to identify whether an PSI event is MAP or
> >>>>> +     * UNMAP within the PSI message itself.  Without having prior knowledge
> >>>>> +     * of existing state vIOMMU doesn't know whether it should notify MAP
> >>>>> +     * or UNMAP for a PSI message it received.
> >>>>> +     *
> >>>>> +     * Secondly, PSI received from guest driver (or even a large PSI can
> >>>>> +     * grow into a DSI at least with Linux intel-iommu driver) can be
> >>>>> +     * larger in range than the newly mapped ranges for either MAP or UNMAP
> >>>>> +     * events.
> >>>> Yes, so I think we need a document that the UNMAP handler should be
> >>>> prepared for this.
> >>> How about I squash below into this same patch?
> >>>
> >>> diff --git a/include/exec/memory.h b/include/exec/memory.h
> >>> index 91f8a2395a..c83bd11a68 100644
> >>> --- a/include/exec/memory.h
> >>> +++ b/include/exec/memory.h
> >>> @@ -129,6 +129,24 @@ struct IOMMUTLBEntry {
> >>>  /*
> >>>   * Bitmap for different IOMMUNotifier capabilities. Each notifier can
> >>>   * register with one or multiple IOMMU Notifier capability bit(s).
> >>> + *
> >>> + * Normally there're two use cases for the notifiers:
> >>> + *
> >>> + *   (1) When the device needs accurate synchronizations of the vIOMMU page
> >> accurate synchronizations sound too vague & subjective to me.
> > Suggestions?
> Well I would say:
> when the notified device maintains a shadow page table and must to be

s/to//

> notified on each guest MAP (page table entry creation) and UNMAP
> (invalidation) events (VFIO). Both notifications must be accurate so
> that the shadow page table is fully in sync with the guest view.

Thanks, I'll try to squash this into the new version.

> >
> >>> + *       tables, it needs to register with both MAP|UNMAP notifies (which
> >>> + *       is defined as IOMMU_NOTIFIER_IOTLB_EVENTS below).  As long as MAP
> >>> + *       events are registered, the notifications will be accurate but
> >>> + *       there's overhead on synchronizing the guest vIOMMU page tables.
> >>> + *
> >>> + *   (2) When the device doesn't need accurate synchronizations of the
> >>> + *       vIOMMU page tables (when the device can both cache translations
> >>> + *       and requesting to translate dynamically during DMA process), it
> when the notified device maintains a cache of IOMMU translations (IOTLB)
> and is able to fill that cache by requesting translations from the
> vIOMMU through a protocol similar to ATS. In that case the notified
> device only needs to register an UNMAP notifier. In that case the unmap
> notifications are allower to be wider than the strict necessary.

Same here.

> 
> However the problem is since you need to satisfy the VFIO use case, how
> do you detect when you are allowed to invalidate more that the strict
> necessary?

We detect that by checking whether the vtd_as has map notifier registered.
Please feel free to have a look at all sites of vtd_as_has_map_notifier().
We maintain the iova tree only for MAP case currently.

-- 
Peter Xu



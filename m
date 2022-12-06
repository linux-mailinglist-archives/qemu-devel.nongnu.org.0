Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D8E643D6A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 08:06:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2S1b-0006iz-TA; Tue, 06 Dec 2022 02:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p2S0x-0006he-1S
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:05:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p2S0v-0000E7-1D
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:05:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670310311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aQbwe/2bA80JJCRUju+3F3gbF3tBv1HO/18WlF48uQQ=;
 b=ZWiKxHTvfI8c0xqG61hFtdcTmXwDC6C64m0i5qj0GaycUgrrbFzzzxE4PFxLP8hSsKkovM
 Qz+xV2KtcTa/1/yf5z4/KBRLKwD5K80XUXpjQCyoLjB7pw+UO0HqmxSjqEmuMXkiCtdA0J
 T+AGyPgrkV1VsxE0SrgWnYrl2k9cefE=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-576-sYjwRlyTPQebRk5YeBb_pQ-1; Tue, 06 Dec 2022 02:05:09 -0500
X-MC-Unique: sYjwRlyTPQebRk5YeBb_pQ-1
Received: by mail-oi1-f200.google.com with SMTP id
 p133-20020acaf18b000000b0035b236c8554so6198544oih.15
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 23:05:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aQbwe/2bA80JJCRUju+3F3gbF3tBv1HO/18WlF48uQQ=;
 b=UaSN4dbBZciDUSoNzTkam1vH5KWVAhBXZJDAox04JZln6o9ORGMaF3sGe5KIxQ1I+n
 xzA04m0fSZdf8fB7X+g1rpVcSCEtXq0rnfhyXGjOZsSgdUeNaCuJDNZIXhrSIPPtPM4v
 1AilW6In+uGO1Nj53dxMbaLg4hTtWsJK3RBOLXQcdJJXfgWzQXeu2wui01wyu0/LhCWr
 3Htf0VDlo3MhU3eUWnmxDsWTPjwCG4Cb454gDZbosfQGLolrm15dmEfuz8AYPqMiKfBH
 YgbMuQ1D5Xiin+ZYJQpReOddAkTcl25ZaO9dBnJxe9rZsiOYgdBKZxVvIrAg93r+nJ6D
 mHkQ==
X-Gm-Message-State: ANoB5pncar2K4GMn82YeVMnmYVWExNixdwwJsyM/6TSgw3hNb+bf1dxW
 ry1xkg/zWYN3vXaM6JxufSyTTLJmPUmJFsP7VbdvfCjgZD2tpKo6P3ZhR24nzgd2qz51ed9nXC5
 nL6om6rqgEIi7bWmd20Sk4q4pOq8KU+8=
X-Received: by 2002:aca:1a12:0:b0:35c:303d:fe37 with SMTP id
 a18-20020aca1a12000000b0035c303dfe37mr4125546oia.35.1670310308389; 
 Mon, 05 Dec 2022 23:05:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7PtncGJ8ucIxhmP7OGSlLbdTTxrSBOkmSkDZzuJPj9AXRhSJhdO69P0fIT9Q4bjbY8DLoOO7T63aZfl9h7ZEM=
X-Received: by 2002:aca:1a12:0:b0:35c:303d:fe37 with SMTP id
 a18-20020aca1a12000000b0035c303dfe37mr4125535oia.35.1670310308154; Mon, 05
 Dec 2022 23:05:08 -0800 (PST)
MIME-Version: 1.0
References: <20221201162501.3864692-1-peterx@redhat.com>
 <CACGkMEu2NrYULRLZAUNbp5SAUVPb8nMZb9=3=JWFHciC7FAHkg@mail.gmail.com>
 <Y45+pQJtMftyIHGQ@x1n>
In-Reply-To: <Y45+pQJtMftyIHGQ@x1n>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 6 Dec 2022 15:04:57 +0800
Message-ID: <CACGkMEuObOb5N5cuHR5Yqd9H0J6wLea0oMp-1AbecJPRustSOA@mail.gmail.com>
Subject: Re: [PATCH] intel-iommu: Document iova_tree
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yi Liu <yi.l.liu@intel.com>, Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Tue, Dec 6, 2022 at 7:28 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, Dec 05, 2022 at 12:23:20PM +0800, Jason Wang wrote:
> > On Fri, Dec 2, 2022 at 12:25 AM Peter Xu <peterx@redhat.com> wrote:
> > >
> > > It seems not super clear on when iova_tree is used, and why.  Add a rich
> > > comment above iova_tree to track why we needed the iova_tree, and when we
> > > need it.
> > >
> > > Suggested-by: Jason Wang <jasowang@redhat.com>
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > ---
> > >  include/hw/i386/intel_iommu.h | 30 +++++++++++++++++++++++++++++-
> > >  1 file changed, 29 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
> > > index 46d973e629..8d130ab2e3 100644
> > > --- a/include/hw/i386/intel_iommu.h
> > > +++ b/include/hw/i386/intel_iommu.h
> > > @@ -109,7 +109,35 @@ struct VTDAddressSpace {
> > >      QLIST_ENTRY(VTDAddressSpace) next;
> > >      /* Superset of notifier flags that this address space has */
> > >      IOMMUNotifierFlag notifier_flags;
> > > -    IOVATree *iova_tree;          /* Traces mapped IOVA ranges */
> > > +    /*
> > > +     * @iova_tree traces mapped IOVA ranges.
> > > +     *
> > > +     * The tree is not needed if no MAP notifiers is registered with
> > > +     * current VTD address space, because all UNMAP (including iotlb or
> > > +     * dev-iotlb) events can be transparently delivered to !MAP iommu
> > > +     * notifiers.
> >
> > So this means the UNMAP notifier doesn't need to be as accurate as
> > MAP. (Should we document it in the notifier headers)?
>
> Yes.
>
> >
> > For MAP[a, b] MAP[b, c] we can do a UNMAP[a. c].
>
> IIUC a better way to say this is, for MAP[a, b] we can do an UNMAP[a-X,
> b+Y] as long as the range covers [a, b]?

Right.

>
> >
> > > +     *
> > > +     * The tree OTOH is required for MAP typed iommu notifiers for a few
> > > +     * reasons.
> > > +     *
> > > +     * Firstly, there's no way to identify whether an PSI event is MAP or
> > > +     * UNMAP within the PSI message itself.  Without having prior knowledge
> > > +     * of existing state vIOMMU doesn't know whether it should notify MAP
> > > +     * or UNMAP for a PSI message it received.
> > > +     *
> > > +     * Secondly, PSI received from guest driver (or even a large PSI can
> > > +     * grow into a DSI at least with Linux intel-iommu driver) can be
> > > +     * larger in range than the newly mapped ranges for either MAP or UNMAP
> > > +     * events.
> >
> > Yes, so I think we need a document that the UNMAP handler should be
> > prepared for this.
>
> How about I squash below into this same patch?

Looks good to me.

Thanks

>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 91f8a2395a..c83bd11a68 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -129,6 +129,24 @@ struct IOMMUTLBEntry {
>  /*
>   * Bitmap for different IOMMUNotifier capabilities. Each notifier can
>   * register with one or multiple IOMMU Notifier capability bit(s).
> + *
> + * Normally there're two use cases for the notifiers:
> + *
> + *   (1) When the device needs accurate synchronizations of the vIOMMU page
> + *       tables, it needs to register with both MAP|UNMAP notifies (which
> + *       is defined as IOMMU_NOTIFIER_IOTLB_EVENTS below).  As long as MAP
> + *       events are registered, the notifications will be accurate but
> + *       there's overhead on synchronizing the guest vIOMMU page tables.
> + *
> + *   (2) When the device doesn't need accurate synchronizations of the
> + *       vIOMMU page tables (when the device can both cache translations
> + *       and requesting to translate dynamically during DMA process), it
> + *       needs to register only with UNMAP or DEVIOTLB_UNMAP notifies.
> + *       Note that in such working mode shadow page table is not used for
> + *       vIOMMU unit on this address space, so the UNMAP messages can be
> + *       actually larger than the real invalidations (just like how the
> + *       Linux IOMMU driver normally works, where an invalidation can be
> + *       enlarged as long as it still covers the target range).
>   */
>  typedef enum {
>      IOMMU_NOTIFIER_NONE = 0,
>
> Thanks,
>
> --
> Peter Xu
>



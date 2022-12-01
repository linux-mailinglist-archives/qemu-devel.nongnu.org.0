Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A39D63F81A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 20:23:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0p8l-0008Im-Ny; Thu, 01 Dec 2022 14:22:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p0p8j-0008HV-RZ
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 14:22:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p0p8h-0002BR-To
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 14:22:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669922551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wb5RoAVjw7BoUJHlNZZ4yet8cPymP4yGAtgCQ8/TiOI=;
 b=N/I4th/1XaCITfiP44/Gx3N2bLrORfAP3dz97f0AGj0WmYKBWzAkLvlCQ6e40GA1cadbgB
 jFPtcPStSYv13QCckUH7VMORjrM8qIkoNZPH7Ikf0wpa+o6RiQcKqSuPYA3oRHBpQGIUmf
 hDSNWoM933Z/uueTr0nv2Cq3lftFUAs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-74-IBTXSqiDOMCSFhZiKiVviw-1; Thu, 01 Dec 2022 14:22:29 -0500
X-MC-Unique: IBTXSqiDOMCSFhZiKiVviw-1
Received: by mail-qt1-f198.google.com with SMTP id
 u31-20020a05622a199f00b003a51fa90654so7286100qtc.19
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 11:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wb5RoAVjw7BoUJHlNZZ4yet8cPymP4yGAtgCQ8/TiOI=;
 b=Z6sizORG+G0f+PkbBwhN0aU4o/4fIBtqAVQWX54/0gr9FgQUIQaP7i68CCPMgMqW0C
 9rA8BDMHgnBudcTlUFRHaWwquuVAEx5l8qJBZSwdmLjhtUHoLJrTrqxU5vPrDn2MrrIO
 H0hbs+XHcngdfvGpIFEDaKDPv8gOedn5zz7vzvSR0b1uv8IN1ewMHMfJtGrAXqr5oNWx
 uYx2kQ6EXUCnowmiKT391V6fTgWLl/7rPGvoOeBLeMM6fv0F6FpRsOLzRuKlZ8dGu6th
 yzwLPY0wiLw4Pe86ALaZe6AMrNkKnLdWmZ6zlT5AAqGQXII/sxGNdiiKcQOpGu2Qq6LZ
 m06g==
X-Gm-Message-State: ANoB5pl7KVvUAy7idUAvqv8r4ybNADUcz8Fo5Ta9CtDi4E7Kt5zRwXrL
 vUS6Gxu9CAhix8YYfU8o3q66wnI/baDSbgui9JI9grwoGWg+yB7RRBWv98/Wlm28Qb7R+oNFpAz
 W0tjkGxQyf/WSlN4=
X-Received: by 2002:a05:622a:4087:b0:3a5:be2:9a04 with SMTP id
 cg7-20020a05622a408700b003a50be29a04mr44707011qtb.402.1669922549353; 
 Thu, 01 Dec 2022 11:22:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6KY/NRwgdvO6nDwSM1TXG1e2R0G5RyWZcNIyW5FfIz5SxJ2zt7NKw5ekgoL3FfBjBoRoyxYw==
X-Received: by 2002:a05:622a:4087:b0:3a5:be2:9a04 with SMTP id
 cg7-20020a05622a408700b003a50be29a04mr44706992qtb.402.1669922549057; 
 Thu, 01 Dec 2022 11:22:29 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 t17-20020a37ea11000000b006b5cc25535fsm3942635qkj.99.2022.12.01.11.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 11:22:28 -0800 (PST)
Date: Thu, 1 Dec 2022 14:22:27 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Yi Liu <yi.l.liu@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH] intel-iommu: Document iova_tree
Message-ID: <Y4j+8y8EnWkZor2+@x1n>
References: <20221201162501.3864692-1-peterx@redhat.com>
 <9de7491a-0787-fca5-0738-da5e8288b683@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9de7491a-0787-fca5-0738-da5e8288b683@redhat.com>
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

On Thu, Dec 01, 2022 at 07:17:41PM +0100, Eric Auger wrote:
> Hi Peter

Hi, Eric,

> 
> On 12/1/22 17:25, Peter Xu wrote:
> > It seems not super clear on when iova_tree is used, and why.  Add a rich
> > comment above iova_tree to track why we needed the iova_tree, and when we
> > need it.
> >
> > Suggested-by: Jason Wang <jasowang@redhat.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  include/hw/i386/intel_iommu.h | 30 +++++++++++++++++++++++++++++-
> >  1 file changed, 29 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
> > index 46d973e629..8d130ab2e3 100644
> > --- a/include/hw/i386/intel_iommu.h
> > +++ b/include/hw/i386/intel_iommu.h
> > @@ -109,7 +109,35 @@ struct VTDAddressSpace {
> >      QLIST_ENTRY(VTDAddressSpace) next;
> >      /* Superset of notifier flags that this address space has */
> >      IOMMUNotifierFlag notifier_flags;
> > -    IOVATree *iova_tree;          /* Traces mapped IOVA ranges */
> > +    /*
> > +     * @iova_tree traces mapped IOVA ranges.
> > +     *
> > +     * The tree is not needed if no MAP notifiers is registered with
> 
> s/no MAP notifiers/no MAP notifier

Will fix.

> > +     * current VTD address space, because all UNMAP (including iotlb or
> > +     * dev-iotlb) events can be transparently delivered to !MAP iommu
> > +     * notifiers.
> because all UNMAP notifications (iotlb or dev-iotlb) can be triggered
> directly, as opposed to MAP notifications. (?)

What I wanted to say is any PSI or DSI messages we got from the guest can
be transparently delivered to QEMU's iommu notifiers.  I'm not sure
"triggered directly" best describe the case here.

PSI: Page Selective Invalidations
DSI: Domain Selective Invalidations

Sorry to mention these terms again, but that's really what the "transparent
delivery" means here - we get the PSI/DSI messages, then we notify with the
same ranges in IOMMU notifiers.  They're not the same concept but we do
that transparently without changing the core of the messages.

Maybe I should spell out "!MAP" as "UNMAP-only"?  Would that help?

> > +     *
> > +     * The tree OTOH is required for MAP typed iommu notifiers for a few
> > +     * reasons.
> > +     *
> > +     * Firstly, there's no way to identify whether an PSI event is MAP or
> maybe give the decryption of the 'PSI' and 'DSI" acronyms once ;-)

Please see above. :)

These are VT-d terms used in multiple places in the .[ch] files, I assume
I'll just keep using them because otherwise I'll need to comment them
everytime we use any PSI/DSI terms.  It might become an overkill I'm afraid.

> > +     * UNMAP within the PSI message itself.  Without having prior knowledge
> > +     * of existing state vIOMMU doesn't know whether it should notify MAP
> > +     * or UNMAP for a PSI message it received.
> > +     *
> > +     * Secondly, PSI received from guest driver (or even a large PSI can
> > +     * grow into a DSI at least with Linux intel-iommu driver) can be
> > +     * larger in range than the newly mapped ranges for either MAP or UNMAP
> > +     * events. If it directly pass-throughs any such event it may confuse
> 
> If it directly notifies the registered device with the unmodified range, it may confuse the drivers ../..

Will fix.

> 
> So the range of the MAP notification can be adapted based on the existing IOVA mappings.  

Yes, e.g. the iova tree makes sure we don't map something again if it's mapped.

Thanks,

> 
> > +     * the registered drivers (e.g. vfio-pci) on either: (1) trying to map
> > +     * the same region more than once (for VFIO_IOMMU_MAP_DMA, -EEXIST will
> > +     * trigger), or (2) trying to UNMAP a range that is still partially
> > +     * mapped.  That accuracy is not required for UNMAP-only notifiers, but
> > +     * it is a must-to-have for MAP-inclusive notifiers, because the vIOMMU
> > +     * needs to make sure the shadow page table is always in sync with the
> > +     * guest IOMMU pgtables for a device.
> > +     */
> > +    IOVATree *iova_tree;
> >  };
> >  
> >  struct VTDIOTLBEntry {
> Thanks
> 
> Eric
> 

-- 
Peter Xu



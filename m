Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4B848D2E2
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 08:34:32 +0100 (CET)
Received: from localhost ([::1]:38734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ucw-0008Kx-Ns
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 02:34:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n7uLD-0000Fu-QH
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 02:16:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n7uLB-0003o9-7u
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 02:16:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642058168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QO/wnKxsAy5NC7TC31Td+Win1sOH5kFsLk+71WrUz1g=;
 b=TnBKFXZiwYR2lre7Avo3K+3X2CM36jSWT1SUGd8tMitKrvChyV/y67rmvxXCM6gL/B7ZLy
 ulZlIk4H28jLPZOOOVTYF8FnKi/wSIbaTFpMedW7ADYjRgJMY/jH/s3GPUZi1Mgnkxr5Z1
 2dWoc4ITDvb7spDztVPtdpYq6GJ053Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-2elSQkxHOZmdHAtxyALvoQ-1; Thu, 13 Jan 2022 02:16:07 -0500
X-MC-Unique: 2elSQkxHOZmdHAtxyALvoQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 i9-20020a05640242c900b003fe97faab62so4481863edc.9
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 23:16:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QO/wnKxsAy5NC7TC31Td+Win1sOH5kFsLk+71WrUz1g=;
 b=J9dOfNbNHtZ81pckdwh022WaZgNsvJz3Xf3kxMgjCXZpGDQ7Ux6UltcvD6AQAGtECH
 J1EA+stNuNbtSGOppRzn9Lkco8alDQRHOYurzhQVxhelcAVY/CDypSEDlTOZokh1Inyu
 RZoWupokLWO0K20xiVhe63LKcXdmq+mfHkk2QYohyJmmE1tuhisAdc1dW1BVL4lxb1FA
 K58kkeOlDyeXsLwdmROF5y1BOf96OAkxZthNSVRDGA59OPtg3y6NwDN3/cojHGLhLz4E
 8vkY9fSgPe8mIq9GB1Gx+QlqXFbsisUKIGM7hwaVgLyLS5KgfuAbSItMAb/QCFnFoedM
 2Tig==
X-Gm-Message-State: AOAM532HB1oNzE+DKIFVu6IF8a0UnGzuFXuuYd1TIb5yPdgK+oB+4jaa
 k7Lq/7N0RfG6HkBDGZ1ncfXmKhgVNewfVp900wjHCqoA4062y79ifC54e5bZ1bFEc05eanczDj7
 LUW1pA+nwZNkoons=
X-Received: by 2002:a17:907:7fa1:: with SMTP id
 qk33mr2579408ejc.95.1642058165977; 
 Wed, 12 Jan 2022 23:16:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwc6sGQkzMZUdOzzdDbdj6BrfZs7mk9UlT5jXdwQBMKPvmnmSbiQ1GaEOp5Zd59Fe3Pi9pxYw==
X-Received: by 2002:a17:907:7fa1:: with SMTP id
 qk33mr2579394ejc.95.1642058165765; 
 Wed, 12 Jan 2022 23:16:05 -0800 (PST)
Received: from redhat.com ([2.55.6.51])
 by smtp.gmail.com with ESMTPSA id j13sm762082edw.89.2022.01.12.23.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 23:16:05 -0800 (PST)
Date: Thu, 13 Jan 2022 02:16:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 3/3] intel-iommu: PASID support
Message-ID: <20220113021443-mutt-send-email-mst@kernel.org>
References: <20220105041945.13459-1-jasowang@redhat.com>
 <20220105041945.13459-5-jasowang@redhat.com>
 <Yd+zQRouwsB/jnV3@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <Yd+zQRouwsB/jnV3@xz-m1.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, yi.l.liu@intel.com,
 yi.y.sun@linux.intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 01:06:09PM +0800, Peter Xu wrote:
> On Wed, Jan 05, 2022 at 12:19:45PM +0800, Jason Wang wrote:
> > @@ -1725,11 +1780,16 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
> >          cc_entry->context_cache_gen = s->context_cache_gen;
> >      }
> >  
> > +    /* Try to fetch slpte form IOTLB */
> > +    if ((pasid == PCI_NO_PASID) && s->root_scalable) {
> > +        pasid = VTD_CE_GET_RID2PASID(&ce);
> > +    }
> > +
> >      /*
> >       * We don't need to translate for pass-through context entries.
> >       * Also, let's ignore IOTLB caching as well for PT devices.
> >       */
> > -    if (vtd_dev_pt_enabled(s, &ce)) {
> > +    if (vtd_dev_pt_enabled(s, &ce, pasid)) {
> >          entry->iova = addr & VTD_PAGE_MASK_4K;
> >          entry->translated_addr = entry->iova;
> >          entry->addr_mask = ~VTD_PAGE_MASK_4K;
> > @@ -1750,14 +1810,24 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
> >          return true;
> >      }
> >  
> > +    iotlb_entry = vtd_lookup_iotlb(s, source_id, addr, pasid);
> > +    if (iotlb_entry) {
> > +        trace_vtd_iotlb_page_hit(source_id, addr, iotlb_entry->slpte,
> > +                                 iotlb_entry->domain_id);
> > +        slpte = iotlb_entry->slpte;
> > +        access_flags = iotlb_entry->access_flags;
> > +        page_mask = iotlb_entry->mask;
> > +        goto out;
> > +    }
> 
> IIUC the iotlb lookup moved down just because the pasid==NO_PASID case then
> we'll need to fetch the default pasid from the context entry.  That looks
> reasonable.
> 
> It's just a bit of pity because logically it'll slow down iotlb hits due to
> context entry operations.  When NO_PASID we could have looked up iotlb without
> checking pasid at all, assuming that "default pasid" will always match.  But
> that is a little bit hacky.

Maybe that's not a bad idea for an optimization.


> vIOMMU seems to be mostly used for assigned devices and dpdk in production in
> the future due to its slowness otherwise.. so maybe not a big deal at all.
> 
> [...]
> 
> > @@ -2011,7 +2083,52 @@ static void vtd_iotlb_page_invalidate(IntelIOMMUState *s, uint16_t domain_id,
> >      vtd_iommu_lock(s);
> >      g_hash_table_foreach_remove(s->iotlb, vtd_hash_remove_by_page, &info);
> >      vtd_iommu_unlock(s);
> > -    vtd_iotlb_page_invalidate_notify(s, domain_id, addr, am);
> > +    vtd_iotlb_page_invalidate_notify(s, domain_id, addr, am, PCI_NO_PASID);
> > +}
> > +
> > +static void vtd_iotlb_page_pasid_invalidate(IntelIOMMUState *s,
> > +                                            uint16_t domain_id,
> > +                                            hwaddr addr, uint8_t am,
> > +                                            uint32_t pasid)
> > +{
> > +    VTDIOTLBPageInvInfo info;
> > +
> > +    trace_vtd_inv_desc_iotlb_pasid_pages(domain_id, addr, am, pasid);
> > +
> > +    assert(am <= VTD_MAMV);
> > +    info.domain_id = domain_id;
> > +    info.addr = addr;
> > +    info.mask = ~((1 << am) - 1);
> > +    info.pasid = pasid;
> > +    vtd_iommu_lock(s);
> > +    g_hash_table_foreach_remove(s->iotlb, vtd_hash_remove_by_page_pasid, &info);
> > +    vtd_iommu_unlock(s);
> > +    vtd_iotlb_page_invalidate_notify(s, domain_id, addr, am, pasid);
> 
> Hmm, I think indeed we need a notification, but it'll be unnecessary for
> e.g. vfio map notifiers, because this is 1st level invalidation and at least so
> far vfio map notifiers are rewalking only the 2nd level page table, so it'll be
> destined to be a no-op and pure overhead.
> 
> > +}
> > +
> > +static void vtd_iotlb_pasid_invalidate(IntelIOMMUState *s, uint16_t domain_id,
> > +                                       uint32_t pasid)
> > +{
> > +    VTDIOTLBPageInvInfo info;
> > +    VTDAddressSpace *vtd_as;
> > +    VTDContextEntry ce;
> > +
> > +    trace_vtd_inv_desc_iotlb_pasid(domain_id, pasid);
> > +
> > +    info.domain_id = domain_id;
> > +    info.pasid = pasid;
> > +    vtd_iommu_lock(s);
> > +    g_hash_table_foreach_remove(s->iotlb, vtd_hash_remove_by_pasid, &info);
> > +    vtd_iommu_unlock(s);
> > +
> > +    QLIST_FOREACH(vtd_as, &s->vtd_as_with_notifiers, next) {
> > +        if (!vtd_dev_to_context_entry(s, pci_bus_num(vtd_as->bus),
> > +                                      vtd_as->devfn, &ce) &&
> > +            domain_id == vtd_get_domain_id(s, &ce, vtd_as->pasid) &&
> > +            pasid == vtd_as->pasid) {
> > +            vtd_sync_shadow_page_table(vtd_as);
> 
> Do we need to rewalk the shadow pgtable (which is the 2nd level, afaict) even
> if we got the 1st level pgtable invalidated?
> 
> > +        }
> > +    }
> >  }
> 
> The rest looks mostly good to me; thanks.
> 
> -- 
> Peter Xu



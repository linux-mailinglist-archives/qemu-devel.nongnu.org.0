Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA6D48E2F7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 04:32:51 +0100 (CET)
Received: from localhost ([::1]:39018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8DKb-00004z-U3
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 22:32:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n8DJf-0007a1-FB
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 22:31:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n8DJb-0005Rs-Oc
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 22:31:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642131106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BsSI/u/UbwfmkRwXvWHXDKzv5lYquZu5vc0MNBuPO1I=;
 b=R4aAZx1XMYSylN1nwUAxYsLlGl3vtkwMw1D9pgdFYS4G7LBGfFgTfw5waHMnGI447TS0+S
 iN9Y3UYJYHhnMsagg+HIETAN4SwKxg+VJ/oVdpjQ9WSI2hM+xDikI9L1j5E6zzM57vuKAR
 zxoZVadk/9oy4UhyVxSRbbYnsuwdMxo=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-e7N-sp83Ng-T_nw2t3DuSA-1; Thu, 13 Jan 2022 22:31:45 -0500
X-MC-Unique: e7N-sp83Ng-T_nw2t3DuSA-1
Received: by mail-pg1-f199.google.com with SMTP id
 t1-20020a6564c1000000b002e7f31cf59fso1092387pgv.14
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 19:31:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BsSI/u/UbwfmkRwXvWHXDKzv5lYquZu5vc0MNBuPO1I=;
 b=ibhSjxV+Gz0UCSQ3lwhw/U86Tsw4SecZDUwXIfUbdEIzw23jr5oqSID7k3bw1CjQ5U
 C27+GbeRqfRVc2k3MZPeLdKDJXIvwdtv7RzidFmmZXY8jVNsGNbtCndkmA48TrAX5GNR
 f5/pbK+1NvrBvlIe3oRM6iPofOMgW/Lih0yzS0rcWn6BsZcXwAi7sGHfsun3Chmvyu5O
 n4YRvIXURKk/IESHhrx7idWGgl06FQBgTdWwfVAgnDPg1Of48YvFn+HhEU/N7JV2wMMr
 nyeA2zRw3SyFb7TWUBrd0hZWfwMkuOFBBzFwK2J4Or9WKg/ZyeF5c+sZlTFU+F/WEC62
 lGAA==
X-Gm-Message-State: AOAM533R7dhFljjnRJj7wIjt75e0jPzbzYt3XEb6V0IWaJSazEwsYul1
 fb92UwdDErfR/oh4YbYOj/CwZfnIDTqKKoKmKeE7PPGSh8BRq4+K8PK9ow5gOCpbvtKie1YgH9h
 MNVgX7ZSEBDR/uCQ=
X-Received: by 2002:a63:455f:: with SMTP id u31mr6428094pgk.537.1642131104319; 
 Thu, 13 Jan 2022 19:31:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEA3rlH8KNAL8bN5YF20G8zArkTJ6PYuDgYhc1Wphnyu+OMKpUAGrHykm7MhmguH5LCkjPUw==
X-Received: by 2002:a63:455f:: with SMTP id u31mr6428073pgk.537.1642131103923; 
 Thu, 13 Jan 2022 19:31:43 -0800 (PST)
Received: from xz-m1.local ([191.101.132.59])
 by smtp.gmail.com with ESMTPSA id y10sm9726210pjy.24.2022.01.13.19.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 19:31:43 -0800 (PST)
Date: Fri, 14 Jan 2022 11:31:38 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 3/3] intel-iommu: PASID support
Message-ID: <YeDumkj9ZgPKGgoN@xz-m1.local>
References: <20220105041945.13459-1-jasowang@redhat.com>
 <20220105041945.13459-5-jasowang@redhat.com>
 <Yd+zQRouwsB/jnV3@xz-m1.local>
 <8beffd3d-5eff-6462-ce23-faf44c6653f1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8beffd3d-5eff-6462-ce23-faf44c6653f1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Cc: yi.l.liu@intel.com, yi.y.sun@linux.intel.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 14, 2022 at 10:47:44AM +0800, Jason Wang wrote:
> 
> 在 2022/1/13 下午1:06, Peter Xu 写道:
> > On Wed, Jan 05, 2022 at 12:19:45PM +0800, Jason Wang wrote:
> > > @@ -1725,11 +1780,16 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
> > >           cc_entry->context_cache_gen = s->context_cache_gen;
> > >       }
> > > +    /* Try to fetch slpte form IOTLB */
> > > +    if ((pasid == PCI_NO_PASID) && s->root_scalable) {
> > > +        pasid = VTD_CE_GET_RID2PASID(&ce);
> > > +    }
> > > +
> > >       /*
> > >        * We don't need to translate for pass-through context entries.
> > >        * Also, let's ignore IOTLB caching as well for PT devices.
> > >        */
> > > -    if (vtd_dev_pt_enabled(s, &ce)) {
> > > +    if (vtd_dev_pt_enabled(s, &ce, pasid)) {
> > >           entry->iova = addr & VTD_PAGE_MASK_4K;
> > >           entry->translated_addr = entry->iova;
> > >           entry->addr_mask = ~VTD_PAGE_MASK_4K;
> > > @@ -1750,14 +1810,24 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
> > >           return true;
> > >       }
> > > +    iotlb_entry = vtd_lookup_iotlb(s, source_id, addr, pasid);
> > > +    if (iotlb_entry) {
> > > +        trace_vtd_iotlb_page_hit(source_id, addr, iotlb_entry->slpte,
> > > +                                 iotlb_entry->domain_id);
> > > +        slpte = iotlb_entry->slpte;
> > > +        access_flags = iotlb_entry->access_flags;
> > > +        page_mask = iotlb_entry->mask;
> > > +        goto out;
> > > +    }
> > IIUC the iotlb lookup moved down just because the pasid==NO_PASID case then
> > we'll need to fetch the default pasid from the context entry.  That looks
> > reasonable.
> > 
> > It's just a bit of pity because logically it'll slow down iotlb hits due to
> > context entry operations.  When NO_PASID we could have looked up iotlb without
> > checking pasid at all, assuming that "default pasid" will always match.  But
> > that is a little bit hacky.
> 
> 
> Right, but I think you meant to do this only when scalable mode is disabled.

Yes IMHO it will definitely suite for !scalable case since that's exactly what
we did before.  What I'm also wondering is even if scalable is enabled but no
"real" pasid is used, so if all the translations go through the default pasid
that stored in the device context entry, then maybe we can ignore checking it.
The latter is the "hacky" part mentioned above.

The other thing to mention is, if we postpone the iotlb lookup to be after
context entry, then logically we can have per-device iotlb, that means we can
replace IntelIOMMUState.iotlb with VTDAddressSpace.iotlb in the future, too,
which can also be more efficient.

Not sure whether Michael will have a preference, for me I think either way can
be done on top.

> 
> 
> > 
> > vIOMMU seems to be mostly used for assigned devices and dpdk in production in
> > the future due to its slowness otherwise.. so maybe not a big deal at all.
> > 
> > [...]
> > 
> > > @@ -2011,7 +2083,52 @@ static void vtd_iotlb_page_invalidate(IntelIOMMUState *s, uint16_t domain_id,
> > >       vtd_iommu_lock(s);
> > >       g_hash_table_foreach_remove(s->iotlb, vtd_hash_remove_by_page, &info);
> > >       vtd_iommu_unlock(s);
> > > -    vtd_iotlb_page_invalidate_notify(s, domain_id, addr, am);
> > > +    vtd_iotlb_page_invalidate_notify(s, domain_id, addr, am, PCI_NO_PASID);
> > > +}
> > > +
> > > +static void vtd_iotlb_page_pasid_invalidate(IntelIOMMUState *s,
> > > +                                            uint16_t domain_id,
> > > +                                            hwaddr addr, uint8_t am,
> > > +                                            uint32_t pasid)
> > > +{
> > > +    VTDIOTLBPageInvInfo info;
> > > +
> > > +    trace_vtd_inv_desc_iotlb_pasid_pages(domain_id, addr, am, pasid);
> > > +
> > > +    assert(am <= VTD_MAMV);
> > > +    info.domain_id = domain_id;
> > > +    info.addr = addr;
> > > +    info.mask = ~((1 << am) - 1);
> > > +    info.pasid = pasid;
> > > +    vtd_iommu_lock(s);
> > > +    g_hash_table_foreach_remove(s->iotlb, vtd_hash_remove_by_page_pasid, &info);
> > > +    vtd_iommu_unlock(s);
> > > +    vtd_iotlb_page_invalidate_notify(s, domain_id, addr, am, pasid);
> > Hmm, I think indeed we need a notification, but it'll be unnecessary for
> > e.g. vfio map notifiers, because this is 1st level invalidation and at least so
> > far vfio map notifiers are rewalking only the 2nd level page table, so it'll be
> > destined to be a no-op and pure overhead.
> 
> 
> Right, consider we don't implement l1 and we don't have a 1st level
> abstraction in neither vhost nor vfio, we can simply remove this.

We probably still need the real pasid invalidation parts in the future?  Either
for vhost (if vhost will going to cache pasid-based translations), or for
compatible assigned devices in the future where the HW can cache it.

I'm not sure what's the best way to do this, yet. Perhaps adding a new field to
vtd_iotlb_page_invalidate_notify() telling whether this is pasid-based or not
(basically, an invalidation for 1st or 2nd level pgtable)?  Then if it is
pasid-based, we could opt-out for the shadow page walking.

But as you mentioned we could also postpone it to the future.  Your call. :-)

Thanks,

> 
> 
> > 
> > > +}
> > > +
> > > +static void vtd_iotlb_pasid_invalidate(IntelIOMMUState *s, uint16_t domain_id,
> > > +                                       uint32_t pasid)
> > > +{
> > > +    VTDIOTLBPageInvInfo info;
> > > +    VTDAddressSpace *vtd_as;
> > > +    VTDContextEntry ce;
> > > +
> > > +    trace_vtd_inv_desc_iotlb_pasid(domain_id, pasid);
> > > +
> > > +    info.domain_id = domain_id;
> > > +    info.pasid = pasid;
> > > +    vtd_iommu_lock(s);
> > > +    g_hash_table_foreach_remove(s->iotlb, vtd_hash_remove_by_pasid, &info);
> > > +    vtd_iommu_unlock(s);
> > > +
> > > +    QLIST_FOREACH(vtd_as, &s->vtd_as_with_notifiers, next) {
> > > +        if (!vtd_dev_to_context_entry(s, pci_bus_num(vtd_as->bus),
> > > +                                      vtd_as->devfn, &ce) &&
> > > +            domain_id == vtd_get_domain_id(s, &ce, vtd_as->pasid) &&
> > > +            pasid == vtd_as->pasid) {
> > > +            vtd_sync_shadow_page_table(vtd_as);
> > Do we need to rewalk the shadow pgtable (which is the 2nd level, afaict) even
> > if we got the 1st level pgtable invalidated?
> 
> 
> Seems not and this makes me think to remove the whole PASID based
> invalidation logic since they are for L1 which is not implemented in this
> series.

-- 
Peter Xu



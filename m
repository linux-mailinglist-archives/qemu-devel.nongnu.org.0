Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B8F48E407
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 07:03:41 +0100 (CET)
Received: from localhost ([::1]:38904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8FgZ-0003FP-N8
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 01:03:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8FbY-0002Ll-LN
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 00:58:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8FbT-0000ND-HV
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 00:58:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642139901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39rNh/QFYGdlvI7QgzHZm01MaB69rTv4QN1Sx/9s4xw=;
 b=NRwZXqIr5fTNyvu6HdjHSAVJATq9M9D/GzLoW7EbyRE74bKtnBEXKRxbqprjMeym3ANXcq
 MOOvfN1+8vNKP4LwuQLWUDjOGdQXPaA2RBaBdpGxlXhRDZUbEP9owTgwfmWNVxDreXaXIe
 kVx9cZsYkJ0GbiOT1hTKJQu4HA5wUi0=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-1U_5pc5DNiCbzyUVe30IGg-1; Fri, 14 Jan 2022 00:58:20 -0500
X-MC-Unique: 1U_5pc5DNiCbzyUVe30IGg-1
Received: by mail-lf1-f72.google.com with SMTP id
 f19-20020ac251b3000000b0042ce8273990so5513684lfk.1
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 21:58:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=39rNh/QFYGdlvI7QgzHZm01MaB69rTv4QN1Sx/9s4xw=;
 b=a0eAuWorlV/Zjdo29szc5jQqHTEWgq03cJqOOiEbaNuIoDKpyxfOk5f6rRNWSqzbsK
 77iQUK7NZT23jg3Zp8PH1pD5OQpHyhiqPYv81TvYhfqv5LDMtlh8xtYs+KyCHG83rDNK
 NiMxDYugVKugJpDesLrgERHCeOX4inzhxLxUyu4AhP0rWKH7DwUCMNvdvUAhudOjWpe6
 OwObtJVQFxeTTdw640X6mCbJGOfDMPefv0SrD3c7xknmSd+noQkL/RP6mZgUZdBOtZIQ
 qO/5T1vkW1/XFRHQSjWOdQ9EiG+pcB0hopK+7MmeDxwo5aviK5A2rWa3AYb8BYejTiVb
 Wh4Q==
X-Gm-Message-State: AOAM532ehxVI/AGEhjWBDFQE/wjd8kGBSjkRKn11PFLDx6FqJd8pugwU
 GFsHCRZtk3O3Suak6YFRwPhO4xndRTuIq/SeG8kh2vYX7PBDSgwWEF1Fi8FX0/g6RuFYo26xmin
 0o7HFkAySM695AprmBndfjK/Mdg/IwXQ=
X-Received: by 2002:a19:760f:: with SMTP id c15mr5640749lff.498.1642139898881; 
 Thu, 13 Jan 2022 21:58:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvhR/J9rRLv3G9EZmvUMpxpKNr9Tvl4GczJBQjYyRy/urFq4uFqEearGa/0GRtuZRPATY/wxYq6e/APEj2cxs=
X-Received: by 2002:a19:760f:: with SMTP id c15mr5640734lff.498.1642139898555; 
 Thu, 13 Jan 2022 21:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20220105041945.13459-1-jasowang@redhat.com>
 <20220105041945.13459-5-jasowang@redhat.com>
 <Yd+zQRouwsB/jnV3@xz-m1.local>
 <8beffd3d-5eff-6462-ce23-faf44c6653f1@redhat.com>
 <YeDumkj9ZgPKGgoN@xz-m1.local>
In-Reply-To: <YeDumkj9ZgPKGgoN@xz-m1.local>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 14 Jan 2022 13:58:07 +0800
Message-ID: <CACGkMEun7WEhXy_ApxfgYmbVofjjKgGuA0ezPZG4ypRK+HtSfA@mail.gmail.com>
Subject: Re: [PATCH 3/3] intel-iommu: PASID support
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, yi.y.sun@linux.intel.com,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 14, 2022 at 11:31 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Jan 14, 2022 at 10:47:44AM +0800, Jason Wang wrote:
> >
> > =E5=9C=A8 2022/1/13 =E4=B8=8B=E5=8D=881:06, Peter Xu =E5=86=99=E9=81=93=
:
> > > On Wed, Jan 05, 2022 at 12:19:45PM +0800, Jason Wang wrote:
> > > > @@ -1725,11 +1780,16 @@ static bool vtd_do_iommu_translate(VTDAddre=
ssSpace *vtd_as, PCIBus *bus,
> > > >           cc_entry->context_cache_gen =3D s->context_cache_gen;
> > > >       }
> > > > +    /* Try to fetch slpte form IOTLB */
> > > > +    if ((pasid =3D=3D PCI_NO_PASID) && s->root_scalable) {
> > > > +        pasid =3D VTD_CE_GET_RID2PASID(&ce);
> > > > +    }
> > > > +
> > > >       /*
> > > >        * We don't need to translate for pass-through context entrie=
s.
> > > >        * Also, let's ignore IOTLB caching as well for PT devices.
> > > >        */
> > > > -    if (vtd_dev_pt_enabled(s, &ce)) {
> > > > +    if (vtd_dev_pt_enabled(s, &ce, pasid)) {
> > > >           entry->iova =3D addr & VTD_PAGE_MASK_4K;
> > > >           entry->translated_addr =3D entry->iova;
> > > >           entry->addr_mask =3D ~VTD_PAGE_MASK_4K;
> > > > @@ -1750,14 +1810,24 @@ static bool vtd_do_iommu_translate(VTDAddre=
ssSpace *vtd_as, PCIBus *bus,
> > > >           return true;
> > > >       }
> > > > +    iotlb_entry =3D vtd_lookup_iotlb(s, source_id, addr, pasid);
> > > > +    if (iotlb_entry) {
> > > > +        trace_vtd_iotlb_page_hit(source_id, addr, iotlb_entry->slp=
te,
> > > > +                                 iotlb_entry->domain_id);
> > > > +        slpte =3D iotlb_entry->slpte;
> > > > +        access_flags =3D iotlb_entry->access_flags;
> > > > +        page_mask =3D iotlb_entry->mask;
> > > > +        goto out;
> > > > +    }
> > > IIUC the iotlb lookup moved down just because the pasid=3D=3DNO_PASID=
 case then
> > > we'll need to fetch the default pasid from the context entry.  That l=
ooks
> > > reasonable.
> > >
> > > It's just a bit of pity because logically it'll slow down iotlb hits =
due to
> > > context entry operations.  When NO_PASID we could have looked up iotl=
b without
> > > checking pasid at all, assuming that "default pasid" will always matc=
h.  But
> > > that is a little bit hacky.
> >
> >
> > Right, but I think you meant to do this only when scalable mode is disa=
bled.
>
> Yes IMHO it will definitely suite for !scalable case since that's exactly=
 what
> we did before.  What I'm also wondering is even if scalable is enabled bu=
t no
> "real" pasid is used, so if all the translations go through the default p=
asid
> that stored in the device context entry, then maybe we can ignore checkin=
g it.
> The latter is the "hacky" part mentioned above.

The problem I see is that we can't know what PASID is used as default
without reading the context entry?

>
> The other thing to mention is, if we postpone the iotlb lookup to be afte=
r
> context entry, then logically we can have per-device iotlb, that means we=
 can
> replace IntelIOMMUState.iotlb with VTDAddressSpace.iotlb in the future, t=
oo,
> which can also be more efficient.

Right but we still need to limit the total slots and ATS is a better
way to deal with the IOTLB bottleneck actually.

>
> Not sure whether Michael will have a preference, for me I think either wa=
y can
> be done on top.
>
> >
> >
> > >
> > > vIOMMU seems to be mostly used for assigned devices and dpdk in produ=
ction in
> > > the future due to its slowness otherwise.. so maybe not a big deal at=
 all.
> > >
> > > [...]
> > >
> > > > @@ -2011,7 +2083,52 @@ static void vtd_iotlb_page_invalidate(IntelI=
OMMUState *s, uint16_t domain_id,
> > > >       vtd_iommu_lock(s);
> > > >       g_hash_table_foreach_remove(s->iotlb, vtd_hash_remove_by_page=
, &info);
> > > >       vtd_iommu_unlock(s);
> > > > -    vtd_iotlb_page_invalidate_notify(s, domain_id, addr, am);
> > > > +    vtd_iotlb_page_invalidate_notify(s, domain_id, addr, am, PCI_N=
O_PASID);
> > > > +}
> > > > +
> > > > +static void vtd_iotlb_page_pasid_invalidate(IntelIOMMUState *s,
> > > > +                                            uint16_t domain_id,
> > > > +                                            hwaddr addr, uint8_t a=
m,
> > > > +                                            uint32_t pasid)
> > > > +{
> > > > +    VTDIOTLBPageInvInfo info;
> > > > +
> > > > +    trace_vtd_inv_desc_iotlb_pasid_pages(domain_id, addr, am, pasi=
d);
> > > > +
> > > > +    assert(am <=3D VTD_MAMV);
> > > > +    info.domain_id =3D domain_id;
> > > > +    info.addr =3D addr;
> > > > +    info.mask =3D ~((1 << am) - 1);
> > > > +    info.pasid =3D pasid;
> > > > +    vtd_iommu_lock(s);
> > > > +    g_hash_table_foreach_remove(s->iotlb, vtd_hash_remove_by_page_=
pasid, &info);
> > > > +    vtd_iommu_unlock(s);
> > > > +    vtd_iotlb_page_invalidate_notify(s, domain_id, addr, am, pasid=
);
> > > Hmm, I think indeed we need a notification, but it'll be unnecessary =
for
> > > e.g. vfio map notifiers, because this is 1st level invalidation and a=
t least so
> > > far vfio map notifiers are rewalking only the 2nd level page table, s=
o it'll be
> > > destined to be a no-op and pure overhead.
> >
> >
> > Right, consider we don't implement l1 and we don't have a 1st level
> > abstraction in neither vhost nor vfio, we can simply remove this.
>
> We probably still need the real pasid invalidation parts in the future?

Yes.

>  Either
> for vhost (if vhost will going to cache pasid-based translations), or for
> compatible assigned devices in the future where the HW can cache it.

Vhost has the plan to support ASID here:

https://patchwork.kernel.org/project/kvm/patch/20201216064818.48239-11-jaso=
wang@redhat.com/#23866593

>
> I'm not sure what's the best way to do this, yet. Perhaps adding a new fi=
eld to
> vtd_iotlb_page_invalidate_notify() telling whether this is pasid-based or=
 not
> (basically, an invalidation for 1st or 2nd level pgtable)?

AFAIK there's no L1 in the abstraction for device IOTLB but a combined
translation result from IVOA-GPA

>  Then if it is
> pasid-based, we could opt-out for the shadow page walking.
>
> But as you mentioned we could also postpone it to the future.  Your call.=
 :-)

Right, I tend to defer it otherwise there seems no way to test this.

Thanks

>
> Thanks,
>
> >
> >
> > >
> > > > +}
> > > > +
> > > > +static void vtd_iotlb_pasid_invalidate(IntelIOMMUState *s, uint16_=
t domain_id,
> > > > +                                       uint32_t pasid)
> > > > +{
> > > > +    VTDIOTLBPageInvInfo info;
> > > > +    VTDAddressSpace *vtd_as;
> > > > +    VTDContextEntry ce;
> > > > +
> > > > +    trace_vtd_inv_desc_iotlb_pasid(domain_id, pasid);
> > > > +
> > > > +    info.domain_id =3D domain_id;
> > > > +    info.pasid =3D pasid;
> > > > +    vtd_iommu_lock(s);
> > > > +    g_hash_table_foreach_remove(s->iotlb, vtd_hash_remove_by_pasid=
, &info);
> > > > +    vtd_iommu_unlock(s);
> > > > +
> > > > +    QLIST_FOREACH(vtd_as, &s->vtd_as_with_notifiers, next) {
> > > > +        if (!vtd_dev_to_context_entry(s, pci_bus_num(vtd_as->bus),
> > > > +                                      vtd_as->devfn, &ce) &&
> > > > +            domain_id =3D=3D vtd_get_domain_id(s, &ce, vtd_as->pas=
id) &&
> > > > +            pasid =3D=3D vtd_as->pasid) {
> > > > +            vtd_sync_shadow_page_table(vtd_as);
> > > Do we need to rewalk the shadow pgtable (which is the 2nd level, afai=
ct) even
> > > if we got the 1st level pgtable invalidated?
> >
> >
> > Seems not and this makes me think to remove the whole PASID based
> > invalidation logic since they are for L1 which is not implemented in th=
is
> > series.
>
> --
> Peter Xu
>



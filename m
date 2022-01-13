Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D205748D1C7
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 06:09:04 +0100 (CET)
Received: from localhost ([::1]:56782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7sMB-0000kN-FU
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 00:09:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7sJa-00082o-Rd
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 00:06:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7sJX-0002uL-0s
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 00:06:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642050377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LEjdHbNRglNwXo8pv5Ok6V5nkA6GY8KTHUAlMw4/YQg=;
 b=DHntQkpZ8n8YxS5W/eR1ZRhM4xsUj8r2epbrj/EYNcI3hxF8t7P0el+C128Fl9Oy54vO9O
 3JYgaNAaUUR+sPyTn3AcV5HWaSuYYnjI4Wgvj2uAKbDFF+4NIKO81veQ/o6OusTNYox8Og
 A/OWjdZjh2nHhPPYW9z9hMKmB/0LsTM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-bfDJF-QpNOaU7d0jjOCORA-1; Thu, 13 Jan 2022 00:06:16 -0500
X-MC-Unique: bfDJF-QpNOaU7d0jjOCORA-1
Received: by mail-pj1-f69.google.com with SMTP id
 t4-20020a17090a024400b001b40271cc87so4547446pje.2
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 21:06:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LEjdHbNRglNwXo8pv5Ok6V5nkA6GY8KTHUAlMw4/YQg=;
 b=eoluRFXbc1DAy2KSkjZEJKbB8bxAZI40DZ6p1fy3BavVrHX1xwp5Ho6hX2c90vHMiA
 7KVOfuBFgsfpldkq1Kp6sj2JZ6dHYgSqNj7mN9GhDdH93dh/Imo5vSizev2xzBzmDeHG
 Cbb/0UDPOeBQrTsYxfixg94ozdiG2PCkWRhhipAvAH3E36SI5ASzShB3lLvNl9BfRfKq
 LicL2SanHC3S67sPI5XFw4Y4wQqNxRdlQln8Jsh1O07FWsEqA0135XKse6oMmpjOFmIF
 0ImNtHnl7go1ny0BfzQBga08bPK5IpPRvn59Bi5ljcGT4nwXnF7kauML0DSDA2C44sUO
 /f9Q==
X-Gm-Message-State: AOAM533vc492oglB3G8w0ezH+h7gw4ycPNod3G6dkIVTfHSBHvWHAEQw
 J40zE0qjkVJ35q2n/c4JoZsIOCcTK6TroXh1udWkbaSGMIFW3kUCnbqAR7v8sMaAc549QW8zOsa
 +KZVfFp9Z7BdW2nU=
X-Received: by 2002:a17:903:31c8:b0:149:a463:ad38 with SMTP id
 v8-20020a17090331c800b00149a463ad38mr3122347ple.76.1642050374985; 
 Wed, 12 Jan 2022 21:06:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyywdn1vbe7X2f5PnN1ycZrkH5+2G/xwD+vqYmjtzk8DjO5SBG3uaQGpvOR5xCS1hJvvKvPVA==
X-Received: by 2002:a17:903:31c8:b0:149:a463:ad38 with SMTP id
 v8-20020a17090331c800b00149a463ad38mr3122321ple.76.1642050374660; 
 Wed, 12 Jan 2022 21:06:14 -0800 (PST)
Received: from xz-m1.local ([191.101.132.233])
 by smtp.gmail.com with ESMTPSA id w65sm1181243pfd.41.2022.01.12.21.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 21:06:14 -0800 (PST)
Date: Thu, 13 Jan 2022 13:06:09 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 3/3] intel-iommu: PASID support
Message-ID: <Yd+zQRouwsB/jnV3@xz-m1.local>
References: <20220105041945.13459-1-jasowang@redhat.com>
 <20220105041945.13459-5-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220105041945.13459-5-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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

On Wed, Jan 05, 2022 at 12:19:45PM +0800, Jason Wang wrote:
> @@ -1725,11 +1780,16 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
>          cc_entry->context_cache_gen = s->context_cache_gen;
>      }
>  
> +    /* Try to fetch slpte form IOTLB */
> +    if ((pasid == PCI_NO_PASID) && s->root_scalable) {
> +        pasid = VTD_CE_GET_RID2PASID(&ce);
> +    }
> +
>      /*
>       * We don't need to translate for pass-through context entries.
>       * Also, let's ignore IOTLB caching as well for PT devices.
>       */
> -    if (vtd_dev_pt_enabled(s, &ce)) {
> +    if (vtd_dev_pt_enabled(s, &ce, pasid)) {
>          entry->iova = addr & VTD_PAGE_MASK_4K;
>          entry->translated_addr = entry->iova;
>          entry->addr_mask = ~VTD_PAGE_MASK_4K;
> @@ -1750,14 +1810,24 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
>          return true;
>      }
>  
> +    iotlb_entry = vtd_lookup_iotlb(s, source_id, addr, pasid);
> +    if (iotlb_entry) {
> +        trace_vtd_iotlb_page_hit(source_id, addr, iotlb_entry->slpte,
> +                                 iotlb_entry->domain_id);
> +        slpte = iotlb_entry->slpte;
> +        access_flags = iotlb_entry->access_flags;
> +        page_mask = iotlb_entry->mask;
> +        goto out;
> +    }

IIUC the iotlb lookup moved down just because the pasid==NO_PASID case then
we'll need to fetch the default pasid from the context entry.  That looks
reasonable.

It's just a bit of pity because logically it'll slow down iotlb hits due to
context entry operations.  When NO_PASID we could have looked up iotlb without
checking pasid at all, assuming that "default pasid" will always match.  But
that is a little bit hacky.

vIOMMU seems to be mostly used for assigned devices and dpdk in production in
the future due to its slowness otherwise.. so maybe not a big deal at all.

[...]

> @@ -2011,7 +2083,52 @@ static void vtd_iotlb_page_invalidate(IntelIOMMUState *s, uint16_t domain_id,
>      vtd_iommu_lock(s);
>      g_hash_table_foreach_remove(s->iotlb, vtd_hash_remove_by_page, &info);
>      vtd_iommu_unlock(s);
> -    vtd_iotlb_page_invalidate_notify(s, domain_id, addr, am);
> +    vtd_iotlb_page_invalidate_notify(s, domain_id, addr, am, PCI_NO_PASID);
> +}
> +
> +static void vtd_iotlb_page_pasid_invalidate(IntelIOMMUState *s,
> +                                            uint16_t domain_id,
> +                                            hwaddr addr, uint8_t am,
> +                                            uint32_t pasid)
> +{
> +    VTDIOTLBPageInvInfo info;
> +
> +    trace_vtd_inv_desc_iotlb_pasid_pages(domain_id, addr, am, pasid);
> +
> +    assert(am <= VTD_MAMV);
> +    info.domain_id = domain_id;
> +    info.addr = addr;
> +    info.mask = ~((1 << am) - 1);
> +    info.pasid = pasid;
> +    vtd_iommu_lock(s);
> +    g_hash_table_foreach_remove(s->iotlb, vtd_hash_remove_by_page_pasid, &info);
> +    vtd_iommu_unlock(s);
> +    vtd_iotlb_page_invalidate_notify(s, domain_id, addr, am, pasid);

Hmm, I think indeed we need a notification, but it'll be unnecessary for
e.g. vfio map notifiers, because this is 1st level invalidation and at least so
far vfio map notifiers are rewalking only the 2nd level page table, so it'll be
destined to be a no-op and pure overhead.

> +}
> +
> +static void vtd_iotlb_pasid_invalidate(IntelIOMMUState *s, uint16_t domain_id,
> +                                       uint32_t pasid)
> +{
> +    VTDIOTLBPageInvInfo info;
> +    VTDAddressSpace *vtd_as;
> +    VTDContextEntry ce;
> +
> +    trace_vtd_inv_desc_iotlb_pasid(domain_id, pasid);
> +
> +    info.domain_id = domain_id;
> +    info.pasid = pasid;
> +    vtd_iommu_lock(s);
> +    g_hash_table_foreach_remove(s->iotlb, vtd_hash_remove_by_pasid, &info);
> +    vtd_iommu_unlock(s);
> +
> +    QLIST_FOREACH(vtd_as, &s->vtd_as_with_notifiers, next) {
> +        if (!vtd_dev_to_context_entry(s, pci_bus_num(vtd_as->bus),
> +                                      vtd_as->devfn, &ce) &&
> +            domain_id == vtd_get_domain_id(s, &ce, vtd_as->pasid) &&
> +            pasid == vtd_as->pasid) {
> +            vtd_sync_shadow_page_table(vtd_as);

Do we need to rewalk the shadow pgtable (which is the 2nd level, afaict) even
if we got the 1st level pgtable invalidated?

> +        }
> +    }
>  }

The rest looks mostly good to me; thanks.

-- 
Peter Xu



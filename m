Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D8245B763
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 10:25:26 +0100 (CET)
Received: from localhost ([::1]:40140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpoWr-0002bR-A9
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 04:25:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mpoV9-00018W-0G
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:23:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mpoV1-0004i3-4F
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:23:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637745809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c8TYxznOzbnJXlD0WmUiFgP9e1uj1Fz4AH4UgFxAb3Q=;
 b=ADEkfluqqpKVKE6mckkLpP2fGFM9Oh0UiK6hMg5K7oBnZhEpCsEfMnimihtT0vVWTtpSy7
 3hyHG5u1exKNgMzYS9FvUBJfBxtOebNXe0C6H7y7/H2tX5S2Bfm7cWOT54Mnel8aIUKvb6
 4ruSDNLC1qJsVvzLvwMxwDZxM20mxqE=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-kZk1wT41P2KWEnZcN8LYcA-1; Wed, 24 Nov 2021 04:23:28 -0500
X-MC-Unique: kZk1wT41P2KWEnZcN8LYcA-1
Received: by mail-pj1-f71.google.com with SMTP id
 p12-20020a17090b010c00b001a65bfe8054so1304177pjz.8
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:23:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c8TYxznOzbnJXlD0WmUiFgP9e1uj1Fz4AH4UgFxAb3Q=;
 b=WVvpu9Q4A4Ib9zGy1agyP/QlPDNbly1yrR4C/5djahm2FnoZnrCfNM2PitJdxhCZ1F
 toPTWW3Euxb+lwlV/6TcKjOjlThRCtSYOiWUx9pz1cLyFu1GqhO0xdkHlpq54NNApRO/
 iayFDF06h1PBeYG260YO4tIJE3oZ5JS1kS2czusxbyfAtgFuAQqU1oUsnrnuQ1ksvbyg
 NdYslam35CJlHG5Kja0gUcaHczXnemH+v6bSXrzIF9aRxSN1nj6unThGKbRPSNaMyBWo
 sNkR3mOkO/aMw4ps8gcPXYzf2KIMQVRtAP9r/5me9DaTE7CJQ92fr4OytdCLZLiUypSl
 eExA==
X-Gm-Message-State: AOAM533rxu82iNXuvWnzR9aDiWhZnHUhXhl6w/Pwu77ol6ps+iro/p1T
 mCOphFTemjfUHcmdHuIGnWaS6yzGeS6lml9KzY0j6rKxPAXJZDAZtcy5EOq3Y4uomVYznYSSWoy
 9lX/6pG0LK7X+0P8=
X-Received: by 2002:aa7:98dd:0:b0:49f:bab8:3b67 with SMTP id
 e29-20020aa798dd000000b0049fbab83b67mr4606895pfm.86.1637745807643; 
 Wed, 24 Nov 2021 01:23:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyymJs9T/RmXQW4CMv39ykl2KxhONiEZYALUbsbCylii/hZrLaITY7uj8ZJni+xK54MQyGbAQ==
X-Received: by 2002:aa7:98dd:0:b0:49f:bab8:3b67 with SMTP id
 e29-20020aa798dd000000b0049fbab83b67mr4606871pfm.86.1637745807352; 
 Wed, 24 Nov 2021 01:23:27 -0800 (PST)
Received: from xz-m1.local ([94.177.118.150])
 by smtp.gmail.com with ESMTPSA id j1sm13081397pfe.158.2021.11.24.01.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 01:23:26 -0800 (PST)
Date: Wed, 24 Nov 2021 17:23:22 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] intel-iommu: ignore SNP bit in scalable mode
Message-ID: <YZ4EioUDRAygL61n@xz-m1.local>
References: <20211124060309.6872-1-jasowang@redhat.com>
 <YZ3wXo5XueDtuk8c@xz-m1.local>
 <CACGkMEvLAThn7VFtB2xeaP+bzPtnVwj0Orzpt=nK5Bg2h6QZow@mail.gmail.com>
 <YZ39USAfW7i1oAOO@xz-m1.local>
 <CACGkMEsohbTvbFhMaZ_aAHpyJdbB4xcp6zRzaVYZXAZzCN7Vyw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsohbTvbFhMaZ_aAHpyJdbB4xcp6zRzaVYZXAZzCN7Vyw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, Nov 24, 2021 at 05:01:42PM +0800, Jason Wang wrote:
> > > > > -static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
> > > > > +static bool vtd_slpte_nonzero_rsvd(IntelIOMMUState *s,
> > > > > +                                   uint64_t slpte, uint32_t level)
> > > > >  {
> > > > >      uint64_t rsvd_mask = vtd_spte_rsvd[level];
> > > > >
> > > > > @@ -979,6 +980,10 @@ static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
> > > > >          rsvd_mask = vtd_spte_rsvd_large[level];
> > > > >      }
> > > > >
> > > > > +    if (s->scalable_mode) {
> > > > > +        rsvd_mask &= ~VTD_SPTE_SNP;
> > > > > +    }
> > > >
> > > > IMHO what we want to do is only to skip the leaves of pgtables on SNP, so maybe
> > > > we still want to keep checking the bit 11 reserved for e.g. common pgtable dir
> > > > entries?
> 
> Maybe, but it's probably a question that can only be answered by
> Intel. I can change it for the next version if you stick.

I'm reading vtd spec v3.1 (June 2019) here, and chap 9.8 told me they're
reserved bits for pgdir entries, as no SNP bit defined on pgdir entries.

> 
> > > >
> > > > To do so, how about directly modifying the vtd_spte_rsvd* fields in vtd_init()?
> > > > I think we only need to modify 4k/2m/1g entries to mask bit 11, they're:
> > > >
> > > >   - vtd_spte_rsvd[1] (4K)
> > > >   - vtd_spte_rsvd_large[2] (2M)
> > > >   - vtd_spte_rsvd_large[3] (1G)
> > > >
> > > > What do you think?  Then we avoid passing IntelIOMMUState* all over too.
> 
> I started a version like that:), it should work, I will change that if
> it was agreed by everyone.
> 
> The reason that I changed to pass IntelIOMMUState is that it results
> in a smaller changeset. The reason is that I tend to introduce new
> rsvd bits for SM mode since after checking vtd 3.3 it looks have
> different reserved bit requirement than before (at least 1.2)

Oh I thought changing vtd_spte_rsvd* should have smaller changeset instead,
hmm? :)

IMHO it'll be:

  if (s->scalable_mode) {
        vtd_spte_rsvd[1] &= ~BIT(11);
        vtd_spte_rsvd_large[2] &= ~BIT(11);
        vtd_spte_rsvd_large[3] &= ~BIT(11);
  }

Would that work?  Thanks,

-- 
Peter Xu



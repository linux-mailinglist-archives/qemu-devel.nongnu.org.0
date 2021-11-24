Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEA145B848
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:21:52 +0100 (CET)
Received: from localhost ([::1]:35784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppPT-0001oJ-Ts
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:21:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mppEk-0007v3-Q5
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:10:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mppEi-0008DI-M4
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637748643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6uaV058A/3nFTVdy+m4NlmlmSk1Th2PxgaszTRyUZEE=;
 b=PxV7vBGQ9W87RmukgwPQ29TpYnC0O1PGXhLWQ6ohHzo53w3jHtwn4B9n72LlAwMJbImYLL
 mXPsAwoQrVwZyeBvLtSQBENKGJ3USilh0NvHxcqGZbQYPi8MeKzy19ob+M8PFu/+aPYz+i
 nUHSGAxFwTEIoMZOv3tF6l6dyh4VR4Q=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-g4FRjrTzO3K_SISkEFRjjQ-1; Wed, 24 Nov 2021 05:10:40 -0500
X-MC-Unique: g4FRjrTzO3K_SISkEFRjjQ-1
Received: by mail-pg1-f200.google.com with SMTP id
 s8-20020a63af48000000b002e6c10ac245so560289pgo.21
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 02:10:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6uaV058A/3nFTVdy+m4NlmlmSk1Th2PxgaszTRyUZEE=;
 b=j9HFknKLnXi0nmYA9yTUsdnQ9Lsb3sfOtbXfCcTiIDmnY9smJzGPkuisEB1xP1OUWh
 OGE1vMVJ+NzNmhivvUUAfaphXEBCdHQBVbngGrpylCET9QLv7tSctlZCRUsJ6qfru1Ch
 nzG0CVkpLhDNQK3QXAEPQzDPAAfljTep4ZMvfpevzZinKbuHDJCn78nab+MByR4FO/1v
 HXy3ccZ+D7wk4DDS22AXZoL6DOUXkf7/d/e18Ch62qttpt7d0dQLzNNfUFPuCmTnYLat
 +5XlblDQHJmhaWEo43dWGlEyJtqUkUk6DF0sDBLZ1vZopoPGFzEI73pim7OdXIQHg6Lg
 2QjQ==
X-Gm-Message-State: AOAM530+ZTesRtPjyCSLl2df90YPn7w9DejMlT+ZBtmN1wFiOgIk63Ud
 UqQQk77m/nlp0Vig1HnvleAz+hTH20zk9VuIOemtzSM4iHThFZufBAWrwmRVhEyW+4CarJu+RZc
 BfG6rnnsfmH029aw=
X-Received: by 2002:a62:7cc5:0:b0:4a3:239f:d58a with SMTP id
 x188-20020a627cc5000000b004a3239fd58amr4590197pfc.85.1637748639277; 
 Wed, 24 Nov 2021 02:10:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8hPrpsID7czY+5rEzmTTsIvCzs3kwq75XLwyZmRGTGwqA/eF5QMyxXt5tpb4Ac5RmERDudw==
X-Received: by 2002:a62:7cc5:0:b0:4a3:239f:d58a with SMTP id
 x188-20020a627cc5000000b004a3239fd58amr4590158pfc.85.1637748638949; 
 Wed, 24 Nov 2021 02:10:38 -0800 (PST)
Received: from xz-m1.local ([94.177.118.150])
 by smtp.gmail.com with ESMTPSA id bt2sm4111800pjb.33.2021.11.24.02.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 02:10:38 -0800 (PST)
Date: Wed, 24 Nov 2021 18:10:33 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] intel-iommu: ignore SNP bit in scalable mode
Message-ID: <YZ4Pmf/dKkGirW95@xz-m1.local>
References: <20211124060309.6872-1-jasowang@redhat.com>
 <YZ3wXo5XueDtuk8c@xz-m1.local>
 <CACGkMEvLAThn7VFtB2xeaP+bzPtnVwj0Orzpt=nK5Bg2h6QZow@mail.gmail.com>
 <YZ39USAfW7i1oAOO@xz-m1.local>
 <CACGkMEsohbTvbFhMaZ_aAHpyJdbB4xcp6zRzaVYZXAZzCN7Vyw@mail.gmail.com>
 <YZ4EioUDRAygL61n@xz-m1.local>
 <CACGkMEvDjMA87yRxW1dNcA-L7RtrvcqtTqn3sCOF7Yudd=YWpg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEvDjMA87yRxW1dNcA-L7RtrvcqtTqn3sCOF7Yudd=YWpg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, yi.y.sun@linux.intel.com,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 05:35:18PM +0800, Jason Wang wrote:
> On Wed, Nov 24, 2021 at 5:23 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Wed, Nov 24, 2021 at 05:01:42PM +0800, Jason Wang wrote:
> > > > > > > -static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
> > > > > > > +static bool vtd_slpte_nonzero_rsvd(IntelIOMMUState *s,
> > > > > > > +                                   uint64_t slpte, uint32_t level)
> > > > > > >  {
> > > > > > >      uint64_t rsvd_mask = vtd_spte_rsvd[level];
> > > > > > >
> > > > > > > @@ -979,6 +980,10 @@ static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
> > > > > > >          rsvd_mask = vtd_spte_rsvd_large[level];
> > > > > > >      }
> > > > > > >
> > > > > > > +    if (s->scalable_mode) {
> > > > > > > +        rsvd_mask &= ~VTD_SPTE_SNP;
> > > > > > > +    }
> > > > > >
> > > > > > IMHO what we want to do is only to skip the leaves of pgtables on SNP, so maybe
> > > > > > we still want to keep checking the bit 11 reserved for e.g. common pgtable dir
> > > > > > entries?
> > >
> > > Maybe, but it's probably a question that can only be answered by
> > > Intel. I can change it for the next version if you stick.
> >
> > I'm reading vtd spec v3.1 (June 2019) here, and chap 9.8 told me they're
> > reserved bits for pgdir entries, as no SNP bit defined on pgdir entries.
> 
> Yes, you're right.
> 
> >
> > >
> > > > > >
> > > > > > To do so, how about directly modifying the vtd_spte_rsvd* fields in vtd_init()?
> > > > > > I think we only need to modify 4k/2m/1g entries to mask bit 11, they're:
> > > > > >
> > > > > >   - vtd_spte_rsvd[1] (4K)
> > > > > >   - vtd_spte_rsvd_large[2] (2M)
> > > > > >   - vtd_spte_rsvd_large[3] (1G)
> > > > > >
> > > > > > What do you think?  Then we avoid passing IntelIOMMUState* all over too.
> > >
> > > I started a version like that:), it should work, I will change that if
> > > it was agreed by everyone.
> > >
> > > The reason that I changed to pass IntelIOMMUState is that it results
> > > in a smaller changeset. The reason is that I tend to introduce new
> > > rsvd bits for SM mode since after checking vtd 3.3 it looks have
> > > different reserved bit requirement than before (at least 1.2)
> >
> > Oh I thought changing vtd_spte_rsvd* should have smaller changeset instead,
> > hmm? :)
> >
> > IMHO it'll be:
> >
> >   if (s->scalable_mode) {
> >         vtd_spte_rsvd[1] &= ~BIT(11);
> >         vtd_spte_rsvd_large[2] &= ~BIT(11);
> >         vtd_spte_rsvd_large[3] &= ~BIT(11);
> >   }
> >
> > Would that work?  Thanks,
> 
> Works for sure, if we just want to fix the SNP bit.
> 
> (I actually have a version like this as well). I can go this way

Sounds good at least to me.  Thanks!

> 
> The reason why I had another big changset is to align the reserved
> bits to vtd 3.3. E.g it equires e.g bit 62 to be reserved 63 to be
> ignored which seems not as strict as VTD_SL_IGN_COM. But it can be
> addressed in the future.

Ah I see.  We can do that later, or if the patch is ready anway IMHO we can
have them fixed altogether too.

It's weird that VT-d spec seems to be very prone to changes.. that's rare as a
spec, and it even happened multiple times.

Another trivial thing: for that SNP bit code change, shall we also reference
the Linux commit 6c00612d0cba ("iommu/vt-d: Report right snoop capability when
using FL for IOVA", 2021-04-07) directly in the code as comment?  Just want to
make sure we'll never forget why we added it as no one will be able to find a
clue in the spec, meanwhile that explicit hint let us remember when we added SC
support we can drop it.

-- 
Peter Xu



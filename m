Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959873D7A7A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 18:05:33 +0200 (CEST)
Received: from localhost ([::1]:40866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8PaG-0007cz-2U
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 12:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8PX6-000326-Qu
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 12:02:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8PX3-0004Wj-PN
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 12:02:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627401730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tF/804m/i6Te+Rgw6XB6u58fSt5OLkc4F6d1QRyYadE=;
 b=gu+bUrzxz4fJbt26GfyX8Z8tKPxdhFQMd4yAJjOgD3igvmPuVi456EJ6B+OngSH1YhNCIr
 yM5FJHWf8fSUBVaTiuqs2CxXrIdakRMxyJbvNe1WA2i3fKnrt8247km3Iz/TzA7EfIwIbb
 ZL+eEKm2R6Lzk0z9WvGPV6iQN2UdCaA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-kQgaSZAtPsKRwpnBxWi5Lg-1; Tue, 27 Jul 2021 12:02:07 -0400
X-MC-Unique: kQgaSZAtPsKRwpnBxWi5Lg-1
Received: by mail-qk1-f200.google.com with SMTP id
 bm25-20020a05620a1999b02903a9c3f8b89fso11962696qkb.2
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 09:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tF/804m/i6Te+Rgw6XB6u58fSt5OLkc4F6d1QRyYadE=;
 b=Nn5rmXx0IMgoTDj9JfosreLXlE8ANfVLFJBgE07sj5ozzKDsMgLnf+OMZkekcF/8Pt
 p6fFSy84x2j7hI4sNrqkiwc1TxcgkoDMNzK8fGOUHA+k2P2gfE0q7BkYEl/DT7kpzOBW
 dIrxF/q16O6yO9jMNeOAIVWFB6OKS+b7jPSt9m0KOrMHej+S07mY+1cp/oVnyScnNOle
 u6bKlkcbKAs0PfjqnLvgolJL/eQ1ePFvJbDFl19PBD5ZvHzR8DzZ3wo4Q7xTTWMuviSw
 cIVmC9aLSjowcWSHJD1wbf2bK5bquhUtNXqL+hFAVLud8HBic8hPeYboEeV+9rCI8cCe
 FcSQ==
X-Gm-Message-State: AOAM532xqFX/33R4lCzvfxBmhzZ+LLAnINRZja4+00dolGr5QDaov93t
 hw/Q7eSzW3CP1JeufHlXTNgu8Z3y4w+G/TgCsIMQvUXPEIp477uzRcGhYR1sQgabvz+uNjZwyqY
 OZkCCm2lKAlkcK0Y=
X-Received: by 2002:ac8:47d9:: with SMTP id d25mr19757463qtr.277.1627401726817; 
 Tue, 27 Jul 2021 09:02:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGg/lHfI/QsMJ2CNQeCAiNeo4i0UUc+yDB5XRFfG194SQ4PPU5+sowjX12wvMUdGMmdP/y0A==
X-Received: by 2002:ac8:47d9:: with SMTP id d25mr19757439qtr.277.1627401726588; 
 Tue, 27 Jul 2021 09:02:06 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id s81sm1890447qka.82.2021.07.27.09.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 09:02:06 -0700 (PDT)
Date: Tue, 27 Jul 2021 12:02:05 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 4/9] memory: Don't do topology update in memory
 finalize()
Message-ID: <YQAt/V06OZgjhpI6@t490s>
References: <20210723193444.133412-1-peterx@redhat.com>
 <20210723193444.133412-5-peterx@redhat.com>
 <1ced8a81-18a2-85fe-0323-03dbc606f73e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1ced8a81-18a2-85fe-0323-03dbc606f73e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 27, 2021 at 03:21:31PM +0200, David Hildenbrand wrote:
> On 23.07.21 21:34, Peter Xu wrote:
> > Topology update could be wrongly triggered in memory region finalize() if
> > there's bug somewhere else.  It'll be a very confusing stack when it
> > happens (e.g., sending KVM ioctl within the RCU thread, and we'll observe it
> > only until it fails!).
> > 
> > Instead of that, we use the push()/pop() helper to avoid memory transaction
> > commit, at the same time we use assertions to make sure there's no pending
> > updates or it's a nested transaction, so it could fail even earlier and in a
> > more explicit way.
> > 
> > Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >   softmmu/memory.c | 23 +++++++++++++++++++++--
> >   1 file changed, 21 insertions(+), 2 deletions(-)
> > 
> > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > index 1a3e9ff8ad..dfce4a2bda 100644
> > --- a/softmmu/memory.c
> > +++ b/softmmu/memory.c
> > @@ -170,6 +170,12 @@ struct MemoryRegionIoeventfd {
> >       EventNotifier *e;
> >   };
> > +/* Returns whether there's any pending memory updates */
> > +static bool memory_region_has_pending_update(void)
> > +{
> > +    return memory_region_update_pending || ioeventfd_update_pending;
> > +}
> > +
> >   static bool memory_region_ioeventfd_before(MemoryRegionIoeventfd *a,
> >                                              MemoryRegionIoeventfd *b)
> >   {
> > @@ -1756,12 +1762,25 @@ static void memory_region_finalize(Object *obj)
> >        * and cause an infinite loop.
> >        */
> >       mr->enabled = false;
> > -    memory_region_transaction_begin();
> > +
> > +    /*
> > +     * Use push()/pop() instead of begin()/commit() to make sure below block
> > +     * won't trigger any topology update (which should never happen, but it's
> > +     * still a safety belt).
> > +     */
> 
> Hmm, I wonder if we can just keep the begin/end semantics and just do an
> assertion before doing the commit? Does anything speak against that?

That sounds working too for the case of run_on_cpu and similar, but I think
this patch should be able to cover more.  For example, it's possible depth==0
when enter memory_region_finalize(), but some removal of subregions could
further cause memory layout changes.  IMHO we should also bail out early for
those cases too.  Thanks,

-- 
Peter Xu



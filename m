Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE9543C4B8
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 10:12:05 +0200 (CEST)
Received: from localhost ([::1]:46902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfe2W-0002ET-Hr
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 04:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfe0T-0001OE-ID
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:09:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfe0Q-0005Bi-NO
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635322193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=odKXd0Bq9yoNlfjtzXB7zfqwBAJZmxneGwB/RX7bsmw=;
 b=RNjFxeXu45y51O997HW3YMPRtyMOfe7ftfzYXX80RxhU+oWxPTNJYQz+RjLJ2hPNaIxlkN
 QQUZ728AKWpXhR9cVzaK/IMt4K87hKRLBsmjD4on4Y+E+OfHSaLMbfmsFYqqfzK65kgE+4
 vqMEhdPT0BI3kDBBPtVBSrYQx2fWuXs=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-40x_x6NUPM2fcw8_5F1evg-1; Wed, 27 Oct 2021 04:09:52 -0400
X-MC-Unique: 40x_x6NUPM2fcw8_5F1evg-1
Received: by mail-pj1-f69.google.com with SMTP id
 y9-20020a17090a644900b001a28339f0f3so1906219pjm.0
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 01:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=odKXd0Bq9yoNlfjtzXB7zfqwBAJZmxneGwB/RX7bsmw=;
 b=JonF0ZSCRu8gsQdUnHNhWPjqzWk7vig/8k8tZTHnK48bxhmC7D8AD6R37w2DyjJj8d
 MvGuUhOK6/ZyJqNPT1bFObmXjkq/zX6lEtTdw/fApl+prItH+1U7HBkl5L/qhNnVrJTW
 ofXktGPo6qaqQqTRTpQZbW2Ra9Qy5zV5xym5OFMX19Djwh/NnVxYo0yDV1nzJ17YmjWv
 V+oQX+r7p8uDHL7AV1yo3YpietrCw1zvcXPcUxHPyGTvq5UceRKQa7LDc5PJgwaJeem3
 4LHwwY7Qihb5QXmRRLt3sFK3+Xrezy9b5QZCty9fLzO/xYU0Sl0qOd5BWeyee6zW10T8
 0kRg==
X-Gm-Message-State: AOAM532brwZz4JyjdEg+P7DhMU2mqU8UR7YT0wlmYcINJ/xRGvvrJS2P
 ed3Z7K94S/6rGQhk/kVF6SXtJC1uWGRMKDmmvTROJyu5qNDY6/FUidfY+unBQW973fmp942Lgbk
 t+h1BkBqb1kIxwbc=
X-Received: by 2002:a17:90b:207:: with SMTP id
 fy7mr4212104pjb.145.1635322191030; 
 Wed, 27 Oct 2021 01:09:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZsYJKq9TCIgLNFl5DnwZ0uihyUBLKWBkM6QlLdgBgNDywdYSvjFH9W3XrnwZfqlMcm6bL8Q==
X-Received: by 2002:a17:90b:207:: with SMTP id
 fy7mr4212068pjb.145.1635322190591; 
 Wed, 27 Oct 2021 01:09:50 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.60])
 by smtp.gmail.com with ESMTPSA id q13sm28880056pfj.26.2021.10.27.01.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 01:09:49 -0700 (PDT)
Date: Wed, 27 Oct 2021 16:09:45 +0800
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 0/3] memory: memory_region_is_mapped() cleanups
Message-ID: <YXkJSdc9QQsSA2SK@xz-m1.local>
References: <20211026160649.47545-1-david@redhat.com>
 <YXjNULIsRufbyRZX@xz-m1.local>
 <41a44922-bccb-eb08-64b1-2da8655a01a5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <41a44922-bccb-eb08-64b1-2da8655a01a5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 09:12:08AM +0200, David Hildenbrand wrote:
> On 27.10.21 05:53, Peter Xu wrote:
> > On Tue, Oct 26, 2021 at 06:06:46PM +0200, David Hildenbrand wrote:
> >> This is the follow-up of [1].
> >>
> >> Playing with memory_region_is_mapped(), I realized that memory regions
> >> mapped via an alias behave a little bit "differently", as they don't have
> >> their ->container set.
> > 
> 
> Hi Peter,
> 
> thanks for your review!
> 
> > The patches look ok to me, though I have a few pure questions to ask..
> > 
> >> * memory_region_is_mapped() will never succeed for memory regions mapped
> >>   via an alias
> > 
> > I think you mentioned that in commit message of patch 2 that it fixes no real
> > problem so far, so I'm also wondering in which case it'll help.  Say, normally
> > when there's an alias of another MR and we want to know whether the MR is
> > mapped, we simply call memory_region_is_mapped() upon the alias .
> 
> Just to recap: in v1 I proposed to just document that it doesn't work on
> aliases, and folks weren't too happy to see regions mapped via aliases
> being special-cased where it might just be avoided.
> 
> > 
> > To verify my thoughts, I did look up a few memory_region_is_mapped() random
> > callers that used with alias and that's what they did:
> > 
> > Here'sthe dino.c example:
> > 
> > *** hw/hppa/dino.c:
> > gsc_to_pci_forwarding[151]     if (!memory_region_is_mapped(mem)) {
> > gsc_to_pci_forwarding[155]     } else if (memory_region_is_mapped(mem)) {
> > 
> > The "mem" points to:
> > 
> >         MemoryRegion *mem = &s->pci_mem_alias[i];
> > 
> > Which is the alias.
> > 
> > Another one:
> > 
> > *** hw/pci-host/pnv_phb3.c:
> > pnv_phb3_check_m32[121]        if (memory_region_is_mapped(&phb->mr_m32)) {
> > pnv_phb3_update_regions[1076]  if (memory_region_is_mapped(&phb->mr_m32)) {
> > 
> > Andmr_m32 is the alias MR itself:
> > 
> >     memory_region_init_alias(&phb->mr_m32, OBJECT(phb), "phb3-m32",
> >                              &phb->pci_mmio, start, size);
> > 
> > I mean, if it should always be very straightforward to fetch the alias mr, then
> > I'm just afraid patch 2 won't really help in any real use case but pure overhead.
> 
> That is true as long as it's not a mapping check in generic code. Say,
> we have a RAMBlock and use ->mr. Checking
> memory_region_is_mapped(rb->mr) is misleading if the region is mapped
> via aliases.
> 
> The reason I stumbled over this at all is a sanity check I added in
> 
> void memory_region_set_ram_discard_manager(MemoryRegion *mr,
>                                            RamDiscardManager *rdm)
> {
>     g_assert(memory_region_is_ram(mr) && !memory_region_is_mapped(mr));
>     g_assert(!rdm || !mr->rdm);
>     mr->rdm = rdm;
> }
> 
> If mr is only mapped via aliases (see the virtio-mem memslot series),
> this check is of no value, because even if the mr would be mapped via
> aliases, we would not be able to catch it.

Yeah, this is a sane check to ask for.

> 
> Having that said, the check is not 100% correct, because
> memory_region_is_mapped() does not indicate that we're actually mapped
> into an address space. But at least for memory devices (-> target use
> case of RamDiscardManager) with an underlying RAMBlock, it's pretty
> reliable -- and there is no easy way to check if we're mapped into an
> address space when aliases are involved.
> 
> Note that there is also a similar check in memory_region_is_mapped(),
> but I'm removing that as part of the virtio-mem memslot series, because
> it's not actually helpful in the context of RAMBlock migration (nothing
> might be mapped, but migration code would still try migrating such a
> RAMBlock and has to consider the RamDiscardManager).
> 
> 
> Another example of a generic code check is patch #1: the only reason it
> works right now is because NVDIMMs cannot exist before initial memory is
> created. But yes, there is a better way of doing it when we have a
> memdev at hand.

IMHO patch 1 is actually an example showing that when we want that explicit
meaning we can simply introduce another boolean in parent struct. :)

> 
> > 
> > And I hope we won't trigger problem with any use case where
> > memory_region_is_mapped() returned false previously but then it'll return true
> > after patch 2, because logically with the old code one can detect explicitly on
> > "whether this original MR is mapped somewhere, irrelevant of other alias
> > mappings upon this mr".  Patch 2 blurrs it from that pov.
> > 
> 
> I hope tests will catch that early. I ran some without surprises.
> 
> >> * memory_region_to_address_space(), memory_region_find(),
> >>   memory_region_find_rcu(), memory_region_present() won't work, which seems
> >>   okay, because we don't expect such memory regions getting passed to these
> >>   functions.
> > 
> > Looks right.
> > 
> >> * memory_region_to_absolute_addr() will result in a wrong address. As
> >>   the result is only used for tracing, that is tolerable.
> > 
> > memory_region_{read|write}_accessor() seem to be only called from the address
> > space layer, so it looks fine even for tracing as it'll always fetch the alias,
> > afaiu.  Phil's patch may change that fact, though, it seems.
> 
> Unfortunately, not much we can do: a memory region might theoretically
> be mapped via aliases into different address spaces and into different
> locations: there is no right answer to memory_region_to_absolute_addr()
> when only having the memory region at hand without an address space.

Yes.

Now I think patch 2 is fine too, it'll be nicer imho to be a new API like
memory_region_is_mapped_any() with comment showing it checks the aliases, but
no strong opinion.  If nothing fails with the change, it'll be the same indeed.

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu



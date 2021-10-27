Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815AA43C39B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 09:13:16 +0200 (CEST)
Received: from localhost ([::1]:43322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfd7b-0003IQ-7T
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 03:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfd6f-0002du-SQ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 03:12:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfd6b-00035A-RL
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 03:12:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635318732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4GkBYJoQbtcDCa00wKwFAUxEtDV2+AT5SyrC3qL4liU=;
 b=XebaBPTYn6mSCRa6LqTErD6k26OlCDFVSsTHu8OKLpgBgC2X+LsKTXhxvOttC2sf9tDEHL
 fpi/nFNoKxxmjZu4VmK8bWihcycJhGeir3MazuCgTS87IHoCWK9s6lRdMzYOH3y+0QOqoF
 OCoKjGfx1ssPD6/tn8AkkKmkuelRleM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-wlaEMB2NOJu3XCKsf4Bung-1; Wed, 27 Oct 2021 03:12:11 -0400
X-MC-Unique: wlaEMB2NOJu3XCKsf4Bung-1
Received: by mail-wr1-f70.google.com with SMTP id
 e7-20020adffc47000000b001688df0b917so303152wrs.22
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 00:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=4GkBYJoQbtcDCa00wKwFAUxEtDV2+AT5SyrC3qL4liU=;
 b=X/SAWS7NH4a78YYatAsop55mGuDRnpNKFAxniWjGGvmaWSQYMS10/ew6OWxQ1QLE3W
 jEp9zMoXSQjEx5goRdSI6mRDdSHwEoc2cPM32pOZdLzqnDEshv/Cgc3XS+acVnzn0Eya
 ANAmIu5q7L4uCbEj5nPqV/447DNUMGNBw/fpfCe/H83boTGYiK0A+D8xQtx1i2p+v2MM
 npmpdmS2A6GoRoWwaRCoZmx3Ej4Th6E+4tv9NrFICs8Lu6xiRw+sFRuanJFNq9F42sdg
 FKi8/LGltqEDa0+R2XKtDIuCVTXsBAwsgud0t4vINtOih7Hvv+yN1IqOz9g+KticOGhu
 gXMQ==
X-Gm-Message-State: AOAM533a6UF+PQfBZL6mrW6v+C7v7X/kXi6PpJKpVbq0F6Nhe92S0Ub6
 73C9RpoW3RimwpMKC6i8b4aGpqnBOsgzXSanqMA3KJD8TQ5giiB1ROD8W+TdZhMAAiNOGJhmIZN
 JML8B85/Rf6lO4+o=
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr3820629wmp.165.1635318729870; 
 Wed, 27 Oct 2021 00:12:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqr+ndTu5oUmzsVVszo5HPfEcxhANgHLzemApf95ZqazqAzmZFHmB2q1WxMJVodUqEI7UZUA==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr3820595wmp.165.1635318729560; 
 Wed, 27 Oct 2021 00:12:09 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23d76.dip0.t-ipconnect.de. [79.242.61.118])
 by smtp.gmail.com with ESMTPSA id v6sm7871376wrx.17.2021.10.27.00.12.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 00:12:09 -0700 (PDT)
Message-ID: <41a44922-bccb-eb08-64b1-2da8655a01a5@redhat.com>
Date: Wed, 27 Oct 2021 09:12:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
To: Peter Xu <peterx@redhat.com>
References: <20211026160649.47545-1-david@redhat.com>
 <YXjNULIsRufbyRZX@xz-m1.local>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 0/3] memory: memory_region_is_mapped() cleanups
In-Reply-To: <YXjNULIsRufbyRZX@xz-m1.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.10.21 05:53, Peter Xu wrote:
> On Tue, Oct 26, 2021 at 06:06:46PM +0200, David Hildenbrand wrote:
>> This is the follow-up of [1].
>>
>> Playing with memory_region_is_mapped(), I realized that memory regions
>> mapped via an alias behave a little bit "differently", as they don't have
>> their ->container set.
> 

Hi Peter,

thanks for your review!

> The patches look ok to me, though I have a few pure questions to ask..
> 
>> * memory_region_is_mapped() will never succeed for memory regions mapped
>>   via an alias
> 
> I think you mentioned that in commit message of patch 2 that it fixes no real
> problem so far, so I'm also wondering in which case it'll help.  Say, normally
> when there's an alias of another MR and we want to know whether the MR is
> mapped, we simply call memory_region_is_mapped() upon the alias .

Just to recap: in v1 I proposed to just document that it doesn't work on
aliases, and folks weren't too happy to see regions mapped via aliases
being special-cased where it might just be avoided.

> 
> To verify my thoughts, I did look up a few memory_region_is_mapped() random
> callers that used with alias and that's what they did:
> 
> Here'sthe dino.c example:
> 
> *** hw/hppa/dino.c:
> gsc_to_pci_forwarding[151]     if (!memory_region_is_mapped(mem)) {
> gsc_to_pci_forwarding[155]     } else if (memory_region_is_mapped(mem)) {
> 
> The "mem" points to:
> 
>         MemoryRegion *mem = &s->pci_mem_alias[i];
> 
> Which is the alias.
> 
> Another one:
> 
> *** hw/pci-host/pnv_phb3.c:
> pnv_phb3_check_m32[121]        if (memory_region_is_mapped(&phb->mr_m32)) {
> pnv_phb3_update_regions[1076]  if (memory_region_is_mapped(&phb->mr_m32)) {
> 
> Andmr_m32 is the alias MR itself:
> 
>     memory_region_init_alias(&phb->mr_m32, OBJECT(phb), "phb3-m32",
>                              &phb->pci_mmio, start, size);
> 
> I mean, if it should always be very straightforward to fetch the alias mr, then
> I'm just afraid patch 2 won't really help in any real use case but pure overhead.

That is true as long as it's not a mapping check in generic code. Say,
we have a RAMBlock and use ->mr. Checking
memory_region_is_mapped(rb->mr) is misleading if the region is mapped
via aliases.

The reason I stumbled over this at all is a sanity check I added in

void memory_region_set_ram_discard_manager(MemoryRegion *mr,
                                           RamDiscardManager *rdm)
{
    g_assert(memory_region_is_ram(mr) && !memory_region_is_mapped(mr));
    g_assert(!rdm || !mr->rdm);
    mr->rdm = rdm;
}

If mr is only mapped via aliases (see the virtio-mem memslot series),
this check is of no value, because even if the mr would be mapped via
aliases, we would not be able to catch it.

Having that said, the check is not 100% correct, because
memory_region_is_mapped() does not indicate that we're actually mapped
into an address space. But at least for memory devices (-> target use
case of RamDiscardManager) with an underlying RAMBlock, it's pretty
reliable -- and there is no easy way to check if we're mapped into an
address space when aliases are involved.

Note that there is also a similar check in memory_region_is_mapped(),
but I'm removing that as part of the virtio-mem memslot series, because
it's not actually helpful in the context of RAMBlock migration (nothing
might be mapped, but migration code would still try migrating such a
RAMBlock and has to consider the RamDiscardManager).


Another example of a generic code check is patch #1: the only reason it
works right now is because NVDIMMs cannot exist before initial memory is
created. But yes, there is a better way of doing it when we have a
memdev at hand.

> 
> And I hope we won't trigger problem with any use case where
> memory_region_is_mapped() returned false previously but then it'll return true
> after patch 2, because logically with the old code one can detect explicitly on
> "whether this original MR is mapped somewhere, irrelevant of other alias
> mappings upon this mr".  Patch 2 blurrs it from that pov.
> 

I hope tests will catch that early. I ran some without surprises.

>> * memory_region_to_address_space(), memory_region_find(),
>>   memory_region_find_rcu(), memory_region_present() won't work, which seems
>>   okay, because we don't expect such memory regions getting passed to these
>>   functions.
> 
> Looks right.
> 
>> * memory_region_to_absolute_addr() will result in a wrong address. As
>>   the result is only used for tracing, that is tolerable.
> 
> memory_region_{read|write}_accessor() seem to be only called from the address
> space layer, so it looks fine even for tracing as it'll always fetch the alias,
> afaiu.  Phil's patch may change that fact, though, it seems.

Unfortunately, not much we can do: a memory region might theoretically
be mapped via aliases into different address spaces and into different
locations: there is no right answer to memory_region_to_absolute_addr()
when only having the memory region at hand without an address space.

Thanks!

-- 
Thanks,

David / dhildenb



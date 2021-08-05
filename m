Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB223E1022
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 10:22:43 +0200 (CEST)
Received: from localhost ([::1]:46108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBYeI-0008Iq-5l
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 04:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBYcr-00079h-El
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 04:21:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBYcm-000503-0v
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 04:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628151667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WiQom/WjiA+x9eXrKgqyAtYqFWQ+hV9zrWJzIa7vw4Q=;
 b=GCiYxuTPEyny4Q9j1T7Oma2wt/NsF6QfWzLPB6Z1SJ9S+KRw20lqyXOSEIw4bWs8jJib1G
 EVMa7n+WbWw8HFqvucWM+edGElxIsM5InwDIN2tbHvleMF7gZiGuGIaJED7MQU7sH4WZWb
 Sq02zp7q532kVvS9ikDszLcmwKM3up4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-oXj4m3C7M7y-fSNGQzLFFg-1; Thu, 05 Aug 2021 04:21:01 -0400
X-MC-Unique: oXj4m3C7M7y-fSNGQzLFFg-1
Received: by mail-wr1-f70.google.com with SMTP id
 w1-20020adf8bc10000b0290154bed98988so361915wra.1
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 01:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=WiQom/WjiA+x9eXrKgqyAtYqFWQ+hV9zrWJzIa7vw4Q=;
 b=KGUdxogNnK8v/L+wYrI23fjn1Tc6RcUanwUvaby9ubnJfjKjXp+6JW3VO8BAztK2rZ
 PMT3SXVXPhmtYQX8kOZ1obRJjmEN8et38MpKohK3AwCLATqXgkzq6CSlIRSm+42AZIlP
 RVt8Tw5sv4gzSuY+82dyYZXzzSlicLndAm8jHnrRYwHDQvTBRMFpxoXi8XNfBnjnRzDv
 +0Pyq/OX7EuvUKFR3flubM97vIkCdDjF+3bdmMZgB05SnFa8vOZTKY1BkkXxZueZkgUW
 UJvpgovJECoZ8tXWrKcQ5WnYJrtgViAiyN5P6bUoDoc3Rnyp+EWDtNCuLfava/E89Pvh
 MP/Q==
X-Gm-Message-State: AOAM530DABr+KCATSmIsNOd+RJhYkhEqq7Ivsbq7dkDoo7NL+V2WPM95
 LPlKnW50LJywza/ZGz58Dt5fGlng7xIDHLnBYGo8H4PIn7Alu5UStRVbIs8cUvN2MCbM3yzBQTc
 sKhqCKUJY9orG6Eg=
X-Received: by 2002:a05:6000:12ce:: with SMTP id
 l14mr3817326wrx.41.1628151660153; 
 Thu, 05 Aug 2021 01:21:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8F9xrIkyP6UbZ31B3KiVFYGglUA2DUyywn/f/5eQoJnymsORk/J0ExuK4CTn5jY8HqwcSbQ==
X-Received: by 2002:a05:6000:12ce:: with SMTP id
 l14mr3817313wrx.41.1628151659983; 
 Thu, 05 Aug 2021 01:20:59 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c630b.dip0.t-ipconnect.de. [91.12.99.11])
 by smtp.gmail.com with ESMTPSA id
 m32sm5632747wms.2.2021.08.05.01.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 01:20:59 -0700 (PDT)
Subject: Re: [PATCH v3 6/7] migration/postcopy: Handle RAMBlocks with a
 RamDiscardManager on the destination
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210730085249.8246-1-david@redhat.com>
 <20210730085249.8246-7-david@redhat.com>
 <5f8c6173-046d-9fc2-c649-93ede45ca77d@redhat.com>
 <a5ef8f64-0336-c5fa-a81e-2caed5296dee@redhat.com>
 <2c8d80ad-f171-7d5f-3235-92f02fa174b3@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <c33ecdcd-6584-7a46-2881-d787007dcd93@redhat.com>
Date: Thu, 5 Aug 2021 10:20:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2c8d80ad-f171-7d5f-3235-92f02fa174b3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.08.21 10:17, Philippe Mathieu-Daudé wrote:
> On 8/5/21 10:07 AM, David Hildenbrand wrote:
>> On 05.08.21 09:48, Philippe Mathieu-Daudé wrote:
>>> On 7/30/21 10:52 AM, David Hildenbrand wrote:
>>>> Currently, when someone (i.e., the VM) accesses discarded parts inside a
>>>> RAMBlock with a RamDiscardManager managing the corresponding mapped
>>>> memory
>>>> region, postcopy will request migration of the corresponding page
>>>> from the
>>>> source. The source, however, will never answer, because it refuses to
>>>> migrate such pages with undefined content ("logically unplugged"): the
>>>> pages are never dirty, and get_queued_page() will consequently skip
>>>> processing these postcopy requests.
>>>>
>>>> Especially reading discarded ("logically unplugged") ranges is
>>>> supposed to
>>>> work in some setups (for example with current virtio-mem), although it
>>>> barely ever happens: still, not placing a page would currently stall the
>>>> VM, as it cannot make forward progress.
>>>>
>>>> Let's check the state via the RamDiscardManager (the state e.g.,
>>>> of virtio-mem is migrated during precopy) and avoid sending a request
>>>> that will never get answered. Place a fresh zero page instead to keep
>>>> the VM working. This is the same behavior that would happen
>>>> automatically without userfaultfd being active, when accessing virtual
>>>> memory regions without populated pages -- "populate on demand".
>>>>
>>>> For now, there are valid cases (as documented in the virtio-mem spec)
>>>> where
>>>> a VM might read discarded memory; in the future, we will disallow that.
>>>> Then, we might want to handle that case differently, e.g., warning the
>>>> user that the VM seems to be mis-behaving.
>>>>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>    migration/postcopy-ram.c | 31 +++++++++++++++++++++++++++----
>>>>    migration/ram.c          | 21 +++++++++++++++++++++
>>>>    migration/ram.h          |  1 +
>>>>    3 files changed, 49 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
>>>> index 2e9697bdd2..38cdfc09c3 100644
>>>> --- a/migration/postcopy-ram.c
>>>> +++ b/migration/postcopy-ram.c
>>>> @@ -671,6 +671,29 @@ int postcopy_wake_shared(struct PostCopyFD *pcfd,
>>>>        return ret;
>>>>    }
>>>>    +static int postcopy_request_page(MigrationIncomingState *mis,
>>>> RAMBlock *rb,
>>>> +                                 ram_addr_t start, uint64_t haddr)
>>>> +{
>>>> +    void *aligned = (void *)(uintptr_t)(haddr &
>>>> -qemu_ram_pagesize(rb));
>>>
>>>     void *aligned = QEMU_ALIGN_PTR_DOWN(haddr, qemu_ram_pagesize(rb)));
>>>
>>
>> Does not compile as haddr is not a pointer.
> 
> I suppose the typeof() fails?
> 
> /* n-byte align pointer down */
> #define QEMU_ALIGN_PTR_DOWN(p, n) \
>      ((typeof(p))QEMU_ALIGN_DOWN((uintptr_t)(p), (n)))
> 
> 
>> void *aligned = QEMU_ALIGN_PTR_DOWN((void *)haddr, qemu_ram_pagesize(rb)));
>>
>> should work.
> 
> What about
> 
> void *aligned = QEMU_ALIGN_DOWN(haddr, qemu_ram_pagesize(rb)));
> 
> else
> 
> void *aligned = (void *)QEMU_ALIGN_DOWN(haddr, qemu_ram_pagesize(rb)));

That works as well and will use that for now.

At one point we should just pass a pointer instead of uint64_t for the 
host address.

> 
> I don't mind much the style you prefer, as long as it compiles :p
> But these QEMU_ALIGN_DOWN() macros make the review easier than (a & -b).
> 

Yes, absolutely. I'll add a patch converting a bunch of such alignments 
in migration code.

-- 
Thanks,

David / dhildenb



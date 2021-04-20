Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3283654FE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 11:11:56 +0200 (CEST)
Received: from localhost ([::1]:35212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYmQF-0000vY-BD
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 05:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYmOv-0008Sd-45
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 05:10:33 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYmOs-0002n9-FC
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 05:10:32 -0400
Received: by mail-wr1-x429.google.com with SMTP id x7so36773250wrw.10
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 02:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9P01LUUJgrngMU0ILpsXIGX+0Ftwum4SoqMoZGcGll8=;
 b=aG9u0LZMievsbKxDOfXQDueU58RRVlVW7AUFlxQMhqgwAE8KnawtkgF4UC7JEX5ug8
 U3bhvhDb8vQVMPbVhgsfou92R9+luCCx7nLT6c5jvp+hsCMPPIQqx5ZN+CVCzrMztVnF
 2bsGTDWtYeMZ78R0mXptCeeaYxaf5qNADg/jejrXTqfpCGgNtr18xhgtEQoun/1UraKY
 VlvYRoof5UaSokqdZPRt7N0uTUX/Q7oO98o+Nu5Y+zJpiok+farPthQhGrljFi25llsa
 Jeb5xfPi8Z0+W2qCdZNyXpgGQVsCqrey2WFp8Hk2Kq87QJtvGQJmERxVUThcUxmzLxkg
 mCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9P01LUUJgrngMU0ILpsXIGX+0Ftwum4SoqMoZGcGll8=;
 b=uHT8nXOiigNsPl0O/N0QNOrjoVNm4fZk08knSBy5YAmGwBJv6QJGYHVh3DcleN0C1M
 tLiFbmnM7gp8rvdZqtZeNyK3HlQ1krGRBm49nWEFHGiskkdc2SK8RFXYn4Q3MpJpMwu0
 UVOWH0YuWR9vO3oqm/v0osCgMercD+ToJiX4WF0dwXNUkBBm0fjhhQzop/jWkTB6bwz7
 wCtNcl3tzUBHMlwvpiqRcXzwkDGfvSufIE1c6J2dRdvMcdbBp1KaBeLpa+ZkPxaqKJ8t
 3eY3SW2vSbyWeY5DoKDBG2aVBlqj+/bmJHHMJLxXcVzHbLCMyuohyk4WQistvsnVrC33
 AATg==
X-Gm-Message-State: AOAM530QER3rDXdg8dcwNy9TQ+9mSlzB14CeoMWVyRmEIKRalRvYb9Ax
 AnK1OACw5LtSMiBlUpfotGE=
X-Google-Smtp-Source: ABdhPJx+VUDG/tWlon2rdzl6XF0W2Dl6m/Nzh4IL7DjXaZrA2c6Y75enJVFdKsYIPfTMcvfyJca15g==
X-Received: by 2002:a5d:45c2:: with SMTP id b2mr19803097wrs.288.1618909828820; 
 Tue, 20 Apr 2021 02:10:28 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g84sm2600977wmf.30.2021.04.20.02.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 02:10:27 -0700 (PDT)
Subject: Re: [PATCH v3] memory: Directly dispatch alias accesses on origin
 memory region
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Jan Kiszka <jan.kiszka@web.de>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20210417140206.673885-1-f4bug@amsat.org>
 <8f59bd60-3588-3be0-c44c-1ebfbefd78bd@ilande.co.uk>
 <67955dd0-dfc7-271f-009f-cf7247f3b6c2@amsat.org>
 <efea7689-15c6-44bf-77a8-3d6ee945d097@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <916b95b2-c128-69e0-6e68-78daa0b15722@amsat.org>
Date: Tue, 20 Apr 2021 11:10:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <efea7689-15c6-44bf-77a8-3d6ee945d097@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/21 9:00 AM, Mark Cave-Ayland wrote:
> On 19/04/2021 21:58, Philippe Mathieu-Daudé wrote:
> 
>> Hi Mark,
>>
>> On 4/19/21 10:13 PM, Mark Cave-Ayland wrote:
>>> On 17/04/2021 15:02, Philippe Mathieu-Daudé wrote:
>>>
>>>> Since commit 2cdfcf272d ("memory: assign MemoryRegionOps to all
>>>> regions"), all newly created regions are assigned with
>>>> unassigned_mem_ops (which might be then overwritten).
>>>>
>>>> When using aliased container regions, and there is no region mapped
>>>> at address 0 in the container, the memory_region_dispatch_read()
>>>> and memory_region_dispatch_write() calls incorrectly return the
>>>> container unassigned_mem_ops, because the alias offset is not used.
>>>>
>>>> The memory_region_init_alias() flow is:
>>>>
>>>>     memory_region_init_alias()
>>>>     -> memory_region_init()
>>>>        -> object_initialize(TYPE_MEMORY_REGION)
>>>>           -> memory_region_initfn()
>>>>              -> mr->ops = &unassigned_mem_ops;
>>>>
>>>> Later when accessing the alias, the memory_region_dispatch_read()
>>>> flow is:
>>>>
>>>>     memory_region_dispatch_read(offset)
>>>>     -> memory_region_access_valid(mr)   <- offset is ignored
>>>>        -> mr->ops->valid.accepts()
>>>>           -> unassigned_mem_accepts()
>>>>           <- false
>>>>        <- false
>>>>      <- MEMTX_DECODE_ERROR
>>>>
>>>> The caller gets a MEMTX_DECODE_ERROR while the access is OK.
>>>>
>>>> Fix by dispatching aliases recusirvely, accessing its origin region
>>>> after adding the alias offset.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> ---
>>>> v3:
>>>> - reworded, mentioning the "alias to container" case
>>>> - use recursive call instead of while(), because easier when debugging
>>>>     therefore reset Richard R-b tag.
>>>> v2:
>>>> - use while()
>>>> ---
>>>>    softmmu/memory.c | 10 ++++++++++
>>>>    1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>>>> index d4493ef9e43..23bdbfac079 100644
>>>> --- a/softmmu/memory.c
>>>> +++ b/softmmu/memory.c
>>>> @@ -1442,6 +1442,11 @@ MemTxResult
>>>> memory_region_dispatch_read(MemoryRegion *mr,
>>>>        unsigned size = memop_size(op);
>>>>        MemTxResult r;
>>>>    +    if (mr->alias) {
>>>> +        return memory_region_dispatch_read(mr->alias,
>>>> +                                           addr + mr->alias_offset,
>>>> +                                           pval, op, attrs);
>>>> +    }
>>>>        if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
>>>>            *pval = unassigned_mem_read(mr, addr, size);
>>>>            return MEMTX_DECODE_ERROR;
>>>> @@ -1486,6 +1491,11 @@ MemTxResult
>>>> memory_region_dispatch_write(MemoryRegion *mr,
>>>>    {
>>>>        unsigned size = memop_size(op);
>>>>    +    if (mr->alias) {
>>>> +        return memory_region_dispatch_write(mr->alias,
>>>> +                                            addr + mr->alias_offset,
>>>> +                                            data, op, attrs);
>>>> +    }
>>>>        if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
>>>>            unassigned_mem_write(mr, addr, data, size);
>>>>            return MEMTX_DECODE_ERROR;
>>>
>>> Whilst working on my q800 patches I realised that this was a similar
>>> problem to the one I had with my macio.alias implementation at [1]:
>>> except that in my case the unassigned_mem_ops mr->ops->valid.accepts()
>>> function was being invoked on a ROM memory region instead of an alias. I
>>> think this is exactly the same issue that you are attempting to fix with
>>> your related patch at
>>> https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg03190.html
>>> ("memory: Initialize MemoryRegionOps for RAM memory regions").
>>
>> So if 2 contributors hit similar issues, there is something wrong with
>> the API. I don't see your use case or mine as forbidded by the
>> documentation in "exec/memory.h".
>>
>> My patch might not be the proper fix, but we need to figure out how
>> to avoid others to hit the same problem, as it is very hard to debug.
> 
> I agree with this sentiment: it has taken me a while to figure out what
> was happening, and that was only because I spotted accesses being
> rejected with -d guest_errors.
> 
> From my perspective the names memory_region_dispatch_read() and
> memory_region_dispatch_write() were the misleading part, although I
> remember thinking it odd whilst trying to use them that I had to start
> delving into sections etc. just to recurse a memory access.
> 
>> At least an assertion and a comment.
>>
>>> I eventually realised that I needed functions that could dispatch
>>> reads/writes to both IO memory regions and ROM memory regions, and that
>>> functionality is covered by the address_space_*() access functions.
>>> Using the address_space_*() functions I was then able to come up with
>>> the working implementation at [2] that handles accesses to both IO
>>> memory regions and ROM memory regions correctly.
>>>
>>> The reason I initially used the
>>> memory_region_dispatch_read()/memory_region_dispatch_write() functions
>>> was because I could see that was how the virtio devices dispatched
>>> accesses through the proxy. However I'm wondering now if this API can
>>> only be used for terminating IO memory regions, and so the alias_offset
>>> that you're applying above should actually be applied elsewhere instead.
>>
>> I figured out the AddressSpace API make these cases simpler, but IIRC
>> there is some overhead, some function tries to resolve / update
>> something and iterate over a list. While from the MemoryRegion API we
>> already know which region we want to access.
>>
>> I Cc'ed Peter considering him expert in this area, but don't know else
>> who to ask for help on this topic...
> 
> Yeah possibly Paolo, otherwise it's a dig through the git history of
> memory.c :/

Yes, most of the commits in this area are from Paolo.
I Also Cc'ed:

- Michael S. Tsirkin
- Alexey Kardashevskiy
- Igor Mammedov
- David Gibson


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C6A364CD5
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 23:09:24 +0200 (CEST)
Received: from localhost ([::1]:53388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYb91-0004L7-8W
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 17:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYay9-0003fe-CU
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:58:11 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYay5-0000bp-6i
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:58:07 -0400
Received: by mail-wr1-x436.google.com with SMTP id k26so18992856wrc.8
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tK85rq5qZj2k21hw7b9t/HA67PwbjiSe5QaaPelO4qk=;
 b=GiYN+hcZuNqoysYgEXHaiXMFLaUde/zMSN860OT6BC6n++PhvLITbOqeVKq8U1lqQE
 w5yJScp/+MEab2VWaB0aOIn1q6wBW49eUvtDQDgj7Lr+9xrekQVkUIbfnpMIapu6ns1p
 2nxMFknRyuS9ihXE0gbl/CHpXGtLWFLKyfTbIAmToZZDhInVw66kOGy42AdLrUGhgaGe
 yy1TvbkvoL2ehP+hcSm4B+FGVpjC67W5tWvgpqbEajY24/UN0jyzOsO2899NSeg+pJqL
 1+Ffpz/pQEDeeL2OytKLTaNV6tDjCEaTiMO5vu/nLkQzUnzB+01bbSQI9wuEzYyITdYx
 6ebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tK85rq5qZj2k21hw7b9t/HA67PwbjiSe5QaaPelO4qk=;
 b=Uavw6uFuJx279cpxEVRjRdVqoXxHIdYZYwgNNW2QC/FMlTZYLrTZrz7fU2JSBF1rCY
 M7Kv71zSlT0VovR0xxSrxZ5yWbZlk800i3/Xv/rcofoDRhL6AzRBpWUHDLa5ofNnbFfP
 nQZ8SFuAH/Me0xqhrlKPakjnQ8wv5ozYJLksnP29zH7wBuqnZd0EN0yfbWKeXLZlcob8
 jkllAlQyowBpyhjGSDetTEouUodj5m3RnFwwpoMOCxjCc3ymz7bABcQzkw69jgXV5Vez
 8Y9l7leGcunENU51TnpXCO0XEYzdcIjm/0knV2zbnNqDicLXWCOLOFwhFnUhc5FEwLKM
 JQfA==
X-Gm-Message-State: AOAM530EVXhKSTiWXw07z8y105bQLiiW1ylZHVx7FYcJ+oZbOJD+9CNT
 k2ngP23m8DSSAHhJADI2FaI=
X-Google-Smtp-Source: ABdhPJz4o4su9a/zVTw0zmJRlmwm9jRKIminGMviSIyvyqpyQsjNZ7w9wheI/X/os9DKz9IsMBU6AQ==
X-Received: by 2002:adf:c186:: with SMTP id x6mr16900619wre.253.1618865883203; 
 Mon, 19 Apr 2021 13:58:03 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id m11sm24460259wri.44.2021.04.19.13.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 13:58:02 -0700 (PDT)
Subject: Re: [PATCH v3] memory: Directly dispatch alias accesses on origin
 memory region
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210417140206.673885-1-f4bug@amsat.org>
 <8f59bd60-3588-3be0-c44c-1ebfbefd78bd@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <67955dd0-dfc7-271f-009f-cf7247f3b6c2@amsat.org>
Date: Mon, 19 Apr 2021 22:58:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8f59bd60-3588-3be0-c44c-1ebfbefd78bd@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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

Hi Mark,

On 4/19/21 10:13 PM, Mark Cave-Ayland wrote:
> On 17/04/2021 15:02, Philippe Mathieu-Daudé wrote:
> 
>> Since commit 2cdfcf272d ("memory: assign MemoryRegionOps to all
>> regions"), all newly created regions are assigned with
>> unassigned_mem_ops (which might be then overwritten).
>>
>> When using aliased container regions, and there is no region mapped
>> at address 0 in the container, the memory_region_dispatch_read()
>> and memory_region_dispatch_write() calls incorrectly return the
>> container unassigned_mem_ops, because the alias offset is not used.
>>
>> The memory_region_init_alias() flow is:
>>
>>    memory_region_init_alias()
>>    -> memory_region_init()
>>       -> object_initialize(TYPE_MEMORY_REGION)
>>          -> memory_region_initfn()
>>             -> mr->ops = &unassigned_mem_ops;
>>
>> Later when accessing the alias, the memory_region_dispatch_read()
>> flow is:
>>
>>    memory_region_dispatch_read(offset)
>>    -> memory_region_access_valid(mr)   <- offset is ignored
>>       -> mr->ops->valid.accepts()
>>          -> unassigned_mem_accepts()
>>          <- false
>>       <- false
>>     <- MEMTX_DECODE_ERROR
>>
>> The caller gets a MEMTX_DECODE_ERROR while the access is OK.
>>
>> Fix by dispatching aliases recusirvely, accessing its origin region
>> after adding the alias offset.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> v3:
>> - reworded, mentioning the "alias to container" case
>> - use recursive call instead of while(), because easier when debugging
>>    therefore reset Richard R-b tag.
>> v2:
>> - use while()
>> ---
>>   softmmu/memory.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index d4493ef9e43..23bdbfac079 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -1442,6 +1442,11 @@ MemTxResult
>> memory_region_dispatch_read(MemoryRegion *mr,
>>       unsigned size = memop_size(op);
>>       MemTxResult r;
>>   +    if (mr->alias) {
>> +        return memory_region_dispatch_read(mr->alias,
>> +                                           addr + mr->alias_offset,
>> +                                           pval, op, attrs);
>> +    }
>>       if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
>>           *pval = unassigned_mem_read(mr, addr, size);
>>           return MEMTX_DECODE_ERROR;
>> @@ -1486,6 +1491,11 @@ MemTxResult
>> memory_region_dispatch_write(MemoryRegion *mr,
>>   {
>>       unsigned size = memop_size(op);
>>   +    if (mr->alias) {
>> +        return memory_region_dispatch_write(mr->alias,
>> +                                            addr + mr->alias_offset,
>> +                                            data, op, attrs);
>> +    }
>>       if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
>>           unassigned_mem_write(mr, addr, data, size);
>>           return MEMTX_DECODE_ERROR;
> 
> Whilst working on my q800 patches I realised that this was a similar
> problem to the one I had with my macio.alias implementation at [1]:
> except that in my case the unassigned_mem_ops mr->ops->valid.accepts()
> function was being invoked on a ROM memory region instead of an alias. I
> think this is exactly the same issue that you are attempting to fix with
> your related patch at
> https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg03190.html
> ("memory: Initialize MemoryRegionOps for RAM memory regions").

So if 2 contributors hit similar issues, there is something wrong with
the API. I don't see your use case or mine as forbidded by the
documentation in "exec/memory.h".

My patch might not be the proper fix, but we need to figure out how
to avoid others to hit the same problem, as it is very hard to debug.

At least an assertion and a comment.

> I eventually realised that I needed functions that could dispatch
> reads/writes to both IO memory regions and ROM memory regions, and that
> functionality is covered by the address_space_*() access functions.
> Using the address_space_*() functions I was then able to come up with
> the working implementation at [2] that handles accesses to both IO
> memory regions and ROM memory regions correctly.
> 
> The reason I initially used the
> memory_region_dispatch_read()/memory_region_dispatch_write() functions
> was because I could see that was how the virtio devices dispatched
> accesses through the proxy. However I'm wondering now if this API can
> only be used for terminating IO memory regions, and so the alias_offset
> that you're applying above should actually be applied elsewhere instead.

I figured out the AddressSpace API make these cases simpler, but IIRC
there is some overhead, some function tries to resolve / update
something and iterate over a list. While from the MemoryRegion API we
already know which region we want to access.

I Cc'ed Peter considering him expert in this area, but don't know else
who to ask for help on this topic...

> ATB,
> 
> Mark.
> 
> [1]
> https://github.com/mcayland/qemu/commit/56f8639fbecb8a8e323ce486e20cbe309e807419
> 
> 
> [2]
> https://github.com/mcayland/qemu/commit/c1fa32da188bb2ce23faf1728228c1714672270d
> 
> 


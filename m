Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642D534B7B3
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 15:33:07 +0100 (CET)
Received: from localhost ([::1]:35626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQ9zt-0000mG-TV
	for lists+qemu-devel@lfdr.de; Sat, 27 Mar 2021 10:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQ9xN-000893-ON
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 10:30:29 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQ9xM-0001A9-7n
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 10:30:29 -0400
Received: by mail-wr1-x430.google.com with SMTP id x7so8372878wrw.10
 for <qemu-devel@nongnu.org>; Sat, 27 Mar 2021 07:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ts9r5nEeLc5eYiglXMBnaJr+ofNbEL24BpyBfrxSXu8=;
 b=rJ3bWDkA/9i3YkDkBgxh/z0P8IwQlbXdzT9FcR7ur3SFngu8ujuymVot+JCMLlYKBs
 +ZNYMN80hDUU2ku/id+jCk8ImQBGTGK966EBqj2dIC/r7x4jbCFQJeDpHIPqKjH8071i
 cZo1cjzmsoF/Cbq6j+LVyn63bkI6DJU+bTg4zc7MAwoGRJieI5DNOSltc15iHtpqZ1GG
 bEt53E2X9kUCjd8Az9ouLVKXoKOKDyuMARRodkG9mKrQ6i028mbduOKNNtX4VUtDh7mt
 T4Rc6+D7DK7EDQU/RxPAmKnzAFmoHluMKM61JVCCdFus8AgJcd3aoLyjzRt5V3kUAYNP
 CEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ts9r5nEeLc5eYiglXMBnaJr+ofNbEL24BpyBfrxSXu8=;
 b=Fovl9LXZ+mzcm51BSMH3z6DMsEPrxqKfF7PreeLgYpJ8Vcb4pizXpjRVOzsBWTk92J
 IcEhSAwQRjTRU0uKbFknuR59bFOh8Pg1ZoIPuIFqhBbas1gPeltElueBHm9NJESLpyX+
 CApGJLHwd6zYWpHtyaeOnbp+lPNXwulp1tcM5HYBI/RQeEuIB/zxd8NXGZV6XXlCld+W
 H46ZxwhVkVPpGaNrl76kzJgpGPml8j1zY3666RseY3HuMzUrHdBLA/kgFtxxUj66ELKX
 IegehWS0bkIW+0G/uDRebVxVZ8WvyD1L59IpVySRnDqM5kZVv8OOEW2B6PsUhNr4DxM8
 UVaw==
X-Gm-Message-State: AOAM531jtithJsnVtrxM/dqGxfl2/AEXYvsG3ohO6CcrmTEoxrQKVn33
 uGkqUk9kSYzw0q15M7Tn+Bl+3orIVdSVow==
X-Google-Smtp-Source: ABdhPJzExbToZdL2NUrKgYlZQ1UKKRZmHaHoxuqtyJX8g1d4En6Orr5yrBth4BQx2WQa+HxWPlIIpg==
X-Received: by 2002:a5d:55c4:: with SMTP id i4mr19864272wrw.84.1616855426248; 
 Sat, 27 Mar 2021 07:30:26 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j13sm19170150wrt.29.2021.03.27.07.30.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Mar 2021 07:30:25 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] memory: Fix memory_region 'priority' property sign
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Alexey Kardashevskiy
 <aik@ozlabs.ru>, KONRAD Frederic <frederic.konrad@adacore.com>
References: <20180405012241.25714-1-f4bug@amsat.org>
 <20180405012241.25714-4-f4bug@amsat.org>
 <CAAdtpL4DPzLhr76JCibG=VTQWsVg8Y-zchzQApjkoEPTePRzmQ@mail.gmail.com>
Message-ID: <2d6b3845-ecbf-dcc5-927a-558fd77604fb@amsat.org>
Date: Sat, 27 Mar 2021 15:30:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAAdtpL4DPzLhr76JCibG=VTQWsVg8Y-zchzQApjkoEPTePRzmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/27/21 2:57 PM, Philippe Mathieu-Daudé wrote:
> ping?

Bah this doesn't apply anymore (memory.c moved to softmmu/).

I'll respin.

> On Thu, Apr 5, 2018 at 3:23 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Priorities can be negative, fix this limitation.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  memory.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/memory.c b/memory.c
>> index e77f9e4036..eaa5fa7f23 100644
>> --- a/memory.c
>> +++ b/memory.c
>> @@ -1258,7 +1258,7 @@ static void memory_region_initfn(Object *obj)
>>                          memory_region_get_addr,
>>                          NULL, /* memory_region_set_addr */
>>                          NULL, NULL, &error_abort);
>> -    object_property_add(OBJECT(mr), "priority", "uint32",
>> +    object_property_add(OBJECT(mr), "priority", "int32",
>>                          memory_region_get_priority,
>>                          NULL, /* memory_region_set_priority */
>>                          NULL, NULL, &error_abort);
>> --
>> 2.16.3
>>
> 


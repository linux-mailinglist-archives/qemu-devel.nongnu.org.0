Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E83C3EA2E5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 12:18:48 +0200 (CEST)
Received: from localhost ([::1]:39286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7nS-0002cb-QY
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 06:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mE7mV-0001ot-09; Thu, 12 Aug 2021 06:17:47 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:37466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mE7mT-0002tu-8v; Thu, 12 Aug 2021 06:17:46 -0400
Received: by mail-pl1-x62e.google.com with SMTP id n12so5989202plf.4;
 Thu, 12 Aug 2021 03:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K6pWg1pd4BLfpPSAf6O12YVzzPiqveCHzZkSSL+wvxY=;
 b=T8E8yYY7+SoVpMy0IeFYP/ETsfcg8ixJWAZi59S+wnN0PIeUNr7y0aunuLEamQtNpT
 WBto8vmpadfNlylQPx8eWSh61eonx1vEwMHpkrtfZoC2WMFverS6KIPelAoy/20tc5wd
 7TNpO3x72qE7C+ckqSmhrG2G+jxWyodu+5txo4KTM4CGBTD7GXG2rHbiPv+KbQLoePpb
 f2NDeq1m3Q8e5RXYGrNuQw8QTonBDN+AZzWPZ+3K7x+VEi6VfHwZphrDKmT36taiu+5Y
 LsdNSZnZ6rEE/aM6/0M2N/rVKCfkUH/S+Q7tqqefOBJ77cBIZG3cN1IumjyLtWYMPXrp
 SI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K6pWg1pd4BLfpPSAf6O12YVzzPiqveCHzZkSSL+wvxY=;
 b=crR2acEY8SkodfrXcsoPcUl156yezRHP45G2xWi3jT2CI9FwGL6MbRafOMihoc/eV3
 gpykMKvydeCBaHoZku4QzFyLeEbM7dtl8bvTWkm7evAOaAlFrx5zwNvDTtwAnrn186PI
 P2Q74zMWE2n7KmFZA5crMUMh574yU5jdp8Ck9IZNWcli2CVvfPLTX3R11YxGws/11as6
 hZq9Y7lBeGsW1wnpjJ+Qp9pEd2TyNIzH3oSLIdzijE9Cmm+957FjrfHlGBGrCsp3inv0
 XLY5MQHJtrlG9b0Tzan+zh13BMuPNKek4Rw9KG2UwYk8WCSj/mwsPlAAHKwrCtfhGX1B
 E/Aw==
X-Gm-Message-State: AOAM531GZCGQLUeWBUubr9qf7VhD9mGTpZ6+y8bTLkhBwf9pVcSTCm67
 k6oiTndgIzRREAP+UprmXdg=
X-Google-Smtp-Source: ABdhPJwqNS9bSl4EwetO5CFJUdeuauEagamsb4vpdOI2hJ9N98XynavWOVMTlN3NpjTqZShgPdfn5g==
X-Received: by 2002:a65:47c3:: with SMTP id f3mr6755pgs.85.1628763462843;
 Thu, 12 Aug 2021 03:17:42 -0700 (PDT)
Received: from [192.168.10.222] ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id d17sm2773467pfn.110.2021.08.12.03.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 03:17:42 -0700 (PDT)
Subject: Re: [PATCH 12/19] target/ppc/pmu_book3s_helper.c: enable PMC1 counter
 negative EBB
To: Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-13-danielhb413@gmail.com> <YRH6IysrDvn/GJvQ@yekko>
 <6a10c0a7-1c4f-0d24-f2cc-12666e590739@gmail.com> <YRNGo8CnfUSC/bQs@yekko>
 <4df4dacf-ba9b-f86e-8510-7c084420e974@gmail.com> <YRSX+kRCEh1oQjWP@yekko>
 <47018114-2249-0fe9-cb87-0ac35ed1e49d@linaro.org>
 <d63f0103-5899-b4ce-baa1-32d05676414f@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <d2f1f35c-fc82-0b27-b41e-0b1055ecc2e8@gmail.com>
Date: Thu, 12 Aug 2021 07:17:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d63f0103-5899-b4ce-baa1-32d05676414f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=danielhb413@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 gustavo.romero@linaro.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/12/21 1:56 AM, Richard Henderson wrote:
> On 8/11/21 6:45 PM, Richard Henderson wrote:
>> On 8/11/21 5:39 PM, David Gibson wrote:
>>>> I mean, nothing is stopping us from calculating cycles using time, but in the
>>>> end we would do the same thing we're already doing today.
>>>
>>> Oh.. ok.  I had assumed that icount worked by instrumenting the
>>> generate TCG code to actually count instructions, rather than working
>>> off the time.
>>
>> David, you're right, icount instruments the generated tcg code.
>> You also have to add -icount to the command-line.
> 
> Oh, and btw, icount disables multi-threaded tcg, so you're going to be running that guest in round-robin mode.
> 
> Icount affects so many aspects of qemu that I really do not think it is the best option for a PMU.

Using icount in the PMU is my fallback plan. I spent some time trying to
count instructions using translationOps but never got it right. I got
up to a point where the tests were counting instructions for the first
time it was run in the guest, then nothing else counted in consecutive
runs.

I was able to figure out that it had to do with how the translation block
works. If a previously ran TB was found via lookup then the translationOps
callbacks I was using weren't being called. I know that I was missing a
piece of info there, but since I'm trying to deal with other aspects of the
PMU logic I fell back into using icount to get things of the ground.

All this said ....

> 
> If you want to count instructions retired, then just do that.  Stuff values into tcg_gen_insn_start so they're available for exception unwind, and otherwise decrement the counter at the end of a TB.

... I don't bother giving this a try. Can you clarify what do you mean
with "exception unwind"?

I tried something similar with tcg_gen_insn_start() (called via ppc_tr_insn_start()).
This this ops is called inside translator_loop(), and translator_loop() isn't
being ran if TB_lookup returns the TB, I was observing the behavior I
described above of a test counting instructions in its first run only.


> 
> If you really must interrupt exactly at 0 (and not simply at some point past underflow), then we can adjust the tb lookup logic to let you reduce tb->cflags.CF_COUNT_MASK in cpu_get_tb_cpu_state.

That would be good, but depending on the amount of work I would consider doing
this is a follow-up of this work. It's ok if the PMU overflows a bit instructions
for our current purposes ATM.


Thanks,


Daniel

> 
> 
> r~


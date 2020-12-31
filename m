Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86852E8147
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 17:46:11 +0100 (CET)
Received: from localhost ([::1]:59432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv15W-0000pw-HQ
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 11:46:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kv12r-0007wj-9H
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 11:43:25 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kv12m-0002ir-83
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 11:43:24 -0500
Received: by mail-pg1-x529.google.com with SMTP id e2so13330156pgi.5
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 08:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=noNozVlsgUjFIH/AoiOJjQdqf5k9zh54/Sw++eiy3iU=;
 b=bfZ7ZWspBav902MsSSp8D9s3S05B75h6RwpqLQwx4EsINQZbhCrDNBTQFvMF2ptKi2
 JXbjmjMHOLwkO9ZBgS7Km4ZKh0lkQdVv/AtA9cSeaex/MBKj1JSrDMSidblBge/WLnT6
 bKqz7nNNfITblr08snBysI7ecEfLu5nlaR+PitRZGKu4bV47IED1BmTIfHApGRAxmFmU
 BoeBDilt0/CV4LMu107yHUBB9QpR4c+WoYiDY+8SZTW6KeJV/eD9h50jRBBpFlnpKzkP
 FoTEdjyTdVLc59zS1wxrOp+u7DoYXGjpwINRWt0hRYUA0TZKax7vj8YT7UfFNARdmv5A
 pUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=noNozVlsgUjFIH/AoiOJjQdqf5k9zh54/Sw++eiy3iU=;
 b=uAgCXGG4otNWPjwFGFLlSEiZgLZrD7EvkwQ7JyNgkhStCkSpQLmsktiwK2kFuH1r9L
 6hKdIOIYQdonZEC1ZdTWn36C8dg05gJghE8IOlAx4Vc44ec+emFLGq+vU7X5xyf5YQK7
 TUkPydvfEEvAnRPQV+fH3lAeGXWIP3C5AcqIvt7jkDOr+H81xPD6V3rHy6+kFuM1W9c4
 dSs6CP9lqoYUMS2agQdwI3CfKjvtSgpxGvLyi+RKcVIOLsLMS0Do97aC6nH/6YA+BRev
 kImXo0UhQPuGZVsSa4e262lBTRLYD8+lO/CnJpo23kbz/Q9ZfVcaHiD+yh2hwPxL+I9N
 2qtQ==
X-Gm-Message-State: AOAM533wyOniikS6ersQ61KzIO/E4A8kYFkaqWtBB0yrSDf2FDWhjM0K
 qOTUBPAJ6SruK32Wv8XqbenHI1UaGb9CLg==
X-Google-Smtp-Source: ABdhPJw36mT+CH5ZF+8EZPIkcq/++IFjUvDbm6fBmiClv/7QmELDjYimRwlxn+PQtOUokGd32I1YHg==
X-Received: by 2002:a63:2352:: with SMTP id u18mr17739099pgm.385.1609432998532; 
 Thu, 31 Dec 2020 08:43:18 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 t5sm10938200pjr.22.2020.12.31.08.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Dec 2020 08:43:17 -0800 (PST)
Subject: Re: [PATCH 1/3] target/arm: keep translation start level unsigned
To: =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi@remlab.net>, qemu-arm@nongnu.org
References: <7884934.NyiUUSuA9g@basile.remlab.net>
 <c2af03a8-9f56-fb43-485c-91ec0fbdef31@linaro.org>
 <002743e6-10d3-88b3-961a-8571efb4d1ed@linaro.org>
 <9468010.vzF1F9XyNR@philogene>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1b14279c-f620-5c03-b25c-a52fa370cc8e@linaro.org>
Date: Thu, 31 Dec 2020 08:43:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9468010.vzF1F9XyNR@philogene>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.399,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, remi.denis.courmont@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/31/20 1:59 AM, Rémi Denis-Courmont wrote:
> Le jeudi 31 décembre 2020, 00:38:14 EET Richard Henderson a écrit :
>> On 12/30/20 2:10 PM, Richard Henderson wrote:
>>> On 12/18/20 6:33 AM, remi.denis.courmont@huawei.com wrote:
>>>> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
>>>>
>>>> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
>>>> ---
>>>>
>>>>  target/arm/helper.c | 14 ++++++--------
>>>>  1 file changed, 6 insertions(+), 8 deletions(-)
>>>
>>> The patch does more than what is described above.
>>>
>>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>>> index df195c314c..b927e53ab0 100644
>>>> --- a/target/arm/helper.c
>>>> +++ b/target/arm/helper.c
>>>>
>>>> @@ -10821,17 +10821,12 @@ do_fault:
>>>>   * Returns true if the suggested S2 translation parameters are OK and
>>>>   * false otherwise.
>>>>   */
>>>>
>>>> -static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
>>>> +static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint32_t
>>>> level,
>>>>
>>>>                                 int inputsize, int stride)
>>>>  
>>>>  {
>>>>  
>>>>      const int grainsize = stride + 3;
>>>>      int startsizecheck;
>>>>
>>>> -    /* Negative levels are never allowed.  */
>>>> -    if (level < 0) {
>>>> -        return false;
>>>> -    }
>>>> -
>>>
>>> I would expect this to be the only hunk from the patch description. 
>>> Probably changing this negative check to a >= 3 check.
>>
>> Having read the next patch, I think you should drop this type change.
>>
>>>> @@ -11203,7 +11201,7 @@ static bool get_phys_addr_lpae(CPUARMState *env,
>>>> uint64_t address,>> 
>>>>          if (!aarch64 || stride == 9) {
>>>>          
>>>>              /* AArch32 or 4KB pages */
>>>>
>>>> -            startlevel = 2 - sl0;
>>>> +            startlevel = (2 - sl0) & 3;
>>
>> This hunk belongs with the next patch, implementing TTST, and should be
>> conditional.  I.e.
>>
>>     if (stride == 9) {
>>         startlevel = 2 - sl0;
>>         if (aarch64 &&
>>             cpu_isar_feature(aa64_st, env_archcpu(env)) {
>>             startlevel &= 3;
>>         }
> 
> You can do that but:
> 1) Nothing in the spec says that SL0 == b11 without ST means start level -1. 
> It's undefined, and I don't see any reasons to treat it differently than with 
> ST.

By that logic there's no reason to treat it differently at all; you could drop
the feature check entirely.  In lieu, -1 makes a decent error indicator.

> 2) Functionally, checking for ST seems to belong naturally within 
> check_s2_mmu_setup() in this particular case.

I guess.  I'll leave it to Peter's preference.


r~


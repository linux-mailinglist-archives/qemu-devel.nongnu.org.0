Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32833EAC5E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 23:25:15 +0200 (CEST)
Received: from localhost ([::1]:34954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEICQ-0001Tg-J0
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 17:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mEIBP-0000fY-K9; Thu, 12 Aug 2021 17:24:11 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:38713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mEIBN-0003AO-Vz; Thu, 12 Aug 2021 17:24:11 -0400
Received: by mail-pl1-x62a.google.com with SMTP id a5so9079750plh.5;
 Thu, 12 Aug 2021 14:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6CnVN2S5064xUHRCdiPXFnzyDGIc187+TyFRuzh78EQ=;
 b=Xk1I8J5YlkwewqJi7o+Wmvm+W/w87C7nrtvWjIvukHdnP7DzuHX4hlTCtiTnIVPw3y
 g7bq/H7cRqT1z+x8t2AX2HuTshmjRACUhnNWRTYKYi+lqARynWeizDzF13D2C7D8GjbP
 MQn0pjVvB5l3VK3OEwbn1aYbxs6tGcIdLSquL1P9jLQ3zu95aImcSs9RR4wnQKsNgNmF
 vg3LYXuLOEpj6m9oS3351Mf9d8y90AbctVluQiN+lQ8eY2AEU6loLWG67kKp7VZqDDla
 aBPB+t/kBMmFo6D193dDqpDO0ytT7ZXxYgjWd66QQIPmQK3WgMmDau4xkHW5HyQEoif9
 YKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6CnVN2S5064xUHRCdiPXFnzyDGIc187+TyFRuzh78EQ=;
 b=ckmifoKuLL2srKyjIHIOhZadSZVIUO4aI/80IoR0Wc7/bcQKuFbu8loSErySiTN73p
 Bygz3M+NA9zcB2h1v7zhpq6eZc+tc75tH8ifbBHQiUmehhuo9tktPYDkp9PO0eiF8eMb
 p0oTR5cjavM8TnDvJwKleCmp8ohNSaJa7ZuVpV4sDRjgLS1lXtSqb/udHjMgLxdbXU2I
 asbcp4/YaucXUnE7QbiFbYgrBenTOCgp3m8PI7lozGf6yROL+ILTvdZ0M1e5nUBWpd6x
 2mSrPWN7aVOrFREEdchTsn3SInVk2FGtn2ip8CLAVt2WZiPiG5ntvQWUo87WRPz/IQ7l
 AiRA==
X-Gm-Message-State: AOAM533yTgqmAnLKdlf6ihLWSpiacAy+rcWwC0lis7PzzvEWVdSX3vlX
 AnmzdKx5ksy8PnE7fo3sAG8=
X-Google-Smtp-Source: ABdhPJyBNKWqstQgrzv5Y7jATA2KSdmbv2UWZuKs8Yn19nMsyuSZko3ojYIAIXW5gRkNOKYCdFjhRg==
X-Received: by 2002:a62:7f09:0:b029:3c8:584:72d with SMTP id
 a9-20020a627f090000b02903c80584072dmr5949912pfd.80.1628803447959; 
 Thu, 12 Aug 2021 14:24:07 -0700 (PDT)
Received: from [192.168.10.222] ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id u21sm4992879pgk.57.2021.08.12.14.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 14:24:07 -0700 (PDT)
Subject: Re: [PATCH 12/19] target/ppc/pmu_book3s_helper.c: enable PMC1 counter
 negative EBB
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-13-danielhb413@gmail.com> <YRH6IysrDvn/GJvQ@yekko>
 <6a10c0a7-1c4f-0d24-f2cc-12666e590739@gmail.com> <YRNGo8CnfUSC/bQs@yekko>
 <4df4dacf-ba9b-f86e-8510-7c084420e974@gmail.com> <YRSX+kRCEh1oQjWP@yekko>
 <47018114-2249-0fe9-cb87-0ac35ed1e49d@linaro.org>
 <d63f0103-5899-b4ce-baa1-32d05676414f@linaro.org>
 <d2f1f35c-fc82-0b27-b41e-0b1055ecc2e8@gmail.com>
Message-ID: <7f9ee790-3f5a-6161-627b-0c4313a08bca@gmail.com>
Date: Thu, 12 Aug 2021 18:24:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d2f1f35c-fc82-0b27-b41e-0b1055ecc2e8@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=danielhb413@gmail.com; helo=mail-pl1-x62a.google.com
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



On 8/12/21 7:17 AM, Daniel Henrique Barboza wrote:
> 
> 
> On 8/12/21 1:56 AM, Richard Henderson wrote:
>> On 8/11/21 6:45 PM, Richard Henderson wrote:
>>> On 8/11/21 5:39 PM, David Gibson wrote:
>>>>> I mean, nothing is stopping us from calculating cycles using time, but in the
>>>>> end we would do the same thing we're already doing today.
>>>>
>>>> Oh.. ok.  I had assumed that icount worked by instrumenting the
>>>> generate TCG code to actually count instructions, rather than working
>>>> off the time.
>>>
>>> David, you're right, icount instruments the generated tcg code.
>>> You also have to add -icount to the command-line.
>>
>> Oh, and btw, icount disables multi-threaded tcg, so you're going to be running that guest in round-robin mode.
>>
>> Icount affects so many aspects of qemu that I really do not think it is the best option for a PMU.
> 
> Using icount in the PMU is my fallback plan. I spent some time trying to
> count instructions using translationOps but never got it right. I got
> up to a point where the tests were counting instructions for the first
> time it was run in the guest, then nothing else counted in consecutive
> runs.
> 
> I was able to figure out that it had to do with how the translation block
> works. If a previously ran TB was found via lookup then the translationOps
> callbacks I was using weren't being called. I know that I was missing a
> piece of info there, but since I'm trying to deal with other aspects of the
> PMU logic I fell back into using icount to get things of the ground.


So, I made an attempt to remove all icount() references from the PMU code and instead
did the following (posting just the relevant diff):


+
+void helper_insns_inc(CPUPPCState *env)
+{
+    env->pmu_insns_count++;
+}
+
+void helper_insns_dec(CPUPPCState *env)
+{
+    env->pmu_insns_count--;
+}
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 60f35360b7..c56c656694 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -8689,6 +8689,7 @@ static void ppc_tr_tb_start(DisasContextBase *db, CPUState *cs)
  
  static void ppc_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
  {
+    gen_helper_insns_inc(cpu_env);
      tcg_gen_insn_start(dcbase->pc_next);
  }
  
@@ -8755,6 +8756,8 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
          return;
      }
  
+    gen_helper_insns_dec(cpu_env);
+
      /* Honor single stepping. */
      sse = ctx->singlestep_enabled & (CPU_SINGLE_STEP | GDBSTUB_SINGLE_STEP);
      if (unlikely(sse)) {


And then I used 'env->pmu_insns_count' to update the instruction counters. And it's
working, with a slightly better performance than we have with the icount()
version. I'm not sure why it's working now since I tried something very similar
before and it didn't. Figures.

It's still overshooting the instructions a bit, but then there's the optimization
you mentioned previously with the tb lookup logic that could be done to improve
that as well.


I'm not sure if this is in line or close with what you proposed, but it's already
better than the icount version that I posted here.


Thanks,


Daniel


> 
> All this said ....
> 
>>
>> If you want to count instructions retired, then just do that.  Stuff values into tcg_gen_insn_start so they're available for exception unwind, and otherwise decrement the counter at the end of a TB.
> 
> ... I don't bother giving this a try. Can you clarify what do you mean
> with "exception unwind"?
> 
> I tried something similar with tcg_gen_insn_start() (called via ppc_tr_insn_start()).
> This this ops is called inside translator_loop(), and translator_loop() isn't
> being ran if TB_lookup returns the TB, I was observing the behavior I
> described above of a test counting instructions in its first run only.
> 
> 
>>
>> If you really must interrupt exactly at 0 (and not simply at some point past underflow), then we can adjust the tb lookup logic to let you reduce tb->cflags.CF_COUNT_MASK in cpu_get_tb_cpu_state.
> 
> That would be good, but depending on the amount of work I would consider doing
> this is a follow-up of this work. It's ok if the PMU overflows a bit instructions
> for our current purposes ATM.
> 
> 
> Thanks,
> 
> 
> Daniel
> 
>>
>>
>> r~


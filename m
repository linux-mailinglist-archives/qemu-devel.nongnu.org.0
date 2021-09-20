Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40538410E2A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 03:31:16 +0200 (CEST)
Received: from localhost ([::1]:58134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS89K-0002vf-0h
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 21:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS87l-00022M-Aa
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 21:29:37 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:40625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS87j-0007j9-Gt
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 21:29:37 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y8so14717736pfa.7
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 18:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m1TpNJVrlHBHiCiYYT5v53xLRc3b7n3P3zzCnthaS9g=;
 b=ICjWb3f4neqy1mmvsUIH3BMneZyUJpLce67etiEVnvG43h+/73nnLuSA2RFQnm9/0q
 DkWe52jFqRerEuaUspUSvNbPUvca8mLHQIXjxmKsuvVx7Cyj3XTALyd5RHK2ittM3XtQ
 2dUinXngskx8619ilOq0rc3L5WeXKhUQoILsm3zGPT/0WaiuLmL2I+jUQd2LyL9uWkhJ
 Xe8dZz/jPJAdHjx2GCj7l4EkeXZgXh0X1vUnNKNJfRDoj3SqPdZ/YyhKTHiKJohpkysq
 BDQi4Nv1msGq5eIVhetaS0MpfdScqySAqMU4/WA8unqkabCxHm8AnNdmWBS7ByE0olAK
 Bexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m1TpNJVrlHBHiCiYYT5v53xLRc3b7n3P3zzCnthaS9g=;
 b=7PAiOeS+j3eLGP+UM7oSXIAk8qSdR7Iz1sosnvg4TNF8n1Dqkw9t0jcAuRx44i7IRN
 uf1FAVSzVRkMeP20OqeoA3Ty3bAz8hlqUvI4dGVlBciDQy9CmRPaxvFSv2GNYC8j0fOb
 gh3XlpE/azvBGa3Igk/cNUqPXCBl+OYQEc71K17/RBVPH3CyZw8q4IbCk8UD/INpRv4G
 vfTQw+ocsiSiabr7f/t0lAkzpeW5vc8UrAiQQGwwHNcDEQJ3Fsx2Ea1USt02y3In6XrJ
 jDI2Qh4d9u/ZSptSInkgPkl/6O3b6DOw+J7ZGnzy5tif5NXqk1yt7tHaAhqOpSnE0F1I
 o4/w==
X-Gm-Message-State: AOAM531kTMOrz8RUwZ7yOTOHCQY09NMQxrV66tduzk0YlhphZxVpskzB
 dD6M1Gup7/pUAqjk+u5lQmaGeA==
X-Google-Smtp-Source: ABdhPJxN8P86RkCTLV8zfnQMp7wKCHyJetCs+ocGZ396z2UQQ9D8pjWkKTRfhf8L4l9ATuqVynFKEw==
X-Received: by 2002:a05:6a00:1347:b0:440:3a98:a9cd with SMTP id
 k7-20020a056a00134700b004403a98a9cdmr22998421pfu.58.1632101373615; 
 Sun, 19 Sep 2021 18:29:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id x19sm12506081pfa.104.2021.09.19.18.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 18:29:33 -0700 (PDT)
Subject: Re: [PATCH v2 5/8] target/arm: Take an exception if PC is misaligned
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-6-richard.henderson@linaro.org>
 <CAFEAcA9Eg1gPuNR1DKPB8Yk1VJ=xADTEDim=jrwFN6mhVdV=Nw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <af2e92e3-ef2d-50a8-bec4-6c1191f3ac27@linaro.org>
Date: Sun, 19 Sep 2021 18:29:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Eg1gPuNR1DKPB8Yk1VJ=xADTEDim=jrwFN6mhVdV=Nw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/21 6:45 AM, Peter Maydell wrote:
> On Sat, 21 Aug 2021 at 21:00, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> For A64, any input to an indirect branch can cause this.
>>
>> For A32, many indirect branch paths force the branch to be aligned,
>> but BXWritePC does not.  This includes the BX instruction but also
>> other interworking changes to PC.  Prior to v8, this case is UNDEFINED.
>> With v8, this is CONSTRAINED UNPREDICTABLE and may either raise an
>> exception or force align the PC.
>>
>> We choose to raise an exception because we have the infrastructure,
>> it makes the generated code for gen_bx simpler, and it has the
>> possibility of catching more guest bugs.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/helper.h        |  1 +
>>   target/arm/syndrome.h      |  5 +++++
>>   target/arm/tlb_helper.c    | 24 +++++++++++++++++++++++
>>   target/arm/translate-a64.c | 21 ++++++++++++++++++--
>>   target/arm/translate.c     | 39 +++++++++++++++++++++++++++++++-------
>>   5 files changed, 81 insertions(+), 9 deletions(-)
>>
>> diff --git a/target/arm/helper.h b/target/arm/helper.h
>> index 248569b0cd..d629ee6859 100644
>> --- a/target/arm/helper.h
>> +++ b/target/arm/helper.h
>> @@ -47,6 +47,7 @@ DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
>>   DEF_HELPER_2(exception_internal, void, env, i32)
>>   DEF_HELPER_4(exception_with_syndrome, void, env, i32, i32, i32)
>>   DEF_HELPER_2(exception_bkpt_insn, void, env, i32)
>> +DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
>>   DEF_HELPER_1(setend, void, env)
>>   DEF_HELPER_2(wfi, void, env, i32)
>>   DEF_HELPER_1(wfe, void, env)
>> diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
>> index 54d135897b..e9d97fac6e 100644
>> --- a/target/arm/syndrome.h
>> +++ b/target/arm/syndrome.h
>> @@ -275,4 +275,9 @@ static inline uint32_t syn_illegalstate(void)
>>       return (EC_ILLEGALSTATE << ARM_EL_EC_SHIFT) | ARM_EL_IL;
>>   }
>>
>> +static inline uint32_t syn_pcalignment(void)
>> +{
>> +    return (EC_PCALIGNMENT << ARM_EL_EC_SHIFT) | ARM_EL_IL;
>> +}
>> +
>>   #endif /* TARGET_ARM_SYNDROME_H */
>> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
>> index 3107f9823e..25c422976e 100644
>> --- a/target/arm/tlb_helper.c
>> +++ b/target/arm/tlb_helper.c
>> @@ -9,6 +9,7 @@
>>   #include "cpu.h"
>>   #include "internals.h"
>>   #include "exec/exec-all.h"
>> +#include "exec/helper-proto.h"
>>
>>   static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
>>                                               unsigned int target_el,
>> @@ -123,6 +124,29 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>>       arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
>>   }
>>
>> +void helper_exception_pc_alignment(CPUARMState *env, target_ulong pc)
>> +{
>> +    int target_el = exception_target_el(env);
>> +
>> +    if (target_el == 2 || arm_el_is_aa64(env, target_el)) {
>> +        /*
>> +         * To aarch64 and aarch32 el2, pc alignment has a
>> +         * special exception class.
>> +         */
>> +        env->exception.vaddress = pc;
>> +        env->exception.fsr = 0;
>> +        raise_exception(env, EXCP_PREFETCH_ABORT, syn_pcalignment(), target_el);
>> +    } else {
>> +        /*
>> +         * To aarch32 el1, pc alignment is like data alignment
>> +         * except with a prefetch abort.
>> +         */
>> +        ARMMMUFaultInfo fi = { .type = ARMFault_Alignment };
>> +        arm_deliver_fault(env_archcpu(env), pc, MMU_INST_FETCH,
>> +                          cpu_mmu_index(env, true), &fi);
> 
> I don't think you should need to special case AArch64 vs AArch32 like this;
> you can do
>     env->exception.vaddress = pc;
>     env->exception.fsr = the_fsr;
>     raise_exception(env, EXCP_PREFETCH_ABORT, syn_pcalignment(), target_el);
> 
> for both. AArch64/AArch32-Hyp exception entry will ignore exception.fsr,
> and AArch32-not-Hyp entry will ignore exception.syndrome.

Not true.  The latter case still requires syndrome with EC_INSNABORT, etc.

I played with this a bit, but IMO the cleanest solution is the original patch.

> We could probably do with factoring out the
> "if (something) { fsr = arm_fi_to_lfsc(&fi) }  else { fsr =
> arm_fi_to_sfsc(&fi); }"
> logic which we currently duplicate in arm_deliver_fault() and
> do_ats_write() and arm_debug_exception_fsr() and also want here.
> (NB I haven't checked these really are doing exactly the same
> condition check...)

It is exactly the same two out of three; the debug_exception one is worded slightly 
different.  I think it would come out the same if one refactored 
arm_s1_regime_using_lpae_format to not use the mmu_idx but instead regime_el(mmu_idx).


r~


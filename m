Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B8E38007D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 00:47:31 +0200 (CEST)
Received: from localhost ([::1]:46428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhK78-0004ll-9B
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 18:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhK5Y-0003uF-3h
 for qemu-devel@nongnu.org; Thu, 13 May 2021 18:45:52 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:41673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhK5U-0002bI-OZ
 for qemu-devel@nongnu.org; Thu, 13 May 2021 18:45:51 -0400
Received: by mail-qk1-x72a.google.com with SMTP id l129so27131202qke.8
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 15:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2mr+h1iefSuTDc8zgl91UCVfMzBr5SXYbeLgPaW/3H0=;
 b=PPbBk4NzDbsRQlkwWzETb8GlHxVjtDhFoAEmWQeeaZnQUz2WPQHnDwzKgqabWgZJpx
 QlLI4/3amTMvUwbWtCS2QpbziqQjrSvgz7K3h948mx8gzJiAh35KdG1Jr7fAnEo1PLEQ
 aW7KfeAOe/GkXpDu/CJK90mxqEReolNPCVCqtVk3zwLJ4vVkvjmQNR9cwuZUSe3Qmun5
 1B7PIC2rXwRrODflOYcK+546aHTL0PrjHa5h7u3GvBnusUnij0ny6G3x9Oi6yujCh6mS
 D1YcG8ib1YN67tS3mpM5LUc4ozA/61N4l4W7vDb3rtwC8cpRz9ihcz5mySAl1N2m+P8f
 Lw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2mr+h1iefSuTDc8zgl91UCVfMzBr5SXYbeLgPaW/3H0=;
 b=XC2bcf8DjBfDjuJnsEsNKnS5Ofn25SeRqAT/LJu2MU6yHTXtt/Pqa/w8nwyXqvt8zJ
 M3/gnw34KW5Jkt5FdH9VgoDT9ZvKDi1qifhNCSG2QkOl8GumfFdT0efBWRcwoCtEPCd7
 vmBIRuzBqZ1UFNIrxh9Oa1l7isuWzgqRrLYBJdMNYkecSZXn4Ia01D3VAnOwwZ6lrOMl
 HFz10VzTWQP6WMoADOd9KrZ+JDHsmL1UdCqC14HhkI1eSDh6A1FI1TxwVHUjNR6uVj1u
 6mqgWhSCa+PGoOhAgBjrptqLlB8BFxr8QDEY/eNe/xLF6SMZtqYFmzSBX9afClU8S/sE
 Wbcw==
X-Gm-Message-State: AOAM533O+jEWjcdX99aCCWs5pk0zk0PAEvLeqo7gxwM/dWmpQJe1C2FK
 Sxpq3/kYvmeGfbJsU+iV2eZ7Jg==
X-Google-Smtp-Source: ABdhPJwafTF5Oh/9jYf6ofnv+0pBJVqcVzTmbnq0fVnWz3VrZYoN40xDKEz5+D/+tXad/LGOyKXxYw==
X-Received: by 2002:a37:7782:: with SMTP id
 s124mr40845786qkc.305.1620945946964; 
 Thu, 13 May 2021 15:45:46 -0700 (PDT)
Received: from [192.168.183.155] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id f132sm3656632qke.104.2021.05.13.15.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 15:45:46 -0700 (PDT)
Subject: Re: [PATCH 07/11] target/ppc: added KVM fallback to fpscr manipulation
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-8-bruno.larsen@eldorado.org.br>
 <a9ac8b35-faae-167d-ff78-4b7ddd8f75c9@linaro.org>
 <c2fc1562-9d97-0d6f-5d24-632c2a9006dd@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a12f0631-dd9c-aa9f-41d6-eb0422416a0a@linaro.org>
Date: Thu, 13 May 2021 17:45:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c2fc1562-9d97-0d6f-5d24-632c2a9006dd@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 11:36 AM, Bruno Piazera Larsen wrote:
> 
> On 12/05/2021 15:20, Richard Henderson wrote:
>> On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
>>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>>> index 104a308abb..a8a720eb48 100644
>>> --- a/target/ppc/kvm.c
>>> +++ b/target/ppc/kvm.c
>>> @@ -2947,3 +2947,17 @@ bool kvm_arch_cpu_check_are_resettable(void)
>>>   {
>>>       return true;
>>>   }
>>> +
>>> +void kvmppc_store_fpscr(CPUPPCState *env, uint64_t arg, uint32_t mask)
>>> +{
>>> +    CPUState *cs = env_cpu(env);
>>> +    struct kvm_one_reg reg;
>>> +    int ret;
>>> +    reg.id = KVM_REG_PPC_FPSCR;
>>> +    reg.addr = (uintptr_t) &env->fpscr;
>>> +    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
>>> +    if (ret < 0)
>>> +    {
>>> +        fprintf(stderr, "Unable to set FPSCR to KVM: %s", strerror(errno));
>>> +    }
>>> +}
>>
>> This is all unnecessary.  All you need to do is store to env->fpscr and the 
>> value will be synced back with kvm_put_fp.
>>
>> I'll note that some of the trouble you may be having with extracting 
>> helper_store_fpscr to a ppc_store_fpscr function is due to an existing bug in 
>> the tcg code:
>>
>> Storing to fpscr should *never* raise an exception -- see MTFSF, MTFSB0, 
>> MTFSB1.  Thus the mucking about with cs->exception_index and env->error_code 
>> is incorrect.
>>
>> In addition, the masking is being done weirdly and could use a complete 
>> overhaul.
>>
>> This could all be rewritten as
>>
>> -- %< -- cpu.h
>>
>>  /* Invalid operation exception summary */
>> - #define fpscr_ix ((env->fpscr) & ((1 << FPSCR_VXSNAN) ...
>> + #define FPSCR_IX  ((1 << FPSCR_VXSNAN) | ...)
>>
>> -- %< -- cpu.c
>>
>> // move fpscr_set_rounding_mode here
>>
>> void ppc_store_fpscr(CPUPPCState *env, target_ulong val)
>> {
>>     /* Recompute exception summary state. */
>>     val &= ~(FP_VX | FP_FEX);
>>     if (val & FPSCR_IX) {
>>         val |= FP_VX;
>>     }
>>     if ((val >> FPSCR_XX) & (val >> FPSCR_XE) & 0x1f) {
>>         val |= FP_FEX;
>>     }
>>     env->fpscr = val;
>>     if (tcg_enabled()) {
>>         fpscr_set_rounding_mode(env);
>>     }
>> }
>>
>> -- %< -- fpu_helper.c
>>
>> void helper_store_fpscr(CPUPPCState *env, target_ulong val,
>>                         uint32_t nibbles)
>> {
>>     target_ulong mask = 0;
>>
>>     /* TODO: Push this expansion back to translation time. */
>>     for (int i = 0; i < sizeof(target_ulong) * 2; ++i) {
>>         if (nibbles & (1 << i)) {
>>             mask |= (target_ulong)0xf << (4 * i);
>>         }
>>     }
>>
>>     val = (val & mask) | (env->fpscr & ~mask);
>>     ppc_store_fpscr(env, val);
>> }
> That expansion can't be moved to translation time, because gdbstub would also 
> need that code in a variety of functions, so better to keep it in that central 
> location,
>>
>> void helper_fpscr_clrbit(CPUPPCState *env, uint32_t bit)
>> {
>>     uint32_t mask = 1u << bit;
>>     if (env->fpscr & mask) {
>>         ppc_store_fpscr(env, env->fpscr & ~mask);
>>     }
>> }
>>
>> void helper_fpscr_setbit(CPUPPCState *env, uint32_t bit)
>> {
>>     uint32_t mask = 1u << bit;
>>     if (!(env->fpscr & mask)) {
>>         ppc_store_fpscr(env, env->fpscr | mask);
>>     }
>> }
>>
>> There are a couple of other uses of fpscr_set_rounding_mode, where the 
>> softfloat value is changed temporarily (do_fri, VSX_ROUND). These should 
>> simply save the previous softfloat value (using get_float_rounding_mode) 
>> around the operation instead of re-computing from fpscr.
>>
>> Which leaves us with exactly one use of fpscr_set_rounding_mode, which can 
>> then be moved to cpu.c next to ppc_store_fpscr.
>>
>>
>> r~
> 
> I was implementing this solution, but ran into a problem: We needed store_fpscr 
> for gdbstub.c, that's the original reason we made that new function to begin 
> with. This solution, although it improves the handling of fpscr, doesn't fix 
> the original problem.

Why not?  Did you miss the cpu.c cut at the very top?

> What I think we can do is put the logic that is in helper_store_fpscr into 
> store_fpscr, move it to cpu.c, and have the helper call the non-helper 
> function. That way we conserve helper_* as TCG-specific and have the overhaul.

That is exactly what I have written above.


r~


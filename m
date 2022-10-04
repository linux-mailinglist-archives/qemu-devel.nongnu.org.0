Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CD05F4AB9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:13:20 +0200 (CEST)
Received: from localhost ([::1]:44388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofpE8-0002Hj-1q
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofpAi-0006Xj-RT
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:09:48 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:37784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofpAh-0000gW-0z
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:09:48 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 p3-20020a17090a284300b0020a85fa3ffcso31493pjf.2
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 14:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=8uyzRXVyhKHXmSnF2MNgOvlGG/59hYvIzUCwWgTjKQw=;
 b=DOhuONF/bhHGnknzbCSuYvjU8xLh+a+9Kr3si8pnw+iGL7Q7xnIsDyN3qZlFsyI4SG
 Drs2rX74bDLV5MJV13AXezPNhiNkyx4+tMghHwRnJIlqmG0nSZc6NNdrmuASvDcBic1k
 rSeBleNHIGzrrn2TznzrJqpgam6xRizZ0bRO353a3lFGLxnAeTImQ6Uf7on09QE3VcUN
 IhjuW3oDR02irrNGM4tmI73C0LmdThJo3QW413xpL7GI9Pv7Uq/ZcoOzONhA9rHM64wc
 PvKDJRdDT+90DpNC49x9E+8Iaoy9gTdNleCWtyNMEIn8igelx8DYPtllexEDtmcupXSx
 DOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=8uyzRXVyhKHXmSnF2MNgOvlGG/59hYvIzUCwWgTjKQw=;
 b=mt5VReA1sGFvS84yJyAd2dtafHKKvAjuKgylNRCty9dabf6GzEazR3+jDW0BZhRW83
 GFxdwcF72gJUpK601YcEZFNotU6DpaMYoY0fWG3rgpV/uH3ji0NG+sAf9FauQ9mhh8xm
 ToHfjvMp6jc5kdXh/vyFbUl2vJ80G8V8cvyEZBFfH3su3z666UwOF9FrHTSzzPapznsU
 g0J1x8/wLprk7TcKMzbWns5EZex80Mgd+NTgbZcL8va5tfKBuy67LzgOgZPpnjymhejb
 0RRj2DvRQ95Kxcfj3xyWUoglW3/38+BsHECZKC7WFux1jOfwm/ArSRpIfhB4NwwwCawQ
 s6tw==
X-Gm-Message-State: ACrzQf2uu6xdPgIJui02U6USK+YWV+Zdnm2U+Rqk1r6Fv85X93sFCEcZ
 PDYeyuCkJTqfRkMwgqA5CPXgKw==
X-Google-Smtp-Source: AMsMyM4YjPlIaEcgF3y1KlbDtjQK9eVVftyBftAtpOuqifICu4cjY0ZF6Dv2mrCYH5/MXqI+nweVQA==
X-Received: by 2002:a17:90b:4a4f:b0:202:5bbb:b76f with SMTP id
 lb15-20020a17090b4a4f00b002025bbbb76fmr1625961pjb.230.1664917785202; 
 Tue, 04 Oct 2022 14:09:45 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:526e:3326:a84e:e5e3?
 ([2602:47:d49d:ec01:526e:3326:a84e:e5e3])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a170902ef4600b0016d1b70872asm547508plx.134.2022.10.04.14.09.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 14:09:44 -0700 (PDT)
Message-ID: <7a2c6a64-87f7-fd8f-d406-6a0b50164f0b@linaro.org>
Date: Tue, 4 Oct 2022 14:09:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 9/9] target/arm: Enable TARGET_TB_PCREL
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220930220312.135327-1-richard.henderson@linaro.org>
 <20220930220312.135327-10-richard.henderson@linaro.org>
 <CAFEAcA_x9zJQy1_9_ySO+TNnnXnYPC3Uq37AN1jP65SuEMvJZw@mail.gmail.com>
 <d1196e9c-c983-0b74-9141-ac10154429cd@linaro.org>
In-Reply-To: <d1196e9c-c983-0b74-9141-ac10154429cd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.449,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/22 12:27, Richard Henderson wrote:
> On 10/4/22 09:23, Peter Maydell wrote:
>>>   void arm_cpu_synchronize_from_tb(CPUState *cs,
>>>                                    const TranslationBlock *tb)
>>>   {
>>> -    ARMCPU *cpu = ARM_CPU(cs);
>>> -    CPUARMState *env = &cpu->env;
>>> -
>>> -    /*
>>> -     * It's OK to look at env for the current mode here, because it's
>>> -     * never possible for an AArch64 TB to chain to an AArch32 TB.
>>> -     */
>>> -    if (is_a64(env)) {
>>> -        env->pc = tb_pc(tb);
>>> -    } else {
>>> -        env->regs[15] = tb_pc(tb);
>>> +    /* The program counter is always up to date with TARGET_TB_PCREL. */
>>
>> I was confused for a bit about this, but it works because
>> although the synchronize_from_tb hook has a name that implies
>> it's comparatively general purpose, in fact we use it only
>> in the special case of "we abandoned execution at the start of
>> this TB without executing any of it".
> 
> Correct.
> 
>>> @@ -347,16 +354,22 @@ static void gen_exception_internal(int excp)
>>>
>>>   static void gen_exception_internal_insn(DisasContext *s, int excp)
>>>   {
>>> +    target_ulong pc_save = s->pc_save;
>>> +
>>>       gen_a64_update_pc(s, 0);
>>>       gen_exception_internal(excp);
>>>       s->base.is_jmp = DISAS_NORETURN;
>>> +    s->pc_save = pc_save;
>>
>> What is trashing s->pc_save that we have to work around like this,
>> here and in the other similar changes ?
> 
> gen_a64_update_pc trashes pc_save.
> 
> Off of the top of my head, I can't remember what conditionally uses exceptions (single 
> step?).

Oh, duh, any conditional a32 instruction.

To some extent this instance duplicates s->pc_cond_save, but the usage pattern there is

     brcond(..., s->condlabel);
     s->pc_cond_save = s->pc_save;

     gen_update_pc(s, 0);  /* pc_save = pc_curr */
     raise_exception;

     if (s->pc_cond_save != s->pc_save) {
         gen_update_pc(s->pc_save - s->pc_cond_save);
     }
     /* s->pc_save now matches the state at brcond */

condlabel:


So, we have exited the TB via exception, and the second gen_update_pc would be deleted as 
dead code, it's just as easy to keep s->pc_save unchanged so that the second gen_update_pc 
is not emitted.  We certainly *must* update s->pc_save around indirect branches, so that 
we don't wind up with an assert on s->pc_save != -1.


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C416B5137
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:55:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paiou-0003zE-Bx; Fri, 10 Mar 2023 14:54:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paios-0003vf-A6
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:54:26 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiop-0004x5-T6
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:54:25 -0500
Received: by mail-pj1-x102d.google.com with SMTP id kb15so6374789pjb.1
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 11:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678478062;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2p2sKzscWSaUSihBA16xlIhe4nleg+AoYBlRsbTYUJE=;
 b=SyPgctWz5IJuvHuC5DISHLkfqsto4vLecSBMbe5JTWVB8Hw3sKtRUDCDutspnd5Wml
 C1OMDcjDJ9eE1Li5SolccFFafPTvcwMBW8lryWM8NSkvAYc07JcpmAwzCBviOM7uqhaK
 eYmztP+NOfRe0EUEb79cuGV46SR/SUGiyyC1oJW9OgqsFyE8o7W7CkNeU4pIni9lETQ3
 7yNhfXpFsCaTO766bj69gjlLzhy5ZvbvOU42n0NH0nk5zCi1/uPSkkGQkAOqVTUFqNpJ
 wCYD7Hw+Huo1+ydUHbM5oevY1RyXZb5X0svnIPfm+pH0UxZRr5/HumZrgIiYCLCmuAST
 JZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678478062;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2p2sKzscWSaUSihBA16xlIhe4nleg+AoYBlRsbTYUJE=;
 b=YuorVE/MQDh2CLZQCOgzmYDYB7oU8CCBN3DyR0kO52NrZ+H6MSiiZQXTDplLBoNK14
 JCU2NiH2x3ali337sxHy8j4vIwIDG6fps2zHAFdjX89o+7a1rzUYTEDLbZJR/+LgB6eh
 NAHEqn5F7RKk+n5rtExpSLn1TQ//KcTth+PFKEvZMxxDoZlZMJAlu0jRKUAvTSsOZelA
 MHSEqvc5lm0O2jXHiWJBWeJwzZLzd2ucqxLdfShoGCaEf8hLJue/3M/IfVvsFDXdrSD+
 8rz5HpSCkGkqDHLH29qX9vnCyCGwvYIUnHfcl+MSk7/mHg2TbcuJf7AhVOBqVKsp0gp1
 wlEA==
X-Gm-Message-State: AO0yUKWexwQLdO0JFe7BCV0Lh9zbjiezhv3wg+1fMPV9F14BvFS+nt/F
 KyZloAC/xaARU9z75wx4Iki8Kw==
X-Google-Smtp-Source: AK7set/2CFe0Uzh6R0vAByksiF2CzbVMk3z4jlRBJXY9V8/sWq0e32DYwz9sgxCsqMcsovckirFyjg==
X-Received: by 2002:a05:6a20:429e:b0:cc:af12:44ea with SMTP id
 o30-20020a056a20429e00b000ccaf1244eamr29973307pzj.51.1678478062403; 
 Fri, 10 Mar 2023 11:54:22 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62?
 ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a635b4a000000b004dff15fc121sm266665pgm.36.2023.03.10.11.54.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 11:54:21 -0800 (PST)
Message-ID: <f82245db-3925-1eee-27b5-a83f6da2d169@linaro.org>
Date: Fri, 10 Mar 2023 11:54:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 01/12] target/s390x: Handle branching to odd addresses
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Harold Grovesteen <h.grovsteen@tx.rr.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230310174223.944843-1-iii@linux.ibm.com>
 <20230310174223.944843-2-iii@linux.ibm.com>
 <ac8534ad-6cf5-6ba6-d1a5-10f4135490b2@linaro.org>
 <f75b53839aebc414c45da99b7b9e6fccef72b2d2.camel@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f75b53839aebc414c45da99b7b9e6fccef72b2d2.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/10/23 11:34, Ilya Leoshkevich wrote:
> On Fri, 2023-03-10 at 11:24 -0800, Richard Henderson wrote:
>> On 3/10/23 09:42, Ilya Leoshkevich wrote:
>>> @@ -381,6 +382,14 @@ static inline int cpu_mmu_index(CPUS390XState
>>> *env, bool ifetch)
>>>    static inline void cpu_get_tb_cpu_state(CPUS390XState* env,
>>> target_ulong *pc,
>>>                                            target_ulong *cs_base,
>>> uint32_t *flags)
>>>    {
>>> +    if (env->psw.addr & 1) {
>>> +        /*
>>> +         * Instructions must be at even addresses.
>>> +         * This needs to be checked before address translation.
>>> +         */
>>> +        env->int_pgm_ilen = 2; /* see s390_cpu_tlb_fill() */
>>> +        tcg_s390_program_interrupt(env, PGM_SPECIFICATION, 0);
>>> +    }
>>
>> This is incorrect placement.  You can't raise an exception from all
>> of the places from
>> which this is called.
>>
>> You need to do this at the start of s390x_tr_translate_insn.
>> Compare aarch64_tr_translate_insn and the test for (pc & 3).
>>
>>
>> r~
> 
> The problem is that it's too late - for non-mapped memory we would get
> a translation exception instead of a specification exception.

Ah.  I wonder if I've got the placement right for arm.


> I see the following call sites:
> 
> - HELPER(lookup_tb_ptr) - for helpers the exceptions should work;
> - cpu_exec_loop(), cpu_exec_step_atomic - these are wrapped in setjmp,
>    so it should be ok too?
> - tb_check_watchpoint() - is this the problematic one?
> 
> Am I missing something?

Apparently not.  I thought the ones except for lookup_tb_ptr would be outside the setjmp, 
but I was wrong.


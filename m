Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515D35F49BE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 21:32:03 +0200 (CEST)
Received: from localhost ([::1]:47034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofne6-00010U-4S
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 15:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnZr-0006Ch-DX
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:27:43 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:45828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnZo-00018B-TA
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:27:39 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 o9-20020a17090a0a0900b0020ad4e758b3so3282043pjo.4
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 12:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Xq7tJDjyBWuxqPkRiIftBFN1V+lWzdrlJvEGaTQPwq0=;
 b=jyoZLG4r/GOoWCA49y/B/yoIf/O7lzbvbvmLS+/sQZl8V7XZQDABvoXk5mB+HMjD4x
 dQQgv9i9KciWCgYLkFlctX5sLe76vBJGP9CreW5Btikt0BdCsAAf2oFwGOKle52uCjk2
 1g7mYbD1TYe8vl3YVD1+Bos/b6r4QfWJHClpgz9SADzfMOziilkne1sCy1FauqD/drLD
 VAsg1JLiWo4OGU/FH9UEmK7P7vH5l6ZgS1QYZJpOS4DZN/77ORMGcAi8gd8Sr7C7liwY
 0euWBL/G6e1Wwv1ZW8U6Hd/OTvo3E8NaHvtQNR6BkEq7BPBlYleY3WTOygs23y31vXwm
 3sTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Xq7tJDjyBWuxqPkRiIftBFN1V+lWzdrlJvEGaTQPwq0=;
 b=YrXwxY3MIhlXPvLuRntMFKQh7ajMRt/tzpXv3E1HrxqlZi122ipF2CVLlPldFRfM+B
 q+icH7EBwlOp2nig2/A0TZQwD/Ky99V0cYF7nEtVl5ZJs6F0ryTM8+OqCsCnTQiqsw4o
 nXuExmcrgxMsTT4CcfjKyyXy5+TU2Mg88mLsbcGyrpHkZjosmYm0njwlya4I8rfQaewC
 TP5ruSW6H/VtLLXbOTYCCNIQxum+tuYH0nRkEhyG2YDQJLxYy+f9RBLRRey8DZTWVKTz
 n37LxEit9r+1cVTPz5Ae0c85AaqnBMe4H1Kn7h5SVRsXXRryVTxJ3w6UTanGlmHCJtWK
 woSw==
X-Gm-Message-State: ACrzQf0HltG3WQyshwhaI2NsnCf2CeflCtumxe/eSx6/Y6YcDapzEuoL
 OJAtV8ymktD7mx/pP4Vh52Ek+g==
X-Google-Smtp-Source: AMsMyM6ahLOciuCAwgm9JoCbW/dxG2rcExouox5AOtt/oXjB09qQWjHalkplqgpg01Sy+kPgemL4Bg==
X-Received: by 2002:a17:90b:33c9:b0:200:9ec2:f2eb with SMTP id
 lk9-20020a17090b33c900b002009ec2f2ebmr1244850pjb.29.1664911655241; 
 Tue, 04 Oct 2022 12:27:35 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:526e:3326:a84e:e5e3?
 ([2602:47:d49d:ec01:526e:3326:a84e:e5e3])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a17090a429100b00203125b6394sm8312873pjg.40.2022.10.04.12.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 12:27:34 -0700 (PDT)
Message-ID: <d1196e9c-c983-0b74-9141-ac10154429cd@linaro.org>
Date: Tue, 4 Oct 2022 12:27:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 9/9] target/arm: Enable TARGET_TB_PCREL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220930220312.135327-1-richard.henderson@linaro.org>
 <20220930220312.135327-10-richard.henderson@linaro.org>
 <CAFEAcA_x9zJQy1_9_ySO+TNnnXnYPC3Uq37AN1jP65SuEMvJZw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_x9zJQy1_9_ySO+TNnnXnYPC3Uq37AN1jP65SuEMvJZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.449,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/22 09:23, Peter Maydell wrote:
>>   void arm_cpu_synchronize_from_tb(CPUState *cs,
>>                                    const TranslationBlock *tb)
>>   {
>> -    ARMCPU *cpu = ARM_CPU(cs);
>> -    CPUARMState *env = &cpu->env;
>> -
>> -    /*
>> -     * It's OK to look at env for the current mode here, because it's
>> -     * never possible for an AArch64 TB to chain to an AArch32 TB.
>> -     */
>> -    if (is_a64(env)) {
>> -        env->pc = tb_pc(tb);
>> -    } else {
>> -        env->regs[15] = tb_pc(tb);
>> +    /* The program counter is always up to date with TARGET_TB_PCREL. */
> 
> I was confused for a bit about this, but it works because
> although the synchronize_from_tb hook has a name that implies
> it's comparatively general purpose, in fact we use it only
> in the special case of "we abandoned execution at the start of
> this TB without executing any of it".

Correct.

>> @@ -347,16 +354,22 @@ static void gen_exception_internal(int excp)
>>
>>   static void gen_exception_internal_insn(DisasContext *s, int excp)
>>   {
>> +    target_ulong pc_save = s->pc_save;
>> +
>>       gen_a64_update_pc(s, 0);
>>       gen_exception_internal(excp);
>>       s->base.is_jmp = DISAS_NORETURN;
>> +    s->pc_save = pc_save;
> 
> What is trashing s->pc_save that we have to work around like this,
> here and in the other similar changes ?

gen_a64_update_pc trashes pc_save.

Off of the top of my head, I can't remember what conditionally uses exceptions (single 
step?).  But the usage pattern that is interesting is

     brcond(x, y, L1)
     update_pc(disp1);
     exit-or-exception.
L1:
     update_pc(disp2);
     exit-or-exception.

where at L1 we should have the same pc_save value as we did at the brcond.  Saving and 
restoring around (at least some of) the DISAS_NORETURN points achieves that.


r~


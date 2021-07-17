Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4403CC5ED
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 21:42:40 +0200 (CEST)
Received: from localhost ([::1]:51998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4qCt-00056o-1T
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 15:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4qBw-0004Ql-VF
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:41:40 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:44999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4qBv-0005sZ-9e
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:41:40 -0400
Received: by mail-pf1-x42c.google.com with SMTP id p36so12306304pfw.11
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 12:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JAVUc9AcMoShl9Kdg7rPk0fsVQ3JsCL/Z70gGqlSy1g=;
 b=OdO25rtZn14xZa9Rp58lQl9/pfC6P661iIP8KsBpi+h/RVSG8HAw2j9bBU8SRluHp5
 KXqBDoy/pIqm7A0CTQg2A0kwtYPyzxmd5/0zIJWrcOcXVvEjwN26ZXt03QXww9nfLvl9
 2QR1ZX1cnMwdMK3HTkvvNowkghI7grX76CcYZqcT8LKiWwTYEijaac+qCnIzArDCahaj
 5atxDG1CdCyZ9qeRZ4qA8U1o5OmczSbHrNqTqBZpoFIxszlN8DZQxgzKDnvfyDFXOva1
 jYxkNVMHF47IdD06E6uMqETDYzSVfnfBWwSez34yof5Qv8GXl1BguesUSCltVNziQSOx
 uKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JAVUc9AcMoShl9Kdg7rPk0fsVQ3JsCL/Z70gGqlSy1g=;
 b=AkY/ogXfhcluTDSf1BMx4z2I0BfBK2It3IuxK5zqPsRCG9sYjlcZ/YfzQaNPnuXP7C
 tTSvZhko7NvsgpVGal24LOWPnNidVETcuGb5aO+DJCJYcyxQ0h1ZVOaGvXvZHjt/1l+x
 Lpi7vVyLGpBpxbbXC1NMuO3TfA3RCKW3OAVjhY4mQsTS+P+Il0eaLZ+2ZhoOWdwTYRaE
 WTZRJ2iULbYbCZxOGj7H48wP+bHiPeOxpyYKkkuyOESKV7oplr7e7NbZXI+RkhbYSvHc
 3PHwyk9or8mcHTZkBNaEf+H6ImWB4gTm/JuLeu9b+Bjs9RrjrJrSFuClqdz5G9PR/WRe
 xnbQ==
X-Gm-Message-State: AOAM533BnR1ujuUtJLxZTeFYzbca32lqztK6ph7uUGWu4fifUlA+UiPx
 pJsg/7Cn4vNZF1rQ1AMTBlfQbQ==
X-Google-Smtp-Source: ABdhPJxuo5xg5I8Kgb4lxRt9rcdIw1I3qi2a9nJIjf2t2Cu2M2/aIJZyXJmqs2cNRnaeT53N0XCrdQ==
X-Received: by 2002:a63:494d:: with SMTP id y13mr16795075pgk.248.1626550897401; 
 Sat, 17 Jul 2021 12:41:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id f3sm11749329pjt.19.2021.07.17.12.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 12:41:37 -0700 (PDT)
Subject: Re: [PATCH v2 08/10] accel/tcg: Adjust interface of
 TranslatorOps.breakpoint_check
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-9-richard.henderson@linaro.org>
 <CAFEAcA-nOTG5tPjFKAhSG9VsQFWSjUzd_=yAKt=L8MSK_dacJQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2af8e175-00ac-15fe-c4ac-3d66edd98a67@linaro.org>
Date: Sat, 17 Jul 2021 12:41:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-nOTG5tPjFKAhSG9VsQFWSjUzd_=yAKt=L8MSK_dacJQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/17/21 10:52 AM, Peter Maydell wrote:
> On Mon, 12 Jul 2021 at 16:48, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We don't need the whole CPUBreakpoint structure in the check,
>> only the flags.  Return the instruction length to consolidate
>> the adjustment of db->pc_next.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
>> diff --git a/target/avr/translate.c b/target/avr/translate.c
>> index 8237a03c23..73ff467926 100644
>> --- a/target/avr/translate.c
>> +++ b/target/avr/translate.c
>> @@ -2944,13 +2944,13 @@ static void avr_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
>>       tcg_gen_insn_start(ctx->npc);
>>   }
>>
>> -static bool avr_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
>> -                                    const CPUBreakpoint *bp)
>> +static int avr_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
>> +                                   int bp_flags)
>>   {
>>       DisasContext *ctx = container_of(dcbase, DisasContext, base);
>>
>>       gen_breakpoint(ctx);
>> -    return true;
>> +    return 2; /* minimum instruction length */
> 
> Here we weren't advancing pc_next at all, and now we do.
> 
>> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
>> index 47c967acbf..c7b9d813c2 100644
>> --- a/target/mips/tcg/translate.c
>> +++ b/target/mips/tcg/translate.c
>> @@ -16190,22 +16190,16 @@ static void mips_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
>>                          ctx->btarget);
>>   }
>>
>> -static bool mips_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
>> -                                     const CPUBreakpoint *bp)
>> +static int mips_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
>> +                                    int bp_flags)
>>   {
>>       DisasContext *ctx = container_of(dcbase, DisasContext, base);
>>
>>       save_cpu_state(ctx, 1);
>>       ctx->base.is_jmp = DISAS_NORETURN;
>>       gen_helper_raise_exception_debug(cpu_env);
>> -    /*
>> -     * The address covered by the breakpoint must be included in
>> -     * [tb->pc, tb->pc + tb->size) in order to for it to be
>> -     * properly cleared -- thus we increment the PC here so that
>> -     * the logic setting tb->size below does the right thing.
>> -     */
>> -    ctx->base.pc_next += 4;
>> -    return true;
>> +
>> +    return 2; /* minimum instruction length */
>>   }
> 
> Here we were advancing by 4 and now advance by 2.
> 
>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> index deda0c8a44..8a6bc58572 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -961,20 +961,15 @@ static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
>>       tcg_gen_insn_start(ctx->base.pc_next);
>>   }
>>
>> -static bool riscv_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
>> -                                      const CPUBreakpoint *bp)
>> +static int riscv_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
>> +                                     int bp_flags)
>>   {
>>       DisasContext *ctx = container_of(dcbase, DisasContext, base);
>>
>>       tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
>>       ctx->base.is_jmp = DISAS_NORETURN;
>>       gen_exception_debug();
>> -    /* The address covered by the breakpoint must be included in
>> -       [tb->pc, tb->pc + tb->size) in order to for it to be
>> -       properly cleared -- thus we increment the PC here so that
>> -       the logic setting tb->size below does the right thing.  */
>> -    ctx->base.pc_next += 4;
>> -    return true;
>> +    return 2; /* minimum instruction length */
>>   }
> 
> Ditto.
> 
> If these are intentional changes (are they bugfixes?) they should be in a
> separate patch.

Yes, they are bug fixes.

r~

> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
> 



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AE53B666B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:08:21 +0200 (CEST)
Received: from localhost ([::1]:36510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxto3-0004mK-PN
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxtkM-0007HF-KV
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:04:30 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:34425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxtkJ-00075H-5G
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:04:30 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso185872pjx.1
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5/ehpOMsEXMgbELkZnrgu7SCmDYPoVJcjfQ7CVeZoM0=;
 b=bkWBh9U6WSMJxphdKbw3oARY0b/RIXTSkvpbYMMcMuRv1MwA43TwjkqFimbKrNE3t3
 gM1zUiDVJZhGUu/93pMzdJRJWStSg0ngiTL1HH+p/UkhpVjcPWYh+fYVjMPm7Jtw/Xl9
 NlNB1nLuqfg/iPPJhIls5X5jAxZZ41VyH5Zr4/Pc5NCoHu/kC2uk7JrIRqEvYx3vYK1H
 3kdqOqnBoVvPwMUC3n9rvKCVbAnkiS0AthAHnOfbQ9pZA/1lVb2jxcJVTvLHE2jQYLwn
 zneEaA6B+frGs9bIwSXoRdCNxXux0F4ZfmHYTHpGN42iCXblL2m1Ps9e+cOqM0qOTYpL
 yp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5/ehpOMsEXMgbELkZnrgu7SCmDYPoVJcjfQ7CVeZoM0=;
 b=KWSbszwCNs1tH7EOOVQ6ZKVRkGtI6OdItDm4P295MblNVpTI1o7YUWOtzilf3jF2JD
 GJ3OPSGUBjRi6/NjmqQjZNujExSPhHFtOgqlidsAOhrsvZx92k0mvAhe7FBSNYOBfe76
 W2QK6ueTQ6a4ul9QjIOSzAOhSyBaiA5cU3LvMlBdCbC8AkYmWqsXKC4Q42ETeirTynYb
 zt7S09ejZaSvY9Y4ViO+Eg0EX0iURJic6iLboeEKK8J1oig4qD1Cip6MJGUghCykdwWC
 CcrGplA4IbC5FC/biK9O2BnyYeZD7Kxh8rQENKHYMJATKrQNYMNkWUW4I8ZiBQoIAbHu
 mBlQ==
X-Gm-Message-State: AOAM532cssThxg2bO0b1BPCEy4Z7iUGyH2XfIkB8V8EoJeEc7rqCwMcN
 qCtMieoPW4zsgbhr38WchjmPdg==
X-Google-Smtp-Source: ABdhPJyl/e1RU/zgXx+DDCFd9AjuLZhZ1CJMZe/B9Eov7DcFXwtJOIwbgbmuV85prkhSwPJaZI1IPA==
X-Received: by 2002:a17:90a:a29:: with SMTP id
 o38mr25876525pjo.228.1624896265082; 
 Mon, 28 Jun 2021 09:04:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z15sm8043717pgc.13.2021.06.28.09.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 09:04:24 -0700 (PDT)
Subject: Re: [PATCH v2 5/7] target/nios2: Convert to TranslatorOps
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210620221046.1526418-1-richard.henderson@linaro.org>
 <20210620221046.1526418-6-richard.henderson@linaro.org>
 <CAFEAcA8i+a9xOfvqn6U_8udEPR7rXpSp2-JNDguyqWp8YkF0MQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0649c46-05be-aa93-c523-e2f6cd9c41f6@linaro.org>
Date: Mon, 28 Jun 2021 09:04:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8i+a9xOfvqn6U_8udEPR7rXpSp2-JNDguyqWp8YkF0MQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 8:57 AM, Peter Maydell wrote:
> On Sun, 20 Jun 2021 at 23:18, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/nios2/translate.c | 130 ++++++++++++++++++++-------------------
>>   1 file changed, 67 insertions(+), 63 deletions(-)
>>
>> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
>> index 31653b7912..06705c894d 100644
>> --- a/target/nios2/translate.c
>> +++ b/target/nios2/translate.c
>> @@ -803,75 +803,72 @@ static void gen_exception(DisasContext *dc, uint32_t excp)
>>   }
>>
>>   /* generate intermediate code for basic block 'tb'.  */
>> -void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
>> +static void nios2_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>>   {
>> +    DisasContext *dc = container_of(dcbase, DisasContext, base);
>>       CPUNios2State *env = cs->env_ptr;
>> -    DisasContext dc1, *dc = &dc1;
>> -    int num_insns;
>> -
>> -    /* Initialize DC */
>> -
>> -    dc->base.tb = tb;
>> -    dc->base.singlestep_enabled = cs->singlestep_enabled;
>> -    dc->base.is_jmp = DISAS_NEXT;
>> -    dc->base.pc_first = tb->pc;
>> -    dc->base.pc_next = tb->pc;
>> +    target_ulong pc = dc->base.pc_first;
> 
> The local variable doesn't really seem necessary -- you could just
> write "dc->pc = dc->base.pc_first" and then use "dc->pc" in the
> calculation of page_insns.
> 
>> +    int page_insns;
>>
>>       dc->zero    = NULL;
>> -    dc->pc      = tb->pc;
>> +    dc->pc      = pc;
>>       dc->mem_idx = cpu_mmu_index(env, false);
>>
>> -    /* Set up instruction counts */
>> -    num_insns = 0;
>> -    if (max_insns > 1) {
>> -        int page_insns = (TARGET_PAGE_SIZE - (tb->pc & ~TARGET_PAGE_MASK)) / 4;
>> -        if (max_insns > page_insns) {
>> -            max_insns = page_insns;
>> -        }
>> -    }
>> +    /* Bound the number of insns to execute to those left on the page.  */
>> +    page_insns = -(pc | TARGET_PAGE_MASK) / 4;
>> +    dc->base.max_insns = MIN(page_insns, dc->base.max_insns);
>> +}
>>
>> -    gen_tb_start(tb);
>> -    do {
>> -        tcg_gen_insn_start(dc->pc);
>> -        num_insns++;
>> +static void nios2_tr_tb_start(DisasContextBase *db, CPUState *cs)
>> +{
>> +}
>>
>> -        if (unlikely(cpu_breakpoint_test(cs, dc->pc, BP_ANY))) {
>> -            gen_exception(dc, EXCP_DEBUG);
>> -            /* The address covered by the breakpoint must be included in
>> -               [tb->pc, tb->pc + tb->size) in order to for it to be
>> -               properly cleared -- thus we increment the PC here so that
>> -               the logic setting tb->size below does the right thing.  */
>> -            dc->pc += 4;
>> -            break;
>> -        }
>> +static void nios2_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
>> +{
>> +    tcg_gen_insn_start(dcbase->pc_next);
>> +}
>>
>> -        if (num_insns == max_insns && (tb_cflags(tb) & CF_LAST_IO)) {
>> -            gen_io_start();
>> -        }
>> +static bool nios2_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
>> +                                      const CPUBreakpoint *bp)
>> +{
>> +    DisasContext *dc = container_of(dcbase, DisasContext, base);
>>
>> -        /* Decode an instruction */
>> -        handle_instruction(dc, env);
>> +    gen_exception(dc, EXCP_DEBUG);
>> +    /*
>> +     * The address covered by the breakpoint must be included in
>> +     * [tb->pc, tb->pc + tb->size) in order to for it to be
>> +     * properly cleared -- thus we increment the PC here so that
>> +     * the logic setting tb->size below does the right thing.
>> +     */
>> +    dc->pc += 4;
> 
> Don't we need to increment dc->base.pc_next here, not dc->pc? The
> generic setting of tb->size in accel/tcg uses "db->pc_next - db->pc_first".

Yep, thanks.

>> +    return true;
> 
> The arm versions of the breakpoint_check hook also set dc->base.is_jmp
> to DISAS_NORETURN.
> Are they doing that unnecessarily, or do we need to do that here ?

Here it's done in gen_exception.

>> +    handle_instruction(dc, env);
>> +
>> +    dc->base.pc_next += 4;
>> +    dc->pc += 4;
> 
> This isn't wrong, but I think that a setup like the Arm translator
> that does
>         dc->pc_curr = s->base.pc_next;
>         code = cpu_ldl_code(env, s->base.pc_next);
>         s->base.pc_next += 4;
>         /* dispatch to handler function here */
> 
> would be nicer (dunno whether clearer to do as a single thing or
> first to do this conversion and then do a followup patch).

You're right that advancing pc_next first and using that instead of pc+4 globally would be 
a good clean up.


r~



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E552F869A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 21:25:19 +0100 (CET)
Received: from localhost ([::1]:48712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Veo-0000qn-Of
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 15:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0VXm-00040r-Pt
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:18:02 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:39968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0VXi-0002Kp-Sp
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:18:02 -0500
Received: by mail-pj1-x1035.google.com with SMTP id m5so5849337pjv.5
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 12:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vFGOQu3pta8zPO5KVoQOGTQZBAEHlzKPYxElaeypqL8=;
 b=rjgGUXH5+hTLAXTUEng1X5I0pFnrrdKHZ/YXRMeZQi/m/19FW29YWBEVzA5yoJT0Iz
 dbFEKXDeRuoNuUDEHsNYsX5KQWp22Th7nJJUu8l+5n342AmgxshJFjyotmt/YIxU7Ltz
 rVqTfM58uYCzBddH0ampjO2c/51DVZZLakMy5o85aMR1K0MR29OLfSFs/dPDpxxub33W
 liVa++0lJOkBPqLnvh1Kijw3NXAiRsEmZE1qn0dJZWYqGHanS0Hj1ofUBTIwiIPVnOdj
 Ws1QjDIKUUA+MbUmc2Q7QzV8l5enx1mWjKjAxWOvqehxdjSZjNVhenY/LLlupF4vymF7
 4y5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vFGOQu3pta8zPO5KVoQOGTQZBAEHlzKPYxElaeypqL8=;
 b=fTNn4nq89ZVUiImQcValgsz1iHft8YMsSYqFVpIFOsMHcYt9kQ2MCJgFYvosdiLLz5
 9glc9OsMLwG1mMOfjvZAc8YExR4c9Bclqmnse+hqfxZtiBf5O1k//mXyLWea4ULjx4iJ
 68Xm/2JxHdZO65XcYRaSqHOUzuaaZSGM79drgHCrj9VV9Wn0q12MbkS5HhZEGodVRt5P
 WjWXmqNWWjvLIzVxPd5cvizzu167wyA0gWYt15oWYzMwTbu6/SMq1mvwmGij1ij47LJ9
 WpG9fVQVo8BO2KX7o05DslUSUlSeyqSKJYMv/8ZGhSRwOB1QR0AXeqWyYxLPCBdzOjBX
 8bzg==
X-Gm-Message-State: AOAM530OPN1aRA8oLVP9JKomNznYC8nKQPERxKjBW0ZBpeH+NGU7vsE8
 enr1pb3q2BHhwyWHDLUF8Ei/UQ==
X-Google-Smtp-Source: ABdhPJxt1V132o0irIubbAM4dcRbrWmgVgg0blL2ZnsZKloTJDHuXK2RdCZ9fCAZA3VInCzKq0Q3ww==
X-Received: by 2002:a17:903:22c2:b029:de:45c0:69f2 with SMTP id
 y2-20020a17090322c2b02900de45c069f2mr11426331plg.26.1610741877336; 
 Fri, 15 Jan 2021 12:17:57 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id w19sm8687084pgf.23.2021.01.15.12.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 12:17:56 -0800 (PST)
Subject: Re: [PATCH 05/15] arc: TCG instruction generator and hand-definitions
To: Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-6-cupertinomiranda@gmail.com>
 <1b75a1e6-481c-1fe0-00b9-518b01fd53bd@linaro.org>
 <9a9183ca-fd2c-9d57-b283-cf06dbac23cb@synopsys.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <983f948f-dcf8-74f7-71b8-b613b8490fc7@linaro.org>
Date: Fri, 15 Jan 2021 10:17:53 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9a9183ca-fd2c-9d57-b283-cf06dbac23cb@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Shahab Vahedi <shahab.vahedi@gmail.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Claudiu Zissulescu <claziss@gmail.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 7:11 AM, Cupertino Miranda wrote:
>> On 11/11/20 10:17 AM, cupertinomiranda@gmail.com wrote:
>>> +/*
>>> + * The macro to add boiler plate code for conditional execution.
>>> + * It will add tcg_gen codes only if there is a condition to
>>> + * be checked (ctx->insn.cc != 0). This macro assumes that there
>>> + * is a "ctx" variable of type "DisasCtxt *" in context. Remember
>>> + * to pair it with CC_EPILOGUE macro.
>>> + */
>>> +#define CC_PROLOGUE                                   \
>>> +  TCGv cc = tcg_temp_local_new();                     \
>>> +  TCGLabel *done = gen_new_label();                   \
>>> +  do {                                                \
>>> +    if (ctx->insn.cc) {                               \
>>> +        arc_gen_verifyCCFlag(ctx, cc);                \
>>> +        tcg_gen_brcondi_tl(TCG_COND_NE, cc, 1, done); \
>>> +    }                                                 \
>>> +  } while (0)
>>> +
>>> +/*
>>> + * The finishing counter part of CC_PROLUGE. This is supposed
>>> + * to be put at the end of the function using it.
>>> + */
>>> +#define CC_EPILOGUE          \
>>> +    if (ctx->insn.cc) {      \
>>> +        gen_set_label(done); \
>>> +    }                        \
>>> +    tcg_temp_free(cc)
>>
>> Why would this need to be boiler-plate?  Why would this not simply exist in
>> exactly one location?
>>
>> You don't need a tcg_temp_local_new, because the cc value is not used past the
>> branch.  You should free the temp immediately after the branch.
>>
> 
> I wonder if what you thought was to move those macros to functions and 
> call it when CC_PROLOGUE and CC_EPILOGUE are used.
> I think the macros were choosen due to the sharing of the 'cc' and 
> 'done' variables in both CC_PROLOGUE AND CC_EPILOGUE.

I meant that the checking of ctx->insn.cc could be done at a higher level, so
that this code existed in exactly one place, not scattered between all of the
different instructions.

But if that isn't possible for some reason, you can certainly put "done" into
the DisasContext so that you can have to functions cc_prologue(ctx) and
cc_epilogue(ctx).


>>> +void gen_goto_tb(DisasContext *ctx, int n, TCGv dest)
>>> +{
>>> +    tcg_gen_mov_tl(cpu_pc, dest);
>>> +    tcg_gen_andi_tl(cpu_pcl, dest, 0xfffffffc);
>>> +    if (ctx->base.singlestep_enabled) {
>>> +        gen_helper_debug(cpu_env);
>>> +    }
>>> +    tcg_gen_exit_tb(NULL, 0);
>>
>> Missing else.  This is dead code for single-step.
> Goes a little above my knowledge of QEMU internals to be honest.
> Do you have a recommendation what we should be doing here ?

Both of these actions end the TB, so:

  if (ctx->base.singlestep_enabled) {
    gen_helper_debug(cpu_env);
  } else {
    tcg_gen_exit_tb(NULL, 0);
  }

>> You could put all of these into a const static table.
> What do you mean, can we make the effect of tcg_global_mem_new_i32 as 
> constant ?

No, I mean all of the data that is passed to tcg_global_mem_new.  See for
instance target/sparc/translate.c, sparc_tcg_init().


>>> +static void init_constants(void)
>>> +{
>>> +#define SEMANTIC_FUNCTION(...)
>>> +#define MAPPING(...)
>>> +#define CONSTANT(NAME, MNEMONIC, OP_NUM, VALUE) \
>>> +  add_constant_operand(MAP_##MNEMONIC##_##NAME, OP_NUM, VALUE);
>>> +#include "target/arc/semfunc_mapping.def"
>>> +#include "target/arc/extra_mapping.def"
>>> +#undef MAPPING
>>> +#undef CONSTANT
>>> +#undef SEMANTIC_FUNCTION
>>> +}
>>
>> Ew.  Yet another thing that can be done at build time.
> As far as I remember it, there was no way I could generate this table 
> using the C pre-processor. Do you suggest to make this table using an 
> external tool ?

I assumed that you could just as easily generate a table using the c
preprocessor as this function.  I guess I'd like to know more about why you
can't...

>>> +            int32_t limm = operand.value;
>>> +            if (operand.type & ARC_OPERAND_LIMM) {
>>> +                limm = ctx->insn.limm;
>>> +                tcg_gen_movi_tl(cpu_limm, limm);
>>> +                ret = cpu_r[62];
>>> +            } else {
>>> +                ret = tcg_const_local_i32(limm);
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +  return ret;
>>
>> Why are you using locals for everything?  Is it because you have no proper
>> control over your use of branching?
> 
> Initially we though locals the good way to define temporaries. :-(
> What should be the best ? We will need to change a lot of code for this.

TCG is a poor optimizer.  If you can at all avoid branches, while implementing
a single instruction, do so.  Because this means that you can use
tcg_temp_new_i32 (et al) which are "normal" temps, and are not spilled to the
stack at the end of the BB.

This does not necessarily apply to conditional execution (cc_prologue, et al)
because you can think of those as "outside" of the instruction, merely wrapping
them.  The actual live temps will be "inside" and not live past the done label.

>>> +/* Return from exception. */
>>> +static void gen_rtie(DisasContext *ctx)
>>> +{
>>> +    tcg_gen_movi_tl(cpu_pc, ctx->cpc);
>>> +    gen_helper_rtie(cpu_env);
>>> +    tcg_gen_mov_tl(cpu_pc, cpu_pcl);
>>> +    gen_goto_tb(ctx, 1, cpu_pc);
>>> +}
>>
>> You must return to the main loop here, not goto_tb.  You must return to the
>> main loop every time your interrupt mask changes, so that pending interrupts
>> may be accepted.
>>
> "gen_goto_tb" calls in the end "tcg_gen_exit_tb(NULL, 0)", is it not the 
> same ?

No.  Because gen_goto_tb uses tcg_gen_goto_tb, which ends the TB right there.
Another instance of the "else" bug above.

> We need to investigate this implementation further. A quick change to 
> gen_rtie broke linux booting.
> Can you recomend some target that implements the loop exit on rtie as 
> you suggest ?

target/riscv/ -- see trans_mret() and exit_tb().


r~


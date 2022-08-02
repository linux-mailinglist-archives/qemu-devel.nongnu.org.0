Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D4A587DFC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 16:13:31 +0200 (CEST)
Received: from localhost ([::1]:41808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIseI-0001K7-FS
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 10:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIscX-0007vJ-Qp
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 10:11:41 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:42708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIscV-0005VD-Hr
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 10:11:41 -0400
Received: by mail-pf1-x42a.google.com with SMTP id f192so4224410pfa.9
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 07:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=v8MfB0YYRXSd8U2Fa/Oukv3xoFt7Yvm6KsGHEQld26A=;
 b=iMdstt0BG24eMomHIFEq9oGN5SIacvhCekFM5vM3Fj4BoSUelLl9pfgck71fCqZ1M+
 gLEhqLMDtl9NCP47/vfZ0oGKkl45OW82Ew+LxxablGc/6hOpaUiLHf2C55ofB+Z3Hbsb
 yiABMHi8VbDQQBkSzZaDwFwbc/7xqBkdl5P+lOfp5CMfIuokz9sV3AOypPjbrKBLla2j
 d0slmXwDVq+Yw6hlnzuGMHksCFuRgOOL3vaIJ1GDjBF3KZq4OKuBGmzfR9uuQTRx8nTX
 7PYueF6KB4UFhv5s6t/D4BSYjGobvo/Gi9aa6efwhRJNOt7HFSYZMmL0YHmK2tdJcW1O
 TcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=v8MfB0YYRXSd8U2Fa/Oukv3xoFt7Yvm6KsGHEQld26A=;
 b=p5wUu8U0L5AHVS/zRUeHJQVhDtLScpJ4R7r2OinRa1dl7ICaXUqROGll8RZMN+NO+S
 nCc+iuc6qvBDRq9u0zV1SRli5J0jjHLJowX88cB+Wkxje308BNSsxx41LLYJwt5S8VUd
 +DA7OWFtkdupQ6ZZbu4I6H5aNxhyjCzlvVI0v2USgeeL2rvOSizatbbJz1hBOebHbkU/
 8NxUGUmCtIzn+ElxZjym6/mQKO1Ri/H43dkmCKSFvwrBpB9Vr8/hgenedUwA6rxspLvJ
 UfkWvgLWqopSJnHZ5TSO32LlpWz/aK373hYKi45K0nwxiSOZPYTVC3pt2P0WnMZkMkoy
 IVKA==
X-Gm-Message-State: AJIora+I5o6dqSqJTOV9trmdTNCMDp3qNfX/+zyc+nYy53RmDtJKkC7R
 Q6YBao7Bu4LxMyP5JPaLbZZUkw==
X-Google-Smtp-Source: AGRyM1vGJfk7b8DQWUALh3b1Ux/TVMC5FmfCjEZe76J9eU4hucQcTsSWEZ/5j7g8tagCTtNDiy1eXg==
X-Received: by 2002:a05:6a00:88e:b0:52c:65a3:fdb4 with SMTP id
 q14-20020a056a00088e00b0052c65a3fdb4mr20668278pfj.83.1659449497832; 
 Tue, 02 Aug 2022 07:11:37 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:9b48:8d61:390d:9808?
 ([2602:ae:1549:801:9b48:8d61:390d:9808])
 by smtp.gmail.com with ESMTPSA id
 ga20-20020a17090b039400b001f53705ee92sm606490pjb.6.2022.08.02.07.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 07:11:37 -0700 (PDT)
Message-ID: <ea8ad12b-66fb-7173-3e29-ffd7be3cd2b0@linaro.org>
Date: Tue, 2 Aug 2022 07:11:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/mips: Advance pc after semihosting exception
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220730021844.124503-1-richard.henderson@linaro.org>
 <7fb76578-6cf0-3b25-63ea-2e9dce7b3716@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7fb76578-6cf0-3b25-63ea-2e9dce7b3716@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/1/22 23:48, Philippe Mathieu-Daudé wrote:
> Hi Richard,
> 
> On 30/7/22 04:18, Richard Henderson wrote:
>> Delay generating the exception until after we know the
>> insn length, and record that length in env->error_code.
>>
>> Fixes: 8ec7e3c53d4 ("target/mips: Use an exception for semihosting")
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1126
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/mips/tcg/translate.h               |  4 ++++
>>   target/mips/tcg/sysemu/tlb_helper.c       |  1 +
>>   target/mips/tcg/translate.c               | 10 +++++-----
>>   target/mips/tcg/micromips_translate.c.inc |  6 +++---
>>   target/mips/tcg/mips16e_translate.c.inc   |  2 +-
>>   target/mips/tcg/nanomips_translate.c.inc  |  4 ++--
>>   6 files changed, 16 insertions(+), 11 deletions(-)
>>
>> diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
>> index 55053226ae..69f85841d2 100644
>> --- a/target/mips/tcg/translate.h
>> +++ b/target/mips/tcg/translate.h
>> @@ -51,6 +51,10 @@ typedef struct DisasContext {
>>       int gi;
>>   } DisasContext;
>> +#define DISAS_STOP       DISAS_TARGET_0
>> +#define DISAS_EXIT       DISAS_TARGET_1
>> +#define DISAS_SEMIHOST   DISAS_TARGET_2
>> +
>>   /* MIPS major opcodes */
>>   #define MASK_OP_MAJOR(op)   (op & (0x3F << 26))
>> diff --git a/target/mips/tcg/sysemu/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
>> index 57ffad2902..9d16859c0a 100644
>> --- a/target/mips/tcg/sysemu/tlb_helper.c
>> +++ b/target/mips/tcg/sysemu/tlb_helper.c
>> @@ -1056,6 +1056,7 @@ void mips_cpu_do_interrupt(CPUState *cs)
>>       case EXCP_SEMIHOST:
>>           cs->exception_index = EXCP_NONE;
>>           mips_semihosting(env);
>> +        env->active_tc.PC += env->error_code;
>>           return;
>>       case EXCP_DSS:
>>           env->CP0_Debug |= 1 << CP0DB_DSS;
>> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
>> index 1f6a779808..de1511baaf 100644
>> --- a/target/mips/tcg/translate.c
>> +++ b/target/mips/tcg/translate.c
>> @@ -1213,9 +1213,6 @@ TCGv_i64 fpu_f64[32];
>>   #include "exec/gen-icount.h"
>> -#define DISAS_STOP       DISAS_TARGET_0
>> -#define DISAS_EXIT       DISAS_TARGET_1
>> -
>>   static const char regnames_HI[][4] = {
>>       "HI0", "HI1", "HI2", "HI3",
>>   };
>> @@ -13902,7 +13899,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, 
>> DisasContext *ctx)
>>           break;
>>       case R6_OPC_SDBBP:
>>           if (is_uhi(extract32(ctx->opcode, 6, 20))) {
>> -            generate_exception_end(ctx, EXCP_SEMIHOST);
>> +            ctx->base.is_jmp = DISAS_SEMIHOST;
>>           } else {
>>               if (ctx->hflags & MIPS_HFLAG_SBRI) {
>>                   gen_reserved_instruction(ctx);
>> @@ -14314,7 +14311,7 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, 
>> DisasContext *ctx)
>>           break;
>>       case OPC_SDBBP:
>>           if (is_uhi(extract32(ctx->opcode, 6, 20))) {
>> -            generate_exception_end(ctx, EXCP_SEMIHOST);
>> +            ctx->base.is_jmp = DISAS_SEMIHOST;
>>           } else {
>>               /*
>>                * XXX: not clear which exception should be raised
>> @@ -16098,6 +16095,9 @@ static void mips_tr_translate_insn(DisasContextBase *dcbase, 
>> CPUState *cs)
>>       if (is_slot) {
>>           gen_branch(ctx, insn_bytes);
>>       }
>> +    if (ctx->base.is_jmp == DISAS_SEMIHOST) {
>> +        generate_exception_err(ctx, EXCP_SEMIHOST, insn_bytes);
> 
> Hmm this API takes an error_code argument:
> 
>    int error_code;
>    #define EXCP_TLB_NOMATCH   0x1
>    #define EXCP_INST_NOTAVAIL 0x2 /* No valid instruction word for BadInstr */
> 
> Now we pass bytes. What about adding an extra helper?
> 
>    void generate_exception_err_displace(DisasContext *ctx,
>                                         int excp, int err,
>                                         target_long displacement);

These error codes are specific to the matching EXCP.
We don't need to introduce extra storage, I don't think.


r~

> 
> Otherwise LGTM.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
>> +    }
>>       ctx->base.pc_next += insn_bytes;
>>       if (ctx->base.is_jmp != DISAS_NEXT) {
>> diff --git a/target/mips/tcg/micromips_translate.c.inc 
>> b/target/mips/tcg/micromips_translate.c.inc
>> index 274caf2c3c..b2c696f891 100644
>> --- a/target/mips/tcg/micromips_translate.c.inc
>> +++ b/target/mips/tcg/micromips_translate.c.inc
>> @@ -826,7 +826,7 @@ static void gen_pool16c_insn(DisasContext *ctx)
>>           break;
>>       case SDBBP16:
>>           if (is_uhi(extract32(ctx->opcode, 0, 4))) {
>> -            generate_exception_end(ctx, EXCP_SEMIHOST);
>> +            ctx->base.is_jmp = DISAS_SEMIHOST;
>>           } else {
>>               /*
>>                * XXX: not clear which exception should be raised
>> @@ -942,7 +942,7 @@ static void gen_pool16c_r6_insn(DisasContext *ctx)
>>           case R6_SDBBP16:
>>               /* SDBBP16 */
>>               if (is_uhi(extract32(ctx->opcode, 6, 4))) {
>> -                generate_exception_end(ctx, EXCP_SEMIHOST);
>> +                ctx->base.is_jmp = DISAS_SEMIHOST;
>>               } else {
>>                   if (ctx->hflags & MIPS_HFLAG_SBRI) {
>>                       generate_exception(ctx, EXCP_RI);
>> @@ -1311,7 +1311,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, 
>> int rt, int rs)
>>               break;
>>           case SDBBP:
>>               if (is_uhi(extract32(ctx->opcode, 16, 10))) {
>> -                generate_exception_end(ctx, EXCP_SEMIHOST);
>> +                ctx->base.is_jmp = DISAS_SEMIHOST;
>>               } else {
>>                   check_insn(ctx, ISA_MIPS_R1);
>>                   if (ctx->hflags & MIPS_HFLAG_SBRI) {
>> diff --git a/target/mips/tcg/mips16e_translate.c.inc 
>> b/target/mips/tcg/mips16e_translate.c.inc
>> index 0a3ba252e4..7568933e23 100644
>> --- a/target/mips/tcg/mips16e_translate.c.inc
>> +++ b/target/mips/tcg/mips16e_translate.c.inc
>> @@ -952,7 +952,7 @@ static int decode_ase_mips16e(CPUMIPSState *env, DisasContext *ctx)
>>               break;
>>           case RR_SDBBP:
>>               if (is_uhi(extract32(ctx->opcode, 5, 6))) {
>> -                generate_exception_end(ctx, EXCP_SEMIHOST);
>> +                ctx->base.is_jmp = DISAS_SEMIHOST;
>>               } else {
>>                   /*
>>                    * XXX: not clear which exception should be raised
>> diff --git a/target/mips/tcg/nanomips_translate.c.inc 
>> b/target/mips/tcg/nanomips_translate.c.inc
>> index ecb0ebed57..b3aff22c18 100644
>> --- a/target/mips/tcg/nanomips_translate.c.inc
>> +++ b/target/mips/tcg/nanomips_translate.c.inc
>> @@ -3695,7 +3695,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, 
>> DisasContext *ctx)
>>                   break;
>>               case NM_SDBBP:
>>                   if (is_uhi(extract32(ctx->opcode, 0, 19))) {
>> -                    generate_exception_end(ctx, EXCP_SEMIHOST);
>> +                    ctx->base.is_jmp = DISAS_SEMIHOST;
>>                   } else {
>>                       if (ctx->hflags & MIPS_HFLAG_SBRI) {
>>                           gen_reserved_instruction(ctx);
>> @@ -4634,7 +4634,7 @@ static int decode_isa_nanomips(CPUMIPSState *env, DisasContext *ctx)
>>                   break;
>>               case NM_SDBBP16:
>>                   if (is_uhi(extract32(ctx->opcode, 0, 3))) {
>> -                    generate_exception_end(ctx, EXCP_SEMIHOST);
>> +                    ctx->base.is_jmp = DISAS_SEMIHOST;
>>                   } else {
>>                       if (ctx->hflags & MIPS_HFLAG_SBRI) {
>>                           gen_reserved_instruction(ctx);
> 



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73D76FB130
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 15:17:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0fW-0000S5-D3; Mon, 08 May 2023 09:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw0em-00082e-9B
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:12:05 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw0ek-0001h1-1Z
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:12:00 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f18335a870so28487565e9.0
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 06:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683551516; x=1686143516;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8mPDwzCI+BUptCxYK8LtpsEbxFgka2jYJubm/Q9LQiE=;
 b=XfohWRqCluXCaCkIrFSnveWFh/8TIq4u4DLl36pICd8AE80Lqwa7bShwSowwr52vp9
 PogyzwI1QSVQtibCP1XkG6FwGpq2sEFG+NzZqsZIxqlxhE4BKsQKSy+2uYOtmQK7NCEr
 4sDXc5uX+KoqkqjkWUCGooJo2w7/S2i0oyCw/RM1xYnIs9fQfwNe/9Ysu9Krjro3mJ2J
 oYwVyBpiKX5luzRF48YhpALKAPsGiBbyep/I3Jur/vOyGSe9YDsge2OLw/EyJxGhv+vJ
 nW5uuHjgpmwGfikGG3o7yodqsVpENJjDDj+3OplSJv/urizVygARFol0qaRvpHIY7buE
 pqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683551516; x=1686143516;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8mPDwzCI+BUptCxYK8LtpsEbxFgka2jYJubm/Q9LQiE=;
 b=Xhim8kMvKql9NKUlnJQsiMaV2GCAHH3kF3lqg9HnvtA4NuJeXrmgXsnAGXf7e6OHDc
 FMws3njmiw6UYFXi7C2E2WfpZJWJT3vpVpEN3X015O4zy2IGzX8vBhgyomWEWGjnZr2Z
 iZsCjrL/r+z7d8ycQyUBdpskLNQGsqrRoZgreah6Ik56/cKHmakElS9Ab+gx3VutmBsg
 9tu5cuTS7bAMuaBL4tiFpnXCaK1wk4JIuqvgx5cDcJFHBBx08w74vyG+ku0byeJs3YF6
 +ZqO/NkasH6y7RY6U3j3dgcj73CdCQtdYSZw/TBOrgjHaNZOWBlK0iIXU6r/7X7dc/EV
 hKYA==
X-Gm-Message-State: AC+VfDxtbqQXStFAXw0EgXaEzh42sSl86z1ba4j0urla1GrCDLSa1W+R
 ixkGqh2kgIyNLZz+pTpLRxMcCQ==
X-Google-Smtp-Source: ACHHUZ7jLGznrPI15c+4MHf4HFJT4WbM3b54SBejoiTAlAw8/9LjVkINleGAaLWN6Dwm8KXgHuq+Ow==
X-Received: by 2002:a7b:cb89:0:b0:3f4:2174:b29b with SMTP id
 m9-20020a7bcb89000000b003f42174b29bmr3812918wmi.2.1683551516149; 
 Mon, 08 May 2023 06:11:56 -0700 (PDT)
Received: from [10.248.102.233] (5d600b65.skybroadband.com. [93.96.11.101])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a7bce14000000b003f3195be0a0sm16792670wmc.31.2023.05.08.06.11.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 06:11:55 -0700 (PDT)
Message-ID: <d4f1afe7-4d39-26d3-7bf5-da5fbb656992@linaro.org>
Date: Mon, 8 May 2023 14:11:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 05/42] target/m68k: Finish conversion to tcg_gen_qemu_{ld, 
 st}_*
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
 <20230505212447.374546-6-richard.henderson@linaro.org>
 <41dc0697-167e-30b2-afd2-a5f5dbbd0a03@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <41dc0697-167e-30b2-afd2-a5f5dbbd0a03@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/8/23 12:44, Laurent Vivier wrote:
> Le 05/05/2023 à 23:24, Richard Henderson a écrit :
>> Convert away from the old interface with the implicit
>> MemOp argument.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> Reviewed-by: Anton Johansson <anjo@rev.ng>
>> Message-Id: <20230502135741.1158035-5-richard.henderson@linaro.org>
>> ---
>>   target/m68k/translate.c | 76 ++++++++++++++---------------------------
>>   1 file changed, 25 insertions(+), 51 deletions(-)
>>
>> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
>> index 422f4652f1..744eb3748b 100644
>> --- a/target/m68k/translate.c
>> +++ b/target/m68k/translate.c
>> @@ -304,23 +304,14 @@ static inline void gen_addr_fault(DisasContext *s)
>>   static inline TCGv gen_load(DisasContext *s, int opsize, TCGv addr,
>>                               int sign, int index)
>>   {
>> -    TCGv tmp;
>> -    tmp = tcg_temp_new_i32();
>> -    switch(opsize) {
>> +    TCGv tmp = tcg_temp_new_i32();
>> +
>> +    switch (opsize) {
>>       case OS_BYTE:
>> -        if (sign)
>> -            tcg_gen_qemu_ld8s(tmp, addr, index);
>> -        else
>> -            tcg_gen_qemu_ld8u(tmp, addr, index);
>> -        break;
>>       case OS_WORD:
>> -        if (sign)
>> -            tcg_gen_qemu_ld16s(tmp, addr, index);
>> -        else
>> -            tcg_gen_qemu_ld16u(tmp, addr, index);
>> -        break;
>>       case OS_LONG:
>> -        tcg_gen_qemu_ld32u(tmp, addr, index);
>> +        tcg_gen_qemu_ld_tl(tmp, addr, index,
>> +                           opsize | (sign ? MO_SIGN : 0) | MO_TE);
>>           break;
>>       default:
>>           g_assert_not_reached();
>> @@ -332,15 +323,11 @@ static inline TCGv gen_load(DisasContext *s, int opsize, TCGv addr,
>>   static inline void gen_store(DisasContext *s, int opsize, TCGv addr, TCGv val,
>>                                int index)
>>   {
>> -    switch(opsize) {
>> +    switch (opsize) {
>>       case OS_BYTE:
>> -        tcg_gen_qemu_st8(val, addr, index);
>> -        break;
>>       case OS_WORD:
>> -        tcg_gen_qemu_st16(val, addr, index);
>> -        break;
>>       case OS_LONG:
>> -        tcg_gen_qemu_st32(val, addr, index);
>> +        tcg_gen_qemu_st_tl(val, addr, index, opsize | MO_TE);
>>           break;
>>       default:
>>           g_assert_not_reached();
>> @@ -971,23 +958,16 @@ static void gen_load_fp(DisasContext *s, int opsize, TCGv addr, 
>> TCGv_ptr fp,
>>       tmp = tcg_temp_new();
>>       switch (opsize) {
>>       case OS_BYTE:
>> -        tcg_gen_qemu_ld8s(tmp, addr, index);
>> -        gen_helper_exts32(cpu_env, fp, tmp);
>> -        break;
>>       case OS_WORD:
>> -        tcg_gen_qemu_ld16s(tmp, addr, index);
>> -        gen_helper_exts32(cpu_env, fp, tmp);
>> -        break;
>> -    case OS_LONG:
>> -        tcg_gen_qemu_ld32u(tmp, addr, index);
>> +        tcg_gen_qemu_ld_tl(tmp, addr, index, opsize | MO_SIGN | MO_TE);
>>           gen_helper_exts32(cpu_env, fp, tmp);
>>           break;
>>       case OS_SINGLE:
>> -        tcg_gen_qemu_ld32u(tmp, addr, index);
>> +        tcg_gen_qemu_ld_tl(tmp, addr, index, MO_TEUL);
>>           gen_helper_extf32(cpu_env, fp, tmp);
>>           break;
>>       case OS_DOUBLE:
>> -        tcg_gen_qemu_ld64(t64, addr, index);
>> +        tcg_gen_qemu_ld_i64(t64, addr, index, MO_TEUQ);
>>           gen_helper_extf64(cpu_env, fp, t64);
>>           break;
>>       case OS_EXTENDED:
>> @@ -995,11 +975,11 @@ static void gen_load_fp(DisasContext *s, int opsize, TCGv addr, 
>> TCGv_ptr fp,
>>               gen_exception(s, s->base.pc_next, EXCP_FP_UNIMP);
>>               break;
>>           }
>> -        tcg_gen_qemu_ld32u(tmp, addr, index);
>> +        tcg_gen_qemu_ld_i32(tmp, addr, index, MO_TEUL);
>>           tcg_gen_shri_i32(tmp, tmp, 16);
>>           tcg_gen_st16_i32(tmp, fp, offsetof(FPReg, l.upper));
>>           tcg_gen_addi_i32(tmp, addr, 4);
>> -        tcg_gen_qemu_ld64(t64, tmp, index);
>> +        tcg_gen_qemu_ld_i64(t64, tmp, index, MO_TEUQ);
>>           tcg_gen_st_i64(t64, fp, offsetof(FPReg, l.lower));
>>           break;
>>       case OS_PACKED:
>> @@ -1024,24 +1004,18 @@ static void gen_store_fp(DisasContext *s, int opsize, TCGv addr, 
>> TCGv_ptr fp,
>>       tmp = tcg_temp_new();
>>       switch (opsize) {
>>       case OS_BYTE:
>> -        gen_helper_reds32(tmp, cpu_env, fp);
>> -        tcg_gen_qemu_st8(tmp, addr, index);
>> -        break;
>>       case OS_WORD:
>> -        gen_helper_reds32(tmp, cpu_env, fp);
>> -        tcg_gen_qemu_st16(tmp, addr, index);
>> -        break;
>>       case OS_LONG:
>>           gen_helper_reds32(tmp, cpu_env, fp);
>> -        tcg_gen_qemu_st32(tmp, addr, index);
>> +        tcg_gen_qemu_st_tl(tmp, addr, index, opsize | MO_TE);
>>           break;
>>       case OS_SINGLE:
>>           gen_helper_redf32(tmp, cpu_env, fp);
>> -        tcg_gen_qemu_st32(tmp, addr, index);
>> +        tcg_gen_qemu_st_tl(tmp, addr, index, MO_TEUL);
>>           break;
>>       case OS_DOUBLE:
>>           gen_helper_redf64(t64, cpu_env, fp);
>> -        tcg_gen_qemu_st64(t64, addr, index);
>> +        tcg_gen_qemu_st_i64(t64, addr, index, MO_TEUQ);
>>           break;
>>       case OS_EXTENDED:
>>           if (m68k_feature(s->env, M68K_FEATURE_CF_FPU)) {
>> @@ -1050,10 +1024,10 @@ static void gen_store_fp(DisasContext *s, int opsize, TCGv addr, 
>> TCGv_ptr fp,
>>           }
>>           tcg_gen_ld16u_i32(tmp, fp, offsetof(FPReg, l.upper));
>>           tcg_gen_shli_i32(tmp, tmp, 16);
>> -        tcg_gen_qemu_st32(tmp, addr, index);
>> +        tcg_gen_qemu_st_i32(tmp, addr, index, MO_TEUL);
>>           tcg_gen_addi_i32(tmp, addr, 4);
>>           tcg_gen_ld_i64(t64, fp, offsetof(FPReg, l.lower));
>> -        tcg_gen_qemu_st64(t64, tmp, index);
>> +        tcg_gen_qemu_st_i64(t64, tmp, index, MO_TEUQ);
>>           break;
>>       case OS_PACKED:
>>           /*
>> @@ -2079,14 +2053,14 @@ DISAS_INSN(movep)
>>       if (insn & 0x80) {
>>           for ( ; i > 0 ; i--) {
>>               tcg_gen_shri_i32(dbuf, reg, (i - 1) * 8);
>> -            tcg_gen_qemu_st8(dbuf, abuf, IS_USER(s));
>> +            tcg_gen_qemu_st_i32(dbuf, abuf, IS_USER(s), MO_UB);
>>               if (i > 1) {
>>                   tcg_gen_addi_i32(abuf, abuf, 2);
>>               }
>>           }
>>       } else {
>>           for ( ; i > 0 ; i--) {
>> -            tcg_gen_qemu_ld8u(dbuf, abuf, IS_USER(s));
>> +            tcg_gen_qemu_ld_tl(dbuf, abuf, IS_USER(s), MO_UB);
>>               tcg_gen_deposit_i32(reg, reg, dbuf, (i - 1) * 8, 8);
>>               if (i > 1) {
>>                   tcg_gen_addi_i32(abuf, abuf, 2);
>> @@ -4337,14 +4311,14 @@ static void m68k_copy_line(TCGv dst, TCGv src, int index)
>>       t1 = tcg_temp_new_i64();
>>       tcg_gen_andi_i32(addr, src, ~15);
>> -    tcg_gen_qemu_ld64(t0, addr, index);
>> +    tcg_gen_qemu_ld_i64(t0, addr, index, MO_TEUQ);
>>       tcg_gen_addi_i32(addr, addr, 8);
>> -    tcg_gen_qemu_ld64(t1, addr, index);
>> +    tcg_gen_qemu_ld_i64(t1, addr, index, MO_TEUQ);
>>       tcg_gen_andi_i32(addr, dst, ~15);
>> -    tcg_gen_qemu_st64(t0, addr, index);
>> +    tcg_gen_qemu_st_i64(t0, addr, index, MO_TEUQ);
>>       tcg_gen_addi_i32(addr, addr, 8);
>> -    tcg_gen_qemu_st64(t1, addr, index);
>> +    tcg_gen_qemu_st_i64(t1, addr, index, MO_TEUQ);
>>   }
>>   DISAS_INSN(move16_reg)
>> @@ -4767,7 +4741,7 @@ static void gen_qemu_store_fcr(DisasContext *s, TCGv addr, int reg)
>>       tmp = tcg_temp_new();
>>       gen_load_fcr(s, tmp, reg);
>> -    tcg_gen_qemu_st32(tmp, addr, index);
>> +    tcg_gen_qemu_st_tl(tmp, addr, index, MO_TEUL);
>>   }
>>   static void gen_qemu_load_fcr(DisasContext *s, TCGv addr, int reg)
>> @@ -4776,7 +4750,7 @@ static void gen_qemu_load_fcr(DisasContext *s, TCGv addr, int reg)
>>       TCGv tmp;
>>       tmp = tcg_temp_new();
>> -    tcg_gen_qemu_ld32u(tmp, addr, index);
>> +    tcg_gen_qemu_ld_tl(tmp, addr, index, MO_TEUL);
>>       gen_store_fcr(s, tmp, reg);
>>   }
> 
> This patch introduces a problem:
> 
> ERROR:.../target/m68k/translate.c:993:gen_load_fp: code should not be reached
> Bail out! ERROR:.../target/m68k/translate.c:993:gen_load_fp: code should not be reached
> 
> $ wget http://vivier.eu/debian/ROMS/m68k-virt.petitboot
> $ wget http://vivier.eu/debian/ROMS/m68k-virt.vmlinux
> 
> $ qemu-system-m68k -M virt   -m 3399672K   -chardev stdio,signal=off,mux=on,id=char0   
> -serial chardev:char0   -mon chardev=char0,mode=readline   -device virtio-rng-device  
> -kernel m68k-virt.vmlinux -initrd m68k-virt.petitboot

Dang it.  This was noticed in review, I fixed it, and then apparently lost the change 
somehow.  Will fix.


r~



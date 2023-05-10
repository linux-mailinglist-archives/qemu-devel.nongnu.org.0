Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B370C6FD8E3
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 10:07:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwepX-0006aB-JH; Wed, 10 May 2023 04:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwepV-0006a3-4f
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:05:45 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwepT-0004uQ-4Q
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:05:44 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f42c865535so15907975e9.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 01:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683705941; x=1686297941;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RfR2buwHGfuzMvEgBjZ7yo7GNK6+1dzalatNMrHZLRA=;
 b=iAhM/zYaq8r9e1EpFhrYYoY5DSodePvYWB4Sp2+uRFVrF4MCocHWEMlXD5stT9dXPf
 mfsUopvSfFZMYItYW9B3RnF1xJT4tV0WSmuximMYKce6ZjZzLZvFeR9SViXqp9KoQI6T
 2tZLeFVBhRoIHnaug4Ef25hskUqBJSQlNTkzDrbFCQoswhFoTvlj4PcHtv9a2gHpcCdN
 HlTW9Q5fZ8P6siLypOiAZ35tJj6e8klKAlGszTZcQ86xr17wCcMZTFGQ2ZnZUpOOWp1+
 TSFQHEW0JGOIBLNHWjPtNSD48srx7WpLEo+KvF8qd0kJWNWXtomaVu/oGYhX2iopYzyn
 t2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683705941; x=1686297941;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RfR2buwHGfuzMvEgBjZ7yo7GNK6+1dzalatNMrHZLRA=;
 b=h8gXhcF2DBnwkI65AqflKGRZ+rCQx5cTFXsfOb0bIjnoQbIyxK5KQ8c3rA+yg7aafw
 Y0JmCO5uJw/8971QDw710juAQRI+taSoPTsW8+lG9m0itWHzdygiE04wGBN9UvKyV7xq
 eJpz59u7BPRpVL/EQgluZU+6tebkKn+bbY9W9oDiF1C3H07/Ay1qC3OlW2SI0mDlLM4K
 +eodJzP8SqmqkdYql2r216Bf/yqtQpl5ZhsIPzLGcjCLytL+bia4KteayW/SW8y3SwK2
 7s3dBtAiRBCuF/NJlC1repFGcxKXXa9Nd+9GAw2/2Fle6d2k9QOTLNDkYMXy5CdCL/Lo
 Zavw==
X-Gm-Message-State: AC+VfDwxDr9xpsPS3ZamjBD08DqQgo+xtQybQRch3L3mcD4oRHqT5Fos
 e2id3ZqMycJd+BLMi9TU1z+HSA==
X-Google-Smtp-Source: ACHHUZ6oFsd8NM3huHQPyH4NT7FMBOPKPwJIK+nKb1k6Fa2P/50UJB4DupMipSKqHz0DdMgn1GQgbg==
X-Received: by 2002:a7b:cc05:0:b0:3f1:7581:eaaf with SMTP id
 f5-20020a7bcc05000000b003f17581eaafmr11378824wmh.4.1683705941027; 
 Wed, 10 May 2023 01:05:41 -0700 (PDT)
Received: from [192.168.10.24] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a1c7913000000b003f42ceb3bf4sm3401838wme.32.2023.05.10.01.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 01:05:40 -0700 (PDT)
Message-ID: <c7721a0e-1d52-ac1d-3675-457cae6c2306@linaro.org>
Date: Wed, 10 May 2023 09:05:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] target/ppc: Fix fallback to MFSS for MFFS*
 instructions on pre 3.0 ISAs
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 Richard Purdie <richard.purdie@linuxfoundation.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20230506065240.3177798-1-richard.purdie@linuxfoundation.org>
 <5e24eb88-8ad0-a46d-a571-3965acb4164f@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <5e24eb88-8ad0-a46d-a571-3965acb4164f@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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

On 5/8/23 13:11, Matheus K. Ferst wrote:
> On 06/05/2023 03:52, Richard Purdie wrote:
>> The following commits changed the code such that the fallback to MFSS for MFFSCRN,
>> MFFSCRNI, MFFSCE and MFFSL on pre 3.0 ISAs was removed and became an illegal instruction:
>>
>>    bf8adfd88b547680aa857c46098f3a1e94373160 - target/ppc: Move mffscrn[i] to decodetree
>>    394c2e2fda70da722f20fb60412d6c0ca4bfaa03 - target/ppc: Move mffsce to decodetree
>>    3e5bce70efe6bd1f684efbb21fd2a316cbf0657e - target/ppc: Move mffsl to decodetree
>>
>> The hardware will handle them as a MFFS instruction as the code did previously.
>> This means applications that were segfaulting under qemu when encountering these
>> instructions which is used in glibc libm functions for example.
>>
>> The fallback for MFFSCDRN and MFFSCDRNI added in a later patch was also missing.
>>
>> This patch restores the fallback to MFSS for these instructions on pre 3.0s ISAs
>> as the hardware decoder would, fixing the segfaulting libm code. It and also ensures
>> the MFSS instruction is used for currently reserved bits to handle other potential
>> ISA additions more correctly.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>   target/ppc/insn32.decode           | 19 ++++++++++++-------
>>   target/ppc/translate/fp-impl.c.inc | 30 ++++++++++++++++++++++++------
>>   2 files changed, 36 insertions(+), 13 deletions(-)
>>
>> v2 - switch to use decodetree pattern groups per feedback
>>
>> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
>> index f8f589e9fd..3c4e2c2fc2 100644
>> --- a/target/ppc/insn32.decode
>> +++ b/target/ppc/insn32.decode
>> @@ -390,13 +390,18 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
>>
>>   ### Move To/From FPSCR
>>
>> -MFFS            111111 ..... 00000 ----- 1001000111 .   @X_t_rc
>> -MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
>> -MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
>> -MFFSCDRN        111111 ..... 10100 ..... 1001000111 -   @X_tb
>> -MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
>> -MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
>> -MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
>> +{
>> +  # Before Power ISA v3.0, MFFS bits 11~15 were reserved and should be ignored
>> +  [
>> +    MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
>> +    MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
>> +    MFFSCDRN        111111 ..... 10100 ..... 1001000111 -   @X_tb
>> +    MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
>> +    MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
>> +    MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
>> +  ]
>> +  MFFS            111111 ..... ----- ----- 1001000111 .   @X_t_rc
>> +}
>>
>>   ### Decimal Floating-Point Arithmetic Instructions
>>
>> diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
>> index 57d8437851..10dfd91aa4 100644
>> --- a/target/ppc/translate/fp-impl.c.inc
>> +++ b/target/ppc/translate/fp-impl.c.inc
>> @@ -584,7 +584,10 @@ static bool trans_MFFSCE(DisasContext *ctx, arg_X_t *a)
>>   {
>>       TCGv_i64 fpscr;
>>
>> -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
>> +    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
>> +        return false;
>> +    }
>> +
>>       REQUIRE_FPU(ctx);
>>
>>       gen_reset_fpstatus();
>> @@ -597,7 +600,10 @@ static bool trans_MFFSCRN(DisasContext *ctx, arg_X_tb *a)
>>   {
>>       TCGv_i64 t1, fpscr;
>>
>> -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
>> +    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
>> +        return false;
>> +    }
>> +
>>       REQUIRE_FPU(ctx);
>>
>>       t1 = tcg_temp_new_i64();
>> @@ -614,7 +620,10 @@ static bool trans_MFFSCDRN(DisasContext *ctx, arg_X_tb *a)
>>   {
>>       TCGv_i64 t1, fpscr;
>>
>> -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
>> +    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
>> +        return false;
>> +    }
>> +
>>       REQUIRE_FPU(ctx);
>>
>>       t1 = tcg_temp_new_i64();
>> @@ -631,7 +640,10 @@ static bool trans_MFFSCRNI(DisasContext *ctx, arg_X_imm2 *a)
>>   {
>>       TCGv_i64 t1, fpscr;
>>
>> -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
>> +    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
>> +        return false;
>> +    }
>> +
>>       REQUIRE_FPU(ctx);
>>
>>       t1 = tcg_temp_new_i64();
>> @@ -647,7 +659,10 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
>>   {
>>       TCGv_i64 t1, fpscr;
>>
>> -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
>> +    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
>> +        return false;
>> +    }
>> +
>>       REQUIRE_FPU(ctx);
>>
>>       t1 = tcg_temp_new_i64();
>> @@ -661,7 +676,10 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
>>
>>   static bool trans_MFFSL(DisasContext *ctx, arg_X_t *a)
>>   {
>> -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
>> +    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
>> +        return false;
>> +    }
>> +
>>       REQUIRE_FPU(ctx);
>>
>>       gen_reset_fpstatus();
>> -- 
>> 2.39.2
>>
> 
> As mention in the v1 thread, we should validate bits 11~15 on Power ISA v3.0+ to follow 
> what the ISA says and keep the same behavior as the hardware. Again, sorry for the delayed 
> response.

Thanks for double-checking.  In that case the v1 patch is indeed better.


r~


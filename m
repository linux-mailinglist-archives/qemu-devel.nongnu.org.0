Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3F73D157F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 19:50:52 +0200 (CEST)
Received: from localhost ([::1]:40492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6GMt-0007mL-3z
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 13:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m6GLG-0006FR-AD
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:49:10 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m6GLE-00014d-Ro
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:49:10 -0400
Received: by mail-wr1-x42e.google.com with SMTP id n1so3057108wri.10
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 10:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aBJ1VcOOVFzb5x1HxnhTd/5ysc/Gn2BB0oPMenF+YQo=;
 b=ipMUCGH7zkEP9aBD+WB0nL5R+dW3l501upm1EzgCVOnCBaTtF5PzUBmMevKc6m0ziI
 08TQlseko8fpI7ey5JzIZr7qKSxWe4WRA3WfrXre0Zk3goEa6Bs/TdElhj0C379mj3to
 xYqOQRqCA0Rag8Su//sQvNX32PLvy3mIoADflTMHIYw6u3McmVg4B5GjFW0Elfr4OQ21
 aKYXMuZtNSCypRFuW1RN/C78sczirQFs9+0TdbGtYPq3WYSnxgDw0iYQmjg9V0yTNqGj
 1wHJuvNN9fnp1yYNO4gTjfQqRsZNz1uqrtiXQNSD9bjFlatxvF65+IJ5FSAnjin/rfqo
 SGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aBJ1VcOOVFzb5x1HxnhTd/5ysc/Gn2BB0oPMenF+YQo=;
 b=IWVo8OHXy1JAHwXiU1htEWlH8XTpfxHFWOVdE4fUiHRaydzhfswPhcxr/2e2z6wSQ8
 aO0K221T1Wquxgv3rQWsk9iocwYIvviGCWaXpJwG7Va7q5625iOHp0Tjau57kJFCUf3b
 DjqkRCVrqPb8e//oa9CT4j8w/QW8w5IGmY+sVfkGmcO9b7VqUY/cNcVTbTaoBclHLKIR
 SWxcDqfdfGN6ofVoC1pYiBmot/JdGDD8y4+rcT+ojgGaskn6yN0lezUsdX+dbJBNYvYe
 hJLbI1mzwoLyksmG5miN9+mAHS4Vnxv91ZnByQS3GFE1fn9NHyk63Wwhuh5NmcNyOYIa
 1vIA==
X-Gm-Message-State: AOAM533C649HYN6PtKPOg8EtqTxD23qxCAs40TtboFCFRsQxXyRTGmDq
 uPGCoYOE2a0Kg54z5f/M3Yk=
X-Google-Smtp-Source: ABdhPJwHeKZ4XAuLeFucYxRO9X8mCZu64h4kfp0+AUUXKIu9AnP6sAyXL+IlP5dcmmQbjFOEGFLU+g==
X-Received: by 2002:adf:e0d1:: with SMTP id m17mr23166355wri.233.1626889747230; 
 Wed, 21 Jul 2021 10:49:07 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id c2sm27342338wrs.60.2021.07.21.10.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 10:49:06 -0700 (PDT)
Subject: Re: [PATCH v2 07/22] target/loongarch: Add fixed point arithmetic
 instruction translation
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-8-git-send-email-gaosong@loongson.cn>
 <b004b8e6-c0c1-d13d-fae0-81c1ee22a95b@amsat.org>
Message-ID: <380b9896-8f6b-e695-a8ca-447c86f06a89@amsat.org>
Date: Wed, 21 Jul 2021 19:49:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b004b8e6-c0c1-d13d-fae0-81c1ee22a95b@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.117,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 richard.henderson@linaro.org, laurent@vivier.eu, maobibo@loongson.cn,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/21 7:38 PM, Philippe Mathieu-Daudé wrote:
> On 7/21/21 11:53 AM, Song Gao wrote:
>> This patch implement fixed point arithemtic instruction translation.

Typo arithmetic.

>>
>> This includes:
>> - ADD.{W/D}, SUB.{W/D}
>> - ADDI.{W/D}, ADDU16ID
>> - ALSL.{W[U]/D}
>> - LU12I.W, LU32I.D LU52I.D
>> - SLT[U], SLT[U]I
>> - PCADDI, PCADDU12I, PCADDU18I, PCALAU12I
>> - AND, OR, NOR, XOR, ANDN, ORN
>> - MUL.{W/D}, MULH.{W[U]/D[U]}
>> - MULW.D.W[U]
>> - DIV.{W[U]/D[U]}, MOD.{W[U]/D[U]}
>> - ANDI, ORI, XORI
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>  target/loongarch/insns.decode |   89 ++++
>>  target/loongarch/trans.inc.c  | 1090 +++++++++++++++++++++++++++++++++++++++++
>>  target/loongarch/translate.c  |   12 +
>>  target/loongarch/translate.h  |    1 +
>>  4 files changed, 1192 insertions(+)
>>  create mode 100644 target/loongarch/insns.decode
>>  create mode 100644 target/loongarch/trans.inc.c
> 
> Please don't include all .inc.c in one big translate.c...
> 
>> diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
>> index 531f7e1..b60bdc2 100644
>> --- a/target/loongarch/translate.c
>> +++ b/target/loongarch/translate.c
>> @@ -57,6 +57,15 @@ void gen_load_gpr(TCGv t, int reg)
>>      }
>>  }
>>  
>> +TCGv get_gpr(int regno)
>> +{
>> +    if (regno == 0) {
>> +        return tcg_constant_tl(0);
>> +    } else {
>> +        return cpu_gpr[regno];
>> +    }
>> +}
>> +
>>  static inline void gen_save_pc(target_ulong pc)
> 
> ... expose this one ...
> 
>>  {
>>      tcg_gen_movi_tl(cpu_PC, pc);
>> @@ -287,6 +296,9 @@ static bool loongarch_tr_breakpoint_check(DisasContextBase *dcbase,
>>      return true;
>>  }
>>  
>> +#include "decode-insns.c.inc"
> 
> ... and move this include to "trans.c".

Since you have the luck to add a new architecture, you could
start cleanly from scratch and add group of instructions, so
this patch would add "trans_arithmetic.c", etc.. in the series.

>> +#include "trans.inc.c"
> 
> removing this include.
> 
>>  static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
>>  {
>>      CPULoongArchState *env = cs->env_ptr;
>> diff --git a/target/loongarch/translate.h b/target/loongarch/translate.h
>> index 333c3bf..ef4d4e7 100644
>> --- a/target/loongarch/translate.h
>> +++ b/target/loongarch/translate.h
>> @@ -35,6 +35,7 @@ void check_fpu_enabled(DisasContext *ctx);
>>  
>>  void gen_base_offset_addr(TCGv addr, int base, int offset);
>>  void gen_load_gpr(TCGv t, int reg);
>> +TCGv get_gpr(int regno);
>>  void gen_load_fpr32(TCGv_i32 t, int reg);
>>  void gen_load_fpr64(TCGv_i64 t, int reg);
>>  void gen_store_fpr32(TCGv_i32 t, int reg);
>>
> 
> 


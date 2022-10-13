Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601AD5FE22B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 20:55:45 +0200 (CEST)
Received: from localhost ([::1]:43852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj3Mt-0005Y6-Lr
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 14:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj3Jm-0003qN-Dm
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:52:30 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj3Jk-0003D2-B3
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:52:30 -0400
Received: by mail-pf1-x436.google.com with SMTP id g28so2743608pfk.8
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 11:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SGSNW/Pk2NI22LtzX1Xu3pb5bHWbQD3oXGrcm5U2Ssg=;
 b=nFG+ORV7yqp11AgJlRIA8n41/vFB9jJyCjFktX+aikoCl2do3P5+SrOkjwCwqo369/
 klmYmESpaUNzJK/PCUvZYQZ+ev35J2wvpPLVPPzAh/7QO3yQoYbqqbFjaCtkeHp7ZXc+
 MQLIQo6MDCm4Cg8GSh4rsQDi5HVx9ruvfYXySbBUUvd8634f0ekspvBjSHbzWpCsLIl4
 qMklXk0D8Uu4PjjFLCNMnuOzKy82AgV5QVNWhUaUFLVsl4XRbZlUgZXTXKoGZnQfB16C
 RguwZ68yJBmkwTYrWkBI4GVzkiKZwFm7QliE1zpCD47u50zqeONT219H/5EJNI7Hz4iA
 bppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SGSNW/Pk2NI22LtzX1Xu3pb5bHWbQD3oXGrcm5U2Ssg=;
 b=XmyUCQvZDHc2GRo0cTk+KSkLZmwPyZ2+wojK1oJO4f8lwr7FzISMsNVoTpSmT0WAjU
 dF7aOIkN0Xr4+vMD3tmPYru5yKUdj2Z26o1lkgiPQYqB+BhOOREivmTWbyfebNRxPMkR
 ty8azxNCWBunFL/+eRBiO5n/lZvV4KDMXk6vfWUn4Yx/09CT3Ur+ae4MAEM0nVa79sCQ
 4AOD1WUaUqPMP/VLZa1yIt/ssNGN3M5icjNEIkZoUHVdjhRHXvBGmwTPIEiGkO3tHkWt
 SLo5kmSNzeNMRTFML+kkUtqNhK6ye++PomVu0IenYvFBU3bG33VoB3OCo+66am7JFuID
 WVPw==
X-Gm-Message-State: ACrzQf2j/nUCQ4oYB8AiJ19+rnRKCezwOR0V9/jdb5o1OWTrhhFrFWjw
 Dip5qCVPoFMk6eSzHFMz1jG3RQ==
X-Google-Smtp-Source: AMsMyM4WFGSdqX1GeWX9pTJGKSZTsRc+bUgyD0fRGcw3bqJWyz0UrqIBwLD/1Q/tMRHp8AvS6olPEg==
X-Received: by 2002:a62:1490:0:b0:563:51e7:693b with SMTP id
 138-20020a621490000000b0056351e7693bmr962976pfu.39.1665687146685; 
 Thu, 13 Oct 2022 11:52:26 -0700 (PDT)
Received: from [10.1.28.222] (110-175-13-142.static.tpgi.com.au.
 [110.175.13.142]) by smtp.gmail.com with ESMTPSA id
 u32-20020a631420000000b004393c5a8006sm48524pgl.75.2022.10.13.11.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 11:52:26 -0700 (PDT)
Message-ID: <7ca40cf8-f49f-6a84-c384-f031f69a3305@linaro.org>
Date: Fri, 14 Oct 2022 05:52:20 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] tcg/loongarch64: Add direct jump support
Content-Language: en-US
To: Qi Hu <huqi@loongson.cn>, WANG Xuerui <git@xen0n.name>
Cc: qemu-devel@nongnu.org
References: <cc5770f1a03bf90fa8b990666fb061b1e063b803.1665405913.git.huqi@loongson.cn>
 <20221013030123.979720-1-huqi@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221013030123.979720-1-huqi@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
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

On 10/13/22 20:01, Qi Hu wrote:
> Similar to the ARM64, LoongArch has PC-relative instructions such as
> PCADDU18I. These instructions can be used to support direct jump for
> LoongArch. Additionally, if instruction "B offset" can cover the target
> address(target is within ±128MB range), a single "B offset" plus a nop
> will be used by "tb_target_set_jump_target".
> 
> Signed-off-by: Qi Hu <huqi@loongson.cn>

First, when sending a v2, do not reply to a different thread.
This confuses our patch tracking tools like patchew.org.

> +void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
> +                              uintptr_t jmp_rw, uintptr_t addr)
> +{
> +    tcg_insn_unit i1, i2;
> +    ptrdiff_t upper, lower;
> +    ptrdiff_t offset = (addr - jmp_rx) >> 2;
> +
> +    if (offset == sextreg(offset, 0, 28)) {
> +        i1 = encode_sd10k16_insn(OPC_B, offset);
> +        i2 = NOP;
> +    } else {
> +        upper = ((offset + (1 << 15)) >> 16) & 0xfffff;
> +        lower = (offset & 0xffff);

This computation is incorrect, cropping the values to unsigned.
This will assert inside

> +        /* patch pcaddu18i */
> +        i1 = encode_dsj20_insn(OPC_PCADDU18I, TCG_REG_T0, upper);
> +        /* patch jirl */
> +        i2 = encode_djsk16_insn(OPC_JIRL, TCG_REG_ZERO, TCG_REG_T0, lower);

these encoding functions.  You want

     lower = (int16_t)offset;
     upper = (offset - lower) >> 16;

Wang Xuerui asked you to remove the redundant comments there, which give no more 
information than the code itself.

> @@ -1058,11 +1088,24 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>           break;
>   
>       case INDEX_op_goto_tb:
> -        assert(s->tb_jmp_insn_offset == 0);
> -        /* indirect jump method */
> -        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
> -                   (uintptr_t)(s->tb_jmp_target_addr + a0));
> -        tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
> +        if (s->tb_jmp_insn_offset != NULL) {
> +            /* TCG_TARGET_HAS_direct_jump */
> +            /* Ensure that "patch area" are 8-byte aligned so that an
> +               atomic write can be used to patch the target address. */
> +            if ((uintptr_t)s->code_ptr & 7) {
> +                tcg_out_nop(s);
> +            }
> +            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
> +            /* actual branch destination will be patched by
> +               tb_target_set_jmp_target later */
> +            tcg_out_opc_pcaddu18i(s, TCG_REG_TMP0, 0);
> +            tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
> +        } else {
> +            /* !TCG_TARGET_HAS_direct_jump */
> +            tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
> +                    (uintptr_t)(s->tb_jmp_target_addr + a0));
> +            tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
> +        }

Your comment formatting does not follow our coding style.  It must be

     /*
      * Comment with
      * multiple lines.
      */

There is a tool, ./scripts/check_patch.pl, that will diagnose this error.

> diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
> index 67380b2432..c008d5686d 100644
> --- a/tcg/loongarch64/tcg-target.h
> +++ b/tcg/loongarch64/tcg-target.h
> @@ -123,7 +123,7 @@ typedef enum {
>   #define TCG_TARGET_HAS_clz_i32          1
>   #define TCG_TARGET_HAS_ctz_i32          1
>   #define TCG_TARGET_HAS_ctpop_i32        0
> -#define TCG_TARGET_HAS_direct_jump      0
> +#define TCG_TARGET_HAS_direct_jump      1
>   #define TCG_TARGET_HAS_brcond2          0
>   #define TCG_TARGET_HAS_setcond2         0
>   #define TCG_TARGET_HAS_qemu_st8_i32     0
> @@ -166,7 +166,6 @@ typedef enum {
>   #define TCG_TARGET_HAS_muluh_i64        1
>   #define TCG_TARGET_HAS_mulsh_i64        1
>   
> -/* not defined -- call should be eliminated at compile time */
>   void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
>   
>   #define TCG_TARGET_DEFAULT_MO (0)

You are missing a change to

#define MAX_CODE_GEN_BUFFER_SIZE  SIZE_MAX

The branch distance with pcaddu18i is +/- 37 bits (128GB) not 64 bits.


r~



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C695FA48D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 22:11:42 +0200 (CEST)
Received: from localhost ([::1]:41712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohz7l-0004WQ-5H
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 16:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohyQ2-0006x1-Vr
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 15:26:32 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohyPz-0005W4-DH
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 15:26:29 -0400
Received: by mail-pf1-x42e.google.com with SMTP id h13so10136441pfr.7
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 12:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CVzO/3PMxHtoSkUBsfbLeN6XvAAfB+B1oY5f3Tl+eYg=;
 b=yG6ClIwjxkY2mWOQIEq00PxFDFQiMmCq8/PwijdOjQrCDYTnm7gGCJNmHXDthqq3IK
 gyLuePpK7NvbKiT7+X62oSJ4h56dCIEx6laqEDqA/k5g8xjlXD2t1rbCkR5/mL1cc1q1
 rNzJDIclpydLlnweqXcoqnQoyMrHbqYzrM4L2ungqNsJzf0nDFo63lm5WqEsHBR6LKDH
 2lmOO37E/IVK/xKmluPXOpSZvBpiMebY0H8nDuoNbfYGsUtuhgR7DIWlny0gWbCQZPAR
 qBs9p2GefvuEzseD4e65ND5kGZAiAUFXQ5LeWkwxxHQha+Op9ztO8Tcu8BX3gwCtsIxK
 hH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CVzO/3PMxHtoSkUBsfbLeN6XvAAfB+B1oY5f3Tl+eYg=;
 b=3IrBsXL5L+wzRbcfaNUjfFqtoNYiq7wt/fI1ZIsgKeSOs+RamqbxCdSrbQxgNOV7Wi
 vowZGwrMURwYTnXSga4VGSfC6RcoiSxt8oTmAfKkASU1xGp1RgVLUMJQspEvEgYkVIiO
 122cujFHR23ctZfl/ayEgGJZ0riG5y6AKyHeRM0O15R7GHlu7WiQKX5Iq5u4fMHpQFJF
 2EmdcLPfX1N+eWL+vNbvSpl0lXIscDvbfTPhuYb3zNyMT3vbQmR0JDy8KAihy9uFgt3i
 ghHmz9qXEA7BRUywVqSRRJqz/R6DIQ+W6z5G8hUR3PV03Z+VDYIkTI4yCEsfq1TE63sk
 lrFw==
X-Gm-Message-State: ACrzQf0U8XpkrSJ3fCVJzIKTURfQhiN66/Bp+d/8f0KyDzX62S/BnX9n
 XAWgcCUL8VcbRakl4keoIHV1IQ==
X-Google-Smtp-Source: AMsMyM4Av68ppMoTtNZvhRfgcbychVwrWH0By8e/9Ny2cmjcj209X8mnj4mZrFDjC21mLh2jox+4ug==
X-Received: by 2002:a05:6a00:174a:b0:562:781f:eca3 with SMTP id
 j10-20020a056a00174a00b00562781feca3mr21011839pfc.41.1665429985807; 
 Mon, 10 Oct 2022 12:26:25 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7?
 ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a170903124600b00176dc67df44sm7072649plh.132.2022.10.10.12.26.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 12:26:25 -0700 (PDT)
Message-ID: <d4c812fc-08ba-9475-ec2b-972182cb1906@linaro.org>
Date: Mon, 10 Oct 2022 12:26:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 05/12] target/ppc: Move VPRTYB[WDQ] to decodetree and
 use gvec
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20221010191356.83659-1-lucas.araujo@eldorado.org.br>
 <20221010191356.83659-6-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221010191356.83659-6-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.007,
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

On 10/10/22 12:13, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
> 
> Moved VPRTYBW and VPRTYBD to use gvec and both of them and VPRTYBQ to
> decodetree. VPRTYBW and VPRTYBD now also use .fni4 and .fni8,
> respectively.
> 
> vprtybw:
> rept    loop    master             patch
> 8       12500   0,00991200         0,00626300 (-36.8%)
> 25      4000    0,01040600         0,00550600 (-47.1%)
> 100     1000    0,01084500         0,00601100 (-44.6%)
> 500     200     0,01490600         0,01394100 (-6.5%)
> 2500    40      0,03285100         0,05143000 (+56.6%)
> 8000    12      0,08971500         0,14662500 (+63.4%)
> 
> vprtybd:
> rept    loop    master             patch
> 8       12500   0,00665800         0,00652800 (-2.0%)
> 25      4000    0,00589300         0,00670400 (+13.8%)
> 100     1000    0,00646800         0,00743900 (+15.0%)
> 500     200     0,01065800         0,01586400 (+48.8%)
> 2500    40      0,03497000         0,07180100 (+105.3%)
> 8000    12      0,09242200         0,21566600 (+133.3%)
> 
> vprtybq:
> rept    loop    master             patch
> 8       12500   0,00656200         0,00665800 (+1.5%)
> 25      4000    0,00620500         0,00644900 (+3.9%)
> 100     1000    0,00707500         0,00764900 (+8.1%)
> 500     200     0,01203500         0,01349500 (+12.1%)
> 2500    40      0,03505700         0,04123100 (+17.6%)
> 8000    12      0,09590600         0,11586700 (+20.8%)
> 
> I wasn't expecting such a performance lost in both VPRTYBD and VPRTYBQ,
> I'm not sure if it's worth to move those instructions. Comparing the
> assembly of the helper with the TCGop they are pretty similar, so
> I'm not sure why vprtybd took so much more time.
> 
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  4 +-
>   target/ppc/insn32.decode            |  4 ++
>   target/ppc/int_helper.c             | 25 +--------
>   target/ppc/translate/vmx-impl.c.inc | 80 +++++++++++++++++++++++++++--
>   target/ppc/translate/vmx-ops.c.inc  |  3 --
>   5 files changed, 83 insertions(+), 33 deletions(-)
> 
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index b2e910b089..a06193bc67 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -193,9 +193,7 @@ DEF_HELPER_FLAGS_3(vslo, TCG_CALL_NO_RWG, void, avr, avr, avr)
>   DEF_HELPER_FLAGS_3(vsro, TCG_CALL_NO_RWG, void, avr, avr, avr)
>   DEF_HELPER_FLAGS_3(vsrv, TCG_CALL_NO_RWG, void, avr, avr, avr)
>   DEF_HELPER_FLAGS_3(vslv, TCG_CALL_NO_RWG, void, avr, avr, avr)
> -DEF_HELPER_FLAGS_2(vprtybw, TCG_CALL_NO_RWG, void, avr, avr)
> -DEF_HELPER_FLAGS_2(vprtybd, TCG_CALL_NO_RWG, void, avr, avr)
> -DEF_HELPER_FLAGS_2(vprtybq, TCG_CALL_NO_RWG, void, avr, avr)
> +DEF_HELPER_FLAGS_3(VPRTYBQ, TCG_CALL_NO_RWG, void, avr, avr, i32)
>   DEF_HELPER_FLAGS_5(vaddsbs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
>   DEF_HELPER_FLAGS_5(vaddshs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
>   DEF_HELPER_FLAGS_5(vaddsws, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index 2658dd3395..aa4968e6b9 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -529,6 +529,10 @@ VCTZDM          000100 ..... ..... ..... 11111000100    @VX
>   VPDEPD          000100 ..... ..... ..... 10111001101    @VX
>   VPEXTD          000100 ..... ..... ..... 10110001101    @VX
>   
> +VPRTYBD         000100 ..... 01001 ..... 11000000010    @VX_tb
> +VPRTYBQ         000100 ..... 01010 ..... 11000000010    @VX_tb
> +VPRTYBW         000100 ..... 01000 ..... 11000000010    @VX_tb
> +
>   ## Vector Permute and Formatting Instruction
>   
>   VEXTDUBVLX      000100 ..... ..... ..... ..... 011000   @VA
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index c7fd0d1faa..c6ce4665fa 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -492,31 +492,8 @@ static inline void set_vscr_sat(CPUPPCState *env)
>       env->vscr_sat.u32[0] = 1;
>   }
>   
> -/* vprtybw */
> -void helper_vprtybw(ppc_avr_t *r, ppc_avr_t *b)
> -{
> -    int i;
> -    for (i = 0; i < ARRAY_SIZE(r->u32); i++) {
> -        uint64_t res = b->u32[i] ^ (b->u32[i] >> 16);
> -        res ^= res >> 8;
> -        r->u32[i] = res & 1;
> -    }
> -}
> -
> -/* vprtybd */
> -void helper_vprtybd(ppc_avr_t *r, ppc_avr_t *b)
> -{
> -    int i;
> -    for (i = 0; i < ARRAY_SIZE(r->u64); i++) {
> -        uint64_t res = b->u64[i] ^ (b->u64[i] >> 32);
> -        res ^= res >> 16;
> -        res ^= res >> 8;
> -        r->u64[i] = res & 1;
> -    }
> -}
> -
>   /* vprtybq */
> -void helper_vprtybq(ppc_avr_t *r, ppc_avr_t *b)
> +void helper_VPRTYBQ(ppc_avr_t *r, ppc_avr_t *b, uint32_t v)
>   {
>       uint64_t res = b->u64[0] ^ b->u64[1];
>       res ^= res >> 32;
> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
> index b9a9e83ab3..23601942bc 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -1659,9 +1659,83 @@ GEN_VXFORM_NOA_ENV(vrfim, 5, 11);
>   GEN_VXFORM_NOA_ENV(vrfin, 5, 8);
>   GEN_VXFORM_NOA_ENV(vrfip, 5, 10);
>   GEN_VXFORM_NOA_ENV(vrfiz, 5, 9);
> -GEN_VXFORM_NOA(vprtybw, 1, 24);
> -GEN_VXFORM_NOA(vprtybd, 1, 24);
> -GEN_VXFORM_NOA(vprtybq, 1, 24);
> +
> +static void gen_vprtyb_vec(unsigned vece, TCGv_vec t, TCGv_vec b)
> +{
> +    int i;
> +    TCGv_vec tmp = tcg_temp_new_vec_matching(b);
> +    /* MO_32 is 2, so 2 iteractions for MO_32 and 3 for MO_64 */
> +    for (i = 0; i < vece; i++) {
> +        tcg_gen_shri_vec(vece, tmp, b, (4 << (vece - i)));
> +        tcg_gen_xor_vec(vece, b, tmp, b);
> +    }
> +    tcg_gen_and_vec(vece, t, b, tcg_constant_vec_matching(t, vece, 1));
> +    tcg_temp_free_vec(tmp);
> +}
> +
> +/* vprtybw */
> +static void gen_vprtyb_i32(TCGv_i32 t, TCGv_i32 b)
> +{
> +    TCGv_i32 tmp = tcg_temp_new_i32();
> +    tcg_gen_shri_i32(tmp, b, 16);
> +    tcg_gen_xor_i32(b, tmp, b);
> +    tcg_gen_shri_i32(tmp, b, 8);
> +    tcg_gen_xor_i32(b, tmp, b);
> +    tcg_gen_and_i32(t, b, tcg_constant_i32(1));
> +    tcg_temp_free_i32(tmp);

tcg_gen_ctpop_i32(t, b);
tcg_gen_andi_i32(t, t, 1);

> +}
> +
> +/* vprtybd */
> +static void gen_vprtyb_i64(TCGv_i64 t, TCGv_i64 b)
> +{
> +    TCGv_i64 tmp = tcg_temp_new_i64();
> +    tcg_gen_shri_i64(tmp, b, 32);
> +    tcg_gen_xor_i64(b, tmp, b);
> +    tcg_gen_shri_i64(tmp, b, 16);
> +    tcg_gen_xor_i64(b, tmp, b);
> +    tcg_gen_shri_i64(tmp, b, 8);
> +    tcg_gen_xor_i64(b, tmp, b);
> +    tcg_gen_and_i64(t, b, tcg_constant_i64(1));
> +    tcg_temp_free_i64(tmp);

Similarly.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B00C5B6AD9
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 11:37:47 +0200 (CEST)
Received: from localhost ([::1]:53606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY2MT-0005pn-Dv
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 05:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY2Ge-0002cN-4U
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 05:31:45 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY2Gc-000551-1X
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 05:31:43 -0400
Received: by mail-wr1-x434.google.com with SMTP id b5so19751666wrr.5
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 02:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=0Na4Z8OrvEcTvKfGVpdqReQw7WQ07N5V3QVht7c6g5E=;
 b=PTmd2jbzIfT5cAvm/j8xgAqBSd+dIihAlyjgV0pyPu9jcDIl4F/H3ij9JRYJN7/kkA
 cYYW1NxywQOrQVO4CWpY57EhRzIXscpJrVxl+DIHL3g2QzwK9xFEuYu9VqrCrACpfqgY
 aLa7OuBfkT+Yv4nCcXzN7eMXkaA3Dnbr+/xWUO0e5P6EGDEPOPIUWjfkrylRSyerYy98
 TTbZANLYP0zR1zf0262Mc60AC6HB8x4Ijtr4ir0mmjh/cYv8vxbG/OdYaZoKNICU4P6N
 infRcMGNFz6lUayd8XFYPYOslthC3ugijro4uh+qgV4AF4kteU7wJ+LSFdxtjV4SN3WJ
 ++OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=0Na4Z8OrvEcTvKfGVpdqReQw7WQ07N5V3QVht7c6g5E=;
 b=ter0jeDV5MdoisCM9WUf/2A+h9BNVta3sPVnyylYJ75xIQE4UiF/pNLm0YqVQzsa/H
 2+TGxAO4MAe5yr0HIS73HCBW3jjJ7S9NjxDVXSBvf4fEKV9R7X20fWmQTLUfSAjeXlK1
 H05YvKjSrpiy7910vG6Lt37/JFxiw8aBEGwJJlm+bLqCRPmxN39eztSwOoUiYlDu4fiM
 mr4RV3esE1KiY1wed6OAZUSPay5Zis9F4K1quinBWdEjZx3zK1pQRqRkGavZf7iUF88v
 aRnuN8d+T3w6QvwkbR39jdFnNckb2ZtW9AAL67C2nCAGNlroWF99Ma6wunjoxL446wVE
 ikbw==
X-Gm-Message-State: ACgBeo2ztwDDk993MGp3pqNAv3BpO/3H8LNIUi2b6c7eR0N8jGX/CXZU
 gwzStlM6kEEqAmtmQQqnDtEgAQ==
X-Google-Smtp-Source: AA6agR70CRWpf2rQamou9857QPrmhRmU2rk3r/AJVOCdvXO1pXbutHpPo/CG8K81XwQUg6Hq9qxfJg==
X-Received: by 2002:a5d:584d:0:b0:22a:4713:2e23 with SMTP id
 i13-20020a5d584d000000b0022a47132e23mr9802389wrf.57.1663061499930; 
 Tue, 13 Sep 2022 02:31:39 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a1cac07000000b003a6125562e1sm12580720wme.46.2022.09.13.02.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 02:31:39 -0700 (PDT)
Message-ID: <ca5cdbf4-81c3-78ef-c395-b9ccc3cd20f1@linaro.org>
Date: Tue, 13 Sep 2022 10:31:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 28/37] target/i386: reimplement 0x0f 0x38, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-29-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-29-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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

On 9/12/22 00:04, Paolo Bonzini wrote:
> +void glue(helper_vtestps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
> +{
> +    uint64_t zf = 0, cf = 0;

uint32_t, to match the size of the operation.

> +    int i;
> +
> +    for (i = 0; i < 2 << SHIFT; i++) {
> +        zf |= (s->L(i) &  d->L(i));
> +        cf |= (s->L(i) & ~d->L(i));
> +    }


> +void glue(helper_vpmaskmovd_st, SUFFIX)(CPUX86State *env,
> +                                        Reg *v, Reg *s, target_ulong a0)
> +{
> +    int i;
> +
> +    for (i = 0; i < (2 << SHIFT); i++) {
> +        if (v->L(i) >> 31) {
> +            cpu_stl_data_ra(env, a0 + i * 4, s->L(i), GETPC());
> +        }
> +    }
> +}
> +
> +void glue(helper_vpmaskmovq_st, SUFFIX)(CPUX86State *env,
> +                                        Reg *v, Reg *s, target_ulong a0)
> +{
> +    int i;
> +
> +    for (i = 0; i < (1 << SHIFT); i++) {
> +        if (v->Q(i) >> 63) {
> +            cpu_stq_data_ra(env, a0 + i * 8, s->Q(i), GETPC());
> +        }
> +    }
> +}

Any idea if hw will write incomplete data if the pieces cross page boundaries, and the 
second page is invalid?  We're not good at that for any other vector sized write, though, 
so not critical.

> +void glue(helper_vpmaskmovd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
> +{
> +    int i;
> +
> +    for (i = 0; i < (2 << SHIFT); i++) {
> +        d->L(i) = (v->L(i) >> 31) ? s->L(i) : 0;
> +    }
> +}

This is tcg_gen_cmpsel_vec(TCG_COND_LT, d, v, zero, s, zero).

> +void glue(helper_vpgatherdd, SUFFIX)(CPUX86State *env,
> +        Reg *d, Reg *v, Reg *s, target_ulong a0, unsigned scale)
> +{
> +    int i;
> +    for (i = 0; i < (2 << SHIFT); i++) {
> +        if (v->L(i) >> 31) {
> +            target_ulong addr = a0
> +                + ((target_ulong)(int32_t)s->L(i) << scale);
> +            d->L(i) = cpu_ldl_data_ra(env, addr, GETPC());
> +        }
> +        v->L(i) = 0;
> +    }
> +}

Better to not modify registers until all potential #GP are raised.
Also, some missing whitespace between functions.

> +    [0x2f] = X86_OP_ENTRY3(,x,  vex4 cpuid(SSE41) avx2_256 p_66),

Whee! Mailer really chomped down on this series.

> @@ -384,8 +484,8 @@ static const X86OpEntry opcodes_0F3A[256] = {
>       [0x0b] = X86_OP_ENTRY4(VROUNDSD,   V,x,  H,x, W,sd, vex3 cpuid(SSE41) p_66),
>       [0x0c] = X86_OP_ENTRY4(VBLENDPS,   V,x,  H,x,  W,x,  vex4 cpuid(SSE41) p_66),
>       [0x0d] = X86_OP_ENTRY4(VBLENDPD,   V,x,  H,x,  W,x,  vex4 cpuid(SSE41) p_66),
> -    [0x0e] = X86_OP_ENTRY4(VPBLENDW,   V,x,  H,x,  W,x,  vex4 cpuid(SSE41) p_66),
> -    [0x0f] = X86_OP_ENTRY4(PALIGNR,    V,x,  H,x,  W,x,  vex4 cpuid(SSSE3) mmx p_00_66),
> +    [0x0e] = X86_OP_ENTRY4(VPBLENDW,   V,x,  H,x,  W,x,  vex4 cpuid(SSE41) avx2_256 p_66),
> +    [0x0f] = X86_OP_ENTRY4(PALIGNR,    V,x,  H,x,  W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),

Squash back.

> +    case X86_SPECIAL_AVXExtMov:
> +        if (!decode.op[2].has_ea) {
> +            decode.op[2].ot = s->vex_l ? MO_128 : MO_256;
> +        } else if (s->vex_l) {
> +            decode.op[2].ot++;
> +        }

Clever.

> +BINARY_INT_SSE(VPMINSB,    pminsb)
> +BINARY_INT_SSE(VPMINUW,    pminuw)
> +BINARY_INT_SSE(VPMINUD,    pminud)
> +BINARY_INT_SSE(VPMINSD,    pminsd)
> +BINARY_INT_SSE(VPMAXSB,    pmaxsb)
> +BINARY_INT_SSE(VPMAXUW,    pmaxuw)
> +BINARY_INT_SSE(VPMAXUD,    pmaxud)
> +BINARY_INT_SSE(VPMAXSD,    pmaxsd)

tcg_gen_gvec_{u,s}{min,max}.

> +/* Same as above, but with extra arguments to the helper.  */
> +static inline void gen_vsib_avx(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
> +                                SSEFunc_0_epppti d_xmm, SSEFunc_0_epppti q_xmm,
> +                                SSEFunc_0_epppti d_ymm, SSEFunc_0_epppti q_ymm)
> +{
> +    SSEFunc_0_epppti d = s->vex_l ? d_ymm : d_xmm;
> +    SSEFunc_0_epppti q = s->vex_l ? q_ymm : q_xmm;
> +    SSEFunc_0_epppti fn = s->rex_w ? q : d;
> +    TCGv_i32 scale = tcg_const_i32(decode->mem.scale);

tcg_constant_i32.

> +static void gen_VPBROADCASTB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    int vec_len = sse_vec_len(s, decode);
> +
> +    tcg_gen_ld8u_i32(s->tmp2_i32, s->ptr2, 0);
> +    tcg_gen_gvec_dup_i32(MO_8, decode->op[0].offset, vec_len, vec_len, s->tmp2_i32);
> +}

This is better done with tcg_gen_gvec_dup_mem, where you pass the cpu_env offset of the 
source data.  This lets the host use mem->reg broadcast, which turns out to be more 
available than reg->reg broadcast.

> +static void gen_VPBROADCASTW(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +static void gen_VPBROADCASTD(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +static void gen_VPBROADCASTQ(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)

Likewise.

> +static inline void gen_VBROADCASTx128(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    tcg_gen_gvec_mov(MO_64, decode->op[0].offset,
> +                     decode->op[2].offset, 16, 16);
> +    tcg_gen_gvec_mov(MO_64, decode->op[0].offset + offsetof(YMMReg, YMM_X(1)),
> +                     decode->op[2].offset, 16, 16);
> +}

tcg_gen_dup_mem(MO_128, ...);


r~


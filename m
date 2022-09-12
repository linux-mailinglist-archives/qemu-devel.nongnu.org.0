Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FAE5B57E9
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 12:09:24 +0200 (CEST)
Received: from localhost ([::1]:37562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXgNX-0006Ko-CY
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 06:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXgGW-00014i-T9
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:02:13 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXgGU-00041d-Kd
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:02:08 -0400
Received: by mail-wr1-x42b.google.com with SMTP id bj14so14442969wrb.12
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 03:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=ayJns/kz3+Ov+JOxpkJo1Y49J4Xa9ebiZ1Y0R65c8eI=;
 b=GBdbFoLI5149nDh1zwigdqun42PyI7Y0om2YIZUuDe/YhTGYyyFmApFzuYv8nceHo2
 3Zcp8VW0q11LifNIqc0K6BFe1P10TcRoCgAITd6tUD6OxBbuT2kX9/xxLqL728kCRpWH
 2v1qR3sJtTQbbJJRs8RB1k2IBgWeCRDC/l2EoUTcg8ZCZHJD2rtrys7e5P+a4DZ5EJwP
 /64vEnzpCE6oBc7JB90A4IWt3lYWCk0Ev4yXbJ+mg3NiMCrRdoyPrAvpqZoMaFLt3sJq
 akEMTKUWKF7C6PASZYKsgOsJ/5toZzk3Ta7fg7etrzK0cTyR2xmPC04AZll1ozVBHNRo
 8ErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ayJns/kz3+Ov+JOxpkJo1Y49J4Xa9ebiZ1Y0R65c8eI=;
 b=fEQBQaNK7cW4+/GJAZqNt4bHOzK8Z9Gh1FwJV9LGz4q+QI4sPff6+CSb6f/ol5MXht
 J7zQc08pAxEz1z5ypevSRvltgVdyZziz6jFW+IwfAAAuXl4yOCAggTQAvJyXqF89Q+6j
 EeI2J4Vk30goLQ4Z2TIQB9Hsr4QcLEhelDLKyjPOciwU/z5PQmFDJvjSWcFUlESP4Y4U
 y7pAIcpvWuyc0SGMPKPxNNN8Mtbz5rfgiZVFvbBgR7ADr3iqIoOYAP4UTkdMi84Q7ofe
 XthY7tJIwYQTeITmLUWVxhvusCRFEzHd2nlJK414Z7qRHzMF0/R4HwoOkrFVs/ls6YBd
 7A/g==
X-Gm-Message-State: ACgBeo169ZX7gkOGnf91jKxqZknx0kvjUytuhh0ERBykPOGO2aIBigLH
 IYi4iYykcv1fp4Zt5RfuJOjIvw==
X-Google-Smtp-Source: AA6agR5+DfOGW9ZsJF6lcADXT426dGq0vq/noAZl6exE09uiYQqK2tj/nDF1BUr9pOA4ipJxSB7qYA==
X-Received: by 2002:a05:6000:1865:b0:228:de57:f1c8 with SMTP id
 d5-20020a056000186500b00228de57f1c8mr14944592wri.370.1662976924860; 
 Mon, 12 Sep 2022 03:02:04 -0700 (PDT)
Received: from [192.168.44.231] ([89.101.193.70])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a05600c4e0b00b003b492753826sm327844wmq.43.2022.09.12.03.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 03:02:04 -0700 (PDT)
Message-ID: <f8b05c03-9e78-679c-3eae-7940b54afdfc@linaro.org>
Date: Mon, 12 Sep 2022 11:02:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 06/37] target/i386: add ALU load/writeback core
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-7-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-7-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.101,
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

On 9/12/22 00:03, Paolo Bonzini wrote:
> Add generic code generation that takes care of preparing operands
> around calls to decode.e.gen in a table-driven manner, so that ALU
> operations need not take care of that.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/tcg/decode-new.c.inc |  20 +++-
>   target/i386/tcg/decode-new.h     |   1 +
>   target/i386/tcg/emit.c.inc       | 152 +++++++++++++++++++++++++++++++
>   target/i386/tcg/translate.c      |  24 +++++
>   4 files changed, 195 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
> index de8ef51a2d..7f76051b2d 100644
> --- a/target/i386/tcg/decode-new.c.inc
> +++ b/target/i386/tcg/decode-new.c.inc
> @@ -228,7 +228,7 @@ static bool decode_op_size(DisasContext *s, X86OpEntry *e, X86OpSize size, MemOp
>               *ot = MO_64;
>               return true;
>           }
> -        if (s->vex_l && e->s0 != X86_SIZE_qq) {
> +        if (s->vex_l && e->s0 != X86_SIZE_qq && e->s1 != X86_SIZE_qq) {
>               return false;
>           }

Squash back?

> diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
> index e86364ffc1..6fa0062d6a 100644
> --- a/target/i386/tcg/emit.c.inc
> +++ b/target/i386/tcg/emit.c.inc
> @@ -29,3 +29,155 @@ static void gen_load_ea(DisasContext *s, AddressParts *mem)
>       TCGv ea = gen_lea_modrm_1(s, *mem);
>       gen_lea_v_seg(s, s->aflag, ea, mem->def_seg, s->override);
>   }
> +
> +static void gen_mmx_offset(TCGv_ptr ptr, X86DecodedOp *op)
> +{
> +    if (!op->has_ea) {
> +        op->offset = offsetof(CPUX86State, fpregs[op->n].mmx);
> +    } else {
> +        op->offset = offsetof(CPUX86State, mmx_t0);
> +    }
> +    tcg_gen_addi_ptr(ptr, cpu_env, op->offset);

It's a shame to generate this so early, when you don't know if you'll need it. Better to 
build these in the gen_binary_int_sse helper, immediately before they're required?

> +
> +    /*
> +     * ptr is for passing to helpers, and points to the MMXReg; op->offset
> +     * is for TCG ops and points to the operand.
> +     */
> +    if (op->ot == MO_32) {
> +        op->offset += offsetof(MMXReg, MMX_L(0));
> +    }

I guess you'd need an op->offset_base if you do the above...
Switch and g_assert_not_reached on invalid ot?

> +static int xmm_offset(MemOp ot)
> +{
> +    if (ot == MO_8) {
> +        return offsetof(ZMMReg, ZMM_B(0));
> +    } else if (ot == MO_16) {
> +        return offsetof(ZMMReg, ZMM_W(0));
> +    } else if (ot == MO_32) {
> +        return offsetof(ZMMReg, ZMM_L(0));
> +    } else if (ot == MO_64) {
> +        return offsetof(ZMMReg, ZMM_Q(0));
> +    } else if (ot == MO_128) {
> +        return offsetof(ZMMReg, ZMM_X(0));
> +    } else if (ot == MO_256) {
> +        return offsetof(ZMMReg, ZMM_Y(0));
> +    } else {
> +       abort();

Switch, g_assert_not_reached().

> +static void gen_load_sse(DisasContext *s, TCGv temp, MemOp ot, int dest_ofs)
> +{
> +    if (ot == MO_8) {
> +        gen_op_ld_v(s, MO_8, temp, s->A0);
> +        tcg_gen_st8_tl(temp, cpu_env, dest_ofs);
> +    } else if (ot == MO_16) {
> +        gen_op_ld_v(s, MO_16, temp, s->A0);
> +        tcg_gen_st16_tl(temp, cpu_env, dest_ofs);
> +    } else if (ot == MO_32) {
> +        gen_op_ld_v(s, MO_32, temp, s->A0);
> +        tcg_gen_st32_tl(temp, cpu_env, dest_ofs);
> +    } else if (ot == MO_64) {
> +        gen_ldq_env_A0(s, dest_ofs);
> +    } else if (ot == MO_128) {
> +        gen_ldo_env_A0(s, dest_ofs);
> +    } else if (ot == MO_256) {
> +        gen_ldy_env_A0(s, dest_ofs);
> +    }

Likewise.

> +static void gen_writeback(DisasContext *s, X86DecodedOp *op)
> +{
> +    switch (op->unit) {
> +    case X86_OP_SKIP:
> +        break;
> +    case X86_OP_SEG:
> +        /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
> +        gen_movl_seg_T0(s, op->n);
> +        if (s->base.is_jmp) {
> +            gen_jmp_im(s, s->pc - s->cs_base);
> +            if (op->n == R_SS) {
> +                s->flags &= ~HF_TF_MASK;
> +                gen_eob_inhibit_irq(s, true);
> +            } else {
> +                gen_eob(s);
> +            }
> +        }
> +        break;
> +    case X86_OP_CR:
> +    case X86_OP_DR:
> +        /* TBD */
> +        break;

Leave these adjacent with default abort until needed?

> +    default:
> +        abort();
> +    }

g_assert_not_reached.

> +static inline void gen_ldy_env_A0(DisasContext *s, int offset)
> +{
> +    int mem_index = s->mem_index;
> +    gen_ldo_env_A0(s, offset);
> +    tcg_gen_addi_tl(s->tmp0, s->A0, 16);
> +    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
> +    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(2)));
> +    tcg_gen_addi_tl(s->tmp0, s->A0, 24);
> +    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
> +    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(3)));
> +}
> +
> +static inline void gen_sty_env_A0(DisasContext *s, int offset)
> +{
> +    int mem_index = s->mem_index;
> +    gen_sto_env_A0(s, offset);
> +    tcg_gen_addi_tl(s->tmp0, s->A0, 16);
> +    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(2)));
> +    tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
> +    tcg_gen_addi_tl(s->tmp0, s->A0, 24);
> +    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(3)));
> +    tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
> +}

No need for inline markers.

Note that there's an outstanding patch set that enforces alignment restrictions (for 
ldy/sty it would only be for vmovdqa etc):

https://lore.kernel.org/qemu-devel/20220830034816.57091-2-ricky@rzhou.org/

but it's definitely something that ought to build into the new decoder from the start.


r~


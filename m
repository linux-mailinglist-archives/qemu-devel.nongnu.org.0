Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C335B573B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 11:34:21 +0200 (CEST)
Received: from localhost ([::1]:39550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXfpb-0006Dd-Em
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 05:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXfll-0004ez-8R
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 05:30:21 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:37500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXflj-0007wX-0N
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 05:30:20 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-127f5411b9cso21799202fac.4
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 02:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=SUUq0/fAq/bnAsypqgZCWMixwRxXxGSDsZ7h+jKzf3g=;
 b=qj6I1HdYgGhQ3q1X/Mx6n7P3WGxuUIRRJqrGv/PSXkO3U84cTUPLfj8r/oZUvVnxpL
 fW/fgDhJ0LE6fMQTVIBzPNraegZ+vCksaCs5+dvuUB5y1EHdcRx41VkvQ9KxlZejHAcy
 CecFIuqMFTbIYF/IzmvNQ0TkM5AcP2RTAyAbruj4uVIayX2B261MmEq393wukLhgmDKe
 Et0YJH0VEFD1FEzg6eM2r3M0ixMhAaSqtL4jyPsodE4BpGdjQPuuQBrOC8IkKEx5HynM
 U2ELvjRk0/20ZepnNhEZi+6NdnQyIahV6q/zQjXidY4PhgOCG4fcSvoL9OytLdtNv2Pi
 3zPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=SUUq0/fAq/bnAsypqgZCWMixwRxXxGSDsZ7h+jKzf3g=;
 b=ZQsMpGG1BWgEi7tYGzP4yUFWhBOkSCYlxhOC8MqlLVssnzvPfzhrEZGrzA6p8Q1QUo
 tQiZuf8n1vB01O0FXfDRbl1wIMqv71vwcot9r7c/dDWba0kKP4JAfW/H0FtsVfODxMYg
 MfqqTQOtxxDSnP6gk62lMlo8h91yBSbHkWAQL1ZGTpH/lTgErtWgdEneedWtjGPk3ahg
 MS1qSNVeSx6JXY34fe2baJ1O22ISOgsncPMTqi4wCusGN8XeWatAS1R2HMABsg+x0+J3
 e0Uwc8qrM173VMgT6BZ00YhcZrjoiDbxIIKk5mkVSBM7G26wmD/CVWxjH1xaVPOHg46A
 qglw==
X-Gm-Message-State: ACgBeo04tVBNW7pfXlrY1mNwrZQt+gXpcYYARIVDna6FPY07R4xWFeNj
 rQTb5APBfZcB/CILtsnAzs4SdA==
X-Google-Smtp-Source: AA6agR4l/4NTfFQLO0ee1TuauqqvfV3gv5ualHv92e/kDu+Yxt9azpJq9e2a6I2kCiu/wpDP05AzAg==
X-Received: by 2002:a05:6870:b01e:b0:11d:fbe9:90e7 with SMTP id
 y30-20020a056870b01e00b0011dfbe990e7mr11085423oae.32.1662975015224; 
 Mon, 12 Sep 2022 02:30:15 -0700 (PDT)
Received: from [192.168.44.231] ([172.102.14.47])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a056808020200b00344f28a7a4csm3641507oie.22.2022.09.12.02.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 02:30:14 -0700 (PDT)
Message-ID: <84f6abe8-ff6a-0a69-d415-1f63b7f57bea@linaro.org>
Date: Mon, 12 Sep 2022 10:27:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 05/37] target/i386: add core of new i386 decoder
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-6-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-6-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
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
> +    case X86_TYPE_B:  /* VEX.vvvv selects a GPR */
> +        op->unit = X86_OP_INT;
> +        op->n = s->vex_v;
> +        break;

Could use a comment for where missing vex prefix is diagnosed.
I guess it's one of the "vexN" group markers in the insn table?

> +    case X86_TYPE_S:  /* reg selects a segment register */
> +        op->unit = X86_OP_SEG;
> +        goto get_reg;
> +
> +        goto get_reg;

Stray goto.

> +
> +    case X86_TYPE_V:  /* reg in the modrm byte selects an XMM/YMM register */
> +        if (decode->e.special == X86_SPECIAL_MMX &&
> +            !(s->prefix & (PREFIX_DATA | PREFIX_REPZ | PREFIX_REPNZ))) {
> +    case X86_TYPE_P:  /* reg in the modrm byte selects an MMX register */
> +            op->unit = X86_OP_MMX;
> +        } else {
> +            op->unit = X86_OP_SSE;
> +        }
> +    get_reg:

Nesting P into the if works, but it's ugly.
Better to separate it out as

     case X86_TYPE_P:
         op->unit = X86_OP_MMX;
         goto get_reg;

> +    case X86_TYPE_W:  /* XMM/YMM modrm operand */
> +        if (decode->e.special == X86_SPECIAL_MMX &&
> +            !(s->prefix & (PREFIX_DATA | PREFIX_REPZ | PREFIX_REPNZ))) {
> +    case X86_TYPE_Q:  /* MMX modrm operand */
> +            op->unit = X86_OP_MMX;
> +        } else {
> +            op->unit = X86_OP_SSE;
> +        }
> +        goto get_modrm;

Likewise.

> +    case X86_TYPE_U:  /* R/M in the modrm byte selects an XMM/YMM register */
> +        if (decode->e.special == X86_SPECIAL_MMX &&
> +            !(s->prefix & (PREFIX_DATA | PREFIX_REPZ | PREFIX_REPNZ))) {
> +    case X86_TYPE_N:  /* R/M in the modrm byte selects an MMX register */
> +            op->unit = X86_OP_MMX;
> +        } else {
> +            op->unit = X86_OP_SSE;
> +        }
> +        goto get_modrm_reg;

Likewise.

> +    case X86_TYPE_H:  /* For AVX, VEX.vvvv selects an XMM/YMM register */
> +        if ((s->prefix & PREFIX_VEX)) {
> +            op->unit = X86_OP_SSE;
> +            op->n = s->vex_v;
> +            break;

Similar to X86_TYPE_B, should this diagnose error if missing VEX?

> +  e X86_TYPE_J:  /* Relative offset for a jump */
> +        op->unit = X86_OP_IMM;
> +        decode->immediate = insn_get_signed(env, s, op->ot);

Mailer damage?

> +        decode->immediate += s->pc - s->cs_base;

Please consider

https://lore.kernel.org/qemu-devel/20220906100932.343523-1-richard.henderson@linaro.org/

or at least the first half of the patch set, which rationalizes and consolidates the 
handing of s->cs_base.

> +    default:
> +        abort();

g_assert_not_reached().

> +static bool decode_insn(DisasContext *s, CPUX86State *env, X86DecodeFunc decode_func,
> +                        X86DecodedInsn *decode)
> +{
> +    X86OpEntry *e = &decode->e;
> +
> +    decode_func(s, env, e, &decode->b);
> +    while (e->is_decode) {
> +        e->is_decode = false;
> +        e->decode(s, env, e, &decode->b);
> +    }
> +
> +    /* First compute size of operands in order to initialize s->rip_offset.  */
> +    if (e->op0 != X86_TYPE_None) {
> +        if (!decode_op_size(s, e, e->s0, &decode->op[0].ot)) {
> +            return false;
> +        }
> +        if (e->op0 == X86_TYPE_I) {
> +            s->rip_offset += 1 << decode->op[0].ot;
> +        }
> +    }
> +    if (e->op1 != X86_TYPE_None) {
> +        if (!decode_op_size(s, e, e->s1, &decode->op[1].ot)) {
> +            return false;
> +        }
> +        if (e->op1 == X86_TYPE_I) {
> +            s->rip_offset += 1 << decode->op[1].ot;
> +        }
> +    }
> +    if (e->op2 != X86_TYPE_None) {
> +        if (!decode_op_size(s, e, e->s2, &decode->op[2].ot)) {
> +            return false;
> +        }
> +        if (e->op2 == X86_TYPE_I) {
> +            s->rip_offset += 1 << decode->op[2].ot;
> +        }
> +    }
> +    if (e->op3 != X86_TYPE_None) {
> +        assert(e->op3 == X86_TYPE_I && e->s3 == X86_SIZE_b);
> +        s->rip_offset += 1;
> +    }
> +
> +    if (e->op0 != X86_TYPE_None &&
> +        !decode_op(s, env, decode, &decode->op[0], e->op0, decode->b)) {
> +        return false;
> +    }
> +
> +    if (e->op1 != X86_TYPE_None &&
> +        !decode_op(s, env, decode, &decode->op[1], e->op1, decode->b)) {
> +        return false;
> +    }
> +
> +    if (e->op2 != X86_TYPE_None &&
> +        !decode_op(s, env, decode, &decode->op[2], e->op2, decode->b)) {
> +        return false;
> +    }
> +
> +    if (e->op3 != X86_TYPE_None) {
> +        decode->immediate = insn_get_signed(env, s, MO_8);
> +    }
> +
> +    return true;
> +}
> +
> +/* convert one instruction. s->base.is_jmp is set if the translation must
> +   be stopped. Return the next pc value */
> +static target_ulong disas_insn_new(DisasContext *s, CPUState *cpu, int b)

Note patch 2 from the cs_base cleanup above changes the return type from disas_insn to bool.

> +{
> +    CPUX86State *env = cpu->env_ptr;
> +    bool first = true;
> +    X86DecodedInsn decode;
> +    X86DecodeFunc decode_func = decode_root;
> +
> +#ifdef CONFIG_USER_ONLY
> +    if (limit) { --limit; }
> +#endif
> +    s->has_modrm = false;
> +#if 0
> +    s->pc_start = s->pc = s->base.pc_next;
> +    s->override = -1;
> +#ifdef TARGET_X86_64
> +    s->rex_w = false;
> +    s->rex_r = 0;
> +    s->rex_x = 0;
> +    s->rex_b = 0;
> +#endif
> +    s->prefix = 0;
> +    s->rip_offset = 0; /* for relative ip address */
> +    s->vex_l = 0;
> +    s->vex_v = 0;
> +    if (sigsetjmp(s->jmpbuf, 0) != 0) {
> +        gen_exception_gpf(s);
> +        return s->pc;
> +    }

Mainline has two longjmp error paths:
(1) insn too long: raise #GP,
(2) insn crosses page boundary, and isn't first in the TB:
     undo processing and defer insn to next TB.

> +static inline target_long insn_get_signed(CPUX86State *env, DisasContext *s, MemOp ot)

No need for inline.


r~


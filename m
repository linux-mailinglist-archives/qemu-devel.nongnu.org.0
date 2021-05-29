Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82BC394C62
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 15:54:16 +0200 (CEST)
Received: from localhost ([::1]:47524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmzPr-0001ld-Fr
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 09:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmzOY-0008BA-TD
 for qemu-devel@nongnu.org; Sat, 29 May 2021 09:52:54 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:37412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmzOX-0005s5-66
 for qemu-devel@nongnu.org; Sat, 29 May 2021 09:52:54 -0400
Received: by mail-oi1-f175.google.com with SMTP id h9so7303866oih.4
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 06:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=69pVGTfD7bKg+QIpbEtVJnBYlqXkd9J5BDw24WdqaQU=;
 b=jabaeRwU7SbGAXNZmYkuheOcFGGj0JphY/lkCH+v3jdL3lRgacMBFloZc/Utdc/WNz
 OqqDt9xl36pSVGND7ZLpfzYvmje7PLJMuJ+rXFomB7WhXLNjFaoaiAjiDobF9KsRa63b
 hFun275x5cPk+QMC0TZN7BaQ7zvHEifPzZ4gHGe1KhUDslnG1PEvX3Ao2E5iHo9IMY0l
 vkGTJnWaS/y7BKgqs8cqAKXLEWLQj/fC71tcFtZyX8kBF9ZZGJKzLbUrZMJBO7ETYvcV
 c20JjugitlDPXEiAipPGsUyd3Q2l0zVR5cYm1m/n9zjvLj4ix10sCf+AK4oXiXC2nJGz
 Ma5w==
X-Gm-Message-State: AOAM531uSGnvBVMvWPIPHWBYQj85djtPjW4eNWgVnR10dT4jSfH4acO7
 emz6Fy7CuQPB9CNAPjv6NIlCb8GOvBDeDA/c6x8=
X-Google-Smtp-Source: ABdhPJzxFGEW3RiY5sXI5xwD350dwTl0tojCMkTh67ugpnp6xTvQFhOJCrkIJSgVALkYTLG880CYYxcIeeUYkZVVk6E=
X-Received: by 2002:aca:ed41:: with SMTP id l62mr12577202oih.175.1622296372040; 
 Sat, 29 May 2021 06:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <1534789014-8310-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1534789014-8310-9-git-send-email-aleksandar.markovic@rt-rk.com>
In-Reply-To: <1534789014-8310-9-git-send-email-aleksandar.markovic@rt-rk.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 29 May 2021 15:52:41 +0200
Message-ID: <CAAdtpL7jGOxhaqA-gLSRX_6FktEm89AMW-xkV=n+mEjWd-O1iA@mail.gmail.com>
Subject: Re: [PATCH v11 08/46] target/mips: Add emulation of nanoMIPS 16-bit
 branch instructions
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.167.175;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f175.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dimitrije Nikolic <dnikolic@wavecomp.com>,
 Stefan Markovic <smarkovic@wavecomp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Petar Jovanovic <pjovanovic@wavecomp.com>, Paul Burton <pburton@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 20, 2018 at 8:17 PM Aleksandar Markovic
<aleksandar.markovic@rt-rk.com> wrote:
>
> From: Stefan Markovic <smarkovic@wavecomp.com>
>
> Add emulation of nanoMIPS 16-bit branch instructions.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Yongbok Kim <yongbok.kim@mips.com>
> Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> Signed-off-by: Stefan Markovic <smarkovic@wavecomp.com>
> ---
>  target/mips/translate.c | 158 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 158 insertions(+)
>
> diff --git a/target/mips/translate.c b/target/mips/translate.c
> index 261680e..b0bbf4c 100644
> --- a/target/mips/translate.c
> +++ b/target/mips/translate.c
> @@ -4564,6 +4564,128 @@ static void gen_compute_branch (DisasContext *ctx, uint32_t opc,
>      tcg_temp_free(t1);
>  }
>
> +
> +/* nanoMIPS Branches */
> +static void gen_compute_branch_nm(DisasContext *ctx, uint32_t opc,
> +                                int insn_bytes,
> +                                int rs, int rt, int32_t offset)
> +{
> +    target_ulong btgt = -1;
> +    int bcond_compute = 0;
> +    TCGv t0 = tcg_temp_new();
> +    TCGv t1 = tcg_temp_new();
> +
> +    /* Load needed operands */
> +    switch (opc) {
> +    case OPC_BEQ:
> +    case OPC_BNE:
> +        /* Compare two registers */
> +        if (rs != rt) {
> +            gen_load_gpr(t0, rs);
> +            gen_load_gpr(t1, rt);
> +            bcond_compute = 1;
> +        }
> +        btgt = ctx->base.pc_next + insn_bytes + offset;
> +        break;
> +    case OPC_BGEZAL:
> +        /* Compare to zero */
> +        if (rs != 0) {
> +            gen_load_gpr(t0, rs);
> +            bcond_compute = 1;
> +        }
> +        btgt = ctx->base.pc_next + insn_bytes + offset;
> +        break;
> +    case OPC_BPOSGE32:
> +        tcg_gen_andi_tl(t0, cpu_dspctrl, 0x3F);
> +        bcond_compute = 1;
> +        btgt = ctx->base.pc_next + insn_bytes + offset;
> +        break;
> +    case OPC_JR:
> +    case OPC_JALR:
> +        /* Jump to register */
> +        if (offset != 0 && offset != 16) {
> +            /* Hint = 0 is JR/JALR, hint 16 is JR.HB/JALR.HB, the
> +               others are reserved. */
> +            MIPS_INVAL("jump hint");
> +            generate_exception_end(ctx, EXCP_RI);
> +            goto out;
> +        }
> +        gen_load_gpr(btarget, rs);
> +        break;
> +    default:
> +        MIPS_INVAL("branch/jump");
> +        generate_exception_end(ctx, EXCP_RI);
> +        goto out;
> +    }
> +    if (bcond_compute == 0) {
> +        /* No condition to be computed */
> +        switch (opc) {
> +        case OPC_BEQ:     /* rx == rx        */
> +            /* Always take */
> +            ctx->hflags |= MIPS_HFLAG_B;
> +            break;
> +        case OPC_BGEZAL:  /* 0 >= 0          */
> +            /* Always take and link */
> +            tcg_gen_movi_tl(cpu_gpr[31],
> +                            ctx->base.pc_next + insn_bytes);
> +            ctx->hflags |= MIPS_HFLAG_B;
> +            break;
> +        case OPC_BNE:     /* rx != rx        */
> +            tcg_gen_movi_tl(cpu_gpr[31], ctx->base.pc_next + 8);
> +            /* Skip the instruction in the delay slot */
> +            ctx->base.pc_next += 4;
> +            goto out;
> +        case OPC_JR:
> +            ctx->hflags |= MIPS_HFLAG_BR;
> +            break;
> +        case OPC_JALR:
> +            if (rt > 0) {
> +                tcg_gen_movi_tl(cpu_gpr[rt],
> +                                ctx->base.pc_next + insn_bytes);
> +            }
> +            ctx->hflags |= MIPS_HFLAG_BR;
> +            break;
> +        default:
> +            MIPS_INVAL("branch/jump");
> +            generate_exception_end(ctx, EXCP_RI);
> +            goto out;
> +        }
> +    } else {
> +        switch (opc) {
> +        case OPC_BEQ:
> +            tcg_gen_setcond_tl(TCG_COND_EQ, bcond, t0, t1);
> +            goto not_likely;
> +        case OPC_BNE:
> +            tcg_gen_setcond_tl(TCG_COND_NE, bcond, t0, t1);
> +            goto not_likely;
> +        case OPC_BGEZAL:
> +            tcg_gen_setcondi_tl(TCG_COND_GE, bcond, t0, 0);
> +            tcg_gen_movi_tl(cpu_gpr[31],
> +                            ctx->base.pc_next + insn_bytes);
> +            goto not_likely;
> +        case OPC_BPOSGE32:
> +            tcg_gen_setcondi_tl(TCG_COND_GE, bcond, t0, 32);

This opcode implementation seems incomplete, per the ISA manual:

If a control transfer instruction (CTI) is executed in the forbidden
slot of a branch or jump, Release 6 implementations are required to
signal a Reserved Instruction Exception. A CTI is considered to be one
of the following instructions: branch, jump, NAL (Release 6), ERET,
ERETNC (Release 5), DERET, WAIT, or PAUSE (Release 2). An instruction
is in the forbidden slot if it is the instruction following the
branch.

> +        not_likely:
> +            ctx->hflags |= MIPS_HFLAG_BC;
> +            break;
> +        default:
> +            MIPS_INVAL("conditional branch/jump");
> +            generate_exception_end(ctx, EXCP_RI);
> +            goto out;
> +        }
> +    }
> +
> +    ctx->btarget = btgt;
> +
> + out:
> +    if (insn_bytes == 2) {
> +        ctx->hflags |= MIPS_HFLAG_B16;
> +    }
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +}


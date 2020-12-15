Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F862DB2B6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 18:35:40 +0100 (CET)
Received: from localhost ([::1]:45612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEEd-0007kY-4d
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 12:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kpEAL-000429-EU
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:31:15 -0500
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:41026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kpEAH-0006LD-Gh
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:31:13 -0500
Received: by mail-io1-xd42.google.com with SMTP id t8so21275091iov.8
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 09:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q6MpOtRKWQwHie/GsUBm4FTBhJibws+etc2c5ffU/VA=;
 b=nghb/SeMC4yTzoIoFGOXGBBaC4jGkapoh3iZqDLapomjgp+XSTSg0msVUB2nGfFOla
 p0o7/Y3LDmkVrmk1S9Kiv5bc+SRfN06NAhNdlG9eDCqGx/tXHatIvId3NCh+qk1H+F9T
 0vjhsFuGwUQOsWn7EV3KgiVXvcbdLbGlk+bCmiyt7rdSIO0T70+ONNbnq+I89dP+zROX
 SilAqgBEe4eMnqTyOfKpeg7Wxhb2qWEasqx/4B1bT2y9nWoiWDtimkoI6GsBSiGxhkgv
 ZcUNHzL5FMzS7KsqG+tMUAgHLDE4INX2JxO/JMnWFixPU6IGULZofBeGC4DxKVEPT91A
 04Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q6MpOtRKWQwHie/GsUBm4FTBhJibws+etc2c5ffU/VA=;
 b=GgyokgElIYp51evwmMNBs1I5+Kk+eYmL/NVTdMJEtQFgLr1q66Fhe7mcPoMGNMuSuY
 dTpPMHhnyW+fGuW4WB2hR6huwEDzgXOMKWOwC6VH2bl0JWlZFA5xm3d8mDmTRRLniDf4
 JQkM7hw0YsFtF+3H7PT9UZO/6SOVFrJmqZE+BhTTg4129y8qPUk/mfGH9uLH6zbs3jws
 tkWKHy1BDZgcvQQtxFg6Ih8RaYMvhIyP+BxlM786W1wOZhs6UuiiF4Qor5/O1dTFfKye
 iz4BeNePGtyoHqcUjnAWhHUYUoLe8a1QTBzdIwhqiMhCM2zhM/zwIJkkkyLrkhkKjl6/
 hsxg==
X-Gm-Message-State: AOAM530GcNRBL7ARmLP+q7aHzEbev1PjA2bn5N0gMwFeacVQbTNa3wXu
 RfLb5AtlcZ50UsWwBcAYBu4+5rnQc/4Ts1FFAMM=
X-Google-Smtp-Source: ABdhPJxQ9y9NkuvlujLgbPIATLegNDUXfbE4NFXRL2qJ2i+fniypygLhQqCAZbpdGkjord0Zz5RYFteRjTYhzESC3Ss=
X-Received: by 2002:a02:ca09:: with SMTP id i9mr27082541jak.135.1608053468185; 
 Tue, 15 Dec 2020 09:31:08 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-36-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-36-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 15 Dec 2020 09:30:41 -0800
Message-ID: <CAKmqyKMtf1vguve_ocRA7natAmxGRZt3Y0JP9=6JS1yrcPOwOA@mail.gmail.com>
Subject: Re: [PATCH v4 35/43] tcg/riscv: Remove branch-over-branch fallback
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 6:32 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since 7ecd02a06f8, we are prepared to re-start code generation
> with a smaller TB if a relocation is out of range.  We no longer
> need to leave a nop in the stream Just In Case.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tcg/riscv/tcg-target.c.inc | 56 ++++----------------------------------
>  1 file changed, 6 insertions(+), 50 deletions(-)
>
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 195c3eff03..02beb86977 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -469,43 +469,16 @@ static bool reloc_call(tcg_insn_unit *code_ptr, const tcg_insn_unit *target)
>  static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
>                          intptr_t value, intptr_t addend)
>  {
> -    uint32_t insn = *code_ptr;
> -    intptr_t diff;
> -    bool short_jmp;
> -
>      tcg_debug_assert(addend == 0);
> -
>      switch (type) {
>      case R_RISCV_BRANCH:
> -        diff = value - (uintptr_t)code_ptr;
> -        short_jmp = diff == sextreg(diff, 0, 12);
> -        if (short_jmp) {
> -            return reloc_sbimm12(code_ptr, (tcg_insn_unit *)value);
> -        } else {
> -            /* Invert the condition */
> -            insn = insn ^ (1 << 12);
> -            /* Clear the offset */
> -            insn &= 0x01fff07f;
> -            /* Set the offset to the PC + 8 */
> -            insn |= encode_sbimm12(8);
> -
> -            /* Move forward */
> -            code_ptr[0] = insn;
> -
> -            /* Overwrite the NOP with jal x0,value */
> -            diff = value - (uintptr_t)(code_ptr + 1);
> -            insn = encode_uj(OPC_JAL, TCG_REG_ZERO, diff);
> -            code_ptr[1] = insn;
> -
> -            return true;
> -        }
> -        break;
> +        return reloc_sbimm12(code_ptr, (tcg_insn_unit *)value);
>      case R_RISCV_JAL:
>          return reloc_jimm20(code_ptr, (tcg_insn_unit *)value);
>      case R_RISCV_CALL:
>          return reloc_call(code_ptr, (tcg_insn_unit *)value);
>      default:
> -        tcg_abort();
> +        g_assert_not_reached();
>      }
>  }
>
> @@ -779,21 +752,8 @@ static void tcg_out_brcond(TCGContext *s, TCGCond cond, TCGReg arg1,
>          arg2 = t;
>      }
>
> -    if (l->has_value) {
> -        intptr_t diff = tcg_pcrel_diff(s, l->u.value_ptr);
> -        if (diff == sextreg(diff, 0, 12)) {
> -            tcg_out_opc_branch(s, op, arg1, arg2, diff);
> -        } else {
> -            /* Invert the conditional branch.  */
> -            tcg_out_opc_branch(s, op ^ (1 << 12), arg1, arg2, 8);
> -            tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, diff - 4);
> -        }
> -    } else {
> -        tcg_out_reloc(s, s->code_ptr, R_RISCV_BRANCH, l, 0);
> -        tcg_out_opc_branch(s, op, arg1, arg2, 0);
> -        /* NOP to allow patching later */
> -        tcg_out_opc_imm(s, OPC_ADDI, TCG_REG_ZERO, TCG_REG_ZERO, 0);
> -    }
> +    tcg_out_reloc(s, s->code_ptr, R_RISCV_BRANCH, l, 0);
> +    tcg_out_opc_branch(s, op, arg1, arg2, 0);
>  }
>
>  static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
> @@ -1009,8 +969,6 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
>      /* Compare masked address with the TLB entry. */
>      label_ptr[0] = s->code_ptr;
>      tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
> -    /* NOP to allow patching later */
> -    tcg_out_opc_imm(s, OPC_ADDI, TCG_REG_ZERO, TCG_REG_ZERO, 0);
>
>      /* TLB Hit - translate address using addend.  */
>      if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
> @@ -1054,8 +1012,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
>      }
>
>      /* resolve label address */
> -    if (!patch_reloc(l->label_ptr[0], R_RISCV_BRANCH,
> -                     (intptr_t) s->code_ptr, 0)) {
> +    if (!reloc_sbimm12(l->label_ptr[0], s->code_ptr)) {
>          return false;
>      }
>
> @@ -1089,8 +1046,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
>      }
>
>      /* resolve label address */
> -    if (!patch_reloc(l->label_ptr[0], R_RISCV_BRANCH,
> -                     (intptr_t) s->code_ptr, 0)) {
> +    if (!reloc_sbimm12(l->label_ptr[0], s->code_ptr)) {
>          return false;
>      }
>
> --
> 2.25.1
>
>


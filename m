Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E7148AD26
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 12:58:24 +0100 (CET)
Received: from localhost ([::1]:44406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7FnD-0006M4-8o
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 06:58:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7FlY-0004oV-Ff
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 06:56:40 -0500
Received: from [2a00:1450:4864:20::435] (port=42759
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7FlW-0001kQ-SV
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 06:56:40 -0500
Received: by mail-wr1-x435.google.com with SMTP id k30so14910028wrd.9
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 03:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2iN0rHzz+Q5BoVxm/EU6rSAz4U8cx3A0dmMo5BQv4Pg=;
 b=CinWfGKJUU/Krm2ea0gJemPksjLuZq8MTqcsk+XdRNYiNhgQB31L8O0HhH+N3FADx/
 nj/WzzGLTgTaQ4FLIjsipu8q2jaku/5ZtvwNZmr8QXZhM+exzWUywxQ4CimLGKx1TmtY
 6RvNsENrMCmqvKGNkE1F29tYv9OY9XtWfKWXld9BvaiwieDUc1nZ5wCZXXdf9GmZBxjb
 FeFjjsJr700d7vMts0banq/o5+Uj/AbSJqACYYNIF1/Mc79qi2DBCvrW/NGD56/MiyfY
 wskMIrjBQuwo0yg+GNk5ovyolWC2RxzASkbdgpYjJoGDJ6mIH2wOXqJig+5/T14ZLtJE
 o3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2iN0rHzz+Q5BoVxm/EU6rSAz4U8cx3A0dmMo5BQv4Pg=;
 b=X4V281mPOWM30IJ58ghFYoxAHC9vrmj4eq32mJ2Mbx8WBZ8ix5MGhBrqfeqd6AFY34
 8zqJyzm/Y4U/U8FDcr+251zasYS0O0JLPaIHmbx042ozJD8Qc69hqj/bd7SCCaoCCuxi
 Qpnuy0fkVbRdskvLqjNLUtNKiAcVXmWOn7UaQ9duC1TtMpVz2Guyss1vLAjsjP8VBsPg
 NBtHi5z9mJV8E3e+2YE67DOTuG0RJzkCGaEF7QQ+ZnIbBsjoqwRZrAxpfpgHw6jEi9st
 HnFmMRiaxNyJTX/Xqf0oy3vGIIsXwoGqhzIa9KhQ9Ab21KaQjIBTI0o7vy93OGVq5YKW
 g54A==
X-Gm-Message-State: AOAM533uGnq28cFPUibGDt6dj9YUs6bedNG9f2nFUyakv1mgFSQ5YeEL
 tdu8VDIuvMhyMGMyoGmuxhRuJYlDxJV2sjk/qldXkDLRwHg=
X-Google-Smtp-Source: ABdhPJy71qSeSRWizpHJolL8LDtumnlrKnwPsL+1YegaK6QhCHA0hw3xO3BuBm0Iu06K8XMMAQav6MH4jWQugp+834Q=
X-Received: by 2002:a5d:6986:: with SMTP id g6mr3576215wru.172.1641902197197; 
 Tue, 11 Jan 2022 03:56:37 -0800 (PST)
MIME-Version: 1.0
References: <20220108063313.477784-1-richard.henderson@linaro.org>
 <20220108063313.477784-6-richard.henderson@linaro.org>
In-Reply-To: <20220108063313.477784-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 11:56:25 +0000
Message-ID: <CAFEAcA9VYYS7QFtS_+kiEkE8ZAAuGii-ejDUDnt-hmav8KTg2w@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] tcg/arm: Support unaligned access for softmmu
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 8 Jan 2022 at 06:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From armv6, the architecture supports unaligned accesses.
> All we need to do is perform the correct alignment check
> in tcg_out_tlb_read.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.c.inc | 39 ++++++++++++++++++---------------------
>  1 file changed, 18 insertions(+), 21 deletions(-)
>
> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
> index 8a20224dd1..b6ef279cae 100644
> --- a/tcg/arm/tcg-target.c.inc
> +++ b/tcg/arm/tcg-target.c.inc
> @@ -34,7 +34,6 @@ bool use_idiv_instructions;
>  bool use_neon_instructions;
>  #endif
>
> -/* ??? Ought to think about changing CONFIG_SOFTMMU to always defined.  */

Ah, I see the comment got removed here...

>  #ifdef CONFIG_DEBUG_TCG
>  static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
>      "%r0",  "%r1",  "%r2",  "%r3",  "%r4",  "%r5",  "%r6",  "%r7",
> @@ -1397,16 +1396,9 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
>      int cmp_off = (is_load ? offsetof(CPUTLBEntry, addr_read)
>                     : offsetof(CPUTLBEntry, addr_write));
>      int fast_off = TLB_MASK_TABLE_OFS(mem_index);
> -    unsigned s_bits = opc & MO_SIZE;
> -    unsigned a_bits = get_alignment_bits(opc);
> -
> -    /*
> -     * We don't support inline unaligned acceses, but we can easily
> -     * support overalignment checks.
> -     */
> -    if (a_bits < s_bits) {
> -        a_bits = s_bits;
> -    }
> +    unsigned s_mask = (1 << (opc & MO_SIZE)) - 1;
> +    unsigned a_mask = (1 << get_alignment_bits(opc)) - 1;
> +    TCGReg t_addr;
>
>      /* Load env_tlb(env)->f[mmu_idx].{mask,table} into {r0,r1}.  */
>      tcg_out_ldrd_8(s, COND_AL, TCG_REG_R0, TCG_AREG0, fast_off);
> @@ -1441,27 +1433,32 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
>
>      /*
>       * Check alignment, check comparators.
> -     * Do this in no more than 3 insns.  Use MOVW for v7, if possible,
> +     * Do this in 2-4 insns.  Use MOVW for v7, if possible,
>       * to reduce the number of sequential conditional instructions.
>       * Almost all guests have at least 4k pages, which means that we need
>       * to clear at least 9 bits even for an 8-byte memory, which means it
>       * isn't worth checking for an immediate operand for BIC.
>       */
> +    /* For unaligned accesses, test the page of the last byte. */

"page of the last unit-of-the-alignment-requirement", right?
(If we're doing an 8-byte load that must be 4-aligned, we add 4 to
the address here, not 7.)

> +    t_addr = addrlo;
> +    if (a_mask < s_mask) {
> +        t_addr = TCG_REG_R0;
> +        tcg_out_dat_imm(s, COND_AL, ARITH_ADD, t_addr,
> +                        addrlo, s_mask - a_mask);
> +    }
>      if (use_armv7_instructions && TARGET_PAGE_BITS <= 16) {
> -        tcg_target_ulong mask = ~(TARGET_PAGE_MASK | ((1 << a_bits) - 1));
> -
> -        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, mask);
> +        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, ~(TARGET_PAGE_MASK | a_mask));
>          tcg_out_dat_reg(s, COND_AL, ARITH_BIC, TCG_REG_TMP,
> -                        addrlo, TCG_REG_TMP, 0);
> +                        t_addr, TCG_REG_TMP, 0);
>          tcg_out_dat_reg(s, COND_AL, ARITH_CMP, 0, TCG_REG_R2, TCG_REG_TMP, 0);
>      } else {
> -        if (a_bits) {
> -            tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, addrlo,
> -                            (1 << a_bits) - 1);
> +        if (a_mask) {
> +            tcg_debug_assert(a_mask <= 0xff);
> +            tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, addrlo, a_mask);
>          }
> -        tcg_out_dat_reg(s, COND_AL, ARITH_MOV, TCG_REG_TMP, 0, addrlo,
> +        tcg_out_dat_reg(s, COND_AL, ARITH_MOV, TCG_REG_TMP, 0, t_addr,
>                          SHIFT_IMM_LSR(TARGET_PAGE_BITS));
> -        tcg_out_dat_reg(s, (a_bits ? COND_EQ : COND_AL), ARITH_CMP,
> +        tcg_out_dat_reg(s, (a_mask ? COND_EQ : COND_AL), ARITH_CMP,
>                          0, TCG_REG_R2, TCG_REG_TMP,
>                          SHIFT_IMM_LSL(TARGET_PAGE_BITS));
>      }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

though not very confidently as I found this code pretty confusing.

thanks
-- PMM


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557BA2DB2A9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 18:34:53 +0100 (CET)
Received: from localhost ([::1]:42882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEDs-0006Zj-7P
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 12:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kpEBP-0004m9-3o
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:32:19 -0500
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:35474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kpEBN-0006UF-4Y
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:32:18 -0500
Received: by mail-io1-xd41.google.com with SMTP id m23so6496651ioy.2
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 09:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q6+mKD0olIx/eOb4HIO26iNXd3jVmaPFFTshI6mGxsE=;
 b=NMM57A987Yf2Cxg4mEzLc1wgM3xmWlcKWWuKYU5rstGWUwZVHClnEYcJgG3MVVYxm5
 eEsViixAZxvnEs4X4ip37Pt+Dkdavbh4oetDxb1srCDoKHj5FqlTfST2hxgoBmQQghR2
 rWTN2RPd+1uj1gKW3Td1vde7Q8PVIPb2zTxPeaDnC/X9e4rnmZfZ2sul/DcqrDQoafnS
 hhO0UyMBflqDpZknxzetaFHgIiCQ9Qx+eCpIJOk5b2blJEZ4kCkIFVC0iHPvOjLG6atY
 0d6zqb/rnWrmCVNILBFb5/dD1gDXrHU96KSzBbeez2/p/3m59yS1sXvqgcxLMZFDwJP0
 +KHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q6+mKD0olIx/eOb4HIO26iNXd3jVmaPFFTshI6mGxsE=;
 b=FCnUVZ8HhFGq9tNkjIcBUhdWzNFE46EoPWnwT/SttTSamvlxytKb4F6CqiBBCUS49L
 MGUSARBvjy4TGWQBFzk35XRze/Ve56jyccVb/1inVaqQlkcH6DB2jShi3npEYfMbT2H8
 K72o3BKmjxJWbrwMZR7K2LpiPq6cYkyYOr2UR5qePzoDG995jwmp8/pO0V7zHlvNQzxc
 /zBIcTdb5FEujGfPwpkn9GTtszmupxcn+euG2DSxXhgtNx0sSHDwDDK2uA8LkBK5WABj
 LYc1NBtHTkFQTuSgkb0rXpTPOXhjyWxgRTVV2tkwGW14kOA+jNuHyw8qAIIMmIZ2RvzE
 tnQQ==
X-Gm-Message-State: AOAM532vnkTVn6+AQ5Lkl999KkxtQ0/MfSJWtkYrb4Sjnrm/tLCZG6LO
 28P78ml1bg35J2NzoKF8rcpZbpMnaHV6FrCdYMAdwoxE8RY=
X-Google-Smtp-Source: ABdhPJzXU58LqOEW+PrjgaH7AdsNZwr3D5oVjBVXKvHOI25a9HCSoHfHJBuMsEB9Ak4JQH91lzXKr5ncvNxUL9EACvE=
X-Received: by 2002:a5e:9242:: with SMTP id z2mr39275417iop.175.1608053535937; 
 Tue, 15 Dec 2020 09:32:15 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-37-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-37-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 15 Dec 2020 09:31:49 -0800
Message-ID: <CAKmqyKNJyR63bj5D3Ez-S=u46TB8A6tyH_uF_cu0b=a+izX_7w@mail.gmail.com>
Subject: Re: [PATCH v4 36/43] tcg/riscv: Support split-wx code generation
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
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

On Mon, Dec 14, 2020 at 6:13 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tcg/riscv/tcg-target.h     |  2 +-
>  tcg/riscv/tcg-target.c.inc | 41 +++++++++++++++++++++-----------------
>  2 files changed, 24 insertions(+), 19 deletions(-)
>
> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
> index 785fe37f9b..60b6a1a3fc 100644
> --- a/tcg/riscv/tcg-target.h
> +++ b/tcg/riscv/tcg-target.h
> @@ -170,6 +170,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
>  #define TCG_TARGET_NEED_POOL_LABELS
>
>  #define TCG_TARGET_HAS_MEMORY_BSWAP 0
> -#define TCG_TARGET_SUPPORT_MIRROR   0
> +#define TCG_TARGET_SUPPORT_MIRROR   1
>
>  #endif
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 02beb86977..5c1e0f8fc1 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -425,41 +425,44 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
>   * Relocations
>   */
>
> -static bool reloc_sbimm12(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
> +static bool reloc_sbimm12(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
>  {
> -    intptr_t offset = (intptr_t)target - (intptr_t)code_ptr;
> +    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
> +    intptr_t offset = (intptr_t)target - (intptr_t)src_rx;
>
>      tcg_debug_assert((offset & 1) == 0);
>      if (offset == sextreg(offset, 0, 12)) {
> -        code_ptr[0] |= encode_sbimm12(offset);
> +        *src_rw |= encode_sbimm12(offset);
>          return true;
>      }
>
>      return false;
>  }
>
> -static bool reloc_jimm20(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
> +static bool reloc_jimm20(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
>  {
> -    intptr_t offset = (intptr_t)target - (intptr_t)code_ptr;
> +    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
> +    intptr_t offset = (intptr_t)target - (intptr_t)src_rx;
>
>      tcg_debug_assert((offset & 1) == 0);
>      if (offset == sextreg(offset, 0, 20)) {
> -        code_ptr[0] |= encode_ujimm20(offset);
> +        *src_rw |= encode_ujimm20(offset);
>          return true;
>      }
>
>      return false;
>  }
>
> -static bool reloc_call(tcg_insn_unit *code_ptr, const tcg_insn_unit *target)
> +static bool reloc_call(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
>  {
> -    intptr_t offset = (intptr_t)target - (intptr_t)code_ptr;
> +    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
> +    intptr_t offset = (intptr_t)target - (intptr_t)src_rx;
>      int32_t lo = sextreg(offset, 0, 12);
>      int32_t hi = offset - lo;
>
>      if (offset == hi + lo) {
> -        code_ptr[0] |= encode_uimm20(hi);
> -        code_ptr[1] |= encode_imm12(lo);
> +        src_rw[0] |= encode_uimm20(hi);
> +        src_rw[1] |= encode_imm12(lo);
>          return true;
>      }
>
> @@ -532,7 +535,7 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
>      if (tmp == (int32_t)tmp) {
>          tcg_out_opc_upper(s, OPC_AUIPC, rd, 0);
>          tcg_out_opc_imm(s, OPC_ADDI, rd, rd, 0);
> -        ret = reloc_call(s->code_ptr - 2, (tcg_insn_unit *)val);
> +        ret = reloc_call(s->code_ptr - 2, (const tcg_insn_unit *)val);
>          tcg_debug_assert(ret == true);
>          return;
>      }
> @@ -917,7 +920,7 @@ QEMU_BUILD_BUG_ON(TCG_TARGET_REG_BITS < TARGET_LONG_BITS);
>  QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
>  QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
>
> -static void tcg_out_goto(TCGContext *s, tcg_insn_unit *target)
> +static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
>  {
>      tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, 0);
>      bool ok = reloc_jimm20(s->code_ptr - 1, target);
> @@ -993,7 +996,8 @@ static void add_qemu_ldst_label(TCGContext *s, int is_ld, TCGMemOpIdx oi,
>      label->datahi_reg = datahi;
>      label->addrlo_reg = addrlo;
>      label->addrhi_reg = addrhi;
> -    label->raddr = raddr;
> +    /* TODO: Cast goes away when all hosts converted */
> +    label->raddr = (void *)tcg_splitwx_to_rx(raddr);
>      label->label_ptr[0] = label_ptr[0];
>  }
>
> @@ -1012,7 +1016,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
>      }
>
>      /* resolve label address */
> -    if (!reloc_sbimm12(l->label_ptr[0], s->code_ptr)) {
> +    if (!reloc_sbimm12(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
>          return false;
>      }
>
> @@ -1046,7 +1050,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
>      }
>
>      /* resolve label address */
> -    if (!reloc_sbimm12(l->label_ptr[0], s->code_ptr)) {
> +    if (!reloc_sbimm12(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
>          return false;
>      }
>
> @@ -1232,7 +1236,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
>  #endif
>  }
>
> -static tcg_insn_unit *tb_ret_addr;
> +static const tcg_insn_unit *tb_ret_addr;
>
>  static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>                         const TCGArg *args, const int *const_args)
> @@ -1780,11 +1784,12 @@ static void tcg_target_qemu_prologue(TCGContext *s)
>      tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, tcg_target_call_iarg_regs[1], 0);
>
>      /* Return path for goto_ptr. Set return value to 0 */
> -    tcg_code_gen_epilogue = s->code_ptr;
> +    /* TODO: Cast goes away when all hosts converted */
> +    tcg_code_gen_epilogue = (void *)tcg_splitwx_to_rx(s->code_ptr);
>      tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_A0, TCG_REG_ZERO);
>
>      /* TB epilogue */
> -    tb_ret_addr = s->code_ptr;
> +    tb_ret_addr = tcg_splitwx_to_rx(s->code_ptr);
>      for (i = 0; i < ARRAY_SIZE(tcg_target_callee_save_regs); i++) {
>          tcg_out_ld(s, TCG_TYPE_REG, tcg_target_callee_save_regs[i],
>                     TCG_REG_SP, SAVE_OFS + i * REG_SIZE);
> --
> 2.25.1
>
>


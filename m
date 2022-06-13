Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED4B547D14
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 02:28:59 +0200 (CEST)
Received: from localhost ([::1]:56648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0Xww-0007ba-81
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 20:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o0XvS-0006Pv-R9
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 20:27:26 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:44991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o0XvQ-0003Ff-N4
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 20:27:26 -0400
Received: by mail-pf1-x436.google.com with SMTP id s37so1709538pfg.11
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 17:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TCxbYtVeAWzUSnkIE5WXDr87Nr7MQL8OhQ60cOFg+xw=;
 b=N2OYYaUS6q0COEnmwfJVMMJcw28WWZhW88vtqfhYpyTd/RNa4TWMqqkAtatPg4vuRA
 OV8ZtFTNIruA9P4qmgS4WsqwhHvjh5ZrGmJ8TRI8pHI870oHRWvjM+9gL9q0Z1R7WYME
 yw79d3TtCXcUNkC5FyuJjH1cTw5vNQ/FY72hD9iOPhmEmt/QBXuREWkTcofL4gFh10QD
 Q1iqehliQ/xYwESwycByz10p43yH9hado/f2g5kFkqnlEOlYA5KUqYya05JxUOCw1K5W
 M1OnRQz2hpBUQMIOkiqnzx9fFy/aFqO1sW5D3uz87QixcfAtd4DAiMbJuYCxQm1Fsgeo
 +aDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TCxbYtVeAWzUSnkIE5WXDr87Nr7MQL8OhQ60cOFg+xw=;
 b=ayiNtMzTZ3aXH0eHveLH7uI4SCgVdUnqsuT8iaPBrSaUcb5v12f4CReoO9jwQyy/jg
 oSLfk+cxiZCWSB+RnJ3i6QgP9YTCpKnJ1kwa4ZInFEDWQaRpX+zi6ECP6kFUugfM2ouG
 1GPrj8J3sAgHP4VALy0X6A8ZIdjrQZFz7WHKKJX/ON49La8py3bxEKjxmaF6LWLahkVs
 MhmmxDVikTflqE44kfcAy+Y2Wwg0alij8iX5kSH5zQJ65AUTbwKGspc3ofJp0xiGzXlz
 Ab9SznQxSgFFbRTOijXRlItOfCkLSiI5YGsSrTv2hQ9f9fRZadJz4I/UDnz7IW7n1p+8
 V0QA==
X-Gm-Message-State: AOAM5300Gzd+0rINffWQfRJHGS9vsLR/wi10NM1u3GjKy921x43g3K7z
 ixKrozHJ//YZBPXUIGwjGVNoHNNolh1ld94fD+o=
X-Google-Smtp-Source: ABdhPJwjhMIVmuxE4yGg6XD3b0G86fmbsqIiceL8wPHa31PyKKmN6E3xWDIr1Mj2FQ8nEJ7gTZZLuJfHKl8OtfV+s70=
X-Received: by 2002:a65:6b8a:0:b0:3db:7dc5:fec2 with SMTP id
 d10-20020a656b8a000000b003db7dc5fec2mr47979848pgw.223.1655080040950; Sun, 12
 Jun 2022 17:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220604231004.49990-1-richard.henderson@linaro.org>
 <20220604231004.49990-4-richard.henderson@linaro.org>
In-Reply-To: <20220604231004.49990-4-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Jun 2022 10:26:54 +1000
Message-ID: <CAKmqyKOow89oHVn3saVqgAj8SWHq11y4tdSJgzad17r6xQncaQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/riscv: Minimize the calls to decode_save_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Sun, Jun 5, 2022 at 9:12 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The set of instructions that require decode_save_opc for
> unwinding is really fairly small -- only insns that can
> raise ILLEGAL_INSN at runtime.  This includes CSR, anything
> that uses a *new* fp rounding mode, and many privileged insns.
>
> Since unwind info is stored as the difference from the
> previous insn, storing a 0 for most insns minimizes the
> size of the unwind info.
>
> Booting a debian kernel image to the missing rootfs panic yields
>
> - gen code size       22226819/1026886656
> + gen code size       21601907/1026886656
>
> on 41k TranslationBlocks, a savings of 610kB or a bit less than 3%.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c                       | 18 +++++++++---------
>  target/riscv/insn_trans/trans_privileged.c.inc |  4 ++++
>  target/riscv/insn_trans/trans_rvh.c.inc        |  2 ++
>  target/riscv/insn_trans/trans_rvi.c.inc        |  2 ++
>  4 files changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 6e4bbea1cd..b328a7b2ff 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -204,6 +204,13 @@ static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
>      tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
>  }
>
> +static void decode_save_opc(DisasContext *ctx)
> +{
> +    assert(ctx->insn_start != NULL);
> +    tcg_set_insn_start_param(ctx->insn_start, 1, ctx->opcode);
> +    ctx->insn_start = NULL;
> +}
> +
>  static void gen_set_pc_imm(DisasContext *ctx, target_ulong dest)
>  {
>      if (get_xl(ctx) == MXL_RV32) {
> @@ -633,6 +640,8 @@ static void gen_set_rm(DisasContext *ctx, int rm)
>          return;
>      }
>
> +    /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
> +    decode_save_opc(ctx);
>      gen_helper_set_rounding_mode(cpu_env, tcg_constant_i32(rm));
>  }
>
> @@ -1011,13 +1020,6 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>  /* Include decoders for factored-out extensions */
>  #include "decode-XVentanaCondOps.c.inc"
>
> -static inline void decode_save_opc(DisasContext *ctx, target_ulong opc)
> -{
> -    assert(ctx->insn_start != NULL);
> -    tcg_set_insn_start_param(ctx->insn_start, 1, opc);
> -    ctx->insn_start = NULL;
> -}
> -
>  static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>  {
>      /*
> @@ -1034,7 +1036,6 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>
>      /* Check for compressed insn */
>      if (extract16(opcode, 0, 2) != 3) {
> -        decode_save_opc(ctx, opcode);
>          if (!has_ext(ctx, RVC)) {
>              gen_exception_illegal(ctx);
>          } else {
> @@ -1049,7 +1050,6 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>          opcode32 = deposit32(opcode32, 16, 16,
>                               translator_lduw(env, &ctx->base,
>                                               ctx->base.pc_next + 2));
> -        decode_save_opc(ctx, opcode32);
>          ctx->opcode = opcode32;
>          ctx->pc_succ_insn = ctx->base.pc_next + 4;
>
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
> index 53613682e8..46f96ad74d 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -75,6 +75,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
>  {
>  #ifndef CONFIG_USER_ONLY
>      if (has_ext(ctx, RVS)) {
> +        decode_save_opc(ctx);
>          gen_helper_sret(cpu_pc, cpu_env);
>          tcg_gen_exit_tb(NULL, 0); /* no chaining */
>          ctx->base.is_jmp = DISAS_NORETURN;
> @@ -90,6 +91,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
>  static bool trans_mret(DisasContext *ctx, arg_mret *a)
>  {
>  #ifndef CONFIG_USER_ONLY
> +    decode_save_opc(ctx);
>      gen_helper_mret(cpu_pc, cpu_env);
>      tcg_gen_exit_tb(NULL, 0); /* no chaining */
>      ctx->base.is_jmp = DISAS_NORETURN;
> @@ -102,6 +104,7 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
>  static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
>  {
>  #ifndef CONFIG_USER_ONLY
> +    decode_save_opc(ctx);
>      gen_set_pc_imm(ctx, ctx->pc_succ_insn);
>      gen_helper_wfi(cpu_env);
>      return true;
> @@ -113,6 +116,7 @@ static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
>  static bool trans_sfence_vma(DisasContext *ctx, arg_sfence_vma *a)
>  {
>  #ifndef CONFIG_USER_ONLY
> +    decode_save_opc(ctx);
>      gen_helper_tlb_flush(cpu_env);
>      return true;
>  #endif
> diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
> index cebcb3f8f6..4f8aecddc7 100644
> --- a/target/riscv/insn_trans/trans_rvh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvh.c.inc
> @@ -169,6 +169,7 @@ static bool trans_hfence_gvma(DisasContext *ctx, arg_sfence_vma *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
>  #ifndef CONFIG_USER_ONLY
> +    decode_save_opc(ctx);
>      gen_helper_hyp_gvma_tlb_flush(cpu_env);
>      return true;
>  #endif
> @@ -179,6 +180,7 @@ static bool trans_hfence_vvma(DisasContext *ctx, arg_sfence_vma *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
>  #ifndef CONFIG_USER_ONLY
> +    decode_save_opc(ctx);
>      gen_helper_hyp_tlb_flush(cpu_env);
>      return true;
>  #endif
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index f1342f30f8..cf17458022 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -822,6 +822,8 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
>
>  static bool do_csr_post(DisasContext *ctx)
>  {
> +    /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
> +    decode_save_opc(ctx);
>      /* We may have changed important cpu state -- exit to main loop. */
>      gen_set_pc_imm(ctx, ctx->pc_succ_insn);
>      tcg_gen_exit_tb(NULL, 0);
> --
> 2.34.1
>
>


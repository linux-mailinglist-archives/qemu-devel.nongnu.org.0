Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C75A4A5573
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 04:06:35 +0100 (CET)
Received: from localhost ([::1]:44930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEjV3-0001gq-TW
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 22:06:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEjSM-0000ad-QA
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 22:03:46 -0500
Received: from [2607:f8b0:4864:20::d29] (port=39877
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEjSJ-0004Ol-U6
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 22:03:46 -0500
Received: by mail-io1-xd29.google.com with SMTP id c188so19510997iof.6
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 19:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/NVS015WFrkeS2IH3eP0HmxzWrrIIsQewduIf1uIQUc=;
 b=bBMeqsKdfjw92wyUxWhN3vxHDOamJ4Mfw9hmulpbijTa24pWTV0MPRPkm2fqhkCz49
 DwIJCSJRb8iHQgPmhDhsDGx5KDjufQQA9cXtnuUtyActVn8t3M1Jy4bdRBFJCXEB6ECj
 /ySHSfadWAsprU/ebiJVgVnBv/tkDfrA35mgkg2FjfKdrnyoLB183PJE9EU49fjOEQN1
 /EVkKoEet1b5wwgIWUgWJ1gWwkG7qgRRriAxAKabdNKidX32rn21B+25oMZxnsTK9G4K
 Gw7N9NjxtscNG0wCd/8N3Kxvkgyo9Z9H8hb33ABLZngt3V+m/ibPr831TCU6mg9YTyCH
 6zvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/NVS015WFrkeS2IH3eP0HmxzWrrIIsQewduIf1uIQUc=;
 b=7vrE3BcW0KhVdPn4Nhcjh7Znq5ZPBZcxJYz+ifFIFEBc254TNMYB/ej7z7HqT/uTTS
 OqM1bwaFmJz6Dbchc0KsVegcq3nXDFHk91ObmiVeothEjhQQsKhWQyK1Ky1OzvFhMFKk
 lG0LYFwFMNLUv/DpbXqaD9IbM52fE35f7g1n9oGN//ezt3pdDGiyIZmD94S6cV6bmzWr
 u5cb5CQ7ufbD0UyhcedC7ExywW+MA7/GiQY8PsYRWFXZ8HmieLY8/LDYDVa/wZIFUCyI
 9cv3IwN+a1h4JmaFBZVVnlzOBuC9+MG9pqryh7w4VeAy+jFQBTWFpkF1Nph+KklizqaA
 wmmA==
X-Gm-Message-State: AOAM530l/DWG/ZRghm6MVsg/wrAj8ar3aRUYb67mFPUskpSHg0XPaStf
 Y5zM97OtY0LuarLfW5bFjV6r1EPVRxzEKDbavsU=
X-Google-Smtp-Source: ABdhPJxJvuaFvfN6YlEpLLnQv0yfre1AFFyiQOT9HxslRE9kFr2sJzf9VBgq0/4WdZEiP0//RUp+G4dUYChDL+vNpaA=
X-Received: by 2002:a6b:4406:: with SMTP id r6mr12436884ioa.57.1643684622256; 
 Mon, 31 Jan 2022 19:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20220131110201.2303275-1-philipp.tomsich@vrull.eu>
 <20220131110201.2303275-4-philipp.tomsich@vrull.eu>
In-Reply-To: <20220131110201.2303275-4-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 1 Feb 2022 13:03:15 +1000
Message-ID: <CAKmqyKMB4F48QfQ70ohjDgon-RjpO+L_uyax8Vo8RMS_NGF7MQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] target/riscv: access configuration through cfg_ptr
 in DisasContext
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 9:10 PM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> The implementation in trans_{rvi,rvv,rvzfh}.c.inc accesses the shallow
> copies (in DisasContext) of some of the elements available in the
> RISCVCPUConfig structure.  This commit redirects accesses to use the
> cfg_ptr copied into DisasContext and removes the shallow copies.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> (no changes since v3)
>
> Changes in v3:
> - (new patch) test extension-availability through cfg_ptr in
>   DisasContext, removing the fields that have been copied into
>   DisasContext directly
>
>  target/riscv/insn_trans/trans_rvi.c.inc   |   2 +-
>  target/riscv/insn_trans/trans_rvv.c.inc   | 104 +++++++++++-----------
>  target/riscv/insn_trans/trans_rvzfh.c.inc |   4 +-
>  target/riscv/translate.c                  |  14 ---
>  4 files changed, 55 insertions(+), 69 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index 3cd1b3f877..f1342f30f8 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -806,7 +806,7 @@ static bool trans_fence(DisasContext *ctx, arg_fence *a)
>
>  static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
>  {
> -    if (!ctx->ext_ifencei) {
> +    if (!ctx->cfg_ptr->ext_ifencei) {
>          return false;
>      }
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index f85a9e83b4..ff09e345ad 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -74,7 +74,7 @@ static bool require_zve32f(DisasContext *s)
>      }
>
>      /* Zve32f doesn't support FP64. (Section 18.2) */
> -    return s->ext_zve32f ? s->sew <= MO_32 : true;
> +    return s->cfg_ptr->ext_zve32f ? s->sew <= MO_32 : true;
>  }
>
>  static bool require_scale_zve32f(DisasContext *s)
> @@ -85,7 +85,7 @@ static bool require_scale_zve32f(DisasContext *s)
>      }
>
>      /* Zve32f doesn't support FP64. (Section 18.2) */
> -    return s->ext_zve64f ? s->sew <= MO_16 : true;
> +    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_16 : true;
>  }
>
>  static bool require_zve64f(DisasContext *s)
> @@ -96,7 +96,7 @@ static bool require_zve64f(DisasContext *s)
>      }
>
>      /* Zve64f doesn't support FP64. (Section 18.2) */
> -    return s->ext_zve64f ? s->sew <= MO_32 : true;
> +    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_32 : true;
>  }
>
>  static bool require_scale_zve64f(DisasContext *s)
> @@ -107,7 +107,7 @@ static bool require_scale_zve64f(DisasContext *s)
>      }
>
>      /* Zve64f doesn't support FP64. (Section 18.2) */
> -    return s->ext_zve64f ? s->sew <= MO_16 : true;
> +    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_16 : true;
>  }
>
>  /* Destination vector register group cannot overlap source mask register. */
> @@ -174,7 +174,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
>      TCGv s1, dst;
>
>      if (!require_rvv(s) ||
> -        !(has_ext(s, RVV) || s->ext_zve32f || s->ext_zve64f)) {
> +        !(has_ext(s, RVV) || s->cfg_ptr->ext_zve32f || s->cfg_ptr->ext_zve64f)) {
>          return false;
>      }
>
> @@ -210,7 +210,7 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
>      TCGv dst;
>
>      if (!require_rvv(s) ||
> -        !(has_ext(s, RVV) || s->ext_zve32f || s->ext_zve64f)) {
> +        !(has_ext(s, RVV) || s->cfg_ptr->ext_zve32f || s->cfg_ptr->ext_zve64f)) {
>          return false;
>      }
>
> @@ -248,7 +248,7 @@ static bool trans_vsetivli(DisasContext *s, arg_vsetivli *a)
>  /* vector register offset from env */
>  static uint32_t vreg_ofs(DisasContext *s, int reg)
>  {
> -    return offsetof(CPURISCVState, vreg) + reg * s->vlen / 8;
> +    return offsetof(CPURISCVState, vreg) + reg * s->cfg_ptr->vlen / 8;
>  }
>
>  /* check functions */
> @@ -318,7 +318,7 @@ static bool vext_check_st_index(DisasContext *s, int vd, int vs2, int nf,
>       * when XLEN=32. (Section 18.2)
>       */
>      if (get_xl(s) == MXL_RV32) {
> -        ret &= (!has_ext(s, RVV) && s->ext_zve64f ? eew != MO_64 : true);
> +        ret &= (!has_ext(s, RVV) && s->cfg_ptr->ext_zve64f ? eew != MO_64 : true);
>      }
>
>      return ret;
> @@ -454,7 +454,7 @@ static bool vext_wide_check_common(DisasContext *s, int vd, int vm)
>  {
>      return (s->lmul <= 2) &&
>             (s->sew < MO_64) &&
> -           ((s->sew + 1) <= (s->elen >> 4)) &&
> +           ((s->sew + 1) <= (s->cfg_ptr->elen >> 4)) &&
>             require_align(vd, s->lmul + 1) &&
>             require_vm(vm, vd);
>  }
> @@ -482,7 +482,7 @@ static bool vext_narrow_check_common(DisasContext *s, int vd, int vs2,
>  {
>      return (s->lmul <= 2) &&
>             (s->sew < MO_64) &&
> -           ((s->sew + 1) <= (s->elen >> 4)) &&
> +           ((s->sew + 1) <= (s->cfg_ptr->elen >> 4)) &&
>             require_align(vs2, s->lmul + 1) &&
>             require_align(vd, s->lmul) &&
>             require_vm(vm, vd);
> @@ -661,7 +661,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
>       * The first part is vlen in bytes, encoded in maxsz of simd_desc.
>       * The second part is lmul, encoded in data of simd_desc.
>       */
> -    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
> +    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
>
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
> @@ -819,7 +819,7 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
>      mask = tcg_temp_new_ptr();
>      base = get_gpr(s, rs1, EXT_NONE);
>      stride = get_gpr(s, rs2, EXT_NONE);
> -    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
> +    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
>
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
> @@ -925,7 +925,7 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
>      mask = tcg_temp_new_ptr();
>      index = tcg_temp_new_ptr();
>      base = get_gpr(s, rs1, EXT_NONE);
> -    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
> +    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
>
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(index, cpu_env, vreg_ofs(s, vs2));
> @@ -1065,7 +1065,7 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
>      dest = tcg_temp_new_ptr();
>      mask = tcg_temp_new_ptr();
>      base = get_gpr(s, rs1, EXT_NONE);
> -    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
> +    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
>
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
> @@ -1120,7 +1120,7 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
>
>      uint32_t data = FIELD_DP32(0, VDATA, NF, nf);
>      dest = tcg_temp_new_ptr();
> -    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
> +    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
>
>      base = get_gpr(s, rs1, EXT_NONE);
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
> @@ -1185,7 +1185,7 @@ GEN_LDST_WHOLE_TRANS(vs8r_v, 8, true)
>  static inline uint32_t MAXSZ(DisasContext *s)
>  {
>      int scale = s->lmul - 3;
> -    return scale < 0 ? s->vlen >> -scale : s->vlen << scale;
> +    return scale < 0 ? s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << scale;
>  }
>
>  static bool opivv_check(DisasContext *s, arg_rmrr *a)
> @@ -1220,7 +1220,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
> -                           cpu_env, s->vlen / 8, s->vlen / 8, data, fn);
> +                           cpu_env, s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data, fn);
>      }
>      mark_vs_dirty(s);
>      gen_set_label(over);
> @@ -1262,7 +1262,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
>
>      data = FIELD_DP32(data, VDATA, VM, vm);
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> -    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
> +    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
>
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
> @@ -1425,7 +1425,7 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
>
>      data = FIELD_DP32(data, VDATA, VM, vm);
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> -    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
> +    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
>
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
> @@ -1508,7 +1508,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs1),
>                             vreg_ofs(s, a->rs2),
> -                           cpu_env, s->vlen / 8, s->vlen / 8,
> +                           cpu_env, s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8,
>                             data, fn);
>          mark_vs_dirty(s);
>          gen_set_label(over);
> @@ -1587,7 +1587,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs1),
>                             vreg_ofs(s, a->rs2),
> -                           cpu_env, s->vlen / 8, s->vlen / 8, data, fn);
> +                           cpu_env, s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data, fn);
>          mark_vs_dirty(s);
>          gen_set_label(over);
>          return true;
> @@ -1663,7 +1663,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
> -                           s->vlen / 8, s->vlen / 8, data,         \
> +                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,         \
>                             fns[s->sew]);                           \
>          mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
> @@ -1843,7 +1843,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
> -                           s->vlen / 8, s->vlen / 8, data,         \
> +                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,         \
>                             fns[s->sew]);                           \
>          mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
> @@ -1963,7 +1963,7 @@ static bool vmulh_vv_check(DisasContext *s, arg_rmrr *a)
>       * are not included for EEW=64 in Zve64*. (Section 18.2)
>       */
>      return opivv_check(s, a) &&
> -           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
> +           (!has_ext(s, RVV) && s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
>  }
>
>  static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
> @@ -1976,7 +1976,7 @@ static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
>       * are not included for EEW=64 in Zve64*. (Section 18.2)
>       */
>      return opivx_check(s, a) &&
> -           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
> +           (!has_ext(s, RVV) && s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
>  }
>
>  GEN_OPIVV_GVEC_TRANS(vmul_vv,  mul)
> @@ -2046,7 +2046,7 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
>              tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>
>              tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
> -                               cpu_env, s->vlen / 8, s->vlen / 8, data,
> +                               cpu_env, s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,
>                                 fns[s->sew]);
>              gen_set_label(over);
>          }
> @@ -2083,7 +2083,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
>              };
>
>              tcg_gen_ext_tl_i64(s1_i64, s1);
> -            desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
> +            desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
>              tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
>              fns[s->sew](dest, s1_i64, cpu_env, desc);
>
> @@ -2123,7 +2123,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
>
>              s1 = tcg_constant_i64(simm);
>              dest = tcg_temp_new_ptr();
> -            desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
> +            desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
>              tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
>              fns[s->sew](dest, s1, cpu_env, desc);
>
> @@ -2176,7 +2176,7 @@ static bool vsmul_vv_check(DisasContext *s, arg_rmrr *a)
>       * for EEW=64 in Zve64*. (Section 18.2)
>       */
>      return opivv_check(s, a) &&
> -           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
> +           (!has_ext(s, RVV) && s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
>  }
>
>  static bool vsmul_vx_check(DisasContext *s, arg_rmrr *a)
> @@ -2187,7 +2187,7 @@ static bool vsmul_vx_check(DisasContext *s, arg_rmrr *a)
>       * for EEW=64 in Zve64*. (Section 18.2)
>       */
>      return opivx_check(s, a) &&
> -           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
> +           (!has_ext(s, RVV) && s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
>  }
>
>  GEN_OPIVV_TRANS(vsmul_vv, vsmul_vv_check)
> @@ -2275,7 +2275,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
> -                           s->vlen / 8, s->vlen / 8, data,         \
> +                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,         \
>                             fns[s->sew - 1]);                       \
>          mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
> @@ -2302,7 +2302,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
>      dest = tcg_temp_new_ptr();
>      mask = tcg_temp_new_ptr();
>      src2 = tcg_temp_new_ptr();
> -    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
> +    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
>
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
> @@ -2391,7 +2391,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),   \
>                             vreg_ofs(s, a->rs1),                  \
>                             vreg_ofs(s, a->rs2), cpu_env,         \
> -                           s->vlen / 8, s->vlen / 8, data,       \
> +                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,       \
>                             fns[s->sew - 1]);                     \
>          mark_vs_dirty(s);                                        \
>          gen_set_label(over);                                     \
> @@ -2464,7 +2464,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
> -                           s->vlen / 8, s->vlen / 8, data,         \
> +                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,         \
>                             fns[s->sew - 1]);                       \
>          mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
> @@ -2583,7 +2583,7 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs2), cpu_env,
> -                           s->vlen / 8, s->vlen / 8, data, fn);
> +                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data, fn);
>          mark_vs_dirty(s);
>          gen_set_label(over);
>          return true;
> @@ -2696,7 +2696,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
>              do_nanbox(s, t1, cpu_fpr[a->rs1]);
>
>              dest = tcg_temp_new_ptr();
> -            desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
> +            desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
>              tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
>
>              fns[s->sew - 1](dest, t1, cpu_env, desc);
> @@ -2782,7 +2782,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
> -                           s->vlen / 8, s->vlen / 8, data,         \
> +                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,         \
>                             fns[s->sew - 1]);                       \
>          mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
> @@ -2831,7 +2831,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>          data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
> -                           s->vlen / 8, s->vlen / 8, data,         \
> +                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,         \
>                             fns[s->sew]);                           \
>          mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
> @@ -2896,7 +2896,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
> -                           s->vlen / 8, s->vlen / 8, data,         \
> +                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,         \
>                             fns[s->sew - 1]);                       \
>          mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
> @@ -2947,7 +2947,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>          data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
> -                           s->vlen / 8, s->vlen / 8, data,         \
> +                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,         \
>                             fns[s->sew]);                           \
>          mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
> @@ -2986,7 +2986,7 @@ GEN_OPIVV_TRANS(vredxor_vs, reduction_check)
>  static bool reduction_widen_check(DisasContext *s, arg_rmrr *a)
>  {
>      return reduction_check(s, a) && (s->sew < MO_64) &&
> -           ((s->sew + 1) <= (s->elen >> 4));
> +           ((s->sew + 1) <= (s->cfg_ptr->elen >> 4));
>  }
>
>  GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_widen_check)
> @@ -3034,7 +3034,7 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)                \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
> -                           s->vlen / 8, s->vlen / 8, data, fn);    \
> +                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data, fn);    \
>          mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
>          return true;                                               \
> @@ -3067,7 +3067,7 @@ static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
>          mask = tcg_temp_new_ptr();
>          src2 = tcg_temp_new_ptr();
>          dst = dest_gpr(s, a->rd);
> -        desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
> +        desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
>
>          tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
>          tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
> @@ -3099,7 +3099,7 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
>          mask = tcg_temp_new_ptr();
>          src2 = tcg_temp_new_ptr();
>          dst = dest_gpr(s, a->rd);
> -        desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
> +        desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
>
>          tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
>          tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
> @@ -3134,7 +3134,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
>                             vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
> -                           cpu_env, s->vlen / 8, s->vlen / 8,      \
> +                           cpu_env, s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8,      \
>                             data, fn);                              \
>          mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
> @@ -3174,7 +3174,7 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
>          };
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs2), cpu_env,
> -                           s->vlen / 8, s->vlen / 8, data, fns[s->sew]);
> +                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data, fns[s->sew]);
>          mark_vs_dirty(s);
>          gen_set_label(over);
>          return true;
> @@ -3200,7 +3200,7 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
>              gen_helper_vid_v_w, gen_helper_vid_v_d,
>          };
>          tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
> -                           cpu_env, s->vlen / 8, s->vlen / 8,
> +                           cpu_env, s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8,
>                             data, fns[s->sew]);
>          mark_vs_dirty(s);
>          gen_set_label(over);
> @@ -3554,7 +3554,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
>
>      if (a->vm && s->vl_eq_vlmax) {
>          int scale = s->lmul - (s->sew + 3);
> -        int vlmax = scale < 0 ? s->vlen >> -scale : s->vlen << scale;
> +        int vlmax = scale < 0 ? s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << scale;
>          TCGv_i64 dest = tcg_temp_new_i64();
>
>          if (a->rs1 == 0) {
> @@ -3586,7 +3586,7 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
>
>      if (a->vm && s->vl_eq_vlmax) {
>          int scale = s->lmul - (s->sew + 3);
> -        int vlmax = scale < 0 ? s->vlen >> -scale : s->vlen << scale;
> +        int vlmax = scale < 0 ? s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << scale;
>          if (a->rs1 >= vlmax) {
>              tcg_gen_gvec_dup_imm(MO_64, vreg_ofs(s, a->rd),
>                                   MAXSZ(s), MAXSZ(s), 0);
> @@ -3638,7 +3638,7 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
> -                           cpu_env, s->vlen / 8, s->vlen / 8, data,
> +                           cpu_env, s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,
>                             fns[s->sew]);
>          mark_vs_dirty(s);
>          gen_set_label(over);
> @@ -3657,7 +3657,7 @@ static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
>      if (require_rvv(s) &&                                               \
>          QEMU_IS_ALIGNED(a->rd, LEN) &&                                  \
>          QEMU_IS_ALIGNED(a->rs2, LEN)) {                                 \
> -        uint32_t maxsz = (s->vlen >> 3) * LEN;                          \
> +        uint32_t maxsz = (s->cfg_ptr->vlen >> 3) * LEN;                          \
>          if (s->vstart == 0) {                                           \
>              /* EEW = 8 */                                               \
>              tcg_gen_gvec_mov(MO_8, vreg_ofs(s, a->rd),                  \
> @@ -3742,7 +3742,7 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a, uint8_t seq)
>
>      tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                         vreg_ofs(s, a->rs2), cpu_env,
> -                       s->vlen / 8, s->vlen / 8, data, fn);
> +                       s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data, fn);
>
>      mark_vs_dirty(s);
>      gen_set_label(over);
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
> index 5a7cac8958..608c51da2c 100644
> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -17,13 +17,13 @@
>   */
>
>  #define REQUIRE_ZFH(ctx) do { \
> -    if (!ctx->ext_zfh) {      \
> +    if (!ctx->cfg_ptr->ext_zfh) {      \
>          return false;         \
>      }                         \
>  } while (0)
>
>  #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
> -    if (!(ctx->ext_zfh || ctx->ext_zfhmin)) { \
> +    if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
>          return false;                         \
>      }                                         \
>  } while (0)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 49e40735ce..f19d5cd0c0 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -77,11 +77,6 @@ typedef struct DisasContext {
>      RISCVMXL ol;
>      bool virt_enabled;
>      const RISCVCPUConfig *cfg_ptr;
> -    bool ext_ifencei;
> -    bool ext_zfh;
> -    bool ext_zfhmin;
> -    bool ext_zve32f;
> -    bool ext_zve64f;
>      bool hlsx;
>      /* vector extension */
>      bool vill;
> @@ -99,8 +94,6 @@ typedef struct DisasContext {
>       */
>      int8_t lmul;
>      uint8_t sew;
> -    uint16_t vlen;
> -    uint16_t elen;
>      target_ulong vstart;
>      bool vl_eq_vlmax;
>      uint8_t ntemp;
> @@ -910,13 +903,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->misa_ext = env->misa_ext;
>      ctx->frm = -1;  /* unknown rounding mode */
>      ctx->cfg_ptr = &(cpu->cfg);
> -    ctx->ext_ifencei = cpu->cfg.ext_ifencei;
> -    ctx->ext_zfh = cpu->cfg.ext_zfh;
> -    ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
> -    ctx->ext_zve32f = cpu->cfg.ext_zve32f;
> -    ctx->ext_zve64f = cpu->cfg.ext_zve64f;
> -    ctx->vlen = cpu->cfg.vlen;
> -    ctx->elen = cpu->cfg.elen;
>      ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
>      ctx->mstatus_hs_vs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_VS);
>      ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
> --
> 2.33.1
>
>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0366650DC6A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 11:22:23 +0200 (CEST)
Received: from localhost ([::1]:33664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niuvG-0000C3-0S
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 05:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1niujv-0007Up-N2
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:10:39 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39040 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1niujr-00019J-KK
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:10:39 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn8+DZWZi+7gwAA--.18850S6; 
 Mon, 25 Apr 2022 17:10:32 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/43] target/loongarch: Add fixed point arithmetic
 instruction translation
Date: Mon, 25 Apr 2022 17:09:48 +0800
Message-Id: <20220425091027.2877892-5-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn8+DZWZi+7gwAA--.18850S6
X-Coremail-Antispam: 1UD129KBjvAXoWfGrW5GF43AF43KF13Kr1UAwb_yoW8Aw1DXo
 W7GF15Jr48GryjvF15C3WvqFy7JF1j9an7JrWru3WUWF4kJry7tr1rKwn5ZayrXw1UKryr
 GF1SgFyfJ393Xrn7n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Song Gao <gaosong@loongson.cn>

This includes:
- ADD.{W/D}, SUB.{W/D}
- ADDI.{W/D}, ADDU16ID
- ALSL.{W[U]/D}
- LU12I.W, LU32I.D LU52I.D
- SLT[U], SLT[U]I
- PCADDI, PCADDU12I, PCADDU18I, PCALAU12I
- AND, OR, NOR, XOR, ANDN, ORN
- MUL.{W/D}, MULH.{W[U]/D[U]}
- MULW.D.W[U]
- DIV.{W[U]/D[U]}, MOD.{W[U]/D[U]}
- ANDI, ORI, XORI

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/insn_trans/trans_arith.c.inc | 304 ++++++++++++++++++
 target/loongarch/insns.decode                 |  79 +++++
 target/loongarch/translate.c                  |  83 +++++
 target/loongarch/translate.h                  |  19 ++
 4 files changed, 485 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_arith.c.inc
 create mode 100644 target/loongarch/insns.decode

diff --git a/target/loongarch/insn_trans/trans_arith.c.inc b/target/loongarch/insn_trans/trans_arith.c.inc
new file mode 100644
index 0000000000..8e45eadbc8
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_arith.c.inc
@@ -0,0 +1,304 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+static bool gen_rrr(DisasContext *ctx, arg_rrr *a,
+                    DisasExtend src1_ext, DisasExtend src2_ext,
+                    DisasExtend dst_ext, void (*func)(TCGv, TCGv, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd, dst_ext);
+    TCGv src1 = gpr_src(ctx, a->rj, src1_ext);
+    TCGv src2 = gpr_src(ctx, a->rk, src2_ext);
+
+    func(dest, src1, src2);
+    gen_set_gpr(a->rd, dest, dst_ext);
+
+    return true;
+}
+
+static bool gen_rri_v(DisasContext *ctx, arg_rr_i *a,
+                      DisasExtend src_ext, DisasExtend dst_ext,
+                      void (*func)(TCGv, TCGv, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd, dst_ext);
+    TCGv src1 = gpr_src(ctx, a->rj, src_ext);
+    TCGv src2 = tcg_constant_tl(a->imm);
+
+    func(dest, src1, src2);
+    gen_set_gpr(a->rd, dest, dst_ext);
+
+    return true;
+}
+
+static bool gen_rri_c(DisasContext *ctx, arg_rr_i *a,
+                      DisasExtend src_ext, DisasExtend dst_ext,
+                      void (*func)(TCGv, TCGv, target_long))
+{
+    TCGv dest = gpr_dst(ctx, a->rd, dst_ext);
+    TCGv src1 = gpr_src(ctx, a->rj, src_ext);
+
+    func(dest, src1, a->imm);
+    gen_set_gpr(a->rd, dest, dst_ext);
+
+    return true;
+}
+
+static bool gen_rrr_sa(DisasContext *ctx, arg_rrr_sa *a,
+                       DisasExtend src_ext, DisasExtend dst_ext,
+                       void (*func)(TCGv, TCGv, TCGv, target_long))
+{
+    TCGv dest = gpr_dst(ctx, a->rd, dst_ext);
+    TCGv src1 = gpr_src(ctx, a->rj, src_ext);
+    TCGv src2 = gpr_src(ctx, a->rk, src_ext);
+
+    func(dest, src1, src2, a->sa);
+    gen_set_gpr(a->rd, dest, dst_ext);
+
+    return true;
+}
+
+static bool trans_lu12i_w(DisasContext *ctx, arg_lu12i_w *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+
+    tcg_gen_movi_tl(dest, a->imm << 12);
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+
+    return true;
+}
+
+static bool gen_pc(DisasContext *ctx, arg_r_i *a,
+                   target_ulong (*func)(target_ulong, int))
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    target_ulong addr = func(ctx->base.pc_next, a->imm);
+
+    tcg_gen_movi_tl(dest, addr);
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+
+    return true;
+}
+
+static void gen_slt(TCGv dest, TCGv src1, TCGv src2)
+{
+    tcg_gen_setcond_tl(TCG_COND_LT, dest, src1, src2);
+}
+
+static void gen_sltu(TCGv dest, TCGv src1, TCGv src2)
+{
+    tcg_gen_setcond_tl(TCG_COND_LTU, dest, src1, src2);
+}
+
+static void gen_mulh_w(TCGv dest, TCGv src1, TCGv src2)
+{
+    tcg_gen_mul_i64(dest, src1, src2);
+    tcg_gen_sari_i64(dest, dest, 32);
+}
+
+static void gen_mulh_d(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv discard = tcg_temp_new();
+    tcg_gen_muls2_tl(discard, dest, src1, src2);
+    tcg_temp_free(discard);
+}
+
+static void gen_mulh_du(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv discard = tcg_temp_new();
+    tcg_gen_mulu2_tl(discard, dest, src1, src2);
+    tcg_temp_free(discard);
+}
+
+static void prep_divisor_d(TCGv ret, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+    TCGv zero = tcg_constant_tl(0);
+
+    /*
+     * If min / -1, set the divisor to 1.
+     * This avoids potential host overflow trap and produces min.
+     * If x / 0, set the divisor to 1.
+     * This avoids potential host overflow trap;
+     * the required result is undefined.
+     */
+    tcg_gen_setcondi_tl(TCG_COND_EQ, ret, src1, INT64_MIN);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t0, src2, -1);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t1, src2, 0);
+    tcg_gen_and_tl(ret, ret, t0);
+    tcg_gen_or_tl(ret, ret, t1);
+    tcg_gen_movcond_tl(TCG_COND_NE, ret, ret, zero, ret, src2);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+
+static void prep_divisor_du(TCGv ret, TCGv src2)
+{
+    TCGv zero = tcg_constant_tl(0);
+    TCGv one = tcg_constant_tl(1);
+
+    /*
+     * If x / 0, set the divisor to 1.
+     * This avoids potential host overflow trap;
+     * the required result is undefined.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, ret, src2, zero, one, src2);
+}
+
+static void gen_div_d(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+    prep_divisor_d(t0, src1, src2);
+    tcg_gen_div_tl(dest, src1, t0);
+    tcg_temp_free(t0);
+}
+
+static void gen_rem_d(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+    prep_divisor_d(t0, src1, src2);
+    tcg_gen_rem_tl(dest, src1, t0);
+    tcg_temp_free(t0);
+}
+
+static void gen_div_du(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+    prep_divisor_du(t0, src2);
+    tcg_gen_divu_tl(dest, src1, t0);
+    tcg_temp_free(t0);
+}
+
+static void gen_rem_du(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+    prep_divisor_du(t0, src2);
+    tcg_gen_remu_tl(dest, src1, t0);
+    tcg_temp_free(t0);
+}
+
+static void gen_div_w(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+    /* We need not check for integer overflow for div_w. */
+    prep_divisor_du(t0, src2);
+    tcg_gen_div_tl(dest, src1, t0);
+    tcg_temp_free(t0);
+}
+
+static void gen_rem_w(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+    /* We need not check for integer overflow for rem_w. */
+    prep_divisor_du(t0, src2);
+    tcg_gen_rem_tl(dest, src1, t0);
+    tcg_temp_free(t0);
+}
+
+static void gen_alsl(TCGv dest, TCGv src1, TCGv src2, target_long sa)
+{
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_shli_tl(t0, src1, sa);
+    tcg_gen_add_tl(dest, t0, src2);
+    tcg_temp_free(t0);
+}
+
+static bool trans_lu32i_d(DisasContext *ctx, arg_lu32i_d *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv src2 = tcg_constant_tl(a->imm);
+
+    tcg_gen_deposit_tl(dest, src1, src2, 32, 32);
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+
+    return true;
+}
+
+static bool trans_lu52i_d(DisasContext *ctx, arg_lu52i_d *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = tcg_constant_tl(a->imm);
+
+    tcg_gen_deposit_tl(dest, src1, src2, 52, 12);
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+
+    return true;
+}
+
+static target_ulong gen_pcaddi(target_ulong pc, int imm)
+{
+    return pc + (imm << 2);
+}
+
+static target_ulong gen_pcalau12i(target_ulong pc, int imm)
+{
+    return (pc + (imm << 12)) & ~0xfff;
+}
+
+static target_ulong gen_pcaddu12i(target_ulong pc, int imm)
+{
+    return pc + (imm << 12);
+}
+
+static target_ulong gen_pcaddu18i(target_ulong pc, int imm)
+{
+    return pc + ((target_ulong)(imm) << 18);
+}
+
+static bool trans_addu16i_d(DisasContext *ctx, arg_addu16i_d *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    tcg_gen_addi_tl(dest, src1, a->imm << 16);
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+
+    return true;
+}
+
+TRANS(add_w, gen_rrr, EXT_NONE, EXT_NONE, EXT_SIGN, tcg_gen_add_tl)
+TRANS(add_d, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, tcg_gen_add_tl)
+TRANS(sub_w, gen_rrr, EXT_NONE, EXT_NONE, EXT_SIGN, tcg_gen_sub_tl)
+TRANS(sub_d, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, tcg_gen_sub_tl)
+TRANS(and, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, tcg_gen_and_tl)
+TRANS(or, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, tcg_gen_or_tl)
+TRANS(xor, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, tcg_gen_xor_tl)
+TRANS(nor, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, tcg_gen_nor_tl)
+TRANS(andn, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, tcg_gen_andc_tl)
+TRANS(orn, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, tcg_gen_orc_tl)
+TRANS(slt, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_slt)
+TRANS(sltu, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_sltu)
+TRANS(mul_w, gen_rrr, EXT_SIGN, EXT_SIGN, EXT_SIGN, tcg_gen_mul_tl)
+TRANS(mul_d, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, tcg_gen_mul_tl)
+TRANS(mulh_w, gen_rrr, EXT_SIGN, EXT_SIGN, EXT_NONE, gen_mulh_w)
+TRANS(mulh_wu, gen_rrr, EXT_ZERO, EXT_ZERO, EXT_NONE, gen_mulh_w)
+TRANS(mulh_d, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_mulh_d)
+TRANS(mulh_du, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_mulh_du)
+TRANS(mulw_d_w, gen_rrr, EXT_SIGN, EXT_SIGN, EXT_NONE, tcg_gen_mul_tl)
+TRANS(mulw_d_wu, gen_rrr, EXT_ZERO, EXT_ZERO, EXT_NONE, tcg_gen_mul_tl)
+TRANS(div_w, gen_rrr, EXT_SIGN, EXT_SIGN, EXT_SIGN, gen_div_w)
+TRANS(mod_w, gen_rrr, EXT_SIGN, EXT_SIGN, EXT_SIGN, gen_rem_w)
+TRANS(div_wu, gen_rrr, EXT_ZERO, EXT_ZERO, EXT_SIGN, gen_div_du)
+TRANS(mod_wu, gen_rrr, EXT_ZERO, EXT_ZERO, EXT_SIGN, gen_rem_du)
+TRANS(div_d, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_div_d)
+TRANS(mod_d, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_rem_d)
+TRANS(div_du, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_div_du)
+TRANS(mod_du, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_rem_du)
+TRANS(slti, gen_rri_v, EXT_NONE, EXT_NONE, gen_slt)
+TRANS(sltui, gen_rri_v, EXT_NONE, EXT_NONE, gen_sltu)
+TRANS(addi_w, gen_rri_c, EXT_NONE, EXT_SIGN, tcg_gen_addi_tl)
+TRANS(addi_d, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_addi_tl)
+TRANS(alsl_w, gen_rrr_sa, EXT_NONE, EXT_SIGN, gen_alsl)
+TRANS(alsl_wu, gen_rrr_sa, EXT_NONE, EXT_ZERO, gen_alsl)
+TRANS(alsl_d, gen_rrr_sa, EXT_NONE, EXT_NONE, gen_alsl)
+TRANS(pcaddi, gen_pc, gen_pcaddi)
+TRANS(pcalau12i, gen_pc, gen_pcalau12i)
+TRANS(pcaddu12i, gen_pc, gen_pcaddu12i)
+TRANS(pcaddu18i, gen_pc, gen_pcaddu18i)
+TRANS(andi, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_andi_tl)
+TRANS(ori, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_ori_tl)
+TRANS(xori, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_xori_tl)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
new file mode 100644
index 0000000000..8579c11984
--- /dev/null
+++ b/target/loongarch/insns.decode
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# LoongArch instruction decode definitions.
+#
+# Copyright (c) 2021 Loongson Technology Corporation Limited
+#
+
+#
+# Fields
+#
+%sa2p1     15:2         !function=plus_1
+
+#
+# Argument sets
+#
+&r_i          rd imm
+&rrr          rd rj rk
+&rr_i         rd rj imm
+&rrr_sa       rd rj rk sa
+
+#
+# Formats
+#
+@rrr               .... ........ ..... rk:5 rj:5 rd:5    &rrr
+@r_i20                          .... ... imm:s20 rd:5    &r_i
+@rr_i12                 .... ...... imm:s12 rj:5 rd:5    &rr_i
+@rr_ui12                 .... ...... imm:12 rj:5 rd:5    &rr_i
+@rr_i16                     .... .. imm:s16 rj:5 rd:5    &rr_i
+@rrr_sa2p1        .... ........ ... .. rk:5 rj:5 rd:5    &rrr_sa  sa=%sa2p1
+
+#
+# Fixed point arithmetic operation instruction
+#
+add_w           0000 00000001 00000 ..... ..... .....    @rrr
+add_d           0000 00000001 00001 ..... ..... .....    @rrr
+sub_w           0000 00000001 00010 ..... ..... .....    @rrr
+sub_d           0000 00000001 00011 ..... ..... .....    @rrr
+slt             0000 00000001 00100 ..... ..... .....    @rrr
+sltu            0000 00000001 00101 ..... ..... .....    @rrr
+slti            0000 001000 ............ ..... .....     @rr_i12
+sltui           0000 001001 ............ ..... .....     @rr_i12
+nor             0000 00000001 01000 ..... ..... .....    @rrr
+and             0000 00000001 01001 ..... ..... .....    @rrr
+or              0000 00000001 01010 ..... ..... .....    @rrr
+xor             0000 00000001 01011 ..... ..... .....    @rrr
+orn             0000 00000001 01100 ..... ..... .....    @rrr
+andn            0000 00000001 01101 ..... ..... .....    @rrr
+mul_w           0000 00000001 11000 ..... ..... .....    @rrr
+mulh_w          0000 00000001 11001 ..... ..... .....    @rrr
+mulh_wu         0000 00000001 11010 ..... ..... .....    @rrr
+mul_d           0000 00000001 11011 ..... ..... .....    @rrr
+mulh_d          0000 00000001 11100 ..... ..... .....    @rrr
+mulh_du         0000 00000001 11101 ..... ..... .....    @rrr
+mulw_d_w        0000 00000001 11110 ..... ..... .....    @rrr
+mulw_d_wu       0000 00000001 11111 ..... ..... .....    @rrr
+div_w           0000 00000010 00000 ..... ..... .....    @rrr
+mod_w           0000 00000010 00001 ..... ..... .....    @rrr
+div_wu          0000 00000010 00010 ..... ..... .....    @rrr
+mod_wu          0000 00000010 00011 ..... ..... .....    @rrr
+div_d           0000 00000010 00100 ..... ..... .....    @rrr
+mod_d           0000 00000010 00101 ..... ..... .....    @rrr
+div_du          0000 00000010 00110 ..... ..... .....    @rrr
+mod_du          0000 00000010 00111 ..... ..... .....    @rrr
+alsl_w          0000 00000000 010 .. ..... ..... .....   @rrr_sa2p1
+alsl_wu         0000 00000000 011 .. ..... ..... .....   @rrr_sa2p1
+alsl_d          0000 00000010 110 .. ..... ..... .....   @rrr_sa2p1
+lu12i_w         0001 010 .................... .....      @r_i20
+lu32i_d         0001 011 .................... .....      @r_i20
+lu52i_d         0000 001100 ............ ..... .....     @rr_i12
+pcaddi          0001 100 .................... .....      @r_i20
+pcalau12i       0001 101 .................... .....      @r_i20
+pcaddu12i       0001 110 .................... .....      @r_i20
+pcaddu18i       0001 111 .................... .....      @r_i20
+addi_w          0000 001010 ............ ..... .....     @rr_i12
+addi_d          0000 001011 ............ ..... .....     @rr_i12
+addu16i_d       0001 00 ................ ..... .....     @rr_i16
+andi            0000 001101 ............ ..... .....     @rr_ui12
+ori             0000 001110 ............ ..... .....     @rr_ui12
+xori            0000 001111 ............ ..... .....     @rr_ui12
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 8a62623cd1..4a78d4ec8b 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -26,6 +26,11 @@ TCGv_i64 cpu_fpr[32];
 
 #define DISAS_STOP       DISAS_TARGET_0
 
+static inline int plus_1(DisasContext *ctx, int x)
+{
+    return x + 1;
+}
+
 void generate_exception(DisasContext *ctx, int excp)
 {
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
@@ -57,6 +62,11 @@ static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
     /* Bound the number of insns to execute to those left on the page.  */
     bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
     ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
+
+    ctx->ntemp = 0;
+    memset(ctx->temp, 0, sizeof(ctx->temp));
+
+    ctx->zero = tcg_constant_tl(0);
 }
 
 static void loongarch_tr_tb_start(DisasContextBase *dcbase, CPUState *cs)
@@ -70,6 +80,73 @@ static void loongarch_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
     tcg_gen_insn_start(ctx->base.pc_next);
 }
 
+/*
+ * Wrappers for getting reg values.
+ *
+ * The $zero register does not have cpu_gpr[0] allocated -- we supply the
+ * constant zero as a source, and an uninitialized sink as destination.
+ *
+ * Further, we may provide an extension for word operations.
+ */
+static TCGv temp_new(DisasContext *ctx)
+{
+    assert(ctx->ntemp < ARRAY_SIZE(ctx->temp));
+    return ctx->temp[ctx->ntemp++] = tcg_temp_new();
+}
+
+static TCGv gpr_src(DisasContext *ctx, int reg_num, DisasExtend src_ext)
+{
+    TCGv t;
+
+    if (reg_num == 0) {
+        return ctx->zero;
+    }
+
+    switch (src_ext) {
+    case EXT_NONE:
+        return cpu_gpr[reg_num];
+    case EXT_SIGN:
+        t = temp_new(ctx);
+        tcg_gen_ext32s_tl(t, cpu_gpr[reg_num]);
+        return t;
+    case EXT_ZERO:
+        t = temp_new(ctx);
+        tcg_gen_ext32u_tl(t, cpu_gpr[reg_num]);
+        return t;
+    }
+    g_assert_not_reached();
+}
+
+static TCGv gpr_dst(DisasContext *ctx, int reg_num, DisasExtend dst_ext)
+{
+    if (reg_num == 0 || dst_ext) {
+        return temp_new(ctx);
+    }
+    return cpu_gpr[reg_num];
+}
+
+static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
+{
+    if (reg_num != 0) {
+        switch (dst_ext) {
+        case EXT_NONE:
+            tcg_gen_mov_tl(cpu_gpr[reg_num], t);
+            break;
+        case EXT_SIGN:
+            tcg_gen_ext32s_tl(cpu_gpr[reg_num], t);
+            break;
+        case EXT_ZERO:
+            tcg_gen_ext32u_tl(cpu_gpr[reg_num], t);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
+}
+
+#include "decode-insns.c.inc"
+#include "insn_trans/trans_arith.c.inc"
+
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     CPULoongArchState *env = cs->env_ptr;
@@ -83,6 +160,12 @@ static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         generate_exception(ctx, EXCCODE_INE);
     }
 
+    for (int i = ctx->ntemp - 1; i >= 0; --i) {
+        tcg_temp_free(ctx->temp[i]);
+        ctx->temp[i] = NULL;
+    }
+    ctx->ntemp = 0;
+
     ctx->base.pc_next += 4;
 }
 
diff --git a/target/loongarch/translate.h b/target/loongarch/translate.h
index 6cc7f1a7cd..9cc12512d1 100644
--- a/target/loongarch/translate.h
+++ b/target/loongarch/translate.h
@@ -10,11 +10,30 @@
 
 #include "exec/translator.h"
 
+#define TRANS(NAME, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *ctx, arg_##NAME * a) \
+    { return FUNC(ctx, a, __VA_ARGS__); }
+
+/*
+ * If an operation is being performed on less than TARGET_LONG_BITS,
+ * it may require the inputs to be sign- or zero-extended; which will
+ * depend on the exact operation being performed.
+ */
+typedef enum {
+    EXT_NONE,
+    EXT_SIGN,
+    EXT_ZERO,
+} DisasExtend;
+
 typedef struct DisasContext {
     DisasContextBase base;
     target_ulong page_start;
     uint32_t opcode;
     int mem_idx;
+    TCGv zero;
+    /* Space for 3 operands plus 1 extra for address computation. */
+    TCGv temp[4];
+    uint8_t ntemp;
 } DisasContext;
 
 void generate_exception(DisasContext *ctx, int excp);
-- 
2.31.1



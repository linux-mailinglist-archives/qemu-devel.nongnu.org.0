Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA7044E223
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 07:59:56 +0100 (CET)
Received: from localhost ([::1]:49018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlQXT-000365-JC
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 01:59:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mlQSY-000648-5i
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 01:54:50 -0500
Received: from mail.loongson.cn ([114.242.206.163]:49360 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mlQSS-0007hU-52
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 01:54:48 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxydCRD45hHoQCAA--.6006S6;
 Fri, 12 Nov 2021 14:54:31 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 04/26] target/loongarch: Add fixed point arithmetic
 instruction translation
Date: Fri, 12 Nov 2021 14:53:47 +0800
Message-Id: <1636700049-24381-5-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636700049-24381-1-git-send-email-gaosong@loongson.cn>
References: <1636700049-24381-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9CxydCRD45hHoQCAA--.6006S6
X-Coremail-Antispam: 1UD129KBjvAXoWfGrW5GF43AF43KFy7Wr1DAwb_yoW8CF4Uuo
 WUGF45Jr48Gryjvr1Y93W8Xa4xXr1j9an3JrWru3WUWF4xJr13tr12yrs5ZayrJw4qkFyr
 GF1SgFyfJ3yfXrn7n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, richard.henderson@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
 target/loongarch/insn_trans/trans_arith.c.inc | 319 ++++++++++++++++++++++++++
 target/loongarch/insns.decode                 |  88 +++++++
 target/loongarch/translate.c                  |  78 +++++++
 target/loongarch/translate.h                  |  19 ++
 4 files changed, 504 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_arith.c.inc
 create mode 100644 target/loongarch/insns.decode

diff --git a/target/loongarch/insn_trans/trans_arith.c.inc b/target/loongarch/insn_trans/trans_arith.c.inc
new file mode 100644
index 0000000..384a158
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_arith.c.inc
@@ -0,0 +1,319 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+static bool gen_r3(DisasContext *ctx, arg_fmt_rdrjrk *a,
+                   DisasExtend src1_ext, DisasExtend src2_ext,
+                   DisasExtend dst_ext, void (*func)(TCGv, TCGv, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd, dst_ext);
+    TCGv src1 = gpr_src(ctx, a->rj, src1_ext);
+    TCGv src2 = gpr_src(ctx, a->rk, src2_ext);
+
+    func(dest, src1, src2);
+
+    /* dst_ext is EXT_NONE and input is dest, We don't run gen_set_gpr. */
+    if (dst_ext) {
+        gen_set_gpr(a->rd, dest, dst_ext);
+    }
+    return true;
+}
+
+static bool gen_r2_si12(DisasContext *ctx, arg_fmt_rdrjsi12 *a,
+                        DisasExtend src_ext, DisasExtend dst_ext,
+                        void (*func)(TCGv, TCGv, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd, dst_ext);
+    TCGv src1 = gpr_src(ctx, a->rj, src_ext);
+    TCGv src2 = tcg_constant_tl(a->si12);
+
+    func(dest, src1, src2);
+
+    if (dst_ext) {
+        gen_set_gpr(a->rd, dest, dst_ext);
+    }
+    return true;
+}
+
+static bool gen_r3_sa2(DisasContext *ctx, arg_fmt_rdrjrksa2 *a,
+                       DisasExtend src_ext, DisasExtend dst_ext,
+                       void (*func)(TCGv, TCGv, TCGv, TCGv, target_long))
+{
+    TCGv dest = gpr_dst(ctx, a->rd, dst_ext);
+    TCGv src1 = gpr_src(ctx, a->rj, src_ext);
+    TCGv src2 = gpr_src(ctx, a->rk, src_ext);
+    TCGv temp = tcg_temp_new();
+
+    func(dest, src1, src2, temp, a->sa2);
+
+    if (dst_ext) {
+        gen_set_gpr(a->rd, dest, dst_ext);
+    }
+    tcg_temp_free(temp);
+    return true;
+}
+
+static bool trans_lu12i_w(DisasContext *ctx, arg_lu12i_w *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+
+    tcg_gen_movi_tl(dest, a->si20 << 12);
+    return true;
+}
+
+static bool gen_pc(DisasContext *ctx, arg_fmt_rdsi20 *a,
+                   target_ulong (*func)(target_ulong, int))
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    target_ulong addr = func(ctx->base.pc_next, a->si20);
+
+    tcg_gen_movi_tl(dest, addr);
+    return true;
+}
+
+static bool gen_r2_ui12(DisasContext *ctx, arg_fmt_rdrjui12 *a,
+                        void (*func)(TCGv, TCGv, target_long))
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    func(dest, src1, a->ui12);
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
+static void gen_mulh_wu(TCGv dest, TCGv src1, TCGv src2)
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
+static void gen_alsl_w(TCGv dest, TCGv src1, TCGv src2,
+                       TCGv temp, target_long sa2)
+{
+    tcg_gen_shli_tl(temp, src1, sa2 + 1);
+    tcg_gen_add_tl(dest, temp, src2);
+}
+
+static void gen_alsl_wu(TCGv dest, TCGv src1, TCGv src2,
+                        TCGv temp, target_long sa2)
+{
+    tcg_gen_shli_tl(temp, src1, sa2 + 1);
+    tcg_gen_add_tl(dest, temp, src2);
+}
+
+static void gen_alsl_d(TCGv dest, TCGv src1, TCGv src2,
+                       TCGv temp, target_long sa2)
+{
+    tcg_gen_shli_tl(temp, src1, sa2 + 1);
+    tcg_gen_add_tl(dest, temp, src2);
+}
+
+static bool trans_lu32i_d(DisasContext *ctx, arg_lu32i_d *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv src2 = tcg_constant_tl(a->si20);
+
+    tcg_gen_deposit_tl(dest, src1, src2, 32, 32);
+    return true;
+}
+
+static bool trans_lu52i_d(DisasContext *ctx, arg_lu52i_d *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = tcg_constant_tl(a->si12);
+
+    tcg_gen_deposit_tl(dest, src1, src2, 52, 12);
+    return true;
+}
+
+static target_ulong gen_pcaddi(target_ulong pc, int si20)
+{
+    return pc + (si20 << 2);
+}
+
+static target_ulong gen_pcalau12i(target_ulong pc, int si20)
+{
+    return (pc + (si20 << 12)) & ~0xfff;
+}
+
+static target_ulong gen_pcaddu12i(target_ulong pc, int si20)
+{
+    return pc + (si20 << 12);
+}
+
+static target_ulong gen_pcaddu18i(target_ulong pc, int si20)
+{
+    return pc + ((target_ulong)(si20) << 18);
+}
+
+static bool trans_addu16i_d(DisasContext *ctx, arg_addu16i_d *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    tcg_gen_addi_tl(dest, src1, a->si16 << 16);
+    return true;
+}
+
+TRANS(add_w, gen_r3, EXT_NONE, EXT_NONE, EXT_SIGN, tcg_gen_add_tl)
+TRANS(add_d, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, tcg_gen_add_tl)
+TRANS(sub_w, gen_r3, EXT_NONE, EXT_NONE, EXT_SIGN, tcg_gen_sub_tl)
+TRANS(sub_d, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, tcg_gen_sub_tl)
+TRANS(and, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, tcg_gen_and_tl)
+TRANS(or, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, tcg_gen_or_tl)
+TRANS(xor, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, tcg_gen_xor_tl)
+TRANS(nor, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, tcg_gen_nor_tl)
+TRANS(andn, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, tcg_gen_andc_tl)
+TRANS(orn, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, tcg_gen_orc_tl)
+TRANS(slt, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_slt)
+TRANS(sltu, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_sltu)
+TRANS(mul_w, gen_r3, EXT_SIGN, EXT_SIGN, EXT_SIGN, tcg_gen_mul_tl)
+TRANS(mul_d, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, tcg_gen_mul_tl)
+TRANS(mulh_w, gen_r3, EXT_SIGN, EXT_SIGN, EXT_NONE, gen_mulh_w)
+TRANS(mulh_wu, gen_r3, EXT_ZERO, EXT_ZERO, EXT_NONE, gen_mulh_wu)
+TRANS(mulh_d, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_mulh_d)
+TRANS(mulh_du, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_mulh_du)
+TRANS(mulw_d_w, gen_r3, EXT_SIGN, EXT_SIGN, EXT_NONE, tcg_gen_mul_tl)
+TRANS(mulw_d_wu, gen_r3, EXT_ZERO, EXT_ZERO, EXT_NONE, tcg_gen_mul_tl)
+TRANS(div_w, gen_r3, EXT_SIGN, EXT_SIGN, EXT_SIGN, gen_div_w)
+TRANS(mod_w, gen_r3, EXT_SIGN, EXT_SIGN, EXT_SIGN, gen_rem_w)
+TRANS(div_wu, gen_r3, EXT_ZERO, EXT_ZERO, EXT_SIGN, gen_div_du)
+TRANS(mod_wu, gen_r3, EXT_ZERO, EXT_ZERO, EXT_SIGN, gen_rem_du)
+TRANS(div_d, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_div_d)
+TRANS(mod_d, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_rem_d)
+TRANS(div_du, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_div_du)
+TRANS(mod_du, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_rem_du)
+TRANS(slti, gen_r2_si12, EXT_NONE, EXT_NONE, gen_slt)
+TRANS(sltui, gen_r2_si12, EXT_NONE, EXT_NONE, gen_sltu)
+TRANS(addi_w, gen_r2_si12, EXT_NONE, EXT_SIGN, tcg_gen_add_tl)
+TRANS(addi_d, gen_r2_si12, EXT_NONE, EXT_NONE, tcg_gen_add_tl)
+TRANS(alsl_w, gen_r3_sa2, EXT_NONE, EXT_SIGN, gen_alsl_w)
+TRANS(alsl_wu, gen_r3_sa2, EXT_NONE, EXT_ZERO, gen_alsl_wu)
+TRANS(alsl_d, gen_r3_sa2, EXT_NONE, EXT_NONE, gen_alsl_d)
+TRANS(pcaddi, gen_pc, gen_pcaddi)
+TRANS(pcalau12i, gen_pc, gen_pcalau12i)
+TRANS(pcaddu12i, gen_pc, gen_pcaddu12i)
+TRANS(pcaddu18i, gen_pc, gen_pcaddu18i)
+TRANS(andi, gen_r2_ui12, tcg_gen_andi_tl)
+TRANS(ori, gen_r2_ui12, tcg_gen_ori_tl)
+TRANS(xori, gen_r2_ui12, tcg_gen_xori_tl)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
new file mode 100644
index 0000000..3e6a051
--- /dev/null
+++ b/target/loongarch/insns.decode
@@ -0,0 +1,88 @@
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
+%rd      0:5
+%rj      5:5
+%rk      10:5
+%sa2     15:2
+%si12    10:s12
+%ui12    10:12
+%si16    10:s16
+%si20    5:s20
+
+#
+# Argument sets
+#
+&fmt_rdrjrk         rd rj rk
+&fmt_rdrjsi12       rd rj si12
+&fmt_rdrjrksa2      rd rj rk sa2
+&fmt_rdrjsi16       rd rj si16
+&fmt_rdrjui12       rd rj ui12
+&fmt_rdsi20         rd si20
+
+#
+# Formats
+#
+@fmt_rdrjrk          .... ........ ..... ..... ..... .....    &fmt_rdrjrk         %rd %rj %rk
+@fmt_rdrjsi12        .... ...... ............ ..... .....     &fmt_rdrjsi12       %rd %rj %si12
+@fmt_rdrjui12        .... ...... ............ ..... .....     &fmt_rdrjui12       %rd %rj %ui12
+@fmt_rdrjrksa2       .... ........ ... .. ..... ..... .....   &fmt_rdrjrksa2      %rd %rj %rk %sa2
+@fmt_rdrjsi16        .... .. ................ ..... .....     &fmt_rdrjsi16       %rd %rj %si16
+@fmt_rdsi20          .... ... .................... .....      &fmt_rdsi20         %rd %si20
+
+#
+# Fixed point arithmetic operation instruction
+#
+add_w            0000 00000001 00000 ..... ..... .....    @fmt_rdrjrk
+add_d            0000 00000001 00001 ..... ..... .....    @fmt_rdrjrk
+sub_w            0000 00000001 00010 ..... ..... .....    @fmt_rdrjrk
+sub_d            0000 00000001 00011 ..... ..... .....    @fmt_rdrjrk
+slt              0000 00000001 00100 ..... ..... .....    @fmt_rdrjrk
+sltu             0000 00000001 00101 ..... ..... .....    @fmt_rdrjrk
+slti             0000 001000 ............ ..... .....     @fmt_rdrjsi12
+sltui            0000 001001 ............ ..... .....     @fmt_rdrjsi12
+nor              0000 00000001 01000 ..... ..... .....    @fmt_rdrjrk
+and              0000 00000001 01001 ..... ..... .....    @fmt_rdrjrk
+or               0000 00000001 01010 ..... ..... .....    @fmt_rdrjrk
+xor              0000 00000001 01011 ..... ..... .....    @fmt_rdrjrk
+orn              0000 00000001 01100 ..... ..... .....    @fmt_rdrjrk
+andn             0000 00000001 01101 ..... ..... .....    @fmt_rdrjrk
+mul_w            0000 00000001 11000 ..... ..... .....    @fmt_rdrjrk
+mulh_w           0000 00000001 11001 ..... ..... .....    @fmt_rdrjrk
+mulh_wu          0000 00000001 11010 ..... ..... .....    @fmt_rdrjrk
+mul_d            0000 00000001 11011 ..... ..... .....    @fmt_rdrjrk
+mulh_d           0000 00000001 11100 ..... ..... .....    @fmt_rdrjrk
+mulh_du          0000 00000001 11101 ..... ..... .....    @fmt_rdrjrk
+mulw_d_w         0000 00000001 11110 ..... ..... .....    @fmt_rdrjrk
+mulw_d_wu        0000 00000001 11111 ..... ..... .....    @fmt_rdrjrk
+div_w            0000 00000010 00000 ..... ..... .....    @fmt_rdrjrk
+mod_w            0000 00000010 00001 ..... ..... .....    @fmt_rdrjrk
+div_wu           0000 00000010 00010 ..... ..... .....    @fmt_rdrjrk
+mod_wu           0000 00000010 00011 ..... ..... .....    @fmt_rdrjrk
+div_d            0000 00000010 00100 ..... ..... .....    @fmt_rdrjrk
+mod_d            0000 00000010 00101 ..... ..... .....    @fmt_rdrjrk
+div_du           0000 00000010 00110 ..... ..... .....    @fmt_rdrjrk
+mod_du           0000 00000010 00111 ..... ..... .....    @fmt_rdrjrk
+alsl_w           0000 00000000 010 .. ..... ..... .....   @fmt_rdrjrksa2
+alsl_wu          0000 00000000 011 .. ..... ..... .....   @fmt_rdrjrksa2
+alsl_d           0000 00000010 110 .. ..... ..... .....   @fmt_rdrjrksa2
+lu12i_w          0001 010 .................... .....      @fmt_rdsi20
+lu32i_d          0001 011 .................... .....      @fmt_rdsi20
+lu52i_d          0000 001100 ............ ..... .....     @fmt_rdrjsi12
+pcaddi           0001 100 .................... .....      @fmt_rdsi20
+pcalau12i        0001 101 .................... .....      @fmt_rdsi20
+pcaddu12i        0001 110 .................... .....      @fmt_rdsi20
+pcaddu18i        0001 111 .................... .....      @fmt_rdsi20
+addi_w           0000 001010 ............ ..... .....     @fmt_rdrjsi12
+addi_d           0000 001011 ............ ..... .....     @fmt_rdrjsi12
+addu16i_d        0001 00 ................ ..... .....     @fmt_rdrjsi16
+andi             0000 001101 ............ ..... .....     @fmt_rdrjui12
+ori              0000 001110 ............ ..... .....     @fmt_rdrjui12
+xori             0000 001111 ............ ..... .....     @fmt_rdrjui12
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 048c895..d4e0bf3 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -57,6 +57,11 @@ static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
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
@@ -70,6 +75,73 @@ static void loongarch_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
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
@@ -83,6 +155,12 @@ static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         generate_exception(ctx, EXCP_INE);
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
index 6cc7f1a..9cc1251 100644
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
1.8.3.1



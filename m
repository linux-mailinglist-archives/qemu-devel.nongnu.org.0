Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 596093B5DE5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:21:08 +0200 (CEST)
Received: from localhost ([::1]:38004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqGB-0003Zl-Ac
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lxq0c-0002Cj-4f
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:05:02 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45404 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lxq0U-00018U-2F
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:05:01 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0LdutlgOrYZAA--.8747S9;
 Mon, 28 Jun 2021 20:04:49 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/20] target/loongarch: Add fixed point arithmetic
 instruction translation
Date: Mon, 28 Jun 2021 20:04:32 +0800
Message-Id: <1624881885-31692-8-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0LdutlgOrYZAA--.8747S9
X-Coremail-Antispam: 1UD129KBjvAXoWfXw4kWF1rJr4kXF48Aw1kXwb_yoW5Wr43Go
 W7JayDGrZ5Kw17Xrn09a18XF4Iqw48Cay3J390v3Z5WF43Cr17tw17Kw1rZayxJa4vgrW3
 Xa4aqF43J3y3Jr98n29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, maobibo@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implement fixed point arithemtic instruction translation.

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
---
 target/loongarch/insns.decode |  89 ++++++++
 target/loongarch/instmap.h    |  53 +++++
 target/loongarch/trans.inc.c  | 367 +++++++++++++++++++++++++++++++++
 target/loongarch/translate.c  | 458 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 967 insertions(+)
 create mode 100644 target/loongarch/insns.decode
 create mode 100644 target/loongarch/instmap.h
 create mode 100644 target/loongarch/trans.inc.c

diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
new file mode 100644
index 0000000..1e0b755
--- /dev/null
+++ b/target/loongarch/insns.decode
@@ -0,0 +1,89 @@
+#
+# LoongArch instruction decode definitions.
+#
+# Copyright (c) 2021 Loongson Technology Corporation Limited
+#
+# SPDX-License-Identifier: LGPL-2.1+
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
diff --git a/target/loongarch/instmap.h b/target/loongarch/instmap.h
new file mode 100644
index 0000000..8844333
--- /dev/null
+++ b/target/loongarch/instmap.h
@@ -0,0 +1,53 @@
+/*
+ * LoongArch emulation for qemu: instruction opcode
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#ifndef TARGET_LOONGARCH_INSTMAP_H
+#define TARGET_LOONGARCH_INSTMAP_H
+
+/* fixed point opcodes */
+enum {
+    LA_OPC_ADD_W     = (0x00020 << 15),
+    LA_OPC_ADD_D     = (0x00021 << 15),
+    LA_OPC_SUB_W     = (0x00022 << 15),
+    LA_OPC_SUB_D     = (0x00023 << 15),
+    LA_OPC_SLT       = (0x00024 << 15),
+    LA_OPC_SLTU      = (0x00025 << 15),
+    LA_OPC_NOR       = (0x00028 << 15),
+    LA_OPC_AND       = (0x00029 << 15),
+    LA_OPC_OR        = (0x0002A << 15),
+    LA_OPC_XOR       = (0x0002B << 15),
+    LA_OPC_MUL_W     = (0x00038 << 15),
+    LA_OPC_MULH_W    = (0x00039 << 15),
+    LA_OPC_MULH_WU   = (0x0003A << 15),
+    LA_OPC_MUL_D     = (0x0003B << 15),
+    LA_OPC_MULH_D    = (0x0003C << 15),
+    LA_OPC_MULH_DU   = (0x0003D << 15),
+    LA_OPC_DIV_W     = (0x00040 << 15),
+    LA_OPC_MOD_W     = (0x00041 << 15),
+    LA_OPC_DIV_WU    = (0x00042 << 15),
+    LA_OPC_MOD_WU    = (0x00043 << 15),
+    LA_OPC_DIV_D     = (0x00044 << 15),
+    LA_OPC_MOD_D     = (0x00045 << 15),
+    LA_OPC_DIV_DU    = (0x00046 << 15),
+    LA_OPC_MOD_DU    = (0x00047 << 15),
+
+    LA_OPC_ALSL_W    = (0x0002 << 17),
+    LA_OPC_ALSL_D    = (0x0016 << 17)
+
+};
+
+/* 12 bit immediate opcodes */
+enum {
+    LA_OPC_SLTI      = (0x008 << 22),
+    LA_OPC_SLTIU     = (0x009 << 22),
+    LA_OPC_ADDI_W    = (0x00A << 22),
+    LA_OPC_ADDI_D    = (0x00B << 22),
+    LA_OPC_ANDI      = (0x00D << 22),
+    LA_OPC_ORI       = (0x00E << 22),
+    LA_OPC_XORI      = (0x00F << 22)
+};
diff --git a/target/loongarch/trans.inc.c b/target/loongarch/trans.inc.c
new file mode 100644
index 0000000..a5bc1ea
--- /dev/null
+++ b/target/loongarch/trans.inc.c
@@ -0,0 +1,367 @@
+/*
+ * LoongArch translate functions
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+/* Fixed point arithmetic operation instruction translation */
+static bool trans_add_w(DisasContext *ctx, arg_add_w *a)
+{
+    gen_loongarch_arith(ctx, LA_OPC_ADD_W, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_add_d(DisasContext *ctx, arg_add_d *a)
+{
+    gen_loongarch_arith(ctx, LA_OPC_ADD_D, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_sub_w(DisasContext *ctx, arg_sub_w *a)
+{
+    gen_loongarch_arith(ctx, LA_OPC_SUB_W, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_sub_d(DisasContext *ctx, arg_sub_d *a)
+{
+    check_loongarch_64(ctx);
+    gen_loongarch_arith(ctx, LA_OPC_SUB_D, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_slt(DisasContext *ctx, arg_slt *a)
+{
+    gen_loongarch_slt(ctx, LA_OPC_SLT, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
+{
+    gen_loongarch_slt(ctx, LA_OPC_SLTU, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_slti(DisasContext *ctx, arg_slti *a)
+{
+    gen_loongarch_slt_imm(ctx, LA_OPC_SLTI, a->rd, a->rj, a->si12);
+    return true;
+}
+
+static bool trans_sltui(DisasContext *ctx, arg_sltui *a)
+{
+    gen_loongarch_slt_imm(ctx, LA_OPC_SLTIU, a->rd, a->rj, a->si12);
+    return true;
+}
+
+static bool trans_nor(DisasContext *ctx, arg_nor *a)
+{
+    gen_loongarch_logic(ctx, LA_OPC_NOR, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_and(DisasContext *ctx, arg_and *a)
+{
+    gen_loongarch_logic(ctx, LA_OPC_AND, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_or(DisasContext *ctx, arg_or *a)
+{
+    gen_loongarch_logic(ctx, LA_OPC_OR, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_xor(DisasContext *ctx, arg_xor *a)
+{
+    gen_loongarch_logic(ctx, LA_OPC_XOR, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_orn(DisasContext *ctx, arg_orn *a)
+{
+    TCGv t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rk);
+    tcg_gen_not_tl(t0, t0);
+    tcg_gen_or_tl(cpu_gpr[a->rd], cpu_gpr[a->rj], t0);
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_andn(DisasContext *ctx, arg_andn *a)
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+    gen_load_gpr(t0, a->rk);
+    gen_load_gpr(t1, a->rj);
+    tcg_gen_not_tl(t0, t0);
+    tcg_gen_and_tl(cpu_gpr[a->rd], t1, t0);
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    return true;
+}
+
+static bool trans_mul_w(DisasContext *ctx, arg_mul_w *a)
+{
+    gen_loongarch_muldiv(ctx, LA_OPC_MUL_W, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_mulh_w(DisasContext *ctx, arg_mulh_w *a)
+{
+    gen_loongarch_muldiv(ctx, LA_OPC_MULH_W, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_mulh_wu(DisasContext *ctx, arg_mulh_wu *a)
+{
+    gen_loongarch_muldiv(ctx, LA_OPC_MULH_WU, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_mul_d(DisasContext *ctx, arg_mul_d *a)
+{
+    check_loongarch_64(ctx);
+    gen_loongarch_muldiv(ctx, LA_OPC_MUL_D, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_mulh_d(DisasContext *ctx, arg_mulh_d *a)
+{
+    check_loongarch_64(ctx);
+    gen_loongarch_muldiv(ctx, LA_OPC_MULH_D, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_mulh_du(DisasContext *ctx, arg_mulh_du *a)
+{
+    check_loongarch_64(ctx);
+    gen_loongarch_muldiv(ctx, LA_OPC_MULH_DU, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_mulw_d_w(DisasContext *ctx, arg_mulw_d_w *a)
+{
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t2 = tcg_temp_new_i64();
+    gen_load_gpr(t0, a->rj);
+    gen_load_gpr(t1, a->rk);
+    tcg_gen_ext32s_i64(t0, t0);
+    tcg_gen_ext32s_i64(t1, t1);
+    tcg_gen_mul_i64(t2, t0, t1);
+    gen_store_gpr(t2, a->rd);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t2);
+    return true;
+}
+
+static bool trans_mulw_d_wu(DisasContext *ctx, arg_mulw_d_wu *a)
+{
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t2 = tcg_temp_new_i64();
+    gen_load_gpr(t0, a->rj);
+    gen_load_gpr(t1, a->rk);
+    tcg_gen_ext32u_i64(t0, t0);
+    tcg_gen_ext32u_i64(t1, t1);
+    tcg_gen_mul_i64(t2, t0, t1);
+    gen_store_gpr(t2, a->rd);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t2);
+    return true;
+}
+
+static bool trans_div_w(DisasContext *ctx, arg_div_w *a)
+{
+    gen_loongarch_muldiv(ctx, LA_OPC_DIV_W, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_mod_w(DisasContext *ctx, arg_mod_w *a)
+{
+    gen_loongarch_muldiv(ctx, LA_OPC_MOD_W, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_div_wu(DisasContext *ctx, arg_div_wu *a)
+{
+    gen_loongarch_muldiv(ctx, LA_OPC_DIV_WU, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_mod_wu(DisasContext *ctx, arg_mod_wu *a)
+{
+    gen_loongarch_muldiv(ctx, LA_OPC_MOD_WU, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_div_d(DisasContext *ctx, arg_div_d *a)
+{
+    check_loongarch_64(ctx);
+    gen_loongarch_muldiv(ctx, LA_OPC_DIV_D, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_mod_d(DisasContext *ctx, arg_mod_d *a)
+{
+    check_loongarch_64(ctx);
+    gen_loongarch_muldiv(ctx, LA_OPC_MOD_D, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_div_du(DisasContext *ctx, arg_div_du *a)
+{
+    check_loongarch_64(ctx);
+    gen_loongarch_muldiv(ctx, LA_OPC_DIV_DU, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_mod_du(DisasContext *ctx, arg_mod_du *a)
+{
+    check_loongarch_64(ctx);
+    gen_loongarch_muldiv(ctx, LA_OPC_MOD_DU, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_alsl_w(DisasContext *ctx, arg_alsl_w *a)
+{
+    gen_loongarch_alsl(ctx, LA_OPC_ALSL_W, a->rd, a->rj, a->rk, a->sa2);
+    return true;
+}
+
+static bool trans_alsl_wu(DisasContext *ctx, arg_alsl_wu *a)
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+    gen_load_gpr(t0, a->rj);
+    gen_load_gpr(t1, a->rk);
+    tcg_gen_shli_tl(t0, t0, a->sa2 + 1);
+    tcg_gen_add_tl(t0, t0, t1);
+    tcg_gen_ext32u_tl(cpu_gpr[a->rd], t0);
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_alsl_d(DisasContext *ctx, arg_alsl_d *a)
+{
+    check_loongarch_64(ctx);
+    gen_loongarch_alsl(ctx, LA_OPC_ALSL_D, a->rd, a->rj, a->rk, a->sa2);
+    return true;
+}
+
+static bool trans_lu12i_w(DisasContext *ctx, arg_lu12i_w *a)
+{
+    tcg_gen_movi_tl(cpu_gpr[a->rd], a->si20 << 12);
+    return true;
+}
+
+static bool trans_lu32i_d(DisasContext *ctx, arg_lu32i_d *a)
+{
+    TCGv_i64 t0, t1;
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+
+    tcg_gen_movi_tl(t0, a->si20);
+    tcg_gen_concat_tl_i64(t1, cpu_gpr[a->rd], t0);
+    gen_store_gpr(t1, a->rd);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    return true;
+}
+
+static bool trans_lu52i_d(DisasContext *ctx, arg_lu52i_d *a)
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+
+    gen_load_gpr(t1, a->rj);
+
+    tcg_gen_movi_tl(t0, a->si12);
+    tcg_gen_shli_tl(t0, t0, 52);
+    tcg_gen_andi_tl(t1, t1, 0xfffffffffffffU);
+    tcg_gen_or_tl(cpu_gpr[a->rd], t0, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    return true;
+}
+
+static bool trans_pcaddi(DisasContext *ctx, arg_pcaddi *a)
+{
+    target_ulong pc = ctx->base.pc_next;
+    target_ulong addr = pc + (a->si20 << 2);
+    tcg_gen_movi_tl(cpu_gpr[a->rd], addr);
+    return true;
+}
+
+static bool trans_pcalau12i(DisasContext *ctx, arg_pcalau12i *a)
+{
+    target_ulong pc = ctx->base.pc_next;
+    target_ulong addr = (pc + (a->si20 << 12)) & ~0xfff;
+    tcg_gen_movi_tl(cpu_gpr[a->rd], addr);
+    return true;
+}
+
+static bool trans_pcaddu12i(DisasContext *ctx, arg_pcaddu12i *a)
+{
+    target_ulong pc = ctx->base.pc_next;
+    target_ulong addr = pc + (a->si20 << 12);
+    tcg_gen_movi_tl(cpu_gpr[a->rd], addr);
+    return true;
+}
+
+static bool trans_pcaddu18i(DisasContext *ctx, arg_pcaddu18i *a)
+{
+    target_ulong pc = ctx->base.pc_next;
+    target_ulong addr = pc + ((target_ulong)(a->si20) << 18);
+    tcg_gen_movi_tl(cpu_gpr[a->rd], addr);
+    return true;
+}
+
+static bool trans_addi_w(DisasContext *ctx, arg_addi_w *a)
+{
+    gen_loongarch_arith_imm(ctx, LA_OPC_ADDI_W, a->rd, a->rj, a->si12);
+    return true;
+}
+
+static bool trans_addi_d(DisasContext *ctx, arg_addi_d *a)
+{
+    gen_loongarch_arith_imm(ctx, LA_OPC_ADDI_D, a->rd, a->rj, a->si12);
+    return true;
+}
+
+static bool trans_addu16i_d(DisasContext *ctx, arg_addu16i_d *a)
+{
+    if (a->rj != 0) {
+        tcg_gen_addi_tl(cpu_gpr[a->rd], cpu_gpr[a->rj], a->si16 << 16);
+    } else {
+        tcg_gen_movi_tl(cpu_gpr[a->rd], a->si16 << 16);
+    }
+    return true;
+}
+
+static bool trans_andi(DisasContext *ctx, arg_andi *a)
+{
+    gen_loongarch_logic_imm(ctx, LA_OPC_ANDI, a->rd, a->rj, a->ui12);
+    return true;
+}
+
+static bool trans_ori(DisasContext *ctx, arg_ori *a)
+{
+    gen_loongarch_logic_imm(ctx, LA_OPC_ORI, a->rd, a->rj, a->ui12);
+    return true;
+}
+
+static bool trans_xori(DisasContext *ctx, arg_xori *a)
+{
+    gen_loongarch_logic_imm(ctx, LA_OPC_XORI, a->rd, a->rj, a->ui12);
+    return true;
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 83efd39..3b40a59 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -292,6 +292,461 @@ static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
     ctx->default_tcg_memop_mask = MO_UNALN;
 }
 
+/* loongarch arithmetic */
+static void gen_loongarch_arith(DisasContext *ctx, uint32_t opc,
+                                int rd, int rj, int rk)
+{
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return;
+    }
+
+    switch (opc) {
+    case LA_OPC_ADD_W:
+        if (rj != 0 && rk != 0) {
+            tcg_gen_add_tl(cpu_gpr[rd], cpu_gpr[rj], cpu_gpr[rk]);
+            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+        } else if (rj == 0 && rk != 0) {
+            tcg_gen_mov_tl(cpu_gpr[rd], cpu_gpr[rk]);
+        } else if (rj != 0 && rk == 0) {
+            tcg_gen_mov_tl(cpu_gpr[rd], cpu_gpr[rj]);
+        } else {
+            tcg_gen_movi_tl(cpu_gpr[rd], 0);
+        }
+        break;
+    case LA_OPC_SUB_W:
+        if (rj != 0 && rk != 0) {
+            tcg_gen_sub_tl(cpu_gpr[rd], cpu_gpr[rj], cpu_gpr[rk]);
+            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+        } else if (rj == 0 && rk != 0) {
+            tcg_gen_neg_tl(cpu_gpr[rd], cpu_gpr[rk]);
+            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+        } else if (rj != 0 && rk == 0) {
+            tcg_gen_mov_tl(cpu_gpr[rd], cpu_gpr[rj]);
+        } else {
+            tcg_gen_movi_tl(cpu_gpr[rd], 0);
+        }
+        break;
+    case LA_OPC_ADD_D:
+        if (rj != 0 && rk != 0) {
+            tcg_gen_add_tl(cpu_gpr[rd], cpu_gpr[rj], cpu_gpr[rk]);
+        } else if (rj == 0 && rk != 0) {
+            tcg_gen_mov_tl(cpu_gpr[rd], cpu_gpr[rk]);
+        } else if (rj != 0 && rk == 0) {
+            tcg_gen_mov_tl(cpu_gpr[rd], cpu_gpr[rj]);
+        } else {
+            tcg_gen_movi_tl(cpu_gpr[rd], 0);
+        }
+        break;
+    case LA_OPC_SUB_D:
+        if (rj != 0 && rk != 0) {
+            tcg_gen_sub_tl(cpu_gpr[rd], cpu_gpr[rj], cpu_gpr[rk]);
+        } else if (rj == 0 && rk != 0) {
+            tcg_gen_neg_tl(cpu_gpr[rd], cpu_gpr[rk]);
+        } else if (rj != 0 && rk == 0) {
+            tcg_gen_mov_tl(cpu_gpr[rd], cpu_gpr[rj]);
+        } else {
+            tcg_gen_movi_tl(cpu_gpr[rd], 0);
+        }
+        break;
+    }
+}
+
+/* loongarch arithmetic with immediate operand */
+static void gen_loongarch_arith_imm(DisasContext *ctx, uint32_t opc,
+                                    int rd, int rj, int imm)
+{
+    target_ulong uimm = (target_long)imm;
+
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return;
+    }
+    switch (opc) {
+    case LA_OPC_ADDI_W:
+        if (rj != 0) {
+            tcg_gen_addi_tl(cpu_gpr[rd], cpu_gpr[rj], uimm);
+            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+        } else {
+            tcg_gen_movi_tl(cpu_gpr[rd], uimm);
+        }
+        break;
+    case LA_OPC_ADDI_D:
+        if (rj != 0) {
+            tcg_gen_addi_tl(cpu_gpr[rd], cpu_gpr[rj], uimm);
+        } else {
+            tcg_gen_movi_tl(cpu_gpr[rd], uimm);
+        }
+        break;
+    }
+}
+
+/* loongarch set on lower than */
+static void gen_loongarch_slt(DisasContext *ctx, uint32_t opc,
+                              int rd, int rj, int rk)
+{
+    TCGv t0, t1;
+
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    gen_load_gpr(t0, rj);
+    gen_load_gpr(t1, rk);
+    switch (opc) {
+    case LA_OPC_SLT:
+        tcg_gen_setcond_tl(TCG_COND_LT, cpu_gpr[rd], t0, t1);
+        break;
+    case LA_OPC_SLTU:
+        tcg_gen_setcond_tl(TCG_COND_LTU, cpu_gpr[rd], t0, t1);
+        break;
+    }
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+
+/* loongarch set on less than with immediate operand */
+static void gen_loongarch_slt_imm(DisasContext *ctx, uint32_t opc,
+                                  int rd, int rj, int16_t imm)
+{
+    target_ulong uimm = (target_long)imm;
+    TCGv t0;
+
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return;
+    }
+    t0 = tcg_temp_new();
+    gen_load_gpr(t0, rj);
+    switch (opc) {
+    case LA_OPC_SLTI:
+        tcg_gen_setcondi_tl(TCG_COND_LT, cpu_gpr[rd], t0, uimm);
+        break;
+    case LA_OPC_SLTIU:
+        tcg_gen_setcondi_tl(TCG_COND_LTU, cpu_gpr[rd], t0, uimm);
+        break;
+    }
+    tcg_temp_free(t0);
+}
+
+/* loongarch logic */
+static void gen_loongarch_logic(DisasContext *ctx, uint32_t opc,
+                                int rd, int rj, int rk)
+{
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return;
+    }
+
+    switch (opc) {
+    case LA_OPC_AND:
+        if (likely(rj != 0 && rk != 0)) {
+            tcg_gen_and_tl(cpu_gpr[rd], cpu_gpr[rj], cpu_gpr[rk]);
+        } else {
+            tcg_gen_movi_tl(cpu_gpr[rd], 0);
+        }
+        break;
+    case LA_OPC_NOR:
+        if (rj != 0 && rk != 0) {
+            tcg_gen_nor_tl(cpu_gpr[rd], cpu_gpr[rj], cpu_gpr[rk]);
+        } else if (rj == 0 && rk != 0) {
+            tcg_gen_not_tl(cpu_gpr[rd], cpu_gpr[rk]);
+        } else if (rj != 0 && rk == 0) {
+            tcg_gen_not_tl(cpu_gpr[rd], cpu_gpr[rj]);
+        } else {
+            tcg_gen_movi_tl(cpu_gpr[rd], ~((target_ulong)0));
+        }
+        break;
+    case LA_OPC_OR:
+        if (likely(rj != 0 && rk != 0)) {
+            tcg_gen_or_tl(cpu_gpr[rd], cpu_gpr[rj], cpu_gpr[rk]);
+        } else if (rj == 0 && rk != 0) {
+            tcg_gen_mov_tl(cpu_gpr[rd], cpu_gpr[rk]);
+        } else if (rj != 0 && rk == 0) {
+            tcg_gen_mov_tl(cpu_gpr[rd], cpu_gpr[rj]);
+        } else {
+            tcg_gen_movi_tl(cpu_gpr[rd], 0);
+        }
+        break;
+    case LA_OPC_XOR:
+        if (likely(rj != 0 && rk != 0)) {
+            tcg_gen_xor_tl(cpu_gpr[rd], cpu_gpr[rj], cpu_gpr[rk]);
+        } else if (rj == 0 && rk != 0) {
+            tcg_gen_mov_tl(cpu_gpr[rd], cpu_gpr[rk]);
+        } else if (rj != 0 && rk == 0) {
+            tcg_gen_mov_tl(cpu_gpr[rd], cpu_gpr[rj]);
+        } else {
+            tcg_gen_movi_tl(cpu_gpr[rd], 0);
+        }
+        break;
+    }
+}
+
+/* loongarch logic with immediate operand */
+static void gen_loongarch_logic_imm(DisasContext *ctx, uint32_t opc,
+                                    int rd, int rj, int16_t imm)
+{
+    target_ulong uimm;
+
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return;
+    }
+    uimm = (uint16_t)imm;
+    switch (opc) {
+    case LA_OPC_ANDI:
+        if (likely(rj != 0)) {
+            tcg_gen_andi_tl(cpu_gpr[rd], cpu_gpr[rj], uimm);
+        } else {
+            tcg_gen_movi_tl(cpu_gpr[rd], 0);
+        }
+        break;
+    case LA_OPC_ORI:
+        if (rj != 0) {
+            tcg_gen_ori_tl(cpu_gpr[rd], cpu_gpr[rj], uimm);
+        } else {
+            tcg_gen_movi_tl(cpu_gpr[rd], uimm);
+        }
+        break;
+    case LA_OPC_XORI:
+        if (likely(rj != 0)) {
+            tcg_gen_xori_tl(cpu_gpr[rd], cpu_gpr[rj], uimm);
+        } else {
+            tcg_gen_movi_tl(cpu_gpr[rd], uimm);
+        }
+        break;
+    default:
+        break;
+    }
+}
+
+/* loongarch mul and div */
+static void gen_loongarch_muldiv(DisasContext *ctx, int opc, int rd,
+                                 int rj, int rk)
+{
+    TCGv t0, t1;
+
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_load_gpr(t0, rj);
+    gen_load_gpr(t1, rk);
+
+    switch (opc) {
+    case LA_OPC_DIV_W:
+        {
+            TCGv t2 = tcg_temp_new();
+            TCGv t3 = tcg_temp_new();
+            tcg_gen_ext32s_tl(t0, t0);
+            tcg_gen_ext32s_tl(t1, t1);
+            tcg_gen_setcondi_tl(TCG_COND_EQ, t2, t0, INT_MIN);
+            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, -1);
+            tcg_gen_and_tl(t2, t2, t3);
+            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, 0);
+            tcg_gen_or_tl(t2, t2, t3);
+            tcg_gen_movi_tl(t3, 0);
+            tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
+            tcg_gen_div_tl(cpu_gpr[rd], t0, t1);
+            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+            tcg_temp_free(t3);
+            tcg_temp_free(t2);
+        }
+        break;
+    case LA_OPC_MOD_W:
+        {
+            TCGv t2 = tcg_temp_new();
+            TCGv t3 = tcg_temp_new();
+            tcg_gen_ext32s_tl(t0, t0);
+            tcg_gen_ext32s_tl(t1, t1);
+            tcg_gen_setcondi_tl(TCG_COND_EQ, t2, t0, INT_MIN);
+            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, -1);
+            tcg_gen_and_tl(t2, t2, t3);
+            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, 0);
+            tcg_gen_or_tl(t2, t2, t3);
+            tcg_gen_movi_tl(t3, 0);
+            tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
+            tcg_gen_rem_tl(cpu_gpr[rd], t0, t1);
+            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+            tcg_temp_free(t3);
+            tcg_temp_free(t2);
+        }
+        break;
+    case LA_OPC_DIV_WU:
+        {
+            TCGv t2 = tcg_const_tl(0);
+            TCGv t3 = tcg_const_tl(1);
+            tcg_gen_ext32u_tl(t0, t0);
+            tcg_gen_ext32u_tl(t1, t1);
+            tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
+            tcg_gen_divu_tl(cpu_gpr[rd], t0, t1);
+            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+            tcg_temp_free(t3);
+            tcg_temp_free(t2);
+        }
+        break;
+    case LA_OPC_MOD_WU:
+        {
+            TCGv t2 = tcg_const_tl(0);
+            TCGv t3 = tcg_const_tl(1);
+            tcg_gen_ext32u_tl(t0, t0);
+            tcg_gen_ext32u_tl(t1, t1);
+            tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
+            tcg_gen_remu_tl(cpu_gpr[rd], t0, t1);
+            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+            tcg_temp_free(t3);
+            tcg_temp_free(t2);
+        }
+        break;
+    case LA_OPC_MUL_W:
+        {
+            TCGv_i32 t2 = tcg_temp_new_i32();
+            TCGv_i32 t3 = tcg_temp_new_i32();
+            tcg_gen_trunc_tl_i32(t2, t0);
+            tcg_gen_trunc_tl_i32(t3, t1);
+            tcg_gen_mul_i32(t2, t2, t3);
+            tcg_gen_ext_i32_tl(cpu_gpr[rd], t2);
+            tcg_temp_free_i32(t2);
+            tcg_temp_free_i32(t3);
+        }
+        break;
+    case LA_OPC_MULH_W:
+        {
+            TCGv_i32 t2 = tcg_temp_new_i32();
+            TCGv_i32 t3 = tcg_temp_new_i32();
+            tcg_gen_trunc_tl_i32(t2, t0);
+            tcg_gen_trunc_tl_i32(t3, t1);
+            tcg_gen_muls2_i32(t2, t3, t2, t3);
+            tcg_gen_ext_i32_tl(cpu_gpr[rd], t3);
+            tcg_temp_free_i32(t2);
+            tcg_temp_free_i32(t3);
+        }
+        break;
+    case LA_OPC_MULH_WU:
+        {
+            TCGv_i32 t2 = tcg_temp_new_i32();
+            TCGv_i32 t3 = tcg_temp_new_i32();
+            tcg_gen_trunc_tl_i32(t2, t0);
+            tcg_gen_trunc_tl_i32(t3, t1);
+            tcg_gen_mulu2_i32(t2, t3, t2, t3);
+            tcg_gen_ext_i32_tl(cpu_gpr[rd], t3);
+            tcg_temp_free_i32(t2);
+            tcg_temp_free_i32(t3);
+        }
+        break;
+    case LA_OPC_DIV_D:
+        {
+            TCGv t2 = tcg_temp_new();
+            TCGv t3 = tcg_temp_new();
+            tcg_gen_setcondi_tl(TCG_COND_EQ, t2, t0, -1LL << 63);
+            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, -1LL);
+            tcg_gen_and_tl(t2, t2, t3);
+            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, 0);
+            tcg_gen_or_tl(t2, t2, t3);
+            tcg_gen_movi_tl(t3, 0);
+            tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
+            tcg_gen_div_tl(cpu_gpr[rd], t0, t1);
+            tcg_temp_free(t3);
+            tcg_temp_free(t2);
+        }
+        break;
+    case LA_OPC_MOD_D:
+        {
+            TCGv t2 = tcg_temp_new();
+            TCGv t3 = tcg_temp_new();
+            tcg_gen_setcondi_tl(TCG_COND_EQ, t2, t0, -1LL << 63);
+            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, -1LL);
+            tcg_gen_and_tl(t2, t2, t3);
+            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, 0);
+            tcg_gen_or_tl(t2, t2, t3);
+            tcg_gen_movi_tl(t3, 0);
+            tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
+            tcg_gen_rem_tl(cpu_gpr[rd], t0, t1);
+            tcg_temp_free(t3);
+            tcg_temp_free(t2);
+        }
+        break;
+    case LA_OPC_DIV_DU:
+        {
+            TCGv t2 = tcg_const_tl(0);
+            TCGv t3 = tcg_const_tl(1);
+            tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
+            tcg_gen_divu_i64(cpu_gpr[rd], t0, t1);
+            tcg_temp_free(t3);
+            tcg_temp_free(t2);
+        }
+        break;
+    case LA_OPC_MOD_DU:
+        {
+            TCGv t2 = tcg_const_tl(0);
+            TCGv t3 = tcg_const_tl(1);
+            tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
+            tcg_gen_remu_i64(cpu_gpr[rd], t0, t1);
+            tcg_temp_free(t3);
+            tcg_temp_free(t2);
+        }
+        break;
+    case LA_OPC_MUL_D:
+        tcg_gen_mul_i64(cpu_gpr[rd], t0, t1);
+        break;
+    case LA_OPC_MULH_D:
+        {
+            TCGv t2 = tcg_temp_new();
+            tcg_gen_muls2_i64(t2, cpu_gpr[rd], t0, t1);
+            tcg_temp_free(t2);
+        }
+        break;
+    case LA_OPC_MULH_DU:
+        {
+            TCGv t2 = tcg_temp_new();
+            tcg_gen_mulu2_i64(t2, cpu_gpr[rd], t0, t1);
+            tcg_temp_free(t2);
+        }
+        break;
+    default:
+        generate_exception_end(ctx, EXCP_INE);
+        goto out;
+    }
+ out:
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return;
+}
+
+/* loongarch alsl_X */
+static void gen_loongarch_alsl(DisasContext *ctx, int opc, int rd,
+                               int rj, int rk, int imm2)
+{
+    TCGv t0;
+    TCGv t1;
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return;
+    }
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    gen_load_gpr(t0, rj);
+    gen_load_gpr(t1, rk);
+    tcg_gen_shli_tl(t0, t0, imm2 + 1);
+    tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
+    if (opc == LA_OPC_ALSL_W) {
+        tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+    }
+
+    tcg_temp_free(t1);
+    tcg_temp_free(t0);
+
+    return;
+}
+
 static void loongarch_tr_tb_start(DisasContextBase *dcbase, CPUState *cs)
 {
 }
@@ -337,6 +792,9 @@ static bool decode_lsx(uint32_t opcode)
     return false;
 }
 
+#include "decode-insns.c.inc"
+#include "trans.inc.c"
+
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     CPULoongArchState *env = cs->env_ptr;
-- 
1.8.3.1



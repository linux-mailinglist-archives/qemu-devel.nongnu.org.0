Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 154603D0BA0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:57:45 +0200 (CEST)
Received: from localhost ([::1]:35604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m68z2-0002EH-0t
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m68uy-0002Ei-7v
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:32 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49488 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m68ut-00025j-Je
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:32 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0CO7vdg5VEiAA--.21107S9; 
 Wed, 21 Jul 2021 17:53:22 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/22] target/loongarch: Add fixed point arithmetic
 instruction translation
Date: Wed, 21 Jul 2021 17:53:03 +0800
Message-Id: <1626861198-6133-8-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0CO7vdg5VEiAA--.21107S9
X-Coremail-Antispam: 1UD129KBjvAXoWfXw4kWF1rJr4kXF1rWryUWrg_yoW5GF1fJo
 WUJFW5CrWrGw13Zrn0g3W8XF4Iqw17tayfJ3yYq3Z5W3WUZr9Fqr12gwsYqay8W3Wj9rWr
 X3ZaqF4fJw43Ar93n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 maobibo@loongson.cn, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
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
 target/loongarch/insns.decode |   89 ++++
 target/loongarch/trans.inc.c  | 1090 +++++++++++++++++++++++++++++++++++++++++
 target/loongarch/translate.c  |   12 +
 target/loongarch/translate.h  |    1 +
 4 files changed, 1192 insertions(+)
 create mode 100644 target/loongarch/insns.decode
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
diff --git a/target/loongarch/trans.inc.c b/target/loongarch/trans.inc.c
new file mode 100644
index 0000000..8faef62
--- /dev/null
+++ b/target/loongarch/trans.inc.c
@@ -0,0 +1,1090 @@
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
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    if (a->rj != 0 && a->rk != 0) {
+        tcg_gen_add_tl(Rd, Rj, Rk);
+        tcg_gen_ext32s_tl(Rd, Rd);
+    } else if (a->rj == 0 && a->rk != 0) {
+        tcg_gen_mov_tl(Rd, Rk);
+    } else if (a->rj != 0 && a->rk == 0) {
+        tcg_gen_mov_tl(Rd, Rj);
+    } else {
+        tcg_gen_movi_tl(Rd, 0);
+    }
+
+    return true;
+}
+
+static bool trans_add_d(DisasContext *ctx, arg_add_d *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    check_loongarch_64(ctx);
+    if (a->rj != 0 && a->rk != 0) {
+        tcg_gen_add_tl(Rd, Rj, Rk);
+    } else if (a->rj == 0 && a->rk != 0) {
+        tcg_gen_mov_tl(Rd, Rk);
+    } else if (a->rj != 0 && a->rk == 0) {
+        tcg_gen_mov_tl(Rd, Rj);
+    } else {
+        tcg_gen_movi_tl(Rd, 0);
+    }
+
+    return true;
+}
+
+static bool trans_sub_w(DisasContext *ctx, arg_sub_w *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    if (a->rj != 0 && a->rk != 0) {
+        tcg_gen_sub_tl(Rd, Rj, Rk);
+        tcg_gen_ext32s_tl(Rd, Rd);
+    } else if (a->rj == 0 && a->rk != 0) {
+        tcg_gen_neg_tl(Rd, Rk);
+        tcg_gen_ext32s_tl(Rd, Rd);
+    } else if (a->rj != 0 && a->rk == 0) {
+        tcg_gen_mov_tl(Rd, Rj);
+    } else {
+        tcg_gen_movi_tl(Rd, 0);
+    }
+
+    return true;
+}
+
+static bool trans_sub_d(DisasContext *ctx, arg_sub_d *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    check_loongarch_64(ctx);
+    if (a->rj != 0 && a->rk != 0) {
+        tcg_gen_sub_tl(Rd, Rj, Rk);
+    } else if (a->rj == 0 && a->rk != 0) {
+        tcg_gen_neg_tl(Rd, Rk);
+    } else if (a->rj != 0 && a->rk == 0) {
+        tcg_gen_mov_tl(Rd, Rj);
+    } else {
+        tcg_gen_movi_tl(Rd, 0);
+    }
+
+    return true;
+}
+
+static bool trans_slt(DisasContext *ctx, arg_slt *a)
+{
+    TCGv t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+    t1 = get_gpr(a->rk);
+
+    tcg_gen_setcond_tl(TCG_COND_LT, Rd, t0, t1);
+
+    return true;
+}
+
+static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
+{
+
+    TCGv t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+    t1 = get_gpr(a->rk);
+
+    tcg_gen_setcond_tl(TCG_COND_LTU, Rd, t0, t1);
+
+    return true;
+}
+
+static bool trans_slti(DisasContext *ctx, arg_slti *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+    target_ulong uimm = (target_long)(a->si12);
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+
+    tcg_gen_setcondi_tl(TCG_COND_LT, Rd, t0, uimm);
+
+    return true;
+}
+
+static bool trans_sltui(DisasContext *ctx, arg_sltui *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+    target_ulong uimm = (target_long)(a->si12);
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+
+    tcg_gen_setcondi_tl(TCG_COND_LTU, Rd, t0, uimm);
+
+    return true;
+}
+
+static bool trans_nor(DisasContext *ctx, arg_nor *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    if (a->rj != 0 && a->rk != 0) {
+        tcg_gen_nor_tl(Rd, Rj, Rk);
+    } else if (a->rj == 0 && a->rk != 0) {
+        tcg_gen_not_tl(Rd, Rk);
+    } else if (a->rj != 0 && a->rk == 0) {
+        tcg_gen_not_tl(Rd, Rj);
+    } else {
+        tcg_gen_movi_tl(Rd, ~((target_ulong)0));
+    }
+
+    return true;
+}
+
+static bool trans_and(DisasContext *ctx, arg_and *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    if (likely(a->rj != 0 && a->rk != 0)) {
+        tcg_gen_and_tl(Rd, Rj, Rk);
+    } else {
+        tcg_gen_movi_tl(Rd, 0);
+    }
+
+    return true;
+}
+
+static bool trans_or(DisasContext *ctx, arg_or *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    if (likely(a->rj != 0 && a->rk != 0)) {
+        tcg_gen_or_tl(Rd, Rj, Rk);
+    } else if (a->rj == 0 && a->rk != 0) {
+        tcg_gen_mov_tl(Rd, Rk);
+    } else if (a->rj != 0 && a->rk == 0) {
+        tcg_gen_mov_tl(Rd, Rj);
+    } else {
+        tcg_gen_movi_tl(Rd, 0);
+    }
+
+    return true;
+}
+
+static bool trans_xor(DisasContext *ctx, arg_xor *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    if (likely(a->rj != 0 && a->rk != 0)) {
+        tcg_gen_xor_tl(Rd, Rj, Rk);
+    } else if (a->rj == 0 && a->rk != 0) {
+        tcg_gen_mov_tl(Rd, Rk);
+    } else if (a->rj != 0 && a->rk == 0) {
+        tcg_gen_mov_tl(Rd, Rj);
+    } else {
+        tcg_gen_movi_tl(Rd, 0);
+    }
+
+    return true;
+}
+
+static bool trans_orn(DisasContext *ctx, arg_orn *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    TCGv t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rk);
+
+    tcg_gen_not_tl(t0, t0);
+    tcg_gen_or_tl(Rd, Rj, t0);
+
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_andn(DisasContext *ctx, arg_andn *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    TCGv t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rk);
+
+    tcg_gen_not_tl(t0, t0);
+    tcg_gen_and_tl(Rd, Rj, t0);
+
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_mul_w(DisasContext *ctx, arg_mul_w *a)
+{
+    TCGv t0, t1;
+    TCGv_i32 t2, t3;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+    t1 = get_gpr(a->rk);
+    t2 = tcg_temp_new_i32();
+    t3 = tcg_temp_new_i32();
+
+    tcg_gen_trunc_tl_i32(t2, t0);
+    tcg_gen_trunc_tl_i32(t3, t1);
+    tcg_gen_mul_i32(t2, t2, t3);
+    tcg_gen_ext_i32_tl(Rd, t2);
+
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t3);
+
+    return true;
+}
+
+static bool trans_mulh_w(DisasContext *ctx, arg_mulh_w *a)
+{
+    TCGv t0, t1;
+    TCGv_i32 t2, t3;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+    t1 = get_gpr(a->rk);
+    t2 = tcg_temp_new_i32();
+    t3 = tcg_temp_new_i32();
+
+    tcg_gen_trunc_tl_i32(t2, t0);
+    tcg_gen_trunc_tl_i32(t3, t1);
+    tcg_gen_muls2_i32(t2, t3, t2, t3);
+    tcg_gen_ext_i32_tl(Rd, t3);
+
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t3);
+
+    return true;
+}
+
+static bool trans_mulh_wu(DisasContext *ctx, arg_mulh_wu *a)
+{
+    TCGv t0, t1;
+    TCGv_i32 t2, t3;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+    t1 = get_gpr(a->rk);
+    t2 = tcg_temp_new_i32();
+    t3 = tcg_temp_new_i32();
+
+    tcg_gen_trunc_tl_i32(t2, t0);
+    tcg_gen_trunc_tl_i32(t3, t1);
+    tcg_gen_mulu2_i32(t2, t3, t2, t3);
+    tcg_gen_ext_i32_tl(Rd, t3);
+
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t3);
+
+    return true;
+}
+
+static bool trans_mul_d(DisasContext *ctx, arg_mul_d *a)
+{
+    TCGv t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+    t1 = get_gpr(a->rk);
+
+    check_loongarch_64(ctx);
+    tcg_gen_mul_i64(Rd, t0, t1);
+
+    return true;
+}
+
+static bool trans_mulh_d(DisasContext *ctx, arg_mulh_d *a)
+{
+    TCGv t0, t1, t2;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+    t1 = get_gpr(a->rk);
+    t2 = tcg_temp_new();
+
+    check_loongarch_64(ctx);
+    tcg_gen_muls2_i64(t2, Rd, t0, t1);
+
+    tcg_temp_free(t2);
+
+    return true;
+}
+
+static bool trans_mulh_du(DisasContext *ctx, arg_mulh_du *a)
+{
+    TCGv t0, t1, t2;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+    t1 = get_gpr(a->rk);
+    t2 = tcg_temp_new();
+
+    check_loongarch_64(ctx);
+    tcg_gen_mulu2_i64(t2, Rd, t0, t1);
+
+    tcg_temp_free(t2);
+
+    return true;
+}
+
+static bool trans_mulw_d_w(DisasContext *ctx, arg_mulw_d_w *a)
+{
+    TCGv_i64 t0, t1, t2;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+
+    gen_load_gpr(t0, a->rj);
+    gen_load_gpr(t1, a->rk);
+
+    tcg_gen_ext32s_i64(t0, t0);
+    tcg_gen_ext32s_i64(t1, t1);
+    tcg_gen_mul_i64(t2, t0, t1);
+    tcg_gen_mov_tl(Rd, t2);
+
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t2);
+
+    return true;
+}
+
+static bool trans_mulw_d_wu(DisasContext *ctx, arg_mulw_d_wu *a)
+{
+    TCGv_i64 t0, t1, t2;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+
+    gen_load_gpr(t0, a->rj);
+    gen_load_gpr(t1, a->rk);
+
+    tcg_gen_ext32u_i64(t0, t0);
+    tcg_gen_ext32u_i64(t1, t1);
+    tcg_gen_mul_i64(t2, t0, t1);
+    tcg_gen_mov_tl(Rd, t2);
+
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t2);
+
+    return true;
+}
+
+static bool trans_div_w(DisasContext *ctx, arg_div_w *a)
+{
+    TCGv t0, t1, t2, t3;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    t2 = tcg_temp_new();
+    t3 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rj);
+    gen_load_gpr(t1, a->rk);
+
+    tcg_gen_ext32s_tl(t0, t0);
+    tcg_gen_ext32s_tl(t1, t1);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t2, t0, INT_MIN);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, -1);
+    tcg_gen_and_tl(t2, t2, t3);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, 0);
+    tcg_gen_or_tl(t2, t2, t3);
+    tcg_gen_movi_tl(t3, 0);
+    tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
+    tcg_gen_div_tl(Rd, t0, t1);
+    tcg_gen_ext32s_tl(Rd, Rd);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    tcg_temp_free(t3);
+
+    return true;
+}
+
+static bool trans_mod_w(DisasContext *ctx, arg_mod_w *a)
+{
+    TCGv t0, t1, t2, t3;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    t2 = tcg_temp_new();
+    t3 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rj);
+    gen_load_gpr(t1, a->rk);
+
+    tcg_gen_ext32s_tl(t0, t0);
+    tcg_gen_ext32s_tl(t1, t1);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t2, t0, INT_MIN);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, -1);
+    tcg_gen_and_tl(t2, t2, t3);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, 0);
+    tcg_gen_or_tl(t2, t2, t3);
+    tcg_gen_movi_tl(t3, 0);
+    tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
+    tcg_gen_rem_tl(Rd, t0, t1);
+    tcg_gen_ext32s_tl(Rd, Rd);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    tcg_temp_free(t3);
+
+    return true;
+}
+
+static bool trans_div_wu(DisasContext *ctx, arg_div_wu *a)
+{
+    TCGv t0, t1, t2, t3;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    t2 = tcg_const_tl(0);
+    t3 = tcg_const_tl(1);
+
+    gen_load_gpr(t0, a->rj);
+    gen_load_gpr(t1, a->rk);
+
+    tcg_gen_ext32u_tl(t0, t0);
+    tcg_gen_ext32u_tl(t1, t1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
+    tcg_gen_divu_tl(Rd, t0, t1);
+    tcg_gen_ext32s_tl(Rd, Rd);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    tcg_temp_free(t3);
+
+    return true;
+}
+
+static bool trans_mod_wu(DisasContext *ctx, arg_mod_wu *a)
+{
+    TCGv t0, t1, t2, t3;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    t2 = tcg_const_tl(0);
+    t3 = tcg_const_tl(1);
+
+    gen_load_gpr(t0, a->rj);
+    gen_load_gpr(t1, a->rk);
+
+    tcg_gen_ext32u_tl(t0, t0);
+    tcg_gen_ext32u_tl(t1, t1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
+    tcg_gen_remu_tl(Rd, t0, t1);
+    tcg_gen_ext32s_tl(Rd, Rd);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    tcg_temp_free(t3);
+
+    return true;
+}
+
+static bool trans_div_d(DisasContext *ctx, arg_div_d *a)
+{
+    TCGv t0, t1, t2, t3;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+    t1 = get_gpr(a->rk);
+    t2 = tcg_temp_new();
+    t3 = tcg_temp_new();
+
+    check_loongarch_64(ctx);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t2, t0, -1LL << 63);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, -1LL);
+    tcg_gen_and_tl(t2, t2, t3);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, 0);
+    tcg_gen_or_tl(t2, t2, t3);
+    tcg_gen_movi_tl(t3, 0);
+    tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
+    tcg_gen_div_tl(Rd, t0, t1);
+
+    tcg_temp_free(t2);
+    tcg_temp_free(t3);
+
+    return true;
+}
+
+static bool trans_mod_d(DisasContext *ctx, arg_mod_d *a)
+{
+    TCGv t0, t1, t2, t3;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+    t1 = get_gpr(a->rk);
+    t2 = tcg_temp_new();
+    t3 = tcg_temp_new();
+
+    check_loongarch_64(ctx);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t2, t0, -1LL << 63);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, -1LL);
+    tcg_gen_and_tl(t2, t2, t3);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, 0);
+    tcg_gen_or_tl(t2, t2, t3);
+    tcg_gen_movi_tl(t3, 0);
+    tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
+    tcg_gen_rem_tl(Rd, t0, t1);
+
+    tcg_temp_free(t2);
+    tcg_temp_free(t3);
+
+    return true;
+}
+
+static bool trans_div_du(DisasContext *ctx, arg_div_du *a)
+{
+    TCGv t0, t1, t2, t3;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+    t1 = get_gpr(a->rk);
+    t2 = tcg_const_tl(0);
+    t3 = tcg_const_tl(1);
+
+    check_loongarch_64(ctx);
+    tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
+    tcg_gen_divu_i64(Rd, t0, t1);
+
+    tcg_temp_free(t2);
+    tcg_temp_free(t3);
+
+    return true;
+}
+
+static bool trans_mod_du(DisasContext *ctx, arg_mod_du *a)
+{
+    TCGv t0, t1, t2, t3;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+    t1 = get_gpr(a->rk);
+    t2 = tcg_const_tl(0);
+    t3 = tcg_const_tl(1);
+
+    check_loongarch_64(ctx);
+    tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
+    tcg_gen_remu_i64(Rd, t0, t1);
+
+    tcg_temp_free(t2);
+    tcg_temp_free(t3);
+
+    return true;
+}
+
+static bool trans_alsl_w(DisasContext *ctx, arg_alsl_w *a)
+{
+    TCGv t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = get_gpr(a->rk);
+
+    gen_load_gpr(t0, a->rj);
+
+    tcg_gen_shli_tl(t0, t0, a->sa2 + 1);
+    tcg_gen_add_tl(Rd, t0, t1);
+    tcg_gen_ext32s_tl(Rd, Rd);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_alsl_wu(DisasContext *ctx, arg_alsl_wu *a)
+{
+    TCGv t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = get_gpr(a->rk);
+
+    gen_load_gpr(t0, a->rj);
+
+    tcg_gen_shli_tl(t0, t0, a->sa2 + 1);
+    tcg_gen_add_tl(t0, t0, t1);
+    tcg_gen_ext32u_tl(Rd, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_alsl_d(DisasContext *ctx, arg_alsl_d *a)
+{
+    TCGv t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = get_gpr(a->rk);
+
+    gen_load_gpr(t0, a->rj);
+
+    check_loongarch_64(ctx);
+    tcg_gen_shli_tl(t0, t0, a->sa2 + 1);
+    tcg_gen_add_tl(Rd, t0, t1);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_lu12i_w(DisasContext *ctx, arg_lu12i_w *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    tcg_gen_movi_tl(Rd, a->si20 << 12);
+
+    return true;
+}
+
+static bool trans_lu32i_d(DisasContext *ctx, arg_lu32i_d *a)
+{
+    TCGv_i64 t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+
+    tcg_gen_movi_tl(t0, a->si20);
+    tcg_gen_concat_tl_i64(t1, Rd, t0);
+    tcg_gen_mov_tl(Rd, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_lu52i_d(DisasContext *ctx, arg_lu52i_d *a)
+{
+    TCGv t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_load_gpr(t1, a->rj);
+
+    tcg_gen_movi_tl(t0, a->si12);
+    tcg_gen_shli_tl(t0, t0, 52);
+    tcg_gen_andi_tl(t1, t1, 0xfffffffffffffU);
+    tcg_gen_or_tl(Rd, t0, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_pcaddi(DisasContext *ctx, arg_pcaddi *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    target_ulong pc = ctx->base.pc_next;
+    target_ulong addr = pc + (a->si20 << 2);
+    tcg_gen_movi_tl(Rd, addr);
+
+    return true;
+}
+
+static bool trans_pcalau12i(DisasContext *ctx, arg_pcalau12i *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    target_ulong pc = ctx->base.pc_next;
+    target_ulong addr = (pc + (a->si20 << 12)) & ~0xfff;
+    tcg_gen_movi_tl(Rd, addr);
+
+    return true;
+}
+
+static bool trans_pcaddu12i(DisasContext *ctx, arg_pcaddu12i *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    target_ulong pc = ctx->base.pc_next;
+    target_ulong addr = pc + (a->si20 << 12);
+    tcg_gen_movi_tl(Rd, addr);
+
+    return true;
+}
+
+static bool trans_pcaddu18i(DisasContext *ctx, arg_pcaddu18i *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    target_ulong pc = ctx->base.pc_next;
+    target_ulong addr = pc + ((target_ulong)(a->si20) << 18);
+    tcg_gen_movi_tl(Rd, addr);
+
+    return true;
+}
+
+static bool trans_addi_w(DisasContext *ctx, arg_addi_w *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+    target_ulong uimm = (target_long)(a->si12);
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    if (a->rj != 0) {
+        tcg_gen_addi_tl(Rd, Rj, uimm);
+        tcg_gen_ext32s_tl(Rd, Rd);
+    } else {
+        tcg_gen_movi_tl(Rd, uimm);
+    }
+
+    return true;
+}
+
+static bool trans_addi_d(DisasContext *ctx, arg_addi_d *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+    target_ulong uimm = (target_long)(a->si12);
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    check_loongarch_64(ctx);
+    if (a->rj != 0) {
+        tcg_gen_addi_tl(Rd, Rj, uimm);
+    } else {
+        tcg_gen_movi_tl(Rd, uimm);
+    }
+
+    return true;
+}
+
+static bool trans_addu16i_d(DisasContext *ctx, arg_addu16i_d *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    if (a->rj != 0) {
+        tcg_gen_addi_tl(Rd, Rj, a->si16 << 16);
+    } else {
+        tcg_gen_movi_tl(Rd, a->si16 << 16);
+    }
+    return true;
+}
+
+static bool trans_andi(DisasContext *ctx, arg_andi *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+
+    target_ulong uimm = (uint16_t)(a->ui12);
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    if (likely(a->rj != 0)) {
+        tcg_gen_andi_tl(Rd, Rj, uimm);
+    } else {
+        tcg_gen_movi_tl(Rd, 0);
+    }
+
+    return true;
+}
+
+static bool trans_ori(DisasContext *ctx, arg_ori *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+
+    target_ulong uimm = (uint16_t)(a->ui12);
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    if (a->rj != 0) {
+        tcg_gen_ori_tl(Rd, Rj, uimm);
+    } else {
+        tcg_gen_movi_tl(Rd, uimm);
+    }
+
+    return true;
+}
+
+static bool trans_xori(DisasContext *ctx, arg_xori *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+
+    target_ulong uimm = (uint16_t)(a->ui12);
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    if (likely(a->rj != 0)) {
+        tcg_gen_xori_tl(Rd, Rj, uimm);
+    } else {
+        tcg_gen_movi_tl(Rd, uimm);
+    }
+
+    return true;
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 531f7e1..b60bdc2 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -57,6 +57,15 @@ void gen_load_gpr(TCGv t, int reg)
     }
 }
 
+TCGv get_gpr(int regno)
+{
+    if (regno == 0) {
+        return tcg_constant_tl(0);
+    } else {
+        return cpu_gpr[regno];
+    }
+}
+
 static inline void gen_save_pc(target_ulong pc)
 {
     tcg_gen_movi_tl(cpu_PC, pc);
@@ -287,6 +296,9 @@ static bool loongarch_tr_breakpoint_check(DisasContextBase *dcbase,
     return true;
 }
 
+#include "decode-insns.c.inc"
+#include "trans.inc.c"
+
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     CPULoongArchState *env = cs->env_ptr;
diff --git a/target/loongarch/translate.h b/target/loongarch/translate.h
index 333c3bf..ef4d4e7 100644
--- a/target/loongarch/translate.h
+++ b/target/loongarch/translate.h
@@ -35,6 +35,7 @@ void check_fpu_enabled(DisasContext *ctx);
 
 void gen_base_offset_addr(TCGv addr, int base, int offset);
 void gen_load_gpr(TCGv t, int reg);
+TCGv get_gpr(int regno);
 void gen_load_fpr32(TCGv_i32 t, int reg);
 void gen_load_fpr64(TCGv_i64 t, int reg);
 void gen_store_fpr32(TCGv_i32 t, int reg);
-- 
1.8.3.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B43C43F9578
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:51:05 +0200 (CEST)
Received: from localhost ([::1]:45998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJWdf-0002Tu-PH
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mJW59-0000ia-Fw
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 03:15:19 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59462 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mJW4z-0003CH-JZ
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 03:15:19 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxtOTvkChhno4AAA--.2304S7;
 Fri, 27 Aug 2021 15:15:03 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/19] target/loongarch: Add fixed point shift instruction
 translation
Date: Fri, 27 Aug 2021 15:14:40 +0800
Message-Id: <1630048494-2143-6-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1630048494-2143-1-git-send-email-gaosong@loongson.cn>
References: <1630048494-2143-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9AxtOTvkChhno4AAA--.2304S7
X-Coremail-Antispam: 1UD129KBjvJXoWxKw47uw48Xw1DCw1DGF1kuFg_yoW3XF47pr
 18CryUGr48Xr9rJr9Ivw45uFZ8JFnrCa1jg3ySyr15CF4UX3WDJF1DC3ya9rW7twn3ZrW8
 ZFZ5uFyqgFyrGaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
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
 richard.henderson@linaro.org, f4bug@amsat.org, maobibo@loongson.cn,
 laurent@vivier.eu, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implement fixed point shift instruction translation.

This includes:
- SLL.W, SRL.W, SRA.W, ROTR.W
- SLLI.W, SRLI.W, SRAI.W, ROTRI.W
- SLL.D, SRL.D, SRA.D, ROTR.D
- SLLI.D, SRLI.D, SRAI.D, ROTRI.D

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/insn_trans/trans_shift.c | 154 ++++++++++++++++++++++++++++++
 target/loongarch/insns.decode             |  26 +++++
 target/loongarch/translate.c              |   1 +
 3 files changed, 181 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_shift.c

diff --git a/target/loongarch/insn_trans/trans_shift.c b/target/loongarch/insn_trans/trans_shift.c
new file mode 100644
index 0000000..5fa1162
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_shift.c
@@ -0,0 +1,154 @@
+/*
+ * LoongArch translate functions
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+static bool gen_r2_ui5(DisasContext *ctx, arg_slli_w *a,
+                       void(*func)(TCGv, TCGv, TCGv))
+{
+    ctx->dst_ext = EXT_SIGN;
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_ZERO);
+    TCGv src2 = tcg_constant_tl(a->ui5);
+
+    TCGv t0 = temp_new(ctx);
+
+    tcg_gen_andi_tl(t0, src2, 0x1f);
+    func(dest, src1, t0);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool gen_r2_ui6(DisasContext *ctx, arg_slli_d *a,
+                       void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = tcg_constant_tl(a->ui6);
+
+    TCGv t0 = temp_new(ctx);
+
+    tcg_gen_andi_tl(t0, src2, 0x7f);
+    func(dest, src1, t0);
+
+    return true;
+}
+
+static void gen_sll_w(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+
+    tcg_gen_andi_tl(t0, src2, 0x1f);
+    tcg_gen_shl_tl(dest, src1, t0);
+    tcg_temp_free(t0);
+}
+
+static void gen_srl_w(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_andi_tl(t0, src2, 0x1f);
+    tcg_gen_shr_tl(dest, src1, t0);
+    tcg_temp_free(t0);
+}
+
+static void gen_sra_w(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_andi_tl(t0, src2, 0x1f);
+    tcg_gen_sar_tl(dest, src1, t0);
+    tcg_temp_free(t0);
+}
+
+static void gen_sll_d(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_andi_tl(t0, src2, 0x3f);
+    tcg_gen_shl_tl(dest, src1, t0);
+    tcg_temp_free(t0);
+}
+
+static void gen_srl_d(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_andi_tl(t0, src2, 0x3f);
+    tcg_gen_shr_tl(dest, src1, t0);
+    tcg_temp_free(t0);
+}
+
+static void gen_sra_d(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_andi_tl(t0, src2, 0x3f);
+    tcg_gen_sar_tl(dest, src1, t0);
+    tcg_temp_free(t0);
+}
+
+static void gen_rotr_w(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+    TCGv t0 = tcg_temp_new();
+
+    tcg_gen_andi_tl(t0, src2, 0x1f);
+
+    tcg_gen_trunc_tl_i32(t1, src1);
+    tcg_gen_trunc_tl_i32(t2, t0);
+
+    tcg_gen_rotr_i32(t1, t1, t2);
+    tcg_gen_ext_i32_tl(dest, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free(t0);
+}
+
+static void gen_rotr_d(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_andi_tl(t0, src2, 0x3f);
+    tcg_gen_rotr_tl(dest, src1, t0);
+    tcg_temp_free(t0);
+}
+
+static void gen_rotri_w(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    tcg_gen_trunc_tl_i32(t1, src1);
+    tcg_gen_trunc_tl_i32(t2, src2);
+    tcg_gen_rotr_i32(t1, t1, t2);
+    tcg_gen_ext_i32_tl(dest, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
+static bool trans_srai_w(DisasContext *ctx, arg_srai_w *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_ZERO);
+
+    tcg_gen_sextract_tl(dest, src1, a->ui5, 32 - a->ui5);
+    return true;
+}
+
+TRANS(sll_w, gen_r3, EXT_ZERO, EXT_NONE, EXT_SIGN, gen_sll_w)
+TRANS(srl_w, gen_r3, EXT_ZERO, EXT_NONE, EXT_SIGN, gen_srl_w)
+TRANS(sra_w, gen_r3, EXT_ZERO, EXT_NONE, EXT_SIGN, gen_sra_w)
+TRANS(sll_d, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_sll_d)
+TRANS(srl_d, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_srl_d)
+TRANS(sra_d, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_sra_d)
+TRANS(rotr_w, gen_r3, EXT_ZERO, EXT_NONE, EXT_SIGN, gen_rotr_w)
+TRANS(rotr_d, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_rotr_d)
+TRANS(slli_w, gen_r2_ui5, tcg_gen_shl_tl)
+TRANS(slli_d, gen_r2_ui6, tcg_gen_shl_tl)
+TRANS(srli_w, gen_r2_ui5, tcg_gen_shr_tl)
+TRANS(srli_d, gen_r2_ui6, tcg_gen_shr_tl)
+TRANS(srai_d, gen_r2_ui6, tcg_gen_sar_tl)
+TRANS(rotri_w, gen_r2_ui5, gen_rotri_w)
+TRANS(rotri_d, gen_r2_ui6, tcg_gen_rotr_tl)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 1e0b755..9302576 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -17,6 +17,8 @@
 %ui12    10:12
 %si16    10:s16
 %si20    5:s20
+%ui5     10:5
+%ui6     10:6
 
 #
 # Argument sets
@@ -27,6 +29,8 @@
 &fmt_rdrjsi16       rd rj si16
 &fmt_rdrjui12       rd rj ui12
 &fmt_rdsi20         rd si20
+&fmt_rdrjui5        rd rj ui5
+&fmt_rdrjui6        rd rj ui6
 
 #
 # Formats
@@ -37,6 +41,8 @@
 @fmt_rdrjrksa2       .... ........ ... .. ..... ..... .....   &fmt_rdrjrksa2      %rd %rj %rk %sa2
 @fmt_rdrjsi16        .... .. ................ ..... .....     &fmt_rdrjsi16       %rd %rj %si16
 @fmt_rdsi20          .... ... .................... .....      &fmt_rdsi20         %rd %si20
+@fmt_rdrjui5         .... ........ ..... ..... ..... .....    &fmt_rdrjui5        %rd %rj %ui5
+@fmt_rdrjui6         .... ........ .... ...... ..... .....    &fmt_rdrjui6        %rd %rj %ui6
 
 #
 # Fixed point arithmetic operation instruction
@@ -87,3 +93,23 @@ addu16i_d        0001 00 ................ ..... .....     @fmt_rdrjsi16
 andi             0000 001101 ............ ..... .....     @fmt_rdrjui12
 ori              0000 001110 ............ ..... .....     @fmt_rdrjui12
 xori             0000 001111 ............ ..... .....     @fmt_rdrjui12
+
+#
+# Fixed point shift operation instruction
+#
+sll_w            0000 00000001 01110 ..... ..... .....    @fmt_rdrjrk
+srl_w            0000 00000001 01111 ..... ..... .....    @fmt_rdrjrk
+sra_w            0000 00000001 10000 ..... ..... .....    @fmt_rdrjrk
+sll_d            0000 00000001 10001 ..... ..... .....    @fmt_rdrjrk
+srl_d            0000 00000001 10010 ..... ..... .....    @fmt_rdrjrk
+sra_d            0000 00000001 10011 ..... ..... .....    @fmt_rdrjrk
+rotr_w           0000 00000001 10110 ..... ..... .....    @fmt_rdrjrk
+rotr_d           0000 00000001 10111 ..... ..... .....    @fmt_rdrjrk
+slli_w           0000 00000100 00001 ..... ..... .....    @fmt_rdrjui5
+slli_d           0000 00000100 0001 ...... ..... .....    @fmt_rdrjui6
+srli_w           0000 00000100 01001 ..... ..... .....    @fmt_rdrjui5
+srli_d           0000 00000100 0101 ...... ..... .....    @fmt_rdrjui6
+srai_w           0000 00000100 10001 ..... ..... .....    @fmt_rdrjui5
+srai_d           0000 00000100 1001 ...... ..... .....    @fmt_rdrjui6
+rotri_w          0000 00000100 11001 ..... ..... .....    @fmt_rdrjui5
+rotri_d          0000 00000100 1101 ...... ..... .....    @fmt_rdrjui6
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 1806d2c..e9cccca 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -159,6 +159,7 @@ static bool gen_r3(DisasContext *ctx, arg_fmt_rdrjrk *a,
 }
 
 #include "insn_trans/trans_arith.c"
+#include "insn_trans/trans_shift.c"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
1.8.3.1



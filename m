Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B463B5DD0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:17:12 +0200 (CEST)
Received: from localhost ([::1]:57670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqCN-0006CK-AP
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lxq0c-0002DH-Gn
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:05:02 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45420 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lxq0V-00019E-7Z
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:05:02 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0LdutlgOrYZAA--.8747S10; 
 Mon, 28 Jun 2021 20:04:51 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/20] target/loongarch: Add fixed point shift instruction
 translation
Date: Mon, 28 Jun 2021 20:04:33 +0800
Message-Id: <1624881885-31692-9-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0LdutlgOrYZAA--.8747S10
X-Coremail-Antispam: 1UD129KBjvJXoW3CF15uF1fGFyrZry5GryUKFg_yoWDArWxpr
 1Uury8Wr48tr17Gr9Ikr15Gr98JF1IkF1jg3sav348CF48J3WDJrnYy3yayFWjvws7WFWj
 vF98uFy7KFy8XwUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, maobibo@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, philmd@redhat.com
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
 target/loongarch/insns.decode |  26 ++++++++
 target/loongarch/instmap.h    |  13 ++++
 target/loongarch/trans.inc.c  | 134 ++++++++++++++++++++++++++++++++++++++++++
 target/loongarch/translate.c  | 107 +++++++++++++++++++++++++++++++++
 4 files changed, 280 insertions(+)

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
diff --git a/target/loongarch/instmap.h b/target/loongarch/instmap.h
index 8844333..5aaffb4 100644
--- a/target/loongarch/instmap.h
+++ b/target/loongarch/instmap.h
@@ -21,6 +21,14 @@ enum {
     LA_OPC_AND       = (0x00029 << 15),
     LA_OPC_OR        = (0x0002A << 15),
     LA_OPC_XOR       = (0x0002B << 15),
+    LA_OPC_SLL_W     = (0x0002E << 15),
+    LA_OPC_SRL_W     = (0x0002F << 15),
+    LA_OPC_SRA_W     = (0x00030 << 15),
+    LA_OPC_SLL_D     = (0x00031 << 15),
+    LA_OPC_SRL_D     = (0x00032 << 15),
+    LA_OPC_SRA_D     = (0x00033 << 15),
+    LA_OPC_ROTR_W    = (0x00036 << 15),
+    LA_OPC_ROTR_D    = (0x00037 << 15),
     LA_OPC_MUL_W     = (0x00038 << 15),
     LA_OPC_MULH_W    = (0x00039 << 15),
     LA_OPC_MULH_WU   = (0x0003A << 15),
@@ -35,6 +43,9 @@ enum {
     LA_OPC_MOD_D     = (0x00045 << 15),
     LA_OPC_DIV_DU    = (0x00046 << 15),
     LA_OPC_MOD_DU    = (0x00047 << 15),
+    LA_OPC_SRLI_W    = (0x00089 << 15),
+    LA_OPC_SRAI_W    = (0x00091 << 15),
+    LA_OPC_ROTRI_W   = (0x00099 << 15),
 
     LA_OPC_ALSL_W    = (0x0002 << 17),
     LA_OPC_ALSL_D    = (0x0016 << 17)
@@ -51,3 +62,5 @@ enum {
     LA_OPC_ORI       = (0x00E << 22),
     LA_OPC_XORI      = (0x00F << 22)
 };
+
+#endif
diff --git a/target/loongarch/trans.inc.c b/target/loongarch/trans.inc.c
index a5bc1ea..7d3b45f 100644
--- a/target/loongarch/trans.inc.c
+++ b/target/loongarch/trans.inc.c
@@ -365,3 +365,137 @@ static bool trans_xori(DisasContext *ctx, arg_xori *a)
     gen_loongarch_logic_imm(ctx, LA_OPC_XORI, a->rd, a->rj, a->ui12);
     return true;
 }
+
+/* Fixed point shift operation instruction translation */
+static bool trans_sll_w(DisasContext *ctx, arg_sll_w *a)
+{
+    gen_loongarch_shift(ctx, LA_OPC_SLL_W, a->rd, a->rk, a->rj);
+    return true;
+}
+
+static bool trans_srl_w(DisasContext *ctx, arg_srl_w *a)
+{
+    gen_loongarch_shift(ctx, LA_OPC_SRL_W, a->rd, a->rk, a->rj);
+    return true;
+}
+
+static bool trans_sra_w(DisasContext *ctx, arg_sra_w *a)
+{
+    gen_loongarch_shift(ctx, LA_OPC_SRA_W, a->rd, a->rk, a->rj);
+    return true;
+}
+
+static bool trans_sll_d(DisasContext *ctx, arg_sll_d *a)
+{
+    check_loongarch_64(ctx);
+    gen_loongarch_shift(ctx, LA_OPC_SLL_D, a->rd, a->rk, a->rj);
+    return true;
+}
+static bool trans_srl_d(DisasContext *ctx, arg_srl_d *a)
+{
+    check_loongarch_64(ctx);
+    gen_loongarch_shift(ctx, LA_OPC_SRL_D, a->rd, a->rk, a->rj);
+    return true;
+}
+
+static bool trans_sra_d(DisasContext *ctx, arg_sra_d *a)
+{
+    check_loongarch_64(ctx);
+    gen_loongarch_shift(ctx, LA_OPC_SRA_D, a->rd, a->rk, a->rj);
+    return true;
+}
+
+static bool trans_rotr_w(DisasContext *ctx, arg_rotr_w *a)
+{
+    gen_loongarch_shift(ctx, LA_OPC_ROTR_W, a->rd, a->rk, a->rj);
+    return true;
+}
+
+static bool trans_rotr_d(DisasContext *ctx, arg_rotr_d *a)
+{
+    check_loongarch_64(ctx);
+    gen_loongarch_shift(ctx, LA_OPC_ROTR_D, a->rd, a->rk, a->rj);
+    return true;
+}
+
+static bool trans_slli_w(DisasContext *ctx, arg_slli_w *a)
+{
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    TCGv t0 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rj);
+    tcg_gen_shli_tl(t0, t0, a->ui5);
+    tcg_gen_ext32s_tl(cpu_gpr[a->rd], t0);
+
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_slli_d(DisasContext *ctx, arg_slli_d *a)
+{
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    TCGv t0 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rj);
+    tcg_gen_shli_tl(cpu_gpr[a->rd], t0, a->ui6);
+
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_srli_w(DisasContext *ctx, arg_srli_w *a)
+{
+    gen_loongarch_shift_imm(ctx, LA_OPC_SRLI_W, a->rd, a->rj, a->ui5);
+    return true;
+}
+
+static bool trans_srli_d(DisasContext *ctx, arg_srli_d *a)
+{
+    TCGv t0 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rj);
+    tcg_gen_shri_tl(cpu_gpr[a->rd], t0, a->ui6);
+
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_srai_w(DisasContext *ctx, arg_srai_w *a)
+{
+    gen_loongarch_shift_imm(ctx, LA_OPC_SRAI_W, a->rd, a->rj, a->ui5);
+    return true;
+}
+
+static bool trans_srai_d(DisasContext *ctx, arg_srai_d *a)
+{
+    TCGv t0 = tcg_temp_new();
+    check_loongarch_64(ctx);
+    gen_load_gpr(t0, a->rj);
+    tcg_gen_sari_tl(cpu_gpr[a->rd], t0, a->ui6);
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_rotri_w(DisasContext *ctx, arg_rotri_w *a)
+{
+    gen_loongarch_shift_imm(ctx, LA_OPC_ROTRI_W, a->rd, a->rj, a->ui5);
+    return true;
+}
+
+static bool trans_rotri_d(DisasContext *ctx, arg_rotri_d *a)
+{
+    TCGv t0 = tcg_temp_new();
+    check_loongarch_64(ctx);
+    gen_load_gpr(t0, a->rj);
+    tcg_gen_rotri_tl(cpu_gpr[a->rd], t0, a->ui6);
+    tcg_temp_free(t0);
+    return true;
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 3b40a59..60f884f 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -747,6 +747,113 @@ static void gen_loongarch_alsl(DisasContext *ctx, int opc, int rd,
     return;
 }
 
+/*loongarch shifts */
+static void gen_loongarch_shift(DisasContext *ctx, uint32_t opc,
+                                int rd, int rj, int rk)
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
+    case LA_OPC_SLL_W:
+        tcg_gen_andi_tl(t0, t0, 0x1f);
+        tcg_gen_shl_tl(t0, t1, t0);
+        tcg_gen_ext32s_tl(cpu_gpr[rd], t0);
+        break;
+    case LA_OPC_SRA_W:
+        tcg_gen_andi_tl(t0, t0, 0x1f);
+        tcg_gen_sar_tl(cpu_gpr[rd], t1, t0);
+        break;
+    case LA_OPC_SRL_W:
+        tcg_gen_ext32u_tl(t1, t1);
+        tcg_gen_andi_tl(t0, t0, 0x1f);
+        tcg_gen_shr_tl(t0, t1, t0);
+        tcg_gen_ext32s_tl(cpu_gpr[rd], t0);
+        break;
+    case LA_OPC_ROTR_W:
+        {
+            TCGv_i32 t2 = tcg_temp_new_i32();
+            TCGv_i32 t3 = tcg_temp_new_i32();
+            tcg_gen_trunc_tl_i32(t2, t0);
+            tcg_gen_trunc_tl_i32(t3, t1);
+            tcg_gen_andi_i32(t2, t2, 0x1f);
+            tcg_gen_rotr_i32(t2, t3, t2);
+            tcg_gen_ext_i32_tl(cpu_gpr[rd], t2);
+            tcg_temp_free_i32(t2);
+            tcg_temp_free_i32(t3);
+        }
+        break;
+    case LA_OPC_SLL_D:
+        tcg_gen_andi_tl(t0, t0, 0x3f);
+        tcg_gen_shl_tl(cpu_gpr[rd], t1, t0);
+        break;
+    case LA_OPC_SRA_D:
+        tcg_gen_andi_tl(t0, t0, 0x3f);
+        tcg_gen_sar_tl(cpu_gpr[rd], t1, t0);
+        break;
+    case LA_OPC_SRL_D:
+        tcg_gen_andi_tl(t0, t0, 0x3f);
+        tcg_gen_shr_tl(cpu_gpr[rd], t1, t0);
+        break;
+    case LA_OPC_ROTR_D:
+        tcg_gen_andi_tl(t0, t0, 0x3f);
+        tcg_gen_rotr_tl(cpu_gpr[rd], t1, t0);
+        break;
+    }
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+
+/* loongarch shifts with immediate operand */
+static void gen_loongarch_shift_imm(DisasContext *ctx, uint32_t opc,
+                                    int rd, int rj, int16_t imm)
+{
+    target_ulong uimm = ((uint16_t)imm) & 0x1f;
+    TCGv t0;
+
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return;
+    }
+
+    t0 = tcg_temp_new();
+    gen_load_gpr(t0, rj);
+    switch (opc) {
+    case LA_OPC_SRAI_W:
+        tcg_gen_sari_tl(cpu_gpr[rd], t0, uimm);
+        break;
+    case LA_OPC_SRLI_W:
+        if (uimm != 0) {
+            tcg_gen_ext32u_tl(t0, t0);
+            tcg_gen_shri_tl(cpu_gpr[rd], t0, uimm);
+        } else {
+            tcg_gen_ext32s_tl(cpu_gpr[rd], t0);
+        }
+        break;
+    case LA_OPC_ROTRI_W:
+        if (uimm != 0) {
+            TCGv_i32 t1 = tcg_temp_new_i32();
+
+            tcg_gen_trunc_tl_i32(t1, t0);
+            tcg_gen_rotri_i32(t1, t1, uimm);
+            tcg_gen_ext_i32_tl(cpu_gpr[rd], t1);
+            tcg_temp_free_i32(t1);
+        } else {
+            tcg_gen_ext32s_tl(cpu_gpr[rd], t0);
+        }
+        break;
+    }
+    tcg_temp_free(t0);
+}
+
 static void loongarch_tr_tb_start(DisasContextBase *dcbase, CPUState *cs)
 {
 }
-- 
1.8.3.1



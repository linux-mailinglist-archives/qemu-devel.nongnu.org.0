Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B903D0BA3
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:59:40 +0200 (CEST)
Received: from localhost ([::1]:43038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m690t-0007Am-L9
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m68uy-0002G3-OL
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:32 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49518 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m68uu-000270-QH
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:32 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0CO7vdg5VEiAA--.21107S10; 
 Wed, 21 Jul 2021 17:53:24 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/22] target/loongarch: Add fixed point shift instruction
 translation
Date: Wed, 21 Jul 2021 17:53:04 +0800
Message-Id: <1626861198-6133-9-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0CO7vdg5VEiAA--.21107S10
X-Coremail-Antispam: 1UD129KBjvJXoWxKw47uw47Wry3Wr43ur1xXwb_yoWfXr45pr
 1Uury8GrW8tr13J3sIyr15CFn8JF1vkFWjg3sayayFyr1UJ3WDJFn0y3yYyr4UZrn3WrWY
 ya98CFWUKFyxXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
 philmd@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 maobibo@loongson.cn, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
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
 target/loongarch/insns.decode |  26 +++
 target/loongarch/trans.inc.c  | 363 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 389 insertions(+)

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
diff --git a/target/loongarch/trans.inc.c b/target/loongarch/trans.inc.c
index 8faef62..62e9396 100644
--- a/target/loongarch/trans.inc.c
+++ b/target/loongarch/trans.inc.c
@@ -1088,3 +1088,366 @@ static bool trans_xori(DisasContext *ctx, arg_xori *a)
 
     return true;
 }
+
+/* Fixed point shift operation instruction translation */
+static bool trans_sll_w(DisasContext *ctx, arg_sll_w *a)
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
+    t1 = get_gpr(a->rj);
+
+    gen_load_gpr(t0, a->rk);
+
+    tcg_gen_andi_tl(t0, t0, 0x1f);
+    tcg_gen_shl_tl(t0, t1, t0);
+    tcg_gen_ext32s_tl(Rd, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_srl_w(DisasContext *ctx, arg_srl_w *a)
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
+    gen_load_gpr(t0, a->rk);
+    gen_load_gpr(t1, a->rj);
+
+    tcg_gen_ext32u_tl(t1, t1);
+    tcg_gen_andi_tl(t0, t0, 0x1f);
+    tcg_gen_shr_tl(t0, t1, t0);
+    tcg_gen_ext32s_tl(Rd, t0);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_sra_w(DisasContext *ctx, arg_sra_w *a)
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
+    t1 = get_gpr(a->rj);
+
+    gen_load_gpr(t0, a->rk);
+
+    tcg_gen_andi_tl(t0, t0, 0x1f);
+    tcg_gen_sar_tl(Rd, t1, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_sll_d(DisasContext *ctx, arg_sll_d *a)
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
+    t1 = get_gpr(a->rj);
+
+    gen_load_gpr(t0, a->rk);
+
+    check_loongarch_64(ctx);
+    tcg_gen_andi_tl(t0, t0, 0x3f);
+    tcg_gen_shl_tl(Rd, t1, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+static bool trans_srl_d(DisasContext *ctx, arg_srl_d *a)
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
+    t1 = get_gpr(a->rj);
+
+    gen_load_gpr(t0, a->rk);
+
+    check_loongarch_64(ctx);
+    tcg_gen_andi_tl(t0, t0, 0x3f);
+    tcg_gen_shr_tl(Rd, t1, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_sra_d(DisasContext *ctx, arg_sra_d *a)
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
+    t1 = get_gpr(a->rj);
+
+    gen_load_gpr(t0, a->rk);
+
+    check_loongarch_64(ctx);
+    tcg_gen_andi_tl(t0, t0, 0x3f);
+    tcg_gen_sar_tl(Rd, t1, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_rotr_w(DisasContext *ctx, arg_rotr_w *a)
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
+    t0 = get_gpr(a->rk);
+    t1 = get_gpr(a->rj);
+    t2 = tcg_temp_new_i32();
+    t3 = tcg_temp_new_i32();
+
+    tcg_gen_trunc_tl_i32(t2, t0);
+    tcg_gen_trunc_tl_i32(t3, t1);
+    tcg_gen_andi_i32(t2, t2, 0x1f);
+    tcg_gen_rotr_i32(t2, t3, t2);
+    tcg_gen_ext_i32_tl(Rd, t2);
+
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t3);
+
+    return true;
+}
+
+static bool trans_rotr_d(DisasContext *ctx, arg_rotr_d *a)
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
+    t1 = get_gpr(a->rj);
+
+    gen_load_gpr(t0, a->rk);
+
+    check_loongarch_64(ctx);
+    tcg_gen_andi_tl(t0, t0, 0x3f);
+    tcg_gen_rotr_tl(Rd, t1, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_slli_w(DisasContext *ctx, arg_slli_w *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    TCGv t0 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rj);
+    tcg_gen_shli_tl(t0, t0, a->ui5);
+    tcg_gen_ext32s_tl(Rd, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_slli_d(DisasContext *ctx, arg_slli_d *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    TCGv t0 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rj);
+    tcg_gen_shli_tl(Rd, t0, a->ui6);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_srli_w(DisasContext *ctx, arg_srli_w *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+    target_ulong uimm = ((uint16_t)(a->ui5)) & 0x1f;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rj);
+
+    if (uimm != 0) {
+        tcg_gen_ext32u_tl(t0, t0);
+        tcg_gen_shri_tl(Rd, t0, uimm);
+    } else {
+        tcg_gen_ext32s_tl(Rd, t0);
+    }
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_srli_d(DisasContext *ctx, arg_srli_d *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+
+    tcg_gen_shri_tl(Rd, t0, a->ui6);
+
+    return true;
+}
+
+static bool trans_srai_w(DisasContext *ctx, arg_srai_w *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+    target_ulong uimm = ((uint16_t)(a->ui5)) & 0x1f;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+
+    tcg_gen_sari_tl(Rd, t0, uimm);
+
+    return true;
+}
+
+static bool trans_srai_d(DisasContext *ctx, arg_srai_d *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+
+    check_loongarch_64(ctx);
+    tcg_gen_sari_tl(Rd, t0, a->ui6);
+
+    return true;
+}
+
+static bool trans_rotri_w(DisasContext *ctx, arg_rotri_w *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+    target_ulong uimm = ((uint16_t)(a->ui5)) & 0x1f;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+
+    if (uimm != 0) {
+        TCGv_i32 t1 = tcg_temp_new_i32();
+
+        tcg_gen_trunc_tl_i32(t1, t0);
+        tcg_gen_rotri_i32(t1, t1, uimm);
+        tcg_gen_ext_i32_tl(Rd, t1);
+
+        tcg_temp_free_i32(t1);
+    } else {
+        tcg_gen_ext32s_tl(Rd, t0);
+    }
+
+    return true;
+}
+
+static bool trans_rotri_d(DisasContext *ctx, arg_rotri_d *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+
+    check_loongarch_64(ctx);
+    tcg_gen_rotri_tl(Rd, t0, a->ui6);
+
+    return true;
+}
-- 
1.8.3.1



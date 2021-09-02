Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F753FEDEE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:44:25 +0200 (CEST)
Received: from localhost ([::1]:56008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLm4u-00006m-OK
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mLm2M-0005ni-Sh
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:41:48 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35984 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mLm2C-00061W-RD
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:41:44 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxYctjxjBha2YCAA--.7003S6;
 Thu, 02 Sep 2021 20:41:17 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/21] target/loongarch: Add fixed point arithmetic
 instruction translation
Date: Thu,  2 Sep 2021 20:40:50 +0800
Message-Id: <1630586467-22463-5-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9AxYctjxjBha2YCAA--.7003S6
X-Coremail-Antispam: 1UD129KBjvAXoWfXFyDtrWkZFW3XF4rZw4Utwb_yoW8Zw4UZo
 WUGF45Ar48GryYvr1ag3W8XFWxXr1j9anxA395u3WDWF4xCr13tr12krn5ZayrJa1DKFyr
 GF1SgF9xJ3yfXr1kn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 richard.henderson@linaro.org, groug@kaod.org, maobibo@loongson.cn,
 mrolnik@gmail.com, shorne@gmail.com, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au, kbastian@mail.uni-paderborn.de, crwulff@gmail.com,
 laurent@vivier.eu, palmer@dabbelt.com, pbonzini@redhat.com,
 aurelien@aurel32.net
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
Signed-off-by: XiaoJuan Yang <yangxiaojuan@loongson.cn>
---
 target/loongarch/insn_trans/trans_arith.c | 332 ++++++++++++++++++++++++++++++
 target/loongarch/insns.decode             |  89 ++++++++
 target/loongarch/internals.h              |   1 -
 target/loongarch/translate.c              | 105 +++++++++-
 target/loongarch/translate.h              |  20 ++
 5 files changed, 541 insertions(+), 6 deletions(-)
 create mode 100644 target/loongarch/insn_trans/trans_arith.c
 create mode 100644 target/loongarch/insns.decode

diff --git a/target/loongarch/insn_trans/trans_arith.c b/target/loongarch/insn_trans/trans_arith.c
new file mode 100644
index 0000000..85e6d64
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_arith.c
@@ -0,0 +1,332 @@
+/*
+ * LoongArch translate functions
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+static bool gen_r2_si12(DisasContext *ctx, arg_fmt_rdrjsi12 *a,
+                        DisasExtend src_ext, DisasExtend dst_ext,
+                        void (*func)(TCGv, TCGv, TCGv))
+{
+    ctx->dst_ext = dst_ext;
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rj, src_ext);
+    TCGv src2 = tcg_constant_tl(a->si12);
+
+    func(dest, src1, src2);
+
+    if (ctx->dst_ext) {
+        gen_set_gpr(ctx, a->rd, dest);
+    }
+    return true;
+}
+
+static bool gen_r3_sa2(DisasContext *ctx, arg_fmt_rdrjrksa2 *a,
+                       DisasExtend src_ext, DisasExtend dst_ext,
+                       void (*func)(TCGv, TCGv, TCGv, TCGv, target_long))
+{
+    ctx->dst_ext = dst_ext;
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rj, src_ext);
+    TCGv src2 = gpr_src(ctx, a->rk, src_ext);
+    TCGv temp = tcg_temp_new();
+
+    func(dest, src1, src2, temp, a->sa2);
+
+    if (ctx->dst_ext) {
+        gen_set_gpr(ctx, a->rd, dest);
+    }
+    tcg_temp_free(temp);
+    return true;
+}
+
+static bool trans_lu12i_w(DisasContext *ctx, arg_lu12i_w *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd);
+
+    tcg_gen_movi_tl(dest, a->si20 << 12);
+    return true;
+}
+
+static bool gen_pc(DisasContext *ctx, arg_fmt_rdsi20 *a,
+                   void (*func)(DisasContext *ctx, TCGv, target_long))
+{
+    TCGv dest = gpr_dst(ctx, a->rd);
+
+    func(ctx, dest, a->si20);
+    return true;
+}
+
+static bool gen_r2_ui12(DisasContext *ctx, arg_fmt_rdrjui12 *a,
+                        void (*func)(TCGv, TCGv, target_long))
+{
+    TCGv dest = gpr_dst(ctx, a->rd);
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
+static bool gen_mulh(DisasContext *ctx, arg_add_w *a,
+                     void(*func)(TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32))
+{
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv_i32 discard = tcg_temp_new_i32();
+    TCGv_i32 t0 = tcg_temp_new_i32();
+    TCGv_i32 t1 = tcg_temp_new_i32();
+
+    tcg_gen_trunc_tl_i32(t0, src1);
+    tcg_gen_trunc_tl_i32(t1, src2);
+    func(discard, t0, t0, t1);
+    tcg_gen_ext_i32_tl(dest, t0);
+
+    tcg_temp_free_i32(discard);
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(t1);
+    return true;
+}
+
+static bool gen_mulh_d(DisasContext *ctx, arg_add_w *a,
+                     void(*func)(TCGv, TCGv, TCGv, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv discard = tcg_temp_new();
+
+    func(discard, dest, src1, src2);
+    tcg_temp_free(discard);
+    return true;
+}
+
+static bool gen_mulw_d(DisasContext *ctx, arg_add_w *a,
+                     void(*func)(TCGv_i64, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+
+    func(src1, src1);
+    func(src2, src2);
+    tcg_gen_mul_i64(dest, src1, src2);
+    return true;
+}
+
+static bool gen_div_w(DisasContext *ctx, arg_fmt_rdrjrk *a,
+                      DisasExtend src_ext, DisasExtend dst_ext,
+                      void(*func)(TCGv, TCGv, TCGv))
+{
+    ctx->dst_ext = dst_ext;
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rj, src_ext);
+    TCGv src2 = gpr_src(ctx, a->rk, src_ext);
+    TCGv t2 = tcg_temp_new();
+    TCGv t3 = tcg_temp_new();
+
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t2, src1, INT_MIN);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t3, src2, -1);
+    tcg_gen_and_tl(t2, t2, t3);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t3, src2, 0);
+    tcg_gen_or_tl(t2, t2, t3);
+    tcg_gen_movi_tl(t3, 0);
+    tcg_gen_movcond_tl(TCG_COND_NE, src2, t2, t3, t2, src2);
+    func(dest, src1, src2);
+
+    if (ctx->dst_ext) {
+        gen_set_gpr(ctx, a->rd, dest);
+    }
+
+    tcg_temp_free(t2);
+    tcg_temp_free(t3);
+    return true;
+}
+
+static bool gen_div_wu(DisasContext *ctx, arg_fmt_rdrjrk *a,
+                       DisasExtend src_ext, DisasExtend dst_ext,
+                       void(*func)(TCGv, TCGv, TCGv))
+{
+    ctx->dst_ext = dst_ext;
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rj, src_ext);
+    TCGv src2 = gpr_src(ctx, a->rk, src_ext);
+    TCGv t2 = tcg_constant_tl(0);
+    TCGv t3 = tcg_constant_tl(1);
+
+    tcg_gen_movcond_tl(TCG_COND_EQ, src1, src1, t2, t3, src1);
+    func(dest, src1, src2);
+
+    if (ctx->dst_ext) {
+        gen_set_gpr(ctx, a->rd, dest);
+    }
+    return true;
+}
+
+static bool gen_div_d(DisasContext *ctx, arg_fmt_rdrjrk *a,
+                      void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv t2 = tcg_temp_new();
+    TCGv t3 = tcg_temp_new();
+
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t2, src1, -1LL << 63);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t3, src2, -1LL);
+    tcg_gen_and_tl(t2, t2, t3);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t3, src2, 0);
+    tcg_gen_or_tl(t2, t2, t3);
+    tcg_gen_movi_tl(t3, 0);
+    tcg_gen_movcond_tl(TCG_COND_NE, src2, t2, t3, t2, src2);
+    func(dest, src1, src2);
+
+    tcg_temp_free(t2);
+    tcg_temp_free(t3);
+
+    return true;
+}
+
+static bool gen_div_du(DisasContext *ctx, arg_fmt_rdrjrk *a,
+                       void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv t2 = tcg_constant_tl(0);
+    TCGv t3 = tcg_constant_tl(1);
+
+    tcg_gen_movcond_tl(TCG_COND_EQ, src2, src2, t2, t3, src2);
+    func(dest, src1, src2);
+
+    return true;
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
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv src2 = tcg_constant_tl(a->si20);
+
+    tcg_gen_deposit_tl(dest, src1, src2, 32, 32);
+    return true;
+}
+
+static bool trans_lu52i_d(DisasContext *ctx, arg_lu52i_d *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = tcg_constant_tl(a->si12);
+
+    tcg_gen_deposit_tl(dest, src1, src2, 52, 12);
+    return true;
+}
+
+static void gen_pcaddi(DisasContext *ctx, TCGv dest, target_long si20)
+{
+    target_ulong addr = ctx->base.pc_next + (si20 << 2);
+    tcg_gen_movi_tl(dest, addr);
+}
+
+static void gen_pcalau12i(DisasContext *ctx, TCGv dest, target_long si20)
+{
+    target_ulong addr = (ctx->base.pc_next + (si20 << 12)) & ~0xfff;
+    tcg_gen_movi_tl(dest, addr);
+}
+
+static void gen_pcaddu12i(DisasContext *ctx, TCGv dest, target_long si20)
+{
+    target_ulong addr = ctx->base.pc_next + (si20 << 12);
+    tcg_gen_movi_tl(dest, addr);
+}
+
+static void gen_pcaddu18i(DisasContext *ctx, TCGv dest, target_long si20)
+{
+    target_ulong addr = ctx->base.pc_next + ((target_ulong)(si20) << 18);
+    tcg_gen_movi_tl(dest, addr);
+}
+
+static bool trans_addu16i_d(DisasContext *ctx, arg_addu16i_d *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd);
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
+TRANS(mulh_w, gen_mulh, tcg_gen_muls2_i32)
+TRANS(mulh_wu, gen_mulh, tcg_gen_mulu2_i32)
+TRANS(mulh_d, gen_mulh_d, tcg_gen_muls2_tl)
+TRANS(mulh_du, gen_mulh_d, tcg_gen_mulu2_tl)
+TRANS(mulw_d_w, gen_mulw_d, tcg_gen_ext32s_tl)
+TRANS(mulw_d_wu, gen_mulw_d, tcg_gen_ext32u_tl)
+TRANS(div_w, gen_div_w, EXT_SIGN, EXT_SIGN, tcg_gen_div_tl)
+TRANS(mod_w, gen_div_w, EXT_SIGN, EXT_SIGN, tcg_gen_rem_tl)
+TRANS(div_wu, gen_div_wu, EXT_ZERO, EXT_SIGN, tcg_gen_divu_tl)
+TRANS(mod_wu, gen_div_wu, EXT_ZERO, EXT_SIGN, tcg_gen_remu_tl)
+TRANS(div_d, gen_div_d, tcg_gen_div_tl)
+TRANS(mod_d, gen_div_d, tcg_gen_rem_tl)
+TRANS(div_du, gen_div_du, tcg_gen_divu_tl)
+TRANS(mod_du, gen_div_du, tcg_gen_remu_tl)
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
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index cfb08df..1052cb6 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -9,7 +9,6 @@
 #ifndef LOONGARCH_INTERNALS_H
 #define LOONGARCH_INTERNALS_H
 
-
 void loongarch_translate_init(void);
 
 void loongarch_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 4769004..e34ab39 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -34,11 +34,6 @@ void generate_exception(DisasContext *ctx, int excp)
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
-{
-    return true;
-}
-
 static inline void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
     if (translator_use_goto_tb(&ctx->base, dest)) {
@@ -63,6 +58,12 @@ static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
     /* Bound the number of insns to execute to those left on the page.  */
     bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
     ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
+
+    ctx->dst_ext = EXT_NONE;
+    ctx->ntemp = 0;
+    memset(ctx->temp, 0, sizeof(ctx->temp));
+
+    ctx->zero = tcg_constant_tl(0);
 }
 
 static void loongarch_tr_tb_start(DisasContextBase *dcbase, CPUState *cs)
@@ -76,6 +77,92 @@ static void loongarch_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
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
+static TCGv gpr_src(DisasContext *ctx, int reg_num, DisasExtend ext)
+{
+    TCGv t;
+
+    if (reg_num == 0) {
+        return ctx->zero;
+    }
+
+    switch (ext) {
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
+static TCGv gpr_dst(DisasContext *ctx, int reg_num)
+{
+    if (reg_num == 0 || ctx->dst_ext) {
+        return temp_new(ctx);
+    }
+    return cpu_gpr[reg_num];
+}
+
+static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
+{
+    if (reg_num != 0) {
+        switch (ctx->dst_ext) {
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
+
+/* fmt rd rj rk */
+static bool gen_r3(DisasContext *ctx, arg_fmt_rdrjrk *a,
+                   DisasExtend src1_ext, DisasExtend src2_ext,
+                   DisasExtend dst_ext, void (*func)(TCGv, TCGv, TCGv))
+{
+    ctx->dst_ext = dst_ext;
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rj, src1_ext);
+    TCGv src2 = gpr_src(ctx, a->rk, src2_ext);
+
+    func(dest, src1, src2);
+
+    if (ctx->dst_ext) {
+        gen_set_gpr(ctx, a->rd, dest);
+    }
+    return true;
+}
+
+#include "insn_trans/trans_arith.c"
+
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     CPULoongArchState *env = cs->env_ptr;
@@ -89,6 +176,14 @@ static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         generate_exception(ctx, EXCP_INE);
     }
 
+    ctx->dst_ext = EXT_NONE;
+
+    for (int i = ctx->ntemp - 1; i >= 0; --i) {
+        tcg_temp_free(ctx->temp[i]);
+        ctx->temp[i] = NULL;
+    }
+    ctx->ntemp = 0;
+
     ctx->base.pc_next += 4;
 }
 
diff --git a/target/loongarch/translate.h b/target/loongarch/translate.h
index dff7d79..f064fdd 100644
--- a/target/loongarch/translate.h
+++ b/target/loongarch/translate.h
@@ -11,11 +11,31 @@
 
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
+    DisasExtend dst_ext;
+    /* Space for 3 operands plus 1 extra for address computation. */
+    TCGv temp[4];
+    uint8_t ntemp;
 } DisasContext;
 
 void generate_exception(DisasContext *ctx, int excp);
-- 
1.8.3.1



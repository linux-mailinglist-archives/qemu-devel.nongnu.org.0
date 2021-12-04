Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7089C4683AF
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 10:39:43 +0100 (CET)
Received: from localhost ([::1]:58666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtRWA-0001uq-IL
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 04:39:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mtRSC-0004lP-6q
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 04:35:36 -0500
Received: from mail.loongson.cn ([114.242.206.163]:39390 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mtRS9-0004Z8-8H
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 04:35:35 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx78r1NKthpt0CAA--.6875S15; 
 Sat, 04 Dec 2021 17:29:43 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 13/26] target/loongarch: Add floating point move
 instruction translation
Date: Sat,  4 Dec 2021 17:29:12 +0800
Message-Id: <1638610165-15036-14-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638610165-15036-1-git-send-email-gaosong@loongson.cn>
References: <1638610165-15036-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9Dx78r1NKthpt0CAA--.6875S15
X-Coremail-Antispam: 1UD129KBjvJXoWxuw1DKr1rGry3XF4fKF4DArb_yoWfXr4Dpr
 4jyryUCr48XF13Z3s7Kw4YgFs8ZFn7Ca4jq3sayr1rAF47XF1DArykJ3y2krWrXws7Xry8
 ZFn8AFyjgFy8XaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
- FMOV.{S/D}
- FSEL
- MOVGR2FR.{W/D}, MOVGR2FRH.W
- MOVFR2GR.{S/D}, MOVFRH2GR.S
- MOVGR2FCSR, MOVFCSR2GR
- MOVFR2CF, MOVCF2FR
- MOVGR2CF, MOVCF2GR

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/fpu_helper.c                |   6 +
 target/loongarch/helper.h                    |   2 +
 target/loongarch/insn_trans/trans_fmov.c.inc | 157 +++++++++++++++++++++++++++
 target/loongarch/insns.decode                |  37 +++++++
 target/loongarch/translate.c                 |   1 +
 5 files changed, 203 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_fmov.c.inc

diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
index deae76c..9f5235c 100644
--- a/target/loongarch/fpu_helper.c
+++ b/target/loongarch/fpu_helper.c
@@ -854,3 +854,9 @@ uint64_t helper_ftint_w_d(CPULoongArchState *env, uint64_t fj)
     update_fcsr0(env, GETPC());
     return fd;
 }
+
+void helper_set_rounding_mode(CPULoongArchState *env, uint32_t fcsr0)
+{
+    set_float_rounding_mode(ieee_rm[(fcsr0 >> FCSR0_RM) & 0x3],
+                            &env->fp_status);
+}
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 1e87494..da1a2bc 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -90,3 +90,5 @@ DEF_HELPER_2(ftint_w_s, i64, env, i64)
 DEF_HELPER_2(ftint_w_d, i64, env, i64)
 DEF_HELPER_2(frint_s, i64, env, i64)
 DEF_HELPER_2(frint_d, i64, env, i64)
+
+DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_RWG, void, env, i32)
diff --git a/target/loongarch/insn_trans/trans_fmov.c.inc b/target/loongarch/insn_trans/trans_fmov.c.inc
new file mode 100644
index 0000000..24753d4
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_fmov.c.inc
@@ -0,0 +1,157 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+static const uint32_t fcsr_mask[4] = {
+    UINT32_MAX, FCSR0_M1, FCSR0_M2, FCSR0_M3
+};
+
+static bool trans_fsel(DisasContext *ctx, arg_fsel *a)
+{
+    TCGv zero = tcg_constant_tl(0);
+    TCGv cond = tcg_temp_new();
+
+    tcg_gen_ld8u_tl(cond, cpu_env, offsetof(CPULoongArchState, cf[a->ca]));
+    tcg_gen_movcond_tl(TCG_COND_EQ, cpu_fpr[a->fd], cond, zero,
+                       cpu_fpr[a->fj], cpu_fpr[a->fk]);
+    tcg_temp_free(cond);
+
+    return true;
+}
+
+static bool gen_f2f(DisasContext *ctx, arg_ff *a,
+                    void (*func)(TCGv, TCGv), bool nanbox)
+{
+    TCGv dest = cpu_fpr[a->fd];
+    TCGv src = cpu_fpr[a->fj];
+
+    func(dest, src);
+    if (nanbox) {
+        gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
+    }
+
+    return true;
+}
+
+static bool gen_r2f(DisasContext *ctx, arg_fr *a,
+                    void (*func)(TCGv, TCGv))
+{
+    TCGv src = gpr_src(ctx, a->rj, EXT_NONE);
+
+    func(cpu_fpr[a->fd], src);
+    return true;
+}
+
+static bool gen_f2r(DisasContext *ctx, arg_rf *a,
+                    void (*func)(TCGv, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+
+    func(dest, cpu_fpr[a->fj]);
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+
+    return true;
+}
+
+static bool trans_movgr2fcsr(DisasContext *ctx, arg_movgr2fcsr *a)
+{
+    uint32_t mask = fcsr_mask[a->fcsrd];
+    TCGv Rj = gpr_src(ctx, a->rj, EXT_NONE);
+
+    if (mask == UINT32_MAX) {
+        tcg_gen_extrl_i64_i32(cpu_fcsr0, Rj);
+    } else {
+        TCGv_i32 temp = tcg_temp_new_i32();
+
+        tcg_gen_extrl_i64_i32(temp, Rj);
+        tcg_gen_andi_i32(temp, temp, mask);
+        tcg_gen_andi_i32(cpu_fcsr0, cpu_fcsr0, ~mask);
+        tcg_gen_or_i32(cpu_fcsr0, cpu_fcsr0, temp);
+        tcg_temp_free_i32(temp);
+
+        /*
+         * Install the new rounding mode to fpu_status, if changed.
+         * Note that FCSR3 is exactly the rounding mode field.
+         */
+        if (mask != FCSR0_M3) {
+            return true;
+        }
+    }
+    gen_helper_set_rounding_mode(cpu_env, cpu_fcsr0);
+
+    return true;
+}
+
+static bool trans_movfcsr2gr(DisasContext *ctx, arg_movfcsr2gr *a)
+{
+    TCGv_i32 temp = tcg_temp_new_i32();
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+
+    tcg_gen_andi_i32(temp, cpu_fcsr0, fcsr_mask[a->fcsrs]);
+    tcg_gen_ext_i32_i64(dest, temp);
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+    tcg_temp_free_i32(temp);
+
+    return true;
+}
+
+static void gen_movgr2fr_w(TCGv dest, TCGv src)
+{
+    tcg_gen_deposit_i64(dest, dest, src, 0, 32);
+}
+
+static void gen_movgr2frh_w(TCGv dest, TCGv src)
+{
+    tcg_gen_deposit_i64(dest, dest, src, 32, 32);
+}
+
+static void gen_movfrh2gr_s(TCGv dest, TCGv src)
+{
+    tcg_gen_sextract_tl(dest, src, 32, 32);
+}
+
+static bool trans_movfr2cf(DisasContext *ctx, arg_movfr2cf *a)
+{
+    TCGv t0 = tcg_temp_new();
+
+    tcg_gen_andi_tl(t0, cpu_fpr[a->fj], 0x1);
+    tcg_gen_st8_tl(t0, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7]));
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_movcf2fr(DisasContext *ctx, arg_movcf2fr *a)
+{
+    tcg_gen_ld8u_tl(cpu_fpr[a->fd], cpu_env,
+                    offsetof(CPULoongArchState, cf[a->cj & 0x7]));
+    return true;
+}
+
+static bool trans_movgr2cf(DisasContext *ctx, arg_movgr2cf *a)
+{
+    TCGv t0 = tcg_temp_new();
+
+    tcg_gen_andi_tl(t0, gpr_src(ctx, a->rj, EXT_NONE), 0x1);
+    tcg_gen_st8_tl(t0, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7]));
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_movcf2gr(DisasContext *ctx, arg_movcf2gr *a)
+{
+    tcg_gen_ld8u_tl(gpr_dst(ctx, a->rd, EXT_NONE), cpu_env,
+                    offsetof(CPULoongArchState, cf[a->cj & 0x7]));
+    return true;
+}
+
+TRANS(fmov_s, gen_f2f, tcg_gen_mov_tl, true)
+TRANS(fmov_d, gen_f2f, tcg_gen_mov_tl, false)
+TRANS(movgr2fr_w, gen_r2f, gen_movgr2fr_w)
+TRANS(movgr2fr_d, gen_r2f, tcg_gen_mov_tl)
+TRANS(movgr2frh_w, gen_r2f, gen_movgr2frh_w)
+TRANS(movfr2gr_s, gen_f2r, tcg_gen_ext32s_tl)
+TRANS(movfr2gr_d, gen_f2r, tcg_gen_mov_tl)
+TRANS(movfrh2gr_s, gen_f2r, gen_movfrh2gr_s)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 3e74511..e9d9a74 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -27,6 +27,15 @@
 &fff          fd fj fk
 &ffff         fd fj fk fa
 &cff_fcond    cd fj fk fcond
+&fffc         fd fj fk ca
+&fr           fd rj
+&rf           rd fj
+&fcsrd_r      fcsrd rj
+&r_fcsrs      rd fcsrs
+&cf           cd fj
+&fc           fd cj
+&cr           cd rj
+&rc           rd cj
 
 #
 # Formats
@@ -52,6 +61,15 @@
 @fff               .... ........ ..... fk:5 fj:5 fd:5    &fff
 @ffff               .... ........ fa:5 fk:5 fj:5 fd:5    &ffff
 @cff_fcond    .... ........ fcond:5 fk:5 fj:5 .. cd:3    &cff_fcond
+@fffc            .... ........ .. ca:3 fk:5 fj:5 fd:5    &fffc
+@fr               .... ........ ..... ..... rj:5 fd:5    &fr
+@rf               .... ........ ..... ..... fj:5 rd:5    &rf
+@fcsrd_r       .... ........ ..... ..... rj:5 fcsrd:5    &fcsrd_r
+@r_fcsrs       .... ........ ..... ..... fcsrs:5 rd:5    &r_fcsrs
+@cf            .... ........ ..... ..... fj:5 .. cd:3    &cf
+@fc            .... ........ ..... ..... .. cj:3 fd:5    &fc
+@cr            .... ........ ..... ..... rj:5 .. cd:3    &cr
+@rc            .... ........ ..... ..... .. cj:3 rd:5    &rc
 
 #
 # Fixed point arithmetic operation instruction
@@ -351,3 +369,22 @@ ffint_d_w       0000 00010001 11010 01000 ..... .....    @ff
 ffint_d_l       0000 00010001 11010 01010 ..... .....    @ff
 frint_s         0000 00010001 11100 10001 ..... .....    @ff
 frint_d         0000 00010001 11100 10010 ..... .....    @ff
+
+#
+# Floating point move instruction
+#
+fmov_s          0000 00010001 01001 00101 ..... .....    @ff
+fmov_d          0000 00010001 01001 00110 ..... .....    @ff
+fsel            0000 11010000 00 ... ..... ..... .....   @fffc
+movgr2fr_w      0000 00010001 01001 01001 ..... .....    @fr
+movgr2fr_d      0000 00010001 01001 01010 ..... .....    @fr
+movgr2frh_w     0000 00010001 01001 01011 ..... .....    @fr
+movfr2gr_s      0000 00010001 01001 01101 ..... .....    @rf
+movfr2gr_d      0000 00010001 01001 01110 ..... .....    @rf
+movfrh2gr_s     0000 00010001 01001 01111 ..... .....    @rf
+movgr2fcsr      0000 00010001 01001 10000 ..... .....    @fcsrd_r
+movfcsr2gr      0000 00010001 01001 10010 ..... .....    @r_fcsrs
+movfr2cf        0000 00010001 01001 10100 ..... 00 ...   @cf
+movcf2fr        0000 00010001 01001 10101 00 ... .....   @fc
+movgr2cf        0000 00010001 01001 10110 ..... 00 ...   @cr
+movcf2gr        0000 00010001 01001 10111 00 ... .....   @rc
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index d865f9e..b9cfce5 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -169,6 +169,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_farith.c.inc"
 #include "insn_trans/trans_fcmp.c.inc"
 #include "insn_trans/trans_fcnv.c.inc"
+#include "insn_trans/trans_fmov.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
1.8.3.1



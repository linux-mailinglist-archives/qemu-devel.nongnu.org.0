Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A3140AED9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:23:59 +0200 (CEST)
Received: from localhost ([::1]:54242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8Pm-0006ca-40
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mQ844-0005xF-O9
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:01:32 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57808 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mQ83y-0007wt-6l
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:01:32 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxheXvnEBhNJ0GAA--.21668S15; 
 Tue, 14 Sep 2021 21:01:10 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/21] target/loongarch: Add floating point move
 instruction translation
Date: Tue, 14 Sep 2021 21:00:23 +0800
Message-Id: <1631624431-30658-14-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
References: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxheXvnEBhNJ0GAA--.21668S15
X-Coremail-Antispam: 1UD129KBjvJXoWxuw1Dtw43ury5trW5tw1DWrg_yoWfZFWfpr
 12kryUCr48JFy3JF97K3yYgF45Jr1xCa4jq3yayry8AF1UJF1UAF1kJ3y2krW5Wwn3uFyU
 JF4YyFyUKFyUXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, peterx@redhat.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 maobibo@loongson.cn, pbonzini@redhat.com, bmeng.cn@gmail.com,
 alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implement floationg point move instruction translation.

This includes:
- FMOV.{S/D}
- FSEL
- MOVGR2FR.{W/D}, MOVGR2FRH.W
- MOVFR2GR.{S/D}, MOVFRH2GR.S
- MOVGR2FCSR, MOVFCSR2GR
- MOVFR2CF, MOVCF2FR
- MOVGR2CF, MOVCF2GR

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: XiaoJuan Yang <yangxiaojuan@loongson.cn>
---
 target/loongarch/fpu_helper.c            |   6 ++
 target/loongarch/helper.h                |   2 +
 target/loongarch/insn_trans/trans_fmov.c | 153 +++++++++++++++++++++++++++++++
 target/loongarch/insns.decode            |  41 +++++++++
 target/loongarch/translate.c             |   1 +
 5 files changed, 203 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_fmov.c

diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
index 7944ced..52844f6 100644
--- a/target/loongarch/fpu_helper.c
+++ b/target/loongarch/fpu_helper.c
@@ -816,3 +816,9 @@ uint64_t helper_ftint_w_d(CPULoongArchState *env, uint64_t fj)
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
index 84c02d8..ed215cb 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -89,3 +89,5 @@ DEF_HELPER_2(ftint_w_s, i64, env, i64)
 DEF_HELPER_2(ftint_w_d, i64, env, i64)
 DEF_HELPER_2(frint_s, i64, env, i64)
 DEF_HELPER_2(frint_d, i64, env, i64)
+
+DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_RWG, void, env, i32)
diff --git a/target/loongarch/insn_trans/trans_fmov.c b/target/loongarch/insn_trans/trans_fmov.c
new file mode 100644
index 0000000..0024c0d
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_fmov.c
@@ -0,0 +1,153 @@
+/*
+ * LoongArch translate functions
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
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
+    return true;
+}
+
+static bool gen_f2f(DisasContext *ctx, arg_fmt_fdfj *a,
+                    void (*func)(TCGv, TCGv), bool nanbox)
+{
+    TCGv dest = cpu_fpr[a->fd];
+    TCGv src = cpu_fpr[a->fj];
+
+    func(dest, src);
+    if (nanbox) {
+        gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
+    }
+    return true;
+}
+
+static bool gen_r2f(DisasContext *ctx, arg_fmt_fdrj *a,
+                    void (*func)(TCGv, TCGv))
+{
+    TCGv src = gpr_src(ctx, a->rj, EXT_NONE);
+
+    func(cpu_fpr[a->fd], src);
+    return true;
+}
+
+static bool gen_f2r(DisasContext *ctx, arg_fmt_rdfj *a,
+                    void (*func)(TCGv, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+
+    func(dest, cpu_fpr[a->fj]);
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
+    tcg_temp_free_i32(temp);
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
+
+    tcg_temp_free(t0);
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
+
+    tcg_temp_free(t0);
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
index c6fd762..febf89a 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -34,6 +34,10 @@
 %fa      15:5
 %cd      0:3
 %fcond   15:5
+%cj      5:3
+%ca      15:3
+%fcsrd   0:5
+%fcsrs   5:5
 
 #
 # Argument sets
@@ -59,6 +63,15 @@
 &fmt_fdfjfkfa       fd fj fk fa
 &fmt_fdfj           fd fj
 &fmt_cdfjfkfcond    cd fj fk fcond
+&fmt_fdfjfkca       fd fj fk ca
+&fmt_fdrj           fd rj
+&fmt_rdfj           rd fj
+&fmt_fcsrdrj        fcsrd rj
+&fmt_rdfcsrs        rd fcsrs
+&fmt_cdfj           cd fj
+&fmt_fdcj           fd cj
+&fmt_cdrj           cd rj
+&fmt_rdcj           rd cj
 
 #
 # Formats
@@ -84,6 +97,15 @@
 @fmt_fdfjfkfa        .... ........ ..... ..... ..... .....    &fmt_fdfjfkfa       %fd %fj %fk %fa
 @fmt_fdfj            .... ........ ..... ..... ..... .....    &fmt_fdfj           %fd %fj
 @fmt_cdfjfkfcond     .... ........ ..... ..... ..... .. ...   &fmt_cdfjfkfcond    %cd %fj %fk %fcond
+@fmt_fdfjfkca        .... ........ .. ... ..... ..... .....   &fmt_fdfjfkca       %fd %fj %fk %ca
+@fmt_fdrj            .... ........ ..... ..... ..... .....    &fmt_fdrj           %fd %rj
+@fmt_rdfj            .... ........ ..... ..... ..... .....    &fmt_rdfj           %rd %fj
+@fmt_fcsrdrj         .... ........ ..... ..... ..... .....    &fmt_fcsrdrj        %fcsrd %rj
+@fmt_rdfcsrs         .... ........ ..... ..... ..... .....    &fmt_rdfcsrs        %rd %fcsrs
+@fmt_cdfj            .... ........ ..... ..... ..... .. ...   &fmt_cdfj           %cd %fj
+@fmt_fdcj            .... ........ ..... ..... .. ... .....   &fmt_fdcj           %fd %cj
+@fmt_cdrj            .... ........ ..... ..... ..... .. ...   &fmt_cdrj           %cd %rj
+@fmt_rdcj            .... ........ ..... ..... .. ... .....   &fmt_rdcj           %rd %cj
 
 #
 # Fixed point arithmetic operation instruction
@@ -383,3 +405,22 @@ ffint_d_w        0000 00010001 11010 01000 ..... .....    @fmt_fdfj
 ffint_d_l        0000 00010001 11010 01010 ..... .....    @fmt_fdfj
 frint_s          0000 00010001 11100 10001 ..... .....    @fmt_fdfj
 frint_d          0000 00010001 11100 10010 ..... .....    @fmt_fdfj
+
+#
+# Floating point move instruction
+#
+fmov_s           0000 00010001 01001 00101 ..... .....    @fmt_fdfj
+fmov_d           0000 00010001 01001 00110 ..... .....    @fmt_fdfj
+fsel             0000 11010000 00 ... ..... ..... .....   @fmt_fdfjfkca
+movgr2fr_w       0000 00010001 01001 01001 ..... .....    @fmt_fdrj
+movgr2fr_d       0000 00010001 01001 01010 ..... .....    @fmt_fdrj
+movgr2frh_w      0000 00010001 01001 01011 ..... .....    @fmt_fdrj
+movfr2gr_s       0000 00010001 01001 01101 ..... .....    @fmt_rdfj
+movfr2gr_d       0000 00010001 01001 01110 ..... .....    @fmt_rdfj
+movfrh2gr_s      0000 00010001 01001 01111 ..... .....    @fmt_rdfj
+movgr2fcsr       0000 00010001 01001 10000 ..... .....    @fmt_fcsrdrj
+movfcsr2gr       0000 00010001 01001 10010 ..... .....    @fmt_rdfcsrs
+movfr2cf         0000 00010001 01001 10100 ..... 00 ...   @fmt_cdfj
+movcf2fr         0000 00010001 01001 10101 00 ... .....   @fmt_fdcj
+movgr2cf         0000 00010001 01001 10110 ..... 00 ...   @fmt_cdrj
+movcf2gr         0000 00010001 01001 10111 00 ... .....   @fmt_rdcj
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 16275fb..c57c8ee 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -189,6 +189,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_farith.c"
 #include "insn_trans/trans_fcmp.c"
 #include "insn_trans/trans_fcnv.c"
+#include "insn_trans/trans_fmov.c"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
1.8.3.1



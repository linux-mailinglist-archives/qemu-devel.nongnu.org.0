Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494223B5DE9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:21:59 +0200 (CEST)
Received: from localhost ([::1]:42056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqH0-0006P4-AO
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lxq0x-0002lp-Mw
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:05:24 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45626 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lxq0s-0001Er-Ck
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:05:23 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0LdutlgOrYZAA--.8747S18; 
 Mon, 28 Jun 2021 20:05:03 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/20] target/loongarch: Add floating point move instruction
 translation
Date: Mon, 28 Jun 2021 20:04:41 +0800
Message-Id: <1624881885-31692-17-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0LdutlgOrYZAA--.8747S18
X-Coremail-Antispam: 1UD129KBjvAXoW3tF4Dtw43JFW8Gr45Cw48WFg_yoW8Jw1xGo
 WUAa45AF48Gw13WrnI9ws8X3y2qr1UCFs7Jr9Y9a4kWFs7Gr47KF1UW3Z5Aa1fXrWvgrW5
 JFyaqFn3tw43Gr95n29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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
---
 target/loongarch/fpu_helper.c |  80 ++++++++++++++++++++++
 target/loongarch/helper.h     |   6 ++
 target/loongarch/insns.decode |  41 +++++++++++
 target/loongarch/instmap.h    |   6 ++
 target/loongarch/trans.inc.c  | 154 ++++++++++++++++++++++++++++++++++++++++++
 target/loongarch/translate.c  |  60 ++++++++++++++++
 6 files changed, 347 insertions(+)

diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
index e72fbc4..ddeae72 100644
--- a/target/loongarch/fpu_helper.c
+++ b/target/loongarch/fpu_helper.c
@@ -380,6 +380,11 @@ uint64_t helper_fp_logb_d(CPULoongArchState *env, uint64_t fp)
     return fp1;
 }
 
+void helper_movreg2cf(CPULoongArchState *env, uint32_t cd, target_ulong src)
+{
+    env->active_fpu.cf[cd & 0x7] = src & 0x1;
+}
+
 void helper_movreg2cf_i32(CPULoongArchState *env, uint32_t cd, uint32_t src)
 {
     env->active_fpu.cf[cd & 0x7] = src & 0x1;
@@ -1354,3 +1359,78 @@ uint64_t helper_fp_rint_d(CPULoongArchState *env, uint64_t src)
     update_fcsr0(env, GETPC());
     return dest;
 }
+
+target_ulong helper_fsel(CPULoongArchState *env, target_ulong fj,
+                         target_ulong fk, uint32_t ca)
+{
+    if (env->active_fpu.cf[ca & 0x7]) {
+        return fk;
+    } else {
+        return fj;
+    }
+}
+
+void helper_movgr2fcsr(CPULoongArchState *env, target_ulong arg1,
+                       uint32_t fcsr)
+{
+    switch (fcsr) {
+    case 0:
+        env->active_fpu.fcsr0 = arg1;
+        break;
+    case 1:
+        env->active_fpu.fcsr0 = (arg1 & FCSR0_M1) |
+                                (env->active_fpu.fcsr0 & ~FCSR0_M1);
+        break;
+    case 2:
+        env->active_fpu.fcsr0 = (arg1 & FCSR0_M2) |
+                                (env->active_fpu.fcsr0 & ~FCSR0_M2);
+        break;
+    case 3:
+        env->active_fpu.fcsr0 = (arg1 & FCSR0_M3) |
+                                (env->active_fpu.fcsr0 & ~FCSR0_M3);
+        break;
+    case 16:
+        env->active_fpu.vcsr16 = arg1;
+        break;
+    default:
+        printf("%s: warning, fcsr '%d' not supported\n", __func__, fcsr);
+        assert(0);
+        break;
+    }
+    restore_fp_status(env);
+    set_float_exception_flags(0, &env->active_fpu.fp_status);
+}
+
+target_ulong helper_movfcsr2gr(CPULoongArchState *env, uint32_t reg)
+{
+    target_ulong r = 0;
+
+    switch (reg) {
+    case 0:
+        r = (uint32_t)env->active_fpu.fcsr0;
+        break;
+    case 1:
+        r = (env->active_fpu.fcsr0 & FCSR0_M1);
+        break;
+    case 2:
+        r = (env->active_fpu.fcsr0 & FCSR0_M2);
+        break;
+    case 3:
+        r = (env->active_fpu.fcsr0 & FCSR0_M3);
+        break;
+    case 16:
+        r = (uint32_t)env->active_fpu.vcsr16;
+        break;
+    default:
+        printf("%s: warning, fcsr '%d' not supported\n", __func__, reg);
+        assert(0);
+        break;
+    }
+
+    return r;
+}
+
+target_ulong helper_movcf2reg(CPULoongArchState *env, uint32_t cj)
+{
+    return (target_ulong)env->active_fpu.cf[cj & 0x7];
+}
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 9ec2b53..eedf174 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -150,3 +150,9 @@ DEF_HELPER_2(fp_tint_l_s, i64, env, i32)
 DEF_HELPER_2(fp_tint_l_d, i64, env, i64)
 DEF_HELPER_2(fp_tint_w_s, i32, env, i32)
 DEF_HELPER_2(fp_tint_w_d, i32, env, i64)
+
+DEF_HELPER_4(fsel, i64, env, i64, i64, i32)
+DEF_HELPER_3(movreg2cf, void, env, i32, tl)
+DEF_HELPER_2(movcf2reg, tl, env, i32)
+DEF_HELPER_2(movfcsr2gr, tl, env, i32)
+DEF_HELPER_3(movgr2fcsr, void, env, tl, i32)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 86ba7ea..a9d8530 100644
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
@@ -60,6 +64,15 @@
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
@@ -86,6 +99,15 @@
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
@@ -386,3 +408,22 @@ ffint_d_w        0000 00010001 11010 01000 ..... .....    @fmt_fdfj
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
diff --git a/target/loongarch/instmap.h b/target/loongarch/instmap.h
index 2f231c2..c031ec5 100644
--- a/target/loongarch/instmap.h
+++ b/target/loongarch/instmap.h
@@ -81,6 +81,12 @@ enum {
     LA_OPC_FRECIP_D  = (0x004516 << 10),
     LA_OPC_FRSQRT_S  = (0x004519 << 10),
     LA_OPC_FRSQRT_D  = (0x00451A << 10),
+    LA_OPC_GR2FR_W   = (0x004529 << 10),
+    LA_OPC_GR2FR_D   = (0x00452A << 10),
+    LA_OPC_GR2FRH_W  = (0x00452B << 10),
+    LA_OPC_FR2GR_S   = (0x00452D << 10),
+    LA_OPC_FR2GR_D   = (0x00452E << 10),
+    LA_OPC_FRH2GR_S  = (0x00452F << 10),
     LA_OPC_FCVT_S_D      = (0x004646 << 10),
     LA_OPC_FCVT_D_S      = (0x004649 << 10),
     LA_OPC_FTINTRM_W_S   = (0x004681 << 10),
diff --git a/target/loongarch/trans.inc.c b/target/loongarch/trans.inc.c
index 095e9d2..110b724 100644
--- a/target/loongarch/trans.inc.c
+++ b/target/loongarch/trans.inc.c
@@ -2055,3 +2055,157 @@ static bool trans_frint_d(DisasContext *ctx, arg_frint_d *a)
     gen_loongarch_fp_conv(ctx, LA_OPC_FRINT_D, a->fj, a->fd);
     return true;
 }
+
+/* Floating point move instruction translation */
+static bool trans_fmov_s(DisasContext *ctx, arg_fmov_s *a)
+{
+    TCGv_i32 fp0 = tcg_temp_new_i32();
+    gen_load_fpr32(ctx, fp0, a->fj);
+    gen_store_fpr32(ctx, fp0, a->fd);
+    tcg_temp_free_i32(fp0);
+    return true;
+}
+
+static bool trans_fmov_d(DisasContext *ctx, arg_fmov_d *a)
+{
+    TCGv_i64 fp0 = tcg_temp_new_i64();
+    gen_load_fpr64(ctx, fp0, a->fj);
+    gen_store_fpr64(ctx, fp0, a->fd);
+    tcg_temp_free_i64(fp0);
+    return true;
+}
+
+static bool trans_fsel(DisasContext *ctx, arg_fsel *a)
+{
+    TCGv_i64 fj = tcg_temp_new_i64();
+    TCGv_i64 fk = tcg_temp_new_i64();
+    TCGv_i64 fd = tcg_temp_new_i64();
+    TCGv_i32 ca = tcg_const_i32(a->ca);
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(ctx, fj, a->fj);
+    gen_load_fpr64(ctx, fk, a->fk);
+    gen_helper_fsel(fd, cpu_env, fj, fk, ca);
+    gen_store_fpr64(ctx, fd, a->fd);
+    tcg_temp_free_i64(fj);
+    tcg_temp_free_i64(fk);
+    tcg_temp_free_i64(fd);
+    tcg_temp_free_i32(ca);
+    return true;
+}
+
+static bool trans_movgr2fr_w(DisasContext *ctx, arg_movgr2fr_w *a)
+{
+    gen_loongarch_fp_mov(ctx, LA_OPC_GR2FR_W, a->rj, a->fd);
+    return true;
+}
+
+static bool trans_movgr2fr_d(DisasContext *ctx, arg_movgr2fr_d *a)
+{
+    gen_loongarch_fp_mov(ctx, LA_OPC_GR2FR_D, a->rj, a->fd);
+    return true;
+}
+
+static bool trans_movgr2frh_w(DisasContext *ctx, arg_movgr2frh_w *a)
+{
+    gen_loongarch_fp_mov(ctx, LA_OPC_GR2FRH_W, a->rj, a->fd);
+    return true;
+}
+
+static bool trans_movfr2gr_s(DisasContext *ctx, arg_movfr2gr_s *a)
+{
+    gen_loongarch_fp_mov(ctx, LA_OPC_FR2GR_S, a->fj, a->rd);
+    return true;
+}
+
+static bool trans_movfr2gr_d(DisasContext *ctx, arg_movfr2gr_d *a)
+{
+    gen_loongarch_fp_mov(ctx, LA_OPC_FR2GR_D, a->fj, a->rd);
+    return true;
+}
+
+static bool trans_movfrh2gr_s(DisasContext *ctx, arg_movfrh2gr_s *a)
+{
+    gen_loongarch_fp_mov(ctx, LA_OPC_FRH2GR_S, a->fj, a->rd);
+    return true;
+}
+
+static bool trans_movgr2fcsr(DisasContext *ctx, arg_movgr2fcsr *a)
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv_i32 fs_tmp = tcg_const_i32(a->fcsrd);
+
+    check_fpu_enabled(ctx);
+    gen_load_gpr(t0, a->rj);
+    save_cpu_state(ctx, 0);
+    gen_helper_movgr2fcsr(cpu_env, t0, fs_tmp);
+    /* Stop translation as we may have changed hflags */
+    ctx->base.is_jmp = DISAS_STOP;
+
+    tcg_temp_free(t0);
+    tcg_temp_free_i32(fs_tmp);
+    return true;
+}
+
+static bool trans_movfcsr2gr(DisasContext *ctx, arg_movfcsr2gr *a)
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv_i32 reg = tcg_const_i32(a->fcsrs);
+    gen_helper_movfcsr2gr(t0, cpu_env, reg);
+    gen_store_gpr(t0, a->rd);
+    tcg_temp_free(t0);
+    tcg_temp_free_i32(reg);
+    return true;
+}
+
+static bool trans_movfr2cf(DisasContext *ctx, arg_movfr2cf *a)
+{
+    TCGv_i64 fp0 = tcg_temp_new_i64();
+    TCGv_i32 cd  = tcg_const_i32(a->cd);
+
+    check_fpu_enabled(ctx);
+    gen_load_fpr64(ctx, fp0, a->fj);
+    gen_helper_movreg2cf(cpu_env, cd, fp0);
+
+    tcg_temp_free_i64(fp0);
+    tcg_temp_free_i32(cd);
+    return true;
+}
+
+static bool trans_movcf2fr(DisasContext *ctx, arg_movcf2fr *a)
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv_i32 cj = tcg_const_i32(a->cj);
+
+    check_fpu_enabled(ctx);
+    gen_helper_movcf2reg(t0, cpu_env, cj);
+    gen_store_fpr64(ctx, t0, a->fd);
+
+    tcg_temp_free(t0);
+    tcg_temp_free_i32(cj);
+    return true;
+}
+
+static bool trans_movgr2cf(DisasContext *ctx, arg_movgr2cf *a)
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv_i32 cd = tcg_const_i32(a->cd);
+
+    check_fpu_enabled(ctx);
+    gen_load_gpr(t0, a->rj);
+    gen_helper_movreg2cf(cpu_env, cd, t0);
+
+    tcg_temp_free(t0);
+    tcg_temp_free_i32(cd);
+    return true;
+}
+
+static bool trans_movcf2gr(DisasContext *ctx, arg_movcf2gr *a)
+{
+    TCGv_i32 cj = tcg_const_i32(a->cj);
+
+    check_fpu_enabled(ctx);
+    gen_helper_movcf2reg(cpu_gpr[a->rd], cpu_env, cj);
+
+    tcg_temp_free_i32(cj);
+    return true;
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 52faf73..4efcaa6 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -2087,6 +2087,66 @@ static void gen_loongarch_fp_conv(DisasContext *ctx, uint32_t opc,
     }
 }
 
+/* floating point move */
+static void gen_loongarch_fp_mov(DisasContext *ctx, uint32_t opc,
+                                 int src, int dest)
+{
+    TCGv t0 = tcg_temp_new();
+    check_fpu_enabled(ctx);
+    switch (opc) {
+    case LA_OPC_GR2FR_W:
+        {
+            gen_load_gpr(t0, src);
+            TCGv_i32 fp0 = tcg_temp_new_i32();
+            tcg_gen_trunc_tl_i32(fp0, t0);
+            gen_store_fpr32(ctx, fp0, dest);
+            tcg_temp_free_i32(fp0);
+        }
+        break;
+    case LA_OPC_GR2FR_D:
+        gen_load_gpr(t0, src);
+        gen_store_fpr64(ctx, t0, dest);
+        break;
+    case LA_OPC_GR2FRH_W:
+        {
+            gen_load_gpr(t0, src);
+            TCGv_i32 fp0 = tcg_temp_new_i32();
+            tcg_gen_trunc_tl_i32(fp0, t0);
+            gen_store_fpr32h(ctx, fp0, dest);
+            tcg_temp_free_i32(fp0);
+        }
+        break;
+    case LA_OPC_FR2GR_D:
+        gen_load_fpr64(ctx, t0, src);
+        gen_store_gpr(t0, dest);
+        break;
+    case LA_OPC_FRH2GR_S:
+        {
+            TCGv_i32 fp0 = tcg_temp_new_i32();
+            gen_load_fpr32h(ctx, fp0, src);
+            tcg_gen_ext_i32_tl(t0, fp0);
+            tcg_temp_free_i32(fp0);
+            gen_store_gpr(t0, dest);
+        }
+        break;
+    case LA_OPC_FR2GR_S:
+        {
+            TCGv_i32 fp0 = tcg_temp_new_i32();
+            gen_load_fpr32(ctx, fp0, src);
+            tcg_gen_ext_i32_tl(t0, fp0);
+            tcg_temp_free_i32(fp0);
+            gen_store_gpr(t0, dest);
+        }
+        break;
+    default:
+        generate_exception_end(ctx, EXCP_INE);
+        goto out;
+    }
+
+ out:
+    tcg_temp_free(t0);
+}
+
 static void loongarch_tr_tb_start(DisasContextBase *dcbase, CPUState *cs)
 {
 }
-- 
1.8.3.1



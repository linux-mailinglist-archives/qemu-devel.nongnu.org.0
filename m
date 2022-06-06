Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83D153F29E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:37:18 +0200 (CEST)
Received: from localhost ([::1]:41114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMHd-00063D-P2
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwC-0001ay-0Y
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:08 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:37418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLw9-0003wa-RT
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:07 -0400
Received: by mail-pf1-x430.google.com with SMTP id bo5so13936270pfb.4
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4TbLPPSXuTYMwKEYxg6YFxpwEum8Rx1CNExNPpSuXfc=;
 b=ePRF/5MbaGtG+w0BbChPapLp5PnMfgj4Aylp6QgWvyOtkVU6rks7GhjKGzggt5Jg80
 EC73y4YEY3LixdHK1HHeTWH+F71BOh9AJm/FlMq+wMv37bdSA+B8Lr7fJMW5mHhSVd1B
 kRtVugVz1hOFdky1tIjUVShyIXyqHnBqD9udZIQWQb0PU9NS3JTYiZbZjXTW+3vlpwCB
 74kAdEVeAdub6j/YNecGrdyT8UK+g+fvH2u+UqQ3KjrNCcJ6tqjyEPrcDZhVPPS4KF9V
 qkG7spAGKH9WcqdSuDAV88trlw1scCPWOu7rAb/mi4212bcO4IwbvIW6r2V3Wnk/DsQJ
 oEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4TbLPPSXuTYMwKEYxg6YFxpwEum8Rx1CNExNPpSuXfc=;
 b=5heuA2n31V4vXy/SYGvp/aakXDsvqC1eavVbd2t3kBXuiXnZAYhbzX/Ro14Yurd/Hh
 nxSz1UoBj+78UkeIkKjRIqSZAqZSyfG0KiTq1C8zIAHw32jpf32qocq6zysR5VWVQ+DZ
 BLyp5VJBtxk/hBtfjpLFstUoGBxAC2xw2JFpwgTrnSF2zrXij0S5T1FXla1KVQtsXcE8
 2AuW+RZ412yLf70RzuhXKJSuFSJ0+nCnD3KCU5yL5ZjCuPwsNzqdivUFjLu62YzcUBmL
 RbKP/SMBS4kO1gPbg6ktAFqn1uJQDuE8tu7lywRkcJB0M+Ox9eySB0NQjk7ehcl4BCn8
 Bx5Q==
X-Gm-Message-State: AOAM5307vWZHutdo0XZVUGjJ1zfRczQngmb/TbsRhIq1I2BWEDcdO5Wv
 8yNGfO36H7Xz+60TlAmbqSkd1GS8M6vL6w==
X-Google-Smtp-Source: ABdhPJz59Ub7nuyKeOACwDeKF7BqdM5v1MwpDpHe6I6hQIE1MjD6ecJewkWGTp6Ee3K9Hrxoqx++jQ==
X-Received: by 2002:a63:5760:0:b0:3fc:4001:a2f2 with SMTP id
 h32-20020a635760000000b003fc4001a2f2mr22943365pgm.34.1654557304380; 
 Mon, 06 Jun 2022 16:15:04 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 13/43] target/loongarch: Add floating point move instruction
 translation
Date: Mon,  6 Jun 2022 16:14:20 -0700
Message-Id: <20220606231450.448443-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Song Gao <gaosong@loongson.cn>

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
Message-Id: <20220606124333.2060567-14-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/helper.h                    |   2 +
 target/loongarch/insns.decode                |  37 +++++
 target/loongarch/fpu_helper.c                |   6 +
 target/loongarch/translate.c                 |   1 +
 target/loongarch/insn_trans/trans_fmov.c.inc | 157 +++++++++++++++++++
 5 files changed, 203 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_fmov.c.inc

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 1e8749433a..da1a2bced7 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -90,3 +90,5 @@ DEF_HELPER_2(ftint_w_s, i64, env, i64)
 DEF_HELPER_2(ftint_w_d, i64, env, i64)
 DEF_HELPER_2(frint_s, i64, env, i64)
 DEF_HELPER_2(frint_d, i64, env, i64)
+
+DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_RWG, void, env, i32)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index b9f135d36f..c62a4f6dcd 100644
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
@@ -348,3 +366,22 @@ ffint_d_w       0000 00010001 11010 01000 ..... .....    @ff
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
diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
index 81466678eb..3d0cb8dd0d 100644
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
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 26ef1e366c..26d60b50fd 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -169,6 +169,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_farith.c.inc"
 #include "insn_trans/trans_fcmp.c.inc"
 #include "insn_trans/trans_fcnv.c.inc"
+#include "insn_trans/trans_fmov.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
diff --git a/target/loongarch/insn_trans/trans_fmov.c.inc b/target/loongarch/insn_trans/trans_fmov.c.inc
new file mode 100644
index 0000000000..24753d4568
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
-- 
2.34.1



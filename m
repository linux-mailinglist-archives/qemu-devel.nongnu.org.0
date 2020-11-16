Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99372B4AEF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:25:16 +0100 (CET)
Received: from localhost ([::1]:36380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehJb-0006tU-SD
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:25:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3c-0008QM-Qc
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:45 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:32950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3Y-0007oh-12
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:44 -0500
Received: by mail-wr1-x42b.google.com with SMTP id u12so12052157wrt.0
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 08:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=c5PknhEJpy0KAKZXEsCLw8GRPgWwprA9K/tNJNWAjsI=;
 b=psp3789X80MaTvpicYIfMY+DTGKETpjT6B19gLWo47Q3Y53NpPLCIvCa/abnN6hQHa
 7fmaKpMbXljlETVfwZ4PTev9v0MEopuU1rmZROT3drUVh+5ma3EjiOIsEKnfPUvnH3Iv
 OQtdIuDYPQvrFmbpV2wkuhPPJEn2NBFAixFrKDZbra+uN/fmIsnLO+KcXV1iVi4OPl6M
 VbwsXXpQTzHMma2LK+c/cH0NkF8xVXOWKcOE3EoevRAnmFT8FT2xeEnZsGVbulYRTE4/
 vfgqqrNqsPY+ukSVDZ2MHPzfXsI9900jZ57q+E0SHFkj7U3DAnZI036lNKBZQhg4Cm8/
 929Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c5PknhEJpy0KAKZXEsCLw8GRPgWwprA9K/tNJNWAjsI=;
 b=YMHpgx4fIM/InDxTTMaezosbku+iL81MLCcGVWC39ITeLlAX0TAi9y8hFZMqlOoF8L
 tl8Ps2fQ/hCKtUH6m3UI2b/1tqruEqtUpYWDJzx6BC2W9IHtUE6XbOuH0wR6Pd9ujElx
 /LPqDCYWRGsVdgcY4P2FErNx6mU5w/rtlLYJPwlVzmzKoTsZo/WT4zCPvjOPAEfX1+4l
 CMmYKV3FOH9CYkCVQxjr+po0G1w8IUl3XroSGw3H8vC/I344v3SakNcrKhogTcjPcP35
 nffc+V6L4Ey2FJnHZLloGiuD0kWn06DEsVASPhDH2/FGAx1O/ZOyrvyOKwNmYRbWrvij
 vEjA==
X-Gm-Message-State: AOAM532kJuaSJyzZ+whhqDl4M/9rlSh0ic4PJ/1XZFRW2shetB0l7RKT
 rEoC+CiiPkcmKerVsH5WZ+tnURxNc6cSBg==
X-Google-Smtp-Source: ABdhPJxXkXSeAp1DjfN/tj3kax6Y+i4MBItOQWxm7YV0RvrX0Awbg2QcljPn21IFxYgH5zYZ/OZ5ig==
X-Received: by 2002:a05:6000:1006:: with SMTP id
 a6mr19788566wrx.367.1605542918422; 
 Mon, 16 Nov 2020 08:08:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 04/15] target/arm: Implement VSCCLRM insn
Date: Mon, 16 Nov 2020 16:08:20 +0000
Message-Id: <20201116160831.31000-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the v8.1M VSCCLRM insn, which zeros floating point
registers if there is an active floating point context.

Because we want to use arm_gen_condlabel(), we need to move
the definition of that function up in translate.c so it is
before the #include of translate-vfp.c.inc.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h               |  9 ++++
 target/arm/m-nocp.decode       |  8 +++-
 target/arm/translate.c         | 18 +++----
 target/arm/translate-vfp.c.inc | 86 ++++++++++++++++++++++++++++++++++
 4 files changed, 110 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c18a9167665..806c18a499f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3555,6 +3555,15 @@ static inline bool isar_feature_aa32_mprofile(const ARMISARegisters *id)
     return FIELD_EX32(id->id_pfr1, ID_PFR1, MPROGMOD) != 0;
 }
 
+static inline bool isar_feature_aa32_m_sec_state(const ARMISARegisters *id)
+{
+    /*
+     * Return true if M-profile state handling insns
+     * (VSCCLRM, CLRM, FPCTX access insns) are implemented
+     */
+    return FIELD_EX32(id->id_pfr1, ID_PFR1, SECURITY) >= 3;
+}
+
 static inline bool isar_feature_aa32_fp16_arith(const ARMISARegisters *id)
 {
     /* Sadly this is encoded differently for A-profile and M-profile */
diff --git a/target/arm/m-nocp.decode b/target/arm/m-nocp.decode
index 28c8ac6b94c..ccd62e8739a 100644
--- a/target/arm/m-nocp.decode
+++ b/target/arm/m-nocp.decode
@@ -29,13 +29,17 @@
 # If the coprocessor is not present or disabled then we will generate
 # the NOCP exception; otherwise we let the insn through to the main decode.
 
+%vd_dp  22:1 12:4
+%vd_sp  12:4 22:1
+
 &nocp cp
 
 {
   # Special cases which do not take an early NOCP: VLLDM and VLSTM
   VLLDM_VLSTM  1110 1100 001 l:1 rn:4 0000 1010 0000 0000
-  # TODO: VSCCLRM (new in v8.1M) is similar:
-  #VSCCLRM      1110 1100 1-01 1111 ---- 1011 ---- ---0
+  # VSCCLRM (new in v8.1M) is similar:
+  VSCCLRM      1110 1100 1.01 1111 .... 1011 imm:7 0   vd=%vd_dp size=3
+  VSCCLRM      1110 1100 1.01 1111 .... 1010 imm:8     vd=%vd_sp size=2
 
   NOCP         111- 1110 ---- ---- ---- cp:4 ---- ---- &nocp
   NOCP         111- 110- ---- ---- ---- cp:4 ---- ---- &nocp
diff --git a/target/arm/translate.c b/target/arm/translate.c
index f7d4ee393b7..4b17b2e0d46 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -100,6 +100,15 @@ void arm_translate_init(void)
     a64_translate_init();
 }
 
+/* Generate a label used for skipping this instruction */
+static void arm_gen_condlabel(DisasContext *s)
+{
+    if (!s->condjmp) {
+        s->condlabel = gen_new_label();
+        s->condjmp = 1;
+    }
+}
+
 /* Flags for the disas_set_da_iss info argument:
  * lower bits hold the Rt register number, higher bits are flags.
  */
@@ -5156,15 +5165,6 @@ static void gen_srs(DisasContext *s,
     s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
 
-/* Generate a label used for skipping this instruction */
-static void arm_gen_condlabel(DisasContext *s)
-{
-    if (!s->condjmp) {
-        s->condlabel = gen_new_label();
-        s->condjmp = 1;
-    }
-}
-
 /* Skip this instruction if the ARM condition is false */
 static void arm_skip_unless(DisasContext *s, uint32_t cond)
 {
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index f966de5b1f8..daf39306d04 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -3406,6 +3406,92 @@ static bool trans_VLLDM_VLSTM(DisasContext *s, arg_VLLDM_VLSTM *a)
     return true;
 }
 
+static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
+{
+    int btmreg, topreg;
+    TCGv_i64 zero64;
+    TCGv_i32 zero32;
+    TCGv_i32 aspen, sfpa;
+
+    if (!dc_isar_feature(aa32_m_sec_state, s)) {
+        /* Before v8.1M, fall through in decode to NOCP check */
+        return false;
+    }
+
+    /* Explicitly UNDEF because this takes precedence over NOCP */
+    if (!arm_dc_feature(s, ARM_FEATURE_M_MAIN) || !s->v8m_secure) {
+        unallocated_encoding(s);
+        return true;
+    }
+
+    if (!dc_isar_feature(aa32_vfp_simd, s)) {
+        /* NOP if we have neither FP nor MVE */
+        return true;
+    }
+
+    /*
+     * If FPCCR.ASPEN != 0 && CONTROL_S.SFPA == 0 then there is no
+     * active floating point context so we must NOP (without doing
+     * any lazy state preservation or the NOCP check).
+     */
+    aspen = load_cpu_field(v7m.fpccr[M_REG_S]);
+    sfpa = load_cpu_field(v7m.control[M_REG_S]);
+    tcg_gen_andi_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
+    tcg_gen_subi_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
+    tcg_gen_andi_i32(sfpa, sfpa, R_V7M_CONTROL_SFPA_MASK);
+    tcg_gen_or_i32(sfpa, sfpa, aspen);
+    arm_gen_condlabel(s);
+    tcg_gen_brcondi_i32(TCG_COND_EQ, sfpa, 0, s->condlabel);
+
+    if (s->fp_excp_el != 0) {
+        gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
+                           syn_uncategorized(), s->fp_excp_el);
+        return true;
+    }
+
+    topreg = a->vd + a->imm - 1;
+    btmreg = a->vd;
+
+    /* Convert to Sreg numbers if the insn specified in Dregs */
+    if (a->size == 3) {
+        topreg = topreg * 2 + 1;
+        btmreg *= 2;
+    }
+
+    if (topreg > 63 || (topreg > 31 && !(topreg & 1))) {
+        /* UNPREDICTABLE: we choose to undef */
+        unallocated_encoding(s);
+        return true;
+    }
+
+    /* Silently ignore requests to clear D16-D31 if they don't exist */
+    if (topreg > 31 && !dc_isar_feature(aa32_simd_r32, s)) {
+        topreg = 31;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    /* Zero the Sregs from btmreg to topreg inclusive. */
+    zero64 = tcg_const_i64(0);
+    zero32 = tcg_const_i32(0);
+    if (btmreg & 1) {
+        write_neon_element32(zero32, btmreg >> 1, 1, MO_32);
+        btmreg++;
+    }
+    for (; btmreg + 1 <= topreg; btmreg += 2) {
+        write_neon_element64(zero64, btmreg >> 1, 0, MO_64);
+    }
+    if (btmreg == topreg) {
+        write_neon_element32(zero32, btmreg >> 1, 0, MO_32);
+        btmreg++;
+    }
+    assert(btmreg == topreg + 1);
+    /* TODO: when MVE is implemented, zero VPR here */
+    return true;
+}
+
 static bool trans_NOCP(DisasContext *s, arg_nocp *a)
 {
     /*
-- 
2.20.1



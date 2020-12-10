Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36362D5A22
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:15:43 +0100 (CET)
Received: from localhost ([::1]:43896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKrF-0004X6-Rm
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:15:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR2-0001WS-Ri
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:36 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:32929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQk-00074f-LD
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:36 -0500
Received: by mail-wm1-x32b.google.com with SMTP id w206so2617060wma.0
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Af8GvxZMcrjzyfwJIHGDTyViExTE+D3Q+RDUgzSTiS0=;
 b=FdBWQVGQCFPIdLiIucg3Xcsl9AZ3wO3Ii+kzi0sO0cZ9zR6pM1hd1XXyDq427N7JJs
 dnym9q65nHRdrPp1t99KvbO+rCWpas0CYI31q32tG9QCMHJ/Xq2AtMyV7fZMMvr7RUz5
 gt46VCutWscwVS6BwtmPODYYJwSYGOfp0PsmyFx4/6LqzA2qXR/ibVWWcIVv5ulX4Br7
 E/gFoMkwZxm37o3t0qjK9SL5l0WoGxXi2rDPIc/4uvBGikHd77E+sst8OFFnopZilQmX
 IeZdTzGe1UpwATRVYYnhQ18YDgByndsD3TPXeLh6h+V/MZYcO8KK0xc7LJkglFz9Mty7
 wNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Af8GvxZMcrjzyfwJIHGDTyViExTE+D3Q+RDUgzSTiS0=;
 b=T3OduZRzxjjHpvhWKA19Wes+0AfUdRXP+m8xm2D8i9n/YbmfEd8P73d6u5j1wSmys5
 qvLqEHwbccVstcQyKV8EeB/0LY5WVTN9/U4EmTz2hUF82mPu6IVPDr938jjv+foFRJFn
 S6FzW/DgUU6lfqW/8C7/kI5SbYq2v4XEOB0m8eSchKdGgbexUL23dmvrd+yhzuHEAOn6
 Jc9ew7W6jL+XgsKGzMqWhXjajbWOQM6E2OjwXLLfZ/qKPtJ0lJW4lUYf+GvxPVsFfgKt
 A7+Igl4DClFb9rUZY/kGC5P+pnIq3H7Y9p6TtmjMH7dkiG2w1AHm9jEXaRF9nW+bz9Dz
 Khbw==
X-Gm-Message-State: AOAM532t5wDUyyni31NU4py/IfBZ+obNWsW3K/nEjv+ep32RjF07Pjtt
 2lD7uVpBBZcNvlEJONJU0HrcY9cI50W5PQ==
X-Google-Smtp-Source: ABdhPJwcSbFIjO4VsY/McjCxKPC6D2Kkvc2pjoh94wUfJ5vctcxGlDRWV/kVcc+VFxhVAhoz116Xkw==
X-Received: by 2002:a1c:2cc2:: with SMTP id s185mr7585121wms.111.1607600896639; 
 Thu, 10 Dec 2020 03:48:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/36] target/arm: Implement VSCCLRM insn
Date: Thu, 10 Dec 2020 11:47:35 +0000
Message-Id: <20201210114756.16501-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
This requires support in write_neon_element32() for the MO_32
element size, so add it.

Because we want to use arm_gen_condlabel(), we need to move
the definition of that function up in translate.c so it is
before the #include of translate-vfp.c.inc.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-5-peter.maydell@linaro.org
---
 target/arm/cpu.h               |  9 ++++
 target/arm/m-nocp.decode       |  8 +++-
 target/arm/translate.c         | 21 +++++----
 target/arm/translate-vfp.c.inc | 84 ++++++++++++++++++++++++++++++++++
 4 files changed, 111 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e5514c82862..11400a9d248 100644
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
index 6d04ca3a8a0..9f2b6018a21 100644
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
@@ -1221,6 +1230,9 @@ static void write_neon_element64(TCGv_i64 src, int reg, int ele, MemOp memop)
     long off = neon_element_offset(reg, ele, memop);
 
     switch (memop) {
+    case MO_32:
+        tcg_gen_st32_i64(src, cpu_env, off);
+        break;
     case MO_64:
         tcg_gen_st_i64(src, cpu_env, off);
         break;
@@ -5156,15 +5168,6 @@ static void gen_srs(DisasContext *s,
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
index 96948f5a2d3..2a67ed0f6e2 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -3406,6 +3406,90 @@ static bool trans_VLLDM_VLSTM(DisasContext *s, arg_VLLDM_VLSTM *a)
     return true;
 }
 
+static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
+{
+    int btmreg, topreg;
+    TCGv_i64 zero;
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
+    tcg_gen_xori_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
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
+    zero = tcg_const_i64(0);
+    if (btmreg & 1) {
+        write_neon_element64(zero, btmreg >> 1, 1, MO_32);
+        btmreg++;
+    }
+    for (; btmreg + 1 <= topreg; btmreg += 2) {
+        write_neon_element64(zero, btmreg >> 1, 0, MO_64);
+    }
+    if (btmreg == topreg) {
+        write_neon_element64(zero, btmreg >> 1, 0, MO_32);
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



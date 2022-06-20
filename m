Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167BF5523D6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:27:30 +0200 (CEST)
Received: from localhost ([::1]:47092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3M7U-0007yH-SQ
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La9-0006Fw-Jq
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:53:02 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La5-0001UI-3B
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:53:01 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 73-20020a17090a0fcf00b001eaee69f600so10989196pjz.1
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TfVBq32aHW3z71mz8r78jNyZRbejtSaaxaB+uJXFBtM=;
 b=f3JH73mG0EvGyaIJ/4dpW8ehVnmjef100QHvDQ2vzIpd2RzNEs0DrXx6hKvNw8Ws5j
 41nlAtlRbL0E8fWkrT9o+9BtSIm1jsqen13L24ec0otREQ+cvMUdgaEl/FUjiTDf+6cc
 iHBQZIOlyKQc0tWDq4yTZTtiwO9ftLDwsKSRQpuVBHa53h8dcW+1KYUEMyRVquCy4LhK
 t5oHGnwxPhacZAeq0YHGvUwcR3DzpXgOoUrQqZCidfsG0S0Y5Sak3rHxuoDN3ldDdp16
 2gUlunJCVVlOw+mRzYmYEFMl0vGsr1WqMTVbJdAcMeL82/HVXKKF39j73Ttj3xLujMTC
 KmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TfVBq32aHW3z71mz8r78jNyZRbejtSaaxaB+uJXFBtM=;
 b=NDRWEQP6OLSu4+Z1I8inGV997hbHSok4NYVjFIUAmbfhYDp7m+nzFJ3hPdSZcqy4fx
 Kt9jrbg9jymhHme8Knn7gVd3HsEXpH4Udbso13HHPESftingQ89v8oCj2ClJPaHEC45s
 nN+1T0GKcWRFoP+kF08I21/8wEhNkhFfI+dkbfd3iAoGBnMFvqJO/mAwK3TF5JwZahfm
 BC4h8dVdmvgf0PIu0jlQzTZQ9U7O0bcneUCCLj/+YfmCuFS/PP3ZHK4S8XBAUfyDCXM9
 Cs+YldrxaxJv/i4mwZc6RE2+Ukw+WQjaq6DYvQshb1SZabEK9dbFjVo6YsGiccQ7AHhh
 0PuA==
X-Gm-Message-State: AJIora//Mw4cZqi+M524dOG7+3JLExR1dV0lwuQmuHrUvBU/6LMZNQ0R
 BROPOOIJ+bvpANgX6OdcpoQlOGEUsjZbKw==
X-Google-Smtp-Source: AGRyM1uZ9NwTF7wZc6cQkhRwNez34yL3WloE0kTspzh4w+QyCjnHg1TLeOnfakJX6CmD+h1So+qLvg==
X-Received: by 2002:a17:902:ea95:b0:16a:3084:2925 with SMTP id
 x21-20020a170902ea9500b0016a30842925mr2183127plb.166.1655747575627; 
 Mon, 20 Jun 2022 10:52:55 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 22/51] target/arm: Trap AdvSIMD usage when Streaming SVE is
 active
Date: Mon, 20 Jun 2022 10:52:06 -0700
Message-Id: <20220620175235.60881-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This new behaviour is in the ARM pseudocode function
AArch64.CheckFPAdvSIMDEnabled, which applies to AArch32
via AArch32.CheckAdvSIMDOrFPEnabled when the EL to which
the trap would be delivered is in AArch64 mode.

Given that ARMv9 drops support for AArch32 outside EL0,
the trap EL detection ought to be trivially true, but
the pseudocode still contains a number of conditions,
and QEMU has not yet committed to dropping A32 support
for EL[12] when v9 features are present.

Since the computation of SME_TRAP_SIMD is necessarily
different for the two modes, we might as well preserve
bits within TBFLAG_ANY and allocate separate bits within
TBFLAG_A32 and TBFLAG_A64 instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  6 +++
 target/arm/translate.h     |  3 ++
 target/arm/sme-fa64.decode | 89 ++++++++++++++++++++++++++++++++++++++
 target/arm/helper.c        | 42 ++++++++++++++++++
 target/arm/translate-a64.c | 40 ++++++++++++++++-
 target/arm/translate-vfp.c | 12 +++++
 target/arm/translate.c     |  1 +
 target/arm/meson.build     |  1 +
 8 files changed, 192 insertions(+), 2 deletions(-)
 create mode 100644 target/arm/sme-fa64.decode

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 068877323c..da1c036fa0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3132,6 +3132,11 @@ FIELD(TBFLAG_A32, HSTR_ACTIVE, 9, 1)
  * the same thing as the current security state of the processor!
  */
 FIELD(TBFLAG_A32, NS, 10, 1)
+/*
+ * Indicates that SME Streaming mode is active, and SMCR_ELx.FA64 is not.
+ * This requires an SME trap from AArch32 mode when using NEON.
+ */
+FIELD(TBFLAG_A32, SME_TRAP_SIMD, 11, 1)
 
 /*
  * Bit usage when in AArch32 state, for M-profile only.
@@ -3169,6 +3174,7 @@ FIELD(TBFLAG_A64, SMEEXC_EL, 20, 2)
 FIELD(TBFLAG_A64, PSTATE_SM, 22, 1)
 FIELD(TBFLAG_A64, PSTATE_ZA, 23, 1)
 FIELD(TBFLAG_A64, SVL, 24, 4)
+FIELD(TBFLAG_A64, SME_TRAP_SIMD, 28, 1)
 
 /*
  * Helpers for using the above.
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 22fd882368..ef158a75c6 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -102,6 +102,9 @@ typedef struct DisasContext {
     bool pstate_sm;
     /* True if PSTATE.ZA is set. */
     bool pstate_za;
+    /* True if AdvSIMD insns should raise an SME Streaming exception. */
+    bool sme_trap_simd;
+    bool sme_trap_this_insn;
     /* True if MVE insns are definitely not predicated by VPR or LTPSIZE */
     bool mve_no_pred;
     /*
diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
new file mode 100644
index 0000000000..4c2569477d
--- /dev/null
+++ b/target/arm/sme-fa64.decode
@@ -0,0 +1,89 @@
+# AArch64 SME allowed instruction decoding
+#
+#  Copyright (c) 2022 Linaro, Ltd
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2.1 of the License, or (at your option) any later version.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with this library; if not, see <http://www.gnu.org/licenses/>.
+
+#
+# This file is processed by scripts/decodetree.py
+#
+
+# These patterns are taken from Appendix E1.1 of DDI0616 A.a,
+# Arm Architecture Reference Manual Supplement,
+# The Scalable Matrix Extension (SME), for Armv9-A
+
+{
+  [
+    OK  0-00 1110 0000 0001 0010 11-- ---- ----   # SMOV W|Xd,Vn.B[0]
+    OK  0-00 1110 0000 0010 0010 11-- ---- ----   # SMOV W|Xd,Vn.H[0]
+    OK  0100 1110 0000 0100 0010 11-- ---- ----   # SMOV Xd,Vn.S[0]
+    OK  0000 1110 0000 0001 0011 11-- ---- ----   # UMOV Wd,Vn.B[0]
+    OK  0000 1110 0000 0010 0011 11-- ---- ----   # UMOV Wd,Vn.H[0]
+    OK  0000 1110 0000 0100 0011 11-- ---- ----   # UMOV Wd,Vn.S[0]
+    OK  0100 1110 0000 1000 0011 11-- ---- ----   # UMOV Xd,Vn.D[0]
+  ]
+  FAIL  0--0 111- ---- ---- ---- ---- ---- ----   # Advanced SIMD vector operations
+}
+
+{
+  [
+    OK  0101 1110 --1- ---- 11-1 11-- ---- ----   # FMULX/FRECPS/FRSQRTS (scalar)
+    OK  0101 1110 -10- ---- 00-1 11-- ---- ----   # FMULX/FRECPS/FRSQRTS (scalar, FP16)
+    OK  01-1 1110 1-10 0001 11-1 10-- ---- ----   # FRECPE/FRSQRTE/FRECPX (scalar)
+    OK  01-1 1110 1111 1001 11-1 10-- ---- ----   # FRECPE/FRSQRTE/FRECPX (scalar, FP16)
+  ]
+  FAIL  01-1 111- ---- ---- ---- ---- ---- ----   # Advanced SIMD single-element operations
+}
+
+FAIL    0-00 110- ---- ---- ---- ---- ---- ----   # Advanced SIMD structure load/store
+FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography extensions
+
+# These are the "avoidance of doubt" final table of Illegal Advanced SIMD instructions
+# We don't actually need to include these, as the default is OK.
+#       -001 111- ---- ---- ---- ---- ---- ----   # Scalar floating-point operations
+#       --10 110- ---- ---- ---- ---- ---- ----   # Load/store pair of FP registers
+#       --01 1100 ---- ---- ---- ---- ---- ----   # Load FP register (PC-relative literal)
+#       --11 1100 --0- ---- ---- ---- ---- ----   # Load/store FP register (unscaled imm)
+#       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
+#       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
+
+FAIL    0000 0100 --1- ---- 1010 ---- ---- ----   # ADR
+FAIL    0000 0100 --1- ---- 1011 -0-- ---- ----   # FTSSEL, FEXPA
+FAIL    0000 0101 --10 0001 100- ---- ---- ----   # COMPACT
+FAIL    0010 0101 --01 100- 1111 000- ---0 ----   # RDFFR, RDFFRS
+FAIL    0010 0101 --10 1--- 1001 ---- ---- ----   # WRFFR, SETFFR
+FAIL    0100 0101 --0- ---- 1011 ---- ---- ----   # BDEP, BEXT, BGRP
+FAIL    0100 0101 000- ---- 0110 1--- ---- ----   # PMULLB, PMULLT (128b result)
+FAIL    0110 0100 --1- ---- 1110 01-- ---- ----   # FMMLA, BFMMLA
+FAIL    0110 0101 --0- ---- 0000 11-- ---- ----   # FTSMUL
+FAIL    0110 0101 --01 0--- 100- ---- ---- ----   # FTMAD
+FAIL    0110 0101 --01 1--- 001- ---- ---- ----   # FADDA
+FAIL    0100 0101 --0- ---- 1001 10-- ---- ----   # SMMLA, UMMLA, USMMLA
+FAIL    0100 0101 --1- ---- 1--- ---- ---- ----   # SVE2 string/histo/crypto instructions
+FAIL    1000 010- -00- ---- 10-- ---- ---- ----   # SVE2 32-bit gather NT load (vector+scalar)
+FAIL    1000 010- -00- ---- 111- ---- ---- ----   # SVE 32-bit gather prefetch (vector+imm)
+FAIL    1000 0100 0-1- ---- 0--- ---- ---- ----   # SVE 32-bit gather prefetch (scalar+vector)
+FAIL    1000 010- -01- ---- 1--- ---- ---- ----   # SVE 32-bit gather load (vector+imm)
+FAIL    1000 0100 0-0- ---- 0--- ---- ---- ----   # SVE 32-bit gather load byte (scalar+vector)
+FAIL    1000 0100 1--- ---- 0--- ---- ---- ----   # SVE 32-bit gather load half (scalar+vector)
+FAIL    1000 0101 0--- ---- 0--- ---- ---- ----   # SVE 32-bit gather load word (scalar+vector)
+FAIL    1010 010- ---- ---- 011- ---- ---- ----   # SVE contiguous FF load (scalar+scalar)
+FAIL    1010 010- ---1 ---- 101- ---- ---- ----   # SVE contiguous NF load (scalar+imm)
+FAIL    1010 010- -10- ---- 000- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+scalar)
+FAIL    1010 010- -100 ---- 001- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+imm)
+FAIL    1100 010- ---- ---- ---- ---- ---- ----   # SVE 64-bit gather load/prefetch
+FAIL    1110 010- -00- ---- 001- ---- ---- ----   # SVE2 64-bit scatter NT store (vector+scalar)
+FAIL    1110 010- -10- ---- 001- ---- ---- ----   # SVE2 32-bit scatter NT store (vector+scalar)
+FAIL    1110 010- ---- ---- 1-0- ---- ---- ----   # SVE scatter store (scalar+32-bit vector)
+FAIL    1110 010- ---- ---- 101- ---- ---- ----   # SVE scatter store (misc)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d2886a123a..26f4a4bc26 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6269,6 +6269,32 @@ int sme_exception_el(CPUARMState *env, int el)
     return 0;
 }
 
+/* This corresponds to the ARM pseudocode function IsFullA64Enabled(). */
+static bool sme_fa64(CPUARMState *env, int el)
+{
+    if (!cpu_isar_feature(aa64_sme_fa64, env_archcpu(env))) {
+        return false;
+    }
+
+    if (el <= 1 && !el_is_in_host(env, el)) {
+        if (!FIELD_EX64(env->vfp.smcr_el[1], SMCR, FA64)) {
+            return false;
+        }
+    }
+    if (el <= 2 && arm_is_el2_enabled(env)) {
+        if (!FIELD_EX64(env->vfp.smcr_el[2], SMCR, FA64)) {
+            return false;
+        }
+    }
+    if (arm_feature(env, ARM_FEATURE_EL3)) {
+        if (!FIELD_EX64(env->vfp.smcr_el[3], SMCR, FA64)) {
+            return false;
+        }
+    }
+
+    return true;
+}
+
 /*
  * Given that SVE is enabled, return the vector length for EL.
  */
@@ -11312,6 +11338,21 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
         DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
     }
 
+    /*
+     * The SME exception we are testing for is raised via
+     * AArch64.CheckFPAdvSIMDEnabled(), and for AArch32 this is called
+     * when EL1 is using A64 or EL2 using A64 and !TGE.
+     * See AArch32.CheckAdvSIMDOrFPEnabled().
+     */
+    if (el == 0
+        && FIELD_EX64(env->svcr, SVCR, SM)
+        && (!arm_is_el2_enabled(env)
+            || (arm_el_is_aa64(env, 2) && !(env->cp15.hcr_el2 & HCR_TGE)))
+        && arm_el_is_aa64(env, 1)
+        && !sme_fa64(env, el)) {
+        DP_TBFLAG_A32(flags, SME_TRAP_SIMD, 1);
+    }
+
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
@@ -11361,6 +11402,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         }
         if (FIELD_EX64(env->svcr, SVCR, SM)) {
             DP_TBFLAG_A64(flags, PSTATE_SM, 1);
+            DP_TBFLAG_A64(flags, SME_TRAP_SIMD, !sme_fa64(env, el));
         }
         DP_TBFLAG_A64(flags, PSTATE_ZA, FIELD_EX64(env->svcr, SVCR, ZA));
     }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a5f8a6c771..efcfb919ff 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1155,7 +1155,7 @@ static void do_vec_ld(DisasContext *s, int destidx, int element,
  * unallocated-encoding checks (otherwise the syndrome information
  * for the resulting exception will be incorrect).
  */
-static bool fp_access_check(DisasContext *s)
+static bool fp_access_check_only(DisasContext *s)
 {
     if (s->fp_excp_el) {
         assert(!s->fp_access_checked);
@@ -1170,6 +1170,19 @@ static bool fp_access_check(DisasContext *s)
     return true;
 }
 
+static bool fp_access_check(DisasContext *s)
+{
+    if (!fp_access_check_only(s)) {
+        return false;
+    }
+    if (s->sme_trap_this_insn) {
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_smetrap(SME_ET_Streaming, false));
+        return false;
+    }
+    return true;
+}
+
 /* Check that SVE access is enabled.  If it is, return true.
  * If not, emit code to generate an appropriate exception and return false.
  */
@@ -1994,7 +2007,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
     default:
         g_assert_not_reached();
     }
-    if ((ri->type & ARM_CP_FPU) && !fp_access_check(s)) {
+    if ((ri->type & ARM_CP_FPU) && !fp_access_check_only(s)) {
         return;
     } else if ((ri->type & ARM_CP_SVE) && !sve_access_check(s)) {
         return;
@@ -14530,6 +14543,23 @@ static void disas_data_proc_simd_fp(DisasContext *s, uint32_t insn)
     }
 }
 
+/*
+ * Include the generated SME FA64 decoder.
+ */
+
+#include "decode-sme-fa64.c.inc"
+
+static bool trans_OK(DisasContext *s, arg_OK *a)
+{
+    return true;
+}
+
+static bool trans_FAIL(DisasContext *s, arg_OK *a)
+{
+    s->sme_trap_this_insn = true;
+    return true;
+}
+
 /**
  * is_guarded_page:
  * @env: The cpu environment
@@ -14657,6 +14687,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->mte_active[1] = EX_TBFLAG_A64(tb_flags, MTE0_ACTIVE);
     dc->pstate_sm = EX_TBFLAG_A64(tb_flags, PSTATE_SM);
     dc->pstate_za = EX_TBFLAG_A64(tb_flags, PSTATE_ZA);
+    dc->sme_trap_simd = EX_TBFLAG_A64(tb_flags, SME_TRAP_SIMD);
     dc->vec_len = 0;
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
@@ -14805,6 +14836,11 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         }
     }
 
+    if (s->sme_trap_simd) {
+        s->sme_trap_this_insn = false;
+        disas_sme_fa64(s, insn);
+    }
+
     switch (extract32(insn, 25, 4)) {
     case 0x0:
         if (!extract32(insn, 31, 1) || !disas_sme(s, insn)) {
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 82fdbcae53..25db1fbd3f 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -234,6 +234,18 @@ static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
         return false;
     }
 
+    /*
+     * Note that rebuild_hflags_a32 has already accounted for being in EL0
+     * and the higher EL in A64 mode, etc.  Unlike A64 mode, there do not
+     * appear to be any insns which touch VFP which are allowed.
+     */
+    if (s->sme_trap_simd) {
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_smetrap(SME_ET_Streaming,
+                                       s->base.pc_next - s->pc_curr == 2));
+        return false;
+    }
+
     if (!s->vfp_enabled && !ignore_vfp_enabled) {
         assert(!arm_dc_feature(s, ARM_FEATURE_M));
         unallocated_encoding(s);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6617de775f..947d3feec6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9378,6 +9378,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
             dc->vec_len = EX_TBFLAG_A32(tb_flags, VECLEN);
             dc->vec_stride = EX_TBFLAG_A32(tb_flags, VECSTRIDE);
         }
+        dc->sme_trap_simd = EX_TBFLAG_A32(tb_flags, SME_TRAP_SIMD);
     }
     dc->cp_regs = cpu->cp_regs;
     dc->features = env->features;
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 6dd7e93643..87e911b27f 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,6 +1,7 @@
 gen = [
   decodetree.process('sve.decode', extra_args: '--decode=disas_sve'),
   decodetree.process('sme.decode', extra_args: '--decode=disas_sme'),
+  decodetree.process('sme-fa64.decode', extra_args: '--static-decode=disas_sme_fa64'),
   decodetree.process('neon-shared.decode', extra_args: '--decode=disas_neon_shared'),
   decodetree.process('neon-dp.decode', extra_args: '--decode=disas_neon_dp'),
   decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
-- 
2.34.1



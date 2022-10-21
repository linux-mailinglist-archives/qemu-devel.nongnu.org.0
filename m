Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E513607BD4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 18:10:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oluVG-0003Go-8h; Fri, 21 Oct 2022 12:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oluSw-00032L-LZ
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:01:53 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oluSm-0005dU-OV
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:01:43 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so2304272wmb.3
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Np9gvwTtvCeoH20hMVBWK5EHSNtPAWDkE/dbBbTbCWQ=;
 b=OgTm1h2aojJT19SYg3THvlQv4XSLCuzuzebIuyX+kgayCoRGSePZ9A4WYd81dC7HCy
 XAPapR2QN55CCwv/uvTrKeomvKYDue1fmQWHS+n9c+CgBXYRinBFqTzxVnJ7m/VUjRz5
 R/VUOMkXTNqM0vmEtlF2vnvYWqq4ulrCztmJT887F+JQGnS/8bbLKLWrPrIanupd3vmn
 EZSDZL9X/Hfop9w8H1zSeO06iGdwngnfnBIiM5Kh7Ph3Nj2TVGdJBE1sR86r7IhO/aMH
 wfIQ/e6Q57mU/hlUwbcJM1MIQF74mi2T5Qlw+iLtHTDzuYpCeDI6TJ8884gx6Ik1fcr/
 zhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Np9gvwTtvCeoH20hMVBWK5EHSNtPAWDkE/dbBbTbCWQ=;
 b=oJbJjxiJDTgNW6JAC6IxhiHLnkvxH7ZvP0V8WgmB8bwoNstMGAvUABc8yCohedGYgk
 TmmxzsXlaM2qdJGNtc68F0W/8fXgB1xFtidJ71gVsw9RiruvrGON1eL7WrC75Chf7OEO
 44+aJxqYj/OYBanONyD2jMjPi+QdOHPgTzuQBFigWDg4MtGm2JdadA6DgtKVVpSv9K5r
 yNRsIfRc25zxHQwY61zcoG9FNNI663tEAJTbspBbHGCS8yyJ8ZfFjzGw+klWXqSl4ix2
 ZQIL7VsOKakYjb07VyotRaX/tnUlUsLXHb8m8TsoMjtYe+1fRFLXBqPT0s20qzrV4jUM
 NZlA==
X-Gm-Message-State: ACrzQf0C96sG4+bJ0kr0W/CUSszdx5pK/on0AHqJAUY4eYurH0nzxtih
 j7ZbvjfvuotJSWaW7JOZ9OcBOWUhGm1kfA==
X-Google-Smtp-Source: AMsMyM7ySTR3S2qwd6ANFDduBJaV88QV7zn0a8ZElZ+zTz9rZ/oW5R7KhpfkQjmeotVBgCKF+M8t2Q==
X-Received: by 2002:a05:600c:3781:b0:3a6:804a:afc with SMTP id
 o1-20020a05600c378100b003a6804a0afcmr34028950wmr.27.1666368094955; 
 Fri, 21 Oct 2022 09:01:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p63-20020a1c2942000000b003c6c5a5a651sm2900642wmp.28.2022.10.21.09.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:01:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2] target/arm: Implement FEAT_E0PD
Date: Fri, 21 Oct 2022 17:01:31 +0100
Message-Id: <20221021160131.3531787-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

FEAT_E0PD adds new bits E0PD0 and E0PD1 to TCR_EL1, which allow the
OS to forbid EL0 access to half of the address space.  Since this is
an EL0-specific variation on the existing TCR_ELx.{EPD0,EPD1}, we can
implement it entirely in aa64_va_parameters().

This requires moving the existing regime_is_user() to internals.h
so that the code in helper.c can get at it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
changes v1->v2: rebased; the only real conflict was that
regime_is_user() contents had changed.
---
 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu.h              |  5 +++++
 target/arm/internals.h        | 19 +++++++++++++++++++
 target/arm/cpu64.c            |  1 +
 target/arm/helper.c           |  9 +++++++++
 target/arm/ptw.c              | 19 -------------------
 6 files changed, 35 insertions(+), 19 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index cfb4b0768b0..fd61360a086 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -24,6 +24,7 @@ the following architecture extensions:
 - FEAT_Debugv8p4 (Debug changes for v8.4)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_DoubleFault (Double Fault Extension)
+- FEAT_E0PD (Preventing EL0 access to halves of address maps)
 - FEAT_ETS (Enhanced Translation Synchronization)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 64fc03214c1..f8c59858063 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4139,6 +4139,11 @@ static inline bool isar_feature_aa64_lva(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, VARANGE) != 0;
 }
 
+static inline bool isar_feature_aa64_e0pd(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, E0PD) != 0;
+}
+
 static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index c3c3920ded2..c8c5ca7b934 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -707,6 +707,25 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_MUser:
+    case ARMMMUIdx_MSUser:
+    case ARMMMUIdx_MUserNegPri:
+    case ARMMMUIdx_MSUserNegPri:
+        return true;
+    default:
+        return false;
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+        g_assert_not_reached();
+    }
+}
+
 /* Return the SCTLR value which controls this address translation regime */
 static inline uint64_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 85e0d1daf1c..da95eabab5e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1185,6 +1185,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, FWB, 1);      /* FEAT_S2FWB */
     t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
     t = FIELD_DP64(t, ID_AA64MMFR2, BBM, 2);      /* FEAT_BBM at level 2 */
+    t = FIELD_DP64(t, ID_AA64MMFR2, E0PD, 1);     /* FEAT_E0PD */
     cpu->isar.id_aa64mmfr2 = t;
 
     t = cpu->isar.id_aa64zfr0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c672903f432..252651a8d19 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10491,6 +10491,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         ps = extract32(tcr, 16, 3);
         ds = extract64(tcr, 32, 1);
     } else {
+        bool e0pd;
+
         /*
          * Bit 55 is always between the two regions, and is canonical for
          * determining if address tagging is enabled.
@@ -10502,15 +10504,22 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             epd = extract32(tcr, 7, 1);
             sh = extract32(tcr, 12, 2);
             hpd = extract64(tcr, 41, 1);
+            e0pd = extract64(tcr, 55, 1);
         } else {
             tsz = extract32(tcr, 16, 6);
             gran = tg1_to_gran_size(extract32(tcr, 30, 2));
             epd = extract32(tcr, 23, 1);
             sh = extract32(tcr, 28, 2);
             hpd = extract64(tcr, 42, 1);
+            e0pd = extract64(tcr, 56, 1);
         }
         ps = extract64(tcr, 32, 3);
         ds = extract64(tcr, 59, 1);
+
+        if (e0pd && cpu_isar_feature(aa64_e0pd, cpu) &&
+            regime_is_user(env, mmu_idx)) {
+            epd = true;
+        }
     }
 
     gran = sanitize_gran_size(cpu, gran, stage2);
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6c5ed56a101..aed6f92d6f6 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -104,25 +104,6 @@ static bool regime_translation_big_endian(CPUARMState *env, ARMMMUIdx mmu_idx)
     return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
 }
 
-static bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_MUser:
-    case ARMMMUIdx_MSUser:
-    case ARMMMUIdx_MUserNegPri:
-    case ARMMMUIdx_MSUserNegPri:
-        return true;
-    default:
-        return false;
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-        g_assert_not_reached();
-    }
-}
-
 /* Return the TTBR associated with this translation regime */
 static uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn)
 {
-- 
2.25.1



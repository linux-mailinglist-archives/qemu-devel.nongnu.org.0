Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5BB51FC73
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:15:59 +0200 (CEST)
Received: from localhost ([::1]:48580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2Iw-0002oX-58
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22X-0007Dv-6D
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:01 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22V-0001IB-3f
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:00 -0400
Received: by mail-wm1-x331.google.com with SMTP id k126so8239512wme.2
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+LCYa4SACHz39b/N8QB7n8zUhxKTI4/N9Nw1WrChTbA=;
 b=EmXl+onMX5B4JnHTlHew38l4WLwLQFQ7VgB+ttMudctyRIWblTzODdj1ykvyq6S8sD
 7nGR0ZZptOSqbzlIVF4QKLQXc9e3M9eAcNl44G1NyynIFGa0ftzery3wAZxwIpq3QCOE
 8ucqiLc3O7inJE1Me9PO4zqsXICN0wKyd3Hv90Pa39P/ItQummhBPF9omrv72JC/whY3
 FV18iB/rPIj9a1Z2d7hX6DkWiwyKnXYa7eG+lFfCW+9G7Stc4T+I6BeKe/kJ76P4s3C8
 OH6FuRWoOavorhpSAE9MUWX4KnS53k8o8gHLH+ZA64Wl9x0Ui61clBgrr+s7KgWUXStN
 Mjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+LCYa4SACHz39b/N8QB7n8zUhxKTI4/N9Nw1WrChTbA=;
 b=23HVPgtfDdrOBp3Q1nZvDuUbJoBtrPnhJIZKo32StNNnk9QpLagxsM6EXxDNWKfVjD
 IltJYwpwLJWSswYMTN/GiWDmN2H2cPR/FzLN8/5+vfEmbZWsg3b32pJiY93hNPhPzYLJ
 GdmIvUvyEBsbxr+MWH6OWetyP6elP/EHGERoqcLVRD5gl4NhYuM2JILiCeO6K1Eb9h2J
 k5JYucGYxurUuAFVw+2eK/ayq38DQ1Abin4N3Cbx0qAZo5y/OIcZRFFzpSAP47kU5m6l
 UpUWbWKqVU5/8iLm/EvdslSRmmTPNke3JL8AftgUC5xdY5dktDjRP8eADnj75rfOEVxQ
 XXCQ==
X-Gm-Message-State: AOAM533DnnjnCmh+Mo7FglghbqTx97DlFOCpiJ9PJoognHo9PyWl/r6C
 DNvAQ0WgkVsR+VimxPR5QhhewcrwLgOLxg==
X-Google-Smtp-Source: ABdhPJwuiMzuaUbGJ6l1axaOgqUUJGpeW+WXdGXxWEJ9QbLshNXjjQT26QVzipe4rfIZIH0KmL5Hig==
X-Received: by 2002:a05:600c:3caa:b0:394:8fb8:716 with SMTP id
 bg42-20020a05600c3caa00b003948fb80716mr4970063wmb.105.1652097537613; 
 Mon, 09 May 2022 04:58:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.58.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:58:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/32] target/arm: Split out aa32_max_features
Date: Mon,  9 May 2022 12:58:25 +0100
Message-Id: <20220509115848.3521805-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Share the code to set AArch32 max features so that we no
longer have code drift between qemu{-system,}-{arm,aarch64}.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506180242.216785-9-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h |   2 +
 target/arm/cpu64.c     |  50 +-----------------
 target/arm/cpu_tcg.c   | 114 ++++++++++++++++++++++-------------------
 3 files changed, 65 insertions(+), 101 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 343b465d516..c563b3735f2 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1313,4 +1313,6 @@ static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
 void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 #endif
 
+void aa32_max_features(ARMCPU *cpu);
+
 #endif
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 33a0a719003..6da42af56eb 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -682,7 +682,6 @@ static void aarch64_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint64_t t;
-    uint32_t u;
 
     if (kvm_enabled() || hvf_enabled()) {
         /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
@@ -799,57 +798,12 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
     cpu->isar.id_aa64zfr0 = t;
 
-    /* Replicate the same data to the 32-bit id registers.  */
-    u = cpu->isar.id_isar5;
-    u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
-    u = FIELD_DP32(u, ID_ISAR5, SHA1, 1);
-    u = FIELD_DP32(u, ID_ISAR5, SHA2, 1);
-    u = FIELD_DP32(u, ID_ISAR5, CRC32, 1);
-    u = FIELD_DP32(u, ID_ISAR5, RDM, 1);
-    u = FIELD_DP32(u, ID_ISAR5, VCMA, 1);
-    cpu->isar.id_isar5 = u;
-
-    u = cpu->isar.id_isar6;
-    u = FIELD_DP32(u, ID_ISAR6, JSCVT, 1);
-    u = FIELD_DP32(u, ID_ISAR6, DP, 1);
-    u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
-    u = FIELD_DP32(u, ID_ISAR6, SB, 1);
-    u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
-    u = FIELD_DP32(u, ID_ISAR6, BF16, 1);
-    u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
-    cpu->isar.id_isar6 = u;
-
-    u = cpu->isar.id_pfr0;
-    u = FIELD_DP32(u, ID_PFR0, DIT, 1);
-    cpu->isar.id_pfr0 = u;
-
-    u = cpu->isar.id_pfr2;
-    u = FIELD_DP32(u, ID_PFR2, SSBS, 1);
-    cpu->isar.id_pfr2 = u;
-
-    u = cpu->isar.id_mmfr3;
-    u = FIELD_DP32(u, ID_MMFR3, PAN, 2); /* ATS1E1 */
-    cpu->isar.id_mmfr3 = u;
-
-    u = cpu->isar.id_mmfr4;
-    u = FIELD_DP32(u, ID_MMFR4, HPDS, 1); /* AA32HPD */
-    u = FIELD_DP32(u, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
-    u = FIELD_DP32(u, ID_MMFR4, CNP, 1); /* TTCNP */
-    u = FIELD_DP32(u, ID_MMFR4, XNX, 1); /* TTS2UXN */
-    cpu->isar.id_mmfr4 = u;
-
     t = cpu->isar.id_aa64dfr0;
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5); /* v8.4-PMU */
     cpu->isar.id_aa64dfr0 = t;
 
-    u = cpu->isar.id_dfr0;
-    u = FIELD_DP32(u, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
-    cpu->isar.id_dfr0 = u;
-
-    u = cpu->isar.mvfr1;
-    u = FIELD_DP32(u, MVFR1, FPHP, 3);      /* v8.2-FP16 */
-    u = FIELD_DP32(u, MVFR1, SIMDHP, 2);    /* v8.2-FP16 */
-    cpu->isar.mvfr1 = u;
+    /* Replicate the same data to the 32-bit id registers.  */
+    aa32_max_features(cpu);
 
 #ifdef CONFIG_USER_ONLY
     /*
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 9aa2f737c1e..b0dbf2c991b 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -20,6 +20,66 @@
 #endif
 #include "cpregs.h"
 
+
+/* Share AArch32 -cpu max features with AArch64. */
+void aa32_max_features(ARMCPU *cpu)
+{
+    uint32_t t;
+
+    /* Add additional features supported by QEMU */
+    t = cpu->isar.id_isar5;
+    t = FIELD_DP32(t, ID_ISAR5, AES, 2);
+    t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);
+    t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);
+    t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
+    t = FIELD_DP32(t, ID_ISAR5, RDM, 1);
+    t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);
+    cpu->isar.id_isar5 = t;
+
+    t = cpu->isar.id_isar6;
+    t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);
+    t = FIELD_DP32(t, ID_ISAR6, DP, 1);
+    t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
+    t = FIELD_DP32(t, ID_ISAR6, SB, 1);
+    t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
+    t = FIELD_DP32(t, ID_ISAR6, BF16, 1);
+    t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);
+    cpu->isar.id_isar6 = t;
+
+    t = cpu->isar.mvfr1;
+    t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
+    t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
+    cpu->isar.mvfr1 = t;
+
+    t = cpu->isar.mvfr2;
+    t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
+    t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
+    cpu->isar.mvfr2 = t;
+
+    t = cpu->isar.id_mmfr3;
+    t = FIELD_DP32(t, ID_MMFR3, PAN, 2); /* ATS1E1 */
+    cpu->isar.id_mmfr3 = t;
+
+    t = cpu->isar.id_mmfr4;
+    t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
+    t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
+    t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
+    t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
+    cpu->isar.id_mmfr4 = t;
+
+    t = cpu->isar.id_pfr0;
+    t = FIELD_DP32(t, ID_PFR0, DIT, 1);
+    cpu->isar.id_pfr0 = t;
+
+    t = cpu->isar.id_pfr2;
+    t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
+    cpu->isar.id_pfr2 = t;
+
+    t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+    cpu->isar.id_dfr0 = t;
+}
+
 #ifndef CONFIG_USER_ONLY
 static uint64_t l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
@@ -994,7 +1054,6 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
 static void arm_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    uint32_t t;
 
     /* aarch64_a57_initfn, advertising none of the aarch64 features */
     cpu->dtb_compatible = "arm,cortex-a57";
@@ -1035,58 +1094,7 @@ static void arm_max_initfn(Object *obj)
     cpu->ccsidr[2] = 0x70ffe07a; /* 2048KB L2 cache */
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 
-    /* Add additional features supported by QEMU */
-    t = cpu->isar.id_isar5;
-    t = FIELD_DP32(t, ID_ISAR5, AES, 2);
-    t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);
-    t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);
-    t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
-    t = FIELD_DP32(t, ID_ISAR5, RDM, 1);
-    t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);
-    cpu->isar.id_isar5 = t;
-
-    t = cpu->isar.id_isar6;
-    t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);
-    t = FIELD_DP32(t, ID_ISAR6, DP, 1);
-    t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
-    t = FIELD_DP32(t, ID_ISAR6, SB, 1);
-    t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
-    t = FIELD_DP32(t, ID_ISAR6, BF16, 1);
-    t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);
-    cpu->isar.id_isar6 = t;
-
-    t = cpu->isar.mvfr1;
-    t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
-    t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
-    cpu->isar.mvfr1 = t;
-
-    t = cpu->isar.mvfr2;
-    t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
-    t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
-    cpu->isar.mvfr2 = t;
-
-    t = cpu->isar.id_mmfr3;
-    t = FIELD_DP32(t, ID_MMFR3, PAN, 2); /* ATS1E1 */
-    cpu->isar.id_mmfr3 = t;
-
-    t = cpu->isar.id_mmfr4;
-    t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
-    t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
-    t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
-    t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
-    cpu->isar.id_mmfr4 = t;
-
-    t = cpu->isar.id_pfr0;
-    t = FIELD_DP32(t, ID_PFR0, DIT, 1);
-    cpu->isar.id_pfr0 = t;
-
-    t = cpu->isar.id_pfr2;
-    t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
-    cpu->isar.id_pfr2 = t;
-
-    t = cpu->isar.id_dfr0;
-    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
-    cpu->isar.id_dfr0 = t;
+    aa32_max_features(cpu);
 
 #ifdef CONFIG_USER_ONLY
     /*
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09A3504901
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:44:37 +0200 (CEST)
Received: from localhost ([::1]:51622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9sy-0001Qa-EI
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90N-0004O5-3a
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:11 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:46655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90K-00041w-E4
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:10 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 h15-20020a17090a054f00b001cb7cd2b11dso12210984pjf.5
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GHF+a2Qyrz5F/3+6IDTyiWH9/YuVGk55F/V8AQHmA28=;
 b=DrAa0WWw/F/0hcMlPC+j+px3kp/pyL9uHgbgDVXU3yxbIWxmi31xmEBgqKjV6vJE9S
 m5/rAUt0M2tuSvnpKCwixvNRdTgYRxpaj+FMSYXgonxSYbYfxBaOQYpgnI4aZPY/GBLn
 +8NKuSCMvkJ/kEDUsIghAqVc5Yntj6Hdnnxg34/4E2DzzHCgClSp4N65aw3uZ+wsStpm
 uDz4Qj6WvSnw8bOrctAhv/aFn/cIzgRKR2V4xC9uCXAMuPa6R/jgZmC+tiJ7WVpC9lcc
 bYIwCIKsaIqNkgyjEPi15xdMDnb21HI3rKoCdtseML91gpSWoGA5gU2CrXa9DANtibAF
 3Rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GHF+a2Qyrz5F/3+6IDTyiWH9/YuVGk55F/V8AQHmA28=;
 b=scvKIIgnOgk7NbfbGT/RRqyDyf8j1I0gJYmJnY7HISqt6NB6o06hxBRGHcDNCkFhq/
 uQ8jngURGBWXhi2Up3ePkhovKkzhg+i0p/vSibzoGbUyR5Tbw/fI4eqoKRV3q8DovZSJ
 waHm7P2L2nqmtQFm2A+BU27NXnVH5ZohMzg6UbDQfwIzSuyXzB5xQjndTeyhzD2KsGeH
 klBAmEIvFeIaOvdDNSIOOGnWsiKkjFbjkkdnSthbhxz2Hr3AQvNZUgSUHBO3z1QtbW05
 +YCs3GrT+cdGh2cvArXz+pcrOgLlda23RK7smj3ryQ6aNtMxLNXyd8UPKRRsG9afUzVK
 jRrA==
X-Gm-Message-State: AOAM5311uYqmoWytQaSUfNsQgxaGe3cqpRRfLzFtyY/+PNZQFAtYf5CO
 d5xwKgdj5iFxan6AXmSsHen5PjlnCSbD0A==
X-Google-Smtp-Source: ABdhPJwwnlWdVW5obEsVN6Eb9OVCisWStrYrarMmk6bboSPduYjVdBF9826pldQQeMVvyvTAVZUiyA==
X-Received: by 2002:a17:902:b941:b0:14d:af72:3f23 with SMTP id
 h1-20020a170902b94100b0014daf723f23mr7896592pls.6.1650217687176; 
 Sun, 17 Apr 2022 10:48:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 43/60] target/arm: Split out aa32_max_features
Date: Sun, 17 Apr 2022 10:44:09 -0700
Message-Id: <20220417174426.711829-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Share the code to set AArch32 max features so that we no
longer have code drift between qemu{-system,}-{arm,aarch64}.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |   2 +
 target/arm/cpu64.c     |  50 +-----------------
 target/arm/cpu_tcg.c   | 114 ++++++++++++++++++++++-------------------
 3 files changed, 65 insertions(+), 101 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 96a57ee68f..baa2a7e1f4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1301,4 +1301,6 @@ static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
 void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 #endif
 
+void aa32_max_features(ARMCPU *cpu);
+
 #endif
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 67d628c0af..8f9e9d6dff 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -682,7 +682,6 @@ static void aarch64_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint64_t t;
-    uint32_t u;
 
     if (kvm_enabled() || hvf_enabled()) {
         /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
@@ -797,57 +796,12 @@ static void aarch64_max_initfn(Object *obj)
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
index 9aa2f737c1..b0dbf2c991 100644
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



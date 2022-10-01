Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B19A75F1E0C
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 19:04:19 +0200 (CEST)
Received: from localhost ([::1]:44192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefuU-0000mp-S5
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 13:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHr-0007P3-MT
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:23 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:44966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHq-0006Mx-3l
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:23 -0400
Received: by mail-qt1-x82d.google.com with SMTP id f26so4334767qto.11
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=PIHa4426Hp/agSFdW8nii/mkTFfd47hTZ6myTQDFrL4=;
 b=BQ7pt44C1sVEbwBqxlFsjZdpe2Neex0+bbLXjMcr78tItPI/uo1wnUIdxv0VqOFfye
 HIS+1jyJmDW6v9mVlQ95iErD2fCfXRfRc+RNd5+hEqSV2TKkqmaJ/fK5GM/zkKbGvwUP
 EL/C+vrLGAi/bFKgiNgyKwPbx+3JUB845M9P/FQkLIimJOSD5+Wd27745dsseOyAyM8C
 S0GAQuIfIRpJ15+cBSTtF60hqcoXa6b6s0JlQz9uD1DhroqBYo1+WbvoCeFk3TMNkngy
 XZdCkMM3oA9aIinE0UaWznGCKxFl1mFBAw4Lv1+X1TafwrrIOcNRDCZjVdv79iOcjC4L
 zf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PIHa4426Hp/agSFdW8nii/mkTFfd47hTZ6myTQDFrL4=;
 b=QOD+7wlpaYksVd62lOvpkjZ/9njn38ggYHEgCpXK1RFrNI8XVl8TSZEn37LsfqX0yK
 StyYwXwBQRjM+3mJALSGddmIZQzXZO7+Zi5FNx+qCYrwHHNL9htuGDLLo6c1A4AUiyXf
 gPHLtc/a35m6z724coM5nFvQMLLc/ytz7o29mnB9ZJZkWOJ6eoewCDJalVHCf3TCGc8Z
 Hta5TFQnP1VZbPEmBBND6Qz4gee63BweBSY67LiAzkntlde57gQYvhifGstJ/sp6eFIY
 94deLN5PIkg/u7T1eK/6FNahUUOPoQtZSEPvNnlnSwwhpmckA2X/8mRc58Mn7D8QME76
 416g==
X-Gm-Message-State: ACrzQf0Mb83Lh1o5pNiOMSaoILAL9VzKGZ3vRvjx1pLCv486M4c/0dOP
 C69ExZHe/BIk4iAA25RmrGzGdUSFWseseA==
X-Google-Smtp-Source: AMsMyM7SCRv81kk3FHTtCjbA4C030PXq/TBDbWOz8GsCK8n1BQs6a7Pa1k9cDB0dPrvek08jkFVVWg==
X-Received: by 2002:ac8:7f4d:0:b0:35c:b953:185a with SMTP id
 g13-20020ac87f4d000000b0035cb953185amr11071651qtk.382.1664641461036; 
 Sat, 01 Oct 2022 09:24:21 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 24/42] target/arm: Add ARMMMUIdx_Phys_{S,NS}
Date: Sat,  1 Oct 2022 09:23:00 -0700
Message-Id: <20221001162318.153420-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not yet used, but add mmu indexes for 1-1 mapping
to physical addresses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h |  2 +-
 target/arm/cpu.h       |  7 ++++++-
 target/arm/ptw.c       | 19 +++++++++++++++++--
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 689a9645dc..98bd9e435e 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -40,6 +40,6 @@
     bool guarded;
 #endif
 
-#define NB_MMU_MODES 8
+#define NB_MMU_MODES 10
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c8cad2ef7c..0effa85c56 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2899,8 +2899,9 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
  * EL2 EL2&0 +PAN
  * EL2 (aka NS PL2)
  * EL3 (aka S PL1)
+ * Physical (NS & S)
  *
- * for a total of 8 different mmu_idx.
+ * for a total of 10 different mmu_idx.
  *
  * R profile CPUs have an MPU, but can use the same set of MMU indexes
  * as A profile. They only need to distinguish EL0 and EL1 (and
@@ -2965,6 +2966,10 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_E2        = 6 | ARM_MMU_IDX_A,
     ARMMMUIdx_E3        = 7 | ARM_MMU_IDX_A,
 
+    /* TLBs with 1-1 mapping to the physical address spaces. */
+    ARMMMUIdx_Phys_NS   = 8 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_S    = 9 | ARM_MMU_IDX_A,
+
     /*
      * These are not allocated TLBs and are used only for AT system
      * instructions or for the first stage of an S12 page table walk.
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ccfef2caca..05dcacf45b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -179,6 +179,11 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     case ARMMMUIdx_E3:
         break;
 
+    case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_S:
+        /* No translation for physical address spaces. */
+        return true;
+
     default:
         g_assert_not_reached();
     }
@@ -2286,10 +2291,17 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
 {
     uint8_t memattr = 0x00;    /* Device nGnRnE */
     uint8_t shareability = 0;  /* non-sharable */
+    int r_el;
 
-    if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
-        int r_el = regime_el(env, mmu_idx);
+    switch (mmu_idx) {
+    case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_Stage2_S:
+    case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_S:
+        break;
 
+    default:
+        r_el = regime_el(env, mmu_idx);
         if (arm_el_is_aa64(env, r_el)) {
             int pamax = arm_pamax(env_archcpu(env));
             uint64_t tcr = env->cp15.tcr_el[r_el];
@@ -2338,6 +2350,7 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
             shareability = 2; /* outer sharable */
         }
         result->cacheattrs.is_s2_format = false;
+        break;
     }
 
     result->f.phys_addr = address;
@@ -2543,6 +2556,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         is_secure = arm_is_secure_below_el3(env);
         break;
     case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_Phys_NS:
     case ARMMMUIdx_MPrivNegPri:
     case ARMMMUIdx_MUserNegPri:
     case ARMMMUIdx_MPriv:
@@ -2551,6 +2565,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         break;
     case ARMMMUIdx_E3:
     case ARMMMUIdx_Stage2_S:
+    case ARMMMUIdx_Phys_S:
     case ARMMMUIdx_MSPrivNegPri:
     case ARMMMUIdx_MSUserNegPri:
     case ARMMMUIdx_MSPriv:
-- 
2.34.1



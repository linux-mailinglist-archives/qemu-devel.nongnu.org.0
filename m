Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660165FAB25
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 05:26:06 +0200 (CEST)
Received: from localhost ([::1]:56848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi5u9-0005v7-FP
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 23:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nn-0002Fo-BJ
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:31 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:55196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5ng-000303-Ny
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:29 -0400
Received: by mail-pj1-x1033.google.com with SMTP id 70so11340442pjo.4
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mWDabj8SgVJfh97qu1fcwAspA+xawk95sTUJ2LXWBU0=;
 b=Xhwy+Zx7mB1Fo5Xh0Hs5juMXdyr0PvRVPOOeV9zCxYUuFgh8QcJCDSDOdxka634t73
 KUaxzpi3kP5jQtZ6qcExrECAsehIXzwhUClvGGHsKkyHTWNuaMlVTTHrOhdmlCAysGWM
 A6tLEa4AKtDRPOla5EKuJr9NSMrLVE0X0cwld1B+vTIuZqpbo2JzJwupAkKl9ATew5lC
 2h4v3YRN/B/dbcrSnBrQqYG3Cw/1HiYsi7nC627cBLSipjFwX8d4XSkoEioaGPotR/IB
 ba4tQya40ce7tHprv366XUuGh+4/Z8MHrdW0uGjdOCQbn9x+zq8FlJUqC1gc2v+D9AjO
 M+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mWDabj8SgVJfh97qu1fcwAspA+xawk95sTUJ2LXWBU0=;
 b=cq013j9wmORCCn+XPYe8Oymh93GvLvUg7DhzItgYwb1ZImrKDRl4h0byMxxWm835uR
 WCUpJO2eHi/QdCEPX+QoXK6YT4E2di9mvNgCxhNY330o6heIflx1i4hT5xTgUajTW9Zl
 lWWk8hzEIEdX1DIU1mWM2q1iCJK7tsjD8LYm8bvfbNUK2YU40oQY1D+5H4ut/pX4rl+H
 uLkr/9JOQC9ZKjsKJZLfbYEY/BElO2JHMC7d43vDiDKIGbM/zPqbKsOUOVoPDzR2XAx+
 VT6CDO4qAlBDjB+76YFkEbKRH/tXg+AXu+P+12oQnD04KqZvmm5jn6GDdGbejPnS526z
 dgww==
X-Gm-Message-State: ACrzQf09/2hk5m36/AAOR5VWa1c1En9el0gmeD1ZATAdvjWNqtVNlm6X
 RoCQUZvruO4jW4mmwN6If+tJneYODk2b5A==
X-Google-Smtp-Source: AMsMyM5EHeuhZWY1JL3K2GmOSzJAaFhpgonWuAT5h06X6n7ldElVBqMtVjDBjKRPTeRlSjfKjJb9jw==
X-Received: by 2002:a17:90a:a401:b0:20a:da56:b073 with SMTP id
 y1-20020a17090aa40100b0020ada56b073mr24874910pjp.1.1665458359771; 
 Mon, 10 Oct 2022 20:19:19 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 04/24] target/arm: Add ARMMMUIdx_Phys_{S,NS}
Date: Mon, 10 Oct 2022 20:18:51 -0700
Message-Id: <20221011031911.2408754-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h |  2 +-
 target/arm/cpu.h       |  7 ++++++-
 target/arm/ptw.c       | 19 +++++++++++++++++--
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index f4338fd10e..a5b27db275 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -45,6 +45,6 @@
     bool guarded;
 #endif
 
-#define NB_MMU_MODES 8
+#define NB_MMU_MODES 10
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a34d496c5b..f93060e6d6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2905,8 +2905,9 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
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
@@ -2971,6 +2972,10 @@ typedef enum ARMMMUIdx {
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
index 2d182d62e5..a977d09c6d 100644
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
@@ -2280,10 +2285,17 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
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
@@ -2332,6 +2344,7 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
             shareability = 2; /* outer sharable */
         }
         result->cacheattrs.is_s2_format = false;
+        break;
     }
 
     result->f.phys_addr = address;
@@ -2536,6 +2549,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         is_secure = arm_is_secure_below_el3(env);
         break;
     case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_Phys_NS:
     case ARMMMUIdx_MPrivNegPri:
     case ARMMMUIdx_MUserNegPri:
     case ARMMMUIdx_MPriv:
@@ -2544,6 +2558,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         break;
     case ARMMMUIdx_E3:
     case ARMMMUIdx_Stage2_S:
+    case ARMMMUIdx_Phys_S:
     case ARMMMUIdx_MSPrivNegPri:
     case ARMMMUIdx_MSUserNegPri:
     case ARMMMUIdx_MSPriv:
-- 
2.34.1



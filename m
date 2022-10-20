Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D8960651F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:55:46 +0200 (CEST)
Received: from localhost ([::1]:41202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXtZ-000702-3f
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:55:45 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXrq-0005nu-JN
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYl-0001Mg-Mt
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:12 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYf-0000yX-U8
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:03 -0400
Received: by mail-wr1-x429.google.com with SMTP id bv10so34050391wrb.4
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=j1O26A+kb8h/YpGBTgaK1K4C7IHLP3fLpSe8IuUkIv4=;
 b=muHMskTdXNkAUdeQ6WLxYcEHM8f2fKPVCZclYpWQ4DbNYCktS6Aq8SZxkHXNuFYfUW
 YUTNwl9nOZ9C2flnMU4IuVfXs/6nodR+nR3aVvJltQWUnnqkrl/Bw+9V3f65ISyK8IR5
 1T/xqBYfrrSYExjlm7esuf3pZ7u/Fj71mwXZrAQ8UAlmxc7aZp39B+srTpg792Ik0/zW
 OKrBiFocqBkSmyOFWm+6cwERSDF7BpsiFQ2ymUK4SmSxQMc6T2GRiJ0ZH4JiMSIJ4Fnx
 oXLu3yyf1rw1V+yd427N+VP8nnC6/KSlGLdchTOlR9JOgWMTeR1MT3zH5gkWfmj44fpE
 AojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j1O26A+kb8h/YpGBTgaK1K4C7IHLP3fLpSe8IuUkIv4=;
 b=tLGJJYlcxuOZw2+riAFpBgVT82n6r9jib5Yn+YU8PS8bbFRCnmbdF3la/CEurj9ejh
 D6PHM1SzBLwPYuIAf9Dp3+PR15Z76bjq9JBJziOYKjoXIZPmUCZKRuh1XdZKI/YtB0vN
 5n2VE6CFidT0wSE4JSExKPlYM+7hW3TJF3QvGiaPPqLJDMMQXss55Woub3YIXpymQxco
 fyKpWIv8g/1QG6z+af5xBFhaVwcw2uow6HvlCXLMmAFrWBb7sYBJiQ6QGKN8XINPCqCq
 Jj2hEi1TkKLx20CnbVbQ3lMdc7N5nSkU6IBB5Q9GxcimPd8J72RFRHvR1rWPm1XPjs+N
 xyQQ==
X-Gm-Message-State: ACrzQf1hiEmOUec/wgvpPVOPJv7hOnrOKM5TwTM476qSPSRtfc9KhStk
 iZwdUEnY2ZLi9I1yhxk5AGCGBCgrCb45Bg==
X-Google-Smtp-Source: AMsMyM4MLZ/v47rJTAJwOacuwzN8JEDmAbqcRbEy/TSi0DC8xPGfPdYmgq0IwypOqKocNsKbWJmO/Q==
X-Received: by 2002:a5d:588e:0:b0:22e:5601:f6d with SMTP id
 n14-20020a5d588e000000b0022e56010f6dmr8458631wrf.207.1666268516555; 
 Thu, 20 Oct 2022 05:21:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.21.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:21:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/24] target/arm: Add ARMMMUIdx_Phys_{S,NS}
Date: Thu, 20 Oct 2022 13:21:28 +0100
Message-Id: <20221020122146.3177980-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Not yet used, but add mmu indexes for 1-1 mapping
to physical addresses.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221011031911.2408754-5-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-param.h |  2 +-
 target/arm/cpu.h       |  7 ++++++-
 target/arm/ptw.c       | 19 +++++++++++++++++--
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index f4338fd10e4..a5b27db2751 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -45,6 +45,6 @@
     bool guarded;
 #endif
 
-#define NB_MMU_MODES 8
+#define NB_MMU_MODES 10
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9df7adbe81f..b185f39bf5b 100644
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
index 2d182d62e5a..a977d09c6d5 100644
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
2.25.1



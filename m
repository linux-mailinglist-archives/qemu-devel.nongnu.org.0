Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B22B564664
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:21:56 +0200 (CEST)
Received: from localhost ([::1]:56460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vnf-0001Pj-J5
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzC-0000M3-Qx
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:29:46 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:33684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uz9-0006g3-S8
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:29:46 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 j1-20020a17090aeb0100b001ef777a7befso1353342pjz.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2GREabbEg+nDIDAuvpznWWqWDzHWosOK+NnY9rFGuOE=;
 b=ZvUEkPZpWXWtBAkQaMCS/tYuuu4ZYd0Y3JEZr8wTZWqg57dShVzKxiZWYis2lIkC5c
 V9ySmkPVaO+ZK7ElRo1/x6OghG/vVWW8DKgM7O71/GLI1pZ61Pwnqi6kT8taa+Cbd1uB
 cjhExKpXvDPe2ap0QlWpxMQTvrLkjkSyamHAaOVNevCoH7rYpKO+HOWmy3Hnf2O0cd54
 58R3fmlLLtlO/aqUfUK/tIyuaAysG0RSpX7ZB2/vrVg1iuYamts9CNVZcXc7migu1z0D
 iuCL4ecaab/wDCYJ9ioV2QxFUPR7NJa0GVqyF5Qd/GQhTk45BqDLxyNgrL01i3Dzwwea
 /b4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2GREabbEg+nDIDAuvpznWWqWDzHWosOK+NnY9rFGuOE=;
 b=esqaJYV1UcobLr8y8y8XqIk1DTfB+ZS8Gyu7uxJM7MXjKIr8tXpe8+DYku0ezXfxd9
 wpSARwa5frHAe7w0jMlJuOG3NYAzDj2SvHJud8+ud9T9/Izz2i6PW+r3dSbss/vd6ipY
 oP6cw4RwBl0BNqpf9+gzvkHLgTcDHMg7LdG1QPwk79M72YWhqSq8sYokVRyLa8z7QBPk
 6MW2WfcyJNIIawftNioM8OkXqUkeSTtTbtbqP5R18I2VLMSDn0eCfEb/EwI6ecGh+EmG
 IlCfvFWv+VSl5xcRs60vB3hrqUBFGyE4IiTiKaW8ubYy2i+/DmyqGPhQ7668QwdPjlVg
 U0TA==
X-Gm-Message-State: AJIora+H+O/smCPznCEiYdMW6331EQvvDfy5Zu6itlBZN1kabrK2KYlN
 Poi50ruxJqGPtE4qbY+P7QSO4NJBByoxbLL2
X-Google-Smtp-Source: AGRyM1tdMScX0GmoVmf5H1AZNAdtT2vUzaqtMl2nvUkLrIJD+NnkWKICMHqprt1cfAIexrAmFraREw==
X-Received: by 2002:a17:902:dac3:b0:16b:914a:81ba with SMTP id
 q3-20020a170902dac300b0016b914a81bamr26663447plx.19.1656836982539; 
 Sun, 03 Jul 2022 01:29:42 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:29:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 44/62] target/arm: Add ARMMMUIdx_Phys_{S,NS}
Date: Sun,  3 Jul 2022 13:54:01 +0530
Message-Id: <20220703082419.770989-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Not yet used, but add mmu indexes for 1-1 mapping
to physical addresses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h | 2 +-
 target/arm/cpu.h       | 4 ++++
 target/arm/ptw.c       | 9 +++++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 6f702f58d9..931808f2e7 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -40,6 +40,6 @@ struct PageEntryExtra {
 };
 #endif
 
-#define NB_MMU_MODES 8
+#define NB_MMU_MODES 10
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index dd577a08bc..c5aec164ba 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2934,6 +2934,10 @@ typedef enum ARMMMUIdx {
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
index 3a098882a6..7510a9276a 100644
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
@@ -2284,6 +2289,8 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     switch (mmu_idx) {
     case ARMMMUIdx_Stage2:
     case ARMMMUIdx_Stage2_S:
+    case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_S:
         memattr = 0x00;    /* unused, but Device, nGnRnE */
         shareability = 0;  /* unused, but non-shareable */
         break;
@@ -2574,6 +2581,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         is_secure = arm_is_secure_below_el3(env);
         break;
     case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_Phys_NS:
     case ARMMMUIdx_MPrivNegPri:
     case ARMMMUIdx_MUserNegPri:
     case ARMMMUIdx_MPriv:
@@ -2582,6 +2590,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         break;
     case ARMMMUIdx_E3:
     case ARMMMUIdx_Stage2_S:
+    case ARMMMUIdx_Phys_S:
     case ARMMMUIdx_MSPrivNegPri:
     case ARMMMUIdx_MSUserNegPri:
     case ARMMMUIdx_MSPriv:
-- 
2.34.1



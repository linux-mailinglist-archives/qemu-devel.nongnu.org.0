Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0C765F15F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:46:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTLw-0000Qa-4k; Thu, 05 Jan 2023 11:44:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLt-0000Jl-6v
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:25 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLr-0007Lt-Di
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:24 -0500
Received: by mail-wm1-x334.google.com with SMTP id g10so14660734wmo.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ucC6r0jcHK+UNQ8eQHcmxpwSVgcMH/k1pFOZLGUGlEY=;
 b=E8DRv8Nu4ixugWfK7FytBuxghTiwZxfIA8v2FkhXE8xQW7boVkVkF+ANXVyqrfEvS5
 ubCGchzYN2aFeHm2tR8DMack6HoC4RTfYINzGn5FJbUIlsOgXpes59SFRZv8zLMu7r7M
 U/qGrPyF2LhtYeQpK0x8yey/snnryI4Zs+TGyyxvlV6OgaD3PHyO74AorODaxr+cwdZO
 9pldvRk+3pujN/t0Bdaz0Uqx54ussUqGnGUAbaVhSJdWFcSd6oND7W6W6TX8AAUbXTra
 dqmmZd6URkVBFjRQW7ut8d64eXaLcogbiDEWfqeC1K7NM0O7rPzqfO7B8sSNHXNZN0jA
 GsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ucC6r0jcHK+UNQ8eQHcmxpwSVgcMH/k1pFOZLGUGlEY=;
 b=k6IFLW31DlujVtfe5jGPfK14UTSYonEHLMIix3qn1i95baCleqeskSwxvc9MXGqo+v
 Ai3iGlez4gmZT3OTwRXg/R1kYBQsyCr3kyJLtoLl+EYC/bklUvfEGJFY0GJOuKmQOOAF
 +mV/SVKmJZBR87Cv7VPPV1qk1hKtN9EQB0DnClDIm106MPFEjUO24v8uyQJ0C0s1V5sm
 IjMx8JB9Akn733dhF3FM/978fleK9vrqJ71tDNKGh4dX0R0NwULbtNZoWD33CqsMm7Ao
 fjg2h/n3+6+jVhZ8gIOmx6FFgpG3zndJlnfnf2DAZqkTue1mfjjLXnbwtd2whpmjE+SX
 FMtA==
X-Gm-Message-State: AFqh2kp+qdvxEA8NMNqYA1yPlOgzfgLjUL1JaSvxVyl5rob8VMlvPrEm
 SvJElAPs49Z5cm8LVBrLcq9TG5bIU9Gt55vi
X-Google-Smtp-Source: AMrXdXto36llWOpExNMpE5Z+3GJjwOgXwv5gBQUwX+6BD5D8g8CnoApIoq342GBEd/LPNLhyi7L9Bw==
X-Received: by 2002:a7b:ca4f:0:b0:3d3:56ce:5673 with SMTP id
 m15-20020a7bca4f000000b003d356ce5673mr39142433wml.6.1672937061813; 
 Thu, 05 Jan 2023 08:44:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/34] target/arm: Make RVBAR available for all ARMv8 CPUs
Date: Thu,  5 Jan 2023 16:43:46 +0000
Message-Id: <20230105164417.3994639-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

RVBAR shadows RVBAR_ELx where x is the highest exception
level if the highest EL is not EL3. This patch also allows
ARMv8 CPUs to change the reset address with
the rvbar property.

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20221206102504.165775-3-tobias.roehmel@rwth-aachen.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c    |  6 +++++-
 target/arm/helper.c | 21 ++++++++++++++-------
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2fa022f62ba..c107cbd7574 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -309,6 +309,10 @@ static void arm_cpu_reset_hold(Object *obj)
         env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
                                          CPACR, CP11, 3);
 #endif
+        if (arm_feature(env, ARM_FEATURE_V8)) {
+            env->cp15.rvbar = cpu->rvbar_prop;
+            env->regs[15] = cpu->rvbar_prop;
+        }
     }
 
 #if defined(CONFIG_USER_ONLY)
@@ -1345,7 +1349,7 @@ void arm_cpu_post_init(Object *obj)
         qdev_property_add_static(DEVICE(obj), &arm_cpu_reset_hivecs_property);
     }
 
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+    if (arm_feature(&cpu->env, ARM_FEATURE_V8)) {
         object_property_add_uint64_ptr(obj, "rvbar",
                                        &cpu->rvbar_prop,
                                        OBJ_PROP_FLAG_READWRITE);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 090daf93c71..d8066fe97d3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7896,7 +7896,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         if (!arm_feature(env, ARM_FEATURE_EL3) &&
             !arm_feature(env, ARM_FEATURE_EL2)) {
             ARMCPRegInfo rvbar = {
-                .name = "RVBAR_EL1", .state = ARM_CP_STATE_AA64,
+                .name = "RVBAR_EL1", .state = ARM_CP_STATE_BOTH,
                 .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
                 .access = PL1_R,
                 .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
@@ -7987,13 +7987,20 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         }
         /* RVBAR_EL2 is only implemented if EL2 is the highest EL */
         if (!arm_feature(env, ARM_FEATURE_EL3)) {
-            ARMCPRegInfo rvbar = {
-                .name = "RVBAR_EL2", .state = ARM_CP_STATE_AA64,
-                .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 1,
-                .access = PL2_R,
-                .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
+            ARMCPRegInfo rvbar[] = {
+                {
+                    .name = "RVBAR_EL2", .state = ARM_CP_STATE_AA64,
+                    .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 1,
+                    .access = PL2_R,
+                    .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
+                },
+                {   .name = "RVBAR", .type = ARM_CP_ALIAS,
+                    .cp = 15, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
+                    .access = PL2_R,
+                    .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
+                },
             };
-            define_one_arm_cp_reg(cpu, &rvbar);
+            define_arm_cp_regs(cpu, rvbar);
         }
     }
 
-- 
2.25.1



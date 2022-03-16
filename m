Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71724DB6BF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 17:53:44 +0100 (CET)
Received: from localhost ([::1]:44244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUWu7-0008By-R0
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 12:53:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nUWnU-00005A-OU; Wed, 16 Mar 2022 12:46:52 -0400
Received: from [2a00:1450:4864:20::136] (port=34682
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nUWnS-0006EA-VX; Wed, 16 Mar 2022 12:46:52 -0400
Received: by mail-lf1-x136.google.com with SMTP id e6so4760318lfc.1;
 Wed, 16 Mar 2022 09:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wXJE+8HKm+WH7eENzYRh+zhqdDgAS72bn3B7Q+jWeS8=;
 b=JeJUIbT9x29lYryN9qbT2FQWzH2l8ASsx9DVE3tK5L7EK72GagCCWwduWVGM2FI28k
 xRwhlLiEhVf40QjADiuwiRuD5RShznnkCnCceEFqdRCwuIhbnicWjh/TritXvosVg09Q
 rNC1KYly16AtMYOahKVZoYcxP0TKFVWh30SS6cpRQDfvQR/z3GpNxaeLWyKMZKX+ofsu
 wl0oNzUpCthDCDQgTMqziuhzp4/vzS304LF17PlFAaQKMhJtH4eXT7QJFWA8yyxCMxRy
 HjLLU7J/+AYR5WhoWF2ju4qxs178aCix65afyDumzQNPU2jLC7wsYaRdbbRfkvLhPvw6
 jO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wXJE+8HKm+WH7eENzYRh+zhqdDgAS72bn3B7Q+jWeS8=;
 b=3bFMXoKISK+7cFO18rTPzhdAZqqDVujRdrBJwhGEQVjMHGorySflkbdBMAfaSZPpUc
 UgM8B07Izqa1stgVB2ceFWTOOII05fYOxalf2bMMC0zzoT89+DRJyE5yXfKsjOvWLt8i
 G4c7GRngdqw4nrV8P/TzTtiRxT4njM9x0yxcBNcAiOh0jUbLTAULS1Lt4hAvFGH7IZ6O
 dD84n5bdPTUyRSg8JAZWbzfCBxgDCiC0dSYMXoWWwQH6WkDIRXbiF0mzc0iAMERD7aeg
 upEc7tnqShp27f6cw5pEH/KtB3DzUSS64c5zZF2+V33L/OZ3pZLvmxnElr2LykjsU/cV
 EmIQ==
X-Gm-Message-State: AOAM532Zgmk5Mm4aAwxPALZIjx9XOFtCWaSLxTARlfsbnqpfcg1O+Wmi
 1imGsZL/Ws8gGPIwRYbkyZ46aIS/uukqug==
X-Google-Smtp-Source: ABdhPJzuHifk/HrRguStZ+QGDkmV1uU2kRp5F69RFH2crzjvsU7p1prbo0ggBIymN9ZbljNEmjMgxg==
X-Received: by 2002:ac2:5fc9:0:b0:448:5df6:5941 with SMTP id
 q9-20020ac25fc9000000b004485df65941mr282433lfg.281.1647449208907; 
 Wed, 16 Mar 2022 09:46:48 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a2e8751000000b00244beaacef1sm218923ljj.18.2022.03.16.09.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 09:46:48 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/6] target/arm: Make rvbar settable after realize
Date: Wed, 16 Mar 2022 17:46:41 +0100
Message-Id: <20220316164645.2303510-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316164645.2303510-1-edgar.iglesias@gmail.com>
References: <20220316164645.2303510-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::136
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org, f4bug@amsat.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Make the rvbar property settable after realize. This is done
in preparation to model the ZynqMP's runtime configurable rvbar.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/arm/cpu.h    |  3 ++-
 target/arm/cpu.c    | 12 +++++++-----
 target/arm/helper.c | 10 +++++++---
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 157f214cce..23879de5fa 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -447,6 +447,7 @@ typedef struct CPUArchState {
             uint64_t vbar_el[4];
         };
         uint32_t mvbar; /* (monitor) vector base address register */
+        uint64_t rvbar; /* rvbar sampled from rvbar property at reset */
         struct { /* FCSE PID. */
             uint32_t fcseidr_ns;
             uint32_t fcseidr_s;
@@ -985,7 +986,7 @@ struct ArchCPU {
 
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
     uint32_t dcz_blocksize;
-    uint64_t rvbar;
+    uint64_t rvbar_prop; /* Property/input signals.  */
 
     /* Configurable aspects of GIC cpu interface (which is part of the CPU) */
     int gic_num_lrs; /* number of list registers */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 185d4e774d..cd2c1fc7da 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -235,7 +235,10 @@ static void arm_cpu_reset(DeviceState *dev)
         } else {
             env->pstate = PSTATE_MODE_EL1h;
         }
-        env->pc = cpu->rvbar;
+
+        /* Sample rvbar at reset.  */
+        env->cp15.rvbar = cpu->rvbar_prop;
+        env->pc = env->cp15.rvbar;
 #endif
     } else {
 #if defined(CONFIG_USER_ONLY)
@@ -1130,9 +1133,6 @@ static Property arm_cpu_reset_cbar_property =
 static Property arm_cpu_reset_hivecs_property =
             DEFINE_PROP_BOOL("reset-hivecs", ARMCPU, reset_hivecs, false);
 
-static Property arm_cpu_rvbar_property =
-            DEFINE_PROP_UINT64("rvbar", ARMCPU, rvbar, 0);
-
 #ifndef CONFIG_USER_ONLY
 static Property arm_cpu_has_el2_property =
             DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, true);
@@ -1235,7 +1235,9 @@ void arm_cpu_post_init(Object *obj)
     }
 
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_rvbar_property);
+        object_property_add_uint64_ptr(obj, "rvbar",
+                                       &cpu->rvbar_prop,
+                                       OBJ_PROP_FLAG_READWRITE);
     }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 088956eecf..210db501f1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7967,7 +7967,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             ARMCPRegInfo rvbar = {
                 .name = "RVBAR_EL1", .state = ARM_CP_STATE_AA64,
                 .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
-                .type = ARM_CP_CONST, .access = PL1_R, .resetvalue = cpu->rvbar
+                .access = PL1_R,
+                .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
             };
             define_one_arm_cp_reg(cpu, &rvbar);
         }
@@ -8011,7 +8012,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             ARMCPRegInfo rvbar = {
                 .name = "RVBAR_EL2", .state = ARM_CP_STATE_AA64,
                 .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 1,
-                .type = ARM_CP_CONST, .access = PL2_R, .resetvalue = cpu->rvbar
+                .access = PL2_R,
+                .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
             };
             define_one_arm_cp_reg(cpu, &rvbar);
         }
@@ -8048,7 +8050,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         ARMCPRegInfo el3_regs[] = {
             { .name = "RVBAR_EL3", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 6, .crn = 12, .crm = 0, .opc2 = 1,
-              .type = ARM_CP_CONST, .access = PL3_R, .resetvalue = cpu->rvbar },
+              .access = PL3_R,
+              .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
+            },
             { .name = "SCTLR_EL3", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 0, .opc2 = 0,
               .access = PL3_RW,
-- 
2.25.1



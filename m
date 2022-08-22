Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 341C559C19E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 16:29:40 +0200 (CEST)
Received: from localhost ([::1]:51474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ8Qt-0004BK-5u
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 10:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PX-00068b-Ar
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:24:11 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PV-0001fX-DY
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:24:11 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 k18-20020a05600c0b5200b003a5dab49d0bso6002857wmr.3
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 06:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=2fxzttXpNNgLe45+/J1iHDaTona/8trrZi4UUTNeBEw=;
 b=ymXq/t4+CxC7iLNQjPnrRutYPX9C0BXYGDSodwm/nS95FjrkTWPxWipFUl8V4L8a/B
 RO3za+0yxfvjqRGur21FDoXSw3Slz7uqjLRtY1MoNVftRy248XzVeTVGY0spLtSRxc0m
 Gq6n4ZaHV0ybD3/GOxejejJGWKjocgSvkjx+Zrj2Hm+U/tOrHqGKL66XMHuh118jppSB
 J25okUlIVC5ttLmsMsHXKcSmpg+On4asVQ8lrdYiHmauxobViiHHojIZtGPQwk3EhQTx
 s2l3WV6faKQ+S4UCtaKJKzHXIvvjEM4TIZlTJaQhYzGqde66TCa5HYNavXJLdhfXVmC4
 na0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=2fxzttXpNNgLe45+/J1iHDaTona/8trrZi4UUTNeBEw=;
 b=1NlkpkdOcTpmxgZCLcAZe2YlB6m0RkoB9nyXqc4aaofGShKiEUK45l8ZPi02AwnYyz
 gYozcK/XcEd2LvTBUGX8Q4AYJAIFme2AxJBRIxmiUOKez6uxsmjPtljqIISC2ogOYeCV
 LcAAfPVRYBBrwtwrg1ZdaWVwXmxmGlBJawlOOmibqhZcHu0MgTyL0QPkU9OKH3iYPRQl
 7HZBlvTauakQVvfNNQ4IEQUM155BFvfM3XGGGJjo1DFsOV14nIWLDxx8Lu8y3t3LHLWH
 WMoNcVOwipfGxgW0Xjb5G+tdsClWUPIPHqbcYA/+zS4Y2RcSuKeC74qWXCIoneonihM/
 E4dA==
X-Gm-Message-State: ACgBeo25EdcVVu4xERJiyftqwhhYQjeaZNS0/5x3VTTB874JxDBOyb37
 A2Rc5fGqy8esquGkKdvPcDGPe+5p/fnGGQ==
X-Google-Smtp-Source: AA6agR6JD98izczqkbVeTbsEjTXrs62dQlj1+hVgi/cKymIHygyaVra8x3nBoO4lwY1j6YBb0F0pVw==
X-Received: by 2002:a05:600c:2909:b0:3a6:2ef5:772e with SMTP id
 i9-20020a05600c290900b003a62ef5772emr10160010wmd.16.1661174647726; 
 Mon, 22 Aug 2022 06:24:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020adff98c000000b0021f13097d6csm11527946wrr.16.2022.08.22.06.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 06:24:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 07/10] target/arm: Rename pmu_8_n feature test functions
Date: Mon, 22 Aug 2022 14:23:55 +0100
Message-Id: <20220822132358.3524971-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822132358.3524971-1-peter.maydell@linaro.org>
References: <20220822132358.3524971-1-peter.maydell@linaro.org>
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

Our feature test functions that check the PMU version are named
isar_feature_{aa32,aa64,any}_pmu_8_{1,4}.  This doesn't match the
current Arm ARM official feature names, which are FEAT_PMUv3p1 and
FEAT_PMUv3p4.  Rename these functions to _pmuv3p1 and _pmuv3p4.

This commit was created with:
  sed -i -e 's/pmu_8_/pmuv3p/g' target/arm/*.[ch]

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 16 ++++++++--------
 target/arm/helper.c | 18 +++++++++---------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5168e3d837e..122ec8a47ec 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3710,14 +3710,14 @@ static inline bool isar_feature_aa32_ats1e1(const ARMISARegisters *id)
     return FIELD_EX32(id->id_mmfr3, ID_MMFR3, PAN) >= 2;
 }
 
-static inline bool isar_feature_aa32_pmu_8_1(const ARMISARegisters *id)
+static inline bool isar_feature_aa32_pmuv3p1(const ARMISARegisters *id)
 {
     /* 0xf means "non-standard IMPDEF PMU" */
     return FIELD_EX32(id->id_dfr0, ID_DFR0, PERFMON) >= 4 &&
         FIELD_EX32(id->id_dfr0, ID_DFR0, PERFMON) != 0xf;
 }
 
-static inline bool isar_feature_aa32_pmu_8_4(const ARMISARegisters *id)
+static inline bool isar_feature_aa32_pmuv3p4(const ARMISARegisters *id)
 {
     /* 0xf means "non-standard IMPDEF PMU" */
     return FIELD_EX32(id->id_dfr0, ID_DFR0, PERFMON) >= 5 &&
@@ -4036,13 +4036,13 @@ static inline bool isar_feature_aa64_sme(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SME) != 0;
 }
 
-static inline bool isar_feature_aa64_pmu_8_1(const ARMISARegisters *id)
+static inline bool isar_feature_aa64_pmuv3p1(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 4 &&
         FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
 }
 
-static inline bool isar_feature_aa64_pmu_8_4(const ARMISARegisters *id)
+static inline bool isar_feature_aa64_pmuv3p4(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 5 &&
         FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
@@ -4211,14 +4211,14 @@ static inline bool isar_feature_any_predinv(const ARMISARegisters *id)
     return isar_feature_aa64_predinv(id) || isar_feature_aa32_predinv(id);
 }
 
-static inline bool isar_feature_any_pmu_8_1(const ARMISARegisters *id)
+static inline bool isar_feature_any_pmuv3p1(const ARMISARegisters *id)
 {
-    return isar_feature_aa64_pmu_8_1(id) || isar_feature_aa32_pmu_8_1(id);
+    return isar_feature_aa64_pmuv3p1(id) || isar_feature_aa32_pmuv3p1(id);
 }
 
-static inline bool isar_feature_any_pmu_8_4(const ARMISARegisters *id)
+static inline bool isar_feature_any_pmuv3p4(const ARMISARegisters *id)
 {
-    return isar_feature_aa64_pmu_8_4(id) || isar_feature_aa32_pmu_8_4(id);
+    return isar_feature_aa64_pmuv3p4(id) || isar_feature_aa32_pmuv3p4(id);
 }
 
 static inline bool isar_feature_any_ccidx(const ARMISARegisters *id)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 94307a6c417..5212750b378 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -879,16 +879,16 @@ static int64_t instructions_ns_per(uint64_t icount)
 }
 #endif
 
-static bool pmu_8_1_events_supported(CPUARMState *env)
+static bool pmuv3p1_events_supported(CPUARMState *env)
 {
     /* For events which are supported in any v8.1 PMU */
-    return cpu_isar_feature(any_pmu_8_1, env_archcpu(env));
+    return cpu_isar_feature(any_pmuv3p1, env_archcpu(env));
 }
 
-static bool pmu_8_4_events_supported(CPUARMState *env)
+static bool pmuv3p4_events_supported(CPUARMState *env)
 {
     /* For events which are supported in any v8.1 PMU */
-    return cpu_isar_feature(any_pmu_8_4, env_archcpu(env));
+    return cpu_isar_feature(any_pmuv3p4, env_archcpu(env));
 }
 
 static uint64_t zero_event_get_count(CPUARMState *env)
@@ -922,17 +922,17 @@ static const pm_event pm_events[] = {
     },
 #endif
     { .number = 0x023, /* STALL_FRONTEND */
-      .supported = pmu_8_1_events_supported,
+      .supported = pmuv3p1_events_supported,
       .get_count = zero_event_get_count,
       .ns_per_count = zero_event_ns_per,
     },
     { .number = 0x024, /* STALL_BACKEND */
-      .supported = pmu_8_1_events_supported,
+      .supported = pmuv3p1_events_supported,
       .get_count = zero_event_get_count,
       .ns_per_count = zero_event_ns_per,
     },
     { .number = 0x03c, /* STALL */
-      .supported = pmu_8_4_events_supported,
+      .supported = pmuv3p4_events_supported,
       .get_count = zero_event_get_count,
       .ns_per_count = zero_event_ns_per,
     },
@@ -6400,7 +6400,7 @@ static void define_pmu_regs(ARMCPU *cpu)
         g_free(pmevtyper_name);
         g_free(pmevtyper_el0_name);
     }
-    if (cpu_isar_feature(aa32_pmu_8_1, cpu)) {
+    if (cpu_isar_feature(aa32_pmuv3p1, cpu)) {
         ARMCPRegInfo v81_pmu_regs[] = {
             { .name = "PMCEID2", .state = ARM_CP_STATE_AA32,
               .cp = 15, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 4,
@@ -6413,7 +6413,7 @@ static void define_pmu_regs(ARMCPU *cpu)
         };
         define_arm_cp_regs(cpu, v81_pmu_regs);
     }
-    if (cpu_isar_feature(any_pmu_8_4, cpu)) {
+    if (cpu_isar_feature(any_pmuv3p4, cpu)) {
         static const ARMCPRegInfo v84_pmmir = {
             .name = "PMMIR_EL1", .state = ARM_CP_STATE_BOTH,
             .opc0 = 3, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 6,
-- 
2.25.1



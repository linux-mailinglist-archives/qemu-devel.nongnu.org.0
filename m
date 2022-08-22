Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D62C359C0A3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 15:33:35 +0200 (CEST)
Received: from localhost ([::1]:42540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ7Yc-0002EX-Sp
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 09:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PY-0006B9-8A
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:24:12 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PW-0001fz-9M
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:24:11 -0400
Received: by mail-wm1-x329.google.com with SMTP id ay12so5591462wmb.1
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 06:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=rApZciN4LfzjQtxbWJQ3PAJs2Z/3UIZwNKUKuZ8hIWY=;
 b=yn9FlDbtUEcwW2JlMo1uLjPzsumfLANIp57s2SO1LCsUTuKEZ5/hvZG+VPmP3c4X4a
 qPwcW9Wcky3+m44iUKTJbEG+chRiqw2pLK5OzzV4sRY+MXGWzdLkuv2gPeceeWoIeP5n
 0mDgUgRHuiZfLVlncRZiOCMggdTzLmMvF9efHrS/ZTSrUGnVjKI30ptVX9HWecxhJJ5p
 G23cHIf5vIXJx/XA/k/OMDNlyHNXuY3c8qgursi24b4MD6GqZQjxI13PJdbWri3TgHlX
 jJedmp7W3bCFETeG0qS2N4QL4Rvf0mYDqaVK+eqDievUj97Tye0Lu259vUvvkJwbWYLL
 O3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rApZciN4LfzjQtxbWJQ3PAJs2Z/3UIZwNKUKuZ8hIWY=;
 b=mhOPXr1M7DrMijFN//aN+LfH23WEL+vG/vTgghjfZPDHRpPCq0opZ7Sc6Qg5gTytYn
 onqagb//Dfs18B3l/jpfhSuaXTseiM6PncMV85jyfyIV+gDOjCmDbk2wNPjyVwrxZEPs
 Ua0ovgpTQOGWmdMSZhhbJbtKNvAE7XSX5V2nCNHoB/LeCwXeHrKvrkdAacCKMhQQJ3QM
 8M0Ok+PPUmiHADcWyWKppeu1MISTzVRVODmHWvZJZwNjk27BX9dovY3fkpUhDvfLz1qr
 xIxV0RW/8v24M3JIfm1+xqeDedNHNvbKDS/SFjZnAB5rqFZE7r0qjYWK4XRrJbrR4NWM
 xapA==
X-Gm-Message-State: ACgBeo0yI/ocxWljegRN2aJLbkAExNcDOCQYsoBcVt1IUPP1Ga8Rfl0n
 ILdCV2pb59aWAHa5cn65VcHXpzwy6UDwNA==
X-Google-Smtp-Source: AA6agR4wO3CbDPjogRuiPToymeFLszMpKe6NMv+aWPMxVmTY9J5+yNcSYsXWEgUVMW1e9O/faPihFg==
X-Received: by 2002:a05:600c:1551:b0:3a6:2f4d:aeca with SMTP id
 f17-20020a05600c155100b003a62f4daecamr10031495wmg.100.1661174648816; 
 Mon, 22 Aug 2022 06:24:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020adff98c000000b0021f13097d6csm11527946wrr.16.2022.08.22.06.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 06:24:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 08/10] target/arm: Implement FEAT_PMUv3p5 cycle counter
 disable bits
Date: Mon, 22 Aug 2022 14:23:56 +0100
Message-Id: <20220822132358.3524971-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822132358.3524971-1-peter.maydell@linaro.org>
References: <20220822132358.3524971-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

FEAT_PMUv3p5 introduces new bits which disable the cycle
counter from counting:
 * MDCR_EL2.HCCD disables the counter when in EL2
 * MDCR_EL3.SCCD disables the counter when Secure

Add the code to support these bits.

(Note that there is a third documented counter-disable
bit, MDCR_EL3.MCCD, which disables the counter when in
EL3. This is not present until FEAT_PMUv3p7, so is
out of scope for now.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2: Get the MDCR_EL3 bit right; v1 implemented something
more like MDCR_EL3.MCCD.
---
 target/arm/cpu.h    | 20 ++++++++++++++++++++
 target/arm/helper.c | 21 +++++++++++++++++----
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 122ec8a47ec..1f6ccc6f217 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1332,6 +1332,8 @@ FIELD(CPTR_EL3, TTA, 20, 1)
 FIELD(CPTR_EL3, TAM, 30, 1)
 FIELD(CPTR_EL3, TCPAC, 31, 1)
 
+#define MDCR_SCCD     (1U << 23)  /* MDCR_EL3 */
+#define MDCR_HCCD     (1U << 23)  /* MDCR_EL2 */
 #define MDCR_EPMAD    (1U << 21)
 #define MDCR_EDAD     (1U << 20)
 #define MDCR_SPME     (1U << 17)  /* MDCR_EL3 */
@@ -3724,6 +3726,13 @@ static inline bool isar_feature_aa32_pmuv3p4(const ARMISARegisters *id)
         FIELD_EX32(id->id_dfr0, ID_DFR0, PERFMON) != 0xf;
 }
 
+static inline bool isar_feature_aa32_pmuv3p5(const ARMISARegisters *id)
+{
+    /* 0xf means "non-standard IMPDEF PMU" */
+    return FIELD_EX32(id->id_dfr0, ID_DFR0, PERFMON) >= 6 &&
+        FIELD_EX32(id->id_dfr0, ID_DFR0, PERFMON) != 0xf;
+}
+
 static inline bool isar_feature_aa32_hpd(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->id_mmfr4, ID_MMFR4, HPDS) != 0;
@@ -4048,6 +4057,12 @@ static inline bool isar_feature_aa64_pmuv3p4(const ARMISARegisters *id)
         FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
 }
 
+static inline bool isar_feature_aa64_pmuv3p5(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 6 &&
+        FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
+}
+
 static inline bool isar_feature_aa64_rcpc_8_3(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, LRCPC) != 0;
@@ -4221,6 +4236,11 @@ static inline bool isar_feature_any_pmuv3p4(const ARMISARegisters *id)
     return isar_feature_aa64_pmuv3p4(id) || isar_feature_aa32_pmuv3p4(id);
 }
 
+static inline bool isar_feature_any_pmuv3p5(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_pmuv3p5(id) || isar_feature_aa32_pmuv3p5(id);
+}
+
 static inline bool isar_feature_any_ccidx(const ARMISARegisters *id)
 {
     return isar_feature_aa64_ccidx(id) || isar_feature_aa32_ccidx(id);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5212750b378..d22debcd57b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1084,8 +1084,8 @@ static CPAccessResult pmreg_access_ccntr(CPUARMState *env,
  * We use these to decide whether we need to wrap a write to MDCR_EL2
  * or MDCR_EL3 in pmu_op_start()/pmu_op_finish() calls.
  */
-#define MDCR_EL2_PMU_ENABLE_BITS (MDCR_HPME | MDCR_HPMD | MDCR_HPMN)
-#define MDCR_EL3_PMU_ENABLE_BITS (MDCR_SPME)
+#define MDCR_EL2_PMU_ENABLE_BITS (MDCR_HPME | MDCR_HPMD | MDCR_HPMN | MDCR_HCCD)
+#define MDCR_EL3_PMU_ENABLE_BITS (MDCR_SPME | MDCR_SCCD)
 
 /* Returns true if the counter (pass 31 for PMCCNTR) should count events using
  * the current EL, security state, and register configuration.
@@ -1120,8 +1120,21 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
         prohibited = prohibited || !(env->cp15.mdcr_el3 & MDCR_SPME);
     }
 
-    if (prohibited && counter == 31) {
-        prohibited = env->cp15.c9_pmcr & PMCRDP;
+    if (counter == 31) {
+        /*
+         * The cycle counter defaults to running. PMCR.DP says "disable
+         * the cycle counter when event counting is prohibited".
+         * Some MDCR bits disable the cycle counter specifically.
+         */
+        prohibited = prohibited && env->cp15.c9_pmcr & PMCRDP;
+        if (cpu_isar_feature(any_pmuv3p5, env_archcpu(env))) {
+            if (secure) {
+                prohibited = prohibited || (env->cp15.mdcr_el3 & MDCR_SCCD);
+            }
+            if (el == 2) {
+                prohibited = prohibited || (mdcr_el2 & MDCR_HCCD);
+            }
+        }
     }
 
     if (counter == 31) {
-- 
2.25.1



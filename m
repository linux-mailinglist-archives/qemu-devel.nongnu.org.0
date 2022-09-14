Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541705B8872
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 14:43:35 +0200 (CEST)
Received: from localhost ([::1]:47944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYRjq-00034P-Fv
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 08:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwf-0000f9-GG
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:45 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwW-00007V-4F
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:45 -0400
Received: by mail-wr1-x430.google.com with SMTP id k9so25355441wri.0
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/WmaXVo2MYuOlAcsCLeAmVXJvk5KLEL9TUPHKB0nNqM=;
 b=lgh/oMVAkTXrTyZVHmtQ3vA6tMROuphl+KRuOCn9bPzYAVp/JdSqpPN7QgZ9bQDOzJ
 mKs0/qAgkTZ/hB1OH3UM886GLR1rs9EaJM3/kg5RzOcWe+yWCXC8Stsn1VpPkXbfijeR
 sJ5/+3v23C+3t06p32lH6vdmYmv8LtajlCbyCABNydEs5hWLME7WosEgCgLpDRB9o1ky
 Q4a9IpLgNAe3aDs1tr8Cefh/pna+Wgw0wt5/YBFsXituEJt8UmtvA9FNh0lrxXC+41rz
 94MWjG3bYEqS9WN6cFYmJjqIiYd+zhMMlZ8QFimh+rtNmuclQ0vmrz5AbAcKtmCihfqu
 R7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/WmaXVo2MYuOlAcsCLeAmVXJvk5KLEL9TUPHKB0nNqM=;
 b=ZTWQ9YOpyW1JUEfovHHlqwI//mK7q8e+zH4mMLcs7HUadQW+o2sGM5342N5Y5BNbrB
 HkDHqVCNBTsue5JsqcfD8hxKGaJ/FVB+Q7c1Dwvxs4lyfI6qugEgQhkqQ2rG8Kq0My0c
 4gJXngAu3zp7Z1N/wlbqxFMHCPzTCrvcdPPI8WempVPDEnDXWGYc0ycGquCzXEqV/oXl
 bIU+iKOLyll1AG4w1rfvs4wgWAFCVw3DNQINvqjI+mmBGowV1mH5BupUc0WYPT3fSiuX
 y8TiWfBwocl58fLnV++//hTVCV5vswPYOdeSH9vEkZdBwZST4ZKOki/uYFYHvx/29WOy
 NBTw==
X-Gm-Message-State: ACgBeo1sdUwLcS3U5CwBHXgPol3C3l5bfJJpB7+dKMDydDgXZ56m14AH
 vnFnAxt2UNddL1b/gD5t7vOTObZ+Q0cIJiH+
X-Google-Smtp-Source: AA6agR608RJDoSb8ugXwD4pKOOy2uXZLc/DPADy9UgqL5j857TY6nIxu1ITkC4rkW/vW7cFVFF8CFA==
X-Received: by 2002:a05:6000:168f:b0:228:d8fd:4953 with SMTP id
 y15-20020a056000168f00b00228d8fd4953mr21602059wrd.65.1663156354501; 
 Wed, 14 Sep 2022 04:52:34 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 16/20] target/arm: Implement FEAT_PMUv3p5 cycle counter disable
 bits
Date: Wed, 14 Sep 2022 12:52:13 +0100
Message-Id: <20220914115217.117532-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822132358.3524971-9-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 20 ++++++++++++++++++++
 target/arm/helper.c | 21 +++++++++++++++++----
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d86e51992a..41e74df104 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1334,6 +1334,8 @@ FIELD(CPTR_EL3, TTA, 20, 1)
 FIELD(CPTR_EL3, TAM, 30, 1)
 FIELD(CPTR_EL3, TCPAC, 31, 1)
 
+#define MDCR_SCCD     (1U << 23)  /* MDCR_EL3 */
+#define MDCR_HCCD     (1U << 23)  /* MDCR_EL2 */
 #define MDCR_EPMAD    (1U << 21)
 #define MDCR_EDAD     (1U << 20)
 #define MDCR_SPME     (1U << 17)  /* MDCR_EL3 */
@@ -3726,6 +3728,13 @@ static inline bool isar_feature_aa32_pmuv3p4(const ARMISARegisters *id)
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
@@ -4050,6 +4059,12 @@ static inline bool isar_feature_aa64_pmuv3p4(const ARMISARegisters *id)
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
@@ -4223,6 +4238,11 @@ static inline bool isar_feature_any_pmuv3p4(const ARMISARegisters *id)
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
index 987ac19fe8..0d1f23de09 100644
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
2.34.1



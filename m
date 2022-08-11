Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8F75905DB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:28:46 +0200 (CEST)
Received: from localhost ([::1]:35568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBzB-0007GG-Mp
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnL-0006vu-Br
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:16:31 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnJ-0000wk-Ff
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:16:31 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v3so22132097wrp.0
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=cLYZa9syzOzFbEHzRWobfZOnBIH37RGsYCkH7ST7i5w=;
 b=Yngm7okkwjvpniEmjAR1RtrXxlmoeVVzU+nCIbTLPa6upYUFbop0qjeyjI0cLsNtv1
 29ggIuvn4p2IcNhKOW3rKuNOdteZJFbmo36Eoc3fri+A1Wj6pgahSgcjo/3ctCVIzjdA
 j1nk11HWA5gd3vpHJh6UWHmb204RsewVBLyRHG9hskpI4lMfSGXSmQtFEdbhousH00tZ
 9h31ZUo2K/hjt7MPaCDksOhhdCH7Nun0zDo018hfIgRRRuvRp32gEmCiyPu+ann2tNuQ
 5Nq8w6Ic5BC7+MfAD4QQax4EtcJDwoNB6clzz4v0vKAKoxX7FnjpaZ+Kjb1s6jBpia3O
 nBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=cLYZa9syzOzFbEHzRWobfZOnBIH37RGsYCkH7ST7i5w=;
 b=OWQu6Aq8dlt1H7/hx0D5OukdUk7DmjLnnkMTiaq4kT389qhHCzmjMfpcN1ckgvqNLL
 xEsDX++AFQk5o8y8OL26da4yVCWFBbbUGe5GZL0AkU/y/AHZiVgzaNLAQHbe81UBg1Tj
 RwW2WpTw/PQz+a2mO0kp1s8r4KP+ecevWRkdPzz2PrEDv+IYjsBRTFH2KMelhzMDWpgg
 VCEtcZYPyteRykD6am1kawNedy9BEdPdOPW/PwFuXI+liXfO50mJ28SXY8ZSOk2dsqR2
 jNAxXk6SNJdq+bzZIJ3KVz6djc57vZMk0XOhykdL4Cc7ym66LQPaJP4BUS3k/gktPofp
 xW8w==
X-Gm-Message-State: ACgBeo13TN5NSnWYdCl76dw6FjTZFnRgDBvOcvqYvxvrdHsWZg1K6atj
 oXLypFCH/tWkb8CJbTu0N3rUpnXf7XRbZw==
X-Google-Smtp-Source: AA6agR5rlQJpgHpXTLMT09rV8r+DRTrCr35Aq6L4kItzHni6mtK2pFYbdjMymfdjg7oxX6dr1uysIg==
X-Received: by 2002:a5d:4204:0:b0:21f:a52f:a36e with SMTP id
 n4-20020a5d4204000000b0021fa52fa36emr25841wrq.458.1660238188219; 
 Thu, 11 Aug 2022 10:16:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b003a2f6367049sm6633918wmq.48.2022.08.11.10.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 10:16:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/10] target/arm: Implement FEAT_PMUv3p5 cycle counter
 disable bits
Date: Thu, 11 Aug 2022 18:16:17 +0100
Message-Id: <20220811171619.1154755-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811171619.1154755-1-peter.maydell@linaro.org>
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

FEAT_PMUv3p5 introduces new bits MDCR_EL2.HCCD and MDCR_EL3.SCCD,
which disable the cycle counter from counting at EL2 and EL3.
Add the code to support these bits.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 20 ++++++++++++++++++++
 target/arm/helper.c | 20 ++++++++++++++++----
 2 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 122ec8a47ec..9e7fe64ceae 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1332,6 +1332,8 @@ FIELD(CPTR_EL3, TTA, 20, 1)
 FIELD(CPTR_EL3, TAM, 30, 1)
 FIELD(CPTR_EL3, TCPAC, 31, 1)
 
+#define MDCR_MCCD     (1ULL << 34) /* MDCR_EL3 */
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
index 9507375b8e2..f601025cc40 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1084,8 +1084,8 @@ static CPAccessResult pmreg_access_ccntr(CPUARMState *env,
  * We use these to decide whether we need to wrap a write to MDCR_EL2
  * or MDCR_EL3 in pmu_op_start()/pmu_op_finish() calls.
  */
-#define MDCR_EL2_PMU_ENABLE_BITS (MDCR_HPME | MDCR_HPMD | MDCR_HPMN)
-#define MDCR_EL3_PMU_ENABLE_BITS (MDCR_SPME)
+#define MDCR_EL2_PMU_ENABLE_BITS (MDCR_HPME | MDCR_HPMD | MDCR_HPMN | MDCR_HCCD)
+#define MDCR_EL3_PMU_ENABLE_BITS (MDCR_SPME | MDCR_MCCD)
 
 /* Returns true if the counter (pass 31 for PMCCNTR) should count events using
  * the current EL, security state, and register configuration.
@@ -1120,8 +1120,20 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
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
+            if (el == 3) {
+                prohibited = prohibited || (env->cp15.mdcr_el3 & MDCR_MCCD);
+            } else if (el == 2) {
+                prohibited = prohibited || (mdcr_el2 & MDCR_HCCD);
+            }
+        }
     }
 
     if (counter == 31) {
-- 
2.25.1



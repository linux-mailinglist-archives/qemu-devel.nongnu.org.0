Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F03CA56A218
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 14:35:21 +0200 (CEST)
Received: from localhost ([::1]:43362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Qj3-00064l-0X
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 08:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Qbs-0007zr-0y
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:27:56 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Qbj-0006wt-Aw
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:27:55 -0400
Received: by mail-wr1-x431.google.com with SMTP id o4so26094763wrh.3
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 05:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=q2W2KJbvVZ1DqZjim4XTGaRocWnbTuEZJ2sDv28nrwM=;
 b=ybZT6PFLZYgcsxADZOSBuPoTsrTIRF7RzqRBhjKj0ClHLaTFZW1YgrdxSflgD6++nW
 kB0txt8X9iHlBtSrDAx1AhWU6Slf9Xssacht4fQV+iE6VhCYDDIsPFUXauD0x+DN+pH4
 J2crgebAjYLoEqwq7jfCNu/dBey0xxyrT30MOrGd7jwqI8pc7uxbPiCTh8RYa/ChtsCd
 gUpszwpB8Fa+HX0h8erzpVfZKbFPYsfZI3703ol407Mhf0aO3WXHxxvJqNIpUs5u5+nT
 lNoD3tKhN4CX6dtzHU6suAm5qk11qA1VZCS1ngYMOlVAF9vyk0nKA1I/C5V4iVrubT+C
 f7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q2W2KJbvVZ1DqZjim4XTGaRocWnbTuEZJ2sDv28nrwM=;
 b=6boDk1vuBrQRHU+XJUUlToqcrMIjOcwIgKnpMfrow1Zv8V+t8sVKYvj1TPnJ9KtOoK
 mrchCfECnSHan4k9KL7stAku13ukTQ9W9fT5Ksrkr1MbZeCoIMirtaEl3GPQxQUHCke5
 6jFHw4U6rLHV5fKm97MT10+KfBXaxgFpuwJPhJnpxnfnmFnti4hPU33rzUVJlQuBxavc
 jwzZbrzzd7uNQx7fy30Rg+Y7rGoZCK/aEyoK+gQcq0FqEhd4PItI2FpfhLgy3tgyxfAu
 iMvBhV7KqWhrBw0dX6cIb2yXxAFhg+YW0PQorN0YnBAhA0EJi2Yq05kSXLbJIxqvuhoU
 gq7Q==
X-Gm-Message-State: AJIora9FQzjGxjccXvjPEywNg927BVx4OVbJIeY4njFhLH11Q8Ef57y1
 16ma9/n6m7BW79b4gcbn4x1+9RzjYmHrvQ==
X-Google-Smtp-Source: AGRyM1uKMGDnj2DVjf+5+CVqmoKR1tnnfXtOxP+lgiPUTzjqWXlqw9BauWwpW9+3mXTcr3wUzcPOqQ==
X-Received: by 2002:a05:6000:1d98:b0:21b:aead:9b6c with SMTP id
 bk24-20020a0560001d9800b0021baead9b6cmr42885509wrb.531.1657196864868; 
 Thu, 07 Jul 2022 05:27:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003a0375c4f73sm29177618wmq.44.2022.07.07.05.27.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 05:27:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] target/arm: Correctly implement Feat_DoubleLock
Date: Thu,  7 Jul 2022 13:27:33 +0100
Message-Id: <20220707122734.288929-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707122734.288929-1-peter.maydell@linaro.org>
References: <20220707122734.288929-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

The architecture defines the OS DoubleLock as a register which
(similarly to the OS Lock) suppresses debug events for use in CPU
powerdown sequences.  This functionality is required in Arm v7 and
v8.0; from v8.2 it becomes optional and in v9 it must not be
implemented.

Currently in QEMU we implement the OSDLR_EL1 register as a NOP.  This
is wrong both for the "feature implemented" and the "feature not
implemented" cases: if the feature is implemented then the DLK bit
should read as written and cause suppression of debug exceptions, and
if it is not implemented then the bit must be RAZ/WI.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h          | 20 ++++++++++++++++++++
 target/arm/debug_helper.c | 20 ++++++++++++++++++--
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c533ad0b64d..1f4f3e0485c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -500,6 +500,7 @@ typedef struct CPUArchState {
         uint64_t dbgwcr[16]; /* watchpoint control registers */
         uint64_t mdscr_el1;
         uint64_t oslsr_el1; /* OS Lock Status */
+        uint64_t osdlr_el1; /* OS DoubleLock status */
         uint64_t mdcr_el2;
         uint64_t mdcr_el3;
         /* Stores the architectural value of the counter *the last time it was
@@ -2253,6 +2254,15 @@ FIELD(DBGDIDR, CTX_CMPS, 20, 4)
 FIELD(DBGDIDR, BRPS, 24, 4)
 FIELD(DBGDIDR, WRPS, 28, 4)
 
+FIELD(DBGDEVID, PCSAMPLE, 0, 4)
+FIELD(DBGDEVID, WPADDRMASK, 4, 4)
+FIELD(DBGDEVID, BPADDRMASK, 8, 4)
+FIELD(DBGDEVID, VECTORCATCH, 12, 4)
+FIELD(DBGDEVID, VIRTEXTNS, 16, 4)
+FIELD(DBGDEVID, DOUBLELOCK, 20, 4)
+FIELD(DBGDEVID, AUXREGS, 24, 4)
+FIELD(DBGDEVID, CIDMASK, 28, 4)
+
 FIELD(MVFR0, SIMDREG, 0, 4)
 FIELD(MVFR0, FPSP, 4, 4)
 FIELD(MVFR0, FPDP, 8, 4)
@@ -3731,6 +3741,11 @@ static inline bool isar_feature_aa32_debugv8p2(const ARMISARegisters *id)
     return FIELD_EX32(id->id_dfr0, ID_DFR0, COPDBG) >= 8;
 }
 
+static inline bool isar_feature_aa32_doublelock(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->dbgdevid, DBGDEVID, DOUBLELOCK) > 0;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
@@ -4155,6 +4170,11 @@ static inline bool isar_feature_aa64_sme_fa64(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, FA64);
 }
 
+static inline bool isar_feature_aa64_doublelock(const ARMISARegisters *id)
+{
+    return FIELD_SEX64(id->id_aa64dfr0, ID_AA64DFR0, DOUBLELOCK) >= 0;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index e96a4ffd28d..d09fccb0a4f 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -142,7 +142,7 @@ static bool aa32_generate_debug_exceptions(CPUARMState *env)
  */
 bool arm_generate_debug_exceptions(CPUARMState *env)
 {
-    if (env->cp15.oslsr_el1 & 1) {
+    if ((env->cp15.oslsr_el1 & 1) || (env->cp15.osdlr_el1 & 1)) {
         return false;
     }
     if (is_a64(env)) {
@@ -614,6 +614,21 @@ static void oslar_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->cp15.oslsr_el1 = deposit32(env->cp15.oslsr_el1, 1, 1, oslock);
 }
 
+static void osdlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                        uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    /*
+     * Only defined bit is bit 0 (DLK); if Feat_DoubleLock is not
+     * implemented this is RAZ/WI.
+     */
+    if(arm_feature(env, ARM_FEATURE_AARCH64)
+       ? cpu_isar_feature(aa64_doublelock, cpu)
+       : cpu_isar_feature(aa32_doublelock, cpu)) {
+        env->cp15.osdlr_el1 = value & 1;
+    }
+}
+
 static const ARMCPRegInfo debug_cp_reginfo[] = {
     /*
      * DBGDRAR, DBGDSAR: always RAZ since we don't implement memory mapped
@@ -670,7 +685,8 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
     { .name = "OSDLR_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 4,
       .access = PL1_RW, .accessfn = access_tdosa,
-      .type = ARM_CP_NOP },
+      .writefn = osdlr_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.osdlr_el1) },
     /*
      * Dummy DBGVCR: Linux wants to clear this on startup, but we don't
      * implement vector catch debug events yet.
-- 
2.25.1



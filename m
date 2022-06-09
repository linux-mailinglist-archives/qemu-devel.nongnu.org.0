Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406FC544B41
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:04:54 +0200 (CEST)
Received: from localhost ([::1]:53400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzGuC-0004sh-3w
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7k-0001oz-A9
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:40 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7i-00063a-9r
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:40 -0400
Received: by mail-wr1-x433.google.com with SMTP id h5so31518410wrb.0
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AJUvIhNABE7+bpF4sZrKJZdKNVK1oDZ/5Hrds64VDKo=;
 b=yCJDWWLBX8grHJ4kdbYX8pcy0jMpbW6pyqvqAWJedSJ+mPEfUKYOEH1kqqbSNGVx4T
 xwxRPLIvaRUibpw9yCDXsHI/pB6kqmsqsvVosbZcF0WnG6vIdfeoLuKs4qxL9Np0VVC9
 IRcYo2C1b3keoWXeTMdLPcTX4acK3xdxO6lzy1Avubv7vLUfxve+DMC0lNjEqNEmucYU
 LXXJRZpVnUi9t9vFnoS480ZM0iyua1Fzx7aInfz3sVpe90n6bvvuGC+EkMry04G4g2V+
 mBFv+IfaRRsivsiFlrgARm4PhEzPJGMDResMrgeNStsMCZIz6RbGeMRs1OPMRPjD1k/h
 6+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AJUvIhNABE7+bpF4sZrKJZdKNVK1oDZ/5Hrds64VDKo=;
 b=ErzC7E2acdr1kCcFD6MkpZdWIqs2ETLDHTbbW19oIp4HuI9IJSsKbe/9fa+YKPYd4H
 LPxw4e874y/jLJqh/j630ZUMN9ORV/R5WwwBcEWFJCCrGrVh0njAt/q6nQJLp+tTI8ed
 uyf4pCs2SJPgSOHBQ6wPuSuTsFK6ELFIyrpR34iA7b+Oo1mkj3v2plyu2so4R0mXLcMa
 jUbCYXKB/7R/qZFYB4mT5zfbotPvSOxofnST8t0WgzH+CsR2jmT9llHLNIrtNzFK6rDF
 ZiJILsWLxQ+0FMudoYoOZ3IcNB1weKSS8DgXuZ82YYg5+rI6g2VYWfuvL28DBWMz5ykF
 Wr4g==
X-Gm-Message-State: AOAM532CQk/GTTC0cA4OSgecFXaQ+PtVKEpCPA8Tz0UCqveVs0B3dKH/
 jeir+FYuiO8+jKW4/yFHWABbTgejxR1cUg==
X-Google-Smtp-Source: ABdhPJwv47Q4cTbzMP0aU9Bh09xprI2YfnL5honM1/klNspZrmZXAdssd6mPbC3XNoFcjq2dUi4SxQ==
X-Received: by 2002:adf:eccd:0:b0:212:fbbc:79de with SMTP id
 s13-20020adfeccd000000b00212fbbc79demr35777097wro.520.1654765597488; 
 Thu, 09 Jun 2022 02:06:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 55/55] target/arm: Add ID_AA64SMFR0_EL1
Date: Thu,  9 Jun 2022 10:05:37 +0100
Message-Id: <20220609090537.1971756-56-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This register is allocated from the existing block of id registers,
so it is already RES0 for cpus that do not implement SME.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220607203306.657998-21-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 25 +++++++++++++++++++++++++
 target/arm/helper.c |  4 ++--
 target/arm/kvm64.c  | 11 +++++++----
 3 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2e6153c5409..78dbcb5592c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -966,6 +966,7 @@ struct ArchCPU {
         uint64_t id_aa64dfr0;
         uint64_t id_aa64dfr1;
         uint64_t id_aa64zfr0;
+        uint64_t id_aa64smfr0;
         uint64_t reset_pmcr_el0;
     } isar;
     uint64_t midr;
@@ -2190,6 +2191,15 @@ FIELD(ID_AA64ZFR0, I8MM, 44, 4)
 FIELD(ID_AA64ZFR0, F32MM, 52, 4)
 FIELD(ID_AA64ZFR0, F64MM, 56, 4)
 
+FIELD(ID_AA64SMFR0, F32F32, 32, 1)
+FIELD(ID_AA64SMFR0, B16F32, 34, 1)
+FIELD(ID_AA64SMFR0, F16F32, 35, 1)
+FIELD(ID_AA64SMFR0, I8I32, 36, 4)
+FIELD(ID_AA64SMFR0, F64F64, 48, 1)
+FIELD(ID_AA64SMFR0, I16I64, 52, 4)
+FIELD(ID_AA64SMFR0, SMEVER, 56, 4)
+FIELD(ID_AA64SMFR0, FA64, 63, 1)
+
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
 FIELD(ID_DFR0, MMAPDBG, 8, 4)
@@ -4195,6 +4205,21 @@ static inline bool isar_feature_aa64_sve_f64mm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, F64MM) != 0;
 }
 
+static inline bool isar_feature_aa64_sme_f64f64(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, F64F64);
+}
+
+static inline bool isar_feature_aa64_sme_i16i64(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, I16I64) == 0xf;
+}
+
+static inline bool isar_feature_aa64_sme_fa64(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, FA64);
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 400f7cd1dba..ac9942d750d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7722,11 +7722,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = cpu->isar.id_aa64zfr0 },
-            { .name = "ID_AA64PFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "ID_AA64SMFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = 0 },
+              .resetvalue = cpu->isar.id_aa64smfr0 },
             { .name = "ID_AA64PFR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 6,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index b3f635fc952..ff8f65da22f 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -574,6 +574,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     } else {
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr1,
                               ARM64_SYS_REG(3, 0, 0, 4, 1));
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64smfr0,
+                              ARM64_SYS_REG(3, 0, 0, 4, 5));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr0,
                               ARM64_SYS_REG(3, 0, 0, 5, 0));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr1,
@@ -682,10 +684,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         ahcf->isar.id_aa64pfr0 = t;
 
         /*
-         * Before v5.1, KVM did not support SVE and did not expose
-         * ID_AA64ZFR0_EL1 even as RAZ.  After v5.1, KVM still does
-         * not expose the register to "user" requests like this
-         * unless the host supports SVE.
+         * There is a range of kernels between kernel commit 73433762fcae
+         * and f81cb2c3ad41 which have a bug where the kernel doesn't expose
+         * SYS_ID_AA64ZFR0_EL1 via the ONE_REG API unless the VM has enabled
+         * SVE support, so we only read it here, rather than together with all
+         * the other ID registers earlier.
          */
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
                               ARM64_SYS_REG(3, 0, 0, 4, 4));
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B9A5416F3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:57:02 +0200 (CEST)
Received: from localhost ([::1]:38104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygG5-0003uF-HV
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftM-0007r7-7K
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:32 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:38632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftH-0007KX-0K
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:31 -0400
Received: by mail-pg1-x535.google.com with SMTP id 123so6587659pgb.5
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HGO//0wOn1sAEsIGZmCJxmY16sqRiuqL/H+xDewX7AQ=;
 b=IpsUlJMNikntsfusICz3pGW/MEPuf2nilsYHSm2oes5TsoVTujVCRy3pmaht1lNw/K
 xNt0WwazTORCR8dJdWj8a2eRnRCIWrv3CfORv+ibWVFrnBwnm0ifOG8sIvr/pXiy2LWu
 brZ5nYAxeAFXXH/oUia5pwfQQHaXkntJR4fIOeNJf06T/az9eW6BUG4CXqYOeOi8SDSc
 sUCr/IetPP5AjCB4CBF9cRJsnM+BePN65ay6PkmR0SOjwgQtp3q8+N/nwFwuQ39TOye6
 iAl/f8vZqkRORC7tNVsPD2BzebYwpAeV7QFTJSoVEAvcBRtK2oZAAK56d0/Ljo0Y1oeV
 MlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HGO//0wOn1sAEsIGZmCJxmY16sqRiuqL/H+xDewX7AQ=;
 b=spsS2ZFFOmbHP67TAPULTxeJGzdPfE7QrLylkCLtulWAsI/UylP9d0dtcc5Ph/Ouza
 Hl3CBfziA1FXcGG3WPtB6nN5VjE42V2qAy1x1EvujAPrqyxzdoOuvMKSFm9yetjlaoWi
 U42XFgR32fUmkIO8QhypuZegE+pO0zWeRCxKGWiM+M4TE02sWE4FDApdeaIxMWC4++mq
 CHtG7R/yUEnM9W3ehycdsr68a1xa4uzDOPbBToafO1PQwNd6NwAXjw3dWCExhk29DlIa
 1iQxbBNZ5vvc8bOW79PvmJRfg3heDtGVxn0BPedeicc9kB1xIrg3HnhZxEfIML4AGg+Q
 hBJQ==
X-Gm-Message-State: AOAM531gjbdsiEJvPzA0io7lwXlZRTQgpah3v6flSafVqXO3JX6AESen
 J4iIJeOi14ruFFgRNi7OfWO8i98/0RtKHw==
X-Google-Smtp-Source: ABdhPJyiLX/ypvF8tJqQtkAak+ov3NhO3J8yc/nQRPES4Vp3PdKY8k9Y3CSj186vnH7On+MAqle9/Q==
X-Received: by 2002:a63:33c5:0:b0:3fc:da19:45aa with SMTP id
 z188-20020a6333c5000000b003fcda1945aamr26070818pgz.522.1654634005668; 
 Tue, 07 Jun 2022 13:33:25 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 20/71] target/arm: Add ID_AA64SMFR0_EL1
Date: Tue,  7 Jun 2022 13:32:15 -0700
Message-Id: <20220607203306.657998-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

This register is allocated from the existing block of id registers,
so it is already RES0 for cpus that do not implement SME.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 25 +++++++++++++++++++++++++
 target/arm/helper.c |  4 ++--
 target/arm/kvm64.c  | 11 +++++++----
 3 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ce89ef5dc2..246371f93b 100644
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
@@ -4190,6 +4200,21 @@ static inline bool isar_feature_aa64_sve_f64mm(const ARMISARegisters *id)
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
index cb44d528c0..48534db0bd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7732,11 +7732,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
index b3f635fc95..ff8f65da22 100644
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
2.34.1



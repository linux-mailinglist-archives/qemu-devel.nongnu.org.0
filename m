Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC0338F74C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:06:59 +0200 (CEST)
Received: from localhost ([::1]:39930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llLX7-00047A-3n
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUK-0000tl-SE
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:04 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUH-0001bm-PI
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:04 -0400
Received: by mail-pf1-x429.google.com with SMTP id f22so13898724pfn.0
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jk9xuQuOdWwLhsZNV9U+4ALfnilDyaP5t7dhpaqzQXE=;
 b=CgYyAhh2wNdocjFevoKi06EGWL9bbN5tgQ/2qTbbbzWqRFFZHp+fBu/i4y4vbhXfpS
 h5fNoo1ua2jJ0tPTPwbEGSU4eBlGtY/dG30kf6RHlXdpbCxxjvkLwEr7aWJ4iSXLUf7C
 2V5c+KR1POAof6R5dtpnsbti6kCfGs2czvOFiGJAsGDFMcyYL6EI33U0bZ7tSfSwUU8o
 GBtXYfDQ82m5fU1mIiTGUqJ+faecFn5rBKrFsy+/CpDutacV0HQ4uAl0Qqqs20RvJKM8
 DwUw2gEap6P6MS5VztDbY+6AyLq5KvZN/6p3OSa/jpmb4kmy9vwoNeVP01+ovyi6t623
 bXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jk9xuQuOdWwLhsZNV9U+4ALfnilDyaP5t7dhpaqzQXE=;
 b=UrJc4lEEIAZClWDRFLtvJvjOxBnEAY3x1Q/JaOKUc31Re9vFAFOp/L4Q6RAzoD651D
 SLKkMmwER//YVh95MjA20KRuydzlVnRBoWS8X9xyVgIpeX4Qfd8H5TwM8nac3y3GO08H
 5P8DTNd3Oc/wuXlJGMz3t3K1++6vUsV6i75eJyPSShBIKT//UTtwZ/Szbrjngjy2zFn4
 etPE/1yTqScv29XqM5v3fSJnBkoiEZvjoDDLoW+hLJWuxz0j6KgUxGEq7UgLnNGV/zaE
 XVwUuPD2Eq0AxJbMco1U8t6pgmllKduSztCgYXxSQ33AmV1Ji6TlMhHWUVw2TZMwhd9l
 w8QA==
X-Gm-Message-State: AOAM5310VoUfqcM4mqkC5kMj0foUR/cyzbaKZYKdMQ2KMKtRDRMuD56E
 IEpCRRPxn3R3J9RgpxndhFSa96njD+0XSw==
X-Google-Smtp-Source: ABdhPJznsZE5x1YyAM/VVwAaM6zIaljOu0J0r6/dydjhjwA21TZLWD8O4xMZ76kWqgjjmavN0n3aeA==
X-Received: by 2002:aa7:92da:0:b029:2d5:59bc:a7e4 with SMTP id
 k26-20020aa792da0000b02902d559bca7e4mr27283842pfa.46.1621904640361; 
 Mon, 24 May 2021 18:04:00 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 01/92] target/arm: Add ID_AA64ZFR0 fields and
 isar_feature_aa64_sve2
Date: Mon, 24 May 2021 18:02:27 -0700
Message-Id: <20210525010358.152808-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Will be used for SVE2 isa subset enablement.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Do not read zfr0 from kvm unless sve is available.
v7: Move zfr0 read inside existing sve_enabled block.
---
 target/arm/cpu.h    | 16 ++++++++++++++++
 target/arm/helper.c |  3 +--
 target/arm/kvm64.c  | 21 +++++++++++++++------
 3 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 616b393253..a6e1fa6333 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -947,6 +947,7 @@ struct ARMCPU {
         uint64_t id_aa64mmfr2;
         uint64_t id_aa64dfr0;
         uint64_t id_aa64dfr1;
+        uint64_t id_aa64zfr0;
     } isar;
     uint64_t midr;
     uint32_t revidr;
@@ -2034,6 +2035,16 @@ FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
 FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
 FIELD(ID_AA64DFR0, MTPMU, 48, 4)
 
+FIELD(ID_AA64ZFR0, SVEVER, 0, 4)
+FIELD(ID_AA64ZFR0, AES, 4, 4)
+FIELD(ID_AA64ZFR0, BITPERM, 16, 4)
+FIELD(ID_AA64ZFR0, BFLOAT16, 20, 4)
+FIELD(ID_AA64ZFR0, SHA3, 32, 4)
+FIELD(ID_AA64ZFR0, SM4, 40, 4)
+FIELD(ID_AA64ZFR0, I8MM, 44, 4)
+FIELD(ID_AA64ZFR0, F32MM, 52, 4)
+FIELD(ID_AA64ZFR0, F64MM, 56, 4)
+
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
 FIELD(ID_DFR0, MMAPDBG, 8, 4)
@@ -4215,6 +4226,11 @@ static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) != 0;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3b365a78cb..696aea2250 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7561,8 +7561,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 4,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              /* At present, only SVEver == 0 is defined anyway.  */
-              .resetvalue = 0 },
+              .resetvalue = cpu->isar.id_aa64zfr0 },
             { .name = "ID_AA64PFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index dff85f6db9..37ceadd9a9 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -647,17 +647,26 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 
     sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
 
-    kvm_arm_destroy_scratch_host_vcpu(fdarray);
-
-    if (err < 0) {
-        return false;
-    }
-
     /* Add feature bits that can't appear until after VCPU init. */
     if (sve_supported) {
         t = ahcf->isar.id_aa64pfr0;
         t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
         ahcf->isar.id_aa64pfr0 = t;
+
+        /*
+         * Before v5.1, KVM did not support SVE and did not expose
+         * ID_AA64ZFR0_EL1 even as RAZ.  After v5.1, KVM still does
+         * not expose the register to "user" requests like this
+         * unless the host supports SVE.
+         */
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
+                              ARM64_SYS_REG(3, 0, 0, 4, 4));
+    }
+
+    kvm_arm_destroy_scratch_host_vcpu(fdarray);
+
+    if (err < 0) {
+        return false;
     }
 
     /*
-- 
2.25.1



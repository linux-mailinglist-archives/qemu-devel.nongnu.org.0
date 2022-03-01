Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E684C9832
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:13:47 +0100 (CET)
Received: from localhost ([::1]:59726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAkc-0004xv-S3
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:13:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXc-0001JI-Ed
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:20 -0500
Received: from [2607:f8b0:4864:20::1032] (port=45900
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXa-000510-Ks
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:20 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so47698pjl.4
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rots8gM6WyEhatQucngAjy7J8H2b6HMDpJoYQByRIgE=;
 b=H6bhpnqaEQrN0iJkzFoNsIoXJR2PxZ70ger9l7nmlhzPe19dgaGKmf2V1Tmn7ARzvC
 0cNhjKjY0xVPFxhCROAET7rz+OutjtjzmH9TsVuqzKjyExDB3OydCLxj+bIvOrtPIhQc
 RHgFLhF28i8O59NfDrxzxYBnO77gY32CP0HxNJ6hV8t/U+vf98Bps92gczM02CglzhfZ
 wGSqnhQtAS40stdF1D/GLOw+odRYCRjM8OjXVhpuVoglA1hJh/3cd1ME784xXxBrp51a
 V2dV9wq2uBALgV45TR+oGfjREhC1sRuqO7XQXR2c1e5qAXQg9s4cbysXPoYxUBqJ0K1O
 QpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rots8gM6WyEhatQucngAjy7J8H2b6HMDpJoYQByRIgE=;
 b=3H9vKpmsTmWpJnqJOwpqdhnuULv3se98+xbMQP+FzP0vrsCZ4L4zORT+74eFETVFDM
 aa6nuDTmzqQmXgpNJQLPbQIFucv4AZupvbyh0d+5RljnO3d7FnVvoWvnv0N+Y+s3QzLL
 mBRntljkA/+Y7RyjLjiczrohzv2WlPeP7FUkYFGUMxDRpTlTFrYRl17jlnXv+q25vev6
 LliEvaidmp3azzKkJXW4iQuABWZYh5oI7ZRpOEw33dQC670YhnNf047mALqsv/SGJK/F
 fDlMzFc3U2xQtNKEpvuIcvsX+hY5brWqjLLxqQN4Heds/6kI6LwG44MFnz2eIDWKaQQd
 aXDA==
X-Gm-Message-State: AOAM532Wo+fLouKRtwPvQ4zE4e+0V9QzZlPXtfCyWsPVSfb1qooEkzMG
 Ba/G8PcYhLTBI/Cnt1Joh/XzMM9FsjL/zw==
X-Google-Smtp-Source: ABdhPJx+P7b2o82qLqbvjjjZJQGUPp5b+DkgkKsJaPZLteP3W3OlVrNy8YuYzuTLJWS+ybHa3coeFw==
X-Received: by 2002:a17:90a:8d82:b0:1bc:6b54:e798 with SMTP id
 d2-20020a17090a8d8200b001bc6b54e798mr23979221pjo.77.1646172017192; 
 Tue, 01 Mar 2022 14:00:17 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/18] target/arm: Implement FEAT_LVA
Date: Tue,  1 Mar 2022 11:59:49 -1000
Message-Id: <20220301215958.157011-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This feature is relatively small, as it applies only to
64k pages and thus requires no additional changes to the
table descriptor walking algorithm, only a change to the
minimum TSZ (which is the inverse of the maximum virtual
address space size).

Note that this feature widens VBAR_ELx, but we already
treat the register as being 64 bits wide.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu-param.h        | 2 +-
 target/arm/cpu.h              | 5 +++++
 target/arm/cpu64.c            | 1 +
 target/arm/helper.c           | 9 ++++++++-
 5 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 144dc491d9..f3eabddfb5 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -27,6 +27,7 @@ the following architecture extensions:
 - FEAT_LRCPC (Load-acquire RCpc instructions)
 - FEAT_LRCPC2 (Load-acquire RCpc instructions v2)
 - FEAT_LSE (Large System Extensions)
+- FEAT_LVA (Large Virtual Address space)
 - FEAT_MTE (Memory Tagging Extension)
 - FEAT_MTE2 (Memory Tagging Extension)
 - FEAT_MTE3 (MTE Asymmetric Fault Handling)
diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 7f38d33b8e..5f9c288b1a 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -11,7 +11,7 @@
 #ifdef TARGET_AARCH64
 # define TARGET_LONG_BITS             64
 # define TARGET_PHYS_ADDR_SPACE_BITS  48
-# define TARGET_VIRT_ADDR_SPACE_BITS  48
+# define TARGET_VIRT_ADDR_SPACE_BITS  52
 #else
 # define TARGET_LONG_BITS             32
 # define TARGET_PHYS_ADDR_SPACE_BITS  40
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c6a4d50e82..c52d56f669 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4289,6 +4289,11 @@ static inline bool isar_feature_aa64_ccidx(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, CCIDX) != 0;
 }
 
+static inline bool isar_feature_aa64_lva(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, VARANGE) != 0;
+}
+
 static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1171ab16b9..1de31ffb40 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -811,6 +811,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);
     t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
+    t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1); /* FEAT_LVA */
     cpu->isar.id_aa64mmfr2 = t;
 
     t = cpu->isar.id_aa64zfr0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2eff30d18c..28b4347213 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11271,7 +11271,14 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     } else {
         max_tsz = 39;
     }
-    min_tsz = 16;  /* TODO: ARMv8.2-LVA  */
+
+    min_tsz = 16;
+    if (using64k) {
+        if (cpu_isar_feature(aa64_lva, env_archcpu(env))) {
+            min_tsz = 12;
+        }
+    }
+    /* TODO: FEAT_LPA2 */
 
     if (tsz > max_tsz) {
         tsz = max_tsz;
-- 
2.25.1



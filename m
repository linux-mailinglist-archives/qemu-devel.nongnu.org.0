Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2E34C1EB1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:38:51 +0100 (CET)
Received: from localhost ([::1]:48732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0Ha-0002Kt-4z
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:38:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0Aw-000713-W3
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:31:59 -0500
Received: from [2607:f8b0:4864:20::1032] (port=50904
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0Au-0001FE-Kr
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:31:58 -0500
Received: by mail-pj1-x1032.google.com with SMTP id m22so344425pja.0
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 14:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rots8gM6WyEhatQucngAjy7J8H2b6HMDpJoYQByRIgE=;
 b=ZpoPYSDCvEQDMS1P7yEcbhrbx3dWfntgn6mAVNCH3+EO8Xf2jcrSOb80Lld9QtVn5X
 j/gD+wwU0Kdn/A+5TDoQRsSRAFphb9b/ef8ZtA719/RBqDjp8dqQOMj8GKzZuUvKlKAP
 ur3AdWq7ntsyT0KpAlJM1mas3YPDvYSsBO7AnomTyzdROva1gdpwM+wkLhtpR1clql+6
 dqWe6UUIvLUcuXmC1OlpaRvbVAaPt8/gG1wcnfryD5IIfJMLyhpY/Fi7WXCsUfBWCCUo
 pjUxff+5qZ6gSO9pXjRXHqMDFUxsWgnkvclK7jzMSLa0WpwwzYh2RKI0jY4/pKkoZXsZ
 +fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rots8gM6WyEhatQucngAjy7J8H2b6HMDpJoYQByRIgE=;
 b=wiUW3DFLI8IcfdY+RQK5veU7tUfj/mLkYRBJTikZnUksldgOkVlU7NR0KKy6bggfmK
 Phzp7TzsVEKnd1DqX+1Q263jHwR2zPIo5nvSD/x/s7O7WgVcEsNRQLIGiwnpTH0fXF0r
 uPIHWDclvaYpMLpNsBwvEl29X840pyemUFnC4tmMS9BUjOnP43QckugOAY+xYGUPUfLn
 67ub/o1r53J/FDJEFMqOa9kYbLYDT+S2keDhex5myUj0bKuTIex+u049fpxAukfYQXUt
 5uNOrrQPOo7MFC4l7w6OGKoY/iroXi9xvyb2yTR9ykXsXDiHMtzQ3+g4ou/HmB7hv/+g
 XPDg==
X-Gm-Message-State: AOAM530xIHqEkTe+w53RYGnu4lH1Y3M47chnrBWdUnIBAI4yuTphFLo9
 Oc7oXHK+3zfrWgGUHiqjLegpPRM+FJwc1A==
X-Google-Smtp-Source: ABdhPJyYSbN9htu/ksuJumzYFl+DuGid5n2rv5qDLFCgoHji1Px/cqytToY6kD2gQDjCvqM8ao2Bvw==
X-Received: by 2002:a17:90b:124c:b0:1bc:369b:7db5 with SMTP id
 gx12-20020a17090b124c00b001bc369b7db5mr11448650pjb.179.1645655515389; 
 Wed, 23 Feb 2022 14:31:55 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 14:31:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/17] target/arm: Implement FEAT_LVA
Date: Wed, 23 Feb 2022 12:31:29 -1000
Message-Id: <20220223223137.114264-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
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



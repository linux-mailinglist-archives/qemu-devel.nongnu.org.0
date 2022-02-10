Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38D04B0460
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 05:17:18 +0100 (CET)
Received: from localhost ([::1]:41084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI0tR-00048U-UA
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 23:17:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0hZ-00046Q-6B
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:05:01 -0500
Received: from [2607:f8b0:4864:20::42e] (port=42990
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0hX-00049S-9e
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:05:00 -0500
Received: by mail-pf1-x42e.google.com with SMTP id i6so6085586pfc.9
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 20:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wo37py8XK0LMBdk7Dcs+T7V1N42HxeZfeXF4Go5VbHY=;
 b=KmilAzqqzzMcK2CxmTEW+WnaO+0sT7KCHt56JNPJ8uY/BNOYDqhCDXj3KYZJx4beUA
 o3zyanFSUTCbH0ewp18YO7jfkDniWacZzHsQ9U/UxOkDyduLs6WR1H+8zCe2aRxfrFHq
 uJw0u8he6XRhPf8yhUJz1B41ouu0Kly0YmW4l1Qgc+dKh9jB6DQMKMzMrwWUgWYZXQt1
 rYNVxt8GWtHjx2MrTk7jYE5ntXLmwcApE8wntYxphPSx9ivxqSPUqzXaeyjxLdNNDBx6
 CiE2N9yHg1mL/yQxZxAAoq8PUqF/5KCr4/m7WjsVvjijDp7Z2sv2IcfbnFXRilm0Gcq4
 nUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wo37py8XK0LMBdk7Dcs+T7V1N42HxeZfeXF4Go5VbHY=;
 b=bNzldBqQT+Y+T3J+5T6l521uIs9bS41hmJBTeTQYBwz40mU6xE4fQMPnrYwsRFWd1s
 ti7fCAGR/G1yysigH5K7PVg/euV14ii8wol21yURjq4LQE+hjNx4URvdLU3h6QJRzLDd
 lnwSVpTRb5osqbIPua9/GmC/m4AjqP+p5sNhQi+QR4myoGxDoxJbK7W8AqgNPGIaKyCs
 wwzrNW9fArbKJR3EKoMBpZmuZAMPktPRk6m4Ia+9bnjiMxqLWfeXiCY4AQuCG2ebWE9m
 dJ5aPb3CbQkxtdbwXR8fYExUomuHJi414tluBQn4K3NKRyLWzpVtgcWzXd/bzHzsamlh
 XoKg==
X-Gm-Message-State: AOAM530rJ8p0BheCdgTk9uv0F/6NHVdsCExt1rk/nbNa96iVfCChaJf0
 I52DTX4BJyRhveuYsyrjdsBfgbNb3+R4f88z
X-Google-Smtp-Source: ABdhPJxE/VuSory3V8kcYrxRf+ed8yEi0ab6dETq4smU4job76+/y0ApQEcoHbfxQZQTMKhZf1VjNw==
X-Received: by 2002:a05:6a00:a1e:: with SMTP id
 p30mr5625210pfh.66.1644465898043; 
 Wed, 09 Feb 2022 20:04:58 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 20:04:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/15] target/arm: Implement FEAT_LVA
Date: Thu, 10 Feb 2022 15:04:17 +1100
Message-Id: <20220210040423.95120-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h | 2 +-
 target/arm/cpu.h       | 5 +++++
 target/arm/cpu64.c     | 1 +
 target/arm/helper.c    | 9 ++++++++-
 4 files changed, 15 insertions(+), 2 deletions(-)

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
index 8786be7783..d80a7eafac 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -781,6 +781,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);
         t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
         t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
+        t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1); /* FEAT_LPA */
         cpu->isar.id_aa64mmfr2 = t;
 
         t = cpu->isar.id_aa64zfr0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e5050816cf..62935b06d0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11269,7 +11269,14 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
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



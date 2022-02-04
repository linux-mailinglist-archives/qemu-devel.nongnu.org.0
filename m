Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97C94A9D6A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 18:09:22 +0100 (CET)
Received: from localhost ([::1]:53844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG25J-0001Pn-Hg
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 12:09:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1sH-0002xV-Gn
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:55:53 -0500
Received: from [2a00:1450:4864:20::42b] (port=45620
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1rp-0003BK-Hq
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:55:39 -0500
Received: by mail-wr1-x42b.google.com with SMTP id m14so12416685wrg.12
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 08:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ed0qXw0YpiQhxHwBF5JeFrQNFqGWUzVgHXWJkQg7ggw=;
 b=r1xskzYwJh5kv8t31WC88bJfIdXPdWP1ZzFgIvwTneD793hnHVyb7bUd3M3zXbP3zZ
 YOYGoyc572RMv02b9HlwoVtXpl9PLwgBKcMGphGdMyefpFcNUWsFjhuTADByaLZ0tvuO
 7NgITk7yHRK9q6g1G5A/kVJbS6CmmJZ4KFIfLYEY/8RyGK1+HECbiWybMw+lR3yS6n5c
 xUowDfKJDFHJDZeb0VMQQDhivyHkBUQg1Uo+vjkDb6MCG5kjedBRvlpC9lDJeK4MhdRa
 TD4/AdSvr2QUFhea962SPTNZHawPTtPNTIobc0G4mUYHgvktgTQ3FvXVuG6bJ+f5aB74
 TP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ed0qXw0YpiQhxHwBF5JeFrQNFqGWUzVgHXWJkQg7ggw=;
 b=RFWz9zCQ9NVbXqP/AtvHTDGqYRI6HNQDe4r4hLPdSy4KfK2L45uVFWR2KXMkO3Qz+O
 62+RCO2OUtqU1lLeF6AAxaN2UEaMwm2N5Q4s04ogLu3/PZtISi+qub8oOvSaUaFM5C9M
 JmMwclDneDY05sZm05wP/tWigyjfROKYX57TAcSOiCdbEkrrOoRNF6Sj+kWSaHHvVUre
 ctqPWr7/rhIaMXxapMVYVsOrDUgaDxxqdy/TPwf1JB6HBfrGFjgceRnhx1P7sP4uIvh3
 Xwofu2ctH8qHcrcfj//AtC9ZIe9ExH+XjyI8/Dn/uU4mvnSF5TK+fTF7qveGDXQ/2YKi
 JJqg==
X-Gm-Message-State: AOAM5332uOViFj1bEqwZk9xRFm9bA+E09MvjeVxyZGwDiPmN8YH3Gagk
 xIFoyrCqmvoMOny7FE0ej+toIQ==
X-Google-Smtp-Source: ABdhPJyE6da+r8+WoIPF8UpBlo4tGAEKhvfGGQIgJWNmQHfctdWsyJDJfIb1JeegRzD2VrjHWJDh9g==
X-Received: by 2002:adf:e48c:: with SMTP id i12mr3091639wrm.259.1643993709217; 
 Fri, 04 Feb 2022 08:55:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id f12sm2486254wrs.1.2022.02.04.08.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 08:55:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/6] target/arm: Move '-cpu host' code to cpu64.c
Date: Fri,  4 Feb 2022 16:55:01 +0000
Message-Id: <20220204165506.2846058-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204165506.2846058-1-peter.maydell@linaro.org>
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that KVM has dropped AArch32 host support, the 'host' CPU type is
always AArch64, and we can move it to cpu64.c.  This move will allow
us to share code between it and '-cpu max', which should behave
the same as '-cpu host' when using KVM or HVF.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c   | 30 ------------------------------
 target/arm/cpu64.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index cdbc4cdd012..d655daa949c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -39,7 +39,6 @@
 #include "sysemu/tcg.h"
 #include "sysemu/hw_accel.h"
 #include "kvm_arm.h"
-#include "hvf_arm.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
 
@@ -2075,31 +2074,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #endif /* CONFIG_TCG */
 }
 
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-static void arm_host_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-#ifdef CONFIG_KVM
-    kvm_arm_set_cpu_features_from_host(cpu);
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        aarch64_add_sve_properties(obj);
-        aarch64_add_pauth_properties(obj);
-    }
-#else
-    hvf_arm_set_cpu_features_from_host(cpu);
-#endif
-    arm_cpu_post_init(obj);
-}
-
-static const TypeInfo host_arm_cpu_type_info = {
-    .name = TYPE_ARM_HOST_CPU,
-    .parent = TYPE_AARCH64_CPU,
-    .instance_init = arm_host_initfn,
-};
-
-#endif
-
 static void arm_cpu_instance_init(Object *obj)
 {
     ARMCPUClass *acc = ARM_CPU_GET_CLASS(obj);
@@ -2147,10 +2121,6 @@ static const TypeInfo arm_cpu_type_info = {
 static void arm_cpu_register_types(void)
 {
     type_register_static(&arm_cpu_type_info);
-
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-    type_register_static(&host_arm_cpu_type_info);
-#endif
 }
 
 type_init(arm_cpu_register_types)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 8786be7783e..052666b819e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -30,6 +30,7 @@
 #endif
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
+#include "hvf_arm.h"
 #include "qapi/visitor.h"
 #include "hw/qdev-properties.h"
 
@@ -681,6 +682,31 @@ void aarch64_add_pauth_properties(Object *obj)
     }
 }
 
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
+static void arm_host_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+#ifdef CONFIG_KVM
+    kvm_arm_set_cpu_features_from_host(cpu);
+    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        aarch64_add_sve_properties(obj);
+        aarch64_add_pauth_properties(obj);
+    }
+#else
+    hvf_arm_set_cpu_features_from_host(cpu);
+#endif
+    arm_cpu_post_init(obj);
+}
+
+static const TypeInfo host_arm_cpu_type_info = {
+    .name = TYPE_ARM_HOST_CPU,
+    .parent = TYPE_AARCH64_CPU,
+    .instance_init = arm_host_initfn,
+};
+
+#endif
+
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
  * otherwise, a CPU with as many features enabled as our emulation supports.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
@@ -1023,6 +1049,10 @@ static void aarch64_cpu_register_types(void)
     for (i = 0; i < ARRAY_SIZE(aarch64_cpus); ++i) {
         aarch64_cpu_register(&aarch64_cpus[i]);
     }
+
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
+    type_register_static(&host_arm_cpu_type_info);
+#endif
 }
 
 type_init(aarch64_cpu_register_types)
-- 
2.25.1



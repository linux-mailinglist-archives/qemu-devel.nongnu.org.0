Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4078F41172F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:36:01 +0200 (CEST)
Received: from localhost ([::1]:48634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKOm-0007I3-8P
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9e-0002pW-1A
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:22 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9J-0000qE-8c
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:21 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q11so30194309wrr.9
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oHf+hwOUPEGJpl4rxbjzAFxAxKD9BNw/fX2NfwfoGDk=;
 b=jjeBtiX9nyzUvjfBzRbUibA8LV/gH3sAVZrfRhYlFANjA6QCdb4K2Bjbqq0tWeB5tG
 Axe2xQ0hb5HKDWvQyXpaZVl5EzxUVvOKpFM1NfVeNCCy0rKkwT9rVx+lWsfTsKxJYUvw
 or+PI4TerFQrTgHIAgQTfU/y/pn+EcoIVSVgCwDXAV13sKPHPO3vVZI+hoDMxLJZ0JX8
 Lir8WtWffSuSvpURzhI4rK0wmq98a7txp3i4SnBB81eMknUekN3W9m+Ys6DJ5OTPKucy
 XRFgcwoOw8xQ1p2NXPneSR6UzunZXM8KZGYJ2SwMNVKe5MGRj7atfA8A1kiM1hHIAOOg
 3hGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oHf+hwOUPEGJpl4rxbjzAFxAxKD9BNw/fX2NfwfoGDk=;
 b=lDCvDxAf8hB+IpdRWEp74RDJnSoJJqDY4hDICCu/TOkO1rfuAc7ptJMoW91WK96ATf
 AWXZA2dtZn38OXaUApQXljp406zY6fKASi/dwBKxHE51GbfvXyUcfDM3lXCr0BsDRCI3
 Zl/5Bx4lRH+y2AUQALlsoTkRL+bIlCVcS0lsBr6+XAi/e2Mdh23V3e5upjyCIX3orpGF
 P1OSwRZzXD7jRF9Scp90PxLF4HWrmoKNDTNkv+jGIARp7GOrAAt3oUjRtQxgfxPXEheq
 fLUp8oZm5yDpQaDjrqSmKN97ekHERF6C4XyMobZ+pDfG5cJXCh1vsQz3xT12RNVEx6/B
 2WTQ==
X-Gm-Message-State: AOAM5307D3fT8lsqsd3aZ2zuk0aXgLoH+7NWYedsQt3jhFC8HFXdGlt1
 S2rYPshfeFmrYMVBkC1bWP4FUnuEWH2Dlg==
X-Google-Smtp-Source: ABdhPJzdTLlOIALEjvEeCSkxU8hvQOHY8RHaQ98JGGQXmN4BmzsHbEhAA913uC+6gaeeWERAAHOnrg==
X-Received: by 2002:a1c:9d4e:: with SMTP id g75mr29991164wme.20.1632147598974; 
 Mon, 20 Sep 2021 07:19:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.19.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:19:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/27] hvf: arm: Implement -cpu host
Date: Mon, 20 Sep 2021 15:19:32 +0100
Message-Id: <20210920141947.5537-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have working system register sync, we push more target CPU
properties into the virtual machine. That might be useful in some
situations, but is not the typical case that users want.

So let's add a -cpu host option that allows them to explicitly pass all
CPU capabilities of their host CPU into the guest.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210916155404.86958-7-agraf@csgraf.de
[PMM: drop unnecessary #include line from .h file]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h     |  2 +
 target/arm/hvf_arm.h | 18 +++++++++
 target/arm/kvm_arm.h |  2 -
 target/arm/cpu.c     | 13 ++++--
 target/arm/hvf/hvf.c | 95 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 124 insertions(+), 6 deletions(-)
 create mode 100644 target/arm/hvf_arm.h

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 09d90277348..3ed03391a83 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3015,6 +3015,8 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
 #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_ARM_CPU
 
+#define TYPE_ARM_HOST_CPU "host-" TYPE_ARM_CPU
+
 #define cpu_signal_handler cpu_arm_signal_handler
 #define cpu_list arm_cpu_list
 
diff --git a/target/arm/hvf_arm.h b/target/arm/hvf_arm.h
new file mode 100644
index 00000000000..ea238cff83f
--- /dev/null
+++ b/target/arm/hvf_arm.h
@@ -0,0 +1,18 @@
+/*
+ * QEMU Hypervisor.framework (HVF) support -- ARM specifics
+ *
+ * Copyright (c) 2021 Alexander Graf
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef QEMU_HVF_ARM_H
+#define QEMU_HVF_ARM_H
+
+#include "cpu.h"
+
+void hvf_arm_set_cpu_features_from_host(struct ARMCPU *cpu);
+
+#endif
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 06134549759..b7f78b52154 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -214,8 +214,6 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
  */
 void kvm_arm_destroy_scratch_host_vcpu(int *fdarray);
 
-#define TYPE_ARM_HOST_CPU "host-" TYPE_ARM_CPU
-
 /**
  * ARMHostCPUFeatures: information about the host CPU (identified
  * by asking the host kernel)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 30e2cb9224d..1c02b92698b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -39,6 +39,7 @@
 #include "sysemu/tcg.h"
 #include "sysemu/hw_accel.h"
 #include "kvm_arm.h"
+#include "hvf_arm.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
 
@@ -1417,8 +1418,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
      * this is the first point where we can report it.
      */
     if (cpu->host_cpu_probe_failed) {
-        if (!kvm_enabled()) {
-            error_setg(errp, "The 'host' CPU type can only be used with KVM");
+        if (!kvm_enabled() && !hvf_enabled()) {
+            error_setg(errp, "The 'host' CPU type can only be used with KVM or HVF");
         } else {
             error_setg(errp, "Failed to retrieve host CPU features");
         }
@@ -2078,15 +2079,19 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #endif /* CONFIG_TCG */
 }
 
-#ifdef CONFIG_KVM
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
 static void arm_host_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
+#ifdef CONFIG_KVM
     kvm_arm_set_cpu_features_from_host(cpu);
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         aarch64_add_sve_properties(obj);
     }
+#else
+    hvf_arm_set_cpu_features_from_host(cpu);
+#endif
     arm_cpu_post_init(obj);
 }
 
@@ -2146,7 +2151,7 @@ static void arm_cpu_register_types(void)
 {
     type_register_static(&arm_cpu_type_info);
 
-#ifdef CONFIG_KVM
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     type_register_static(&host_arm_cpu_type_info);
 #endif
 }
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 110a9d547d8..51b7250612f 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -17,6 +17,7 @@
 #include "sysemu/hvf.h"
 #include "sysemu/hvf_int.h"
 #include "sysemu/hw_accel.h"
+#include "hvf_arm.h"
 
 #include <mach/mach_time.h>
 
@@ -54,6 +55,16 @@ typedef struct HVFVTimer {
 
 static HVFVTimer vtimer;
 
+typedef struct ARMHostCPUFeatures {
+    ARMISARegisters isar;
+    uint64_t features;
+    uint64_t midr;
+    uint32_t reset_sctlr;
+    const char *dtb_compatible;
+} ARMHostCPUFeatures;
+
+static ARMHostCPUFeatures arm_host_cpu_features;
+
 struct hvf_reg_match {
     int reg;
     uint64_t offset;
@@ -416,6 +427,90 @@ static uint64_t hvf_get_reg(CPUState *cpu, int rt)
     return val;
 }
 
+static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
+{
+    ARMISARegisters host_isar = {};
+    const struct isar_regs {
+        int reg;
+        uint64_t *val;
+    } regs[] = {
+        { HV_SYS_REG_ID_AA64PFR0_EL1, &host_isar.id_aa64pfr0 },
+        { HV_SYS_REG_ID_AA64PFR1_EL1, &host_isar.id_aa64pfr1 },
+        { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.id_aa64dfr0 },
+        { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
+        { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
+        { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
+        { HV_SYS_REG_ID_AA64MMFR0_EL1, &host_isar.id_aa64mmfr0 },
+        { HV_SYS_REG_ID_AA64MMFR1_EL1, &host_isar.id_aa64mmfr1 },
+        { HV_SYS_REG_ID_AA64MMFR2_EL1, &host_isar.id_aa64mmfr2 },
+    };
+    hv_vcpu_t fd;
+    hv_return_t r = HV_SUCCESS;
+    hv_vcpu_exit_t *exit;
+    int i;
+
+    ahcf->dtb_compatible = "arm,arm-v8";
+    ahcf->features = (1ULL << ARM_FEATURE_V8) |
+                     (1ULL << ARM_FEATURE_NEON) |
+                     (1ULL << ARM_FEATURE_AARCH64) |
+                     (1ULL << ARM_FEATURE_PMU) |
+                     (1ULL << ARM_FEATURE_GENERIC_TIMER);
+
+    /* We set up a small vcpu to extract host registers */
+
+    if (hv_vcpu_create(&fd, &exit, NULL) != HV_SUCCESS) {
+        return false;
+    }
+
+    for (i = 0; i < ARRAY_SIZE(regs); i++) {
+        r |= hv_vcpu_get_sys_reg(fd, regs[i].reg, regs[i].val);
+    }
+    r |= hv_vcpu_get_sys_reg(fd, HV_SYS_REG_MIDR_EL1, &ahcf->midr);
+    r |= hv_vcpu_destroy(fd);
+
+    ahcf->isar = host_isar;
+
+    /*
+     * A scratch vCPU returns SCTLR 0, so let's fill our default with the M1
+     * boot SCTLR from https://github.com/AsahiLinux/m1n1/issues/97
+     */
+    ahcf->reset_sctlr = 0x30100180;
+    /*
+     * SPAN is disabled by default when SCTLR.SPAN=1. To improve compatibility,
+     * let's disable it on boot and then allow guest software to turn it on by
+     * setting it to 0.
+     */
+    ahcf->reset_sctlr |= 0x00800000;
+
+    /* Make sure we don't advertise AArch32 support for EL0/EL1 */
+    if ((host_isar.id_aa64pfr0 & 0xff) != 0x11) {
+        return false;
+    }
+
+    return r == HV_SUCCESS;
+}
+
+void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu)
+{
+    if (!arm_host_cpu_features.dtb_compatible) {
+        if (!hvf_enabled() ||
+            !hvf_arm_get_host_cpu_features(&arm_host_cpu_features)) {
+            /*
+             * We can't report this error yet, so flag that we need to
+             * in arm_cpu_realizefn().
+             */
+            cpu->host_cpu_probe_failed = true;
+            return;
+        }
+    }
+
+    cpu->dtb_compatible = arm_host_cpu_features.dtb_compatible;
+    cpu->isar = arm_host_cpu_features.isar;
+    cpu->env.features = arm_host_cpu_features.features;
+    cpu->midr = arm_host_cpu_features.midr;
+    cpu->reset_sctlr = arm_host_cpu_features.reset_sctlr;
+}
+
 void hvf_arch_vcpu_destroy(CPUState *cpu)
 {
 }
-- 
2.20.1



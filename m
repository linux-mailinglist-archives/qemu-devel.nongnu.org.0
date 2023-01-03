Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E824465C5FA
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:21:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClri-0000Pu-5y; Tue, 03 Jan 2023 13:18:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrS-0008Oy-2c
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:10 -0500
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrP-0005FO-6M
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:04 -0500
Received: by mail-vk1-xa2d.google.com with SMTP id f184so11693658vkh.2
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YMcPmZrXvRwclxq0TRDUHuwzEJ3xWsfRZYvLnaachU4=;
 b=SHjFVrXWpLrnEQ0o4p8q5ixJ45i80P5jPn9wIDpTIOxCQp+hKHk18iNC7ycAM5uycu
 t1JWPDh+yl8k8PsOokQV76wgqYf1uo52FCBdH0o9b5EFqQIzsXjQfUXfEm8eWojcVxDV
 Lf7S/2bKiUi07pVjIy+e2II3F1SmXCcWPjQ0rfr/yX/TymOrqUK/J4Aztm/BEVvSF5S0
 mVZaabIDhLoYHQ4zV77jpGyWLCIg5DHUk+kW7Wz7BBLe4cz8aHKlwg0GG7qdK5AaAk0R
 tMKlyl3zc6pIVdRjeRpvbxQRcWHEI6wEzUoZ0AxEyoEI2rUuIpLs8zH8WNqCpIIQHcKT
 UpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YMcPmZrXvRwclxq0TRDUHuwzEJ3xWsfRZYvLnaachU4=;
 b=61fKJ4QfxGxx4i7D9tg57HlRy1w55GHC8ojyUWq0rk20C+xmEvp4XFPcBkmAbzV4uI
 PsvtLL6KcFxfX2g5O17JGYVswiTldMALiWGlKNGSFdoayDl0ycXWPKksLQNOCQXERnt5
 I4CAB2xJbx6ibx5egyIZOh5XByqnCnA7QOHOxb/yiXCP4ZERemUDW/ypDNh1kTogQg7Q
 2wKnUPcc5W33lZM1YrcvU7Ap4VR9g99CoMoK0myKZL7tdphTTB3howGaHEbFygu0FEix
 peoxeyS9emPvw8s/pieGt14OSkczDEucOmTRdUuYbwhjOcLYJ/NLcK2modSzK5bDzelf
 ZSaw==
X-Gm-Message-State: AFqh2kqERt6owHcfULYXyA5ru1byYu7vEgHr6/v5DCOBYHe5NPRcutRM
 10uTqBgun19Xe+Kcbp8AjKLYT1bv3/7zOQahX+U=
X-Google-Smtp-Source: AMrXdXuVod44xlv0JMXYoTe4kKGs1Do6jetMZt8F6wdq/uJNHvax/QzRgfyfi4yQLFL3nzhDGLIdPQ==
X-Received: by 2002:a1f:2c57:0:b0:3af:2f14:6567 with SMTP id
 s84-20020a1f2c57000000b003af2f146567mr17359279vks.6.1672769881975; 
 Tue, 03 Jan 2023 10:18:01 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:18:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 24/40] target/arm/hvf: Probe host into ARMCPUClass
Date: Tue,  3 Jan 2023 10:16:30 -0800
Message-Id: <20230103181646.55711-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We can now store these values into ARMCPUClass instead of into
a temporary ARMHostCPUFeatures structure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     |  5 ----
 target/arm/hvf_arm.h |  2 +-
 target/arm/cpu.c     | 13 ----------
 target/arm/cpu64.c   |  4 +--
 target/arm/hvf/hvf.c | 59 +++++++++++---------------------------------
 5 files changed, 17 insertions(+), 66 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 0c5b942ed0..e8dd75b003 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -935,11 +935,6 @@ struct ArchCPU {
     /* KVM steal time */
     OnOffAuto kvm_steal_time;
 
-    /* True if we tried kvm_arm_host_cpu_features() during CPU instance_init
-     * and the probe failed (so we need to report the error in realize)
-     */
-    bool host_cpu_probe_failed;
-
     /* Specify the number of cores in this CPU cluster. Used for the L2CTLR
      * register.
      */
diff --git a/target/arm/hvf_arm.h b/target/arm/hvf_arm.h
index 9a9d1a0bf5..c3b34ba31d 100644
--- a/target/arm/hvf_arm.h
+++ b/target/arm/hvf_arm.h
@@ -13,6 +13,6 @@
 
 #include "cpu.h"
 
-void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu);
+bool hvf_arm_get_host_cpu_features(ARMCPUClass *acc, Error **errp);
 
 #endif
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c58029fb4a..f4d8be6c4c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1584,19 +1584,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     Error *local_err = NULL;
     bool no_aa32 = false;
 
-    /* If we needed to query the host kernel for the CPU features
-     * then it's possible that might have failed in the initfn, but
-     * this is the first point where we can report it.
-     */
-    if (cpu->host_cpu_probe_failed) {
-        if (!kvm_enabled() && !hvf_enabled()) {
-            error_setg(errp, "The 'host' CPU type can only be used with KVM or HVF");
-        } else {
-            error_setg(errp, "Failed to retrieve host CPU features");
-        }
-        return;
-    }
-
 #ifndef CONFIG_USER_ONLY
     /* The NVIC and M-profile CPU are two halves of a single piece of
      * hardware; trying to use one without the other is a command line
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index a21bc39449..f94f775585 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1111,7 +1111,7 @@ static bool aarch64_host_class_late_init(ARMCPUClass *acc, Error **errp)
         return kvm_arm_get_host_cpu_features(acc, errp);
     }
     if (hvf_enabled()) {
-        return true;
+        return hvf_arm_get_host_cpu_features(acc, errp);
     }
     error_setg(errp, "The 'host' CPU type can only be used with KVM or HVF");
     return false;
@@ -1123,8 +1123,6 @@ static void aarch64_host_object_init(Object *obj)
     aarch64_add_sve_properties(obj);
     aarch64_add_pauth_properties(obj);
 #elif defined(CONFIG_HVF)
-    ARMCPU *cpu = ARM_CPU(obj);
-    hvf_arm_set_cpu_features_from_host(cpu);
     aarch64_add_pauth_properties(obj);
 #else
     g_assert_not_reached();
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8bb8b475cd..d47159b9bf 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -95,14 +95,6 @@ typedef struct HVFVTimer {
 
 static HVFVTimer vtimer;
 
-typedef struct ARMHostCPUFeatures {
-    ARMISARegisters isar;
-    uint64_t midr;
-    uint32_t reset_sctlr;
-} ARMHostCPUFeatures;
-
-static ARMHostCPUFeatures arm_host_cpu_features;
-
 struct hvf_reg_match {
     int reg;
     uint64_t offset;
@@ -465,22 +457,21 @@ static uint64_t hvf_get_reg(CPUState *cpu, int rt)
     return val;
 }
 
-static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
+bool hvf_arm_get_host_cpu_features(ARMCPUClass *acc, Error **errp)
 {
-    ARMISARegisters host_isar = {};
     const struct isar_regs {
         int reg;
         uint64_t *val;
     } regs[] = {
-        { HV_SYS_REG_ID_AA64PFR0_EL1, &host_isar.id_aa64pfr0 },
-        { HV_SYS_REG_ID_AA64PFR1_EL1, &host_isar.id_aa64pfr1 },
-        { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.id_aa64dfr0 },
-        { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
-        { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
-        { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
-        { HV_SYS_REG_ID_AA64MMFR0_EL1, &host_isar.id_aa64mmfr0 },
-        { HV_SYS_REG_ID_AA64MMFR1_EL1, &host_isar.id_aa64mmfr1 },
-        { HV_SYS_REG_ID_AA64MMFR2_EL1, &host_isar.id_aa64mmfr2 },
+        { HV_SYS_REG_ID_AA64PFR0_EL1, &acc->isar.id_aa64pfr0 },
+        { HV_SYS_REG_ID_AA64PFR1_EL1, &acc->isar.id_aa64pfr1 },
+        { HV_SYS_REG_ID_AA64DFR0_EL1, &acc->isar.id_aa64dfr0 },
+        { HV_SYS_REG_ID_AA64DFR1_EL1, &acc->isar.id_aa64dfr1 },
+        { HV_SYS_REG_ID_AA64ISAR0_EL1, &acc->isar.id_aa64isar0 },
+        { HV_SYS_REG_ID_AA64ISAR1_EL1, &acc->isar.id_aa64isar1 },
+        { HV_SYS_REG_ID_AA64MMFR0_EL1, &acc->isar.id_aa64mmfr0 },
+        { HV_SYS_REG_ID_AA64MMFR1_EL1, &acc->isar.id_aa64mmfr1 },
+        { HV_SYS_REG_ID_AA64MMFR2_EL1, &acc->isar.id_aa64mmfr2 },
     };
     hv_vcpu_t fd;
     hv_return_t r = HV_SUCCESS;
@@ -496,50 +487,30 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     for (i = 0; i < ARRAY_SIZE(regs); i++) {
         r |= hv_vcpu_get_sys_reg(fd, regs[i].reg, regs[i].val);
     }
-    r |= hv_vcpu_get_sys_reg(fd, HV_SYS_REG_MIDR_EL1, &ahcf->midr);
+    r |= hv_vcpu_get_sys_reg(fd, HV_SYS_REG_MIDR_EL1, &acc->midr);
     r |= hv_vcpu_destroy(fd);
 
-    ahcf->isar = host_isar;
-
     /*
      * A scratch vCPU returns SCTLR 0, so let's fill our default with the M1
      * boot SCTLR from https://github.com/AsahiLinux/m1n1/issues/97
      */
-    ahcf->reset_sctlr = 0x30100180;
+    acc->reset_sctlr = 0x30100180;
+
     /*
      * SPAN is disabled by default when SCTLR.SPAN=1. To improve compatibility,
      * let's disable it on boot and then allow guest software to turn it on by
      * setting it to 0.
      */
-    ahcf->reset_sctlr |= 0x00800000;
+    acc->reset_sctlr |= 0x00800000;
 
     /* Make sure we don't advertise AArch32 support for EL0/EL1 */
-    if ((host_isar.id_aa64pfr0 & 0xff) != 0x11) {
+    if ((acc->isar.id_aa64pfr0 & 0xff) != 0x11) {
         return false;
     }
 
     return r == HV_SUCCESS;
 }
 
-void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu)
-{
-    if (!arm_host_cpu_features.reset_sctlr) {
-        if (!hvf_enabled() ||
-            !hvf_arm_get_host_cpu_features(&arm_host_cpu_features)) {
-            /*
-             * We can't report this error yet, so flag that we need to
-             * in arm_cpu_realizefn().
-             */
-            cpu->host_cpu_probe_failed = true;
-            return;
-        }
-    }
-
-    cpu->isar = arm_host_cpu_features.isar;
-    cpu->midr = arm_host_cpu_features.midr;
-    cpu->reset_sctlr = arm_host_cpu_features.reset_sctlr;
-}
-
 void hvf_arch_vcpu_destroy(CPUState *cpu)
 {
 }
-- 
2.34.1



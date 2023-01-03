Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3A265C62E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:26:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrg-0000KC-PJ; Tue, 03 Jan 2023 13:18:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrE-0008MA-MH
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:53 -0500
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClr9-0005GE-QX
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:52 -0500
Received: by mail-qt1-x836.google.com with SMTP id z12so25178823qtv.5
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zAFkjIGv2XqewT6+4Aqot8thaYlSpZ+Y95cRcOD0ZRc=;
 b=HZNZBFb2d2NqKcpaVWtnHKnPjKe4ViTBG/fLWByQYc/LLvyPZWu81JCAKnrvh9E0Mt
 RYFIXBdjGk5pqLiTZLNx2qd8Z1pZajDo2V1gRNJPHYilwE3/Mwan6XCJNPMqFjnwQI2L
 4dIYcc65GXBFepVTCwxgC45GjsNDxBudCT1GK6lQsljeTGoEkLfQcaPWWxVxRvt0knfr
 8xf7HKlJswpGPToohT85zQa/lVJsZ3DpHBUwuGBNxKgBizlk6Xq7figowGnUtKbn0ZGW
 L0wxjxnbmcg6QIQ51JZZP5qK9vSbPRf3I52Olnw2CZ+pzJ1Qz/9uMkvQEYaryMcjLJjj
 7UWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zAFkjIGv2XqewT6+4Aqot8thaYlSpZ+Y95cRcOD0ZRc=;
 b=N84c3nBr708Iuo2sv+5Z2Sdnrp5gy1C3XPyP+hrLoM4oYeefVRnxwgx1XaoX7efrvB
 kGB6i/H3rIpqnRIs3+Z9zIDnGCu41fUsrH5QWWGykKkewWmkchYAHEb2FCk72hiiiFcC
 Tu5bY69ggTOt8fOdph+qfjM0VrXfTQLe5MQu5UuY5VBSL6u8cSkL86GbfNvrTgtnELX4
 egiKEKl3/oSFXWFDOlhn0il4y8JXoOXEWTcD0dErLmZ/Xl3BADZ2edyRirlwyR48ypQc
 qWOTluuwApzdTGNdKZv9DL2aUXt8FAuDIqBAoj4LWn5mypN7PfFbAJ5Yx/8bJqBltf/T
 ZPxw==
X-Gm-Message-State: AFqh2kr4is57J/SNIkDpDQKblBsdqFbxQt0BXlz4UizO9rjUZeYr4wYC
 KWsqpbIh02uyt4ipsXgnbRB3GHQUF/5hsgA7xLQ=
X-Google-Smtp-Source: AMrXdXvRYR9a9N4OUMqmMM+aVfujD/fXjWhE8JRhkkGRMon2wvjOf6rsu4ANua43QOY4SsRrNy+FTA==
X-Received: by 2002:ac8:6a07:0:b0:39c:e105:6a14 with SMTP id
 t7-20020ac86a07000000b0039ce1056a14mr62230224qtr.26.1672769866562; 
 Tue, 03 Jan 2023 10:17:46 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 19/40] target/arm: Move most cpu initialization to the
 class
Date: Tue,  3 Jan 2023 10:16:25 -0800
Message-Id: <20230103181646.55711-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
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

Quite a lot of the cpu definition is constant, and can be initialized
once with the type, rather than for each object instance.  For now,
leave the "host" cpu with the object init.

Note that the "max" class (and even a converted "host") must be delayed
until accellerator init, which itself is delayed until after board init,
which already creates all of the types.  Thus we invent our own hook.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-qom.h   |   3 +-
 target/arm/internals.h |   6 +-
 target/arm/cpu.c       |  23 +-
 target/arm/cpu64.c     | 227 +++++++++----------
 target/arm/cpu_tcg.c   | 496 ++++++++++++++++++-----------------------
 5 files changed, 355 insertions(+), 400 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 36d7fa9779..6b113d7fe6 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -35,8 +35,9 @@ OBJECT_DECLARE_CPU_TYPE(ARMCPU, ARMCPUClass, ARM_CPU)
 
 typedef struct ARMCPUInfo {
     const char *name;
-    void (*initfn)(Object *obj);
+    void (*object_init)(Object *obj);
     void (*class_init)(ARMCPUClass *acc);
+    bool (*class_late_init)(ARMCPUClass *acc, Error **errp);
 } ARMCPUInfo;
 
 void arm_cpu_register_parent(const ARMCPUInfo *info, const char *parent);
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 161e42d50f..3feed370e7 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1347,14 +1347,14 @@ void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #endif
 
 #ifdef CONFIG_USER_ONLY
-static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
+static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPUClass *acc) { }
 #else
-void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
+void define_cortex_a72_a57_a53_cp_reginfo(ARMCPUClass *acc);
 #endif
 
 bool el_is_in_host(CPUARMState *env, int el);
 
-void aa32_max_features(ARMCPU *cpu);
+void aa32_max_features(ARMCPUClass *acc);
 int exception_target_el(CPUARMState *env);
 bool arm_singlestep_active(CPUARMState *env);
 bool arm_generate_debug_exceptions(CPUARMState *env);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index da58f1fae7..c58029fb4a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2351,23 +2351,35 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 static void arm_cpu_leaf_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
-    const ARMCPUInfo *info = data;
 
-    acc->info = info;
     acc->cp_regs = g_hash_table_new_full(g_direct_hash, g_direct_equal,
                                          NULL, g_free);
-    if (info->class_init) {
-        info->class_init(acc);
+
+    acc->info = data;
+    if (acc->info->class_init) {
+        acc->info->class_init(acc);
     }
 }
 
+static bool arm_cpu_class_late_init(ObjectClass *oc, Error **errp)
+{
+    ARMCPUClass *acc = ARM_CPU_CLASS(oc);
+
+    if (acc->info->class_late_init) {
+        if (!acc->info->class_late_init(acc, errp)) {
+            return false;
+        }
+    }
+    return true;
+}
+
 void arm_cpu_register_parent(const ARMCPUInfo *info, const char *parent)
 {
     TypeInfo type_info = {
         .parent = parent,
         .instance_size = sizeof(ARMCPU),
         .instance_align = __alignof__(ARMCPU),
-        .instance_init = info->initfn,
+        .instance_init = info->object_init,
         .class_size = sizeof(ARMCPUClass),
         .class_init = arm_cpu_leaf_class_init,
         .class_data = (void *)info,
@@ -2389,6 +2401,7 @@ static const TypeInfo arm_cpu_type_info = {
     .abstract = true,
     .class_size = sizeof(ARMCPUClass),
     .class_init = arm_cpu_class_init,
+    .class_late_init = arm_cpu_class_late_init,
 };
 
 static void arm_cpu_register_types(void)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1d3aff868d..28b5a07244 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -36,19 +36,17 @@
 #include "hw/qdev-properties.h"
 #include "internals.h"
 
-static void aarch64_a35_initfn(Object *obj)
+static void aarch64_a35_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "arm,cortex-a35";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    set_class_feature(cpu, ARM_FEATURE_V8);
+    set_class_feature(cpu, ARM_FEATURE_NEON);
+    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(cpu, ARM_FEATURE_AARCH64);
+    set_class_feature(cpu, ARM_FEATURE_CBAR_RO);
+    set_class_feature(cpu, ARM_FEATURE_EL2);
+    set_class_feature(cpu, ARM_FEATURE_EL3);
+    set_class_feature(cpu, ARM_FEATURE_PMU);
 
     /* From B2.2 AArch64 identification registers. */
     cpu->midr = 0x411fd040;
@@ -678,19 +676,17 @@ void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
     cpu->isar.id_aa64mmfr0 = t;
 }
 
-static void aarch64_a57_initfn(Object *obj)
+static void aarch64_a57_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "arm,cortex-a57";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    set_class_feature(cpu, ARM_FEATURE_V8);
+    set_class_feature(cpu, ARM_FEATURE_NEON);
+    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(cpu, ARM_FEATURE_AARCH64);
+    set_class_feature(cpu, ARM_FEATURE_CBAR_RO);
+    set_class_feature(cpu, ARM_FEATURE_EL2);
+    set_class_feature(cpu, ARM_FEATURE_EL3);
+    set_class_feature(cpu, ARM_FEATURE_PMU);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
     cpu->midr = 0x411fd070;
     cpu->revidr = 0x00000000;
@@ -735,19 +731,17 @@ static void aarch64_a57_initfn(Object *obj)
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
-static void aarch64_a53_initfn(Object *obj)
+static void aarch64_a53_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "arm,cortex-a53";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    set_class_feature(cpu, ARM_FEATURE_V8);
+    set_class_feature(cpu, ARM_FEATURE_NEON);
+    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(cpu, ARM_FEATURE_AARCH64);
+    set_class_feature(cpu, ARM_FEATURE_CBAR_RO);
+    set_class_feature(cpu, ARM_FEATURE_EL2);
+    set_class_feature(cpu, ARM_FEATURE_EL3);
+    set_class_feature(cpu, ARM_FEATURE_PMU);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A53;
     cpu->midr = 0x410fd034;
     cpu->revidr = 0x00000000;
@@ -792,19 +786,17 @@ static void aarch64_a53_initfn(Object *obj)
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
-static void aarch64_a55_initfn(Object *obj)
+static void aarch64_a55_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "arm,cortex-a55";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    set_class_feature(cpu, ARM_FEATURE_V8);
+    set_class_feature(cpu, ARM_FEATURE_NEON);
+    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(cpu, ARM_FEATURE_AARCH64);
+    set_class_feature(cpu, ARM_FEATURE_CBAR_RO);
+    set_class_feature(cpu, ARM_FEATURE_EL2);
+    set_class_feature(cpu, ARM_FEATURE_EL3);
+    set_class_feature(cpu, ARM_FEATURE_PMU);
 
     /* Ordered by B2.4 AArch64 registers by functional group */
     cpu->clidr = 0x82000023;
@@ -860,19 +852,17 @@ static void aarch64_a55_initfn(Object *obj)
     cpu->isar.reset_pmcr_el0 = 0x410b3000;
 }
 
-static void aarch64_a72_initfn(Object *obj)
+static void aarch64_a72_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "arm,cortex-a72";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    set_class_feature(cpu, ARM_FEATURE_V8);
+    set_class_feature(cpu, ARM_FEATURE_NEON);
+    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(cpu, ARM_FEATURE_AARCH64);
+    set_class_feature(cpu, ARM_FEATURE_CBAR_RO);
+    set_class_feature(cpu, ARM_FEATURE_EL2);
+    set_class_feature(cpu, ARM_FEATURE_EL3);
+    set_class_feature(cpu, ARM_FEATURE_PMU);
     cpu->midr = 0x410fd083;
     cpu->revidr = 0x00000000;
     cpu->reset_fpsid = 0x41034080;
@@ -915,19 +905,17 @@ static void aarch64_a72_initfn(Object *obj)
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
-static void aarch64_a76_initfn(Object *obj)
+static void aarch64_a76_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "arm,cortex-a76";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    set_class_feature(cpu, ARM_FEATURE_V8);
+    set_class_feature(cpu, ARM_FEATURE_NEON);
+    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(cpu, ARM_FEATURE_AARCH64);
+    set_class_feature(cpu, ARM_FEATURE_CBAR_RO);
+    set_class_feature(cpu, ARM_FEATURE_EL2);
+    set_class_feature(cpu, ARM_FEATURE_EL3);
+    set_class_feature(cpu, ARM_FEATURE_PMU);
 
     /* Ordered by B2.4 AArch64 registers by functional group */
     cpu->clidr = 0x82000023;
@@ -984,18 +972,16 @@ static void aarch64_a76_initfn(Object *obj)
     cpu->isar.reset_pmcr_el0 = 0x410b3000;
 }
 
-static void aarch64_a64fx_initfn(Object *obj)
+static void aarch64_a64fx_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "arm,a64fx";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    set_class_feature(cpu, ARM_FEATURE_V8);
+    set_class_feature(cpu, ARM_FEATURE_NEON);
+    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(cpu, ARM_FEATURE_AARCH64);
+    set_class_feature(cpu, ARM_FEATURE_EL2);
+    set_class_feature(cpu, ARM_FEATURE_EL3);
+    set_class_feature(cpu, ARM_FEATURE_PMU);
     cpu->midr = 0x461f0010;
     cpu->revidr = 0x00000000;
     cpu->ctr = 0x86668006;
@@ -1021,31 +1007,33 @@ static void aarch64_a64fx_initfn(Object *obj)
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
     cpu->gic_pribits = 5;
+    cpu->isar.reset_pmcr_el0 = 0x46014040;
+
+    /* TODO:  Add A64FX specific HPC extension registers */
+}
+
+static void aarch64_a64fx_object_init(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
 
     /* The A64FX supports only 128, 256 and 512 bit vector lengths */
     aarch64_add_sve_properties(obj);
     cpu->sve_vq.supported = (1 << 0)  /* 128bit */
                           | (1 << 1)  /* 256bit */
                           | (1 << 3); /* 512bit */
-
-    cpu->isar.reset_pmcr_el0 = 0x46014040;
-
-    /* TODO:  Add A64FX specific HPC extension registers */
 }
 
-static void aarch64_neoverse_n1_initfn(Object *obj)
+static void aarch64_neoverse_n1_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "arm,neoverse-n1";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    set_class_feature(cpu, ARM_FEATURE_V8);
+    set_class_feature(cpu, ARM_FEATURE_NEON);
+    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(cpu, ARM_FEATURE_AARCH64);
+    set_class_feature(cpu, ARM_FEATURE_CBAR_RO);
+    set_class_feature(cpu, ARM_FEATURE_EL2);
+    set_class_feature(cpu, ARM_FEATURE_EL3);
+    set_class_feature(cpu, ARM_FEATURE_PMU);
 
     /* Ordered by B2.4 AArch64 registers by functional group */
     cpu->clidr = 0x82000023;
@@ -1102,7 +1090,7 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
     cpu->isar.reset_pmcr_el0 = 0x410c3000;
 }
 
-static void aarch64_host_initfn(Object *obj)
+static void aarch64_host_object_init(Object *obj)
 {
 #if defined(CONFIG_KVM)
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1120,26 +1108,24 @@ static void aarch64_host_initfn(Object *obj)
 #endif
 }
 
-/* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
- * otherwise, a CPU with as many features enabled as our emulation supports.
+/*
+ * -cpu max: if hardware acceleration is enabled, like -cpu host
+ * (best possible with this host); otherwise, a CPU with as many
+ * features enabled as TCG supports.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
- * this only needs to handle 64 bits.
+ * this version only needs to handle 64 bits.
  */
-static void aarch64_max_initfn(Object *obj)
+static bool aarch64_max_class_late_init(ARMCPUClass *cpu, Error **errp)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
     uint64_t t;
     uint32_t u;
 
     if (kvm_enabled() || hvf_enabled()) {
-        /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
-        aarch64_host_initfn(obj);
-        return;
+        return true;
     }
 
     /* '-cpu max' for TCG: we currently do this as "A57 with extra things" */
-
-    aarch64_a57_initfn(obj);
+    aarch64_a57_class_init(cpu);
 
     /*
      * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
@@ -1296,6 +1282,18 @@ static void aarch64_max_initfn(Object *obj)
     cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
     cpu->dcz_blocksize = 7; /*  512 bytes */
 #endif
+    return true;
+}
+
+static void aarch64_max_object_init(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    if (kvm_enabled() || hvf_enabled()) {
+        /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
+        aarch64_host_object_init(obj);
+        return;
+    }
 
     cpu->sve_vq.supported = MAKE_64BIT_MASK(0, ARM_MAX_VQ);
     cpu->sme_vq.supported = SVE_VQ_POW2_MAP;
@@ -1309,17 +1307,22 @@ static void aarch64_max_initfn(Object *obj)
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
-    { .name = "cortex-a35",         .initfn = aarch64_a35_initfn },
-    { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
-    { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
-    { .name = "cortex-a55",         .initfn = aarch64_a55_initfn },
-    { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
-    { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
-    { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
-    { .name = "neoverse-n1",        .initfn = aarch64_neoverse_n1_initfn },
-    { .name = "max",                .initfn = aarch64_max_initfn },
+    { .name = "cortex-a35", .class_init = aarch64_a35_class_init },
+    { .name = "cortex-a57", .class_init = aarch64_a57_class_init },
+    { .name = "cortex-a53", .class_init = aarch64_a53_class_init },
+    { .name = "cortex-a55", .class_init = aarch64_a55_class_init },
+    { .name = "cortex-a72", .class_init = aarch64_a72_class_init },
+    { .name = "cortex-a76", .class_init = aarch64_a76_class_init },
+    { .name = "neoverse-n1", .class_init = aarch64_neoverse_n1_class_init },
+    { .name = "a64fx",
+      .class_init = aarch64_a64fx_class_init,
+      .object_init = aarch64_a64fx_object_init },
+    { .name = "max",
+      .class_late_init = aarch64_max_class_late_init,
+      .object_init = aarch64_max_object_init },
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-    { .name = "host",               .initfn = aarch64_host_initfn },
+    { .name = "host",
+      .object_init = aarch64_host_object_init },
 #endif
 };
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 7514065d5b..f35b4a52b0 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -22,7 +22,7 @@
 
 
 /* Share AArch32 -cpu max features with AArch64. */
-void aa32_max_features(ARMCPU *cpu)
+void aa32_max_features(ARMCPUClass *cpu)
 {
     uint32_t t;
 
@@ -143,9 +143,9 @@ static const ARMCPRegInfo cortex_a72_a57_a53_cp_reginfo[] = {
       .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
 };
 
-void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu)
+void define_cortex_a72_a57_a53_cp_reginfo(ARMCPUClass *acc)
 {
-    define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
+    define_arm_cp_regs_with_class(acc, cortex_a72_a57_a53_cp_reginfo, NULL);
 }
 #endif /* !CONFIG_USER_ONLY */
 
@@ -178,14 +178,12 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 }
 #endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
 
-static void arm926_initfn(Object *obj)
+static void arm926_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "arm,arm926";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_TEST_CLEAN);
+    set_class_feature(cpu, ARM_FEATURE_V5);
+    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
+    set_class_feature(cpu, ARM_FEATURE_CACHE_TEST_CLEAN);
     cpu->midr = 0x41069265;
     cpu->reset_fpsid = 0x41011090;
     cpu->ctr = 0x1dd20d2;
@@ -205,28 +203,32 @@ static void arm926_initfn(Object *obj)
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
 }
 
-static void arm946_initfn(Object *obj)
+static void arm946_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "arm,arm946";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_PMSA);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_class_feature(cpu, ARM_FEATURE_V5);
+    set_class_feature(cpu, ARM_FEATURE_PMSA);
+    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
     cpu->midr = 0x41059461;
     cpu->ctr = 0x0f004006;
     cpu->reset_sctlr = 0x00000078;
 }
 
-static void arm1026_initfn(Object *obj)
+static void arm1026_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
+    /* The 1026 had an IFAR at c6,c0,0,1 rather than the ARMv6 c6,c0,0,2 */
+    static const ARMCPRegInfo ifar[1] = {
+        { .name = "IFAR", .cp = 15, .crn = 6, .crm = 0, .opc1 = 0, .opc2 = 1,
+          .access = PL1_RW,
+          .fieldoffset = offsetof(CPUARMState, cp15.ifar_ns),
+          .resetvalue = 0 }
+    };
 
     cpu->dtb_compatible = "arm,arm1026";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_AUXCR);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_TEST_CLEAN);
+    set_class_feature(cpu, ARM_FEATURE_V5);
+    set_class_feature(cpu, ARM_FEATURE_AUXCR);
+    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
+    set_class_feature(cpu, ARM_FEATURE_CACHE_TEST_CLEAN);
     cpu->midr = 0x4106a262;
     cpu->reset_fpsid = 0x410110a0;
     cpu->ctr = 0x1dd20d2;
@@ -246,21 +248,11 @@ static void arm1026_initfn(Object *obj)
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSP, 1);
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
 
-    {
-        /* The 1026 had an IFAR at c6,c0,0,1 rather than the ARMv6 c6,c0,0,2 */
-        ARMCPRegInfo ifar = {
-            .name = "IFAR", .cp = 15, .crn = 6, .crm = 0, .opc1 = 0, .opc2 = 1,
-            .access = PL1_RW,
-            .fieldoffset = offsetof(CPUARMState, cp15.ifar_ns),
-            .resetvalue = 0
-        };
-        define_one_arm_cp_reg(cpu, &ifar);
-    }
+    define_arm_cp_regs_with_class(cpu, ifar, NULL);
 }
 
-static void arm1136_r2_initfn(Object *obj)
+static void arm1136_r2_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
     /*
      * What qemu calls "arm1136_r2" is actually the 1136 r0p2, ie an
      * older core than plain "arm1136". In particular this does not
@@ -271,10 +263,10 @@ static void arm1136_r2_initfn(Object *obj)
      */
 
     cpu->dtb_compatible = "arm,arm1136";
-    set_feature(&cpu->env, ARM_FEATURE_V6);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_DIRTY_REG);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_BLOCK_OPS);
+    set_class_feature(cpu, ARM_FEATURE_V6);
+    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
+    set_class_feature(cpu, ARM_FEATURE_CACHE_DIRTY_REG);
+    set_class_feature(cpu, ARM_FEATURE_CACHE_BLOCK_OPS);
     cpu->midr = 0x4107b362;
     cpu->reset_fpsid = 0x410120b4;
     cpu->isar.mvfr0 = 0x11111111;
@@ -296,16 +288,14 @@ static void arm1136_r2_initfn(Object *obj)
     cpu->reset_auxcr = 7;
 }
 
-static void arm1136_initfn(Object *obj)
+static void arm1136_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "arm,arm1136";
-    set_feature(&cpu->env, ARM_FEATURE_V6K);
-    set_feature(&cpu->env, ARM_FEATURE_V6);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_DIRTY_REG);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_BLOCK_OPS);
+    set_class_feature(cpu, ARM_FEATURE_V6K);
+    set_class_feature(cpu, ARM_FEATURE_V6);
+    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
+    set_class_feature(cpu, ARM_FEATURE_CACHE_DIRTY_REG);
+    set_class_feature(cpu, ARM_FEATURE_CACHE_BLOCK_OPS);
     cpu->midr = 0x4117b363;
     cpu->reset_fpsid = 0x410120b4;
     cpu->isar.mvfr0 = 0x11111111;
@@ -327,17 +317,15 @@ static void arm1136_initfn(Object *obj)
     cpu->reset_auxcr = 7;
 }
 
-static void arm1176_initfn(Object *obj)
+static void arm1176_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "arm,arm1176";
-    set_feature(&cpu->env, ARM_FEATURE_V6K);
-    set_feature(&cpu->env, ARM_FEATURE_VAPA);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_DIRTY_REG);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_BLOCK_OPS);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_class_feature(cpu, ARM_FEATURE_V6K);
+    set_class_feature(cpu, ARM_FEATURE_VAPA);
+    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
+    set_class_feature(cpu, ARM_FEATURE_CACHE_DIRTY_REG);
+    set_class_feature(cpu, ARM_FEATURE_CACHE_BLOCK_OPS);
+    set_class_feature(cpu, ARM_FEATURE_EL3);
     cpu->midr = 0x410fb767;
     cpu->reset_fpsid = 0x410120b5;
     cpu->isar.mvfr0 = 0x11111111;
@@ -359,15 +347,13 @@ static void arm1176_initfn(Object *obj)
     cpu->reset_auxcr = 7;
 }
 
-static void arm11mpcore_initfn(Object *obj)
+static void arm11mpcore_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "arm,arm11mpcore";
-    set_feature(&cpu->env, ARM_FEATURE_V6K);
-    set_feature(&cpu->env, ARM_FEATURE_VAPA);
-    set_feature(&cpu->env, ARM_FEATURE_MPIDR);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_class_feature(cpu, ARM_FEATURE_V6K);
+    set_class_feature(cpu, ARM_FEATURE_VAPA);
+    set_class_feature(cpu, ARM_FEATURE_MPIDR);
+    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
     cpu->midr = 0x410fb022;
     cpu->reset_fpsid = 0x410120b4;
     cpu->isar.mvfr0 = 0x11111111;
@@ -395,16 +381,14 @@ static const ARMCPRegInfo cortexa8_cp_reginfo[] = {
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 
-static void cortex_a8_initfn(Object *obj)
+static void cortex_a8_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "arm,cortex-a8";
-    set_feature(&cpu->env, ARM_FEATURE_V7);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_class_feature(cpu, ARM_FEATURE_V7);
+    set_class_feature(cpu, ARM_FEATURE_NEON);
+    set_class_feature(cpu, ARM_FEATURE_THUMB2EE);
+    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
+    set_class_feature(cpu, ARM_FEATURE_EL3);
     cpu->midr = 0x410fc080;
     cpu->reset_fpsid = 0x410330c0;
     cpu->isar.mvfr0 = 0x11110222;
@@ -431,7 +415,7 @@ static void cortex_a8_initfn(Object *obj)
     cpu->ccsidr[2] = 0xf0000000; /* No L2 icache. */
     cpu->reset_auxcr = 2;
     cpu->isar.reset_pmcr_el0 = 0x41002000;
-    define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
+    define_arm_cp_regs_with_class(cpu, cortexa8_cp_reginfo, NULL);
 }
 
 static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
@@ -463,22 +447,20 @@ static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
       .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
 };
 
-static void cortex_a9_initfn(Object *obj)
+static void cortex_a9_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "arm,cortex-a9";
-    set_feature(&cpu->env, ARM_FEATURE_V7);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_class_feature(cpu, ARM_FEATURE_V7);
+    set_class_feature(cpu, ARM_FEATURE_NEON);
+    set_class_feature(cpu, ARM_FEATURE_THUMB2EE);
+    set_class_feature(cpu, ARM_FEATURE_EL3);
     /*
      * Note that A9 supports the MP extensions even for
      * A9UP and single-core A9MP (which are both different
      * and valid configurations; we don't model A9UP).
      */
-    set_feature(&cpu->env, ARM_FEATURE_V7MP);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR);
+    set_class_feature(cpu, ARM_FEATURE_V7MP);
+    set_class_feature(cpu, ARM_FEATURE_CBAR);
     cpu->midr = 0x410fc090;
     cpu->reset_fpsid = 0x41033090;
     cpu->isar.mvfr0 = 0x11110222;
@@ -503,7 +485,7 @@ static void cortex_a9_initfn(Object *obj)
     cpu->ccsidr[0] = 0xe00fe019; /* 16k L1 dcache. */
     cpu->ccsidr[1] = 0x200fe019; /* 16k L1 icache. */
     cpu->isar.reset_pmcr_el0 = 0x41093000;
-    define_arm_cp_regs(cpu, cortexa9_cp_reginfo);
+    define_arm_cp_regs_with_class(cpu, cortexa9_cp_reginfo, NULL);
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -529,20 +511,18 @@ static const ARMCPRegInfo cortexa15_cp_reginfo[] = {
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 
-static void cortex_a7_initfn(Object *obj)
+static void cortex_a7_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "arm,cortex-a7";
-    set_feature(&cpu->env, ARM_FEATURE_V7VE);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    set_class_feature(cpu, ARM_FEATURE_V7VE);
+    set_class_feature(cpu, ARM_FEATURE_NEON);
+    set_class_feature(cpu, ARM_FEATURE_THUMB2EE);
+    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
+    set_class_feature(cpu, ARM_FEATURE_CBAR_RO);
+    set_class_feature(cpu, ARM_FEATURE_EL2);
+    set_class_feature(cpu, ARM_FEATURE_EL3);
+    set_class_feature(cpu, ARM_FEATURE_PMU);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A7;
     cpu->midr = 0x410fc075;
     cpu->reset_fpsid = 0x41023075;
@@ -575,23 +555,23 @@ static void cortex_a7_initfn(Object *obj)
     cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
     cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
     cpu->isar.reset_pmcr_el0 = 0x41072000;
-    define_arm_cp_regs(cpu, cortexa15_cp_reginfo); /* Same as A15 */
+
+    /* Same as A15 */
+    define_arm_cp_regs_with_class(cpu, cortexa15_cp_reginfo, NULL);
 }
 
-static void cortex_a15_initfn(Object *obj)
+static void cortex_a15_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "arm,cortex-a15";
-    set_feature(&cpu->env, ARM_FEATURE_V7VE);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    set_class_feature(cpu, ARM_FEATURE_V7VE);
+    set_class_feature(cpu, ARM_FEATURE_NEON);
+    set_class_feature(cpu, ARM_FEATURE_THUMB2EE);
+    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
+    set_class_feature(cpu, ARM_FEATURE_CBAR_RO);
+    set_class_feature(cpu, ARM_FEATURE_EL2);
+    set_class_feature(cpu, ARM_FEATURE_EL3);
+    set_class_feature(cpu, ARM_FEATURE_PMU);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A15;
     /* r4p0 cpu, not requiring expensive tlb flush errata */
     cpu->midr = 0x414fc0f0;
@@ -622,14 +602,13 @@ static void cortex_a15_initfn(Object *obj)
     cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
     cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
     cpu->isar.reset_pmcr_el0 = 0x410F3000;
-    define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
+    define_arm_cp_regs_with_class(cpu, cortexa15_cp_reginfo, NULL);
 }
 
-static void cortex_m0_initfn(Object *obj)
+static void cortex_m0_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-    set_feature(&cpu->env, ARM_FEATURE_V6);
-    set_feature(&cpu->env, ARM_FEATURE_M);
+    set_class_feature(cpu, ARM_FEATURE_V6);
+    set_class_feature(cpu, ARM_FEATURE_M);
 
     cpu->midr = 0x410cc200;
 
@@ -658,12 +637,11 @@ static void cortex_m0_initfn(Object *obj)
     cpu->isar.id_isar6 = 0x00000000;
 }
 
-static void cortex_m3_initfn(Object *obj)
+static void cortex_m3_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-    set_feature(&cpu->env, ARM_FEATURE_V7);
-    set_feature(&cpu->env, ARM_FEATURE_M);
-    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
+    set_class_feature(cpu, ARM_FEATURE_V7);
+    set_class_feature(cpu, ARM_FEATURE_M);
+    set_class_feature(cpu, ARM_FEATURE_M_MAIN);
     cpu->midr = 0x410fc231;
     cpu->pmsav7_dregion = 8;
     cpu->isar.id_pfr0 = 0x00000030;
@@ -683,14 +661,12 @@ static void cortex_m3_initfn(Object *obj)
     cpu->isar.id_isar6 = 0x00000000;
 }
 
-static void cortex_m4_initfn(Object *obj)
+static void cortex_m4_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    set_feature(&cpu->env, ARM_FEATURE_V7);
-    set_feature(&cpu->env, ARM_FEATURE_M);
-    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
+    set_class_feature(cpu, ARM_FEATURE_V7);
+    set_class_feature(cpu, ARM_FEATURE_M);
+    set_class_feature(cpu, ARM_FEATURE_M_MAIN);
+    set_class_feature(cpu, ARM_FEATURE_THUMB_DSP);
     cpu->midr = 0x410fc240; /* r0p0 */
     cpu->pmsav7_dregion = 8;
     cpu->isar.mvfr0 = 0x10110021;
@@ -713,14 +689,12 @@ static void cortex_m4_initfn(Object *obj)
     cpu->isar.id_isar6 = 0x00000000;
 }
 
-static void cortex_m7_initfn(Object *obj)
+static void cortex_m7_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    set_feature(&cpu->env, ARM_FEATURE_V7);
-    set_feature(&cpu->env, ARM_FEATURE_M);
-    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
+    set_class_feature(cpu, ARM_FEATURE_V7);
+    set_class_feature(cpu, ARM_FEATURE_M);
+    set_class_feature(cpu, ARM_FEATURE_M_MAIN);
+    set_class_feature(cpu, ARM_FEATURE_THUMB_DSP);
     cpu->midr = 0x411fc272; /* r1p2 */
     cpu->pmsav7_dregion = 8;
     cpu->isar.mvfr0 = 0x10110221;
@@ -743,15 +717,13 @@ static void cortex_m7_initfn(Object *obj)
     cpu->isar.id_isar6 = 0x00000000;
 }
 
-static void cortex_m33_initfn(Object *obj)
+static void cortex_m33_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_M);
-    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
-    set_feature(&cpu->env, ARM_FEATURE_M_SECURITY);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
+    set_class_feature(cpu, ARM_FEATURE_V8);
+    set_class_feature(cpu, ARM_FEATURE_M);
+    set_class_feature(cpu, ARM_FEATURE_M_MAIN);
+    set_class_feature(cpu, ARM_FEATURE_M_SECURITY);
+    set_class_feature(cpu, ARM_FEATURE_THUMB_DSP);
     cpu->midr = 0x410fd213; /* r0p3 */
     cpu->pmsav7_dregion = 16;
     cpu->sau_sregion = 8;
@@ -777,16 +749,14 @@ static void cortex_m33_initfn(Object *obj)
     cpu->ctr = 0x8000c000;
 }
 
-static void cortex_m55_initfn(Object *obj)
+static void cortex_m55_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_V8_1M);
-    set_feature(&cpu->env, ARM_FEATURE_M);
-    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
-    set_feature(&cpu->env, ARM_FEATURE_M_SECURITY);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
+    set_class_feature(cpu, ARM_FEATURE_V8);
+    set_class_feature(cpu, ARM_FEATURE_V8_1M);
+    set_class_feature(cpu, ARM_FEATURE_M);
+    set_class_feature(cpu, ARM_FEATURE_M_MAIN);
+    set_class_feature(cpu, ARM_FEATURE_M_SECURITY);
+    set_class_feature(cpu, ARM_FEATURE_THUMB_DSP);
     cpu->midr = 0x410fd221; /* r0p1 */
     cpu->revidr = 0;
     cpu->pmsav7_dregion = 16;
@@ -824,14 +794,12 @@ static const ARMCPRegInfo cortexr5_cp_reginfo[] = {
       .opc2 = 0, .access = PL1_W, .type = ARM_CP_NOP },
 };
 
-static void cortex_r5_initfn(Object *obj)
+static void cortex_r5_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    set_feature(&cpu->env, ARM_FEATURE_V7);
-    set_feature(&cpu->env, ARM_FEATURE_V7MP);
-    set_feature(&cpu->env, ARM_FEATURE_PMSA);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    set_class_feature(cpu, ARM_FEATURE_V7);
+    set_class_feature(cpu, ARM_FEATURE_V7MP);
+    set_class_feature(cpu, ARM_FEATURE_PMSA);
+    set_class_feature(cpu, ARM_FEATURE_PMU);
     cpu->midr = 0x411fc153; /* r1p3 */
     cpu->isar.id_pfr0 = 0x0131;
     cpu->isar.id_pfr1 = 0x001;
@@ -850,181 +818,153 @@ static void cortex_r5_initfn(Object *obj)
     cpu->isar.id_isar6 = 0x0;
     cpu->pmsav7_dregion = 16;
     cpu->isar.reset_pmcr_el0 = 0x41151800;
-    define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
+    define_arm_cp_regs_with_class(cpu, cortexr5_cp_reginfo, NULL);
 }
 
-static void cortex_r5f_initfn(Object *obj)
+static void cortex_r5f_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cortex_r5_initfn(obj);
+    cortex_r5_class_init(cpu);
     cpu->isar.mvfr0 = 0x10110221;
     cpu->isar.mvfr1 = 0x00000011;
 }
 
-static void ti925t_initfn(Object *obj)
+static void ti925t_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-    set_feature(&cpu->env, ARM_FEATURE_V4T);
-    set_feature(&cpu->env, ARM_FEATURE_OMAPCP);
+    set_class_feature(cpu, ARM_FEATURE_V4T);
+    set_class_feature(cpu, ARM_FEATURE_OMAPCP);
     cpu->midr = ARM_CPUID_TI925T;
     cpu->ctr = 0x5109149;
     cpu->reset_sctlr = 0x00000070;
 }
 
-static void sa1100_initfn(Object *obj)
+static void sa1100_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "intel,sa1100";
-    set_feature(&cpu->env, ARM_FEATURE_STRONGARM);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_class_feature(cpu, ARM_FEATURE_STRONGARM);
+    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
     cpu->midr = 0x4401A11B;
     cpu->reset_sctlr = 0x00000070;
 }
 
-static void sa1110_initfn(Object *obj)
+static void sa1110_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-    set_feature(&cpu->env, ARM_FEATURE_STRONGARM);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_class_feature(cpu, ARM_FEATURE_STRONGARM);
+    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
     cpu->midr = 0x6901B119;
     cpu->reset_sctlr = 0x00000070;
 }
 
-static void pxa250_initfn(Object *obj)
+static void pxa250_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    set_class_feature(cpu, ARM_FEATURE_V5);
+    set_class_feature(cpu, ARM_FEATURE_XSCALE);
     cpu->midr = 0x69052100;
     cpu->ctr = 0xd172172;
     cpu->reset_sctlr = 0x00000078;
 }
 
-static void pxa255_initfn(Object *obj)
+static void pxa255_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    set_class_feature(cpu, ARM_FEATURE_V5);
+    set_class_feature(cpu, ARM_FEATURE_XSCALE);
     cpu->midr = 0x69052d00;
     cpu->ctr = 0xd172172;
     cpu->reset_sctlr = 0x00000078;
 }
 
-static void pxa260_initfn(Object *obj)
+static void pxa260_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    set_class_feature(cpu, ARM_FEATURE_V5);
+    set_class_feature(cpu, ARM_FEATURE_XSCALE);
     cpu->midr = 0x69052903;
     cpu->ctr = 0xd172172;
     cpu->reset_sctlr = 0x00000078;
 }
 
-static void pxa261_initfn(Object *obj)
+static void pxa261_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    set_class_feature(cpu, ARM_FEATURE_V5);
+    set_class_feature(cpu, ARM_FEATURE_XSCALE);
     cpu->midr = 0x69052d05;
     cpu->ctr = 0xd172172;
     cpu->reset_sctlr = 0x00000078;
 }
 
-static void pxa262_initfn(Object *obj)
+static void pxa262_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    set_class_feature(cpu, ARM_FEATURE_V5);
+    set_class_feature(cpu, ARM_FEATURE_XSCALE);
     cpu->midr = 0x69052d06;
     cpu->ctr = 0xd172172;
     cpu->reset_sctlr = 0x00000078;
 }
 
-static void pxa270a0_initfn(Object *obj)
+static void pxa270a0_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
+    set_class_feature(cpu, ARM_FEATURE_V5);
+    set_class_feature(cpu, ARM_FEATURE_XSCALE);
+    set_class_feature(cpu, ARM_FEATURE_IWMMXT);
     cpu->midr = 0x69054110;
     cpu->ctr = 0xd172172;
     cpu->reset_sctlr = 0x00000078;
 }
 
-static void pxa270a1_initfn(Object *obj)
+static void pxa270a1_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
+    set_class_feature(cpu, ARM_FEATURE_V5);
+    set_class_feature(cpu, ARM_FEATURE_XSCALE);
+    set_class_feature(cpu, ARM_FEATURE_IWMMXT);
     cpu->midr = 0x69054111;
     cpu->ctr = 0xd172172;
     cpu->reset_sctlr = 0x00000078;
 }
 
-static void pxa270b0_initfn(Object *obj)
+static void pxa270b0_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
+    set_class_feature(cpu, ARM_FEATURE_V5);
+    set_class_feature(cpu, ARM_FEATURE_XSCALE);
+    set_class_feature(cpu, ARM_FEATURE_IWMMXT);
     cpu->midr = 0x69054112;
     cpu->ctr = 0xd172172;
     cpu->reset_sctlr = 0x00000078;
 }
 
-static void pxa270b1_initfn(Object *obj)
+static void pxa270b1_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
+    set_class_feature(cpu, ARM_FEATURE_V5);
+    set_class_feature(cpu, ARM_FEATURE_XSCALE);
+    set_class_feature(cpu, ARM_FEATURE_IWMMXT);
     cpu->midr = 0x69054113;
     cpu->ctr = 0xd172172;
     cpu->reset_sctlr = 0x00000078;
 }
 
-static void pxa270c0_initfn(Object *obj)
+static void pxa270c0_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
+    set_class_feature(cpu, ARM_FEATURE_V5);
+    set_class_feature(cpu, ARM_FEATURE_XSCALE);
+    set_class_feature(cpu, ARM_FEATURE_IWMMXT);
     cpu->midr = 0x69054114;
     cpu->ctr = 0xd172172;
     cpu->reset_sctlr = 0x00000078;
 }
 
-static void pxa270c5_initfn(Object *obj)
+static void pxa270c5_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
     cpu->dtb_compatible = "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
+    set_class_feature(cpu, ARM_FEATURE_V5);
+    set_class_feature(cpu, ARM_FEATURE_XSCALE);
+    set_class_feature(cpu, ARM_FEATURE_IWMMXT);
     cpu->midr = 0x69054117;
     cpu->ctr = 0xd172172;
     cpu->reset_sctlr = 0x00000078;
@@ -1070,19 +1010,17 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
  * The version of '-cpu max' for qemu-system-aarch64 is defined in cpu64.c;
  * this only needs to handle 32 bits, and need not care about KVM.
  */
-static void arm_max_initfn(Object *obj)
+static void arm_max_class_init(ARMCPUClass *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    /* aarch64_a57_initfn, advertising none of the aarch64 features */
+    /* aarch64_a57_class_init, advertising none of the aarch64 features */
     cpu->dtb_compatible = "arm,cortex-a57";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    set_class_feature(cpu, ARM_FEATURE_V8);
+    set_class_feature(cpu, ARM_FEATURE_NEON);
+    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(cpu, ARM_FEATURE_CBAR_RO);
+    set_class_feature(cpu, ARM_FEATURE_EL2);
+    set_class_feature(cpu, ARM_FEATURE_EL3);
+    set_class_feature(cpu, ARM_FEATURE_PMU);
     cpu->midr = 0x411fd070;
     cpu->revidr = 0x00000000;
     cpu->reset_fpsid = 0x41034070;
@@ -1130,55 +1068,55 @@ static void arm_max_initfn(Object *obj)
 #endif /* !TARGET_AARCH64 */
 
 static const ARMCPUInfo arm_tcg_cpus[] = {
-    { .name = "arm926",      .initfn = arm926_initfn },
-    { .name = "arm946",      .initfn = arm946_initfn },
-    { .name = "arm1026",     .initfn = arm1026_initfn },
+    { .name = "arm926",      .class_init = arm926_class_init },
+    { .name = "arm946",      .class_init = arm946_class_init },
+    { .name = "arm1026",     .class_init = arm1026_class_init },
     /*
      * What QEMU calls "arm1136-r2" is actually the 1136 r0p2, i.e. an
      * older core than plain "arm1136". In particular this does not
      * have the v6K features.
      */
-    { .name = "arm1136-r2",  .initfn = arm1136_r2_initfn },
-    { .name = "arm1136",     .initfn = arm1136_initfn },
-    { .name = "arm1176",     .initfn = arm1176_initfn },
-    { .name = "arm11mpcore", .initfn = arm11mpcore_initfn },
-    { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
-    { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
-    { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
-    { .name = "cortex-a15",  .initfn = cortex_a15_initfn },
-    { .name = "cortex-r5",   .initfn = cortex_r5_initfn },
-    { .name = "cortex-r5f",  .initfn = cortex_r5f_initfn },
-    { .name = "ti925t",      .initfn = ti925t_initfn },
-    { .name = "sa1100",      .initfn = sa1100_initfn },
-    { .name = "sa1110",      .initfn = sa1110_initfn },
-    { .name = "pxa250",      .initfn = pxa250_initfn },
-    { .name = "pxa255",      .initfn = pxa255_initfn },
-    { .name = "pxa260",      .initfn = pxa260_initfn },
-    { .name = "pxa261",      .initfn = pxa261_initfn },
-    { .name = "pxa262",      .initfn = pxa262_initfn },
+    { .name = "arm1136-r2",  .class_init = arm1136_r2_class_init },
+    { .name = "arm1136",     .class_init = arm1136_class_init },
+    { .name = "arm1176",     .class_init = arm1176_class_init },
+    { .name = "arm11mpcore", .class_init = arm11mpcore_class_init },
+    { .name = "cortex-a7",   .class_init = cortex_a7_class_init },
+    { .name = "cortex-a8",   .class_init = cortex_a8_class_init },
+    { .name = "cortex-a9",   .class_init = cortex_a9_class_init },
+    { .name = "cortex-a15",  .class_init = cortex_a15_class_init },
+    { .name = "cortex-r5",   .class_init = cortex_r5_class_init },
+    { .name = "cortex-r5f",  .class_init = cortex_r5f_class_init },
+    { .name = "ti925t",      .class_init = ti925t_class_init },
+    { .name = "sa1100",      .class_init = sa1100_class_init },
+    { .name = "sa1110",      .class_init = sa1110_class_init },
+    { .name = "pxa250",      .class_init = pxa250_class_init },
+    { .name = "pxa255",      .class_init = pxa255_class_init },
+    { .name = "pxa260",      .class_init = pxa260_class_init },
+    { .name = "pxa261",      .class_init = pxa261_class_init },
+    { .name = "pxa262",      .class_init = pxa262_class_init },
     /* "pxa270" is an alias for "pxa270-a0" */
-    { .name = "pxa270",      .initfn = pxa270a0_initfn },
-    { .name = "pxa270-a0",   .initfn = pxa270a0_initfn },
-    { .name = "pxa270-a1",   .initfn = pxa270a1_initfn },
-    { .name = "pxa270-b0",   .initfn = pxa270b0_initfn },
-    { .name = "pxa270-b1",   .initfn = pxa270b1_initfn },
-    { .name = "pxa270-c0",   .initfn = pxa270c0_initfn },
-    { .name = "pxa270-c5",   .initfn = pxa270c5_initfn },
+    { .name = "pxa270",      .class_init = pxa270a0_class_init },
+    { .name = "pxa270-a0",   .class_init = pxa270a0_class_init },
+    { .name = "pxa270-a1",   .class_init = pxa270a1_class_init },
+    { .name = "pxa270-b0",   .class_init = pxa270b0_class_init },
+    { .name = "pxa270-b1",   .class_init = pxa270b1_class_init },
+    { .name = "pxa270-c0",   .class_init = pxa270c0_class_init },
+    { .name = "pxa270-c5",   .class_init = pxa270c5_class_init },
 #ifndef TARGET_AARCH64
-    { .name = "max",         .initfn = arm_max_initfn },
+    { .name = "max",         .class_init = arm_max_class_init },
 #endif
 #ifdef CONFIG_USER_ONLY
-    { .name = "any",         .initfn = arm_max_initfn },
+    { .name = "any",         .class_init = arm_max_class_init },
 #endif
 };
 
 static const ARMCPUInfo arm_v7m_tcg_cpus[] = {
-    { .name = "cortex-m0",   .initfn = cortex_m0_initfn },
-    { .name = "cortex-m3",   .initfn = cortex_m3_initfn },
-    { .name = "cortex-m4",   .initfn = cortex_m4_initfn },
-    { .name = "cortex-m7",   .initfn = cortex_m7_initfn },
-    { .name = "cortex-m33",  .initfn = cortex_m33_initfn },
-    { .name = "cortex-m55",  .initfn = cortex_m55_initfn },
+    { .name = "cortex-m0",   .class_init = cortex_m0_class_init },
+    { .name = "cortex-m3",   .class_init = cortex_m3_class_init },
+    { .name = "cortex-m4",   .class_init = cortex_m4_class_init },
+    { .name = "cortex-m7",   .class_init = cortex_m7_class_init },
+    { .name = "cortex-m33",  .class_init = cortex_m33_class_init },
+    { .name = "cortex-m55",  .class_init = cortex_m55_class_init },
 };
 
 static const TypeInfo arm_v7m_cpu_type_info = {
-- 
2.34.1



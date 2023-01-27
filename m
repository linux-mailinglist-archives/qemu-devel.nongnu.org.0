Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D909B67E945
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 16:17:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQSX-0006LX-TR; Fri, 27 Jan 2023 10:16:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSV-0006KQ-8G
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:07 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSQ-0007iG-Fg
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:06 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 f19-20020a1c6a13000000b003db0ef4dedcso5622082wmc.4
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 07:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M3xXC2DYgG1kqwqfSpGDUOtjh0ngC37YWkj7pfmGHPk=;
 b=heKYoM43yWNvJJynyAXd4dwkdgLjoIKD4KxVXIxXErc6Eq6I3jLsFor6KHG0WQJ8U4
 K+JiouB7nIiyP0mOF4cEsD2gZEXwsi9a85F12ZaYECcmhTu8KqDnt3sBEA7lhozvZLuZ
 hUa+6smNbZxWxv7qbZ028Yl392bdskJNDMWbkAEM/5KDPobb50Zl+oRZRuOoI7wJihX5
 ZnJHd5dY0/egnGDwYHXzfwKCzj0vsUnf/3CC4dMUf3c7cNvSyCdFJA4UpjwE48b3ssEy
 6O6O0wglicloals5/eWZxFdw+engeVNluJwRIpkUlGzDmfxmsdCQ5pN2VxME1iyEknOO
 8WMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M3xXC2DYgG1kqwqfSpGDUOtjh0ngC37YWkj7pfmGHPk=;
 b=YZopPf6WunVBi6lmRRNRXy0rZ/umC/44rprgcAwNS64EbQv1jI6E8BZwR9jFvqPRk+
 FKDdMoABhC/nCuWfBPKAEt2LvHjhijYFrwujdn6uILSbpTdrp8fNUSbF4RX0wkTuUMXZ
 kQDnXrb21IcBCpqmnZtTHFqWpSrBWKQeF+g8jrqjcGC+ln1lPFVVfD7IVAdoG57frjB9
 kZkbxC2Kbi3GFK/iSTDUkzAfuLaUOjohjeCobpHS7YR5LWJqjKMpC8wageQzbtuv0LLc
 jW5p64rRK45VZqLc0XaB1nagsfclPD6E/Zx6JklOfCIZ6kQ7FsI9ViLrY4NHlqsFkbST
 ia3Q==
X-Gm-Message-State: AFqh2kpwcznVq7/TxshaggaZGdhyxqviQP1LvuJ+59zr4L6oPFO6hznr
 jL4ChA/hOThwmdnEJk4KyGkl+Q==
X-Google-Smtp-Source: AMrXdXtpiwYp/VvKewRj1Y4lEeRX6V/l8a5eWXqxI8tktRlRmqSUNSuvAY9cucbq0HWmuOMcBDucIg==
X-Received: by 2002:a05:600c:3b17:b0:3cf:7397:c768 with SMTP id
 m23-20020a05600c3b1700b003cf7397c768mr40318254wms.30.1674832560724; 
 Fri, 27 Jan 2023 07:16:00 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 07:16:00 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org, richard.henderson@linaro.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 06/16] target/arm/kvm-rme: Initialize vCPU
Date: Fri, 27 Jan 2023 15:07:19 +0000
Message-Id: <20230127150727.612594-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x334.google.com
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

The target code calls kvm_arm_vcpu_init() to mark the vCPU as part of a
realm. RME support does not use the register lists, because the host can
only set the boot PC and registers x0-x7. The rest is private to the
Realm and saved/restored by the RMM.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/cpu.h     |  3 ++
 target/arm/kvm_arm.h |  1 +
 target/arm/helper.c  |  8 ++++++
 target/arm/kvm-rme.c | 10 +++++++
 target/arm/kvm.c     | 12 ++++++++
 target/arm/kvm64.c   | 65 ++++++++++++++++++++++++++++++++++++++++++--
 6 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9aeed3c848..7d8397985f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -937,6 +937,9 @@ struct ArchCPU {
     /* KVM steal time */
     OnOffAuto kvm_steal_time;
 
+    /* Realm Management Extension */
+    bool kvm_rme;
+
     /* Uniprocessor system with MP extensions */
     bool mp_is_up;
 
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 00d3df8cac..e4dc7fbb8d 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -373,6 +373,7 @@ int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp);
 int kvm_arm_rme_vm_type(MachineState *ms);
 
 bool kvm_arm_rme_enabled(void);
+int kvm_arm_rme_vcpu_init(CPUState *cs);
 
 #else
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d8c8223ec3..52360ae2ff 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -126,6 +126,10 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
     int i;
     bool ok = true;
 
+    if (cpu->kvm_rme) {
+        return ok;
+    }
+
     for (i = 0; i < cpu->cpreg_array_len; i++) {
         uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
         const ARMCPRegInfo *ri;
@@ -171,6 +175,10 @@ bool write_list_to_cpustate(ARMCPU *cpu)
     int i;
     bool ok = true;
 
+    if (cpu->kvm_rme) {
+        return ok;
+    }
+
     for (i = 0; i < cpu->cpreg_array_len; i++) {
         uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
         uint64_t v = cpu->cpreg_values[i];
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index d7cdca1cbf..3833b187f9 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -118,6 +118,16 @@ int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
     return 0;
 }
 
+int kvm_arm_rme_vcpu_init(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    if (kvm_arm_rme_enabled()) {
+        cpu->kvm_rme = true;
+    }
+    return 0;
+}
+
 int kvm_arm_rme_vm_type(MachineState *ms)
 {
     if (cgs_to_rme(ms->cgs)) {
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index f022c644d2..fcddead4fe 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -449,6 +449,10 @@ int kvm_arm_init_cpreg_list(ARMCPU *cpu)
     int i, ret, arraylen;
     CPUState *cs = CPU(cpu);
 
+    if (cpu->kvm_rme) {
+        return 0;
+    }
+
     rl.n = 0;
     ret = kvm_vcpu_ioctl(cs, KVM_GET_REG_LIST, &rl);
     if (ret != -E2BIG) {
@@ -521,6 +525,10 @@ bool write_kvmstate_to_list(ARMCPU *cpu)
     int i;
     bool ok = true;
 
+    if (cpu->kvm_rme) {
+        return ok;
+    }
+
     for (i = 0; i < cpu->cpreg_array_len; i++) {
         struct kvm_one_reg r;
         uint64_t regidx = cpu->cpreg_indexes[i];
@@ -557,6 +565,10 @@ bool write_list_to_kvmstate(ARMCPU *cpu, int level)
     int i;
     bool ok = true;
 
+    if (cpu->kvm_rme) {
+        return ok;
+    }
+
     for (i = 0; i < cpu->cpreg_array_len; i++) {
         struct kvm_one_reg r;
         uint64_t regidx = cpu->cpreg_indexes[i];
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 55191496f3..b6320672b2 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -887,6 +887,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
         return ret;
     }
 
+    ret = kvm_arm_rme_vcpu_init(cs);
+    if (ret) {
+        return ret;
+    }
+
     if (cpu_isar_feature(aa64_sve, cpu)) {
         ret = kvm_arm_sve_set_vls(cs);
         if (ret) {
@@ -1080,6 +1085,35 @@ static int kvm_arch_put_sve(CPUState *cs)
     return 0;
 }
 
+static int kvm_arm_rme_put_core_regs(CPUState *cs, int level)
+{
+    int i, ret;
+    struct kvm_one_reg reg;
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    /*
+     * The RME ABI only allows us to set 8 GPRs and the PC
+     */
+    for (i = 0; i < 8; i++) {
+        reg.id = AARCH64_CORE_REG(regs.regs[i]);
+        reg.addr = (uintptr_t) &env->xregs[i];
+        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    reg.id = AARCH64_CORE_REG(regs.pc);
+    reg.addr = (uintptr_t) &env->pc;
+    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    return 0;
+}
+
 static int kvm_arm_put_core_regs(CPUState *cs)
 {
     struct kvm_one_reg reg;
@@ -1208,7 +1242,11 @@ int kvm_arch_put_registers(CPUState *cs, int level)
     int ret;
     ARMCPU *cpu = ARM_CPU(cs);
 
-    ret = kvm_arm_put_core_regs(cs);
+    if (cpu->kvm_rme) {
+        ret = kvm_arm_rme_put_core_regs(cs, level);
+    } else {
+        ret = kvm_arm_put_core_regs(cs);
+    }
     if (ret) {
         return ret;
     }
@@ -1306,6 +1344,25 @@ static int kvm_arch_get_sve(CPUState *cs)
     return 0;
 }
 
+static int kvm_arm_rme_get_core_regs(CPUState *cs)
+{
+    int i, ret;
+    struct kvm_one_reg reg;
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    for (i = 0; i < 8; i++) {
+        reg.id = AARCH64_CORE_REG(regs.regs[i]);
+        reg.addr = (uintptr_t) &env->xregs[i];
+        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
 static int kvm_arm_get_core_regs(CPUState *cs)
 {
     struct kvm_one_reg reg;
@@ -1434,7 +1491,11 @@ int kvm_arch_get_registers(CPUState *cs)
     int ret;
     ARMCPU *cpu = ARM_CPU(cs);
 
-    ret = kvm_arm_get_core_regs(cs);
+    if (cpu->kvm_rme) {
+        ret = kvm_arm_rme_get_core_regs(cs);
+    } else {
+        ret = kvm_arm_get_core_regs(cs);
+    }
     if (ret) {
         return ret;
     }
-- 
2.39.0



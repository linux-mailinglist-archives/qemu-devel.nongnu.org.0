Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF0D4D4644
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:48:37 +0100 (CET)
Received: from localhost ([::1]:42362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHHY-00089F-P5
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:48:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSH0q-0002Wq-LO
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:31:23 -0500
Received: from [2607:f8b0:4864:20::42b] (port=44785
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSH0o-0008TU-Op
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:31:20 -0500
Received: by mail-pf1-x42b.google.com with SMTP id u17so2670152pfk.11
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jku9bPh0YVOaP+OMjPsiDbVlpEa9BNiPKSyQ8r6I0fM=;
 b=DokEgmWacpFOEZFsBX84n8leKjhyCAeXfXd8wT/xpzawETwDokEOGB/2nxAUBaZ1sO
 rD1DsqJl95gA5EQrwD9mqVL16t747aFpfkHaMa1Iaksf7xt/a4lQf6VxCQk/Qb/LpN3G
 9pDtyXK7qByXXe6LWm6k/YVcsWOA4SKNWh4ODM/FaQhA5l9hq/tOT3aU44Si3MLZmFmG
 B8Vlpkjsx19IvdyymsRD3eRFnVTNHGJUE0MrGcBK6lBZowihDOo1mjdb3blCXi+vwRr4
 3hWOdHPjZkPN4KkAIZpJi5UuLoLx6Jx2S+6ezYN9OjJRiqbVPtd5UOwgVw7WyvzT/Dpk
 XtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jku9bPh0YVOaP+OMjPsiDbVlpEa9BNiPKSyQ8r6I0fM=;
 b=O9M5Pv74G8jXoR+roUV9e06qIf296G9YdZF+3yIajCdUGDqkwr9c/RLAniwJ9Mn/ks
 bSxj9Q+BesFG8yiv/BcKPcr9tmnevlB7BxSD5eNejYhAFOEwlJ/FOCw1ECZ0gN+IMVJB
 m0x6Sg9KStL+efTSDJt3uEnuAh2Qu2aykHFNmlwL03s85FEO0poN5dh5hX+fB0uHi2gO
 Q8HAclmGOE1nQY6JejODVN4mP7phlA0fvB2hK8RhdDDLP0Dl1btcCiIJmqsYhjMzmHyz
 w+Pu+vMwFThsjprbeMOGJMM4LSy+e7LXUIx/fZhGgSRhgnYTrt+wn+VFoeJ9iig8oIkL
 ceIQ==
X-Gm-Message-State: AOAM531u3NT93AqCT2dDz+P7NZ2ilN0YDgQuyWH/bDz6Kpf7nFKHT3Ug
 ZvcMISkW4tCVKuN+tuwgtLBjPTAH4S8/kg==
X-Google-Smtp-Source: ABdhPJyZwOOFEDwTcHQtHU5XzDHO8QeScKwqGlGEHYBn2ESJ3IjraMj583RmJVhgCmjNfcBRwcD0Ng==
X-Received: by 2002:a62:8481:0:b0:4f7:4d4:f592 with SMTP id
 k123-20020a628481000000b004f704d4f592mr4484057pfd.3.1646911877472; 
 Thu, 10 Mar 2022 03:31:17 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020a056a001a8e00b004f75cf1ab6csm6011246pfv.206.2022.03.10.03.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:31:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 44/48] target/nios2: Implement EIC interrupt processing
Date: Thu, 10 Mar 2022 03:27:21 -0800
Message-Id: <20220310112725.570053-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the cpu side of the operation.  Register one irq line,
called EIC.  Split out the rather different processing to a
separate function.

Delay initialization of gpio irqs until realize.  We need to
provide a window after init in which the board can set eic_present.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h    |  8 ++++
 target/nios2/cpu.c    | 92 +++++++++++++++++++++++++++++++++----------
 target/nios2/helper.c | 47 ++++++++++++++++++++--
 3 files changed, 123 insertions(+), 24 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 62a73c7b32..c9356416e2 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -114,6 +114,7 @@ FIELD(CR_STATUS, CRS, 10, 6)
 FIELD(CR_STATUS, PRS, 16, 6)
 FIELD(CR_STATUS, NMI, 22, 1)
 FIELD(CR_STATUS, RSIE, 23, 1)
+FIELD(CR_STATUS, SRS, 31, 1)  /* only in sstatus */
 
 #define CR_STATUS_PIE    R_CR_STATUS_PIE_MASK
 #define CR_STATUS_U      R_CR_STATUS_U_MASK
@@ -121,6 +122,7 @@ FIELD(CR_STATUS, RSIE, 23, 1)
 #define CR_STATUS_IH     R_CR_STATUS_IH_MASK
 #define CR_STATUS_NMI    R_CR_STATUS_NMI_MASK
 #define CR_STATUS_RSIE   R_CR_STATUS_RSIE_MASK
+#define CR_STATUS_SRS    R_CR_STATUS_SRS_MASK
 
 FIELD(CR_EXCEPTION, CAUSE, 2, 5)
 FIELD(CR_EXCEPTION, ECCFTL, 31, 1)
@@ -234,6 +236,12 @@ struct ArchCPU {
 
     /* Bits within each control register which are reserved or readonly. */
     ControlRegState cr_state[NUM_CR_REGS];
+
+    /* External Interrupt Controller Interface */
+    uint32_t rha; /* Requested handler address */
+    uint32_t ril; /* Requested interrupt level */
+    uint32_t rrs; /* Requested register set */
+    bool rnmi;    /* Requested nonmaskable interrupt */
 };
 
 
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index efd6a21a8e..c5025d32f4 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -67,7 +67,19 @@ static void nios2_cpu_reset(DeviceState *dev)
 }
 
 #ifndef CONFIG_USER_ONLY
-static void nios2_cpu_set_irq(void *opaque, int irq, int level)
+static void eic_set_irq(void *opaque, int irq, int level)
+{
+    Nios2CPU *cpu = opaque;
+    CPUState *cs = CPU(cpu);
+
+    if (level) {
+        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+    } else {
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+    }
+}
+
+static void iic_set_irq(void *opaque, int irq, int level)
 {
     Nios2CPU *cpu = opaque;
     CPUNios2State *env = &cpu->env;
@@ -109,10 +121,18 @@ static void nios2_cpu_initfn(Object *obj)
     RO_REG(CR_EXCEPTION);
     WR_REG(CR_BADADDR);
 
-    /* TODO: These control registers are not present with the EIC. */
-    RO_FIELD(CR_STATUS, RSIE);
-    WR_REG(CR_IENABLE);
-    RO_REG(CR_IPENDING);
+    if (cpu->eic_present) {
+        WR_FIELD(CR_STATUS, RSIE);
+        RO_FIELD(CR_STATUS, NMI);
+        WR_FIELD(CR_STATUS, PRS);
+        RO_FIELD(CR_STATUS, CRS);
+        WR_FIELD(CR_STATUS, IL);
+        WR_FIELD(CR_STATUS, IH);
+    } else {
+        RO_FIELD(CR_STATUS, RSIE);
+        WR_REG(CR_IENABLE);
+        RO_REG(CR_IPENDING);
+    }
 
     if (cpu->mmu_present) {
         WR_FIELD(CR_STATUS, U);
@@ -145,15 +165,6 @@ static void nios2_cpu_initfn(Object *obj)
 
 #if !defined(CONFIG_USER_ONLY)
     mmu_init(&cpu->env);
-
-    /*
-     * These interrupt lines model the IIC (internal interrupt
-     * controller). QEMU does not currently support the EIC
-     * (external interrupt controller) -- if we did it would be
-     * a separate device in hw/intc with a custom interface to
-     * the CPU, and boards using it would not wire up these IRQ lines.
-     */
-    qdev_init_gpio_in_named(DEVICE(cpu), nios2_cpu_set_irq, "IRQ", 32);
 #endif
 }
 
@@ -169,6 +180,14 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
     Nios2CPUClass *ncc = NIOS2_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
+#ifndef CONFIG_USER_ONLY
+    if (cpu->eic_present) {
+        qdev_init_gpio_in_named(DEVICE(cpu), eic_set_irq, "EIC", 1);
+    } else {
+        qdev_init_gpio_in_named(DEVICE(cpu), iic_set_irq, "IRQ", 32);
+    }
+#endif
+
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -185,17 +204,48 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
 }
 
 #ifndef CONFIG_USER_ONLY
+static bool eic_take_interrupt(Nios2CPU *cpu)
+{
+    CPUNios2State *env = &cpu->env;
+    const uint32_t status = env->ctrl[CR_STATUS];
+
+    if (cpu->rnmi) {
+        return !(status & CR_STATUS_NMI);
+    }
+    if (!(status & CR_STATUS_PIE)) {
+        return false;
+    }
+    if (cpu->ril <= FIELD_EX32(status, CR_STATUS, IL)) {
+        return false;
+    }
+    if (cpu->rrs != FIELD_EX32(status, CR_STATUS, CRS)) {
+        return true;
+    }
+    return status & CR_STATUS_RSIE;
+}
+
+static bool iic_take_interrupt(Nios2CPU *cpu)
+{
+    CPUNios2State *env = &cpu->env;
+
+    if (!(env->ctrl[CR_STATUS] & CR_STATUS_PIE)) {
+        return false;
+    }
+    return env->ctrl[CR_IPENDING] & env->ctrl[CR_IENABLE];
+}
+
 static bool nios2_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
-    CPUNios2State *env = &cpu->env;
 
-    if ((interrupt_request & CPU_INTERRUPT_HARD) &&
-        (env->ctrl[CR_STATUS] & CR_STATUS_PIE) &&
-        (env->ctrl[CR_IPENDING] & env->ctrl[CR_IENABLE])) {
-        cs->exception_index = EXCP_IRQ;
-        nios2_cpu_do_interrupt(cs);
-        return true;
+    if (interrupt_request & CPU_INTERRUPT_HARD) {
+        if (cpu->eic_present
+            ? eic_take_interrupt(cpu)
+            : iic_take_interrupt(cpu)) {
+            cs->exception_index = EXCP_IRQ;
+            nios2_cpu_do_interrupt(cs);
+            return true;
+        }
     }
     return false;
 }
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index bf40cff779..00f27165d9 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -57,6 +57,9 @@ static void do_exception(Nios2CPU *cpu, uint32_t exception_addr,
     uint32_t old_status = env->ctrl[CR_STATUS];
     uint32_t new_status = old_status;
 
+    /* With shadow regs, exceptions are always taken into CRS 0. */
+    new_status &= ~R_CR_STATUS_CRS_MASK;
+
     if ((old_status & CR_STATUS_EH) == 0) {
         int r_ea = R_EA, cr_es = CR_ESTATUS;
 
@@ -65,7 +68,7 @@ static void do_exception(Nios2CPU *cpu, uint32_t exception_addr,
             cr_es = CR_BSTATUS;
         }
         env->ctrl[cr_es] = old_status;
-        env->regs[r_ea] = env->pc + 4;
+        env->shadow_regs[0][r_ea] = env->pc + 4;
 
         if (cpu->mmu_present) {
             new_status |= CR_STATUS_EH;
@@ -83,8 +86,9 @@ static void do_exception(Nios2CPU *cpu, uint32_t exception_addr,
     }
 
     new_status &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
     env->ctrl[CR_STATUS] = new_status;
+    nios2_update_crs(env);
+
     if (!is_break) {
         env->ctrl[CR_EXCEPTION] = FIELD_DP32(0, CR_EXCEPTION, CAUSE,
                                              cs->exception_index);
@@ -97,6 +101,39 @@ static void do_iic_irq(Nios2CPU *cpu)
     do_exception(cpu, cpu->exception_addr, 0, false);
 }
 
+static void do_eic_irq(Nios2CPU *cpu)
+{
+    CPUNios2State *env = &cpu->env;
+    uint32_t old_status = env->ctrl[CR_STATUS];
+    uint32_t new_status = old_status;
+    uint32_t old_rs = FIELD_EX32(old_status, CR_STATUS, CRS);
+    uint32_t new_rs = cpu->rrs;
+
+    new_status = FIELD_DP32(new_status, CR_STATUS, CRS, new_rs);
+    new_status = FIELD_DP32(new_status, CR_STATUS, IL, cpu->ril);
+    new_status = FIELD_DP32(new_status, CR_STATUS, NMI, cpu->rnmi);
+    new_status &= ~(CR_STATUS_RSIE | CR_STATUS_U);
+    new_status |= CR_STATUS_IH;
+
+    if (!(new_status & CR_STATUS_EH)) {
+        new_status = FIELD_DP32(new_status, CR_STATUS, PRS, old_rs);
+        if (new_rs == 0) {
+            env->ctrl[CR_ESTATUS] = old_status;
+        } else {
+            if (new_rs != old_rs) {
+                old_status |= CR_STATUS_SRS;
+            }
+            env->shadow_regs[new_rs][R_SSTATUS] = old_status;
+        }
+        env->shadow_regs[new_rs][R_EA] = env->pc + 4;
+    }
+
+    env->ctrl[CR_STATUS] = new_status;
+    nios2_update_crs(env);
+
+    env->pc = cpu->rha;
+}
+
 void nios2_cpu_do_interrupt(CPUState *cs)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
@@ -162,7 +199,11 @@ void nios2_cpu_do_interrupt(CPUState *cs)
 
     switch (cs->exception_index) {
     case EXCP_IRQ:
-        do_iic_irq(cpu);
+        if (cpu->eic_present) {
+            do_eic_irq(cpu);
+        } else {
+            do_iic_irq(cpu);
+        }
         break;
 
     case EXCP_TLB_D:
-- 
2.25.1



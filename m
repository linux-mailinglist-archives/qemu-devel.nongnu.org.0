Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694B450BF12
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:53:17 +0200 (CEST)
Received: from localhost ([::1]:38578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxT2-0005It-HV
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwb6-0000ce-3x
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:32 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:35730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwb4-00083g-2m
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:31 -0400
Received: by mail-il1-x12e.google.com with SMTP id e1so5429925ile.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gvOrFvBE98DeoM6VCwJFK5z8shR3DGS8mknWCcWIlII=;
 b=xXH3qR4XYttykptDQhVKW6eiDlnX/FfnCLrMiuDhtUs+a4fguQsHVIsdN7zs3RHQ7D
 Q3PyGQaSFGO9m+eJBENVkGs4QBQSPwpN3BLS/IdHb+rZ8XMZLaRSUzb9QzpgtwPq4E+1
 drlq7gpVeIqvQl5egxbfppinpwIpqnjECvo9nc9LQzpLD/LnjIVQSjzqHuvx0EYL0psp
 fU/D5ndPySpfhHxduyIZCWwwNpODYQT9AYYP84hYuZpJwv7IY6lRDYJeKv9IOa0EFYbY
 Zzg3M2tH54vdjhBNe9nNsp2IdJJqJrdHKNhkjceOleM3IDY6zRCw5OpMRreg2oPExjI/
 wUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gvOrFvBE98DeoM6VCwJFK5z8shR3DGS8mknWCcWIlII=;
 b=en0bJXODugaokdKFesx1mWPSB3L+yDG3PoP1FKmDGXaC6qTsFpGn/GXO+I04NxNNYd
 68MYnEQpz85PhsJ7M6ccICU7SsjV+6a2MtptGcjc09SJxo/cICESc35hoE71eOYZrPFV
 GkNau+iPLpZfI9QQal6kkG0teCIy1tbc7ZtULJHGkprG7UCbJI9j4OMxe0rdKXvRXUne
 kMRhw3KNAij8tly2w0ZbSHpOZmvmDDtqBJFrLshAfn76gAg6ePsFteAtFviFboGvpcrw
 VpTk8sp5oSQdkzzWB6BuLCGpjW7TShR5EsQfxHUMgMllOP7gex1zVnI3Qdmg+Oo81Qs4
 vglg==
X-Gm-Message-State: AOAM532DOTC+i8b6+DFulRpY4dA5PoWddFjjtUKSqe7H52aZu3AJhL2i
 +9+EjwTQRCCg4m3BTPMCQDN4sqTp5u6f44Br
X-Google-Smtp-Source: ABdhPJzOeJrszCFKHENRNovS6jgvQYn2jvxA+N58nxbUuMfUXqXYpS+6+3v+bhtdZTzSP8Fywc3Tfg==
X-Received: by 2002:a05:6e02:1a2d:b0:2cc:4fb5:6007 with SMTP id
 g13-20020a056e021a2d00b002cc4fb56007mr2317462ile.124.1650646649105; 
 Fri, 22 Apr 2022 09:57:29 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 60/68] target/nios2: Implement EIC interrupt processing
Date: Fri, 22 Apr 2022 09:52:30 -0700
Message-Id: <20220422165238.1971496-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the cpu side of the operation.  Register one irq line,
called EIC.  Split out the rather different processing to a
separate function.

Delay initialization of gpio irqs until realize.  We need to
provide a window after init in which the board can set eic_present.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220421151735.31996-57-richard.henderson@linaro.org>
---
 target/nios2/cpu.h    |  8 ++++
 target/nios2/cpu.c    | 92 +++++++++++++++++++++++++++++++++----------
 target/nios2/helper.c | 51 +++++++++++++++++++++++-
 3 files changed, 129 insertions(+), 22 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index eb171a33e6..5474b1c404 100644
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
index d043c02fcd..19b2409974 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -63,7 +63,19 @@ static void nios2_cpu_reset(DeviceState *dev)
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
@@ -87,15 +99,6 @@ static void nios2_cpu_initfn(Object *obj)
 
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
 
@@ -128,10 +131,18 @@ static void realize_cr_status(CPUState *cs)
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
@@ -170,6 +181,14 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
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
@@ -187,17 +206,48 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
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
index 2e9fea4a01..e256d1528e 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -37,6 +37,10 @@ static void do_exception(Nios2CPU *cpu, uint32_t exception_addr,
     uint32_t old_status = env->ctrl[CR_STATUS];
     uint32_t new_status = old_status;
 
+    /* With shadow regs, exceptions are always taken into CRS 0. */
+    new_status &= ~R_CR_STATUS_CRS_MASK;
+    env->regs = env->shadow_regs[0];
+
     if ((old_status & CR_STATUS_EH) == 0) {
         int r_ea = R_EA, cr_es = CR_ESTATUS;
 
@@ -60,6 +64,14 @@ static void do_exception(Nios2CPU *cpu, uint32_t exception_addr,
                                        CR_TLBMISC_DBL);
             env->ctrl[CR_TLBMISC] |= tlbmisc_set;
         }
+
+        /*
+         * With shadow regs, and EH == 0, PRS is set from CRS.
+         * At least, so says Table 3-9, and some other text,
+         * though Table 3-38 says otherwise.
+         */
+        new_status = FIELD_DP32(new_status, CR_STATUS, PRS,
+                                FIELD_EX32(old_status, CR_STATUS, CRS));
     }
 
     new_status &= ~(CR_STATUS_PIE | CR_STATUS_U);
@@ -77,6 +89,39 @@ static void do_iic_irq(Nios2CPU *cpu)
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
@@ -142,7 +187,11 @@ void nios2_cpu_do_interrupt(CPUState *cs)
 
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
2.34.1



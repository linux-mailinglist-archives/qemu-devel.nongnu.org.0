Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662EC4D1136
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:42:35 +0100 (CET)
Received: from localhost ([::1]:42542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUUI-0003eL-Im
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:42:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9S-0005bD-G3
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:58 -0500
Received: from [2607:f8b0:4864:20::432] (port=38612
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9Q-0006Vr-Js
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:58 -0500
Received: by mail-pf1-x432.google.com with SMTP id f8so6113268pfj.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/6ZuOi1ySAWVrPIfU1Ik0D51IBcstR6GJi6kOb4zehc=;
 b=S8z83Y6BcUo5YQn8SwXy46EmYwR4DB/T/N0Dxp93MPdH5oAaJgNi7gNcpPjz/QesFz
 FCRl6ZES8c4kEJZnfs5tuMHQCGkr9hws79WxeY4M8QDRH9QZc6kvhXLpWR8RLqGmgh4P
 txOfkbMzV/+LAdbzx9VbNbkdD1kvNXN+4fPT8oSNkVP4pexRWdUXtq+b90UX5ZBirRzr
 vwyNeFmjnYMNS8f9lnlMjbJFPfkMJkglhcGc13E5OTx8GCuHrw+5PQ1QtjG4Sz0ezC3q
 0xH0VjjXXGK11DDOWuZByE+Mz4w2SOSf/tiABvLQrGfNe+ooskOBwRt/3l+sUxVonz/u
 xHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/6ZuOi1ySAWVrPIfU1Ik0D51IBcstR6GJi6kOb4zehc=;
 b=ay5UHyNPvIW1olsMH6Ru7yBnjmaPKg3Qj98upuH5eYnV9DW3I6r3p6Yllqqyl8Mfpu
 2hGSI+LCLXp6qBSqKODkb4BAsD96CpG2wZ7ZWoPnSgD2ERL6bqjvE+zzuHtYavJQEgcg
 N11HwCaxdBq7RmRtyoxYYFnEu3YI0X5T8rJBf45L6zWFMIEsXP7NxLeiX/aLJPW/crof
 PrxclbbfGDBFzRmkdZXdPnTE7b/9hvi3DJSsHtEmAHQvju6JaXBui5WDa6KA1T9P5lRK
 7C386E/XfGGSt0VThvODjzg2QuPxIMppbn9ScQaNSzfZUxmajWPseanbF/J8DRf02C3B
 Z3pg==
X-Gm-Message-State: AOAM533KVh099wzXhpRk3MSHza7nz+fvvSuJBn/KULO4SxulCEPJ6SRc
 VWMWvmYt7hesETtLRHGbExlu/ptzgIRvFw==
X-Google-Smtp-Source: ABdhPJwpvat6wsT7rK3y+THB4uwcNoeiAgpz1t05LuC48HtTFFKE9Kf0elKXpLwxKUQPRyG6dTRIGg==
X-Received: by 2002:a63:6802:0:b0:37c:6bc1:f602 with SMTP id
 d2-20020a636802000000b0037c6bc1f602mr13320984pgc.128.1646724055292; 
 Mon, 07 Mar 2022 23:20:55 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 29/33] target/nios2: Implement EIC interrupt processing
Date: Mon,  7 Mar 2022 21:20:01 -1000
Message-Id: <20220308072005.307955-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
 target/nios2/cpu.h    |  8 +++++
 target/nios2/cpu.c    | 75 +++++++++++++++++++++++++++++++++----------
 target/nios2/helper.c | 37 +++++++++++++++++++++
 3 files changed, 103 insertions(+), 17 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 13e1d49f38..89c575c26d 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -115,6 +115,7 @@ FIELD(CR_STATUS, CRS, 10, 6)
 FIELD(CR_STATUS, PRS, 16, 6)
 FIELD(CR_STATUS, NMI, 22, 1)
 FIELD(CR_STATUS, RSIE, 23, 1)
+FIELD(CR_STATUS, SRS, 31, 1)
 
 #define CR_STATUS_PIE  (1u << R_CR_STATUS_PIE_SHIFT)
 #define CR_STATUS_U    (1u << R_CR_STATUS_U_SHIFT)
@@ -122,6 +123,7 @@ FIELD(CR_STATUS, RSIE, 23, 1)
 #define CR_STATUS_IH   (1u << R_CR_STATUS_IH_SHIFT)
 #define CR_STATUS_NMI  (1u << R_CR_STATUS_NMI_SHIFT)
 #define CR_STATUS_RSIE (1u << R_CR_STATUS_RSIE_SHIFT)
+#define CR_STATUS_SRS  (1u << R_CR_STATUS_SRS_SHIFT)
 
 FIELD(CR_EXCEPTION, CAUSE, 2, 5)
 FIELD(CR_EXCEPTION, ECCFTL, 31, 1)
@@ -252,6 +254,12 @@ struct Nios2CPU {
 
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
index 6ece92a2b8..65a900a7fb 100644
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
@@ -149,15 +161,6 @@ static void nios2_cpu_initfn(Object *obj)
 
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
 
@@ -173,6 +176,14 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
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
@@ -189,17 +200,47 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
 }
 
 #ifndef CONFIG_USER_ONLY
+static bool eic_take_interrupt(Nios2CPU *cpu)
+{
+    CPUNios2State *env = &cpu->env;
+
+    if (cpu->rnmi) {
+        return !(env->status & CR_STATUS_NMI);
+    }
+    if (!(env->status & CR_STATUS_PIE)) {
+        return false;
+    }
+    if (cpu->ril <= FIELD_EX32(env->status, CR_STATUS, IL)) {
+        return false;
+    }
+    if (cpu->rrs != FIELD_EX32(env->status, CR_STATUS, CRS)) {
+        return true;
+    }
+    return env->status & CR_STATUS_RSIE;
+}
+
+static bool iic_take_interrupt(Nios2CPU *cpu)
+{
+    CPUNios2State *env = &cpu->env;
+
+    if (!(env->status & CR_STATUS_PIE)) {
+        return false;
+    }
+    return env->ipending & env->ienable;
+}
+
 static bool nios2_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
-    CPUNios2State *env = &cpu->env;
 
-    if ((interrupt_request & CPU_INTERRUPT_HARD) &&
-        (env->status & CR_STATUS_PIE) &&
-        (env->ipending & env->ienable)) {
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
index ccf2634c9b..11840496f7 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -49,6 +49,36 @@ void nios2_cpu_record_sigsegv(CPUState *cs, vaddr addr,
 
 #else /* !CONFIG_USER_ONLY */
 
+static void eic_do_interrupt(Nios2CPU *cpu)
+{
+    CPUNios2State *env = &cpu->env;
+    uint32_t old_status = env->status;
+    uint32_t old_rs = FIELD_EX32(old_status, CR_STATUS, CRS);
+    uint32_t new_rs = cpu->rrs;
+
+    env->status = FIELD_DP32(env->status, CR_STATUS, CRS, new_rs);
+    env->status = FIELD_DP32(env->status, CR_STATUS, IL, cpu->ril);
+    env->status = FIELD_DP32(env->status, CR_STATUS, NMI, cpu->rnmi);
+    env->status &= ~(CR_STATUS_RSIE | CR_STATUS_U);
+    env->status |= CR_STATUS_IH;
+    nios2_update_crs(env);
+
+    if (!(env->status & CR_STATUS_EH)) {
+        env->status = FIELD_DP32(env->status, CR_STATUS, PRS, old_rs);
+        if (new_rs == 0) {
+            env->estatus = old_status;
+        } else {
+            if (new_rs != old_rs) {
+                old_status |= CR_STATUS_SRS;
+            }
+            env->crs[R_SSTATUS] = old_status;
+        }
+        env->crs[R_EA] = env->pc + 4;
+    }
+
+    env->pc = cpu->rha;
+}
+
 void nios2_cpu_do_interrupt(CPUState *cs)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
@@ -60,6 +90,10 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     switch (cs->exception_index) {
     case EXCP_IRQ:
         qemu_log_mask(CPU_LOG_INT, "interrupt at pc=%x\n", env->pc);
+        if (cpu->eic_present) {
+            eic_do_interrupt(cpu);
+            return;
+        }
         break;
 
     case EXCP_TLBD:
@@ -113,6 +147,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
      * Finish Internal Interrupt or Noninterrupt Exception.
      */
 
+    env->status &= ~R_CR_STATUS_CRS_MASK;
+    nios2_update_crs(env);
+
     if (!(env->status & CR_STATUS_EH)) {
         env->ctrl[cr_estatus] = env->status;
         env->crs[r_ea] = env->pc + 4;
-- 
2.25.1



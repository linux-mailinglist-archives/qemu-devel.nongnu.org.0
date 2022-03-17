Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB454DBEA0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:46:01 +0100 (CET)
Received: from localhost ([::1]:44556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUixU-0000jB-7l
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:46:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKq-0001E2-1k
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:04 -0400
Received: from [2607:f8b0:4864:20::62d] (port=43737
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKo-0002GR-7S
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:03 -0400
Received: by mail-pl1-x62d.google.com with SMTP id w8so3539210pll.10
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rza+S9dP6OxTxmW7BN1PpFg5SK23R8f/DSGJ4keNmyI=;
 b=bpW7YUUPyu5ca/rNkhHzwMXoQucg24ThhwGbbQ41itxN0jqJnLIBGs8RoWkFdLu7IO
 Box4tx62OifPzy26IAFn831Jt6W3hr0JNXz+DsgSMEOcU0Puhcc7Fbj+AohUWZcGr87f
 +mbhbYWy5onfF+46JD0ITJKTsFd6uDkGIncejEVVKQC2+E5ZEKtqbEndz3AJJAjDLv6E
 sQDoddn3jIKqOzVQCb7AaOQulo1ELPPHY9rE1qMeQfhKy1MMfOvdxiqjxSBpfJJyiSiD
 NHocJxitkh1dik3PvVbo6SQmC3jYE9iAaTtVJnLKxnHlYmu7q2YJFqTsIA7Oj9QUe/GZ
 B66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rza+S9dP6OxTxmW7BN1PpFg5SK23R8f/DSGJ4keNmyI=;
 b=sFOnOgg5Uldno5PIbZKfBP1o4aSSwcJDZGaUFdyhRzIQoA+oITInmzUxODO0Jrx+H1
 NMireg7Onery1zpj5WAKQTthiIlFSBSXb0nGz5Jn9uh5FvcfrddLcTcpM9x5e/GI3Cjw
 rfjs5Fh3hKpgEoAM1UrBl55ruumn/VC7nlWsIx937VMDF//pKS7Gf1sIum2E6DJamic8
 aPlfvyfGLw1+awvcfJX7GB+KWKpgv3hvQZD5yVKIyn+WCIfBmaNcQ3Zx56yKwsxMbbKn
 AHQhxrIp2LFlDyk1/1YcFjQtjaLUMyG+Z+51jN87HB3OTrCb2LUSGzAIKDPqyA7bYvbl
 BUTQ==
X-Gm-Message-State: AOAM533cmBBHUMfEkhFMBqUghKRVDCe1Vmw0hpG+Z/qVhdSS7DRPVV8K
 AJVS4obATmGblnUq1CT4GezYYW1aOIAQNQ==
X-Google-Smtp-Source: ABdhPJyk8hqFWztqjYcOYufDRN5ahat/GWJJ3ZbToVrTJ7ewfZt3P4nmmlQ/5EfQ2gaUU3uF/YYwjA==
X-Received: by 2002:a17:90b:4b0d:b0:1bc:4cdb:ebe3 with SMTP id
 lx13-20020a17090b4b0d00b001bc4cdbebe3mr3343961pjb.176.1647493560930; 
 Wed, 16 Mar 2022 22:06:00 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:06:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 21/51] target/nios2: Clean up nios2_cpu_do_interrupt
Date: Wed, 16 Mar 2022 22:05:08 -0700
Message-Id: <20220317050538.924111-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out do_exception and do_iic_irq to handle bulk of the interrupt and
exception processing.  Parameterize the changes required to cpu state.

The status.EH bit, which protects some data against double-faults,
is only present with the MMU.  Several exception cases did not check
for status.EH being set, as required.

The status.IH bit, which had been set by EXCP_IRQ, is exclusive to
the external interrupt controller, which we do not yet implement.
The internal interrupt controller, when the MMU is also present,
sets the status.EH bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/helper.c | 141 +++++++++++++-----------------------------
 1 file changed, 44 insertions(+), 97 deletions(-)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index eeff032379..6019e2443b 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -49,6 +49,42 @@ void nios2_cpu_record_sigsegv(CPUState *cs, vaddr addr,
 
 #else /* !CONFIG_USER_ONLY */
 
+static void do_exception(Nios2CPU *cpu, uint32_t exception_addr, bool is_break)
+{
+    CPUNios2State *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+    uint32_t old_status = env->ctrl[CR_STATUS];
+    uint32_t new_status = old_status;
+
+    if ((old_status & CR_STATUS_EH) == 0) {
+        int r_ea = R_EA, cr_es = CR_ESTATUS;
+
+        if (is_break) {
+            r_ea = R_BA;
+            cr_es = CR_BSTATUS;
+        }
+        env->ctrl[cr_es] = old_status;
+        env->regs[r_ea] = env->pc + 4;
+
+        if (cpu->mmu_present) {
+            new_status |= CR_STATUS_EH;
+        }
+    }
+
+    new_status &= ~(CR_STATUS_PIE | CR_STATUS_U);
+
+    env->ctrl[CR_STATUS] = new_status;
+    env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                         CR_EXCEPTION, CAUSE,
+                                         cs->exception_index);
+    env->pc = exception_addr;
+}
+
+static void do_iic_irq(Nios2CPU *cpu)
+{
+    do_exception(cpu, cpu->exception_addr, false);
+}
+
 void nios2_cpu_do_interrupt(CPUState *cs)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
@@ -56,57 +92,20 @@ void nios2_cpu_do_interrupt(CPUState *cs)
 
     switch (cs->exception_index) {
     case EXCP_IRQ:
-        assert(env->ctrl[CR_STATUS] & CR_STATUS_PIE);
-
         qemu_log_mask(CPU_LOG_INT, "interrupt at pc=%x\n", env->pc);
-
-        env->ctrl[CR_ESTATUS] = env->ctrl[CR_STATUS];
-        env->ctrl[CR_STATUS] |= CR_STATUS_IH;
-        env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
-        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
-                                             CR_EXCEPTION, CAUSE,
-                                             cs->exception_index);
-
-        env->regs[R_EA] = env->pc + 4;
-        env->pc = cpu->exception_addr;
+        do_iic_irq(cpu);
         break;
 
     case EXCP_TLBD:
         if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
             qemu_log_mask(CPU_LOG_INT, "TLB MISS (fast) at pc=%x\n", env->pc);
-
-            /* Fast TLB miss */
-            /* Variation from the spec. Table 3-35 of the cpu reference shows
-             * estatus not being changed for TLB miss but this appears to
-             * be incorrect. */
-            env->ctrl[CR_ESTATUS] = env->ctrl[CR_STATUS];
-            env->ctrl[CR_STATUS] |= CR_STATUS_EH;
-            env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
-            env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
-                                                 CR_EXCEPTION, CAUSE,
-                                                 cs->exception_index);
-
             env->ctrl[CR_TLBMISC] &= ~CR_TLBMISC_DBL;
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WE;
-
-            env->regs[R_EA] = env->pc + 4;
-            env->pc = cpu->fast_tlb_miss_addr;
+            do_exception(cpu, cpu->fast_tlb_miss_addr, false);
         } else {
             qemu_log_mask(CPU_LOG_INT, "TLB MISS (double) at pc=%x\n", env->pc);
-
-            /* Double TLB miss */
-            env->ctrl[CR_STATUS] |= CR_STATUS_EH;
-            env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
-            env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
-                                                 CR_EXCEPTION, CAUSE,
-                                                 cs->exception_index);
-
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_DBL;
-
-            env->pc = cpu->exception_addr;
+            do_exception(cpu, cpu->exception_addr, false);
         }
         break;
 
@@ -114,78 +113,28 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     case EXCP_TLBW:
     case EXCP_TLBX:
         qemu_log_mask(CPU_LOG_INT, "TLB PERM at pc=%x\n", env->pc);
-
-        env->ctrl[CR_ESTATUS] = env->ctrl[CR_STATUS];
-        env->ctrl[CR_STATUS] |= CR_STATUS_EH;
-        env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
-        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
-                                             CR_EXCEPTION, CAUSE,
-                                             cs->exception_index);
-
         if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WE;
         }
-
-        env->regs[R_EA] = env->pc + 4;
-        env->pc = cpu->exception_addr;
+        do_exception(cpu, cpu->exception_addr, false);
         break;
 
     case EXCP_SUPERA:
     case EXCP_SUPERI:
     case EXCP_SUPERD:
         qemu_log_mask(CPU_LOG_INT, "SUPERVISOR exception at pc=%x\n", env->pc);
-
-        if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
-            env->ctrl[CR_ESTATUS] = env->ctrl[CR_STATUS];
-            env->regs[R_EA] = env->pc + 4;
-        }
-
-        env->ctrl[CR_STATUS] |= CR_STATUS_EH;
-        env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
-        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
-                                             CR_EXCEPTION, CAUSE,
-                                             cs->exception_index);
-
-        env->pc = cpu->exception_addr;
+        do_exception(cpu, cpu->exception_addr, false);
         break;
 
     case EXCP_ILLEGAL:
     case EXCP_TRAP:
         qemu_log_mask(CPU_LOG_INT, "TRAP exception at pc=%x\n", env->pc);
-
-        if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
-            env->ctrl[CR_ESTATUS] = env->ctrl[CR_STATUS];
-            env->regs[R_EA] = env->pc + 4;
-        }
-
-        env->ctrl[CR_STATUS] |= CR_STATUS_EH;
-        env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
-        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
-                                             CR_EXCEPTION, CAUSE,
-                                             cs->exception_index);
-
-        env->pc = cpu->exception_addr;
+        do_exception(cpu, cpu->exception_addr, false);
         break;
 
     case EXCP_BREAK:
         qemu_log_mask(CPU_LOG_INT, "BREAK exception at pc=%x\n", env->pc);
-
-        if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
-            env->ctrl[CR_BSTATUS] = env->ctrl[CR_STATUS];
-            env->regs[R_BA] = env->pc + 4;
-        }
-
-        env->ctrl[CR_STATUS] |= CR_STATUS_EH;
-        env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
-        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
-                                             CR_EXCEPTION, CAUSE,
-                                             cs->exception_index);
-
-        env->pc = cpu->exception_addr;
+        do_exception(cpu, cpu->exception_addr, true);
         break;
 
     case EXCP_SEMIHOST:
@@ -195,9 +144,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         break;
 
     default:
-        cpu_abort(cs, "unhandled exception type=%d\n",
-                  cs->exception_index);
-        break;
+        cpu_abort(cs, "unhandled exception type=%d\n", cs->exception_index);
     }
 }
 
-- 
2.25.1



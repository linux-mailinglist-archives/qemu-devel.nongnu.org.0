Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ED04D465C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:58:39 +0100 (CET)
Received: from localhost ([::1]:43990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHRG-0003gT-3z
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:58:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxV-0005iw-2f
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:53 -0500
Received: from [2607:f8b0:4864:20::630] (port=33540
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxT-0007z0-71
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:52 -0500
Received: by mail-pl1-x630.google.com with SMTP id m2so4642307pll.0
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rza+S9dP6OxTxmW7BN1PpFg5SK23R8f/DSGJ4keNmyI=;
 b=CNrSCPn850CBlkthbD1oNj9qQdzV15JoyNkOrxknFIqBWArr+h9n+JEe+fTQsrh8ty
 JhaBUKiMEwGR50NYBgvXViqhh4aUjFIdStI6CO63d2Pzrp0qK2Ph4Jm3LeKG+WpXxSn3
 0vXYOHcCmC8Bwtp3wQTf9AdvTsfgYb+6If861AFwn1JQTXuMT3M+dsSg8k0ZCA77yWHO
 FO/AAqJ/AcLxqDnMnaGdHSVL/qoni56b7w+Az41T4GKRhe7QYQgl9+8nQBZo1ynonwn9
 kPBBPSmR6rqdQUV8cAG3kBpI0Kq9a0TAFMEgt4vY2lWVL23paHw9kOrH7c+YfvWQ9PeL
 2Z9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rza+S9dP6OxTxmW7BN1PpFg5SK23R8f/DSGJ4keNmyI=;
 b=uTHqZ/uIcjh2TLhrAbz9/q2n7u8fwjSi/sRlr50cO7gk/xGkhwtnHewZjNNjPCM0Bu
 LvxD+f/T7G1lCxmRr733V58mYBRjy7TA92/gRaXqhM1jjCbD7orjm/mbJOHHIzl5Zyiw
 AZ9Lrvtq7IEp+gzynIn5HvlzooqoJy/vWWa/JCKpkM9N+FxZIUawdjCcwaEYrlj/SGaT
 21MG0ZdQiiKNH5ojjhIDNXwevjTc6vdLxbZ8iPzLQC2EfQfjcU//cgZlX3LODzXQ1xw3
 t4jt73aZHZED/yRiX0yfFENLnn7THdCXaMrexm/AGR6Z0095Ao4Cmqif7nzJrfTviv9m
 +ygw==
X-Gm-Message-State: AOAM531w8tYqWKa2BlZlcpOqAEsZfHWcfPnxiu83m2raxTvXAoRX1BzO
 /bLOiPh1xQHTtBZHEGbzrCIErPWTE7TxOw==
X-Google-Smtp-Source: ABdhPJzD+WlAPZ0QGfCvcMLfqHKLrwtpyv6VqUsfZw3L9vtv1X2S8iVJRXfc6erSK/uzuBllYnYlMQ==
X-Received: by 2002:a17:902:9308:b0:14e:def5:e6b5 with SMTP id
 bc8-20020a170902930800b0014edef5e6b5mr4490447plb.73.1646911669835; 
 Thu, 10 Mar 2022 03:27:49 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 21/48] target/nios2: Clean up nios2_cpu_do_interrupt
Date: Thu, 10 Mar 2022 03:26:58 -0800
Message-Id: <20220310112725.570053-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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



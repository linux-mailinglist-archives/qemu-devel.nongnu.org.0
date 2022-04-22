Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2370850BE6A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:14:18 +0200 (CEST)
Received: from localhost ([::1]:39362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwrJ-0001lA-8N
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwXM-0001wI-K6
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:40 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:35431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwXK-0007Li-Nw
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:40 -0400
Received: by mail-pf1-x435.google.com with SMTP id w16so2092142pfj.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f5/eHgJ89Bw1Fi14EqcdKUKLBG0n+ns6jn+rbbcLZws=;
 b=n0BZO8367MsBA9iLnO431Dt3gbdL5clYCl1Vdvdc3Sx2Akl8Qd+I17Xiq11PRU+9NW
 s3OeBdLfc99xL1WFdDv1czeUjV1YIkolspENAiYFbbYgLj8lRcB/nbbh5TmCIpbLKmAP
 16J2ov5MYlTkzyRRHRQu1OhDmJ3Eupr4nFAgT0pk19q+hKC3eUR44giKkzCCqjUooVm/
 bU2NpL+tO4ZeM7PwNuh7xyo/O/oq8Lq29HM1u2D7snVqcpUHFHQvYDg2jsDYHEyYUjMX
 GapWCIh2muxmBc31gKDF6dmH96crKNxFL3F7SYyRBK98OOSxueuf7lfed1kj8hF/HK3i
 5ZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f5/eHgJ89Bw1Fi14EqcdKUKLBG0n+ns6jn+rbbcLZws=;
 b=2XkxRBmZ1vHuJJdu5euDk+bCZqg5+CuUxyzN/nVlxbQvow1UVxyOdtK3kyPX9b/x26
 MKG4gR+yIQHVIBADVb6LP7fKboOswQoyvHhEwNcIvfuyxCG9IxMsg6Rv94faboxFoKKQ
 xoItKs9C6LIPTOBgvLD09rTNPUP8JjSWSw5AP0PGeUYtt2VZuif7TSeprCoU9AsJ/FIn
 btp2j/JrGHbjfz9Bkn/q5REFerigxFYstySIjwmbGatIDl0SqVz9TELhWqFxVHnYSZjh
 Uz89e4U1S+zVYg0ncGEUkZ5h82R5JxasZmLWXR6asCI05+QXr32XQHPC3a8JIPHHu6ha
 A/qQ==
X-Gm-Message-State: AOAM533TPMSocpYOMGHFHcNRK/xfhWe6G3VJ3vUV95sHUHrEMAnpCoWp
 s19JFWm0Rq8Rwcu5pp+CArcTrsL7sxSP9ZIr
X-Google-Smtp-Source: ABdhPJwJ2Tvx/pmgobvG20h6LLQjvzDzno+E1Le553Vi3I/Au+iY0CvXjsLEH4edx0fOPqLVhpgb7A==
X-Received: by 2002:a65:6e82:0:b0:381:71c9:9856 with SMTP id
 bm2-20020a656e82000000b0038171c99856mr4720400pgb.316.1650646417369; 
 Fri, 22 Apr 2022 09:53:37 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 32/68] target/nios2: Clean up nios2_cpu_do_interrupt
Date: Fri, 22 Apr 2022 09:52:02 -0700
Message-Id: <20220422165238.1971496-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Split out do_exception and do_iic_irq to handle bulk of the interrupt and
exception processing.  Parameterize the changes required to cpu state.

The status.EH bit, which protects some data against double-faults,
is only present with the MMU.  Several exception cases did not check
for status.EH being set, as required.

The status.IH bit, which had been set by EXCP_IRQ, is exclusive to
the external interrupt controller, which we do not yet implement.
The internal interrupt controller, when the MMU is also present,
sets the status.EH bit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-33-richard.henderson@linaro.org>
---
 target/nios2/helper.c | 141 +++++++++++++-----------------------------
 1 file changed, 44 insertions(+), 97 deletions(-)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 1d17c0379f..63971a8b3c 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -29,6 +29,42 @@
 #include "semihosting/semihost.h"
 
 
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
@@ -36,57 +72,20 @@ void nios2_cpu_do_interrupt(CPUState *cs)
 
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
 
@@ -94,78 +93,28 @@ void nios2_cpu_do_interrupt(CPUState *cs)
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
@@ -175,9 +124,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         break;
 
     default:
-        cpu_abort(cs, "unhandled exception type=%d\n",
-                  cs->exception_index);
-        break;
+        cpu_abort(cs, "unhandled exception type=%d\n", cs->exception_index);
     }
 }
 
-- 
2.34.1



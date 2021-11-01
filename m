Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F80441FCD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:09:23 +0100 (CET)
Received: from localhost ([::1]:41684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbkI-0003Pj-8w
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9C-0007vv-C7
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:02 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:40877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb98-0001Bs-Ed
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:02 -0400
Received: by mail-qk1-x72d.google.com with SMTP id ay20so1931301qkb.7
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6E2EHrVXu+fKkNaLcRStkdoJxkkRxYzYfXrw6rxs8+I=;
 b=y/2DAusmr58qk+0j5ChBadldsLcd3ywmFJsY3pD8Mrv4OALbJGaTdnQy/Ik/xcp1z3
 6LfmnnMHQKhNYPUmZMMktCAS4mjW8qcLNh9/qpTtD79HBf7pypYd+M5eiBBEz97HXGeH
 W09m565TnEzGu1rb2wK6Z2Petfsc6EDMefz0QHYKrm3bk6RGbxzRu30wnADNyDv14UZ0
 StYQGjsTurKOfE6enr8ooMRQc8notxRdEm5oNqCJBuAUXKqxiJTQ10jOAbEpnHsiq1N3
 cTwbctReDttf+zZFSCGvN+hyiSp4vJhrAcYASb3d42Wre1QxWx2n5DMsAgrX+uRsD8S6
 6pOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6E2EHrVXu+fKkNaLcRStkdoJxkkRxYzYfXrw6rxs8+I=;
 b=YbNODofFyNSEOC2TyZzPcFarWAELDGjTKQmsYpM1fSRCeuXbjL8QwrcHcgoSTq725L
 NJIBPMHjhvRUPPEKRUoThFzy+cvIlwvEzJs3nwuS8lYS/6O17bxZgtIwt+jYizltH10h
 UatCYgosaqVRlH/3Fw9bMmsr8S1mI+ScMTfyRE69vvu+4d23Y4oT/YJJPyaWvjz42aYu
 HP/0vSmTPmB/LGmGD5/fgvquHY8hQEQuhNxuNS54wCusZHJHdGruXesSeocW/7c4t5Rp
 y7zCuVh3d0mgtn7tP2ir70kC6XmMurbcGR+sa8b6SZM4JnJf1/gPUwHvAz4dffGQtgwq
 3zIQ==
X-Gm-Message-State: AOAM531DAAihD4u+c+lJzP0mvouSElixdYaJl4eG0QaSJbYOP0TUzdBS
 agifmYYKQhXGr9tf3w8VKjpr4a2/xRBNQw==
X-Google-Smtp-Source: ABdhPJzCvgeTUPzHfjfsBI36VaUeBBz5Z/fFWRy8aCe+ZvocYlqNDwBSUBWcRI37i1o0PvZilwu5sQ==
X-Received: by 2002:a05:620a:4721:: with SMTP id
 bs33mr24191250qkb.0.1635787857536; 
 Mon, 01 Nov 2021 10:30:57 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id 13sm1222289qkc.40.2021.11.01.10.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:30:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 45/60] target/arm: Implement arm_cpu_record_sigbus
Date: Mon,  1 Nov 2021 13:27:14 -0400
Message-Id: <20211101172729.23149-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because of the complexity of setting ESR, re-use the existing
arm_cpu_do_unaligned_access function.  This means we have to
handle the exception ourselves in cpu_loop, transforming it
to the appropriate signal.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h        |  2 ++
 linux-user/aarch64/cpu_loop.c | 12 +++++++++---
 linux-user/arm/cpu_loop.c     | 30 ++++++++++++++++++++++++++----
 target/arm/cpu.c              |  1 +
 target/arm/cpu_tcg.c          |  1 +
 target/arm/tlb_helper.c       |  6 ++++++
 6 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 5a7aaf0f51..89f7610ebc 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -548,6 +548,8 @@ static inline bool arm_extabort_type(MemTxResult result)
 void arm_cpu_record_sigsegv(CPUState *cpu, vaddr addr,
                             MMUAccessType access_type,
                             bool maperr, uintptr_t ra);
+void arm_cpu_record_sigbus(CPUState *cpu, vaddr addr,
+                           MMUAccessType access_type, uintptr_t ra);
 #else
 bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       MMUAccessType access_type, int mmu_idx,
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 034b737435..97e0728b67 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -79,7 +79,7 @@
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr, ec, fsc, si_code;
+    int trapnr, ec, fsc, si_code, si_signo;
     abi_long ret;
 
     for (;;) {
@@ -121,20 +121,26 @@ void cpu_loop(CPUARMState *env)
             fsc = extract32(env->exception.syndrome, 0, 6);
             switch (fsc) {
             case 0x04 ... 0x07: /* Translation fault, level {0-3} */
+                si_signo = TARGET_SIGSEGV;
                 si_code = TARGET_SEGV_MAPERR;
                 break;
             case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
             case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
+                si_signo = TARGET_SIGSEGV;
                 si_code = TARGET_SEGV_ACCERR;
                 break;
             case 0x11: /* Synchronous Tag Check Fault */
+                si_signo = TARGET_SIGSEGV;
                 si_code = TARGET_SEGV_MTESERR;
                 break;
+            case 0x21: /* Alignment fault */
+                si_signo = TARGET_SIGBUS;
+                si_code = TARGET_BUS_ADRALN;
+                break;
             default:
                 g_assert_not_reached();
             }
-
-            force_sig_fault(TARGET_SIGSEGV, si_code, env->exception.vaddress);
+            force_sig_fault(si_signo, si_code, env->exception.vaddress);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index ae09adcb95..01cb6eb534 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -25,6 +25,7 @@
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 #include "semihosting/common-semi.h"
+#include "target/arm/syndrome.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
@@ -280,7 +281,7 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr;
+    int trapnr, si_signo, si_code;
     unsigned int n, insn;
     abi_ulong ret;
 
@@ -423,9 +424,30 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            /* XXX: check env->error_code */
-            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR,
-                            env->exception.vaddress);
+            /* For user-only we don't set TTBCR_EAE, so look at the FSR. */
+            switch (env->exception.fsr & 0x1f) {
+            case 0x1: /* Alignment */
+                si_signo = TARGET_SIGBUS;
+                si_code = TARGET_BUS_ADRALN;
+                break;
+            case 0x3: /* Access flag fault, level 1 */
+            case 0x6: /* Access flag fault, level 2 */
+            case 0x9: /* Domain fault, level 1 */
+            case 0xb: /* Domain fault, level 2 */
+            case 0xd: /* Permision fault, level 1 */
+            case 0xf: /* Permision fault, level 2 */
+                si_signo = TARGET_SIGSEGV;
+                si_code = TARGET_SEGV_ACCERR;
+                break;
+            case 0x5: /* Translation fault, level 1 */
+            case 0x7: /* Translation fault, level 2 */
+                si_signo = TARGET_SIGSEGV;
+                si_code = TARGET_SEGV_MAPERR;
+                break;
+            default:
+                g_assert_not_reached();
+            }
+            force_sig_fault(si_signo, si_code, env->exception.vaddress);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7a18a58ca0..a211804fd3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2035,6 +2035,7 @@ static const struct TCGCPUOps arm_tcg_ops = {
 
 #ifdef CONFIG_USER_ONLY
     .record_sigsegv = arm_cpu_record_sigsegv,
+    .record_sigbus = arm_cpu_record_sigbus,
 #else
     .tlb_fill = arm_cpu_tlb_fill,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 7b3bea2fbb..13d0e9b195 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -902,6 +902,7 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
 
 #ifdef CONFIG_USER_ONLY
     .record_sigsegv = arm_cpu_record_sigsegv,
+    .record_sigbus = arm_cpu_record_sigbus,
 #else
     .tlb_fill = arm_cpu_tlb_fill,
     .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index dc5860180f..12a934e924 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -213,4 +213,10 @@ void arm_cpu_record_sigsegv(CPUState *cs, vaddr addr,
     cpu_restore_state(cs, ra, true);
     arm_deliver_fault(cpu, addr, access_type, MMU_USER_IDX, &fi);
 }
+
+void arm_cpu_record_sigbus(CPUState *cs, vaddr addr,
+                           MMUAccessType access_type, uintptr_t ra)
+{
+    arm_cpu_do_unaligned_access(cs, addr, access_type, MMU_USER_IDX, ra);
+}
 #endif /* !defined(CONFIG_USER_ONLY) */
-- 
2.25.1



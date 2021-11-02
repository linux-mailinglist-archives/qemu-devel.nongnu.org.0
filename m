Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F33442D5D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:01:20 +0100 (CET)
Received: from localhost ([::1]:48346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsTf-0001fQ-T2
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrh9-0001KT-KN
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:11 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:34339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrh7-0001wa-9P
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:11 -0400
Received: by mail-qk1-x72a.google.com with SMTP id bq14so7755075qkb.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6E2EHrVXu+fKkNaLcRStkdoJxkkRxYzYfXrw6rxs8+I=;
 b=Q6XFHrCupXMVTPp9bv4ETF+88jMNQPm3FFr07T/r3ZlW9LfqSGQ2BnW2e5LEvkTl7P
 KAhI4bTpZiJABaR2UPvlZcnBAfvcWCmSjh4Z3UkK+0n0mL1MgZGb9Z1t2j4qoxkuYkG3
 37Rgn1SjlFEP9i/cUJtr1OEfNgilPxO6uxI8IpwAPtLqOYr0MnmJhRLJf8UQ5ZsHm91m
 L6NDOuHjo6LGlAPwgby3cRcgH4ieF/NB961ioFdUPTBs5XD4MKbCrV46TvIwG6dCOUeg
 9mEd+rEHze5Fh19d+S+1hDIz/BiUclnrhXpqVHAFW5p6C0W7rrNzlYBmXzgVDxOZfFpU
 Vxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6E2EHrVXu+fKkNaLcRStkdoJxkkRxYzYfXrw6rxs8+I=;
 b=n99zmtT+rYFeO7IdWtow8BNxBBpjF88/ySkeBZF1nDy9ADrBMZ05ovdUvIeL4kadj+
 NFMdk8vBZph0tG1l1gXMvFarZEpdebykDS/Mptjv1YgnDXdI1nOFLx5zxp4Bi7eWqDfG
 xVNTPrPhWoIifDXoY3q0fTd40HciQQi32DreMSIAlMhRdkL/TQDpRGKE0uAbZP+MFJcJ
 iM1P+PFyXxwAbQqo2+0HRyddRqdG/cmLr4z/Xdgq2F2FT78/6esbmD6ehcsv7a0j1YAa
 WgTfdBQKLNvXCrZ4MmGLLreeGjZshvz6/VjMWZtjNlJhW1sPZTvEe0gJIPKFj70BgkET
 LY7A==
X-Gm-Message-State: AOAM5339Fb4HekRnvUds600bdC5HT+pzcQmyA3HaBG+nVD2ar4emQ49h
 t9A7KmZ3UD8L3557X31FflwgTlctfzA5eA==
X-Google-Smtp-Source: ABdhPJw4pgXNVM67twCoz7DBFw8qNnWrwrAhdDqRWD5bex0UPYu+tNRcuGqlX3DW7OcgYcQ0rj2Y9w==
X-Received: by 2002:a37:b686:: with SMTP id g128mr28723388qkf.68.1635851468409; 
 Tue, 02 Nov 2021 04:11:08 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm25sm12730854qkb.4.2021.11.02.04.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:11:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 45/60] target/arm: Implement arm_cpu_record_sigbus
Date: Tue,  2 Nov 2021 07:07:25 -0400
Message-Id: <20211102110740.215699-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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



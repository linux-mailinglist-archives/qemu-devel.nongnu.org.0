Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA61440B51
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:42:27 +0200 (CEST)
Received: from localhost ([::1]:40586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgtJC-0001yK-PR
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1n-0001Sy-Gt
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:25 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:38574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1k-0002Al-Vf
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:22 -0400
Received: by mail-pl1-x62d.google.com with SMTP id i5so8921929pla.5
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jLMjBC8As2Qf0j/kKO70QMZc6RPo1kSmruI7dUHbIeQ=;
 b=oeJSCtLGFxN51rTrk6L/KTZYDmm2Gs350N2/oZH2AafuMqdhodizIeze9Vyx8RIeyZ
 1QAGpRiBWUQ2yMtYu1+Ci1P+CpCEO77HqDJ/dgCM3C5u5dbkrhpni6KAC9kou/t0g9M4
 +iaURw0AO+TljvyTP1Bin6ymGxl5cUjb1ebkeb8DQMzuve1A0sIF8hR/YJox1dBLGDaK
 VUO6J6XReUDdl74pyCSVgEA7P0odxosm7xYGsVkEU5o0++acS+SHP6K4ZawQmuzlxFwX
 s2faXvZlbLCnzi2jVDqvHyPffa0X6Ns2suKZopeDFI2ePfQeoiyzj8bvoFtBNhAxFfxk
 PgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jLMjBC8As2Qf0j/kKO70QMZc6RPo1kSmruI7dUHbIeQ=;
 b=VtEml3jtx7qC786mRhQT5ay2yIzpeo5ENWS6iqhPQQlTWKhxP3XCd940ae9aahomvm
 3jlCPdMF+utRDpapLFf8oFbfjTE59hhRRoJJtNnSMRYrFssA/tPimVzPhLT4SREyFBVu
 y+Of2ACj68dbYFkRpSRgKdf3/rT1oJ0P/qc//JgMjq+iVW009zmThwxyQIbi9mirxxD0
 48fU5GpxeUYgjSxeA2f8mKn6IG2u7aLgQQcGBRDJuBKt47XWNf+/JOyciwCCYvj+qPaV
 KVGOdjOqDR8rXLLxkhjClRpDsrw9nZwNkHKEi2j5jjKCsDeML81CEKvR4Z6yNe3l0UbA
 ktwg==
X-Gm-Message-State: AOAM5312tr3qtqG+0UyDvaOJp3Ttg0vJ2x2hj/tUkMQuGoKJuD0r1F+F
 Y0IvKgnNhGGorph6+uQ6f19CJZtOH2Bz9A==
X-Google-Smtp-Source: ABdhPJx41zkXfSq4QMqPaWfRuJ6TmUuyQnjgSvK1VjGCcLaqLArAvlbkrVqnIoltIdOpWqxXQM3fRA==
X-Received: by 2002:a17:90a:598d:: with SMTP id
 l13mr19287351pji.8.1635614418226; 
 Sat, 30 Oct 2021 10:20:18 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 45/66] target/arm: Implement arm_cpu_record_sigbus
Date: Sat, 30 Oct 2021 10:16:14 -0700
Message-Id: <20211030171635.1689530-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because of the complexity of setting ESR, re-use the existing
arm_cpu_do_unaligned_access function.  This means we have to
handle the exception ourselves in cpu_loop, transforming it
to the appropriate signal.

Reviewed-by: Warner Losh <imp@bsdimp.com>
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



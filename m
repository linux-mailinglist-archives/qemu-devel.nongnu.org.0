Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4EE42B2DE
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 04:48:41 +0200 (CEST)
Received: from localhost ([::1]:44644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUJs-00075b-HV
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 22:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHY-00047f-Vl
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:16 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHX-0004l5-0r
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:16 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 75so897682pga.3
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AiCyvdTR/3QA/VxcdfSHeMxoA2jAV+mFfUYWeOlFIz4=;
 b=sEm9BYPEvHWfo47IWFlxeuDlVHChU/4rNxRL4GIAhWzTGL1/7gTYE7Wzy1TKLSC1Ja
 E8eMVrkh9V0Jon9TDa0Jozps2cVila/Db4EBwIyhK49vXkugeanJGnMIFXc52oLZQJZr
 OnpYrhcvC014PqWxFCwy6O3KdV+xUb5x14KPmINMONyPvQiTrXIyu+50JgwjuH2JrZdP
 D18EfTR1sjgeJn84IHnz9e/CPGtRhTIfMMzdCXu+GOPwQ6eDTzklr5Kz+0ivD2BtoFSZ
 5fMkCxO10insAmi223RnIs8qFsBvEQCAfYf7jmLBeIZZYMujBb66OhwMNayRDZ1+EPwt
 eMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AiCyvdTR/3QA/VxcdfSHeMxoA2jAV+mFfUYWeOlFIz4=;
 b=HLU4tGvY9FGOIOjxHVbZ0VsoVrhzIMEpsBcqruXOxVILb1tjTikgxIK6rl7VpXDiu1
 pye5jK/2U1Kxhw0FBwnZMGewNR+lOjHg2rAN097CoINpA07wFYdb4lEf3dZ1Cio2tz53
 fKoMVUv5LmB9m4kx0Kw0AYdIOWbmK5cqOQnCd7ENfxUQFsnIDiFf9vjkndeJXfP5ueuf
 AiHad8yisQE6ZUcB+X6ZsIOArP3rUXOKvPhZTIZYOYqjGINmUpZzm0GumTaorObDRGp1
 HGLnjgAlmEgybdp1jrLBNQKQ3aTjpimLLhDPJ6mutTywT+5th2zqYrU8TRvtnvhSIlz0
 Z6UQ==
X-Gm-Message-State: AOAM53199zfGlreSUURPHE2Nw1ReAR5l4vGpapFdm4ywMKKl5zK0/9Z5
 X/q+VBaJPyCJ5JPDLtPsA1A7Py5WMeE1PA==
X-Google-Smtp-Source: ABdhPJxyN8672kME1Mwz+2k81mY/sHqSFJYvg+Y9+YONo+LdUlloy7OptNIoXUy7bAnpDpurwRSZVA==
X-Received: by 2002:a63:2acb:: with SMTP id q194mr25849305pgq.59.1634093173656; 
 Tue, 12 Oct 2021 19:46:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/48] target/arm: Implement arm_cpu_record_sigbus
Date: Tue, 12 Oct 2021 19:45:23 -0700
Message-Id: <20211013024607.731881-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because of the complexity of setting ESR, re-use the existing
arm_cpu_do_unaligned_access function.  This means we have to
handle the exception ourselves in cpu_loop, transforming it
to the appropriate signal.

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



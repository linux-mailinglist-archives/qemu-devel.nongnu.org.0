Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BFE3D9A9C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 02:54:26 +0200 (CEST)
Received: from localhost ([::1]:43950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uJc-0004RE-EY
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 20:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCP-0003ta-JF
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:46:57 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:42874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCN-0002N7-P2
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:46:57 -0400
Received: by mail-pl1-x62b.google.com with SMTP id t3so2757070plg.9
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VJ8uTcke4SajDVt7FCT6EHsU3nGyX1rmSUpR3pKNo+M=;
 b=j97tfnX2DMRd2yfl8JDHejGj12hTbtP66V834UnBC6lL1tG25Czxrdsv4s8ksvtfb1
 s4U8njnFlq9isXWnznjG7yWwm5u9yn4ZpKSau2w4u20dqeJOlXFdrFbx/xEz85d6BDBp
 n7HTeS3cCYwD7S+sIQB5MnZUultCHvuXryo89QDKy9uSE/pqeQUFPyU51iQq68cTf+Nq
 ZoSpOVcToOY1vSZqKvGQxEdFkTrQ84y83zipCNXYp2RyZFb13Aa8FVR3USZvMKrpO0Y3
 j4suyAf/ytgEELcGVGwcPxoQ4dTidAFF0v4cc/hLBAYOb/honYrP2vwrG7eIHG/GLt0F
 y+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VJ8uTcke4SajDVt7FCT6EHsU3nGyX1rmSUpR3pKNo+M=;
 b=Kp1oviFLzMPuqMWoVH/NaM10DQk3YpAy/koPT1COgJ+KmpaT67AqTQzI59CcqDStqw
 W5PQoDGGDp9tnppKz9nvjEpzH+fT/gALbtFotoiiKIRR/She+/ga+TtW9upRgYlf6RlH
 W0wdQ/WHyx+AKRYkxjjrOd7ifCM7lQatTbpfhAANNQn6x2ilFlAkXQ10j2ZgMGlh//FV
 5dfuGWoK6qs4ga2jLl2NMRnfrRDR5OQPhwSmXxn7Zr9RRjIehMpJ99Alh2FOBaL0VjgP
 k596wVDDrglBvIGeIRrBuSB+hUy2SIIFIdmW1HrpmYxnxtFZionL7XazbCVqyk+DyMPx
 slAQ==
X-Gm-Message-State: AOAM533ICLJzaXHJ31Nl0kSPZKF9h60upZbDFw8nm0prBJoOSRSgya0W
 xqMJ62qOLU2yZ8NB2dGT35C37DNluIb/SA==
X-Google-Smtp-Source: ABdhPJxiz1xUHzuHxqCgWuvN7QMJgCrwTMg5yZSCkYS27Kw3ynadoaAm+alSPF9oAF5C0QNXBy3n6Q==
X-Received: by 2002:a17:90a:d3d2:: with SMTP id
 d18mr12387310pjw.102.1627519613939; 
 Wed, 28 Jul 2021 17:46:53 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:46:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 03/43] target/arm: Implement do_unaligned_access for
 user-only
Date: Wed, 28 Jul 2021 14:46:07 -1000
Message-Id: <20210729004647.282017-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c |  4 ++++
 linux-user/arm/cpu_loop.c     | 43 +++++++++++++++++++++++++++--------
 target/arm/cpu.c              |  2 +-
 target/arm/cpu_tcg.c          |  2 +-
 4 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index ee72a1c20f..998831f87f 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -137,6 +137,10 @@ void cpu_loop(CPUARMState *env)
             case 0x11: /* Synchronous Tag Check Fault */
                 info.si_code = TARGET_SEGV_MTESERR;
                 break;
+            case 0x21: /* Alignment fault */
+                info.si_signo = TARGET_SIGBUS;
+                info.si_code = TARGET_BUS_ADRALN;
+                break;
             default:
                 g_assert_not_reached();
             }
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 69632d15be..da7da6a0c1 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -23,6 +23,7 @@
 #include "elf.h"
 #include "cpu_loop-common.h"
 #include "semihosting/common-semi.h"
+#include "target/arm/syndrome.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
@@ -286,9 +287,8 @@ void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr;
-    unsigned int n, insn;
+    unsigned int n, insn, ec, fsc;
     target_siginfo_t info;
-    uint32_t addr;
     abi_ulong ret;
 
     for(;;) {
@@ -437,15 +437,40 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            addr = env->exception.vaddress;
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
+            info.si_signo = TARGET_SIGSEGV;
+            info.si_errno = 0;
+            info._sifields._sigfault._addr = env->exception.vaddress;
+            /*
+             * We should only arrive here with EC in {DATAABORT, INSNABORT},
+             * and short-form FSC, which then tells us to look at the FSR.
+             * ??? arm_cpu_reset never sets TTBCR_EAE, so we always get
+             * short-form FSC.
+             */
+            ec = syn_get_ec(env->exception.syndrome);
+            assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
+            fsc = extract32(env->exception.syndrome, 0, 6);
+            assert(fsc == 0x3f);
+            switch (env->exception.fsr & 0x1f) {
+            case 0x1: /* Alignment */
+                info.si_signo = TARGET_SIGBUS;
+                info.si_code = TARGET_BUS_ADRALN;
+                break;
+            case 0x3: /* Access flag fault, level 1 */
+            case 0x6: /* Access flag fault, level 2 */
+            case 0x9: /* Domain fault, level 1 */
+            case 0xb: /* Domain fault, level 2 */
+            case 0xd: /* Permision fault, level 1 */
+            case 0xf: /* Permision fault, level 2 */
+                info.si_code = TARGET_SEGV_ACCERR;
+                break;
+            case 0x5: /* Translation fault, level 1 */
+            case 0x7: /* Translation fault, level 2 */
                 info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = addr;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+                break;
+            default:
+                g_assert_not_reached();
             }
+            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2866dd7658..de0d968d76 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1987,11 +1987,11 @@ static const struct TCGCPUOps arm_tcg_ops = {
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .tlb_fill = arm_cpu_tlb_fill,
     .debug_excp_handler = arm_debug_excp_handler,
+    .do_unaligned_access = arm_cpu_do_unaligned_access,
 
 #if !defined(CONFIG_USER_ONLY)
     .do_interrupt = arm_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
-    .do_unaligned_access = arm_cpu_do_unaligned_access,
     .adjust_watchpoint_address = arm_adjust_watchpoint_address,
     .debug_check_watchpoint = arm_debug_check_watchpoint,
     .debug_check_breakpoint = arm_debug_check_breakpoint,
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index ed444bf436..1b91fdc890 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -904,11 +904,11 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .tlb_fill = arm_cpu_tlb_fill,
     .debug_excp_handler = arm_debug_excp_handler,
+    .do_unaligned_access = arm_cpu_do_unaligned_access,
 
 #if !defined(CONFIG_USER_ONLY)
     .do_interrupt = arm_v7m_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
-    .do_unaligned_access = arm_cpu_do_unaligned_access,
     .adjust_watchpoint_address = arm_adjust_watchpoint_address,
     .debug_check_watchpoint = arm_debug_check_watchpoint,
     .debug_check_breakpoint = arm_debug_check_breakpoint,
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680FE3DE4FC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:19:05 +0200 (CEST)
Received: from localhost ([::1]:59148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAltQ-0004NL-Fv
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpN-0002Rh-N5
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:14:53 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:41691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpM-00020M-1S
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:14:53 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so3039244pjd.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0avjQz61O1UDh0ow8DTJdexDEoV0wTRc6gRwV1FVBek=;
 b=fEzbuQ2o1YMjf2xG6CliuYA/P3a3ILyjNr22b57kcniv239sgeZKkdECBYJLs9mVCt
 Te8ngZlghqakJnGHt1R82Nb7fzIE1rB49peHizkApsgz1LCnHzmVXyXjnMqRyogXbP1N
 BsqDjdDcRD1iQE0d6T5TlujRXwle5BTlMTY2eukbYILaLyhsC/v4oAHvWAcW+ju+2/pF
 Utn6RcakLEtusk9T7A6lf29aT/AvjdbTwqKkamvUv6Y/u7h/UfAMAwuVuQhT1Wy0okkp
 J5LcwZyAyiT+qDWGJcCBc5un0DN5nRi1Z3qB6I5hWSQfBlaVeitZ/RXk0Ye45YVmGx8v
 bYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0avjQz61O1UDh0ow8DTJdexDEoV0wTRc6gRwV1FVBek=;
 b=VDuTKOcwvZjjt0+2f6BHDFJg5HgnCspovHKijeUYTxAb4UZIQRAHACOWveIUD/Aapl
 SiLiRphXzmrLjAskKWoORKqQS+7cxYq+ZBJPGdTEJdiw9PNuPXbCE+567hMSUd0WCFwH
 bcJj1Os+mXNg0H+DdhGEa+PmacynE8u82F8yAd7FEY4b/MOQWD4tfHnHGiiEEBDGNkxg
 QZsD9evG133h5gO3QxJ+teAPkQYdf2VA2iZHLTFFc7xM7JYJdNqxbqYLOxp5WVrvwbxm
 fx4n6tlV4rqpMJb/O9c6YQuhsB3FYZ/Hf2l/mlkWaxz6KuS2l2DbIDH+TFU0TRHUmNqp
 DU8g==
X-Gm-Message-State: AOAM5308gp+y5SpTCm5jszjT6/kY7YbGwqCmzCUB777FSoFuviGFMKgL
 kVWZR9BP6EB8AguSH09cg4TErt/0B9UMzQ==
X-Google-Smtp-Source: ABdhPJxZMe/WbWK6rHF9MP4ZF00EPwHp6BKHk9t8ltRT8u2YINdHEbHOHlepzli+14wybzl90efDPg==
X-Received: by 2002:a17:90a:ce07:: with SMTP id
 f7mr2394720pju.214.1627964090813; 
 Mon, 02 Aug 2021 21:14:50 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:14:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/55] target/arm: Implement do_unaligned_access for
 user-only
Date: Mon,  2 Aug 2021 18:13:52 -1000
Message-Id: <20210803041443.55452-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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



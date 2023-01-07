Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3C16610C2
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 19:21:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEDoW-0008NQ-3Z; Sat, 07 Jan 2023 13:21:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEDoU-0008Mr-6r
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 13:21:02 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEDoS-00085l-93
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 13:21:01 -0500
Received: by mail-pl1-x62a.google.com with SMTP id v23so194747plo.1
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 10:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=s6evI+M0G2ZmslA/Z5Eeuj0ezG7tzAn0rfOglUgGxD4=;
 b=gXmW7YgTVwRzEhCcq9McMcgrNpaz0hf/SozoRhPTu9vFykl9v9nwAdjJYkom3nTo5s
 BIClNZJWWxw/utzX5qzcr2FdW3ir6TrAHqFkbp7H8CuTZhhX13sKsy7OZ2mdzrtELup8
 NnkNL4jI7UsLMu4fFkNHmvf54UTP7NXAMDCpC3dlAUX6nbqTNly6YAtpjEt1o0IaZeYK
 Zq2CzJkBfbBVjBoDqEFIadIIwjphe3El50J7N3f9YFOZE85WKZB57vVgtK93aLN8dmIf
 EDWI/FgWdN3JJ5jdFHyjyUVmnWASRSmt45hTkKDDUFV97BpblHR7KM4oiR2ZavvDTIdA
 xRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s6evI+M0G2ZmslA/Z5Eeuj0ezG7tzAn0rfOglUgGxD4=;
 b=IQc5UEAaZhhIdZA5lSdVaWL1WmBwZRXyso3ptrTXdl1IpNiaQicmpz5wElSldDLaTT
 c8zLvD8G2w/U9fRMwNmmWOJEgnix58JUA0DEMd6QfgcJwffpFgb3cDQ1z3eLW0DpQ/Wn
 0wMMLIpqbkq6ufmmkpu1/Bz0RXRl41vLQBjgL787qJ5ZpOQowJZa1avmjopqBwDikWLj
 RMcjsYmwPUwzTENsv2ZhkXJZkmxbwNgi2loqYgde8/SxO15bWzviIRLRtOMvzbiVTZLn
 MJ/Ix67e95plBbnrXjuSV57kCcMm2XTzOXrz1Ow7aP41+Yd8NlvaJAunPTD6avB4ztvY
 4T4w==
X-Gm-Message-State: AFqh2krJRzkhsWQ26uJi+k1v43dbuQnOxqZUUEEWDUbUYapAn128xsoX
 vxCW+fEu/zrsjgMLfjpbSbJ7BV875CQBmBfV
X-Google-Smtp-Source: AMrXdXu+QFUEaonH1YxFaqCyM6BCL7tIS62PcHzNZTh7bqsFE5IzVXkWTSxCGYWIg1yCoEdd2unc0Q==
X-Received: by 2002:a17:903:240b:b0:192:991f:d8e8 with SMTP id
 e11-20020a170903240b00b00192991fd8e8mr40010446plo.53.1673115658593; 
 Sat, 07 Jan 2023 10:20:58 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 y29-20020aa793dd000000b0056c2e497b02sm3199119pff.173.2023.01.07.10.20.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 10:20:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] accel/tcg: Split out cpu_exec_{setjmp,loop}
Date: Sat,  7 Jan 2023 10:20:57 -0800
Message-Id: <20230107182057.1984146-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Recently the g_assert(cpu == current_cpu) test has been
intermittently failing with gcc.  Reorg the code around
the setjmp to minimize the lifetime of the cpu variable
affected by the setjmp.

This appears to fix the existing issue with clang as well.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1147
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 111 +++++++++++++++++++++----------------------
 1 file changed, 54 insertions(+), 57 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 356fe348de..8927092537 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -909,64 +909,10 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
 
 /* main execution loop */
 
-int cpu_exec(CPUState *cpu)
+static int __attribute__((noinline))
+cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
 {
     int ret;
-    SyncClocks sc = { 0 };
-
-    /* replay_interrupt may need current_cpu */
-    current_cpu = cpu;
-
-    if (cpu_handle_halt(cpu)) {
-        return EXCP_HALTED;
-    }
-
-    rcu_read_lock();
-
-    cpu_exec_enter(cpu);
-
-    /* Calculate difference between guest clock and host clock.
-     * This delay includes the delay of the last cycle, so
-     * what we have to do is sleep until it is 0. As for the
-     * advance/delay we gain here, we try to fix it next time.
-     */
-    init_delay_params(&sc, cpu);
-
-    /* prepare setjmp context for exception handling */
-    if (sigsetjmp(cpu->jmp_env, 0) != 0) {
-#if defined(__clang__)
-        /*
-         * Some compilers wrongly smash all local variables after
-         * siglongjmp (the spec requires that only non-volatile locals
-         * which are changed between the sigsetjmp and siglongjmp are
-         * permitted to be trashed). There were bug reports for gcc
-         * 4.5.0 and clang.  The bug is fixed in all versions of gcc
-         * that we support, but is still unfixed in clang:
-         *   https://bugs.llvm.org/show_bug.cgi?id=21183
-         *
-         * Reload an essential local variable here for those compilers.
-         * Newer versions of gcc would complain about this code (-Wclobbered),
-         * so we only perform the workaround for clang.
-         */
-        cpu = current_cpu;
-#else
-        /* Non-buggy compilers preserve this; assert the correct value. */
-        g_assert(cpu == current_cpu);
-#endif
-
-#ifndef CONFIG_SOFTMMU
-        clear_helper_retaddr();
-        if (have_mmap_lock()) {
-            mmap_unlock();
-        }
-#endif
-        if (qemu_mutex_iothread_locked()) {
-            qemu_mutex_unlock_iothread();
-        }
-        qemu_plugin_disable_mem_helpers(cpu);
-
-        assert_no_pages_locked();
-    }
 
     /* if an exception is pending, we execute it here */
     while (!cpu_handle_exception(cpu, &ret)) {
@@ -1033,9 +979,60 @@ int cpu_exec(CPUState *cpu)
 
             /* Try to align the host and virtual clocks
                if the guest is in advance */
-            align_clocks(&sc, cpu);
+            align_clocks(sc, cpu);
         }
     }
+    return ret;
+}
+
+static int cpu_exec_setjmp(CPUState *cpu, SyncClocks *sc)
+{
+    /* Prepare setjmp context for exception handling. */
+    if (unlikely(sigsetjmp(cpu->jmp_env, 0) != 0)) {
+        /* Non-buggy compilers preserve this; assert the correct value. */
+        g_assert(cpu == current_cpu);
+
+#ifndef CONFIG_SOFTMMU
+        clear_helper_retaddr();
+        if (have_mmap_lock()) {
+            mmap_unlock();
+        }
+#endif
+        if (qemu_mutex_iothread_locked()) {
+            qemu_mutex_unlock_iothread();
+        }
+        qemu_plugin_disable_mem_helpers(cpu);
+
+        assert_no_pages_locked();
+    }
+
+    return cpu_exec_loop(cpu, sc);
+}
+
+int cpu_exec(CPUState *cpu)
+{
+    int ret;
+    SyncClocks sc = { 0 };
+
+    /* replay_interrupt may need current_cpu */
+    current_cpu = cpu;
+
+    if (cpu_handle_halt(cpu)) {
+        return EXCP_HALTED;
+    }
+
+    rcu_read_lock();
+    cpu_exec_enter(cpu);
+
+    /*
+     * Calculate difference between guest clock and host clock.
+     * This delay includes the delay of the last cycle, so
+     * what we have to do is sleep until it is 0. As for the
+     * advance/delay we gain here, we try to fix it next time.
+     */
+    init_delay_params(&sc, cpu);
+
+    ret = cpu_exec_setjmp(cpu, &sc);
 
     cpu_exec_exit(cpu);
     rcu_read_unlock();
-- 
2.34.1



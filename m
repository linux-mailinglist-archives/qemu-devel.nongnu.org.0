Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCF466D1D6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 23:37:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHY6E-0000gy-Kk; Mon, 16 Jan 2023 17:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHY64-0000a8-Cb
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:36:59 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHY62-0001Mr-0y
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:36:55 -0500
Received: by mail-pj1-x1034.google.com with SMTP id o13so26963573pjg.2
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 14:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0l2tmn7cqPSHygkIlv8PBR3kE2IV45gjKZ9i2g3E1kk=;
 b=G9yOxsLGKG4hd4ZroJ9tV/vKLiM1AxaTdxUobDNumRGFf3ujeidAfb0McXLJNxdw6F
 ajcLejxsnayTe7/CmUyALsJ/Bg5cHH159P/CMrnvb0ILvw99+RG0vBQ/mudGXFhNEGAZ
 V9ATeSDclmU1ZS2ADCwjaVAQGDVxPCj/N61KtvMxh9ZtOt1ct1/U8jIwxVETRUskt/+6
 gpj+fyEK4WpOrN6f4uh90wUtrNUYaShBW49aDOgQlWUOf0U9h4zNY0DKMi2aO7OICCQl
 IL+K5CpeaUqKIAg0fPyzDLWjzsLktt40Ew4JAk982Vsd/KgSsAgciDTrm6lyH3X1c2vJ
 7yHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0l2tmn7cqPSHygkIlv8PBR3kE2IV45gjKZ9i2g3E1kk=;
 b=ULyQoD9/5UYCollGGtYXyGFrvvPuh1u1tolONXSiLO/1J6TYZimN/z1Nyx3kYUu7sA
 /VlYPT0MBaCfFtCpJj7q/SB+2t9B+0xCTgjEPe7tvirGHrskHUGSZ9KWH8rNtZKTmJyG
 56zbn4hvzBhU45j6mtowgGqlSuk1bybWtpWW0m3zT+l951ONddUQHTFHj/NKAQiaXTlz
 Rfiu/rXt6Qfo5lKifeyjzSLh7+663HsDkVzJt0ZCNmnCbisN+oi0m6gbZ/TYETBh9N07
 aZufA6AlYbgzLLnKag0P5l1Fl5plJu0R/3HPjWPaNgGySRTLCBQLFlaGdjVlJRavQGEi
 6YQQ==
X-Gm-Message-State: AFqh2kpP5U7ruFTxxUtlh9u1C787FK7aN+Di4Vs5dYWKRjGn6MRZ/+lz
 gAvqP2IdJl+g2VYWEoX2ix6zCQNJjPtmJgVu
X-Google-Smtp-Source: AMrXdXtwsQZI98e+ViFxTE+LpI5BtcEkuYtclVEzRJwqpyTLvSBaxH0JByL0uSpvvJZp/5ckNNv4mQ==
X-Received: by 2002:a17:902:968f:b0:194:79b1:ea27 with SMTP id
 n15-20020a170902968f00b0019479b1ea27mr1113546plp.50.1673908608682; 
 Mon, 16 Jan 2023 14:36:48 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a170903110300b00189f2fdbdd0sm19742492plh.234.2023.01.16.14.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 14:36:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 5/5] accel/tcg: Split out cpu_exec_{setjmp,loop}
Date: Mon, 16 Jan 2023 12:36:37 -1000
Message-Id: <20230116223637.3512814-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230116223637.3512814-1-richard.henderson@linaro.org>
References: <20230116223637.3512814-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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



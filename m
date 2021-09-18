Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150E041082B
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 20:51:57 +0200 (CEST)
Received: from localhost ([::1]:48468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfRM-00058e-4Y
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 14:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLE-0004yZ-H3
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:37 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:36412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLA-0006hM-To
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:35 -0400
Received: by mail-pg1-x52f.google.com with SMTP id t1so13124247pgv.3
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=00YKLAZKgTNNfjhBetZk/EbYoBmFV300gqUFQ/RO0uM=;
 b=xigLHquHLCUG78JHrVvVwD9zo791ZGsW4L99y+/cSFetdnuCZ/iCCD96u0XYhr18zX
 7OcJD+M+IEo8o1WVdOzE/JXBcjkSaN4Vwrn3ovixq6IVjc9WhLCdAGI1bD4dnciWRfL9
 sLrGv87NlDN48Cb4xtPFOv5Y8xThhoeW0Eg0tiXNI13UBWO54xwe30yZ7lgQbbnwQSt0
 5E2RAwmT+t3TlwAJ2bkopVSVcTfQK7lZaToqfU0P7qL9L+foUMUQWH6C6G2fHMdKTDks
 hYu5OhnEm0RFZyMtv4pKef6+8go1SeMQ+og6VLuDGtqyfVQDCsZGwkHcAVYvCxv48Tlf
 ffYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=00YKLAZKgTNNfjhBetZk/EbYoBmFV300gqUFQ/RO0uM=;
 b=Ex/RhvuVoCc3NVsLUfMXKSBz0r/knw47XZQnasjcmuNfUKl/Cg+QKb9+1z3JqOocJq
 O0L+88Cy43e68I+10KLF1gUZ5itElY6SMce003MGmmPI1jpIcpjcYMbQDgDUDujzoezs
 tsp9YVaYe7s6/ohFhH5gwgvJ6tM9UKZiS36Xfp32+u0dftcmHA5wHrOl4jXRPr7dGco5
 ecmspIVTiRcsFdvom/Np73qoius9paGrs0Buw+xtbqfAwFmUGw0Rl04QNGxmzd9UVa6a
 59ZBAtwjOwmQNxwfAWtof61rpyrlRXDkr5hKomtOvGhfgQPTJdTbIMZ1zLXyD3E1U/JB
 lJYQ==
X-Gm-Message-State: AOAM532SV8nULHMFFjj5WyXWK79DTvdX928qc1XxssNoMcXEXZWHmKW2
 kx+erHPXsvYwgAWEmh2S7j1UgOOV+HB4mA==
X-Google-Smtp-Source: ABdhPJz6Vn0GbqgEVydRiE+kSOnsZj/mI4aFuJpZ2hpOS/Q84psStRkIF0WaDynHsuBC7VSc1WVetw==
X-Received: by 2002:a65:6187:: with SMTP id c7mr15986844pgv.317.1631990731111; 
 Sat, 18 Sep 2021 11:45:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/41] accel/tcg: Move clear_helper_retaddr to cpu loop
Date: Sat, 18 Sep 2021 11:44:48 -0700
Message-Id: <20210918184527.408540-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently there are only two places that require we reset this
value before exiting to the main loop, but that will change.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c  | 3 ++-
 accel/tcg/user-exec.c | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5fd1ed3422..410588d08a 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -451,6 +451,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
          * memory.
          */
 #ifndef CONFIG_SOFTMMU
+        clear_helper_retaddr();
         tcg_debug_assert(!have_mmap_lock());
 #endif
         if (qemu_mutex_iothread_locked()) {
@@ -460,7 +461,6 @@ void cpu_exec_step_atomic(CPUState *cpu)
         qemu_plugin_disable_mem_helpers(cpu);
     }
 
-
     /*
      * As we start the exclusive region before codegen we must still
      * be in the region if we longjump out of either the codegen or
@@ -905,6 +905,7 @@ int cpu_exec(CPUState *cpu)
 #endif
 
 #ifndef CONFIG_SOFTMMU
+        clear_helper_retaddr();
         tcg_debug_assert(!have_mmap_lock());
 #endif
         if (qemu_mutex_iothread_locked()) {
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index cef025d001..e94f1fed00 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -175,7 +175,6 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
              * currently executing TB was modified and must be exited
              * immediately.  Clear helper_retaddr for next execution.
              */
-            clear_helper_retaddr();
             cpu_exit_tb_from_sighandler(cpu, old_set);
             /* NORETURN */
 
@@ -193,7 +192,6 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
      * an exception.  Undo signal and retaddr state prior to longjmp.
      */
     sigprocmask(SIG_SETMASK, old_set, NULL);
-    clear_helper_retaddr();
 
     cc = CPU_GET_CLASS(cpu);
     cc->tcg_ops->tlb_fill(cpu, address, 0, access_type,
-- 
2.25.1



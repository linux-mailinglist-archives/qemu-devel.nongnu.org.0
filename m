Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B85F32FDA6
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:52:22 +0100 (CET)
Received: from localhost ([::1]:46750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIeqT-0004i0-88
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebL-0007K3-EL
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:43 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:54694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebJ-0002zi-5b
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:43 -0500
Received: by mail-pj1-x102b.google.com with SMTP id i14so1070166pjz.4
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FzqLG8FOHugoVvrax7hFMNpk20UpCIg7eemW+Zivuj0=;
 b=Kqa6RfqK4ZV2teoIhFvak6Dho2hyRnLYR1GA8izFG0pVsFV909wB9xfz+zjf6MJ0e9
 N0N+UDF12t0zx+KG9pXLt7VxWf6T6B0a575T6J5yL5IRHZrZtzL3YMhlnZqYEmC/Mdc0
 7+BWbnuE2D0ahebvB2TktMDlz51WzFKTXIEZ2bbxUw5h7dl2bzNmVajXp2I1R63DFeDW
 /f4ItSPPj1iQW0YOs3VCcR0aRcE6GDMHM3PwSKtYCRbDeItDxigLMRAk7SaU36Hg4b68
 449z+afjRU7nWamTvHhf/I03w5CUChihXXHfIzEnGtgrXK4XKg6UzKiKG75agn34MNNb
 YFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FzqLG8FOHugoVvrax7hFMNpk20UpCIg7eemW+Zivuj0=;
 b=hFJLRB92C0Wi3KzrnirpAfy4oBe/KR6wyfPVElc5aMxdm9ivtKl07FR6QW/V1jF4sv
 zqxhWn0qTeNDTGrsSbz+KXxxmEH8+nX0V7TN+pPjT4x5/ZENBhTOnPVO9oaNAOmJDpoM
 NirtJjcLS/RRZIgrdB7rHB/9OlUcQThgqT/FLGpCCFlhCJRK3A1xY6qOnNag0USmWbBT
 x6+j3uG3R/DsaHkZSckGCBrxujsNDOstxMYwsoyQF8fMK3YvMOILhgmabVncP0SMF0ET
 1BrhVuvwZqCmW/hBcHSYdFmIWMdCTWVoXivNp38EDLfyTcfgkKHVMmqIwBOxM8WFNuc/
 nTxg==
X-Gm-Message-State: AOAM530iwuyFYQx/x0tPNFxcfkSi1raF08KojrCPg6Y5lQuUWODfEQN5
 VcJ/jF/sa+uthfzP5pYISv6PcS7ve2MY6Q==
X-Google-Smtp-Source: ABdhPJzpSwsOZHMTqCPnk+WwoEw+pzrK+I/K/Ph3qDu6fGEuu2bq5Ul/lMSW5IQQck8/fOyDTCiqLw==
X-Received: by 2002:a17:90a:e642:: with SMTP id
 ep2mr3096494pjb.62.1615066599856; 
 Sat, 06 Mar 2021 13:36:39 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/27] accel/tcg: move CF_CLUSTER calculation to curr_cflags
Date: Sat,  6 Mar 2021 13:36:10 -0800
Message-Id: <20210306213613.85168-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

There is nothing special about this compile flag that doesn't mean we
can't just compute it with curr_cflags() which we should be using when
building a new set.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210224165811.11567-3-alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h   | 8 +++++---
 include/exec/tb-lookup.h  | 3 ---
 accel/tcg/cpu-exec.c      | 9 ++++-----
 accel/tcg/tcg-runtime.c   | 2 +-
 accel/tcg/translate-all.c | 6 +++---
 softmmu/physmem.c         | 2 +-
 6 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index b7b3c0ef12..1a69c07add 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -519,10 +519,12 @@ static inline uint32_t tb_cflags(const TranslationBlock *tb)
 }
 
 /* current cflags for hashing/comparison */
-static inline uint32_t curr_cflags(void)
+static inline uint32_t curr_cflags(CPUState *cpu)
 {
-    return (parallel_cpus ? CF_PARALLEL : 0)
-         | (icount_enabled() ? CF_USE_ICOUNT : 0);
+    uint32_t cflags = deposit32(0, CF_CLUSTER_SHIFT, 8, cpu->cluster_index);
+    cflags |= parallel_cpus ? CF_PARALLEL : 0;
+    cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
+    return cflags;
 }
 
 /* TranslationBlock invalidate API */
diff --git a/include/exec/tb-lookup.h b/include/exec/tb-lookup.h
index c3f5d81c55..1c92fe0521 100644
--- a/include/exec/tb-lookup.h
+++ b/include/exec/tb-lookup.h
@@ -27,9 +27,6 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     hash = tb_jmp_cache_hash_func(pc);
     tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
 
-    cf_mask &= ~CF_CLUSTER_MASK;
-    cf_mask |= cpu->cluster_index << CF_CLUSTER_SHIFT;
-
     if (likely(tb &&
                tb->pc == pc &&
                tb->cs_base == cs_base &&
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index ef96b312a1..45286dc4b3 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -249,8 +249,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
     TranslationBlock *tb;
     target_ulong cs_base, pc;
     uint32_t flags;
-    uint32_t cflags = 1;
-    uint32_t cf_mask = cflags & CF_HASH_MASK;
+    uint32_t cflags = (curr_cflags(cpu) & ~CF_PARALLEL) | 1;
     int tb_exit;
 
     if (sigsetjmp(cpu->jmp_env, 0) == 0) {
@@ -260,7 +259,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
         cpu->running = true;
 
         cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
-        tb = tb_lookup(cpu, pc, cs_base, flags, cf_mask);
+        tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
 
         if (tb == NULL) {
             mmap_lock();
@@ -497,7 +496,7 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
         if (replay_has_exception()
             && cpu_neg(cpu)->icount_decr.u16.low + cpu->icount_extra == 0) {
             /* Execute just one insn to trigger exception pending in the log */
-            cpu->cflags_next_tb = (curr_cflags() & ~CF_USE_ICOUNT) | 1;
+            cpu->cflags_next_tb = (curr_cflags(cpu) & ~CF_USE_ICOUNT) | 1;
         }
 #endif
         return false;
@@ -794,7 +793,7 @@ int cpu_exec(CPUState *cpu)
                have CF_INVALID set, -1 is a convenient invalid value that
                does not require tcg headers for cpu_common_reset.  */
             if (cflags == -1) {
-                cflags = curr_cflags();
+                cflags = curr_cflags(cpu);
             } else {
                 cpu->cflags_next_tb = -1;
             }
diff --git a/accel/tcg/tcg-runtime.c b/accel/tcg/tcg-runtime.c
index 05e3d52c2f..99403e3eb3 100644
--- a/accel/tcg/tcg-runtime.c
+++ b/accel/tcg/tcg-runtime.c
@@ -154,7 +154,7 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
 
     cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
 
-    tb = tb_lookup(cpu, pc, cs_base, flags, curr_cflags());
+    tb = tb_lookup(cpu, pc, cs_base, flags, curr_cflags(cpu));
     if (tb == NULL) {
         return tcg_code_gen_epilogue;
     }
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index bbd919a393..f29b47f090 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2194,7 +2194,7 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
     if (current_tb_modified) {
         page_collection_unlock(pages);
         /* Force execution of one insn next time.  */
-        cpu->cflags_next_tb = 1 | curr_cflags();
+        cpu->cflags_next_tb = 1 | curr_cflags(cpu);
         mmap_unlock();
         cpu_loop_exit_noexc(cpu);
     }
@@ -2362,7 +2362,7 @@ static bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc)
 #ifdef TARGET_HAS_PRECISE_SMC
     if (current_tb_modified) {
         /* Force execution of one insn next time.  */
-        cpu->cflags_next_tb = 1 | curr_cflags();
+        cpu->cflags_next_tb = 1 | curr_cflags(cpu);
         return true;
     }
 #endif
@@ -2438,7 +2438,7 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
      * operations only (which execute after completion) so we don't
      * double instrument the instruction.
      */
-    cpu->cflags_next_tb = curr_cflags() | CF_MEMI_ONLY | CF_LAST_IO | n;
+    cpu->cflags_next_tb = curr_cflags(cpu) | CF_MEMI_ONLY | CF_LAST_IO | n;
 
     qemu_log_mask_and_addr(CPU_LOG_EXEC, tb->pc,
                            "cpu_io_recompile: rewound execution of TB to "
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 19e0aa9836..7e8b0fab89 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -937,7 +937,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                     cpu_loop_exit_restore(cpu, ra);
                 } else {
                     /* Force execution of one insn next time.  */
-                    cpu->cflags_next_tb = 1 | curr_cflags();
+                    cpu->cflags_next_tb = 1 | curr_cflags(cpu);
                     mmap_unlock();
                     if (ra) {
                         cpu_restore_state(cpu, ra, true);
-- 
2.25.1



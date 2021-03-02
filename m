Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A7432A902
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:11:33 +0100 (CET)
Received: from localhost ([::1]:42470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9Ua-0005vc-FE
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9Hi-0003Hq-NJ
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:14 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9Hd-0007cv-Rg
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:12 -0500
Received: by mail-pf1-x436.google.com with SMTP id 192so7314348pfv.0
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=acclXejcPgSIlezM5omUXEx8bJfnemtIS24m5TCaM+g=;
 b=qx5nSJKXwokyv1pqk6JShVsDwgOsTLloclZQmJjWPqCdHP6uFz/UOqgemfqwsa+HRs
 EMJwiFNZrYh2MHxFSYB3j7pMomajeG2hVEsreXTpq+dSxo5bQJJ6Dd7hXZTY9daSaxwk
 mkso0WL/uHE/yZ78wgvpWSOxtp+IV82pmX2/1e5iEyLBVhWs6tB0LoKmQc+gRg8uOLJ/
 YiKDMFoIj5xlxazKucy0okPYcO8NtFIXTIHWWxSZNlO+GmNL1fv34QkMqU47BpR8msLE
 gOjR0cJG8B948yH66foXkFCxtx6ki4htDS28bLyi999ZQyhwNU6Miy3SuZpqafIaTlDr
 wcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=acclXejcPgSIlezM5omUXEx8bJfnemtIS24m5TCaM+g=;
 b=Uc/aHY5Hg34XuS24+RlAxVuL4yE7dIfVmd7j2OFTT+3srBWuoo2hLH3SwxlfAVja8D
 EfIiX86fdNps+pcnQOaIRSObM+lvltzZSNUGR6wQBFohEZbRgW8peXLeku4CBw0EYeYU
 i2FatW4REBGsYRpFmcebRTpc+OxLFIy7/FPdblk7XunaFhkMq9Xo+LL6eiUkQR+2QvsF
 acH54uWOVJ1tBqjhxgqWNBOCqjovvnTI/7ZrVcdt6quG/RWnm7oqvZVdN8VbwH0Mmt5e
 hZjjF/ZL/9BtMUWbcQ4OmeNqWcWr2sFKvm4AFtvKtL8QWVn8qG+Bhzr68xDiSsedCX2k
 O35g==
X-Gm-Message-State: AOAM5309oXejACSQlucYiMA3bJ3yRn9Bz44MGutLAYW0FxZXpG52vCR+
 TmXMVBq3dHs5YUe8G7C0aYgCcy0XijnWDQ==
X-Google-Smtp-Source: ABdhPJzDWTzdHv87KGNib/IbU1aSSNTbQa6NOThRCS5wuJp7wrZGfmx3lsWkH45wEFsEscDiP9VMGA==
X-Received: by 2002:a63:fd0a:: with SMTP id d10mr18615719pgh.405.1614707888602; 
 Tue, 02 Mar 2021 09:58:08 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:58:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/27] accel/tcg: move CF_CLUSTER calculation to curr_cflags
Date: Tue,  2 Mar 2021 09:57:38 -0800
Message-Id: <20210302175741.1079851-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: alex.bennee@linaro.org
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
index 62a509535d..b2247d458b 100644
--- a/include/exec/tb-lookup.h
+++ b/include/exec/tb-lookup.h
@@ -27,9 +27,6 @@ static inline TranslationBlock * tb_lookup(CPUState *cpu,
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



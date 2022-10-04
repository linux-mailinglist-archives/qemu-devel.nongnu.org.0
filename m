Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE735F4A4A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 22:27:44 +0200 (CEST)
Received: from localhost ([::1]:50882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofoVz-0006vV-2U
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 16:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyT-0002CF-HL
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:53:05 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyR-0000Is-4O
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:53:05 -0400
Received: by mail-pl1-x630.google.com with SMTP id z20so7029625plb.10
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 12:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=GMseGoEdHDZJo9qfpjf4QS3EDnkmn8Necr0EbekFMeI=;
 b=NoMJ2No5sV2obLb+6Q1NhcIFmxNiVAv1shh/ao5lVROGp+UvtfJQqMgpFe/aq7zrVc
 LAB3DwflpNwK6nLjtzrx9ZXAgxXbFfCX+iveUnhAjgmB/56UAV6PLgxtKNE2ppbIPoWX
 JtHQ0UNsq0xvBgLCeRUF1WZLfYYv+aXeY97gBtYZgr9T59Zv/CH8HKflz25PHo9nB9wE
 7D8b7VNnXCA0asWRmjQGa0oE3fpr5ai/a9FtBvR6RuGJ9fxDA4kylf2ukWKD5GQxFL58
 jydwzzoUtgy9o+CVa6aWSW3nLWqyi9nXiEZ2zX/Rv+P05AltD4G1eOjyCDCBxa/M347O
 UmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=GMseGoEdHDZJo9qfpjf4QS3EDnkmn8Necr0EbekFMeI=;
 b=cxVN8zLcyCoHWwUSrrY9fsw4s4WJemn0BxJ6Y5X/+CSQN2yQ5utxcVHKeLDkSqvT/U
 CgGaHaop4/yhhF93rUMXxAgRnvJzrkBsRb1U8Bfbp70xZUFKRjSIKlGz3dwpfqFSDujS
 dA9XZxpEm80wxc9zxdDJduRiC/sfjcMn4N8iHVMFyHTCiSskSGOFdbzSRPpVubumZRNR
 0bAZ74nhsoqL0koOA6SdrhoH0eHxWGhyTzz76LypAM5BOeyo3ccxOq9YMLp2TIbjUdf6
 C+9MxD1R0nLGeL1149zxef06DlLcQQtVSGC/tFAh7qtbmqi5ekyT68JhFn79E2FmQzG5
 FuqA==
X-Gm-Message-State: ACrzQf2ABTqjBj10TCfqfRXb8cG4r9u3JucuBnr6aVuUDlVlxA4DFKLB
 a7y69paNsQOTqeZKdgTNA2Tk50tLtLBAZQ==
X-Google-Smtp-Source: AMsMyM53Cv3usJCTVSB59++tyfpjk/6Cgwt4uKkv1dlsyoEUKQ+3hipVdu7AxGPUHKF9HPDW1Hnjdg==
X-Received: by 2002:a17:90b:1801:b0:202:7cf6:9f93 with SMTP id
 lw1-20020a17090b180100b002027cf69f93mr1289953pjb.170.1664913181461; 
 Tue, 04 Oct 2022 12:53:01 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:526e:3326:a84e:e5e3])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a1709026e1700b00172973d3cd9sm9293406plk.55.2022.10.04.12.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 12:53:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 18/20] accel/tcg: Introduce TARGET_TB_PCREL
Date: Tue,  4 Oct 2022 12:52:39 -0700
Message-Id: <20221004195241.46491-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004195241.46491-1-richard.henderson@linaro.org>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prepare for targets to be able to produce TBs that can
run in more than one virtual context.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h      |  4 +++
 accel/tcg/tb-jmp-cache.h  | 41 +++++++++++++++++++++++++
 include/exec/cpu-defs.h   |  3 ++
 include/exec/exec-all.h   | 32 ++++++++++++++++++--
 accel/tcg/cpu-exec.c      | 16 ++++++----
 accel/tcg/translate-all.c | 64 ++++++++++++++++++++++++++-------------
 6 files changed, 131 insertions(+), 29 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index a3875a3b5a..dc800fd485 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -21,7 +21,11 @@ void tb_htable_init(void);
 /* Return the current PC from CPU, which may be cached in TB. */
 static inline target_ulong log_pc(CPUState *cpu, const TranslationBlock *tb)
 {
+#if TARGET_TB_PCREL
+    return cpu->cc->get_pc(cpu);
+#else
     return tb_pc(tb);
+#endif
 }
 
 #endif /* ACCEL_TCG_INTERNAL_H */
diff --git a/accel/tcg/tb-jmp-cache.h b/accel/tcg/tb-jmp-cache.h
index 2d8fbb1bfe..ff5ffc8fc2 100644
--- a/accel/tcg/tb-jmp-cache.h
+++ b/accel/tcg/tb-jmp-cache.h
@@ -14,11 +14,52 @@
 
 /*
  * Accessed in parallel; all accesses to 'tb' must be atomic.
+ * For TARGET_TB_PCREL, accesses to 'pc' must be protected by
+ * a load_acquire/store_release to 'tb'.
  */
 struct CPUJumpCache {
     struct {
         TranslationBlock *tb;
+#if TARGET_TB_PCREL
+        target_ulong pc;
+#endif
     } array[TB_JMP_CACHE_SIZE];
 };
 
+static inline TranslationBlock *
+tb_jmp_cache_get_tb(CPUJumpCache *jc, uint32_t hash)
+{
+#if TARGET_TB_PCREL
+    /* Use acquire to ensure current load of pc from jc. */
+    return qatomic_load_acquire(&jc->array[hash].tb);
+#else
+    /* Use rcu_read to ensure current load of pc from *tb. */
+    return qatomic_rcu_read(&jc->array[hash].tb);
+#endif
+}
+
+static inline target_ulong
+tb_jmp_cache_get_pc(CPUJumpCache *jc, uint32_t hash, TranslationBlock *tb)
+{
+#if TARGET_TB_PCREL
+    return jc->array[hash].pc;
+#else
+    return tb_pc(tb);
+#endif
+}
+
+static inline void
+tb_jmp_cache_set(CPUJumpCache *jc, uint32_t hash,
+                 TranslationBlock *tb, target_ulong pc)
+{
+#if TARGET_TB_PCREL
+    jc->array[hash].pc = pc;
+    /* Use store_release on tb to ensure pc is written first. */
+    qatomic_store_release(&jc->array[hash].tb, tb);
+#else
+    /* Use the pc value already stored in tb->pc. */
+    qatomic_set(&jc->array[hash].tb, tb);
+#endif
+}
+
 #endif /* ACCEL_TCG_TB_JMP_CACHE_H */
diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 67239b4e5e..21309cf567 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -54,6 +54,9 @@
 #  error TARGET_PAGE_BITS must be defined in cpu-param.h
 # endif
 #endif
+#ifndef TARGET_TB_PCREL
+# define TARGET_TB_PCREL 0
+#endif
 
 #define TARGET_LONG_SIZE (TARGET_LONG_BITS / 8)
 
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 7ea6026ba9..e5f8b224a5 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -496,8 +496,32 @@ struct tb_tc {
 };
 
 struct TranslationBlock {
-    target_ulong pc;   /* simulated PC corresponding to this block (EIP + CS base) */
-    target_ulong cs_base; /* CS base for this block */
+#if !TARGET_TB_PCREL
+    /*
+     * Guest PC corresponding to this block.  This must be the true
+     * virtual address.  Therefore e.g. x86 stores EIP + CS_BASE, and
+     * targets like Arm, MIPS, HP-PA, which reuse low bits for ISA or
+     * privilege, must store those bits elsewhere.
+     *
+     * If TARGET_TB_PCREL, the opcodes for the TranslationBlock are
+     * written such that the TB is associated only with the physical
+     * page and may be run in any virtual address context.  In this case,
+     * PC must always be taken from ENV in a target-specific manner.
+     * Unwind information is taken as offsets from the page, to be
+     * deposited into the "current" PC.
+     */
+    target_ulong pc;
+#endif
+
+    /*
+     * Target-specific data associated with the TranslationBlock, e.g.:
+     * x86: the original user, the Code Segment virtual base,
+     * arm: an extension of tb->flags,
+     * s390x: instruction data for EXECUTE,
+     * sparc: the next pc of the instruction queue (for delay slots).
+     */
+    target_ulong cs_base;
+
     uint32_t flags; /* flags defining in which context the code was generated */
     uint32_t cflags;    /* compile flags */
 
@@ -573,7 +597,11 @@ struct TranslationBlock {
 /* Hide the read to avoid ifdefs for TARGET_TB_PCREL. */
 static inline target_ulong tb_pc(const TranslationBlock *tb)
 {
+#if TARGET_TB_PCREL
+    qemu_build_not_reached();
+#else
     return tb->pc;
+#endif
 }
 
 /* Hide the qatomic_read to make code a little easier on the eyes */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8b3f8435fb..f9e5cc9ba0 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -186,7 +186,7 @@ static bool tb_lookup_cmp(const void *p, const void *d)
     const TranslationBlock *tb = p;
     const struct tb_desc *desc = d;
 
-    if (tb_pc(tb) == desc->pc &&
+    if ((TARGET_TB_PCREL || tb_pc(tb) == desc->pc) &&
         tb->page_addr[0] == desc->page_addr0 &&
         tb->cs_base == desc->cs_base &&
         tb->flags == desc->flags &&
@@ -237,7 +237,8 @@ static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
         return NULL;
     }
     desc.page_addr0 = phys_pc;
-    h = tb_hash_func(phys_pc, pc, flags, cflags, *cpu->trace_dstate);
+    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : pc),
+                     flags, cflags, *cpu->trace_dstate);
     return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
 }
 
@@ -247,16 +248,18 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
                                           uint32_t flags, uint32_t cflags)
 {
     TranslationBlock *tb;
+    CPUJumpCache *jc;
     uint32_t hash;
 
     /* we should never be trying to look up an INVALID tb */
     tcg_debug_assert(!(cflags & CF_INVALID));
 
     hash = tb_jmp_cache_hash_func(pc);
-    tb = qatomic_rcu_read(&cpu->tb_jmp_cache->array[hash].tb);
+    jc = cpu->tb_jmp_cache;
+    tb = tb_jmp_cache_get_tb(jc, hash);
 
     if (likely(tb &&
-               tb->pc == pc &&
+               tb_jmp_cache_get_pc(jc, hash, tb) == pc &&
                tb->cs_base == cs_base &&
                tb->flags == flags &&
                tb->trace_vcpu_dstate == *cpu->trace_dstate &&
@@ -267,7 +270,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     if (tb == NULL) {
         return NULL;
     }
-    qatomic_set(&cpu->tb_jmp_cache->array[hash].tb, tb);
+    tb_jmp_cache_set(jc, hash, tb, pc);
     return tb;
 }
 
@@ -453,6 +456,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
         if (cc->tcg_ops->synchronize_from_tb) {
             cc->tcg_ops->synchronize_from_tb(cpu, last_tb);
         } else {
+            assert(!TARGET_TB_PCREL);
             assert(cc->set_pc);
             cc->set_pc(cpu, tb_pc(last_tb));
         }
@@ -1002,7 +1006,7 @@ int cpu_exec(CPUState *cpu)
                  * for the fast lookup
                  */
                 h = tb_jmp_cache_hash_func(pc);
-                qatomic_set(&cpu->tb_jmp_cache->array[h].tb, tb);
+                tb_jmp_cache_set(cpu->tb_jmp_cache, h, tb, pc);
             }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 13c964dcd8..4ed75a13e1 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -299,7 +299,7 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
 
         for (j = 0; j < TARGET_INSN_START_WORDS; ++j) {
             if (i == 0) {
-                prev = (j == 0 ? tb_pc(tb) : 0);
+                prev = (!TARGET_TB_PCREL && j == 0 ? tb_pc(tb) : 0);
             } else {
                 prev = tcg_ctx->gen_insn_data[i - 1][j];
             }
@@ -327,7 +327,7 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
 static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
                                      uintptr_t searched_pc, bool reset_icount)
 {
-    target_ulong data[TARGET_INSN_START_WORDS] = { tb_pc(tb) };
+    target_ulong data[TARGET_INSN_START_WORDS];
     uintptr_t host_pc = (uintptr_t)tb->tc.ptr;
     CPUArchState *env = cpu->env_ptr;
     const uint8_t *p = tb->tc.ptr + tb->tc.size;
@@ -343,6 +343,11 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
         return -1;
     }
 
+    memset(data, 0, sizeof(data));
+    if (!TARGET_TB_PCREL) {
+        data[0] = tb_pc(tb);
+    }
+
     /* Reconstruct the stored insn data while looking for the point at
        which the end of the insn exceeds the searched_pc.  */
     for (i = 0; i < num_insns; ++i) {
@@ -885,13 +890,13 @@ static bool tb_cmp(const void *ap, const void *bp)
     const TranslationBlock *a = ap;
     const TranslationBlock *b = bp;
 
-    return tb_pc(a) == tb_pc(b) &&
-        a->cs_base == b->cs_base &&
-        a->flags == b->flags &&
-        (tb_cflags(a) & ~CF_INVALID) == (tb_cflags(b) & ~CF_INVALID) &&
-        a->trace_vcpu_dstate == b->trace_vcpu_dstate &&
-        a->page_addr[0] == b->page_addr[0] &&
-        a->page_addr[1] == b->page_addr[1];
+    return ((TARGET_TB_PCREL || tb_pc(a) == tb_pc(b)) &&
+            a->cs_base == b->cs_base &&
+            a->flags == b->flags &&
+            (tb_cflags(a) & ~CF_INVALID) == (tb_cflags(b) & ~CF_INVALID) &&
+            a->trace_vcpu_dstate == b->trace_vcpu_dstate &&
+            a->page_addr[0] == b->page_addr[0] &&
+            a->page_addr[1] == b->page_addr[1]);
 }
 
 void tb_htable_init(void)
@@ -1148,6 +1153,28 @@ static inline void tb_jmp_unlink(TranslationBlock *dest)
     qemu_spin_unlock(&dest->jmp_lock);
 }
 
+static void tb_jmp_cache_inval_tb(TranslationBlock *tb)
+{
+    CPUState *cpu;
+
+    if (TARGET_TB_PCREL) {
+        /* A TB may be at any virtual address */
+        CPU_FOREACH(cpu) {
+            tcg_flush_jmp_cache(cpu);
+        }
+    } else {
+        uint32_t h = tb_jmp_cache_hash_func(tb_pc(tb));
+
+        CPU_FOREACH(cpu) {
+            CPUJumpCache *jc = cpu->tb_jmp_cache;
+
+            if (qatomic_read(&jc->array[h].tb) == tb) {
+                qatomic_set(&jc->array[h].tb, NULL);
+            }
+        }
+    }
+}
+
 /*
  * In user-mode, call with mmap_lock held.
  * In !user-mode, if @rm_from_page_list is set, call with the TB's pages'
@@ -1155,7 +1182,6 @@ static inline void tb_jmp_unlink(TranslationBlock *dest)
  */
 static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
 {
-    CPUState *cpu;
     PageDesc *p;
     uint32_t h;
     tb_page_addr_t phys_pc;
@@ -1170,8 +1196,8 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
 
     /* remove the TB from the hash list */
     phys_pc = tb->page_addr[0];
-    h = tb_hash_func(phys_pc, tb_pc(tb), tb->flags, orig_cflags,
-                     tb->trace_vcpu_dstate);
+    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
+                     tb->flags, orig_cflags, tb->trace_vcpu_dstate);
     if (!qht_remove(&tb_ctx.htable, tb, h)) {
         return;
     }
@@ -1187,13 +1213,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     }
 
     /* remove the TB from the hash list */
-    h = tb_jmp_cache_hash_func(tb->pc);
-    CPU_FOREACH(cpu) {
-        CPUJumpCache *jc = cpu->tb_jmp_cache;
-        if (qatomic_read(&jc->array[h].tb) == tb) {
-            qatomic_set(&jc->array[h].tb, NULL);
-        }
-    }
+    tb_jmp_cache_inval_tb(tb);
 
     /* suppress this TB from the two jump lists */
     tb_remove_from_jmp_list(tb, 0);
@@ -1302,8 +1322,8 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
     }
 
     /* add in the hash table */
-    h = tb_hash_func(phys_pc, tb_pc(tb), tb->flags, tb->cflags,
-                     tb->trace_vcpu_dstate);
+    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
+                     tb->flags, tb->cflags, tb->trace_vcpu_dstate);
     qht_insert(&tb_ctx.htable, tb, h, &existing_tb);
 
     /* remove TB from the page(s) if we couldn't insert it */
@@ -1373,7 +1393,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
     gen_code_buf = tcg_ctx->code_gen_ptr;
     tb->tc.ptr = tcg_splitwx_to_rx(gen_code_buf);
+#if !TARGET_TB_PCREL
     tb->pc = pc;
+#endif
     tb->cs_base = cs_base;
     tb->flags = flags;
     tb->cflags = cflags;
-- 
2.34.1



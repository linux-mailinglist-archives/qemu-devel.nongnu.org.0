Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749A15F4662
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 17:17:41 +0200 (CEST)
Received: from localhost ([::1]:40926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofjfv-0006sP-WE
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 11:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidu-00032e-R4
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:11:32 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:44747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofids-0004UU-JS
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:11:30 -0400
Received: by mail-pg1-x535.google.com with SMTP id c7so12802650pgt.11
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 07:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jHJX34zJZX/Pv3hBhYlE8D20rsIHjPR114FAfSPu0d0=;
 b=AqaXJz5PZ5VerQjgWSfcSDA3SLUUUwdT6qbyPcao3/5TiAL6WwExf9I0HwUXqCB5qK
 eY+7fZ55fgOJDfEwRFRW51Uc9xLIXj5mqr9rda1f6qdATd/oLkbYBBw88r78gpzw2iiO
 1mO5Y33hJw1IpFN6KPoi4NCw6/9CuKAyzWVBm8ZGqPvBaEwEgJWNHtNGlyMDDBysonnA
 fVgOcC59kOOn+lBsui26gIR6PCOFW2CKxB2mkkkLrxsHq2xlnkXZtSYQ6k01TwmxDMB7
 70WMh59B5hRg1KlCztNF9DtlzFnIk+r/A9y5Rz6z6DinksQYSGnZl+3Kk02g8WqJzAb3
 +acA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jHJX34zJZX/Pv3hBhYlE8D20rsIHjPR114FAfSPu0d0=;
 b=HitZ0jLMuZBdreVm76ZREC6QrDLZuL5tNhXKJoNZDd6KBnWwPV9S2kATExfA59kZu0
 DT4Sa3MPq69ORXgpvxhU+zAC7YM/76GniYCMX54vCHWaEfplTNMmjwJQz0XGrMksj7nN
 AAePRLKR5x2/bIYsR/3DHjdD3DG3/biB4j5W+7QZWwG59No0Qfveu8sba/OXcnk0sGpB
 FJKP9goao3EEEuiJcd+9Lwh2Hud95LRyP2s/3dYmR1A5ZihEYbkwgBhas2XRQNV85bKN
 KIkRI+U6AR9wPAvPaINaFp8oUdg5Ms4pP5kEavAAAHe4OlIiqIQN/a5M3BznI5Fepm3m
 zGKQ==
X-Gm-Message-State: ACrzQf1QetLKsvaBN5wiwEyFaVgnzzzu7ZmFD2+LYoV5Oa+iWtFn/BJ0
 Vo9XynXtNajkpTM10zfwidT7Jj8Vpg3RlQ==
X-Google-Smtp-Source: AMsMyM6Qk7+y84o+A3R9TTo4Pm2k0P+bYGHpBN+IpPivNUPTXMmDRuSXAjIP41K2e3/IJHsAY+mG4w==
X-Received: by 2002:a63:f07:0:b0:440:5c6e:5833 with SMTP id
 e7-20020a630f07000000b004405c6e5833mr21715164pgl.375.1664892686981; 
 Tue, 04 Oct 2022 07:11:26 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8015:12b0:403e:a15b:ff5e:d439])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa79ae5000000b00561382a5a25sm1240357pfp.26.2022.10.04.07.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 07:11:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v7 18/18] accel/tcg: Introduce TARGET_TB_PCREL
Date: Tue,  4 Oct 2022 07:10:51 -0700
Message-Id: <20221004141051.110653-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004141051.110653-1-richard.henderson@linaro.org>
References: <20221004141051.110653-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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



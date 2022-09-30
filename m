Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486525F1524
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 23:44:40 +0200 (CEST)
Received: from localhost ([::1]:33832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeNoF-0006Bi-C0
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 17:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNXL-0007hd-F6
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:27:11 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:33337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNXJ-0005TS-8w
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:27:11 -0400
Received: by mail-qt1-x833.google.com with SMTP id ay9so3474573qtb.0
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 14:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OXc7bZw1hWKlaxP04cgipk+ATzDDKbqBNu4egdi0b9s=;
 b=V51o3EHD7g64T9rHfR+NDTE1yEyG7m1p1IxcSCRTNBaukht7ImTFi28B2/VZkXN3uJ
 aAD/K34CrF9XqaEZIZDscqeqh88GMLo68MPtNehJVD3zE9q6GmhQSnAJykkvQ0XiWLLv
 yWMrECqhglfQrNSHkrbkKuqXS/UsU7lwbdSnMPRCxJUZPr5Ns+L0xSDPS3DqNkFBGrmQ
 c7yRnhm+dDa6u9uHdaTNa5nWGAFhkvJAABc8X5uXMcaK3Q1rhO/jmt1sTAGTLQ3zfo2Q
 UAxkUEcIi7pShv82TDqAwVvseEm+AWZ32fomPxWOX5/2lc//tnnhybNCQw0tMgjtvabJ
 8Qsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OXc7bZw1hWKlaxP04cgipk+ATzDDKbqBNu4egdi0b9s=;
 b=BEqfo8KyE1FMGuhR0JDgiIKYzHeuEQKH3xetozc21EuIIyznLFcrznBOnxQb4ubdPw
 YQhy3g0KtMfSB0QuZoLrm1nm56G6kyW1Pjjo1rmP5Bh/HxuYk9goHrr2CV4GhxL4SPbJ
 hkp3n4sbnMn2RpUpQm+7Uzbt6dPw5wRtFDrEvrdFNFdAr/GRCFxWmNp6hIo8gL3gMQWB
 w8psbMFwxIj3L2BquJ4T9jwA7ixyPG7DMYBtTyQTiv0n+P6IhqocmEAfoaTkBAEJk4Ir
 cOSakutDSWGYv0vVpnAHrSe988gCuJnNbKtc/1wGF2avCRJIlDLrFMvORoN0hwWI+YRF
 U8yg==
X-Gm-Message-State: ACrzQf34QJC1p0kwnEM8420xlevHYDE3dhB7VJNNX8U4PiIExTL59B15
 LZzp1Ab0zg1PPWwtvv0kTsgmaW0BCfR6mA==
X-Google-Smtp-Source: AMsMyM6dr2O2NALZcnqe10WxqqqzSYtD7XVPr5ex/TXfAYMsyLhRuP/5m0gze9FoLebse6P/md+VvA==
X-Received: by 2002:ac8:5c0b:0:b0:35c:e066:998d with SMTP id
 i11-20020ac85c0b000000b0035ce066998dmr8464723qti.336.1664573228071; 
 Fri, 30 Sep 2022 14:27:08 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05620a28d200b006ce813bb306sm3696370qkp.125.2022.09.30.14.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 14:27:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linux.org,
	alex.bennee@linux.org
Subject: [PATCH v6 18/18] accel/tcg: Introduce TARGET_TB_PCREL
Date: Fri, 30 Sep 2022 14:26:22 -0700
Message-Id: <20220930212622.108363-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930212622.108363-1-richard.henderson@linaro.org>
References: <20220930212622.108363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
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
 accel/tcg/tb-jmp-cache.h  |  5 ++++
 include/exec/cpu-defs.h   |  3 +++
 include/exec/exec-all.h   | 32 ++++++++++++++++++++--
 accel/tcg/cpu-exec.c      | 56 +++++++++++++++++++++++++++++++--------
 accel/tcg/translate-all.c | 50 +++++++++++++++++++++-------------
 6 files changed, 119 insertions(+), 31 deletions(-)

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
index 2d8fbb1bfe..a7288150bc 100644
--- a/accel/tcg/tb-jmp-cache.h
+++ b/accel/tcg/tb-jmp-cache.h
@@ -14,10 +14,15 @@
 
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
index 8b3f8435fb..acb5646b03 100644
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
 
@@ -247,27 +248,52 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
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
+#if TARGET_TB_PCREL
+    /* Use acquire to ensure current load of pc from jc. */
+    tb = qatomic_load_acquire(&jc->array[hash].tb);
+#else
+    /* Use rcu_read to ensure current load of pc from *tb. */
+    tb = qatomic_rcu_read(&jc->array[hash].tb);
+#endif
 
-    if (likely(tb &&
-               tb->pc == pc &&
-               tb->cs_base == cs_base &&
-               tb->flags == flags &&
-               tb->trace_vcpu_dstate == *cpu->trace_dstate &&
-               tb_cflags(tb) == cflags)) {
-        return tb;
+    if (likely(tb)) {
+        target_ulong jmp_pc;
+
+#if TARGET_TB_PCREL
+        jmp_pc = jc->array[hash].pc;
+#else
+        jmp_pc = tb_pc(tb);
+#endif
+        if (jmp_pc == pc &&
+            tb->cs_base == cs_base &&
+            tb->flags == flags &&
+            tb->trace_vcpu_dstate == *cpu->trace_dstate &&
+            tb_cflags(tb) == cflags) {
+            return tb;
+        }
     }
+
     tb = tb_htable_lookup(cpu, pc, cs_base, flags, cflags);
     if (tb == NULL) {
         return NULL;
     }
-    qatomic_set(&cpu->tb_jmp_cache->array[hash].tb, tb);
+
+#if TARGET_TB_PCREL
+    jc->array[hash].pc = pc;
+    /* Use store_release on tb to ensure pc is written first. */
+    qatomic_store_release(&jc->array[hash].tb, tb);
+#else
+    qatomic_set(&jc->array[hash].tb, tb);
+#endif
+
     return tb;
 }
 
@@ -453,6 +479,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
         if (cc->tcg_ops->synchronize_from_tb) {
             cc->tcg_ops->synchronize_from_tb(cpu, last_tb);
         } else {
+            assert(!TARGET_TB_PCREL);
             assert(cc->set_pc);
             cc->set_pc(cpu, tb_pc(last_tb));
         }
@@ -1002,7 +1029,14 @@ int cpu_exec(CPUState *cpu)
                  * for the fast lookup
                  */
                 h = tb_jmp_cache_hash_func(pc);
+
+#if TARGET_TB_PCREL
+                cpu->tb_jmp_cache->array[h].pc = pc;
+                /* Use store_release on tb to ensure pc is current. */
+                qatomic_store_release(&cpu->tb_jmp_cache->array[h].tb, tb);
+#else
                 qatomic_set(&cpu->tb_jmp_cache->array[h].tb, tb);
+#endif
             }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 13c964dcd8..776ac9efe4 100644
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
@@ -1170,8 +1175,8 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
 
     /* remove the TB from the hash list */
     phys_pc = tb->page_addr[0];
-    h = tb_hash_func(phys_pc, tb_pc(tb), tb->flags, orig_cflags,
-                     tb->trace_vcpu_dstate);
+    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
+                     tb->flags, orig_cflags, tb->trace_vcpu_dstate);
     if (!qht_remove(&tb_ctx.htable, tb, h)) {
         return;
     }
@@ -1187,11 +1192,18 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     }
 
     /* remove the TB from the hash list */
-    h = tb_jmp_cache_hash_func(tb->pc);
-    CPU_FOREACH(cpu) {
-        CPUJumpCache *jc = cpu->tb_jmp_cache;
-        if (qatomic_read(&jc->array[h].tb) == tb) {
-            qatomic_set(&jc->array[h].tb, NULL);
+    if (TARGET_TB_PCREL) {
+        /* A TB may be at any virtual address */
+        CPU_FOREACH(cpu) {
+            tcg_flush_jmp_cache(cpu);
+        }
+    } else {
+        h = tb_jmp_cache_hash_func(tb_pc(tb));
+        CPU_FOREACH(cpu) {
+            CPUJumpCache *jc = cpu->tb_jmp_cache;
+            if (qatomic_read(&jc->array[h].tb) == tb) {
+                qatomic_set(&jc->array[h].tb, NULL);
+            }
         }
     }
 
@@ -1302,8 +1314,8 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
     }
 
     /* add in the hash table */
-    h = tb_hash_func(phys_pc, tb_pc(tb), tb->flags, tb->cflags,
-                     tb->trace_vcpu_dstate);
+    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
+                     tb->flags, tb->cflags, tb->trace_vcpu_dstate);
     qht_insert(&tb_ctx.htable, tb, h, &existing_tb);
 
     /* remove TB from the page(s) if we couldn't insert it */
@@ -1373,7 +1385,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
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



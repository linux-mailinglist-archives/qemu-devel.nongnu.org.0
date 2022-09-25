Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F44F5E92A1
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:15:42 +0200 (CEST)
Received: from localhost ([::1]:38966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocPbp-0006Ch-CO
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPFG-0003HZ-9l
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:52:24 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:46988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPFE-0000Op-BO
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:52:22 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id j8so2758558qvt.13
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=zYxvXg+5qtiPsP21ZAvgN0xZuB4M7ZF4gFQTeGc6wD0=;
 b=E5u8VlnEX6N2Ed5VZJS+IEGOIcubX9zNxB/qY0bGaBztV72KOgXbwUqbvMuUQpWmHW
 De0AI35aw+yiiUuPpFfy/l2UbtdMC+ZNdyr+RjU9ZkSO+BIm8ZDivZ7oR3X7zWCh7Svo
 fd5Ui6ZTTc6kAJQomkvhNrwzHH+ogHbpMlggIdYiEhq1yFmNNDpRdLika0EnczosbjMI
 088SnulAKOkmKG+/xu3a1tIH/S1vExd9GnrhWKl33+7E/iQ3dQiliAorFN5xCvvYe+Ia
 /z9tdQ9+UbW3b5Iu5DNQLGKP+u7/U1/POtPtfBAp3ST42vDyfM1alLp0yl7Bm+ufCBlK
 N/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zYxvXg+5qtiPsP21ZAvgN0xZuB4M7ZF4gFQTeGc6wD0=;
 b=N80t3pDJZOjPvw3QVUkh/XLKzf00FkYMdQ0dodSVVXywKYjfAuur/ndOLkLthKew+s
 j3sdvCU3a72/7nGSLmDluJA6KqlSdXsuIWpDEMHIp0t7dfmXDeJOF0W2F/74Vb5XjmzJ
 /44uGADd55xxhIsqAjdkm7vZcEh35job2VPoJF8DXIjm3nZILmc9YuSCw1cj0/hMEiH/
 ba1zQa9nXwNCbxwz4ZJOtKI0gZMXWJ/P0ylCbbDLF2on2u+CdyS4Xj+kpi1OZfjiBdsN
 Vw9JwforefN6GHqUpj7/aVjJDqaS8pi7BbIkvvE04cA1Hy3dFfqOueRMHiveD9Q6udYL
 ohcA==
X-Gm-Message-State: ACrzQf211OVjYJaGosFuucxrGCukj1yq9eRkrcNavye9Bqp/ifdz7JTT
 ruPi0ZC2015rnwnB2smpd+5KY0JA/pbS4g==
X-Google-Smtp-Source: AMsMyM4lD0G5sgNByBu45bVyv0wFzBcLWXV+aqBDxRNjIaW+yLBJNhKGHiU7FOSzy4mO5/GJ59M6UA==
X-Received: by 2002:a05:6214:29e3:b0:4ad:5de4:accd with SMTP id
 jv3-20020a05621429e300b004ad5de4accdmr13376294qvb.60.1664103139266; 
 Sun, 25 Sep 2022 03:52:19 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a9:5c0e:1ec2:d482:4986:8538])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05620a0c4f00b006cf19068261sm10061132qki.116.2022.09.25.03.52.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 03:52:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 16/17] accel/tcg: Introduce TARGET_TB_PCREL
Date: Sun, 25 Sep 2022 10:51:23 +0000
Message-Id: <20220925105124.82033-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925105124.82033-1-richard.henderson@linaro.org>
References: <20220925105124.82033-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
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
 include/exec/cpu-defs.h   |  3 +++
 include/exec/exec-all.h   | 41 ++++++++++++++++++++++++++---
 include/hw/core/cpu.h     |  1 +
 accel/tcg/cpu-exec.c      | 55 ++++++++++++++++++++++++++++++---------
 accel/tcg/translate-all.c | 48 ++++++++++++++++++++++------------
 5 files changed, 115 insertions(+), 33 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index d0acbb4d35..ef950b05c4 100644
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
index dc72615ad4..0edd1b1ab4 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -492,8 +492,32 @@ struct tb_tc {
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
 
@@ -569,13 +593,24 @@ struct TranslationBlock {
 /* Hide the read to avoid ifdefs for TARGET_TB_PCREL. */
 static inline target_ulong tb_pc(const TranslationBlock *tb)
 {
+#if TARGET_TB_PCREL
+    qemu_build_not_reached();
+#else
     return tb->pc;
+#endif
 }
 
-/* Similarly, but for logs. */
+/*
+ * Similarly, but for logs. In this case, when the virtual pc
+ * is not available, use the physical address.
+ */
 static inline target_ulong tb_pc_log(const TranslationBlock *tb)
 {
+#if TARGET_TB_PCREL
+    return tb->page_addr[0];
+#else
     return tb->pc;
+#endif
 }
 
 /* Hide the qatomic_read to make code a little easier on the eyes */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index ee5b75dea0..b73dd31495 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -234,6 +234,7 @@ struct hvf_vcpu_state;
 
 typedef struct {
     TranslationBlock *tb;
+    vaddr pc;
 } CPUJumpCache;
 
 /* work queue */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 2cf84952e1..7fe42269ea 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -185,7 +185,7 @@ static bool tb_lookup_cmp(const void *p, const void *d)
     const TranslationBlock *tb = p;
     const struct tb_desc *desc = d;
 
-    if (tb_pc(tb) == desc->pc &&
+    if ((TARGET_TB_PCREL || tb_pc(tb) == desc->pc) &&
         tb->page_addr[0] == desc->page_addr0 &&
         tb->cs_base == desc->cs_base &&
         tb->flags == desc->flags &&
@@ -236,7 +236,8 @@ static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
         return NULL;
     }
     desc.page_addr0 = phys_pc;
-    h = tb_hash_func(phys_pc, pc, flags, cflags, *cpu->trace_dstate);
+    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : pc),
+                     flags, cflags, *cpu->trace_dstate);
     return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
 }
 
@@ -252,21 +253,42 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     tcg_debug_assert(!(cflags & CF_INVALID));
 
     hash = tb_jmp_cache_hash_func(pc);
-    tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash].tb);
-
-    if (likely(tb &&
-               tb->pc == pc &&
-               tb->cs_base == cs_base &&
-               tb->flags == flags &&
-               tb->trace_vcpu_dstate == *cpu->trace_dstate &&
-               tb_cflags(tb) == cflags)) {
-        return tb;
+    if (TARGET_TB_PCREL) {
+        /* Use acquire to ensure current load of pc from tb_jmp_cache[]. */
+        tb = qatomic_load_acquire(&cpu->tb_jmp_cache[hash].tb);
+    } else {
+        /* Use rcu_read to ensure current load of pc from *tb. */
+        tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash].tb);
     }
+    if (likely(tb)) {
+        target_ulong jmp_pc;
+
+        if (TARGET_TB_PCREL) {
+            jmp_pc = cpu->tb_jmp_cache[hash].pc;
+        } else {
+            jmp_pc = tb_pc(tb);
+        }
+        if (jmp_pc == pc &&
+            tb->cs_base == cs_base &&
+            tb->flags == flags &&
+            tb->trace_vcpu_dstate == *cpu->trace_dstate &&
+            tb_cflags(tb) == cflags) {
+            return tb;
+        }
+    }
+
     tb = tb_htable_lookup(cpu, pc, cs_base, flags, cflags);
     if (tb == NULL) {
         return NULL;
     }
-    qatomic_set(&cpu->tb_jmp_cache[hash].tb, tb);
+
+    if (TARGET_TB_PCREL) {
+        cpu->tb_jmp_cache[hash].pc = pc;
+        /* Use store_release on tb to ensure pc is current. */
+        qatomic_store_release(&cpu->tb_jmp_cache[hash].tb, tb);
+    } else {
+        qatomic_set(&cpu->tb_jmp_cache[hash].tb, tb);
+    }
     return tb;
 }
 
@@ -454,6 +476,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
         if (cc->tcg_ops->synchronize_from_tb) {
             cc->tcg_ops->synchronize_from_tb(cpu, last_tb);
         } else {
+            assert(!TARGET_TB_PCREL);
             assert(cc->set_pc);
             cc->set_pc(cpu, tb_pc(last_tb));
         }
@@ -997,7 +1020,13 @@ int cpu_exec(CPUState *cpu)
                  * for the fast lookup
                  */
                 h = tb_jmp_cache_hash_func(pc);
-                qatomic_set(&cpu->tb_jmp_cache[h].tb, tb);
+                if (TARGET_TB_PCREL) {
+                    cpu->tb_jmp_cache[h].pc = pc;
+                    /* Use store_release on tb to ensure pc is current. */
+                    qatomic_store_release(&cpu->tb_jmp_cache[h].tb, tb);
+                } else {
+                    qatomic_set(&cpu->tb_jmp_cache[h].tb, tb);
+                }
             }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 9e57822b44..42e897b285 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -298,7 +298,7 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
 
         for (j = 0; j < TARGET_INSN_START_WORDS; ++j) {
             if (i == 0) {
-                prev = (j == 0 ? tb_pc(tb) : 0);
+                prev = (!TARGET_TB_PCREL && j == 0 ? tb_pc(tb) : 0);
             } else {
                 prev = tcg_ctx->gen_insn_data[i - 1][j];
             }
@@ -326,7 +326,7 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
 static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
                                      uintptr_t searched_pc, bool reset_icount)
 {
-    target_ulong data[TARGET_INSN_START_WORDS] = { tb_pc(tb) };
+    target_ulong data[TARGET_INSN_START_WORDS];
     uintptr_t host_pc = (uintptr_t)tb->tc.ptr;
     CPUArchState *env = cpu->env_ptr;
     const uint8_t *p = tb->tc.ptr + tb->tc.size;
@@ -342,6 +342,11 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
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
@@ -884,13 +889,13 @@ static bool tb_cmp(const void *ap, const void *bp)
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
@@ -1169,8 +1174,8 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
 
     /* remove the TB from the hash list */
     phys_pc = tb->page_addr[0];
-    h = tb_hash_func(phys_pc, tb_pc(tb), tb->flags, orig_cflags,
-                     tb->trace_vcpu_dstate);
+    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
+                     tb->flags, orig_cflags, tb->trace_vcpu_dstate);
     if (!qht_remove(&tb_ctx.htable, tb, h)) {
         return;
     }
@@ -1186,10 +1191,17 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     }
 
     /* remove the TB from the hash list */
-    h = tb_jmp_cache_hash_func(tb->pc);
-    CPU_FOREACH(cpu) {
-        if (qatomic_read(&cpu->tb_jmp_cache[h].tb) == tb) {
-            qatomic_set(&cpu->tb_jmp_cache[h].tb, NULL);
+    if (TARGET_TB_PCREL) {
+        /* Any TB may be at any virtual address */
+        CPU_FOREACH(cpu) {
+            cpu_tb_jmp_cache_clear(cpu);
+        }
+    } else {
+        h = tb_jmp_cache_hash_func(tb_pc(tb));
+        CPU_FOREACH(cpu) {
+            if (qatomic_read(&cpu->tb_jmp_cache[h].tb) == tb) {
+                qatomic_set(&cpu->tb_jmp_cache[h].tb, NULL);
+            }
         }
     }
 
@@ -1300,8 +1312,8 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
     }
 
     /* add in the hash table */
-    h = tb_hash_func(phys_pc, tb_pc(tb), tb->flags, tb->cflags,
-                     tb->trace_vcpu_dstate);
+    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
+                     tb->flags, tb->cflags, tb->trace_vcpu_dstate);
     qht_insert(&tb_ctx.htable, tb, h, &existing_tb);
 
     /* remove TB from the page(s) if we couldn't insert it */
@@ -1371,7 +1383,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
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



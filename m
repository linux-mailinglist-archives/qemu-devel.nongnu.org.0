Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DB65AE4F5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:02:27 +0200 (CEST)
Received: from localhost ([::1]:42506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVPV-0001oH-Sx
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVUcR-0007WL-QU
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:11:45 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVUcO-0002eX-0e
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:11:43 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b17so1088300wrq.3
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 02:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=WfD5i0TMWBrlghXojOQV7oRp/BE0F6t4l8ofJuwgSTs=;
 b=SsSEwszblhK8wSLZOXST2s0gM/CVJki5kiZf+H62Tf/eNXYZ0OdyxtcKx/SHuUkIf6
 rCzb0GueEcSIq0KJ7PP2KPDO+lpgPPYCKnIHB1IaizCBC0XEfxPe46p/DNrnolQnM/Lp
 JPhZL64uT2Io89Z7YsrFhUsBfnkzylJ7P1m+esLSK/BLkY3Byve+rdVEcCeK2dBchoSM
 StLsyYAEn0bAtHO3N7XieoDUQkndmqITqvbr66Hs7xm9FveYmPWNg0A0CXd/MD1U4m7a
 xb5LJD/+twwXpUe3zV/ny2N3coOMJ8a3zUWfXurEQbSm52p80W/a0DiDKevRK9sicE4u
 tu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WfD5i0TMWBrlghXojOQV7oRp/BE0F6t4l8ofJuwgSTs=;
 b=18dOFO01kdfMUQrAtC14NrVlMzVT9/p5cIgy8YIrCm8Sm21qGPkdn/kk5CeTDo8w/0
 kf0bHpQVRyp6K/SnKK49oqSzqHym3EMUlxIZ9AUjFKGVQuvT8adSs/z6cq+o3jSr5VRY
 gRd3hB/CWYE5g7l3JIJtdz/jTCWatVHbgZcnwfrRLKWcdVRNmK0kgmZr5PQ0FK8Yc97f
 DXLCs1DKBliJ6Oi3+LljMrVfcftCyT7scUd5l/9cMoxILsCAWHgwifMYXBkY50dBlqoF
 v6UjytPMHYaadrsSSs0/NBxJgEA6gLb2tLfiOniMXweQNK7kFAZEbzpfVNjxZzl7HKMH
 FUTw==
X-Gm-Message-State: ACgBeo3s+AnFw8I9vAWmRgUshE1Ob9XCoW7Caz3di+li0C+UU9p9uimC
 ByHNiIuP7AyumpxC8Z/p6/DmYpGGmLADZzWI
X-Google-Smtp-Source: AA6agR6Tfu14oMtKqqFYQMmNPrMTCgu+wqK8pyx2ONbpS0BMEbxz2eY99hpZN2hZq2tXo4tuH33Vmg==
X-Received: by 2002:a5d:6e8e:0:b0:21d:ea5:710f with SMTP id
 k14-20020a5d6e8e000000b0021d0ea5710fmr26682930wrz.48.1662455499160; 
 Tue, 06 Sep 2022 02:11:39 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 m64-20020a1c2643000000b003a5ee64cc98sm20094193wmm.33.2022.09.06.02.11.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 02:11:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/7] accel/tcg: Introduce TARGET_TB_PCREL
Date: Tue,  6 Sep 2022 10:11:25 +0100
Message-Id: <20220906091126.298041-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906091126.298041-1-richard.henderson@linaro.org>
References: <20220906091126.298041-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
index 9eeb8eb790..ab64ed19af 100644
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
index 36e34496c5..c521e29df4 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -305,7 +305,7 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
 
         for (j = 0; j < TARGET_INSN_START_WORDS; ++j) {
             if (i == 0) {
-                prev = (j == 0 ? tb_pc(tb) : 0);
+                prev = (!TARGET_TB_PCREL && j == 0 ? tb_pc(tb) : 0);
             } else {
                 prev = tcg_ctx->gen_insn_data[i - 1][j];
             }
@@ -333,7 +333,7 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
 static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
                                      uintptr_t searched_pc, bool reset_icount)
 {
-    target_ulong data[TARGET_INSN_START_WORDS] = { tb_pc(tb) };
+    target_ulong data[TARGET_INSN_START_WORDS];
     uintptr_t host_pc = (uintptr_t)tb->tc.ptr;
     CPUArchState *env = cpu->env_ptr;
     const uint8_t *p = tb->tc.ptr + tb->tc.size;
@@ -349,6 +349,11 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
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
@@ -891,13 +896,13 @@ static bool tb_cmp(const void *ap, const void *bp)
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
@@ -1188,8 +1193,8 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
 
     /* remove the TB from the hash list */
     phys_pc = tb->page_addr[0];
-    h = tb_hash_func(phys_pc, tb_pc(tb), tb->flags, orig_cflags,
-                     tb->trace_vcpu_dstate);
+    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
+                     tb->flags, orig_cflags, tb->trace_vcpu_dstate);
     if (!qht_remove(&tb_ctx.htable, tb, h)) {
         return;
     }
@@ -1207,10 +1212,17 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
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
 
@@ -1351,8 +1363,8 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
     }
 
     /* add in the hash table */
-    h = tb_hash_func(phys_pc, tb_pc(tb), tb->flags, tb->cflags,
-                     tb->trace_vcpu_dstate);
+    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
+                     tb->flags, tb->cflags, tb->trace_vcpu_dstate);
     qht_insert(&tb_ctx.htable, tb, h, &existing_tb);
 
     /* remove TB from the page(s) if we couldn't insert it */
@@ -1424,7 +1436,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
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



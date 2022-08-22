Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E4E59CC35
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:30:16 +0200 (CEST)
Received: from localhost ([::1]:51176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQGs3-0001kY-Jg
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlt-0005ex-0y
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:23:53 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:43680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlp-0005bv-75
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:23:52 -0400
Received: by mail-pf1-x436.google.com with SMTP id w138so9197163pfc.10
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=NqtfRvm5YPgpHrNyEYV9MYytRntfUKxLXS0e+JpD/BY=;
 b=drZrcAuALfo64GnOJ12NraER3GGoBIt07S7d6RCGQkoeLG7jTuKloVstpQbnY56UBB
 iMUtaRU0UecAWoJi6IpPzfhPEjTUCbbTwWqXziyQ6PBgb2q5PX3Kjc6M8PLto7XS5HSL
 uw2ri83fhPXhYVEKWV7sba6CSE0WOpXc9fVysXli+1eIo4J7WdqozkjxyZ+mn0Vlq1zF
 +QhadFNp6NoftHpKG26sBAEd4lJT1IMN5p0l0EUddedWjKDS42aB9u2CMYZ6hQbl6z5w
 /fz+IR1+yHvRU45oAty47LAdJLIlrVztxBslox/Dx6P0PG69ykLVbkBinWxaHfZdQiQ+
 gZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=NqtfRvm5YPgpHrNyEYV9MYytRntfUKxLXS0e+JpD/BY=;
 b=PskM+vrjeAvMYcv4nAieeIXqIdA4NyfRxTOd3FyrSBDV7t0Z5aZbkHTahy3/eJgqVr
 Q9zcEgTmo48zW8XV8yQPrUHQ9jWAamFbm5V2GpuLm+InO9TfQvaTBIAzclyIz6ES5ahs
 m5vMZ2q1xW5wYGA0xooDbIg/7MxmPk53DL4yVhQf+bTpVe4PpJVx7i98bw3SHL/PglZA
 FbdMcAiWR9WOR988n4106RUg3ftxV4YR6i1ZaGXTKyOi7wrmqu/z0BGI2++lYK/l2ecz
 6Fo+QjVcmUZ7350nJFi2CtlvcKGbtdUaiUFcD47xot/CpeH2tKExXfZ1PmBPyGkH+Sab
 Wjuw==
X-Gm-Message-State: ACgBeo216VeVKh+zGGFm5agpAldMJhSVk6BiaaHf33aNwQbqw2djwhBL
 StNY2rKh/jSQQjlx4iG0JCLma70CtB0sLw==
X-Google-Smtp-Source: AA6agR7KKer/1qNAxMxAZn1UCAYzpS0AFO72gS2jmJWkC2e/Vz9z79quHOuW1Ai4XyR9+2aqf+Iu8g==
X-Received: by 2002:a63:4c50:0:b0:429:983d:22f1 with SMTP id
 m16-20020a634c50000000b00429983d22f1mr18737726pgl.213.1661210627861; 
 Mon, 22 Aug 2022 16:23:47 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa79731000000b0052d3899f8c2sm3809112pfg.4.2022.08.22.16.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:23:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 07/17] accel/tcg: Introduce TARGET_TB_PCREL
Date: Mon, 22 Aug 2022 16:23:28 -0700
Message-Id: <20220822232338.1727934-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822232338.1727934-1-richard.henderson@linaro.org>
References: <20220822232338.1727934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
index ba3cd32a1e..87e2bc4e59 100644
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
index cec3ef1666..b41835bb55 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -459,8 +459,32 @@ struct tb_tc {
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
+     * Unwind information is taken as byte offsets from the "current"
+     * value of the PC, as tracked by the translator.
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
 
@@ -536,13 +560,24 @@ struct TranslationBlock {
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
index 8edef14199..7dcfccf6e2 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -235,6 +235,7 @@ struct hvf_vcpu_state;
 
 typedef struct {
     TranslationBlock *tb;
+    vaddr pc;
 } CPUJumpCache;
 
 /* work queue */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index f146960b7b..3fb7ce05f8 100644
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
@@ -227,7 +227,8 @@ static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
         return NULL;
     }
     desc.page_addr0 = phys_pc;
-    h = tb_hash_func(phys_pc, pc, flags, cflags, *cpu->trace_dstate);
+    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : pc),
+                     flags, cflags, *cpu->trace_dstate);
     return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
 }
 
@@ -243,21 +244,42 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
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
 
@@ -445,6 +467,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
         if (cc->tcg_ops->synchronize_from_tb) {
             cc->tcg_ops->synchronize_from_tb(cpu, last_tb);
         } else {
+            assert(!TARGET_TB_PCREL);
             assert(cc->set_pc);
             cc->set_pc(cpu, tb_pc(last_tb));
         }
@@ -988,7 +1011,13 @@ int cpu_exec(CPUState *cpu)
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
index 1248ee3433..27435b97db 100644
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



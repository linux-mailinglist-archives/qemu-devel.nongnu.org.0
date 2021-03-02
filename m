Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF6832A90C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:12:43 +0100 (CET)
Received: from localhost ([::1]:46818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9Vi-0007nv-SZ
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:12:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9Ht-0003KH-Iu
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:26 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:46392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9He-0007d7-SV
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:20 -0500
Received: by mail-pg1-x531.google.com with SMTP id h4so14313692pgf.13
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B+zll2iOhU7hYhCD3J657ICTy/17drz9SvKi18L+0YM=;
 b=OwSaBs0uTFCI83+/4kAHwzzdUexJ+S05U3XTWxreeJuZrEoBkFQW8773URJmCB105H
 GXZpd6IidjqepQN+5vinHZW5yXafaokzrOK0Oh13J7BpweYA6jRWDxSfKUb8BT4YVMzi
 mvg2vhlu6pvXkb9EUYjapZH6VY58lIn2QvBpI2/HhX0mr1m5au3HLGQ12VD226EGAzRP
 qFdfibb3Lvdvuqcz52CioWJkXFfNE5F47eYuDDiLcIleQ4dlBI3cJQQqpaczXEMT1ETr
 f9pz8M8HVviQSQ/drgprwX3yp+s6TnESk8Ekoc1m/qRp92VrKrxx55YjbGgrclGnnRcJ
 xVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B+zll2iOhU7hYhCD3J657ICTy/17drz9SvKi18L+0YM=;
 b=qW4heHOltmwib+sybb24dJE3kbWNbRmz3/pyfcYbYKmM2EqWL99lHCsuYZICA5qcpf
 HQFL65b3MzMu+9oGEvzcvCDFD4C+1RoBkvR0o+u6YiVkPxkbC1yrgYBK3i2OVknetcq7
 ciPTFB5UBLNnedPXkMCY6GiD8abClcz8+k268IaA1pj2x2R8sui+im8QXlzOrC2K/F2v
 2fgEkAUzBDvzrewgoT6pT0RgYskYiuMfWU9CgYx2gv7sPiSaZ0ymQtAkpxdDuWJ8LEWn
 7y5w7bBfI/FXOj2yFPlH7gE2Qsk3YoTUJRZsvgtnBpMU4jK8mI+5wchatoCPAgVuKZnv
 JKaA==
X-Gm-Message-State: AOAM531yQ6v7sXdrRmrzLgrd9OzF3DHcmb0FJE3RDo98CMP009YLV4R+
 GC1iJ8HAfXTVqCTQJgKsuIIpYL/ACiGeww==
X-Google-Smtp-Source: ABdhPJwm6LHuBvNivqSupmwlBIPg8NVWN6QT7/4wJDPGmCiD+Ui0k3V5lLcX3yUppQsLa5cg6NeGGw==
X-Received: by 2002:a63:488:: with SMTP id 130mr3767422pge.408.1614707889605; 
 Tue, 02 Mar 2021 09:58:09 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:58:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/27] accel/tcg: drop the use of CF_HASH_MASK and rename
 params
Date: Tue,  2 Mar 2021 09:57:39 -0800
Message-Id: <20210302175741.1079851-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

We don't really deal in cf_mask most of the time. The one time it's
relevant is when we want to remove an invalidated TB from the QHT
lookup. Everywhere else we should be looking up things without
CF_INVALID set.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210224165811.11567-4-alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h   |  4 +---
 include/exec/tb-lookup.h  |  9 ++++++---
 accel/tcg/cpu-exec.c      | 16 ++++++++--------
 accel/tcg/tcg-runtime.c   |  2 +-
 accel/tcg/translate-all.c |  8 +++++---
 5 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 1a69c07add..acf66ab692 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -460,8 +460,6 @@ struct TranslationBlock {
 #define CF_PARALLEL    0x00080000 /* Generate code for a parallel context */
 #define CF_CLUSTER_MASK 0xff000000 /* Top 8 bits are cluster ID */
 #define CF_CLUSTER_SHIFT 24
-/* cflags' mask for hashing/comparison, basically ignore CF_INVALID */
-#define CF_HASH_MASK   (~CF_INVALID)
 
     /* Per-vCPU dynamic tracing state used to generate this TB */
     uint32_t trace_vcpu_dstate;
@@ -538,7 +536,7 @@ void tb_flush(CPUState *cpu);
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
 TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
                                    target_ulong cs_base, uint32_t flags,
-                                   uint32_t cf_mask);
+                                   uint32_t cflags);
 void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
 
 /* GETPC is the true target of the return instruction that we'll execute.  */
diff --git a/include/exec/tb-lookup.h b/include/exec/tb-lookup.h
index b2247d458b..7b70412fae 100644
--- a/include/exec/tb-lookup.h
+++ b/include/exec/tb-lookup.h
@@ -19,11 +19,14 @@
 /* Might cause an exception, so have a longjmp destination ready */
 static inline TranslationBlock * tb_lookup(CPUState *cpu,
                                            target_ulong pc, target_ulong cs_base,
-                                           uint32_t flags, uint32_t cf_mask)
+                                           uint32_t flags, uint32_t cflags)
 {
     TranslationBlock *tb;
     uint32_t hash;
 
+    /* we should never be trying to look up an INVALID tb */
+    tcg_debug_assert(!(cflags & CF_INVALID));
+
     hash = tb_jmp_cache_hash_func(pc);
     tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
 
@@ -32,10 +35,10 @@ static inline TranslationBlock * tb_lookup(CPUState *cpu,
                tb->cs_base == cs_base &&
                tb->flags == flags &&
                tb->trace_vcpu_dstate == *cpu->trace_dstate &&
-               (tb_cflags(tb) & (CF_HASH_MASK | CF_INVALID)) == cf_mask)) {
+               tb_cflags(tb) == cflags)) {
         return tb;
     }
-    tb = tb_htable_lookup(cpu, pc, cs_base, flags, cf_mask);
+    tb = tb_htable_lookup(cpu, pc, cs_base, flags, cflags);
     if (tb == NULL) {
         return NULL;
     }
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 45286dc4b3..931da96c2b 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -307,7 +307,7 @@ struct tb_desc {
     CPUArchState *env;
     tb_page_addr_t phys_page1;
     uint32_t flags;
-    uint32_t cf_mask;
+    uint32_t cflags;
     uint32_t trace_vcpu_dstate;
 };
 
@@ -321,7 +321,7 @@ static bool tb_lookup_cmp(const void *p, const void *d)
         tb->cs_base == desc->cs_base &&
         tb->flags == desc->flags &&
         tb->trace_vcpu_dstate == desc->trace_vcpu_dstate &&
-        (tb_cflags(tb) & (CF_HASH_MASK | CF_INVALID)) == desc->cf_mask) {
+        tb_cflags(tb) == desc->cflags) {
         /* check next page if needed */
         if (tb->page_addr[1] == -1) {
             return true;
@@ -341,7 +341,7 @@ static bool tb_lookup_cmp(const void *p, const void *d)
 
 TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
                                    target_ulong cs_base, uint32_t flags,
-                                   uint32_t cf_mask)
+                                   uint32_t cflags)
 {
     tb_page_addr_t phys_pc;
     struct tb_desc desc;
@@ -350,7 +350,7 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
     desc.env = (CPUArchState *)cpu->env_ptr;
     desc.cs_base = cs_base;
     desc.flags = flags;
-    desc.cf_mask = cf_mask;
+    desc.cflags = cflags;
     desc.trace_vcpu_dstate = *cpu->trace_dstate;
     desc.pc = pc;
     phys_pc = get_page_addr_code(desc.env, pc);
@@ -358,7 +358,7 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
         return NULL;
     }
     desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
-    h = tb_hash_func(phys_pc, pc, flags, cf_mask, *cpu->trace_dstate);
+    h = tb_hash_func(phys_pc, pc, flags, cflags, *cpu->trace_dstate);
     return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
 }
 
@@ -418,7 +418,7 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
 
 static inline TranslationBlock *tb_find(CPUState *cpu,
                                         TranslationBlock *last_tb,
-                                        int tb_exit, uint32_t cf_mask)
+                                        int tb_exit, uint32_t cflags)
 {
     CPUArchState *env = (CPUArchState *)cpu->env_ptr;
     TranslationBlock *tb;
@@ -427,10 +427,10 @@ static inline TranslationBlock *tb_find(CPUState *cpu,
 
     cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
 
-    tb = tb_lookup(cpu, pc, cs_base, flags, cf_mask);
+    tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
     if (tb == NULL) {
         mmap_lock();
-        tb = tb_gen_code(cpu, pc, cs_base, flags, cf_mask);
+        tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
         mmap_unlock();
         /* We add the TB in the virtual pc hash table for the fast lookup */
         qatomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(pc)], tb);
diff --git a/accel/tcg/tcg-runtime.c b/accel/tcg/tcg-runtime.c
index 99403e3eb3..49f5de37e8 100644
--- a/accel/tcg/tcg-runtime.c
+++ b/accel/tcg/tcg-runtime.c
@@ -27,10 +27,10 @@
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
-#include "exec/tb-lookup.h"
 #include "disas/disas.h"
 #include "exec/log.h"
 #include "tcg/tcg.h"
+#include "exec/tb-lookup.h"
 
 /* 32-bit helpers */
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index f29b47f090..0b0bfd35ab 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1311,7 +1311,7 @@ static bool tb_cmp(const void *ap, const void *bp)
     return a->pc == b->pc &&
         a->cs_base == b->cs_base &&
         a->flags == b->flags &&
-        (tb_cflags(a) & CF_HASH_MASK) == (tb_cflags(b) & CF_HASH_MASK) &&
+        (tb_cflags(a) & ~CF_INVALID) == (tb_cflags(b) & ~CF_INVALID) &&
         a->trace_vcpu_dstate == b->trace_vcpu_dstate &&
         a->page_addr[0] == b->page_addr[0] &&
         a->page_addr[1] == b->page_addr[1];
@@ -1616,6 +1616,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     PageDesc *p;
     uint32_t h;
     tb_page_addr_t phys_pc;
+    uint32_t orig_cflags = tb_cflags(tb);
 
     assert_memory_lock();
 
@@ -1626,7 +1627,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
 
     /* remove the TB from the hash list */
     phys_pc = tb->page_addr[0] + (tb->pc & ~TARGET_PAGE_MASK);
-    h = tb_hash_func(phys_pc, tb->pc, tb->flags, tb_cflags(tb) & CF_HASH_MASK,
+    h = tb_hash_func(phys_pc, tb->pc, tb->flags, orig_cflags,
                      tb->trace_vcpu_dstate);
     if (!qht_remove(&tb_ctx.htable, tb, h)) {
         return;
@@ -1793,6 +1794,7 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
     uint32_t h;
 
     assert_memory_lock();
+    tcg_debug_assert(!(tb->cflags & CF_INVALID));
 
     /*
      * Add the TB to the page list, acquiring first the pages's locks.
@@ -1811,7 +1813,7 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
     }
 
     /* add in the hash table */
-    h = tb_hash_func(phys_pc, tb->pc, tb->flags, tb->cflags & CF_HASH_MASK,
+    h = tb_hash_func(phys_pc, tb->pc, tb->flags, tb->cflags,
                      tb->trace_vcpu_dstate);
     qht_insert(&tb_ctx.htable, tb, h, &existing_tb);
 
-- 
2.25.1



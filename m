Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B056E9DED
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 23:33:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppbqA-0007Ea-So; Thu, 20 Apr 2023 17:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ppbq7-0007Df-Jl
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 17:29:15 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ppbpz-0005Xc-HK
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 17:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t3amiKTBkapB3A4zBGXWs9IwIKw072qlBnSTDLAOXoU=; b=o8fqsG/t2GqFaZMd7Fz5wwvn3D
 NrDu1NesmNiBB46zQJlLribFAvn5JPWK9aOsxXONY2p2qJitzM+dtJgUm8j/ZYywsqfldIPaEFzPr
 /tFkPZPq7MxOF/b75ASjsiFdBczmVTSt5uCeUN+fICa4pnDDqEcUtBJn3Ct7wocOglfg=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com
Subject: [PATCH 1/8] accel: Replace `target_ulong` with `vaddr` in TB/TLB
Date: Thu, 20 Apr 2023 23:28:43 +0200
Message-Id: <20230420212850.20400-2-anjo@rev.ng>
In-Reply-To: <20230420212850.20400-1-anjo@rev.ng>
References: <20230420212850.20400-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Changes pc and cs_base in TranslationBlock from target_ulong to vaddr.
Auxilliary structs and tb_*()/tlb_*() functions that depend on this
change are also updated to take a vaddr for guest virtual addresses.

Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 accel/stubs/tcg-stub.c       |   2 +-
 accel/tcg/cpu-exec.c         |  49 +++++-----
 accel/tcg/cputlb.c           | 179 +++++++++++++++++------------------
 accel/tcg/internal.h         |   6 +-
 accel/tcg/tb-hash.h          |  12 +--
 accel/tcg/tb-jmp-cache.h     |   2 +-
 accel/tcg/tb-maint.c         |   2 +-
 accel/tcg/translate-all.c    |  15 +--
 include/exec/cpu-defs.h      |   4 +-
 include/exec/cpu_ldst.h      |   6 +-
 include/exec/exec-all.h      |  82 ++++++++--------
 include/qemu/plugin-memory.h |   2 +-
 12 files changed, 181 insertions(+), 180 deletions(-)

diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index 813695b402..0998e601ad 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -18,7 +18,7 @@ void tb_flush(CPUState *cpu)
 {
 }
 
-void tlb_set_dirty(CPUState *cpu, target_ulong vaddr)
+void tlb_set_dirty(CPUState *cpu, vaddr vaddr)
 {
 }
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8370c92c05..426e3fbea7 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -169,8 +169,8 @@ uint32_t curr_cflags(CPUState *cpu)
 }
 
 struct tb_desc {
-    target_ulong pc;
-    target_ulong cs_base;
+    vaddr pc;
+    vaddr cs_base;
     CPUArchState *env;
     tb_page_addr_t page_addr0;
     uint32_t flags;
@@ -195,7 +195,7 @@ static bool tb_lookup_cmp(const void *p, const void *d)
             return true;
         } else {
             tb_page_addr_t phys_page1;
-            target_ulong virt_page1;
+            vaddr virt_page1;
 
             /*
              * We know that the first page matched, and an otherwise valid TB
@@ -216,8 +216,8 @@ static bool tb_lookup_cmp(const void *p, const void *d)
     return false;
 }
 
-static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
-                                          target_ulong cs_base, uint32_t flags,
+static TranslationBlock *tb_htable_lookup(CPUState *cpu, vaddr pc,
+                                          vaddr cs_base, uint32_t flags,
                                           uint32_t cflags)
 {
     tb_page_addr_t phys_pc;
@@ -241,8 +241,8 @@ static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
 }
 
 /* Might cause an exception, so have a longjmp destination ready */
-static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
-                                          target_ulong cs_base,
+static inline TranslationBlock *tb_lookup(CPUState *cpu, vaddr pc,
+                                          vaddr cs_base,
                                           uint32_t flags, uint32_t cflags)
 {
     TranslationBlock *tb;
@@ -297,13 +297,13 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     return tb;
 }
 
-static void log_cpu_exec(target_ulong pc, CPUState *cpu,
+static void log_cpu_exec(vaddr pc, CPUState *cpu,
                          const TranslationBlock *tb)
 {
     if (qemu_log_in_addr_range(pc)) {
         qemu_log_mask(CPU_LOG_EXEC,
-                      "Trace %d: %p [" TARGET_FMT_lx
-                      "/" TARGET_FMT_lx "/%08x/%08x] %s\n",
+                      "Trace %d: %p [%" VADDR_PRIx
+                      "/%" VADDR_PRIx "/%08x/%08x] %s\n",
                       cpu->cpu_index, tb->tc.ptr, tb->cs_base, pc,
                       tb->flags, tb->cflags, lookup_symbol(pc));
 
@@ -327,7 +327,7 @@ static void log_cpu_exec(target_ulong pc, CPUState *cpu,
     }
 }
 
-static bool check_for_breakpoints_slow(CPUState *cpu, target_ulong pc,
+static bool check_for_breakpoints_slow(CPUState *cpu, vaddr pc,
                                        uint32_t *cflags)
 {
     CPUBreakpoint *bp;
@@ -393,7 +393,7 @@ static bool check_for_breakpoints_slow(CPUState *cpu, target_ulong pc,
     return false;
 }
 
-static inline bool check_for_breakpoints(CPUState *cpu, target_ulong pc,
+static inline bool check_for_breakpoints(CPUState *cpu, vaddr pc,
                                          uint32_t *cflags)
 {
     return unlikely(!QTAILQ_EMPTY(&cpu->breakpoints)) &&
@@ -412,10 +412,11 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
 {
     CPUState *cpu = env_cpu(env);
     TranslationBlock *tb;
-    target_ulong cs_base, pc;
+    vaddr cs_base = 0, pc = 0;
     uint32_t flags, cflags;
 
-    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
+    cpu_get_tb_cpu_state(env, (target_ulong *) &pc,
+                         (target_ulong *) &cs_base, &flags);
 
     cflags = curr_cflags(cpu);
     if (check_for_breakpoints(cpu, pc, &cflags)) {
@@ -488,10 +489,10 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
             cc->set_pc(cpu, last_tb->pc);
         }
         if (qemu_loglevel_mask(CPU_LOG_EXEC)) {
-            target_ulong pc = log_pc(cpu, last_tb);
+            vaddr pc = log_pc(cpu, last_tb);
             if (qemu_log_in_addr_range(pc)) {
-                qemu_log("Stopped execution of TB chain before %p ["
-                         TARGET_FMT_lx "] %s\n",
+                qemu_log("Stopped execution of TB chain before %p [%"
+                         VADDR_PRIx "] %s\n",
                          last_tb->tc.ptr, pc, lookup_symbol(pc));
             }
         }
@@ -533,7 +534,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
 {
     CPUArchState *env = cpu->env_ptr;
     TranslationBlock *tb;
-    target_ulong cs_base, pc;
+    vaddr cs_base = 0, pc = 0;
     uint32_t flags, cflags;
     int tb_exit;
 
@@ -543,7 +544,8 @@ void cpu_exec_step_atomic(CPUState *cpu)
         g_assert(!cpu->running);
         cpu->running = true;
 
-        cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
+        cpu_get_tb_cpu_state(env, (target_ulong *) &pc,
+                             (target_ulong *) &cs_base, &flags);
 
         cflags = curr_cflags(cpu);
         /* Execute in a serial context. */
@@ -884,8 +886,8 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
 }
 
 static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
-                                    target_ulong pc,
-                                    TranslationBlock **last_tb, int *tb_exit)
+                                    vaddr pc, TranslationBlock **last_tb,
+                                    int *tb_exit)
 {
     int32_t insns_left;
 
@@ -946,10 +948,11 @@ cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
 
         while (!cpu_handle_interrupt(cpu, &last_tb)) {
             TranslationBlock *tb;
-            target_ulong cs_base, pc;
+            vaddr cs_base = 0, pc = 0;
             uint32_t flags, cflags;
 
-            cpu_get_tb_cpu_state(cpu->env_ptr, &pc, &cs_base, &flags);
+            cpu_get_tb_cpu_state(cpu->env_ptr, (target_ulong *) &pc,
+                                 (target_ulong *) &cs_base, &flags);
 
             /*
              * When requested, use an exact setting for cflags for the next
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e984a98dc4..7400b860aa 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -98,7 +98,7 @@ static void tlb_window_reset(CPUTLBDesc *desc, int64_t ns,
     desc->window_max_entries = max_entries;
 }
 
-static void tb_jmp_cache_clear_page(CPUState *cpu, target_ulong page_addr)
+static void tb_jmp_cache_clear_page(CPUState *cpu, vaddr page_addr)
 {
     CPUJumpCache *jc = cpu->tb_jmp_cache;
     int i, i0;
@@ -426,7 +426,7 @@ void tlb_flush_all_cpus_synced(CPUState *src_cpu)
 }
 
 static bool tlb_hit_page_mask_anyprot(CPUTLBEntry *tlb_entry,
-                                      target_ulong page, target_ulong mask)
+                                      vaddr page, vaddr mask)
 {
     page &= mask;
     mask &= TARGET_PAGE_MASK | TLB_INVALID_MASK;
@@ -436,8 +436,7 @@ static bool tlb_hit_page_mask_anyprot(CPUTLBEntry *tlb_entry,
             page == (tlb_entry->addr_code & mask));
 }
 
-static inline bool tlb_hit_page_anyprot(CPUTLBEntry *tlb_entry,
-                                        target_ulong page)
+static inline bool tlb_hit_page_anyprot(CPUTLBEntry *tlb_entry, vaddr page)
 {
     return tlb_hit_page_mask_anyprot(tlb_entry, page, -1);
 }
@@ -453,8 +452,8 @@ static inline bool tlb_entry_is_empty(const CPUTLBEntry *te)
 
 /* Called with tlb_c.lock held */
 static bool tlb_flush_entry_mask_locked(CPUTLBEntry *tlb_entry,
-                                        target_ulong page,
-                                        target_ulong mask)
+                                        vaddr page,
+                                        vaddr mask)
 {
     if (tlb_hit_page_mask_anyprot(tlb_entry, page, mask)) {
         memset(tlb_entry, -1, sizeof(*tlb_entry));
@@ -463,16 +462,15 @@ static bool tlb_flush_entry_mask_locked(CPUTLBEntry *tlb_entry,
     return false;
 }
 
-static inline bool tlb_flush_entry_locked(CPUTLBEntry *tlb_entry,
-                                          target_ulong page)
+static inline bool tlb_flush_entry_locked(CPUTLBEntry *tlb_entry, vaddr page)
 {
     return tlb_flush_entry_mask_locked(tlb_entry, page, -1);
 }
 
 /* Called with tlb_c.lock held */
 static void tlb_flush_vtlb_page_mask_locked(CPUArchState *env, int mmu_idx,
-                                            target_ulong page,
-                                            target_ulong mask)
+                                            vaddr page,
+                                            vaddr mask)
 {
     CPUTLBDesc *d = &env_tlb(env)->d[mmu_idx];
     int k;
@@ -486,21 +484,20 @@ static void tlb_flush_vtlb_page_mask_locked(CPUArchState *env, int mmu_idx,
 }
 
 static inline void tlb_flush_vtlb_page_locked(CPUArchState *env, int mmu_idx,
-                                              target_ulong page)
+                                              vaddr page)
 {
     tlb_flush_vtlb_page_mask_locked(env, mmu_idx, page, -1);
 }
 
-static void tlb_flush_page_locked(CPUArchState *env, int midx,
-                                  target_ulong page)
+static void tlb_flush_page_locked(CPUArchState *env, int midx, vaddr page)
 {
-    target_ulong lp_addr = env_tlb(env)->d[midx].large_page_addr;
-    target_ulong lp_mask = env_tlb(env)->d[midx].large_page_mask;
+    vaddr lp_addr = env_tlb(env)->d[midx].large_page_addr;
+    vaddr lp_mask = env_tlb(env)->d[midx].large_page_mask;
 
     /* Check if we need to flush due to large pages.  */
     if ((page & lp_mask) == lp_addr) {
-        tlb_debug("forcing full flush midx %d ("
-                  TARGET_FMT_lx "/" TARGET_FMT_lx ")\n",
+        tlb_debug("forcing full flush midx %d (%"
+                  VADDR_PRIx "/%" VADDR_PRIx ")\n",
                   midx, lp_addr, lp_mask);
         tlb_flush_one_mmuidx_locked(env, midx, get_clock_realtime());
     } else {
@@ -521,7 +518,7 @@ static void tlb_flush_page_locked(CPUArchState *env, int midx,
  * at @addr from the tlbs indicated by @idxmap from @cpu.
  */
 static void tlb_flush_page_by_mmuidx_async_0(CPUState *cpu,
-                                             target_ulong addr,
+                                             vaddr addr,
                                              uint16_t idxmap)
 {
     CPUArchState *env = cpu->env_ptr;
@@ -529,7 +526,7 @@ static void tlb_flush_page_by_mmuidx_async_0(CPUState *cpu,
 
     assert_cpu_is_self(cpu);
 
-    tlb_debug("page addr:" TARGET_FMT_lx " mmu_map:0x%x\n", addr, idxmap);
+    tlb_debug("page addr: %" VADDR_PRIx " mmu_map:0x%x\n", addr, idxmap);
 
     qemu_spin_lock(&env_tlb(env)->c.lock);
     for (mmu_idx = 0; mmu_idx < NB_MMU_MODES; mmu_idx++) {
@@ -560,15 +557,15 @@ static void tlb_flush_page_by_mmuidx_async_0(CPUState *cpu,
 static void tlb_flush_page_by_mmuidx_async_1(CPUState *cpu,
                                              run_on_cpu_data data)
 {
-    target_ulong addr_and_idxmap = (target_ulong) data.target_ptr;
-    target_ulong addr = addr_and_idxmap & TARGET_PAGE_MASK;
+    vaddr addr_and_idxmap = (vaddr) data.target_ptr;
+    vaddr addr = addr_and_idxmap & TARGET_PAGE_MASK;
     uint16_t idxmap = addr_and_idxmap & ~TARGET_PAGE_MASK;
 
     tlb_flush_page_by_mmuidx_async_0(cpu, addr, idxmap);
 }
 
 typedef struct {
-    target_ulong addr;
+    vaddr addr;
     uint16_t idxmap;
 } TLBFlushPageByMMUIdxData;
 
@@ -591,9 +588,9 @@ static void tlb_flush_page_by_mmuidx_async_2(CPUState *cpu,
     g_free(d);
 }
 
-void tlb_flush_page_by_mmuidx(CPUState *cpu, target_ulong addr, uint16_t idxmap)
+void tlb_flush_page_by_mmuidx(CPUState *cpu, vaddr addr, uint16_t idxmap)
 {
-    tlb_debug("addr: "TARGET_FMT_lx" mmu_idx:%" PRIx16 "\n", addr, idxmap);
+    tlb_debug("addr: %" VADDR_PRIx " mmu_idx:%" PRIx16 "\n", addr, idxmap);
 
     /* This should already be page aligned */
     addr &= TARGET_PAGE_MASK;
@@ -619,15 +616,15 @@ void tlb_flush_page_by_mmuidx(CPUState *cpu, target_ulong addr, uint16_t idxmap)
     }
 }
 
-void tlb_flush_page(CPUState *cpu, target_ulong addr)
+void tlb_flush_page(CPUState *cpu, vaddr addr)
 {
     tlb_flush_page_by_mmuidx(cpu, addr, ALL_MMUIDX_BITS);
 }
 
-void tlb_flush_page_by_mmuidx_all_cpus(CPUState *src_cpu, target_ulong addr,
+void tlb_flush_page_by_mmuidx_all_cpus(CPUState *src_cpu, vaddr addr,
                                        uint16_t idxmap)
 {
-    tlb_debug("addr: "TARGET_FMT_lx" mmu_idx:%"PRIx16"\n", addr, idxmap);
+    tlb_debug("addr: %" VADDR_PRIx " mmu_idx:%"PRIx16"\n", addr, idxmap);
 
     /* This should already be page aligned */
     addr &= TARGET_PAGE_MASK;
@@ -659,16 +656,16 @@ void tlb_flush_page_by_mmuidx_all_cpus(CPUState *src_cpu, target_ulong addr,
     tlb_flush_page_by_mmuidx_async_0(src_cpu, addr, idxmap);
 }
 
-void tlb_flush_page_all_cpus(CPUState *src, target_ulong addr)
+void tlb_flush_page_all_cpus(CPUState *src, vaddr addr)
 {
     tlb_flush_page_by_mmuidx_all_cpus(src, addr, ALL_MMUIDX_BITS);
 }
 
 void tlb_flush_page_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
-                                              target_ulong addr,
+                                              vaddr addr,
                                               uint16_t idxmap)
 {
-    tlb_debug("addr: "TARGET_FMT_lx" mmu_idx:%"PRIx16"\n", addr, idxmap);
+    tlb_debug("addr: %" VADDR_PRIx " mmu_idx:%"PRIx16"\n", addr, idxmap);
 
     /* This should already be page aligned */
     addr &= TARGET_PAGE_MASK;
@@ -705,18 +702,18 @@ void tlb_flush_page_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
     }
 }
 
-void tlb_flush_page_all_cpus_synced(CPUState *src, target_ulong addr)
+void tlb_flush_page_all_cpus_synced(CPUState *src, vaddr addr)
 {
     tlb_flush_page_by_mmuidx_all_cpus_synced(src, addr, ALL_MMUIDX_BITS);
 }
 
 static void tlb_flush_range_locked(CPUArchState *env, int midx,
-                                   target_ulong addr, target_ulong len,
+                                   vaddr addr, vaddr len,
                                    unsigned bits)
 {
     CPUTLBDesc *d = &env_tlb(env)->d[midx];
     CPUTLBDescFast *f = &env_tlb(env)->f[midx];
-    target_ulong mask = MAKE_64BIT_MASK(0, bits);
+    vaddr mask = MAKE_64BIT_MASK(0, bits);
 
     /*
      * If @bits is smaller than the tlb size, there may be multiple entries
@@ -730,7 +727,7 @@ static void tlb_flush_range_locked(CPUArchState *env, int midx,
      */
     if (mask < f->mask || len > f->mask) {
         tlb_debug("forcing full flush midx %d ("
-                  TARGET_FMT_lx "/" TARGET_FMT_lx "+" TARGET_FMT_lx ")\n",
+                  "%" VADDR_PRIx "/%" VADDR_PRIx "+%" VADDR_PRIx ")\n",
                   midx, addr, mask, len);
         tlb_flush_one_mmuidx_locked(env, midx, get_clock_realtime());
         return;
@@ -743,14 +740,14 @@ static void tlb_flush_range_locked(CPUArchState *env, int midx,
      */
     if (((addr + len - 1) & d->large_page_mask) == d->large_page_addr) {
         tlb_debug("forcing full flush midx %d ("
-                  TARGET_FMT_lx "/" TARGET_FMT_lx ")\n",
+                  "%" VADDR_PRIx "/%" VADDR_PRIx ")\n",
                   midx, d->large_page_addr, d->large_page_mask);
         tlb_flush_one_mmuidx_locked(env, midx, get_clock_realtime());
         return;
     }
 
-    for (target_ulong i = 0; i < len; i += TARGET_PAGE_SIZE) {
-        target_ulong page = addr + i;
+    for (vaddr i = 0; i < len; i += TARGET_PAGE_SIZE) {
+        vaddr page = addr + i;
         CPUTLBEntry *entry = tlb_entry(env, midx, page);
 
         if (tlb_flush_entry_mask_locked(entry, page, mask)) {
@@ -761,8 +758,8 @@ static void tlb_flush_range_locked(CPUArchState *env, int midx,
 }
 
 typedef struct {
-    target_ulong addr;
-    target_ulong len;
+    vaddr addr;
+    vaddr len;
     uint16_t idxmap;
     uint16_t bits;
 } TLBFlushRangeData;
@@ -775,7 +772,7 @@ static void tlb_flush_range_by_mmuidx_async_0(CPUState *cpu,
 
     assert_cpu_is_self(cpu);
 
-    tlb_debug("range:" TARGET_FMT_lx "/%u+" TARGET_FMT_lx " mmu_map:0x%x\n",
+    tlb_debug("range: %" VADDR_PRIx "/%u+%" VADDR_PRIx " mmu_map:0x%x\n",
               d.addr, d.bits, d.len, d.idxmap);
 
     qemu_spin_lock(&env_tlb(env)->c.lock);
@@ -800,7 +797,7 @@ static void tlb_flush_range_by_mmuidx_async_0(CPUState *cpu,
      * overlap the flushed pages, which includes the previous.
      */
     d.addr -= TARGET_PAGE_SIZE;
-    for (target_ulong i = 0, n = d.len / TARGET_PAGE_SIZE + 1; i < n; i++) {
+    for (vaddr i = 0, n = d.len / TARGET_PAGE_SIZE + 1; i < n; i++) {
         tb_jmp_cache_clear_page(cpu, d.addr);
         d.addr += TARGET_PAGE_SIZE;
     }
@@ -814,8 +811,8 @@ static void tlb_flush_range_by_mmuidx_async_1(CPUState *cpu,
     g_free(d);
 }
 
-void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
-                               target_ulong len, uint16_t idxmap,
+void tlb_flush_range_by_mmuidx(CPUState *cpu, vaddr addr,
+                               vaddr len, uint16_t idxmap,
                                unsigned bits)
 {
     TLBFlushRangeData d;
@@ -850,14 +847,14 @@ void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
     }
 }
 
-void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
+void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, vaddr addr,
                                    uint16_t idxmap, unsigned bits)
 {
     tlb_flush_range_by_mmuidx(cpu, addr, TARGET_PAGE_SIZE, idxmap, bits);
 }
 
 void tlb_flush_range_by_mmuidx_all_cpus(CPUState *src_cpu,
-                                        target_ulong addr, target_ulong len,
+                                        vaddr addr, vaddr len,
                                         uint16_t idxmap, unsigned bits)
 {
     TLBFlushRangeData d;
@@ -897,16 +894,16 @@ void tlb_flush_range_by_mmuidx_all_cpus(CPUState *src_cpu,
 }
 
 void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
-                                            target_ulong addr,
-                                            uint16_t idxmap, unsigned bits)
+                                            vaddr addr, uint16_t idxmap,
+                                            unsigned bits)
 {
     tlb_flush_range_by_mmuidx_all_cpus(src_cpu, addr, TARGET_PAGE_SIZE,
                                        idxmap, bits);
 }
 
 void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
-                                               target_ulong addr,
-                                               target_ulong len,
+                                               vaddr addr,
+                                               vaddr len,
                                                uint16_t idxmap,
                                                unsigned bits)
 {
@@ -948,7 +945,7 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
 }
 
 void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
-                                                   target_ulong addr,
+                                                   vaddr addr,
                                                    uint16_t idxmap,
                                                    unsigned bits)
 {
@@ -1050,32 +1047,32 @@ void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length)
 
 /* Called with tlb_c.lock held */
 static inline void tlb_set_dirty1_locked(CPUTLBEntry *tlb_entry,
-                                         target_ulong vaddr)
+                                         vaddr addr)
 {
-    if (tlb_entry->addr_write == (vaddr | TLB_NOTDIRTY)) {
-        tlb_entry->addr_write = vaddr;
+    if (tlb_entry->addr_write == (addr | TLB_NOTDIRTY)) {
+        tlb_entry->addr_write = addr;
     }
 }
 
 /* update the TLB corresponding to virtual page vaddr
    so that it is no longer dirty */
-void tlb_set_dirty(CPUState *cpu, target_ulong vaddr)
+void tlb_set_dirty(CPUState *cpu, vaddr addr)
 {
     CPUArchState *env = cpu->env_ptr;
     int mmu_idx;
 
     assert_cpu_is_self(cpu);
 
-    vaddr &= TARGET_PAGE_MASK;
+    addr &= TARGET_PAGE_MASK;
     qemu_spin_lock(&env_tlb(env)->c.lock);
     for (mmu_idx = 0; mmu_idx < NB_MMU_MODES; mmu_idx++) {
-        tlb_set_dirty1_locked(tlb_entry(env, mmu_idx, vaddr), vaddr);
+        tlb_set_dirty1_locked(tlb_entry(env, mmu_idx, addr), addr);
     }
 
     for (mmu_idx = 0; mmu_idx < NB_MMU_MODES; mmu_idx++) {
         int k;
         for (k = 0; k < CPU_VTLB_SIZE; k++) {
-            tlb_set_dirty1_locked(&env_tlb(env)->d[mmu_idx].vtable[k], vaddr);
+            tlb_set_dirty1_locked(&env_tlb(env)->d[mmu_idx].vtable[k], addr);
         }
     }
     qemu_spin_unlock(&env_tlb(env)->c.lock);
@@ -1084,20 +1081,20 @@ void tlb_set_dirty(CPUState *cpu, target_ulong vaddr)
 /* Our TLB does not support large pages, so remember the area covered by
    large pages and trigger a full TLB flush if these are invalidated.  */
 static void tlb_add_large_page(CPUArchState *env, int mmu_idx,
-                               target_ulong vaddr, target_ulong size)
+                               vaddr addr, uint64_t size)
 {
-    target_ulong lp_addr = env_tlb(env)->d[mmu_idx].large_page_addr;
-    target_ulong lp_mask = ~(size - 1);
+    vaddr lp_addr = env_tlb(env)->d[mmu_idx].large_page_addr;
+    vaddr lp_mask = ~(size - 1);
 
-    if (lp_addr == (target_ulong)-1) {
+    if (lp_addr == (vaddr)-1) {
         /* No previous large page.  */
-        lp_addr = vaddr;
+        lp_addr = addr;
     } else {
         /* Extend the existing region to include the new page.
            This is a compromise between unnecessary flushes and
            the cost of maintaining a full variable size TLB.  */
         lp_mask &= env_tlb(env)->d[mmu_idx].large_page_mask;
-        while (((lp_addr ^ vaddr) & lp_mask) != 0) {
+        while (((lp_addr ^ addr) & lp_mask) != 0) {
             lp_mask <<= 1;
         }
     }
@@ -1114,19 +1111,19 @@ static void tlb_add_large_page(CPUArchState *env, int mmu_idx,
  * critical section.
  */
 void tlb_set_page_full(CPUState *cpu, int mmu_idx,
-                       target_ulong vaddr, CPUTLBEntryFull *full)
+                       vaddr addr, CPUTLBEntryFull *full)
 {
     CPUArchState *env = cpu->env_ptr;
     CPUTLB *tlb = env_tlb(env);
     CPUTLBDesc *desc = &tlb->d[mmu_idx];
     MemoryRegionSection *section;
     unsigned int index;
-    target_ulong address;
-    target_ulong write_address;
+    vaddr address;
+    vaddr write_address;
     uintptr_t addend;
     CPUTLBEntry *te, tn;
     hwaddr iotlb, xlat, sz, paddr_page;
-    target_ulong vaddr_page;
+    vaddr addr_page;
     int asidx, wp_flags, prot;
     bool is_ram, is_romd;
 
@@ -1136,9 +1133,9 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
         sz = TARGET_PAGE_SIZE;
     } else {
         sz = (hwaddr)1 << full->lg_page_size;
-        tlb_add_large_page(env, mmu_idx, vaddr, sz);
+        tlb_add_large_page(env, mmu_idx, addr, sz);
     }
-    vaddr_page = vaddr & TARGET_PAGE_MASK;
+    addr_page = addr & TARGET_PAGE_MASK;
     paddr_page = full->phys_addr & TARGET_PAGE_MASK;
 
     prot = full->prot;
@@ -1147,11 +1144,11 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
                                                 &xlat, &sz, full->attrs, &prot);
     assert(sz >= TARGET_PAGE_SIZE);
 
-    tlb_debug("vaddr=" TARGET_FMT_lx " paddr=0x" HWADDR_FMT_plx
+    tlb_debug("vaddr=%" VADDR_PRIx " paddr=0x" HWADDR_FMT_plx
               " prot=%x idx=%d\n",
-              vaddr, full->phys_addr, prot, mmu_idx);
+              addr, full->phys_addr, prot, mmu_idx);
 
-    address = vaddr_page;
+    address = addr_page;
     if (full->lg_page_size < TARGET_PAGE_BITS) {
         /* Repeat the MMU check and TLB fill on every access.  */
         address |= TLB_INVALID_MASK;
@@ -1199,11 +1196,11 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
         }
     }
 
-    wp_flags = cpu_watchpoint_address_matches(cpu, vaddr_page,
+    wp_flags = cpu_watchpoint_address_matches(cpu, addr_page,
                                               TARGET_PAGE_SIZE);
 
-    index = tlb_index(env, mmu_idx, vaddr_page);
-    te = tlb_entry(env, mmu_idx, vaddr_page);
+    index = tlb_index(env, mmu_idx, addr_page);
+    te = tlb_entry(env, mmu_idx, addr_page);
 
     /*
      * Hold the TLB lock for the rest of the function. We could acquire/release
@@ -1218,13 +1215,13 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
     tlb->c.dirty |= 1 << mmu_idx;
 
     /* Make sure there's no cached translation for the new page.  */
-    tlb_flush_vtlb_page_locked(env, mmu_idx, vaddr_page);
+    tlb_flush_vtlb_page_locked(env, mmu_idx, addr_page);
 
     /*
      * Only evict the old entry to the victim tlb if it's for a
      * different page; otherwise just overwrite the stale data.
      */
-    if (!tlb_hit_page_anyprot(te, vaddr_page) && !tlb_entry_is_empty(te)) {
+    if (!tlb_hit_page_anyprot(te, addr_page) && !tlb_entry_is_empty(te)) {
         unsigned vidx = desc->vindex++ % CPU_VTLB_SIZE;
         CPUTLBEntry *tv = &desc->vtable[vidx];
 
@@ -1248,11 +1245,11 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
      * vaddr we add back in io_readx()/io_writex()/get_page_addr_code().
      */
     desc->fulltlb[index] = *full;
-    desc->fulltlb[index].xlat_section = iotlb - vaddr_page;
+    desc->fulltlb[index].xlat_section = iotlb - addr_page;
     desc->fulltlb[index].phys_addr = paddr_page;
 
     /* Now calculate the new entry */
-    tn.addend = addend - vaddr_page;
+    tn.addend = addend - addr_page;
     if (prot & PAGE_READ) {
         tn.addr_read = address;
         if (wp_flags & BP_MEM_READ) {
@@ -1284,9 +1281,9 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
     qemu_spin_unlock(&tlb->c.lock);
 }
 
-void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
+void tlb_set_page_with_attrs(CPUState *cpu, vaddr addr,
                              hwaddr paddr, MemTxAttrs attrs, int prot,
-                             int mmu_idx, target_ulong size)
+                             int mmu_idx, uint64_t size)
 {
     CPUTLBEntryFull full = {
         .phys_addr = paddr,
@@ -1296,14 +1293,14 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
     };
 
     assert(is_power_of_2(size));
-    tlb_set_page_full(cpu, mmu_idx, vaddr, &full);
+    tlb_set_page_full(cpu, mmu_idx, addr, &full);
 }
 
-void tlb_set_page(CPUState *cpu, target_ulong vaddr,
+void tlb_set_page(CPUState *cpu, vaddr addr,
                   hwaddr paddr, int prot,
-                  int mmu_idx, target_ulong size)
+                  int mmu_idx, uint64_t size)
 {
-    tlb_set_page_with_attrs(cpu, vaddr, paddr, MEMTXATTRS_UNSPECIFIED,
+    tlb_set_page_with_attrs(cpu, addr, paddr, MEMTXATTRS_UNSPECIFIED,
                             prot, mmu_idx, size);
 }
 
@@ -1312,7 +1309,7 @@ void tlb_set_page(CPUState *cpu, target_ulong vaddr,
  * caller's prior references to the TLB table (e.g. CPUTLBEntry pointers) must
  * be discarded and looked up again (e.g. via tlb_entry()).
  */
-static void tlb_fill(CPUState *cpu, target_ulong addr, int size,
+static void tlb_fill(CPUState *cpu, vaddr addr, int size,
                      MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
 {
     bool ok;
@@ -1352,7 +1349,7 @@ static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
 }
 
 static uint64_t io_readx(CPUArchState *env, CPUTLBEntryFull *full,
-                         int mmu_idx, target_ulong addr, uintptr_t retaddr,
+                         int mmu_idx, vaddr addr, uintptr_t retaddr,
                          MMUAccessType access_type, MemOp op)
 {
     CPUState *cpu = env_cpu(env);
@@ -1402,7 +1399,7 @@ static void save_iotlb_data(CPUState *cs, MemoryRegionSection *section,
 }
 
 static void io_writex(CPUArchState *env, CPUTLBEntryFull *full,
-                      int mmu_idx, uint64_t val, target_ulong addr,
+                      int mmu_idx, uint64_t val, vaddr addr,
                       uintptr_t retaddr, MemOp op)
 {
     CPUState *cpu = env_cpu(env);
@@ -1454,7 +1451,7 @@ static inline target_ulong tlb_read_ofs(CPUTLBEntry *entry, size_t ofs)
 /* Return true if ADDR is present in the victim tlb, and has been copied
    back to the main tlb.  */
 static bool victim_tlb_hit(CPUArchState *env, size_t mmu_idx, size_t index,
-                           size_t elt_ofs, target_ulong page)
+                           size_t elt_ofs, vaddr page)
 {
     size_t vidx;
 
@@ -1717,13 +1714,13 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
  * from the same thread (which a mem callback will be) this is safe.
  */
 
-bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
+bool tlb_plugin_lookup(CPUState *cpu, vaddr addr, int mmu_idx,
                        bool is_store, struct qemu_plugin_hwaddr *data)
 {
     CPUArchState *env = cpu->env_ptr;
     CPUTLBEntry *tlbe = tlb_entry(env, mmu_idx, addr);
     uintptr_t index = tlb_index(env, mmu_idx, addr);
-    target_ulong tlb_addr = is_store ? tlb_addr_write(tlbe) : tlbe->addr_read;
+    vaddr tlb_addr = is_store ? tlb_addr_write(tlbe) : tlbe->addr_read;
 
     if (likely(tlb_hit(tlb_addr, addr))) {
         /* We must have an iotlb entry for MMIO */
diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 96f198b28b..89906dbdba 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -42,8 +42,8 @@ void tb_invalidate_phys_range_fast(ram_addr_t ram_addr,
 G_NORETURN void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
 #endif /* CONFIG_SOFTMMU */
 
-TranslationBlock *tb_gen_code(CPUState *cpu, target_ulong pc,
-                              target_ulong cs_base, uint32_t flags,
+TranslationBlock *tb_gen_code(CPUState *cpu, vaddr pc,
+                              vaddr cs_base, uint32_t flags,
                               int cflags);
 void page_init(void);
 void tb_htable_init(void);
@@ -55,7 +55,7 @@ void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
                                uintptr_t host_pc);
 
 /* Return the current PC from CPU, which may be cached in TB. */
-static inline target_ulong log_pc(CPUState *cpu, const TranslationBlock *tb)
+static inline vaddr log_pc(CPUState *cpu, const TranslationBlock *tb)
 {
     if (tb_cflags(tb) & CF_PCREL) {
         return cpu->cc->get_pc(cpu);
diff --git a/accel/tcg/tb-hash.h b/accel/tcg/tb-hash.h
index 83dc610e4c..f560d3b0bb 100644
--- a/accel/tcg/tb-hash.h
+++ b/accel/tcg/tb-hash.h
@@ -35,16 +35,16 @@
 #define TB_JMP_ADDR_MASK (TB_JMP_PAGE_SIZE - 1)
 #define TB_JMP_PAGE_MASK (TB_JMP_CACHE_SIZE - TB_JMP_PAGE_SIZE)
 
-static inline unsigned int tb_jmp_cache_hash_page(target_ulong pc)
+static inline unsigned int tb_jmp_cache_hash_page(vaddr pc)
 {
-    target_ulong tmp;
+    vaddr tmp;
     tmp = pc ^ (pc >> (TARGET_PAGE_BITS - TB_JMP_PAGE_BITS));
     return (tmp >> (TARGET_PAGE_BITS - TB_JMP_PAGE_BITS)) & TB_JMP_PAGE_MASK;
 }
 
-static inline unsigned int tb_jmp_cache_hash_func(target_ulong pc)
+static inline unsigned int tb_jmp_cache_hash_func(vaddr pc)
 {
-    target_ulong tmp;
+    vaddr tmp;
     tmp = pc ^ (pc >> (TARGET_PAGE_BITS - TB_JMP_PAGE_BITS));
     return (((tmp >> (TARGET_PAGE_BITS - TB_JMP_PAGE_BITS)) & TB_JMP_PAGE_MASK)
            | (tmp & TB_JMP_ADDR_MASK));
@@ -53,7 +53,7 @@ static inline unsigned int tb_jmp_cache_hash_func(target_ulong pc)
 #else
 
 /* In user-mode we can get better hashing because we do not have a TLB */
-static inline unsigned int tb_jmp_cache_hash_func(target_ulong pc)
+static inline unsigned int tb_jmp_cache_hash_func(vaddr pc)
 {
     return (pc ^ (pc >> TB_JMP_CACHE_BITS)) & (TB_JMP_CACHE_SIZE - 1);
 }
@@ -61,7 +61,7 @@ static inline unsigned int tb_jmp_cache_hash_func(target_ulong pc)
 #endif /* CONFIG_SOFTMMU */
 
 static inline
-uint32_t tb_hash_func(tb_page_addr_t phys_pc, target_ulong pc, uint32_t flags,
+uint32_t tb_hash_func(tb_page_addr_t phys_pc, vaddr pc, uint32_t flags,
                       uint32_t cf_mask, uint32_t trace_vcpu_dstate)
 {
     return qemu_xxhash7(phys_pc, pc, flags, cf_mask, trace_vcpu_dstate);
diff --git a/accel/tcg/tb-jmp-cache.h b/accel/tcg/tb-jmp-cache.h
index bee87eb840..bb424c8a05 100644
--- a/accel/tcg/tb-jmp-cache.h
+++ b/accel/tcg/tb-jmp-cache.h
@@ -21,7 +21,7 @@ struct CPUJumpCache {
     struct rcu_head rcu;
     struct {
         TranslationBlock *tb;
-        target_ulong pc;
+        vaddr pc;
     } array[TB_JMP_CACHE_SIZE];
 };
 
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index cb1f806f00..a3596085b2 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -99,7 +99,7 @@ static void tb_remove_all(void)
 /* Call with mmap_lock held. */
 static void tb_record(TranslationBlock *tb, PageDesc *p1, PageDesc *p2)
 {
-    target_ulong addr;
+    vaddr addr;
     int flags;
 
     assert_memory_lock();
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 5b13281119..d4e567ed89 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -271,7 +271,7 @@ void page_init(void)
  * Return the size of the generated code, or negative on error.
  */
 static int setjmp_gen_code(CPUArchState *env, TranslationBlock *tb,
-                           target_ulong pc, void *host_pc,
+                           vaddr pc, void *host_pc,
                            int *max_insns, int64_t *ti)
 {
     int ret = sigsetjmp(tcg_ctx->jmp_trans, 0);
@@ -299,7 +299,7 @@ static int setjmp_gen_code(CPUArchState *env, TranslationBlock *tb,
 
 /* Called with mmap_lock held for user mode emulation.  */
 TranslationBlock *tb_gen_code(CPUState *cpu,
-                              target_ulong pc, target_ulong cs_base,
+                              vaddr pc, vaddr cs_base,
                               uint32_t flags, int cflags)
 {
     CPUArchState *env = cpu->env_ptr;
@@ -565,11 +565,12 @@ void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
         /* The exception probably happened in a helper.  The CPU state should
            have been saved before calling it. Fetch the PC from there.  */
         CPUArchState *env = cpu->env_ptr;
-        target_ulong pc, cs_base;
+        vaddr pc = 0, cs_base = 0;
         tb_page_addr_t addr;
         uint32_t flags;
 
-        cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
+        cpu_get_tb_cpu_state(env, (target_ulong *) &pc,
+                             (target_ulong *) &cs_base, &flags);
         addr = get_page_addr_code(env, pc);
         if (addr != -1) {
             tb_invalidate_phys_range(addr, addr);
@@ -619,10 +620,10 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
     cpu->cflags_next_tb = curr_cflags(cpu) | CF_MEMI_ONLY | CF_LAST_IO | n;
 
     if (qemu_loglevel_mask(CPU_LOG_EXEC)) {
-        target_ulong pc = log_pc(cpu, tb);
+        vaddr pc = log_pc(cpu, tb);
         if (qemu_log_in_addr_range(pc)) {
-            qemu_log("cpu_io_recompile: rewound execution of TB to "
-                     TARGET_FMT_lx "\n", pc);
+            qemu_log("cpu_io_recompile: rewound execution of TB to %"
+                     VADDR_PRIx "\n", pc);
         }
     }
 
diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index e1c498ef4b..d725f55d73 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -177,8 +177,8 @@ typedef struct CPUTLBDesc {
      * we must flush the entire tlb.  The region is matched if
      * (addr & large_page_mask) == large_page_addr.
      */
-    target_ulong large_page_addr;
-    target_ulong large_page_mask;
+    vaddr large_page_addr;
+    vaddr large_page_mask;
     /* host time (in ns) at the beginning of the time window */
     int64_t window_begin_ns;
     /* maximum number of entries observed in the window */
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 09b55cc0ee..41e0ca05c5 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -360,7 +360,7 @@ static inline void clear_helper_retaddr(void)
 /* Needed for TCG_OVERSIZED_GUEST */
 #include "tcg/tcg.h"
 
-static inline target_ulong tlb_addr_write(const CPUTLBEntry *entry)
+static inline vaddr tlb_addr_write(const CPUTLBEntry *entry)
 {
 #if TCG_OVERSIZED_GUEST
     return entry->addr_write;
@@ -371,7 +371,7 @@ static inline target_ulong tlb_addr_write(const CPUTLBEntry *entry)
 
 /* Find the TLB index corresponding to the mmu_idx + address pair.  */
 static inline uintptr_t tlb_index(CPUArchState *env, uintptr_t mmu_idx,
-                                  target_ulong addr)
+                                  vaddr addr)
 {
     uintptr_t size_mask = env_tlb(env)->f[mmu_idx].mask >> CPU_TLB_ENTRY_BITS;
 
@@ -380,7 +380,7 @@ static inline uintptr_t tlb_index(CPUArchState *env, uintptr_t mmu_idx,
 
 /* Find the TLB entry corresponding to the mmu_idx + address pair.  */
 static inline CPUTLBEntry *tlb_entry(CPUArchState *env, uintptr_t mmu_idx,
-                                     target_ulong addr)
+                                     vaddr addr)
 {
     return &env_tlb(env)->f[mmu_idx].table[tlb_index(env, mmu_idx, addr)];
 }
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index ecded1f112..47c5154718 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -108,7 +108,7 @@ void tlb_destroy(CPUState *cpu);
  * Flush one page from the TLB of the specified CPU, for all
  * MMU indexes.
  */
-void tlb_flush_page(CPUState *cpu, target_ulong addr);
+void tlb_flush_page(CPUState *cpu, vaddr addr);
 /**
  * tlb_flush_page_all_cpus:
  * @cpu: src CPU of the flush
@@ -117,7 +117,7 @@ void tlb_flush_page(CPUState *cpu, target_ulong addr);
  * Flush one page from the TLB of the specified CPU, for all
  * MMU indexes.
  */
-void tlb_flush_page_all_cpus(CPUState *src, target_ulong addr);
+void tlb_flush_page_all_cpus(CPUState *src, vaddr addr);
 /**
  * tlb_flush_page_all_cpus_synced:
  * @cpu: src CPU of the flush
@@ -129,7 +129,7 @@ void tlb_flush_page_all_cpus(CPUState *src, target_ulong addr);
  * the source vCPUs safe work is complete. This will depend on when
  * the guests translation ends the TB.
  */
-void tlb_flush_page_all_cpus_synced(CPUState *src, target_ulong addr);
+void tlb_flush_page_all_cpus_synced(CPUState *src, vaddr addr);
 /**
  * tlb_flush:
  * @cpu: CPU whose TLB should be flushed
@@ -164,7 +164,7 @@ void tlb_flush_all_cpus_synced(CPUState *src_cpu);
  * Flush one page from the TLB of the specified CPU, for the specified
  * MMU indexes.
  */
-void tlb_flush_page_by_mmuidx(CPUState *cpu, target_ulong addr,
+void tlb_flush_page_by_mmuidx(CPUState *cpu, vaddr addr,
                               uint16_t idxmap);
 /**
  * tlb_flush_page_by_mmuidx_all_cpus:
@@ -175,7 +175,7 @@ void tlb_flush_page_by_mmuidx(CPUState *cpu, target_ulong addr,
  * Flush one page from the TLB of all CPUs, for the specified
  * MMU indexes.
  */
-void tlb_flush_page_by_mmuidx_all_cpus(CPUState *cpu, target_ulong addr,
+void tlb_flush_page_by_mmuidx_all_cpus(CPUState *cpu, vaddr addr,
                                        uint16_t idxmap);
 /**
  * tlb_flush_page_by_mmuidx_all_cpus_synced:
@@ -189,7 +189,7 @@ void tlb_flush_page_by_mmuidx_all_cpus(CPUState *cpu, target_ulong addr,
  * complete once  the source vCPUs safe work is complete. This will
  * depend on when the guests translation ends the TB.
  */
-void tlb_flush_page_by_mmuidx_all_cpus_synced(CPUState *cpu, target_ulong addr,
+void tlb_flush_page_by_mmuidx_all_cpus_synced(CPUState *cpu, vaddr addr,
                                               uint16_t idxmap);
 /**
  * tlb_flush_by_mmuidx:
@@ -232,14 +232,14 @@ void tlb_flush_by_mmuidx_all_cpus_synced(CPUState *cpu, uint16_t idxmap);
  *
  * Similar to tlb_flush_page_mask, but with a bitmap of indexes.
  */
-void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
+void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, vaddr addr,
                                    uint16_t idxmap, unsigned bits);
 
 /* Similarly, with broadcast and syncing. */
-void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *cpu, target_ulong addr,
+void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *cpu, vaddr addr,
                                             uint16_t idxmap, unsigned bits);
 void tlb_flush_page_bits_by_mmuidx_all_cpus_synced
-    (CPUState *cpu, target_ulong addr, uint16_t idxmap, unsigned bits);
+    (CPUState *cpu, vaddr addr, uint16_t idxmap, unsigned bits);
 
 /**
  * tlb_flush_range_by_mmuidx
@@ -252,17 +252,17 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus_synced
  * For each mmuidx in @idxmap, flush all pages within [@addr,@addr+@len),
  * comparing only the low @bits worth of each virtual page.
  */
-void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
-                               target_ulong len, uint16_t idxmap,
+void tlb_flush_range_by_mmuidx(CPUState *cpu, vaddr addr,
+                               vaddr len, uint16_t idxmap,
                                unsigned bits);
 
 /* Similarly, with broadcast and syncing. */
-void tlb_flush_range_by_mmuidx_all_cpus(CPUState *cpu, target_ulong addr,
-                                        target_ulong len, uint16_t idxmap,
+void tlb_flush_range_by_mmuidx_all_cpus(CPUState *cpu, vaddr addr,
+                                        vaddr len, uint16_t idxmap,
                                         unsigned bits);
 void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
-                                               target_ulong addr,
-                                               target_ulong len,
+                                               vaddr addr,
+                                               vaddr len,
                                                uint16_t idxmap,
                                                unsigned bits);
 
@@ -270,7 +270,7 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
  * tlb_set_page_full:
  * @cpu: CPU context
  * @mmu_idx: mmu index of the tlb to modify
- * @vaddr: virtual address of the entry to add
+ * @addr: virtual address of the entry to add
  * @full: the details of the tlb entry
  *
  * Add an entry to @cpu tlb index @mmu_idx.  All of the fields of
@@ -285,13 +285,13 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
  * single TARGET_PAGE_SIZE region is mapped; @full->lg_page_size is only
  * used by tlb_flush_page.
  */
-void tlb_set_page_full(CPUState *cpu, int mmu_idx, target_ulong vaddr,
+void tlb_set_page_full(CPUState *cpu, int mmu_idx, vaddr addr,
                        CPUTLBEntryFull *full);
 
 /**
  * tlb_set_page_with_attrs:
  * @cpu: CPU to add this TLB entry for
- * @vaddr: virtual address of page to add entry for
+ * @addr: virtual address of page to add entry for
  * @paddr: physical address of the page
  * @attrs: memory transaction attributes
  * @prot: access permissions (PAGE_READ/PAGE_WRITE/PAGE_EXEC bits)
@@ -299,7 +299,7 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx, target_ulong vaddr,
  * @size: size of the page in bytes
  *
  * Add an entry to this CPU's TLB (a mapping from virtual address
- * @vaddr to physical address @paddr) with the specified memory
+ * @addr to physical address @paddr) with the specified memory
  * transaction attributes. This is generally called by the target CPU
  * specific code after it has been called through the tlb_fill()
  * entry point and performed a successful page table walk to find
@@ -310,18 +310,18 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx, target_ulong vaddr,
  * single TARGET_PAGE_SIZE region is mapped; the supplied @size is only
  * used by tlb_flush_page.
  */
-void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
+void tlb_set_page_with_attrs(CPUState *cpu, vaddr addr,
                              hwaddr paddr, MemTxAttrs attrs,
-                             int prot, int mmu_idx, target_ulong size);
+                             int prot, int mmu_idx, uint64_t size);
 /* tlb_set_page:
  *
  * This function is equivalent to calling tlb_set_page_with_attrs()
  * with an @attrs argument of MEMTXATTRS_UNSPECIFIED. It's provided
  * as a convenience for CPUs which don't use memory transaction attributes.
  */
-void tlb_set_page(CPUState *cpu, target_ulong vaddr,
+void tlb_set_page(CPUState *cpu, vaddr addr,
                   hwaddr paddr, int prot,
-                  int mmu_idx, target_ulong size);
+                  int mmu_idx, uint64_t size);
 #else
 static inline void tlb_init(CPUState *cpu)
 {
@@ -329,14 +329,14 @@ static inline void tlb_init(CPUState *cpu)
 static inline void tlb_destroy(CPUState *cpu)
 {
 }
-static inline void tlb_flush_page(CPUState *cpu, target_ulong addr)
+static inline void tlb_flush_page(CPUState *cpu, vaddr addr)
 {
 }
-static inline void tlb_flush_page_all_cpus(CPUState *src, target_ulong addr)
+static inline void tlb_flush_page_all_cpus(CPUState *src, vaddr addr)
 {
 }
 static inline void tlb_flush_page_all_cpus_synced(CPUState *src,
-                                                  target_ulong addr)
+                                                  vaddr addr)
 {
 }
 static inline void tlb_flush(CPUState *cpu)
@@ -349,7 +349,7 @@ static inline void tlb_flush_all_cpus_synced(CPUState *src_cpu)
 {
 }
 static inline void tlb_flush_page_by_mmuidx(CPUState *cpu,
-                                            target_ulong addr, uint16_t idxmap)
+                                            vaddr addr, uint16_t idxmap)
 {
 }
 
@@ -357,12 +357,12 @@ static inline void tlb_flush_by_mmuidx(CPUState *cpu, uint16_t idxmap)
 {
 }
 static inline void tlb_flush_page_by_mmuidx_all_cpus(CPUState *cpu,
-                                                     target_ulong addr,
+                                                     vaddr addr,
                                                      uint16_t idxmap)
 {
 }
 static inline void tlb_flush_page_by_mmuidx_all_cpus_synced(CPUState *cpu,
-                                                            target_ulong addr,
+                                                            vaddr addr,
                                                             uint16_t idxmap)
 {
 }
@@ -375,37 +375,37 @@ static inline void tlb_flush_by_mmuidx_all_cpus_synced(CPUState *cpu,
 {
 }
 static inline void tlb_flush_page_bits_by_mmuidx(CPUState *cpu,
-                                                 target_ulong addr,
+                                                 vaddr addr,
                                                  uint16_t idxmap,
                                                  unsigned bits)
 {
 }
 static inline void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *cpu,
-                                                          target_ulong addr,
+                                                          vaddr addr,
                                                           uint16_t idxmap,
                                                           unsigned bits)
 {
 }
 static inline void
-tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *cpu, target_ulong addr,
+tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *cpu, vaddr addr,
                                               uint16_t idxmap, unsigned bits)
 {
 }
-static inline void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
-                                             target_ulong len, uint16_t idxmap,
+static inline void tlb_flush_range_by_mmuidx(CPUState *cpu, vaddr addr,
+                                             vaddr len, uint16_t idxmap,
                                              unsigned bits)
 {
 }
 static inline void tlb_flush_range_by_mmuidx_all_cpus(CPUState *cpu,
-                                                      target_ulong addr,
-                                                      target_ulong len,
+                                                      vaddr addr,
+                                                      vaddr len,
                                                       uint16_t idxmap,
                                                       unsigned bits)
 {
 }
 static inline void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
-                                                             target_ulong addr,
-                                                             target_long len,
+                                                             vaddr addr,
+                                                             vaddr len,
                                                              uint16_t idxmap,
                                                              unsigned bits)
 {
@@ -519,7 +519,7 @@ struct TranslationBlock {
      * Unwind information is taken as offsets from the page, to be
      * deposited into the "current" PC.
      */
-    target_ulong pc;
+    vaddr pc;
 
     /*
      * Target-specific data associated with the TranslationBlock, e.g.:
@@ -528,7 +528,7 @@ struct TranslationBlock {
      * s390x: instruction data for EXECUTE,
      * sparc: the next pc of the instruction queue (for delay slots).
      */
-    target_ulong cs_base;
+    vaddr cs_base;
 
     uint32_t flags; /* flags defining in which context the code was generated */
     uint32_t cflags;    /* compile flags */
@@ -809,7 +809,7 @@ static inline void mmap_lock(void) {}
 static inline void mmap_unlock(void) {}
 
 void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
-void tlb_set_dirty(CPUState *cpu, target_ulong vaddr);
+void tlb_set_dirty(CPUState *cpu, vaddr addr);
 
 MemoryRegionSection *
 address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
diff --git a/include/qemu/plugin-memory.h b/include/qemu/plugin-memory.h
index 6fd539022a..43165f2452 100644
--- a/include/qemu/plugin-memory.h
+++ b/include/qemu/plugin-memory.h
@@ -37,7 +37,7 @@ struct qemu_plugin_hwaddr {
  * It would only fail if not called from an instrumented memory access
  * which would be an abuse of the API.
  */
-bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
+bool tlb_plugin_lookup(CPUState *cpu, vaddr addr, int mmu_idx,
                        bool is_store, struct qemu_plugin_hwaddr *data);
 
 #endif /* PLUGIN_MEMORY_H */
-- 
2.39.1



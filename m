Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9469F5ADA27
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 22:26:56 +0200 (CEST)
Received: from localhost ([::1]:56254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVIgE-00051G-Cp
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 16:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVIch-00078n-EG
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 16:23:11 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:46957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVIca-0004X7-Hl
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 16:23:11 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so6242807wms.5
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 13:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=uv3AmsfqaiBxFKrD6o7IKN/LvALHRiu6GeaMCqWYFMA=;
 b=SFi3qY45XtIK+t7d/qdNmgjibWLyAxU7eBfpRWCZws3MoOuIz//f2dR+LFv6gcRcwC
 YMCqMW7BOzh/VdFLZa8m3G+shhZ0xG4f9C8Pd1RNGMSIEizLEfSlOuJzwcrj+dWp6qKZ
 gfRO05sXOuIkG3qG7uZExW12fZN8gk5HvO5fecgYhCTh45/SRfFPwY6bhd5vtGh/HfvL
 ou1MrPnwUvqeqWBkmjjTNC3shGHgWS+ghPxasrAn87TenW5yYpmHUHs/cLWvPBonYD9+
 l+r3HxWXeB1ZTGwkoEbguHgfuaKklyhGdRZ2mHmH9gbd8D4qBpC+9ji8QJq252wuvABv
 McOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uv3AmsfqaiBxFKrD6o7IKN/LvALHRiu6GeaMCqWYFMA=;
 b=J5oyEpjYTALLDOwKfPAp0SCrAtYzLkIqElVIc+Xd63wR2TKPJrE69Qa16n/5kWTWU5
 ZLbaMbHdg0huGB6CoTkP9PWirg31pQOGpupsJwVDkCa1Xi8sy7SX0T3+/QFbibVdbrrW
 pLJlYj1Bf4IB7U/yX/Yjv7mkPrXg2v1qtnq2JFQJWhGO+LvlRUX6IEdSxKUximxM4xFs
 peXhJA0EByuGgo6t+6Tm3/h6xzAKpHEtrKVpb8tJQmdLjxbAaOLBgIurfvk45p/Oz4TD
 jR8rUs/P9loC3aJZepg4280A2TtVXHGkEfxrfku8DTiSnFVVrOqJfniEj0IOJgcMPGpN
 3gaQ==
X-Gm-Message-State: ACgBeo13ICjpjjWiPuMrysWUQWvkRzzhf2AsSf/k1mD/UoMphe44ZHv1
 Zdt6+8CX+rPzCE5xhTtQQXpOkL87IMIxokfE
X-Google-Smtp-Source: AA6agR4fTiE5UAJ5aIG0fs1dirgW3kdtapcATQGwWk4kQZEXFSkny57Qn7T+7Hu8Pm8W9+C3QOPd8A==
X-Received: by 2002:a05:600c:1593:b0:3a6:36fc:842f with SMTP id
 r19-20020a05600c159300b003a636fc842fmr11921924wmf.52.1662409382763; 
 Mon, 05 Sep 2022 13:23:02 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a5d56ce000000b00226d238be98sm9472404wrw.82.2022.09.05.13.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 13:23:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	qemu-arm@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH v3 1/6] accel/tcg: Rename CPUIOTLBEntry to CPUTLBEntryFull
Date: Mon,  5 Sep 2022 21:22:54 +0100
Message-Id: <20220905202259.189852-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220905202259.189852-1-richard.henderson@linaro.org>
References: <20220905202259.189852-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

This structure will shortly contain more than just
data for accessing MMIO.  Rename the 'addr' member
to 'xlat_section' to more clearly indicate its purpose.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h    |  22 ++++----
 accel/tcg/cputlb.c         | 102 +++++++++++++++++++------------------
 target/arm/mte_helper.c    |  14 ++---
 target/arm/sve_helper.c    |   4 +-
 target/arm/translate-a64.c |   2 +-
 5 files changed, 73 insertions(+), 71 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index ba3cd32a1e..f70f54d850 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -108,6 +108,7 @@ typedef uint64_t target_ulong;
 #  endif
 # endif
 
+/* Minimalized TLB entry for use by TCG fast path. */
 typedef struct CPUTLBEntry {
     /* bit TARGET_LONG_BITS to TARGET_PAGE_BITS : virtual address
        bit TARGET_PAGE_BITS-1..4  : Nonzero for accesses that should not
@@ -131,14 +132,14 @@ typedef struct CPUTLBEntry {
 
 QEMU_BUILD_BUG_ON(sizeof(CPUTLBEntry) != (1 << CPU_TLB_ENTRY_BITS));
 
-/* The IOTLB is not accessed directly inline by generated TCG code,
- * so the CPUIOTLBEntry layout is not as critical as that of the
- * CPUTLBEntry. (This is also why we don't want to combine the two
- * structs into one.)
+/*
+ * The full TLB entry, which is not accessed by generated TCG code,
+ * so the layout is not as critical as that of CPUTLBEntry. This is
+ * also why we don't want to combine the two structs.
  */
-typedef struct CPUIOTLBEntry {
+typedef struct CPUTLBEntryFull {
     /*
-     * @addr contains:
+     * @xlat_section contains:
      *  - in the lower TARGET_PAGE_BITS, a physical section number
      *  - with the lower TARGET_PAGE_BITS masked off, an offset which
      *    must be added to the virtual address to obtain:
@@ -146,9 +147,9 @@ typedef struct CPUIOTLBEntry {
      *       number is PHYS_SECTION_NOTDIRTY or PHYS_SECTION_ROM)
      *     + the offset within the target MemoryRegion (otherwise)
      */
-    hwaddr addr;
+    hwaddr xlat_section;
     MemTxAttrs attrs;
-} CPUIOTLBEntry;
+} CPUTLBEntryFull;
 
 /*
  * Data elements that are per MMU mode, minus the bits accessed by
@@ -172,9 +173,8 @@ typedef struct CPUTLBDesc {
     size_t vindex;
     /* The tlb victim table, in two parts.  */
     CPUTLBEntry vtable[CPU_VTLB_SIZE];
-    CPUIOTLBEntry viotlb[CPU_VTLB_SIZE];
-    /* The iotlb.  */
-    CPUIOTLBEntry *iotlb;
+    CPUTLBEntryFull vfulltlb[CPU_VTLB_SIZE];
+    CPUTLBEntryFull *fulltlb;
 } CPUTLBDesc;
 
 /*
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 8fad2d9b83..4585d7c015 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -200,13 +200,13 @@ static void tlb_mmu_resize_locked(CPUTLBDesc *desc, CPUTLBDescFast *fast,
     }
 
     g_free(fast->table);
-    g_free(desc->iotlb);
+    g_free(desc->fulltlb);
 
     tlb_window_reset(desc, now, 0);
     /* desc->n_used_entries is cleared by the caller */
     fast->mask = (new_size - 1) << CPU_TLB_ENTRY_BITS;
     fast->table = g_try_new(CPUTLBEntry, new_size);
-    desc->iotlb = g_try_new(CPUIOTLBEntry, new_size);
+    desc->fulltlb = g_try_new(CPUTLBEntryFull, new_size);
 
     /*
      * If the allocations fail, try smaller sizes. We just freed some
@@ -215,7 +215,7 @@ static void tlb_mmu_resize_locked(CPUTLBDesc *desc, CPUTLBDescFast *fast,
      * allocations to fail though, so we progressively reduce the allocation
      * size, aborting if we cannot even allocate the smallest TLB we support.
      */
-    while (fast->table == NULL || desc->iotlb == NULL) {
+    while (fast->table == NULL || desc->fulltlb == NULL) {
         if (new_size == (1 << CPU_TLB_DYN_MIN_BITS)) {
             error_report("%s: %s", __func__, strerror(errno));
             abort();
@@ -224,9 +224,9 @@ static void tlb_mmu_resize_locked(CPUTLBDesc *desc, CPUTLBDescFast *fast,
         fast->mask = (new_size - 1) << CPU_TLB_ENTRY_BITS;
 
         g_free(fast->table);
-        g_free(desc->iotlb);
+        g_free(desc->fulltlb);
         fast->table = g_try_new(CPUTLBEntry, new_size);
-        desc->iotlb = g_try_new(CPUIOTLBEntry, new_size);
+        desc->fulltlb = g_try_new(CPUTLBEntryFull, new_size);
     }
 }
 
@@ -258,7 +258,7 @@ static void tlb_mmu_init(CPUTLBDesc *desc, CPUTLBDescFast *fast, int64_t now)
     desc->n_used_entries = 0;
     fast->mask = (n_entries - 1) << CPU_TLB_ENTRY_BITS;
     fast->table = g_new(CPUTLBEntry, n_entries);
-    desc->iotlb = g_new(CPUIOTLBEntry, n_entries);
+    desc->fulltlb = g_new(CPUTLBEntryFull, n_entries);
     tlb_mmu_flush_locked(desc, fast);
 }
 
@@ -299,7 +299,7 @@ void tlb_destroy(CPUState *cpu)
         CPUTLBDescFast *fast = &env_tlb(env)->f[i];
 
         g_free(fast->table);
-        g_free(desc->iotlb);
+        g_free(desc->fulltlb);
     }
 }
 
@@ -1219,7 +1219,7 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
 
         /* Evict the old entry into the victim tlb.  */
         copy_tlb_helper_locked(tv, te);
-        desc->viotlb[vidx] = desc->iotlb[index];
+        desc->vfulltlb[vidx] = desc->fulltlb[index];
         tlb_n_used_entries_dec(env, mmu_idx);
     }
 
@@ -1236,8 +1236,8 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
      * subtract here is that of the page base, and not the same as the
      * vaddr we add back in io_readx()/io_writex()/get_page_addr_code().
      */
-    desc->iotlb[index].addr = iotlb - vaddr_page;
-    desc->iotlb[index].attrs = attrs;
+    desc->fulltlb[index].xlat_section = iotlb - vaddr_page;
+    desc->fulltlb[index].attrs = attrs;
 
     /* Now calculate the new entry */
     tn.addend = addend - vaddr_page;
@@ -1329,7 +1329,7 @@ static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
     }
 }
 
-static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
+static uint64_t io_readx(CPUArchState *env, CPUTLBEntryFull *full,
                          int mmu_idx, target_ulong addr, uintptr_t retaddr,
                          MMUAccessType access_type, MemOp op)
 {
@@ -1341,9 +1341,9 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
     bool locked = false;
     MemTxResult r;
 
-    section = iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs);
+    section = iotlb_to_section(cpu, full->xlat_section, full->attrs);
     mr = section->mr;
-    mr_offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
+    mr_offset = (full->xlat_section & TARGET_PAGE_MASK) + addr;
     cpu->mem_io_pc = retaddr;
     if (!cpu->can_do_io) {
         cpu_io_recompile(cpu, retaddr);
@@ -1353,14 +1353,14 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
         qemu_mutex_lock_iothread();
         locked = true;
     }
-    r = memory_region_dispatch_read(mr, mr_offset, &val, op, iotlbentry->attrs);
+    r = memory_region_dispatch_read(mr, mr_offset, &val, op, full->attrs);
     if (r != MEMTX_OK) {
         hwaddr physaddr = mr_offset +
             section->offset_within_address_space -
             section->offset_within_region;
 
         cpu_transaction_failed(cpu, physaddr, addr, memop_size(op), access_type,
-                               mmu_idx, iotlbentry->attrs, r, retaddr);
+                               mmu_idx, full->attrs, r, retaddr);
     }
     if (locked) {
         qemu_mutex_unlock_iothread();
@@ -1370,8 +1370,8 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
 }
 
 /*
- * Save a potentially trashed IOTLB entry for later lookup by plugin.
- * This is read by tlb_plugin_lookup if the iotlb entry doesn't match
+ * Save a potentially trashed CPUTLBEntryFull for later lookup by plugin.
+ * This is read by tlb_plugin_lookup if the fulltlb entry doesn't match
  * because of the side effect of io_writex changing memory layout.
  */
 static void save_iotlb_data(CPUState *cs, hwaddr addr,
@@ -1385,7 +1385,7 @@ static void save_iotlb_data(CPUState *cs, hwaddr addr,
 #endif
 }
 
-static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
+static void io_writex(CPUArchState *env, CPUTLBEntryFull *full,
                       int mmu_idx, uint64_t val, target_ulong addr,
                       uintptr_t retaddr, MemOp op)
 {
@@ -1396,9 +1396,9 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
     bool locked = false;
     MemTxResult r;
 
-    section = iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs);
+    section = iotlb_to_section(cpu, full->xlat_section, full->attrs);
     mr = section->mr;
-    mr_offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
+    mr_offset = (full->xlat_section & TARGET_PAGE_MASK) + addr;
     if (!cpu->can_do_io) {
         cpu_io_recompile(cpu, retaddr);
     }
@@ -1408,20 +1408,20 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
      * The memory_region_dispatch may trigger a flush/resize
      * so for plugins we save the iotlb_data just in case.
      */
-    save_iotlb_data(cpu, iotlbentry->addr, section, mr_offset);
+    save_iotlb_data(cpu, full->xlat_section, section, mr_offset);
 
     if (!qemu_mutex_iothread_locked()) {
         qemu_mutex_lock_iothread();
         locked = true;
     }
-    r = memory_region_dispatch_write(mr, mr_offset, val, op, iotlbentry->attrs);
+    r = memory_region_dispatch_write(mr, mr_offset, val, op, full->attrs);
     if (r != MEMTX_OK) {
         hwaddr physaddr = mr_offset +
             section->offset_within_address_space -
             section->offset_within_region;
 
         cpu_transaction_failed(cpu, physaddr, addr, memop_size(op),
-                               MMU_DATA_STORE, mmu_idx, iotlbentry->attrs, r,
+                               MMU_DATA_STORE, mmu_idx, full->attrs, r,
                                retaddr);
     }
     if (locked) {
@@ -1468,9 +1468,10 @@ static bool victim_tlb_hit(CPUArchState *env, size_t mmu_idx, size_t index,
             copy_tlb_helper_locked(vtlb, &tmptlb);
             qemu_spin_unlock(&env_tlb(env)->c.lock);
 
-            CPUIOTLBEntry tmpio, *io = &env_tlb(env)->d[mmu_idx].iotlb[index];
-            CPUIOTLBEntry *vio = &env_tlb(env)->d[mmu_idx].viotlb[vidx];
-            tmpio = *io; *io = *vio; *vio = tmpio;
+            CPUTLBEntryFull *f1 = &env_tlb(env)->d[mmu_idx].fulltlb[index];
+            CPUTLBEntryFull *f2 = &env_tlb(env)->d[mmu_idx].vfulltlb[vidx];
+            CPUTLBEntryFull tmpf;
+            tmpf = *f1; *f1 = *f2; *f2 = tmpf;
             return true;
         }
     }
@@ -1483,9 +1484,9 @@ static bool victim_tlb_hit(CPUArchState *env, size_t mmu_idx, size_t index,
                  (ADDR) & TARGET_PAGE_MASK)
 
 static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
-                           CPUIOTLBEntry *iotlbentry, uintptr_t retaddr)
+                           CPUTLBEntryFull *full, uintptr_t retaddr)
 {
-    ram_addr_t ram_addr = mem_vaddr + iotlbentry->addr;
+    ram_addr_t ram_addr = mem_vaddr + full->xlat_section;
 
     trace_memory_notdirty_write_access(mem_vaddr, ram_addr, size);
 
@@ -1578,9 +1579,9 @@ int probe_access_flags(CPUArchState *env, target_ulong addr,
     /* Handle clean RAM pages.  */
     if (unlikely(flags & TLB_NOTDIRTY)) {
         uintptr_t index = tlb_index(env, mmu_idx, addr);
-        CPUIOTLBEntry *iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
+        CPUTLBEntryFull *full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
 
-        notdirty_write(env_cpu(env), addr, 1, iotlbentry, retaddr);
+        notdirty_write(env_cpu(env), addr, 1, full, retaddr);
         flags &= ~TLB_NOTDIRTY;
     }
 
@@ -1605,19 +1606,19 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
 
     if (unlikely(flags & (TLB_NOTDIRTY | TLB_WATCHPOINT))) {
         uintptr_t index = tlb_index(env, mmu_idx, addr);
-        CPUIOTLBEntry *iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
+        CPUTLBEntryFull *full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
 
         /* Handle watchpoints.  */
         if (flags & TLB_WATCHPOINT) {
             int wp_access = (access_type == MMU_DATA_STORE
                              ? BP_MEM_WRITE : BP_MEM_READ);
             cpu_check_watchpoint(env_cpu(env), addr, size,
-                                 iotlbentry->attrs, wp_access, retaddr);
+                                 full->attrs, wp_access, retaddr);
         }
 
         /* Handle clean RAM pages.  */
         if (flags & TLB_NOTDIRTY) {
-            notdirty_write(env_cpu(env), addr, 1, iotlbentry, retaddr);
+            notdirty_write(env_cpu(env), addr, 1, full, retaddr);
         }
     }
 
@@ -1674,7 +1675,7 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
  * should have just filled the TLB. The one corner case is io_writex
  * which can cause TLB flushes and potential resizing of the TLBs
  * losing the information we need. In those cases we need to recover
- * data from a copy of the iotlbentry. As long as this always occurs
+ * data from a copy of the CPUTLBEntryFull. As long as this always occurs
  * from the same thread (which a mem callback will be) this is safe.
  */
 
@@ -1689,11 +1690,12 @@ bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
     if (likely(tlb_hit(tlb_addr, addr))) {
         /* We must have an iotlb entry for MMIO */
         if (tlb_addr & TLB_MMIO) {
-            CPUIOTLBEntry *iotlbentry;
-            iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
+            CPUTLBEntryFull *full;
+            full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
             data->is_io = true;
-            data->v.io.section = iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs);
-            data->v.io.offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
+            data->v.io.section =
+                iotlb_to_section(cpu, full->xlat_section, full->attrs);
+            data->v.io.offset = (full->xlat_section & TARGET_PAGE_MASK) + addr;
         } else {
             data->is_io = false;
             data->v.ram.hostaddr = (void *)((uintptr_t)addr + tlbe->addend);
@@ -1801,7 +1803,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
 
     if (unlikely(tlb_addr & TLB_NOTDIRTY)) {
         notdirty_write(env_cpu(env), addr, size,
-                       &env_tlb(env)->d[mmu_idx].iotlb[index], retaddr);
+                       &env_tlb(env)->d[mmu_idx].fulltlb[index], retaddr);
     }
 
     return hostaddr;
@@ -1909,7 +1911,7 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
 
     /* Handle anything that isn't just a straight memory access.  */
     if (unlikely(tlb_addr & ~TARGET_PAGE_MASK)) {
-        CPUIOTLBEntry *iotlbentry;
+        CPUTLBEntryFull *full;
         bool need_swap;
 
         /* For anything that is unaligned, recurse through full_load.  */
@@ -1917,20 +1919,20 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
             goto do_unaligned_access;
         }
 
-        iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
+        full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
 
         /* Handle watchpoints.  */
         if (unlikely(tlb_addr & TLB_WATCHPOINT)) {
             /* On watchpoint hit, this will longjmp out.  */
             cpu_check_watchpoint(env_cpu(env), addr, size,
-                                 iotlbentry->attrs, BP_MEM_READ, retaddr);
+                                 full->attrs, BP_MEM_READ, retaddr);
         }
 
         need_swap = size > 1 && (tlb_addr & TLB_BSWAP);
 
         /* Handle I/O access.  */
         if (likely(tlb_addr & TLB_MMIO)) {
-            return io_readx(env, iotlbentry, mmu_idx, addr, retaddr,
+            return io_readx(env, full, mmu_idx, addr, retaddr,
                             access_type, op ^ (need_swap * MO_BSWAP));
         }
 
@@ -2245,12 +2247,12 @@ store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
      */
     if (unlikely(tlb_addr & TLB_WATCHPOINT)) {
         cpu_check_watchpoint(env_cpu(env), addr, size - size2,
-                             env_tlb(env)->d[mmu_idx].iotlb[index].attrs,
+                             env_tlb(env)->d[mmu_idx].fulltlb[index].attrs,
                              BP_MEM_WRITE, retaddr);
     }
     if (unlikely(tlb_addr2 & TLB_WATCHPOINT)) {
         cpu_check_watchpoint(env_cpu(env), page2, size2,
-                             env_tlb(env)->d[mmu_idx].iotlb[index2].attrs,
+                             env_tlb(env)->d[mmu_idx].fulltlb[index2].attrs,
                              BP_MEM_WRITE, retaddr);
     }
 
@@ -2314,7 +2316,7 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
 
     /* Handle anything that isn't just a straight memory access.  */
     if (unlikely(tlb_addr & ~TARGET_PAGE_MASK)) {
-        CPUIOTLBEntry *iotlbentry;
+        CPUTLBEntryFull *full;
         bool need_swap;
 
         /* For anything that is unaligned, recurse through byte stores.  */
@@ -2322,20 +2324,20 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
             goto do_unaligned_access;
         }
 
-        iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
+        full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
 
         /* Handle watchpoints.  */
         if (unlikely(tlb_addr & TLB_WATCHPOINT)) {
             /* On watchpoint hit, this will longjmp out.  */
             cpu_check_watchpoint(env_cpu(env), addr, size,
-                                 iotlbentry->attrs, BP_MEM_WRITE, retaddr);
+                                 full->attrs, BP_MEM_WRITE, retaddr);
         }
 
         need_swap = size > 1 && (tlb_addr & TLB_BSWAP);
 
         /* Handle I/O access.  */
         if (tlb_addr & TLB_MMIO) {
-            io_writex(env, iotlbentry, mmu_idx, val, addr, retaddr,
+            io_writex(env, full, mmu_idx, val, addr, retaddr,
                       op ^ (need_swap * MO_BSWAP));
             return;
         }
@@ -2347,7 +2349,7 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
 
         /* Handle clean RAM pages.  */
         if (tlb_addr & TLB_NOTDIRTY) {
-            notdirty_write(env_cpu(env), addr, size, iotlbentry, retaddr);
+            notdirty_write(env_cpu(env), addr, size, full, retaddr);
         }
 
         haddr = (void *)((uintptr_t)addr + entry->addend);
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index d11a8c70d0..fdd23ab3f8 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -106,7 +106,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
     return tags + index;
 #else
     uintptr_t index;
-    CPUIOTLBEntry *iotlbentry;
+    CPUTLBEntryFull *full;
     int in_page, flags;
     ram_addr_t ptr_ra;
     hwaddr ptr_paddr, tag_paddr, xlat;
@@ -129,7 +129,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
     assert(!(flags & TLB_INVALID_MASK));
 
     /*
-     * Find the iotlbentry for ptr.  This *must* be present in the TLB
+     * Find the CPUTLBEntryFull for ptr.  This *must* be present in the TLB
      * because we just found the mapping.
      * TODO: Perhaps there should be a cputlb helper that returns a
      * matching tlb entry + iotlb entry.
@@ -144,10 +144,10 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
         g_assert(tlb_hit(comparator, ptr));
     }
 # endif
-    iotlbentry = &env_tlb(env)->d[ptr_mmu_idx].iotlb[index];
+    full = &env_tlb(env)->d[ptr_mmu_idx].fulltlb[index];
 
     /* If the virtual page MemAttr != Tagged, access unchecked. */
-    if (!arm_tlb_mte_tagged(&iotlbentry->attrs)) {
+    if (!arm_tlb_mte_tagged(&full->attrs)) {
         return NULL;
     }
 
@@ -181,7 +181,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
         int wp = ptr_access == MMU_DATA_LOAD ? BP_MEM_READ : BP_MEM_WRITE;
         assert(ra != 0);
         cpu_check_watchpoint(env_cpu(env), ptr, ptr_size,
-                             iotlbentry->attrs, wp, ra);
+                             full->attrs, wp, ra);
     }
 
     /*
@@ -202,11 +202,11 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
     tag_paddr = ptr_paddr >> (LOG2_TAG_GRANULE + 1);
 
     /* Look up the address in tag space. */
-    tag_asi = iotlbentry->attrs.secure ? ARMASIdx_TagS : ARMASIdx_TagNS;
+    tag_asi = full->attrs.secure ? ARMASIdx_TagS : ARMASIdx_TagNS;
     tag_as = cpu_get_address_space(env_cpu(env), tag_asi);
     mr = address_space_translate(tag_as, tag_paddr, &xlat, NULL,
                                  tag_access == MMU_DATA_STORE,
-                                 iotlbentry->attrs);
+                                 full->attrs);
 
     /*
      * Note that @mr will never be NULL.  If there is nothing in the address
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index d6f7ef94fe..9cae8fd352 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5384,8 +5384,8 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
         g_assert(tlb_hit(comparator, addr));
 # endif
 
-        CPUIOTLBEntry *iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
-        info->attrs = iotlbentry->attrs;
+        CPUTLBEntryFull *full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
+        info->attrs = full->attrs;
     }
 #endif
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 163df8c615..b7787e7786 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14634,7 +14634,7 @@ static bool is_guarded_page(CPUARMState *env, DisasContext *s)
      * table entry even for that case.
      */
     return (tlb_hit(entry->addr_code, addr) &&
-            arm_tlb_bti_gp(&env_tlb(env)->d[mmu_idx].iotlb[index].attrs));
+            arm_tlb_bti_gp(&env_tlb(env)->d[mmu_idx].fulltlb[index].attrs));
 #endif
 }
 
-- 
2.34.1



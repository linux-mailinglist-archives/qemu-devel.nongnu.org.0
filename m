Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CACDEBE53F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 20:58:06 +0200 (CEST)
Received: from localhost ([::1]:56174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDCUH-0003a3-8r
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 14:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47181)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iDCIj-0001tH-VZ
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 14:46:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iDCIi-0004N4-3C
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 14:46:09 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:44313)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iDCIh-0004M7-RF
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 14:46:08 -0400
Received: by mail-pg1-x52a.google.com with SMTP id i14so142949pgt.11
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 11:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SSIp61nlyQIjm5GOge2E7ScAyXdbAUa4X76UCYWm8z8=;
 b=TLp7pkjrgsvLed37Ucz8vhb8EZ1g3IaFtw4atqWaiIQsQ9A5N1WZHD1+m8yt+uaYjK
 YKIjZy3YveQEpDx56YTAcM4xDtH8nw8QDJ7HcnLGlFWcPtPL1+zzXOdNmP5Aiiaau5xV
 Jgmvw5lT7EoPNpuV7nBFze3ohmtHBfn4QH8bCSvs1p8pISp8e9/IPwswlLoye7DS86pO
 7QBH1BQIDAif/sAsu0Z3FyeymemyUemHYJfYHMT7pDD4knlDSzyZcRz1VQ55aaptPCdP
 JE1higzFy0+RNrsoduik3YLcxfKfZ0i0mq2JzE08d1H7cb0Dduo8mD2EVjwpTEt6I1XQ
 G/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SSIp61nlyQIjm5GOge2E7ScAyXdbAUa4X76UCYWm8z8=;
 b=J5T7s4f3CmSArU/DOiuHL9DQbFJaRM2Kgzu0BTadeRvfvf8df3oO/pnpmpe8lHixLf
 OHq3t24SRvVTXKkOyFxrm7fPN70TNCHxuSrMhkZtrT6CpeFxaiSNcPhO9EQLht28+bue
 sDEuHvhkWwHXeu0RVmodFIal5NY9cYWm/CZV3fINOtsVloF/jE1NiEmGr37/z+/LAmPa
 KVs4KnpxjK24tdSqft6k+Aq4pphDaZGY2nBma3ncnqUU+qstxtRzCL7sRSSbiyhI90qb
 1zFK8GUINWAMDollf2+n8mCtKmw/1TyJgUDyla+WuQgpe/bN1lchItJ7aHUz0LfwiY5R
 dcjw==
X-Gm-Message-State: APjAAAXr92MUIEQcKMnpd6H6whRxM0O5+WvAPR0pUgSBJyGGRtiQdAlk
 7XIplV6ynnvDkqbr+KAe0m+6rWkAQic=
X-Google-Smtp-Source: APXvYqzHt7wN3JLTW4lEe6EDn8/n7K5G0fXTA676Z8kbAi0wzIPrFvvQdTah4GxdFPFLI83zLJ0w2Q==
X-Received: by 2002:a62:7c4d:: with SMTP id x74mr11307843pfc.95.1569437166398; 
 Wed, 25 Sep 2019 11:46:06 -0700 (PDT)
Received: from localhost.localdomain ([12.206.46.61])
 by smtp.gmail.com with ESMTPSA id l24sm6133229pff.151.2019.09.25.11.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 11:46:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/16] cputlb: Merge and move memory_notdirty_write_{prepare,
 complete}
Date: Wed, 25 Sep 2019 11:45:43 -0700
Message-Id: <20190925184548.30673-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190925184548.30673-1-richard.henderson@linaro.org>
References: <20190925184548.30673-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52a
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since 9458a9a1df1a, all readers of the dirty bitmaps wait
for the rcu lock, which means that they wait until the end
of any executing TranslationBlock.

As a consequence, there is no need for the actual access
to happen in between the _prepare and _complete.  Therefore,
we can improve things by merging the two functions into
notdirty_write and dropping the NotDirtyInfo structure.

In addition, the only users of notdirty_write are in cputlb.c,
so move the merged function there.  Pass in the CPUIOTLBEntry
from which the ram_addr_t may be computed.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memory-internal.h | 65 -----------------------------
 accel/tcg/cputlb.c             | 76 +++++++++++++++++++---------------
 exec.c                         | 44 --------------------
 3 files changed, 42 insertions(+), 143 deletions(-)

diff --git a/include/exec/memory-internal.h b/include/exec/memory-internal.h
index ef4fb92371..9fcc2af25c 100644
--- a/include/exec/memory-internal.h
+++ b/include/exec/memory-internal.h
@@ -49,70 +49,5 @@ void address_space_dispatch_free(AddressSpaceDispatch *d);
 
 void mtree_print_dispatch(struct AddressSpaceDispatch *d,
                           MemoryRegion *root);
-
-struct page_collection;
-
-/* Opaque struct for passing info from memory_notdirty_write_prepare()
- * to memory_notdirty_write_complete(). Callers should treat all fields
- * as private, with the exception of @active.
- *
- * @active is a field which is not touched by either the prepare or
- * complete functions, but which the caller can use if it wishes to
- * track whether it has called prepare for this struct and so needs
- * to later call the complete function.
- */
-typedef struct {
-    CPUState *cpu;
-    struct page_collection *pages;
-    ram_addr_t ram_addr;
-    vaddr mem_vaddr;
-    unsigned size;
-    bool active;
-} NotDirtyInfo;
-
-/**
- * memory_notdirty_write_prepare: call before writing to non-dirty memory
- * @ndi: pointer to opaque NotDirtyInfo struct
- * @cpu: CPU doing the write
- * @mem_vaddr: virtual address of write
- * @ram_addr: the ram address of the write
- * @size: size of write in bytes
- *
- * Any code which writes to the host memory corresponding to
- * guest RAM which has been marked as NOTDIRTY must wrap those
- * writes in calls to memory_notdirty_write_prepare() and
- * memory_notdirty_write_complete():
- *
- *  NotDirtyInfo ndi;
- *  memory_notdirty_write_prepare(&ndi, ....);
- *  ... perform write here ...
- *  memory_notdirty_write_complete(&ndi);
- *
- * These calls will ensure that we flush any TCG translated code for
- * the memory being written, update the dirty bits and (if possible)
- * remove the slowpath callback for writing to the memory.
- *
- * This must only be called if we are using TCG; it will assert otherwise.
- *
- * We may take locks in the prepare call, so callers must ensure that
- * they don't exit (via longjump or otherwise) without calling complete.
- *
- * This call must only be made inside an RCU critical section.
- * (Note that while we're executing a TCG TB we're always in an
- * RCU critical section, which is likely to be the case for callers
- * of these functions.)
- */
-void memory_notdirty_write_prepare(NotDirtyInfo *ndi,
-                                   CPUState *cpu,
-                                   vaddr mem_vaddr,
-                                   ram_addr_t ram_addr,
-                                   unsigned size);
-/**
- * memory_notdirty_write_complete: finish write to non-dirty memory
- * @ndi: pointer to the opaque NotDirtyInfo struct which was initialized
- * by memory_not_dirty_write_prepare().
- */
-void memory_notdirty_write_complete(NotDirtyInfo *ndi);
-
 #endif
 #endif
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 4f118d2cc9..3e91838519 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -33,6 +33,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/atomic.h"
 #include "qemu/atomic128.h"
+#include "translate-all.h"
 
 /* DEBUG defines, enable DEBUG_TLB_LOG to log to the CPU_LOG_MMU target */
 /* #define DEBUG_TLB */
@@ -1085,6 +1086,37 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
     return qemu_ram_addr_from_host_nofail(p);
 }
 
+static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
+                           CPUIOTLBEntry *iotlbentry, uintptr_t retaddr)
+{
+    ram_addr_t ram_addr = mem_vaddr + iotlbentry->addr;
+
+    trace_memory_notdirty_write_access(mem_vaddr, ram_addr, size);
+
+    if (!cpu_physical_memory_get_dirty_flag(ram_addr, DIRTY_MEMORY_CODE)) {
+        struct page_collection *pages
+            = page_collection_lock(ram_addr, ram_addr + size);
+
+        /* We require mem_io_pc in tb_invalidate_phys_page_range.  */
+        cpu->mem_io_pc = retaddr;
+
+        tb_invalidate_phys_page_fast(pages, ram_addr, size);
+        page_collection_unlock(pages);
+    }
+
+    /*
+     * Set both VGA and migration bits for simplicity and to remove
+     * the notdirty callback faster.
+     */
+    cpu_physical_memory_set_dirty_range(ram_addr, size, DIRTY_CLIENTS_NOCODE);
+
+    /* We remove the notdirty callback only if the code has been flushed. */
+    if (!cpu_physical_memory_is_clean(ram_addr)) {
+        trace_memory_notdirty_set_dirty(mem_vaddr);
+        tlb_set_dirty(cpu, mem_vaddr);
+    }
+}
+
 /*
  * Probe for whether the specified guest access is permitted. If it is not
  * permitted then an exception will be taken in the same way as if this
@@ -1204,8 +1236,7 @@ void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
 /* Probe for a read-modify-write atomic operation.  Do not allow unaligned
  * operations, or io operations to proceed.  Return the host address.  */
 static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
-                               TCGMemOpIdx oi, uintptr_t retaddr,
-                               NotDirtyInfo *ndi)
+                               TCGMemOpIdx oi, uintptr_t retaddr)
 {
     size_t mmu_idx = get_mmuidx(oi);
     uintptr_t index = tlb_index(env, mmu_idx, addr);
@@ -1265,12 +1296,9 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
 
     hostaddr = (void *)((uintptr_t)addr + tlbe->addend);
 
-    ndi->active = false;
     if (unlikely(tlb_addr & TLB_NOTDIRTY)) {
-        ndi->active = true;
-        memory_notdirty_write_prepare(ndi, env_cpu(env), addr,
-                                      qemu_ram_addr_from_host_nofail(hostaddr),
-                                      1 << s_bits);
+        notdirty_write(env_cpu(env), addr, 1 << s_bits,
+                       &env_tlb(env)->d[mmu_idx].iotlb[index], retaddr);
     }
 
     return hostaddr;
@@ -1641,28 +1669,13 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
             return;
         }
 
-        haddr = (void *)((uintptr_t)addr + entry->addend);
-
         /* Handle clean RAM pages.  */
         if (tlb_addr & TLB_NOTDIRTY) {
-            NotDirtyInfo ndi;
-
-            /* We require mem_io_pc in tb_invalidate_phys_page_range.  */
-            env_cpu(env)->mem_io_pc = retaddr;
-
-            memory_notdirty_write_prepare(&ndi, env_cpu(env), addr,
-                                          addr + iotlbentry->addr, size);
-
-            if (unlikely(need_swap)) {
-                store_memop(haddr, val, op ^ MO_BSWAP);
-            } else {
-                store_memop(haddr, val, op);
-            }
-
-            memory_notdirty_write_complete(&ndi);
-            return;
+            notdirty_write(env_cpu(env), addr, size, iotlbentry, retaddr);
         }
 
+        haddr = (void *)((uintptr_t)addr + entry->addend);
+
         /*
          * Keep these two store_memop separate to ensure that the compiler
          * is able to fold the entire function to a single instruction.
@@ -1793,14 +1806,9 @@ void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
 #define EXTRA_ARGS     , TCGMemOpIdx oi, uintptr_t retaddr
 #define ATOMIC_NAME(X) \
     HELPER(glue(glue(glue(atomic_ ## X, SUFFIX), END), _mmu))
-#define ATOMIC_MMU_DECLS NotDirtyInfo ndi
-#define ATOMIC_MMU_LOOKUP atomic_mmu_lookup(env, addr, oi, retaddr, &ndi)
-#define ATOMIC_MMU_CLEANUP                              \
-    do {                                                \
-        if (unlikely(ndi.active)) {                     \
-            memory_notdirty_write_complete(&ndi);       \
-        }                                               \
-    } while (0)
+#define ATOMIC_MMU_DECLS
+#define ATOMIC_MMU_LOOKUP atomic_mmu_lookup(env, addr, oi, retaddr)
+#define ATOMIC_MMU_CLEANUP
 
 #define DATA_SIZE 1
 #include "atomic_template.h"
@@ -1828,7 +1836,7 @@ void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
 #undef ATOMIC_MMU_LOOKUP
 #define EXTRA_ARGS         , TCGMemOpIdx oi
 #define ATOMIC_NAME(X)     HELPER(glue(glue(atomic_ ## X, SUFFIX), END))
-#define ATOMIC_MMU_LOOKUP  atomic_mmu_lookup(env, addr, oi, GETPC(), &ndi)
+#define ATOMIC_MMU_LOOKUP  atomic_mmu_lookup(env, addr, oi, GETPC())
 
 #define DATA_SIZE 1
 #include "atomic_template.h"
diff --git a/exec.c b/exec.c
index 961d7d6497..7d835b1a2b 100644
--- a/exec.c
+++ b/exec.c
@@ -2718,50 +2718,6 @@ ram_addr_t qemu_ram_addr_from_host(void *ptr)
     return block->offset + offset;
 }
 
-/* Called within RCU critical section. */
-void memory_notdirty_write_prepare(NotDirtyInfo *ndi,
-                          CPUState *cpu,
-                          vaddr mem_vaddr,
-                          ram_addr_t ram_addr,
-                          unsigned size)
-{
-    ndi->cpu = cpu;
-    ndi->ram_addr = ram_addr;
-    ndi->mem_vaddr = mem_vaddr;
-    ndi->size = size;
-    ndi->pages = NULL;
-
-    trace_memory_notdirty_write_access(mem_vaddr, ram_addr, size);
-
-    assert(tcg_enabled());
-    if (!cpu_physical_memory_get_dirty_flag(ram_addr, DIRTY_MEMORY_CODE)) {
-        ndi->pages = page_collection_lock(ram_addr, ram_addr + size);
-        tb_invalidate_phys_page_fast(ndi->pages, ram_addr, size);
-    }
-}
-
-/* Called within RCU critical section. */
-void memory_notdirty_write_complete(NotDirtyInfo *ndi)
-{
-    if (ndi->pages) {
-        assert(tcg_enabled());
-        page_collection_unlock(ndi->pages);
-        ndi->pages = NULL;
-    }
-
-    /* Set both VGA and migration bits for simplicity and to remove
-     * the notdirty callback faster.
-     */
-    cpu_physical_memory_set_dirty_range(ndi->ram_addr, ndi->size,
-                                        DIRTY_CLIENTS_NOCODE);
-    /* we remove the notdirty callback only if the code has been
-       flushed */
-    if (!cpu_physical_memory_is_clean(ndi->ram_addr)) {
-        trace_memory_notdirty_set_dirty(ndi->mem_vaddr);
-        tlb_set_dirty(ndi->cpu, ndi->mem_vaddr);
-    }
-}
-
 /* Generate a debug exception if a watchpoint has been hit.  */
 void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                           MemTxAttrs attrs, int flags, uintptr_t ra)
-- 
2.17.1



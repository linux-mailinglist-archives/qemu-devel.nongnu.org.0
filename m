Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014FEBA093
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Sep 2019 06:10:07 +0200 (CEST)
Received: from localhost ([::1]:45058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBtCH-00072r-Tk
	for lists+qemu-devel@lfdr.de; Sun, 22 Sep 2019 00:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40955)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iBsy3-0001qm-Uq
 for qemu-devel@nongnu.org; Sat, 21 Sep 2019 23:55:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iBsy1-0008JG-GW
 for qemu-devel@nongnu.org; Sat, 21 Sep 2019 23:55:23 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:34347)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iBsy1-0008Ip-7K
 for qemu-devel@nongnu.org; Sat, 21 Sep 2019 23:55:21 -0400
Received: by mail-pf1-x441.google.com with SMTP id b128so7003212pfa.1
 for <qemu-devel@nongnu.org>; Sat, 21 Sep 2019 20:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=49dRujykpdSXqDpMsXZ6b2BPb+ubAPTXZdHimZ2XaMo=;
 b=B6s6BW4WpagI+Iinjvq0hstwAHHDof3ua6qMfrz3QIHwv5KiIafB0vyc2gD/9AQaA8
 H47qXXMloGakgK5QH6B/d8/R9NJE18SPOgJS/LSayRX4Inr/JvS9L+GtB9SVmtlp+R+z
 AMPL8nvWTeZk1/pkNbFsb77TtQSymODuz2q1U1KJLWWGhsw05CW74Td6/vJdrr7Fc5Ig
 WCI/jLyWG0fhwG8C5LsiGK/h+bXwueRkDWCQTSwFhD5IlWTX9CLOwa3lRF2H4CiQNi1k
 QFmQv7UceEO6nrnNZFcagBRD48YksUi3q0ubmzbLGPU5oQh4JJFwQ8g/+JS/IBr9e1Pl
 pQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=49dRujykpdSXqDpMsXZ6b2BPb+ubAPTXZdHimZ2XaMo=;
 b=KKLhfbnc1lzsHc+w7PzkD8dqEDfTUds24+POmwGmUobV8pwIU6Kn1NC1kV3yP34pCA
 JKOMqhtvirViJ7hrExKZwC9psWBkHuwoAFtj9OWs4fQiLE+bgK6Y+ZuGcpwCRGTuNODF
 1j4a3TRR6X3Yr4zN2EhNOa16nMrjWHB5acZeV/j+9cYt5IVxXb6ZtpRRzk0N9UkDLrhy
 wWUgD5a0jD/pI8L+/jL0nsnLxh85co8hmfDsKEv16U0fsVflzQK1Qd+d0TQN8U15G8MR
 WY9rJCAwdr9F9qKQE0xbPEXM5PlIzDtohanBfatOzmjfJcqpnQKwa/IVK5I1LK6Utb2g
 1Mrg==
X-Gm-Message-State: APjAAAVqIxeQt7XaewoMzXAQteK27uR0s8NoFprrieMORkoMkjevqGpw
 joGrTZ+5hZr36uIoH/WDTjPk09AWdHM=
X-Google-Smtp-Source: APXvYqwNLW8esnopzsXANGX7MliCzhNlwb4zFgKUSg7BTSoAyVgkQTVliYJLRUo5vPV3IX/jHBJuaQ==
X-Received: by 2002:a63:6193:: with SMTP id
 v141mr23476545pgb.263.1569124519791; 
 Sat, 21 Sep 2019 20:55:19 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id z4sm6452921pjt.17.2019.09.21.20.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2019 20:55:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/20] cputlb: Merge and move
 memory_notdirty_write_{prepare, complete}
Date: Sat, 21 Sep 2019 20:54:53 -0700
Message-Id: <20190922035458.14879-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190922035458.14879-1-richard.henderson@linaro.org>
References: <20190922035458.14879-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, stefanha@redhat.com,
 david@redhat.com
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
index 1a839c0f82..6f685cb93a 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -33,6 +33,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/atomic.h"
 #include "qemu/atomic128.h"
+#include "translate-all.h"
 
 /* DEBUG defines, enable DEBUG_TLB_LOG to log to the CPU_LOG_MMU target */
 /* #define DEBUG_TLB */
@@ -1084,6 +1085,37 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
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
@@ -1203,8 +1235,7 @@ void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
 /* Probe for a read-modify-write atomic operation.  Do not allow unaligned
  * operations, or io operations to proceed.  Return the host address.  */
 static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
-                               TCGMemOpIdx oi, uintptr_t retaddr,
-                               NotDirtyInfo *ndi)
+                               TCGMemOpIdx oi, uintptr_t retaddr)
 {
     size_t mmu_idx = get_mmuidx(oi);
     uintptr_t index = tlb_index(env, mmu_idx, addr);
@@ -1264,12 +1295,9 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
 
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
@@ -1635,28 +1663,13 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
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
-            if (unlikely(tlb_addr & TLB_BSWAP)) {
-                direct_swap(haddr, val);
-            } else {
-                direct(haddr, val);
-            }
-
-            memory_notdirty_write_complete(&ndi);
-            return;
+            notdirty_write(env_cpu(env), addr, size, iotlbentry, retaddr);
         }
 
+        haddr = (void *)((uintptr_t)addr + entry->addend);
+
         if (unlikely(tlb_addr & TLB_BSWAP)) {
             direct_swap(haddr, val);
         } else {
@@ -1786,14 +1799,9 @@ void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
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
@@ -1821,7 +1829,7 @@ void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
 #undef ATOMIC_MMU_LOOKUP
 #define EXTRA_ARGS         , TCGMemOpIdx oi
 #define ATOMIC_NAME(X)     HELPER(glue(glue(atomic_ ## X, SUFFIX), END))
-#define ATOMIC_MMU_LOOKUP  atomic_mmu_lookup(env, addr, oi, GETPC(), &ndi)
+#define ATOMIC_MMU_LOOKUP  atomic_mmu_lookup(env, addr, oi, GETPC())
 
 #define DATA_SIZE 1
 #include "atomic_template.h"
diff --git a/exec.c b/exec.c
index 9c9cc811b3..090bcc05da 100644
--- a/exec.c
+++ b/exec.c
@@ -2684,50 +2684,6 @@ ram_addr_t qemu_ram_addr_from_host(void *ptr)
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



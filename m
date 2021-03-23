Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DE63462DD
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:30:09 +0100 (CET)
Received: from localhost ([::1]:42024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOiyu-0006k3-Es
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOis8-0006Vs-TP
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:23:08 -0400
Received: from mx2.suse.de ([195.135.220.15]:55062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOis5-0004ZQ-DI
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:23:08 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 332DAACBF;
 Tue, 23 Mar 2021 15:23:04 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v11 05/55] target/arm: tcg: split mte_helper user-only and
 sysemu code
Date: Tue, 23 Mar 2021 16:16:59 +0100
Message-Id: <20210323151749.21299-6-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323151749.21299-1-cfontana@suse.de>
References: <20210323151749.21299-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

allocation_tag_mem has a different implementation for
user-only and sysemu, so move the two implementations into
the dedicated subdirs.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/tcg/mte_helper.h        |  52 ++++++++
 target/arm/tcg/mte_helper.c        | 191 +----------------------------
 target/arm/tcg/sysemu/mte_helper.c | 159 ++++++++++++++++++++++++
 target/arm/tcg/user/mte_helper.c   |  57 +++++++++
 target/arm/tcg/sysemu/meson.build  |   1 +
 target/arm/tcg/user/meson.build    |   1 +
 6 files changed, 271 insertions(+), 190 deletions(-)
 create mode 100644 target/arm/tcg/mte_helper.h
 create mode 100644 target/arm/tcg/sysemu/mte_helper.c
 create mode 100644 target/arm/tcg/user/mte_helper.c

diff --git a/target/arm/tcg/mte_helper.h b/target/arm/tcg/mte_helper.h
new file mode 100644
index 0000000000..551f271048
--- /dev/null
+++ b/target/arm/tcg/mte_helper.h
@@ -0,0 +1,52 @@
+/*
+ * ARM v8.5-MemTag Operations
+ *
+ * Copyright (c) 2020 Linaro, Ltd.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef MTE_HELPER_H
+#define MTE_HELPER_H
+/**
+ * allocation_tag_mem:
+ * @env: the cpu environment
+ * @ptr_mmu_idx: the addressing regime to use for the virtual address
+ * @ptr: the virtual address for which to look up tag memory
+ * @ptr_access: the access to use for the virtual address
+ * @ptr_size: the number of bytes in the normal memory access
+ * @tag_access: the access to use for the tag memory
+ * @tag_size: the number of bytes in the tag memory access
+ * @ra: the return address for exception handling
+ *
+ * Our tag memory is formatted as a sequence of little-endian nibbles.
+ * That is, the byte at (addr >> (LOG2_TAG_GRANULE + 1)) contains two
+ * tags, with the tag at [3:0] for the lower addr and the tag at [7:4]
+ * for the higher addr.
+ *
+ * Here, resolve the physical address from the virtual address, and return
+ * a pointer to the corresponding tag byte.  Exit with exception if the
+ * virtual address is not accessible for @ptr_access.
+ *
+ * The @ptr_size and @tag_size values may not have an obvious relation
+ * due to the alignment of @ptr, and the number of tag checks required.
+ *
+ * If there is no tag storage corresponding to @ptr, return NULL.
+ */
+uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
+                            uint64_t ptr, MMUAccessType ptr_access,
+                            int ptr_size, MMUAccessType tag_access,
+                            int tag_size, uintptr_t ra);
+
+#endif /* MTE_HELPER_H */
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 0bbb9ec346..ea4196a162 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -26,7 +26,7 @@
 #include "exec/helper-proto.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
-
+#include "tcg/mte_helper.h"
 
 static int choose_nonexcluded_tag(int tag, int offset, uint16_t exclude)
 {
@@ -47,195 +47,6 @@ static int choose_nonexcluded_tag(int tag, int offset, uint16_t exclude)
     return tag;
 }
 
-/**
- * allocation_tag_mem:
- * @env: the cpu environment
- * @ptr_mmu_idx: the addressing regime to use for the virtual address
- * @ptr: the virtual address for which to look up tag memory
- * @ptr_access: the access to use for the virtual address
- * @ptr_size: the number of bytes in the normal memory access
- * @tag_access: the access to use for the tag memory
- * @tag_size: the number of bytes in the tag memory access
- * @ra: the return address for exception handling
- *
- * Our tag memory is formatted as a sequence of little-endian nibbles.
- * That is, the byte at (addr >> (LOG2_TAG_GRANULE + 1)) contains two
- * tags, with the tag at [3:0] for the lower addr and the tag at [7:4]
- * for the higher addr.
- *
- * Here, resolve the physical address from the virtual address, and return
- * a pointer to the corresponding tag byte.  Exit with exception if the
- * virtual address is not accessible for @ptr_access.
- *
- * The @ptr_size and @tag_size values may not have an obvious relation
- * due to the alignment of @ptr, and the number of tag checks required.
- *
- * If there is no tag storage corresponding to @ptr, return NULL.
- */
-static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
-                                   uint64_t ptr, MMUAccessType ptr_access,
-                                   int ptr_size, MMUAccessType tag_access,
-                                   int tag_size, uintptr_t ra)
-{
-#ifdef CONFIG_USER_ONLY
-    uint64_t clean_ptr = useronly_clean_ptr(ptr);
-    int flags = page_get_flags(clean_ptr);
-    uint8_t *tags;
-    uintptr_t index;
-
-    if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE : PAGE_READ))) {
-        /* SIGSEGV */
-        arm_cpu_tlb_fill(env_cpu(env), ptr, ptr_size, ptr_access,
-                         ptr_mmu_idx, false, ra);
-        g_assert_not_reached();
-    }
-
-    /* Require both MAP_ANON and PROT_MTE for the page. */
-    if (!(flags & PAGE_ANON) || !(flags & PAGE_MTE)) {
-        return NULL;
-    }
-
-    tags = page_get_target_data(clean_ptr);
-    if (tags == NULL) {
-        size_t alloc_size = TARGET_PAGE_SIZE >> (LOG2_TAG_GRANULE + 1);
-        tags = page_alloc_target_data(clean_ptr, alloc_size);
-        assert(tags != NULL);
-    }
-
-    index = extract32(ptr, LOG2_TAG_GRANULE + 1,
-                      TARGET_PAGE_BITS - LOG2_TAG_GRANULE - 1);
-    return tags + index;
-#else
-    uintptr_t index;
-    CPUIOTLBEntry *iotlbentry;
-    int in_page, flags;
-    ram_addr_t ptr_ra;
-    hwaddr ptr_paddr, tag_paddr, xlat;
-    MemoryRegion *mr;
-    ARMASIdx tag_asi;
-    AddressSpace *tag_as;
-    void *host;
-
-    /*
-     * Probe the first byte of the virtual address.  This raises an
-     * exception for inaccessible pages, and resolves the virtual address
-     * into the softmmu tlb.
-     *
-     * When RA == 0, this is for mte_probe1.  The page is expected to be
-     * valid.  Indicate to probe_access_flags no-fault, then assert that
-     * we received a valid page.
-     */
-    flags = probe_access_flags(env, ptr, ptr_access, ptr_mmu_idx,
-                               ra == 0, &host, ra);
-    assert(!(flags & TLB_INVALID_MASK));
-
-    /*
-     * Find the iotlbentry for ptr.  This *must* be present in the TLB
-     * because we just found the mapping.
-     * TODO: Perhaps there should be a cputlb helper that returns a
-     * matching tlb entry + iotlb entry.
-     */
-    index = tlb_index(env, ptr_mmu_idx, ptr);
-# ifdef CONFIG_DEBUG_TCG
-    {
-        CPUTLBEntry *entry = tlb_entry(env, ptr_mmu_idx, ptr);
-        target_ulong comparator = (ptr_access == MMU_DATA_LOAD
-                                   ? entry->addr_read
-                                   : tlb_addr_write(entry));
-        g_assert(tlb_hit(comparator, ptr));
-    }
-# endif
-    iotlbentry = &env_tlb(env)->d[ptr_mmu_idx].iotlb[index];
-
-    /* If the virtual page MemAttr != Tagged, access unchecked. */
-    if (!arm_tlb_mte_tagged(&iotlbentry->attrs)) {
-        return NULL;
-    }
-
-    /*
-     * If not backed by host ram, there is no tag storage: access unchecked.
-     * This is probably a guest os bug though, so log it.
-     */
-    if (unlikely(flags & TLB_MMIO)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "Page @ 0x%" PRIx64 " indicates Tagged Normal memory "
-                      "but is not backed by host ram\n", ptr);
-        return NULL;
-    }
-
-    /*
-     * The Normal memory access can extend to the next page.  E.g. a single
-     * 8-byte access to the last byte of a page will check only the last
-     * tag on the first page.
-     * Any page access exception has priority over tag check exception.
-     */
-    in_page = -(ptr | TARGET_PAGE_MASK);
-    if (unlikely(ptr_size > in_page)) {
-        void *ignore;
-        flags |= probe_access_flags(env, ptr + in_page, ptr_access,
-                                    ptr_mmu_idx, ra == 0, &ignore, ra);
-        assert(!(flags & TLB_INVALID_MASK));
-    }
-
-    /* Any debug exception has priority over a tag check exception. */
-    if (unlikely(flags & TLB_WATCHPOINT)) {
-        int wp = ptr_access == MMU_DATA_LOAD ? BP_MEM_READ : BP_MEM_WRITE;
-        assert(ra != 0);
-        cpu_check_watchpoint(env_cpu(env), ptr, ptr_size,
-                             iotlbentry->attrs, wp, ra);
-    }
-
-    /*
-     * Find the physical address within the normal mem space.
-     * The memory region lookup must succeed because TLB_MMIO was
-     * not set in the cputlb lookup above.
-     */
-    mr = memory_region_from_host(host, &ptr_ra);
-    tcg_debug_assert(mr != NULL);
-    tcg_debug_assert(memory_region_is_ram(mr));
-    ptr_paddr = ptr_ra;
-    do {
-        ptr_paddr += mr->addr;
-        mr = mr->container;
-    } while (mr);
-
-    /* Convert to the physical address in tag space.  */
-    tag_paddr = ptr_paddr >> (LOG2_TAG_GRANULE + 1);
-
-    /* Look up the address in tag space. */
-    tag_asi = iotlbentry->attrs.secure ? ARMASIdx_TagS : ARMASIdx_TagNS;
-    tag_as = cpu_get_address_space(env_cpu(env), tag_asi);
-    mr = address_space_translate(tag_as, tag_paddr, &xlat, NULL,
-                                 tag_access == MMU_DATA_STORE,
-                                 iotlbentry->attrs);
-
-    /*
-     * Note that @mr will never be NULL.  If there is nothing in the address
-     * space at @tag_paddr, the translation will return the unallocated memory
-     * region.  For our purposes, the result must be ram.
-     */
-    if (unlikely(!memory_region_is_ram(mr))) {
-        /* ??? Failure is a board configuration error. */
-        qemu_log_mask(LOG_UNIMP,
-                      "Tag Memory @ 0x%" HWADDR_PRIx " not found for "
-                      "Normal Memory @ 0x%" HWADDR_PRIx "\n",
-                      tag_paddr, ptr_paddr);
-        return NULL;
-    }
-
-    /*
-     * Ensure the tag memory is dirty on write, for migration.
-     * Tag memory can never contain code or display memory (vga).
-     */
-    if (tag_access == MMU_DATA_STORE) {
-        ram_addr_t tag_ra = memory_region_get_ram_addr(mr) + xlat;
-        cpu_physical_memory_set_dirty_flag(tag_ra, DIRTY_MEMORY_MIGRATION);
-    }
-
-    return memory_region_get_ram_ptr(mr) + xlat;
-#endif
-}
-
 uint64_t HELPER(irg)(CPUARMState *env, uint64_t rn, uint64_t rm)
 {
     uint16_t exclude = extract32(rm | env->cp15.gcr_el1, 0, 16);
diff --git a/target/arm/tcg/sysemu/mte_helper.c b/target/arm/tcg/sysemu/mte_helper.c
new file mode 100644
index 0000000000..d953369294
--- /dev/null
+++ b/target/arm/tcg/sysemu/mte_helper.c
@@ -0,0 +1,159 @@
+/*
+ * ARM v8.5-MemTag Operations - System Emulation
+ *
+ * Copyright (c) 2020 Linaro, Ltd.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "exec/exec-all.h"
+#include "exec/ram_addr.h"
+#include "tcg/mte_helper.h"
+
+uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
+                            uint64_t ptr, MMUAccessType ptr_access,
+                            int ptr_size, MMUAccessType tag_access,
+                            int tag_size, uintptr_t ra)
+{
+    uintptr_t index;
+    CPUIOTLBEntry *iotlbentry;
+    int in_page, flags;
+    ram_addr_t ptr_ra;
+    hwaddr ptr_paddr, tag_paddr, xlat;
+    MemoryRegion *mr;
+    ARMASIdx tag_asi;
+    AddressSpace *tag_as;
+    void *host;
+
+    /*
+     * Probe the first byte of the virtual address.  This raises an
+     * exception for inaccessible pages, and resolves the virtual address
+     * into the softmmu tlb.
+     *
+     * When RA == 0, this is for mte_probe1.  The page is expected to be
+     * valid.  Indicate to probe_access_flags no-fault, then assert that
+     * we received a valid page.
+     */
+    flags = probe_access_flags(env, ptr, ptr_access, ptr_mmu_idx,
+                               ra == 0, &host, ra);
+    assert(!(flags & TLB_INVALID_MASK));
+
+    /*
+     * Find the iotlbentry for ptr.  This *must* be present in the TLB
+     * because we just found the mapping.
+     * TODO: Perhaps there should be a cputlb helper that returns a
+     * matching tlb entry + iotlb entry.
+     */
+    index = tlb_index(env, ptr_mmu_idx, ptr);
+#ifdef CONFIG_DEBUG_TCG
+    {
+        CPUTLBEntry *entry = tlb_entry(env, ptr_mmu_idx, ptr);
+        target_ulong comparator = (ptr_access == MMU_DATA_LOAD
+                                   ? entry->addr_read
+                                   : tlb_addr_write(entry));
+        g_assert(tlb_hit(comparator, ptr));
+    }
+#endif
+    iotlbentry = &env_tlb(env)->d[ptr_mmu_idx].iotlb[index];
+
+    /* If the virtual page MemAttr != Tagged, access unchecked. */
+    if (!arm_tlb_mte_tagged(&iotlbentry->attrs)) {
+        return NULL;
+    }
+
+    /*
+     * If not backed by host ram, there is no tag storage: access unchecked.
+     * This is probably a guest os bug though, so log it.
+     */
+    if (unlikely(flags & TLB_MMIO)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Page @ 0x%" PRIx64 " indicates Tagged Normal memory "
+                      "but is not backed by host ram\n", ptr);
+        return NULL;
+    }
+
+    /*
+     * The Normal memory access can extend to the next page.  E.g. a single
+     * 8-byte access to the last byte of a page will check only the last
+     * tag on the first page.
+     * Any page access exception has priority over tag check exception.
+     */
+    in_page = -(ptr | TARGET_PAGE_MASK);
+    if (unlikely(ptr_size > in_page)) {
+        void *ignore;
+        flags |= probe_access_flags(env, ptr + in_page, ptr_access,
+                                    ptr_mmu_idx, ra == 0, &ignore, ra);
+        assert(!(flags & TLB_INVALID_MASK));
+    }
+
+    /* Any debug exception has priority over a tag check exception. */
+    if (unlikely(flags & TLB_WATCHPOINT)) {
+        int wp = ptr_access == MMU_DATA_LOAD ? BP_MEM_READ : BP_MEM_WRITE;
+        assert(ra != 0);
+        cpu_check_watchpoint(env_cpu(env), ptr, ptr_size,
+                             iotlbentry->attrs, wp, ra);
+    }
+
+    /*
+     * Find the physical address within the normal mem space.
+     * The memory region lookup must succeed because TLB_MMIO was
+     * not set in the cputlb lookup above.
+     */
+    mr = memory_region_from_host(host, &ptr_ra);
+    tcg_debug_assert(mr != NULL);
+    tcg_debug_assert(memory_region_is_ram(mr));
+    ptr_paddr = ptr_ra;
+    do {
+        ptr_paddr += mr->addr;
+        mr = mr->container;
+    } while (mr);
+
+    /* Convert to the physical address in tag space.  */
+    tag_paddr = ptr_paddr >> (LOG2_TAG_GRANULE + 1);
+
+    /* Look up the address in tag space. */
+    tag_asi = iotlbentry->attrs.secure ? ARMASIdx_TagS : ARMASIdx_TagNS;
+    tag_as = cpu_get_address_space(env_cpu(env), tag_asi);
+    mr = address_space_translate(tag_as, tag_paddr, &xlat, NULL,
+                                 tag_access == MMU_DATA_STORE,
+                                 iotlbentry->attrs);
+
+    /*
+     * Note that @mr will never be NULL.  If there is nothing in the address
+     * space at @tag_paddr, the translation will return the unallocated memory
+     * region.  For our purposes, the result must be ram.
+     */
+    if (unlikely(!memory_region_is_ram(mr))) {
+        /* ??? Failure is a board configuration error. */
+        qemu_log_mask(LOG_UNIMP,
+                      "Tag Memory @ 0x%" HWADDR_PRIx " not found for "
+                      "Normal Memory @ 0x%" HWADDR_PRIx "\n",
+                      tag_paddr, ptr_paddr);
+        return NULL;
+    }
+
+    /*
+     * Ensure the tag memory is dirty on write, for migration.
+     * Tag memory can never contain code or display memory (vga).
+     */
+    if (tag_access == MMU_DATA_STORE) {
+        ram_addr_t tag_ra = memory_region_get_ram_addr(mr) + xlat;
+        cpu_physical_memory_set_dirty_flag(tag_ra, DIRTY_MEMORY_MIGRATION);
+    }
+
+    return memory_region_get_ram_ptr(mr) + xlat;
+}
diff --git a/target/arm/tcg/user/mte_helper.c b/target/arm/tcg/user/mte_helper.c
new file mode 100644
index 0000000000..2c8b0e582d
--- /dev/null
+++ b/target/arm/tcg/user/mte_helper.c
@@ -0,0 +1,57 @@
+/*
+ * ARM v8.5-MemTag Operations - User-mode
+ *
+ * Copyright (c) 2020 Linaro, Ltd.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "tcg/mte_helper.h"
+
+uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
+                            uint64_t ptr, MMUAccessType ptr_access,
+                            int ptr_size, MMUAccessType tag_access,
+                            int tag_size, uintptr_t ra)
+{
+    uint64_t clean_ptr = useronly_clean_ptr(ptr);
+    int flags = page_get_flags(clean_ptr);
+    uint8_t *tags;
+    uintptr_t index;
+
+    if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE : PAGE_READ))) {
+        /* SIGSEGV */
+        arm_cpu_tlb_fill(env_cpu(env), ptr, ptr_size, ptr_access,
+                         ptr_mmu_idx, false, ra);
+        g_assert_not_reached();
+    }
+
+    /* Require both MAP_ANON and PROT_MTE for the page. */
+    if (!(flags & PAGE_ANON) || !(flags & PAGE_MTE)) {
+        return NULL;
+    }
+
+    tags = page_get_target_data(clean_ptr);
+    if (tags == NULL) {
+        size_t alloc_size = TARGET_PAGE_SIZE >> (LOG2_TAG_GRANULE + 1);
+        tags = page_alloc_target_data(clean_ptr, alloc_size);
+        assert(tags != NULL);
+    }
+
+    index = extract32(ptr, LOG2_TAG_GRANULE + 1,
+                      TARGET_PAGE_BITS - LOG2_TAG_GRANULE - 1);
+    return tags + index;
+}
diff --git a/target/arm/tcg/sysemu/meson.build b/target/arm/tcg/sysemu/meson.build
index bc11678a0a..fef41080ac 100644
--- a/target/arm/tcg/sysemu/meson.build
+++ b/target/arm/tcg/sysemu/meson.build
@@ -1,3 +1,4 @@
 
 arm_softmmu_ss.add(when: ['CONFIG_TCG','CONFIG_SOFTMMU'], if_true: files(
+  'mte_helper.c',
 ))
diff --git a/target/arm/tcg/user/meson.build b/target/arm/tcg/user/meson.build
index d70a51ea9a..2bdf37663d 100644
--- a/target/arm/tcg/user/meson.build
+++ b/target/arm/tcg/user/meson.build
@@ -1,3 +1,4 @@
 
 arm_user_ss.add(when: ['CONFIG_TCG','CONFIG_USER_ONLY'], if_true: files(
+  'mte_helper.c',
 ))
-- 
2.26.2



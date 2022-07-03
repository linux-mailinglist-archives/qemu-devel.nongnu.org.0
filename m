Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48A05645C6
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:26:53 +0200 (CEST)
Received: from localhost ([::1]:35024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7uwO-0001DM-G6
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uu9-0006EC-85
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:24:33 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uu6-0005na-Lk
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:24:32 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so10536190pjl.5
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DdLOiptFXL9CcnkCotyXYaThQ0hCVa+9TlUHODJFgEk=;
 b=VecQKocG1eKt0ihSygv1Rk7I8ZZdEo1pjTU903hoX144uKNnS9ciuF/CWSsMAHOgNv
 7h6Sb/YDUZy1qD/alplytzYFpx10HALTx54zzbXZ9NwJ/OemghMpJmF81ZhCXqosZ4Ow
 xS3Y0GQAIsSAhi9IxFNGy0AbAT7WBoZYRSkRDLxaxpLhz/MwhQR/8lpQxae+lLi60/ap
 N/nAoXykVzZwzSLfQGCpS65T4o1cv3STXyx+bADTGuEC1lvF+kTnSckfsSC+NBSp1RAp
 GpVBwmbY+j98//xEaFMRfGC73oL76ct1xjv6vSpI/We+Q2aSZxDctGr7nLkm01yDep8V
 PLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DdLOiptFXL9CcnkCotyXYaThQ0hCVa+9TlUHODJFgEk=;
 b=l5f4bYie4YaPnZA4THBCuhsxGSillU32nWg5eBiWvlYCHsRhhpHhH5dQRE6pKmJJvi
 10Zv+xo2/OYzzje26G7/+aAaNNDBm2NE1Dgw3h8FN0wDNZ0no7YyC2mZTgfaMuB3TEYh
 jpGRkmjnhtOKROcuBBtUoRjO8qFdY2QLoek+zPF43uONe7t4wy50mn3n4VbWThZjZvSS
 ql6QXS+2gXA54CODaPbOoxKQZ1QM7lki7TMD6bB4BTDUtIssXztLTsHM9eCF2ZVNWSnJ
 Go8Xala9Yqog5eUtX3yVA2uxn/duE7fJISfWOl6zJqaIDuBcVluxhdO+y88n4HTbWfqc
 kPpw==
X-Gm-Message-State: AJIora/OX6JDa7dsvkcCUz/+p2CENXIOLTiV8sYnjmMkkNa3xYIqm+zb
 ShXeRQEaIo3rYb+DpDQ3HSXgzaPc5CzYKMZ2
X-Google-Smtp-Source: AGRyM1tAy43OfzDQlqcj7I439obAjKTJHZbWibALUcl8MjhFrCNtGeTXtBrOk57JQ2onJ0sy1u2UYg==
X-Received: by 2002:a17:90b:3ec7:b0:1ed:ded:abd1 with SMTP id
 rm7-20020a17090b3ec700b001ed0dedabd1mr26943209pjb.56.1656836669229; 
 Sun, 03 Jul 2022 01:24:29 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:24:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/62] accel/tcg: Introduce PageEntryExtra
Date: Sun,  3 Jul 2022 13:53:18 +0530
Message-Id: <20220703082419.770989-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Add an optional structure, controlled by TARGET_PAGE_ENTRY_EXTRA,
that allows arbitrary extra data to be saved in the TLB for a
given page.  Set it with tlb_set_page_with_extra() and fetch it
with probe_access_extra().

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h |  5 +++
 include/exec/exec-all.h | 26 +++++++++++++--
 include/qemu/typedefs.h |  1 +
 accel/tcg/cputlb.c      | 73 ++++++++++++++++++++++++++++++-----------
 4 files changed, 84 insertions(+), 21 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index ba3cd32a1e..f14586e219 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -76,6 +76,10 @@ typedef uint64_t target_ulong;
 
 #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 
+#ifndef TARGET_PAGE_ENTRY_EXTRA
+struct PageEntryExtra { };
+#endif
+
 /* use a fully associative victim tlb of 8 entries */
 #define CPU_VTLB_SIZE 8
 
@@ -148,6 +152,7 @@ typedef struct CPUIOTLBEntry {
      */
     hwaddr addr;
     MemTxAttrs attrs;
+    PageEntryExtra extra;
 } CPUIOTLBEntry;
 
 /*
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 311e5fb422..2c036de3d8 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -259,11 +259,12 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
                                                unsigned bits);
 
 /**
- * tlb_set_page_with_attrs:
+ * tlb_set_page_with_extra:
  * @cpu: CPU to add this TLB entry for
  * @vaddr: virtual address of page to add entry for
  * @paddr: physical address of the page
  * @attrs: memory transaction attributes
+ * @extra: cpu specific extra information
  * @prot: access permissions (PAGE_READ/PAGE_WRITE/PAGE_EXEC bits)
  * @mmu_idx: MMU index to insert TLB entry for
  * @size: size of the page in bytes
@@ -279,11 +280,25 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
  * At most one entry for a given virtual address is permitted. Only a
  * single TARGET_PAGE_SIZE region is mapped; the supplied @size is only
  * used by tlb_flush_page.
+ *
+ * The @extra information is target-specific, and may be retrieved
+ * by calling probe_access_extra().
+ */
+void tlb_set_page_with_extra(CPUState *cpu, target_ulong vaddr, hwaddr paddr,
+                             MemTxAttrs attrs, PageEntryExtra extra,
+                             int prot, int mmu_idx, target_ulong size);
+
+/**
+ * tlb_set_page_with_attrs:
+ *
+ * This function is equivalent to calling tlb_set_page_with_extra()
+ * with an @extra argument of all zeros.
  */
 void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
                              hwaddr paddr, MemTxAttrs attrs,
                              int prot, int mmu_idx, target_ulong size);
-/* tlb_set_page:
+/**
+ * tlb_set_page:
  *
  * This function is equivalent to calling tlb_set_page_with_attrs()
  * with an @attrs argument of MEMTXATTRS_UNSPECIFIED. It's provided
@@ -435,6 +450,13 @@ int probe_access_flags(CPUArchState *env, target_ulong addr,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t retaddr);
 
+#ifdef CONFIG_SOFTMMU
+int probe_access_extra(CPUArchState *env, target_ulong addr,
+                       MMUAccessType access_type, int mmu_idx,
+                       bool nonfault, void **phost, MemTxAttrs *pattrs,
+                       PageEntryExtra *pextra, uintptr_t retaddr);
+#endif
+
 #define CODE_GEN_ALIGN           16 /* must be >= of the size of a icache line */
 
 /* Estimated block size for TB allocation.  */
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 42f4ceb701..a4de3bb07c 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -82,6 +82,7 @@ typedef struct NodeInfo NodeInfo;
 typedef struct NumaNodeMem NumaNodeMem;
 typedef struct Object Object;
 typedef struct ObjectClass ObjectClass;
+typedef struct PageEntryExtra PageEntryExtra;
 typedef struct PCIBridge PCIBridge;
 typedef struct PCIBus PCIBus;
 typedef struct PCIDevice PCIDevice;
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index f90f4312ea..05555961c9 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1095,16 +1095,21 @@ static void tlb_add_large_page(CPUArchState *env, int mmu_idx,
     env_tlb(env)->d[mmu_idx].large_page_mask = lp_mask;
 }
 
-/* Add a new TLB entry. At most one entry for a given virtual address
+/*
+ * Add a new TLB entry. At most one entry for a given virtual address
  * is permitted. Only a single TARGET_PAGE_SIZE region is mapped, the
  * supplied size is only used by tlb_flush_page.
  *
  * Called from TCG-generated code, which is under an RCU read-side
  * critical section.
+ *
+ * Returns a pointer to the iotlb entry, with env_tlb(env)->c.lock
+ * still locked, for final additions to the iotlb entry.  The caller
+ * must unlock the lock.
  */
-void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
-                             hwaddr paddr, MemTxAttrs attrs, int prot,
-                             int mmu_idx, target_ulong size)
+void tlb_set_page_with_extra(CPUState *cpu, target_ulong vaddr, hwaddr paddr,
+                             MemTxAttrs attrs, PageEntryExtra extra,
+                             int prot, int mmu_idx, target_ulong size)
 {
     CPUArchState *env = cpu->env_ptr;
     CPUTLB *tlb = env_tlb(env);
@@ -1238,6 +1243,7 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
      */
     desc->iotlb[index].addr = iotlb - vaddr_page;
     desc->iotlb[index].attrs = attrs;
+    desc->iotlb[index].extra = extra;
 
     /* Now calculate the new entry */
     tn.addend = addend - vaddr_page;
@@ -1272,7 +1278,23 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
     qemu_spin_unlock(&tlb->c.lock);
 }
 
-/* Add a new TLB entry, but without specifying the memory
+/*
+ * Add a new TLB entry, specifying the memory transaction
+ * attributes to be used.
+ */
+void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
+                             hwaddr paddr, MemTxAttrs attrs, int prot,
+                             int mmu_idx, target_ulong size)
+{
+    PageEntryExtra extra;
+
+    memset(&extra, 0, sizeof(extra));
+    tlb_set_page_with_extra(cpu, vaddr, paddr, attrs, extra,
+                            prot, mmu_idx, size);
+}
+
+/*
+ * Add a new TLB entry, but without specifying the memory
  * transaction attributes to be used.
  */
 void tlb_set_page(CPUState *cpu, target_ulong vaddr,
@@ -1633,25 +1655,38 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     return flags;
 }
 
+int probe_access_extra(CPUArchState *env, target_ulong addr,
+                       MMUAccessType access_type, int mmu_idx,
+                       bool nonfault, void **phost, MemTxAttrs *pattrs,
+                       PageEntryExtra *pextra, uintptr_t retaddr)
+{
+    int flags = probe_access_internal(env, addr, 0, access_type, mmu_idx,
+                                      nonfault, phost, retaddr);
+
+    if (likely(!(flags & TLB_INVALID_MASK))) {
+        uintptr_t index = tlb_index(env, mmu_idx, addr);
+        CPUIOTLBEntry *iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
+
+        /* Handle clean RAM pages.  */
+        if (unlikely(flags & TLB_NOTDIRTY)) {
+            notdirty_write(env_cpu(env), addr, 1, iotlbentry, retaddr);
+            flags &= ~TLB_NOTDIRTY;
+        }
+        *pattrs = iotlbentry->attrs;
+        *pextra = iotlbentry->extra;
+    }
+    return flags;
+}
+
 int probe_access_flags(CPUArchState *env, target_ulong addr,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t retaddr)
 {
-    int flags;
+    MemTxAttrs attrs;
+    PageEntryExtra extra;
 
-    flags = probe_access_internal(env, addr, 0, access_type, mmu_idx,
-                                  nonfault, phost, retaddr);
-
-    /* Handle clean RAM pages.  */
-    if (unlikely(flags & TLB_NOTDIRTY)) {
-        uintptr_t index = tlb_index(env, mmu_idx, addr);
-        CPUIOTLBEntry *iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
-
-        notdirty_write(env_cpu(env), addr, 1, iotlbentry, retaddr);
-        flags &= ~TLB_NOTDIRTY;
-    }
-
-    return flags;
+    return probe_access_extra(env, addr, access_type, mmu_idx, nonfault,
+                              phost, &attrs, &extra, retaddr);
 }
 
 void *probe_access(CPUArchState *env, target_ulong addr, int size,
-- 
2.34.1



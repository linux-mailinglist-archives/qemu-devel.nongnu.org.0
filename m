Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5536A116C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:46:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIRa-0002n2-C7; Thu, 23 Feb 2023 15:43:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRY-0002m1-2w
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:43:56 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRW-0007QW-0c
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:43:55 -0500
Received: by mail-pl1-x633.google.com with SMTP id q11so14829581plx.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 12:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z2QI1lNn/XT+gr65A4/6/WrKy8DpP4zP5U+ng+Laukk=;
 b=Ir61O+kRlzD86S9OzSOcNrV234gkeqaFPvClRj8oAU8mVuJ15pOwSKp9TQIEl+e03f
 H6Zz+RX79irxVD/EQhgHMwPyEXvy1/Q5va/GVktGRgSBP2b/4bY6iGPGuOaWVTYVKl6O
 OGag/vsgIowzzKvOc1JjpuiFVft2JUlV2IIDtfsbWjKNsAfn/vZouW5fUyD2sHQhYc2L
 Y28+myKM8KzxkWKLogfBopGzH89KmxUZxCRcS5Ss0vce2Tb6TqtnmykrOEwS0VLJREH4
 TgK4mpDVhbJYRzt1gms72VAgQjBUrL5gjWloKBnS0rlhlwE4q+ywrqkI+HbsFL2vt2ze
 zDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z2QI1lNn/XT+gr65A4/6/WrKy8DpP4zP5U+ng+Laukk=;
 b=eehiSZhxdjbTIq4kP3xgLqgxOq2UvbgsRCyJE2uMYnBniUaA943sYMab6Gtc6Csjlh
 0K8BBcAWC41Ap+jQZb54jOCpIM6E+TdYhTqM57CdAMR5GjemJilMyKsMlIZ/UZDY4zUN
 l1KtOYFDWajPA/bQZJILjTkIZP9DvGR10gX5BVMgFpHHBvk8eE1LoT5K0ZQNQ79Lz1Lr
 iRaJsxQnSmmCOZ6+NTUuXhpWWpY0qlLCwwHMcZnMDrsXbW8a0GpWmdRR1+udUY1aVaTm
 uL8pEsXZlT4DjAtBcJmJT9fGMkkCvcB3vDp4HFRwDrwVGQ6LPzqNeQa2Ojw5udC57wfJ
 1pZw==
X-Gm-Message-State: AO0yUKVLE8nDiNqUL7aRVdKND9qAqB2mHLWJ/qVHjfv9GtM+TzjpvSP1
 9xg36FQTJ1yOirBVB/ggBgfctS0mmca2DEzx7ww=
X-Google-Smtp-Source: AK7set/QF5I9sB5ic67t8WOmIMP54WTifLb4BPeDscQYSN1/jGu/n0CZR1ZePKdfkWwx48+xjM3UWA==
X-Received: by 2002:a05:6a20:6926:b0:cb:85eb:611c with SMTP id
 q38-20020a056a20692600b000cb85eb611cmr13174475pzj.29.1677185032531; 
 Thu, 23 Feb 2023 12:43:52 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 e187-20020a6369c4000000b004b1fef0bf16sm5992850pgc.73.2023.02.23.12.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:43:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 03/13] accel/tcg: Store some tlb flags in CPUTLBEntryFull
Date: Thu, 23 Feb 2023 10:43:32 -1000
Message-Id: <20230223204342.1093632-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223204342.1093632-1-richard.henderson@linaro.org>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We have run out of bits we can use within the CPUTLBEntry comparators,
as TLB_FLAGS_MASK cannot overlap alignment.

Store slow_flags[] in CPUTLBEntryFull, and merge with the flags from
the comparator.  A new TLB_FORCE_SLOW bit is set within the comparator
as an indication that the slow path must be used.

Move TLB_BSWAP to TLB_SLOW_FLAGS_MASK.  Since we are out of bits,
we cannot create a new bit without moving an old one.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h  | 21 ++++++++--
 include/exec/cpu-defs.h |  6 +++
 accel/tcg/cputlb.c      | 93 ++++++++++++++++++++++++-----------------
 3 files changed, 77 insertions(+), 43 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 2eb1176538..080cb3112e 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -380,17 +380,30 @@ CPUArchState *cpu_copy(CPUArchState *env);
 #define TLB_MMIO            (1 << (TARGET_PAGE_BITS_MIN - 3))
 /* Set if TLB entry contains a watchpoint.  */
 #define TLB_WATCHPOINT      (1 << (TARGET_PAGE_BITS_MIN - 4))
-/* Set if TLB entry requires byte swap.  */
-#define TLB_BSWAP           (1 << (TARGET_PAGE_BITS_MIN - 5))
+/* Set if the slow path must be used; more flags in CPUTLBEntryFull. */
+#define TLB_FORCE_SLOW      (1 << (TARGET_PAGE_BITS_MIN - 5))
 /* Set if TLB entry writes ignored.  */
 #define TLB_DISCARD_WRITE   (1 << (TARGET_PAGE_BITS_MIN - 6))
 
-/* Use this mask to check interception with an alignment mask
+/*
+ * Use this mask to check interception with an alignment mask
  * in a TCG backend.
  */
 #define TLB_FLAGS_MASK \
     (TLB_INVALID_MASK | TLB_NOTDIRTY | TLB_MMIO \
-    | TLB_WATCHPOINT | TLB_BSWAP | TLB_DISCARD_WRITE)
+    | TLB_WATCHPOINT | TLB_FORCE_SLOW | TLB_DISCARD_WRITE)
+
+/*
+ * Flags stored in CPUTLBEntryFull.slow_flags[x].
+ * TLB_FORCE_SLOW must be set in CPUTLBEntry.addr_idx[x].
+ */
+/* Set if TLB entry requires byte swap.  */
+#define TLB_BSWAP            (1 << 0)
+
+#define TLB_SLOW_FLAGS_MASK  TLB_BSWAP
+
+/* The two sets of flags must not overlap. */
+QEMU_BUILD_BUG_ON(TLB_FLAGS_MASK & TLB_SLOW_FLAGS_MASK);
 
 /**
  * tlb_hit_page: return true if page aligned @addr is a hit against the
diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 7ce3bcb06b..ef10c625d4 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -170,6 +170,12 @@ typedef struct CPUTLBEntryFull {
     /* @lg_page_size contains the log2 of the page size. */
     uint8_t lg_page_size;
 
+    /*
+     * Additional tlb flags for use by the slow path. If non-zero,
+     * the corresponding CPUTLBEntry comparator must have TLB_FORCE_SLOW.
+     */
+    uint8_t slow_flags[3];
+
     /*
      * Allow target-specific additions to this structure.
      * This may be used to cache items from the guest cpu
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 169adc0262..e9848b3ab6 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1106,6 +1106,24 @@ static void tlb_add_large_page(CPUArchState *env, int mmu_idx,
     env_tlb(env)->d[mmu_idx].large_page_mask = lp_mask;
 }
 
+static inline void tlb_set_compare(CPUTLBEntryFull *full, CPUTLBEntry *ent,
+                                   target_ulong address, int flags,
+                                   MMUAccessType access_type, bool enable)
+{
+    if (enable) {
+        address |= flags & TLB_FLAGS_MASK;
+        flags &= TLB_SLOW_FLAGS_MASK;
+        if (flags) {
+            address |= TLB_FORCE_SLOW;
+        }
+    } else {
+        address = -1;
+        flags = 0;
+    }
+    ent->addr_idx[access_type] = address;
+    full->slow_flags[access_type] = flags;
+}
+
 /*
  * Add a new TLB entry. At most one entry for a given virtual address
  * is permitted. Only a single TARGET_PAGE_SIZE region is mapped, the
@@ -1121,9 +1139,7 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
     CPUTLB *tlb = env_tlb(env);
     CPUTLBDesc *desc = &tlb->d[mmu_idx];
     MemoryRegionSection *section;
-    unsigned int index;
-    target_ulong address;
-    target_ulong write_address;
+    unsigned int index, read_flags, write_flags;
     uintptr_t addend;
     CPUTLBEntry *te, tn;
     hwaddr iotlb, xlat, sz, paddr_page;
@@ -1152,13 +1168,13 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
               " prot=%x idx=%d\n",
               vaddr, full->phys_addr, prot, mmu_idx);
 
-    address = vaddr_page;
+    read_flags = 0;
     if (full->lg_page_size < TARGET_PAGE_BITS) {
         /* Repeat the MMU check and TLB fill on every access.  */
-        address |= TLB_INVALID_MASK;
+        read_flags |= TLB_INVALID_MASK;
     }
     if (full->attrs.byte_swap) {
-        address |= TLB_BSWAP;
+        read_flags |= TLB_BSWAP;
     }
 
     is_ram = memory_region_is_ram(section->mr);
@@ -1172,7 +1188,7 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
         addend = 0;
     }
 
-    write_address = address;
+    write_flags = read_flags;
     if (is_ram) {
         iotlb = memory_region_get_ram_addr(section->mr) + xlat;
         /*
@@ -1181,9 +1197,9 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
          */
         if (prot & PAGE_WRITE) {
             if (section->readonly) {
-                write_address |= TLB_DISCARD_WRITE;
+                write_flags |= TLB_DISCARD_WRITE;
             } else if (cpu_physical_memory_is_clean(iotlb)) {
-                write_address |= TLB_NOTDIRTY;
+                write_flags |= TLB_NOTDIRTY;
             }
         }
     } else {
@@ -1194,9 +1210,9 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
          * Reads to romd devices go through the ram_ptr found above,
          * but of course reads to I/O must go through MMIO.
          */
-        write_address |= TLB_MMIO;
+        write_flags |= TLB_MMIO;
         if (!is_romd) {
-            address = write_address;
+            read_flags = write_flags;
         }
     }
 
@@ -1249,36 +1265,27 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
      * vaddr we add back in io_readx()/io_writex()/get_page_addr_code().
      */
     desc->fulltlb[index] = *full;
-    desc->fulltlb[index].xlat_section = iotlb - vaddr_page;
-    desc->fulltlb[index].phys_addr = paddr_page;
+    full = &desc->fulltlb[index];
+    full->xlat_section = iotlb - vaddr_page;
+    full->phys_addr = paddr_page;
 
     /* Now calculate the new entry */
     tn.addend = addend - vaddr_page;
-    if (prot & PAGE_READ) {
-        tn.addr_read = address;
-        if (wp_flags & BP_MEM_READ) {
-            tn.addr_read |= TLB_WATCHPOINT;
-        }
-    } else {
-        tn.addr_read = -1;
-    }
 
-    if (prot & PAGE_EXEC) {
-        tn.addr_code = address;
-    } else {
-        tn.addr_code = -1;
-    }
+    tlb_set_compare(full, &tn, vaddr_page, read_flags,
+                    MMU_INST_FETCH, prot & PAGE_EXEC);
 
-    tn.addr_write = -1;
-    if (prot & PAGE_WRITE) {
-        tn.addr_write = write_address;
-        if (prot & PAGE_WRITE_INV) {
-            tn.addr_write |= TLB_INVALID_MASK;
-        }
-        if (wp_flags & BP_MEM_WRITE) {
-            tn.addr_write |= TLB_WATCHPOINT;
-        }
+    if (wp_flags & BP_MEM_READ) {
+        read_flags |= TLB_WATCHPOINT;
     }
+    tlb_set_compare(full, &tn, vaddr_page, read_flags,
+                    MMU_DATA_LOAD, prot & PAGE_READ);
+
+    if (wp_flags & BP_MEM_WRITE) {
+        write_flags |= TLB_WATCHPOINT;
+    }
+    tlb_set_compare(full, &tn, vaddr_page, write_flags, MMU_DATA_STORE,
+                    (prot & PAGE_WRITE) && !(prot & PAGE_WRITE_INV));
 
     copy_tlb_helper_locked(te, &tn);
     tlb_n_used_entries_inc(env, mmu_idx);
@@ -1508,7 +1515,8 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
     target_ulong tlb_addr = tlb_read_idx(entry, access_type);
     target_ulong page_addr = addr & TARGET_PAGE_MASK;
-    int flags = TLB_FLAGS_MASK;
+    int flags = TLB_FLAGS_MASK & ~TLB_FORCE_SLOW;
+    CPUTLBEntryFull *full;
 
     if (!tlb_hit_page(tlb_addr, page_addr)) {
         if (!victim_tlb_hit(env, mmu_idx, index, access_type, page_addr)) {
@@ -1537,7 +1545,8 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     }
     flags &= tlb_addr;
 
-    *pfull = &env_tlb(env)->d[mmu_idx].fulltlb[index];
+    *pfull = full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
+    flags |= full->slow_flags[access_type];
 
     /* Fold all "mmio-like" bits into TLB_MMIO.  This is not RAM.  */
     if (unlikely(flags & ~(TLB_WATCHPOINT | TLB_NOTDIRTY))) {
@@ -1744,6 +1753,8 @@ static bool mmu_lookup1(CPUArchState *env, MMULookupPageData *data,
     CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
     target_ulong tlb_addr = tlb_read_idx(entry, access_type);
     bool maybe_resized = false;
+    CPUTLBEntryFull *full;
+    int flags;
 
     /* If the TLB entry is for a different page, reload and try again.  */
     if (!tlb_hit(tlb_addr, addr)) {
@@ -1757,8 +1768,12 @@ static bool mmu_lookup1(CPUArchState *env, MMULookupPageData *data,
         tlb_addr = tlb_read_idx(entry, access_type) & ~TLB_INVALID_MASK;
     }
 
-    data->flags = tlb_addr & TLB_FLAGS_MASK;
-    data->full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
+    full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
+    flags = tlb_addr & (TLB_FLAGS_MASK & ~TLB_FORCE_SLOW);
+    flags |= full->slow_flags[access_type];
+
+    data->full = full;
+    data->flags = flags;
     /* Compute haddr speculatively; depending on flags it might be invalid. */
     data->haddr = (void *)((uintptr_t)addr + entry->addend);
 
-- 
2.34.1



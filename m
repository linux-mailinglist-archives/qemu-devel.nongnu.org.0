Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074FD3773F4
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 22:18:10 +0200 (CEST)
Received: from localhost ([::1]:55552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfTOq-000057-DC
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 16:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfTNV-0007X6-Q2
 for qemu-devel@nongnu.org; Sat, 08 May 2021 16:16:45 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:52161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfTNT-0007wv-9Y
 for qemu-devel@nongnu.org; Sat, 08 May 2021 16:16:45 -0400
Received: by mail-pj1-x1029.google.com with SMTP id lp4so7517886pjb.1
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 13:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bFNEj9Q4iC3iWuk/QZgQcOwiQ1gY43v9TfRZUkM3/ik=;
 b=du8yxlXTgtawOnA4ycD2YZIUv4d8mUKUe82EYclC2K0g39Ay3/shqmOdXRs5yHNIiZ
 +n0sVnvGM9I5f14KodaPG8G0TCZvCn7kQZjcOSVQJOkibUKgkhYNkHmKXfiE4kjoL4Be
 RVU+YNEWlxvc2BeCcYM2F3q0mq2SPD7SSByIdW9R2keILw3lo23MEfv4k07+w3yGfsrD
 6bdOKmgVa0JMXmkbVzF4z5rSUnsWhVoxkz8CaxOdiqaMbFiNbqhW10cU94mRSBqxyFHd
 eja/VrxFSqExZ5m3icw9loCRHxwmZ9fRQf+NOmJmW8ex27XIKrfm9o2GvYpIQz0Fhxyz
 CmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bFNEj9Q4iC3iWuk/QZgQcOwiQ1gY43v9TfRZUkM3/ik=;
 b=W6MHFhXceMAELMGwj+Bcxb/HAPGEBhnISawkHT85c980rTcVaolllV1ErT7lhWs5Af
 N1gaoBIYJk+XiwyLyIFN6dYt5xLcgsOUHicnzOD3khG2K3ubJxJHESNEBpbALkyRiQvY
 x7ZVjN7WQwYN6llUueLpCKwjgr2nnLeE4s+oKCIzHDX7DPMM4HOz9WnXU6J0o9FE34OJ
 vpJJaQ+3qCtKZlzxK15SkHFNbYa/AeOO0tQ7OZb8Ukc6JKG99irk7+aMX94eZOgBK3Gn
 YhIxW3NYUIHlyqN+Omaa0u+9CS0qS7xnZv+jZ1Nlt53/T9iD2qp85D3h9Y6rzSvvOKy5
 8okQ==
X-Gm-Message-State: AOAM533mwukw3owQ4gRCo3MV2MWMNQagHtICnQL83ckhXb51Qgq6qKC9
 jG6l4rIEW9yZ67d7FH76crNCIMrBWszdaQ==
X-Google-Smtp-Source: ABdhPJymzsc+DU+ndJgrmTX9sjtTJcNw/lCC5AoByh2mh1oyQRVe9A7E3LBPQ8WM6L7GQ+bid91UHw==
X-Received: by 2002:a17:90b:3706:: with SMTP id
 mg6mr30153652pjb.90.1620505001524; 
 Sat, 08 May 2021 13:16:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 12sm7630383pfz.205.2021.05.08.13.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 May 2021 13:16:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] accel/tcg: Add tlb_flush interface for a range of pages
Date: Sat,  8 May 2021 13:16:40 -0700
Message-Id: <20210508201640.1045808-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: rebecca@nuviainc.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Call these tlb_flush_range_by_mmuidx*.
Rewrite the_flush_page_bits_by_mmuidx* to use the new
functions, passing in TARGET_PAGE_SIZE for length.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h |  44 ++++++++
 accel/tcg/cputlb.c      | 232 ++++++++++++++++++++--------------------
 2 files changed, 159 insertions(+), 117 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 6b036cae8f..8021adf38f 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -262,6 +262,31 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *cpu, target_ulong addr,
 void tlb_flush_page_bits_by_mmuidx_all_cpus_synced
     (CPUState *cpu, target_ulong addr, uint16_t idxmap, unsigned bits);
 
+/**
+ * tlb_flush_range_by_mmuidx
+ * @cpu: CPU whose TLB should be flushed
+ * @addr: virtual address of the start of the range to be flushed
+ * @len: length of range to be flushed
+ * @idxmap: bitmap of mmu indexes to flush
+ * @bits: number of significant bits in address
+ *
+ * For each mmuidx in @idxmap, flush all pages within [@addr,@addr+@len),
+ * comparing only the low @bits worth of each virtual page.
+ */
+void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
+                               target_ulong len, uint16_t idxmap,
+                               unsigned bits);
+
+/* Similarly, with broadcast and syncing. */
+void tlb_flush_range_by_mmuidx_all_cpus(CPUState *cpu, target_ulong addr,
+                                        target_ulong len, uint16_t idxmap,
+                                        unsigned bits);
+void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
+                                               target_ulong addr,
+                                               target_ulong len,
+                                               uint16_t idxmap,
+                                               unsigned bits);
+
 /**
  * tlb_set_page_with_attrs:
  * @cpu: CPU to add this TLB entry for
@@ -365,6 +390,25 @@ tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *cpu, target_ulong addr,
                                               uint16_t idxmap, unsigned bits)
 {
 }
+static inline void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
+                                             target_ulong len, uint16_t idxmap,
+                                             unsigned bits)
+{
+}
+static inline void tlb_flush_range_by_mmuidx_all_cpus(CPUState *cpu,
+                                                      target_ulong addr,
+                                                      target_ulong len,
+                                                      uint16_t idxmap,
+                                                      unsigned bits)
+{
+}
+static inline void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
+                                                             target_ulong addr,
+                                                             target_long len,
+                                                             uint16_t idxmap,
+                                                             unsigned bits)
+{
+}
 #endif
 /**
  * probe_access:
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 84e7d91a5c..c1dc0e2d27 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -707,8 +707,9 @@ void tlb_flush_page_all_cpus_synced(CPUState *src, target_ulong addr)
     tlb_flush_page_by_mmuidx_all_cpus_synced(src, addr, ALL_MMUIDX_BITS);
 }
 
-static void tlb_flush_page_bits_locked(CPUArchState *env, int midx,
-                                       target_ulong page, unsigned bits)
+static void tlb_flush_range_locked(CPUArchState *env, int midx,
+                                   target_ulong addr, target_ulong len,
+                                   unsigned bits)
 {
     CPUTLBDesc *d = &env_tlb(env)->d[midx];
     CPUTLBDescFast *f = &env_tlb(env)->f[midx];
@@ -718,20 +719,26 @@ static void tlb_flush_page_bits_locked(CPUArchState *env, int midx,
      * If @bits is smaller than the tlb size, there may be multiple entries
      * within the TLB; otherwise all addresses that match under @mask hit
      * the same TLB entry.
-     *
      * TODO: Perhaps allow bits to be a few bits less than the size.
      * For now, just flush the entire TLB.
+     *
+     * If @len is larger than the tlb size, then it will take longer to
+     * test all of the entries in the TLB than it will to flush it all.
      */
-    if (mask < f->mask) {
+    if (mask < f->mask || len > f->mask) {
         tlb_debug("forcing full flush midx %d ("
-                  TARGET_FMT_lx "/" TARGET_FMT_lx ")\n",
-                  midx, page, mask);
+                  TARGET_FMT_lx "/" TARGET_FMT_lx "+" TARGET_FMT_lx ")\n",
+                  midx, addr, mask, len);
         tlb_flush_one_mmuidx_locked(env, midx, get_clock_realtime());
         return;
     }
 
-    /* Check if we need to flush due to large pages.  */
-    if ((page & d->large_page_mask) == d->large_page_addr) {
+    /*
+     * Check if we need to flush due to large pages.
+     * Because large_page_mask contains all 1's from the msb,
+     * we only need to test the end of the range.
+     */
+    if (((addr + len - 1) & d->large_page_mask) == d->large_page_addr) {
         tlb_debug("forcing full flush midx %d ("
                   TARGET_FMT_lx "/" TARGET_FMT_lx ")\n",
                   midx, d->large_page_addr, d->large_page_mask);
@@ -739,85 +746,67 @@ static void tlb_flush_page_bits_locked(CPUArchState *env, int midx,
         return;
     }
 
-    if (tlb_flush_entry_mask_locked(tlb_entry(env, midx, page), page, mask)) {
-        tlb_n_used_entries_dec(env, midx);
+    for (target_ulong i = 0; i < len; i += TARGET_PAGE_SIZE) {
+        target_ulong page = addr + i;
+        CPUTLBEntry *entry = tlb_entry(env, midx, page);
+
+        if (tlb_flush_entry_mask_locked(entry, page, mask)) {
+            tlb_n_used_entries_dec(env, midx);
+        }
+        tlb_flush_vtlb_page_mask_locked(env, midx, page, mask);
     }
-    tlb_flush_vtlb_page_mask_locked(env, midx, page, mask);
 }
 
 typedef struct {
     target_ulong addr;
+    target_ulong len;
     uint16_t idxmap;
     uint16_t bits;
-} TLBFlushPageBitsByMMUIdxData;
+} TLBFlushRangeData;
 
-static void
-tlb_flush_page_bits_by_mmuidx_async_0(CPUState *cpu,
-                                      TLBFlushPageBitsByMMUIdxData d)
+static void tlb_flush_range_by_mmuidx_async_0(CPUState *cpu,
+                                              TLBFlushRangeData d)
 {
     CPUArchState *env = cpu->env_ptr;
     int mmu_idx;
 
     assert_cpu_is_self(cpu);
 
-    tlb_debug("page addr:" TARGET_FMT_lx "/%u mmu_map:0x%x\n",
-              d.addr, d.bits, d.idxmap);
+    tlb_debug("range:" TARGET_FMT_lx "/%u+" TARGET_FMT_lx " mmu_map:0x%x\n",
+              d.addr, d.bits, d.len, d.idxmap);
 
     qemu_spin_lock(&env_tlb(env)->c.lock);
     for (mmu_idx = 0; mmu_idx < NB_MMU_MODES; mmu_idx++) {
         if ((d.idxmap >> mmu_idx) & 1) {
-            tlb_flush_page_bits_locked(env, mmu_idx, d.addr, d.bits);
+            tlb_flush_range_locked(env, mmu_idx, d.addr, d.len, d.bits);
         }
     }
     qemu_spin_unlock(&env_tlb(env)->c.lock);
 
-    tb_flush_jmp_cache(cpu, d.addr);
-}
-
-static bool encode_pbm_to_runon(run_on_cpu_data *out,
-                                TLBFlushPageBitsByMMUIdxData d)
-{
-    /* We need 6 bits to hold to hold @bits up to 63. */
-    if (d.idxmap <= MAKE_64BIT_MASK(0, TARGET_PAGE_BITS - 6)) {
-        *out = RUN_ON_CPU_TARGET_PTR(d.addr | (d.idxmap << 6) | d.bits);
-        return true;
+    for (target_ulong i = 0; i < d.len; i += TARGET_PAGE_SIZE) {
+        tb_flush_jmp_cache(cpu, d.addr + i);
     }
-    return false;
 }
 
-static TLBFlushPageBitsByMMUIdxData
-decode_runon_to_pbm(run_on_cpu_data data)
+static void tlb_flush_range_by_mmuidx_async_1(CPUState *cpu,
+                                              run_on_cpu_data data)
 {
-    target_ulong addr_map_bits = (target_ulong) data.target_ptr;
-    return (TLBFlushPageBitsByMMUIdxData){
-        .addr = addr_map_bits & TARGET_PAGE_MASK,
-        .idxmap = (addr_map_bits & ~TARGET_PAGE_MASK) >> 6,
-        .bits = addr_map_bits & 0x3f
-    };
-}
-
-static void tlb_flush_page_bits_by_mmuidx_async_1(CPUState *cpu,
-                                                  run_on_cpu_data runon)
-{
-    tlb_flush_page_bits_by_mmuidx_async_0(cpu, decode_runon_to_pbm(runon));
-}
-
-static void tlb_flush_page_bits_by_mmuidx_async_2(CPUState *cpu,
-                                                  run_on_cpu_data data)
-{
-    TLBFlushPageBitsByMMUIdxData *d = data.host_ptr;
-    tlb_flush_page_bits_by_mmuidx_async_0(cpu, *d);
+    TLBFlushRangeData *d = data.host_ptr;
+    tlb_flush_range_by_mmuidx_async_0(cpu, *d);
     g_free(d);
 }
 
-void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
-                                   uint16_t idxmap, unsigned bits)
+void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
+                               target_ulong len, uint16_t idxmap,
+                               unsigned bits)
 {
-    TLBFlushPageBitsByMMUIdxData d;
-    run_on_cpu_data runon;
+    TLBFlushRangeData d;
 
-    /* If all bits are significant, this devolves to tlb_flush_page. */
-    if (bits >= TARGET_LONG_BITS) {
+    /*
+     * If all bits are significant, and len is small,
+     * this devolves to tlb_flush_page.
+     */
+    if (bits >= TARGET_LONG_BITS && len <= TARGET_PAGE_SIZE) {
         tlb_flush_page_by_mmuidx(cpu, addr, idxmap);
         return;
     }
@@ -829,34 +818,38 @@ void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
 
     /* This should already be page aligned */
     d.addr = addr & TARGET_PAGE_MASK;
+    d.len = len;
     d.idxmap = idxmap;
     d.bits = bits;
 
     if (qemu_cpu_is_self(cpu)) {
-        tlb_flush_page_bits_by_mmuidx_async_0(cpu, d);
-    } else if (encode_pbm_to_runon(&runon, d)) {
-        async_run_on_cpu(cpu, tlb_flush_page_bits_by_mmuidx_async_1, runon);
+        tlb_flush_range_by_mmuidx_async_0(cpu, d);
     } else {
-        TLBFlushPageBitsByMMUIdxData *p
-            = g_new(TLBFlushPageBitsByMMUIdxData, 1);
-
         /* Otherwise allocate a structure, freed by the worker.  */
-        *p = d;
-        async_run_on_cpu(cpu, tlb_flush_page_bits_by_mmuidx_async_2,
+        TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
+        async_run_on_cpu(cpu, tlb_flush_range_by_mmuidx_async_1,
                          RUN_ON_CPU_HOST_PTR(p));
     }
 }
 
-void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
-                                            target_ulong addr,
-                                            uint16_t idxmap,
-                                            unsigned bits)
+void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
+                                   uint16_t idxmap, unsigned bits)
 {
-    TLBFlushPageBitsByMMUIdxData d;
-    run_on_cpu_data runon;
+    tlb_flush_range_by_mmuidx(cpu, addr, TARGET_PAGE_SIZE, idxmap, bits);
+}
 
-    /* If all bits are significant, this devolves to tlb_flush_page. */
-    if (bits >= TARGET_LONG_BITS) {
+void tlb_flush_range_by_mmuidx_all_cpus(CPUState *src_cpu,
+                                        target_ulong addr, target_ulong len,
+                                        uint16_t idxmap, unsigned bits)
+{
+    TLBFlushRangeData d;
+    CPUState *dst_cpu;
+
+    /*
+     * If all bits are significant, and len is small,
+     * this devolves to tlb_flush_page.
+     */
+    if (bits >= TARGET_LONG_BITS && len <= TARGET_PAGE_SIZE) {
         tlb_flush_page_by_mmuidx_all_cpus(src_cpu, addr, idxmap);
         return;
     }
@@ -868,40 +861,46 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
 
     /* This should already be page aligned */
     d.addr = addr & TARGET_PAGE_MASK;
+    d.len = len;
     d.idxmap = idxmap;
     d.bits = bits;
 
-    if (encode_pbm_to_runon(&runon, d)) {
-        flush_all_helper(src_cpu, tlb_flush_page_bits_by_mmuidx_async_1, runon);
-    } else {
-        CPUState *dst_cpu;
-        TLBFlushPageBitsByMMUIdxData *p;
-
-        /* Allocate a separate data block for each destination cpu.  */
-        CPU_FOREACH(dst_cpu) {
-            if (dst_cpu != src_cpu) {
-                p = g_new(TLBFlushPageBitsByMMUIdxData, 1);
-                *p = d;
-                async_run_on_cpu(dst_cpu,
-                                 tlb_flush_page_bits_by_mmuidx_async_2,
-                                 RUN_ON_CPU_HOST_PTR(p));
-            }
+    /* Allocate a separate data block for each destination cpu.  */
+    CPU_FOREACH(dst_cpu) {
+        if (dst_cpu != src_cpu) {
+            TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
+            async_run_on_cpu(dst_cpu,
+                             tlb_flush_range_by_mmuidx_async_1,
+                             RUN_ON_CPU_HOST_PTR(p));
         }
     }
 
-    tlb_flush_page_bits_by_mmuidx_async_0(src_cpu, d);
+    tlb_flush_range_by_mmuidx_async_0(src_cpu, d);
 }
 
-void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
-                                                   target_ulong addr,
-                                                   uint16_t idxmap,
-                                                   unsigned bits)
+void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
+                                            target_ulong addr,
+                                            uint16_t idxmap, unsigned bits)
 {
-    TLBFlushPageBitsByMMUIdxData d;
-    run_on_cpu_data runon;
+    tlb_flush_range_by_mmuidx_all_cpus(src_cpu, addr, TARGET_PAGE_SIZE,
+                                       idxmap, bits);
+}
 
-    /* If all bits are significant, this devolves to tlb_flush_page. */
-    if (bits >= TARGET_LONG_BITS) {
+void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
+                                               target_ulong addr,
+                                               target_ulong len,
+                                               uint16_t idxmap,
+                                               unsigned bits)
+{
+    TLBFlushRangeData d;
+    CPUState *dst_cpu;
+    TLBFlushRangeData *p;
+
+    /*
+     * If all bits are significant, and len is small,
+     * this devolves to tlb_flush_page.
+     */
+    if (bits >= TARGET_LONG_BITS && len <= TARGET_PAGE_SIZE) {
         tlb_flush_page_by_mmuidx_all_cpus_synced(src_cpu, addr, idxmap);
         return;
     }
@@ -913,32 +912,31 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
 
     /* This should already be page aligned */
     d.addr = addr & TARGET_PAGE_MASK;
+    d.len = len;
     d.idxmap = idxmap;
     d.bits = bits;
 
-    if (encode_pbm_to_runon(&runon, d)) {
-        flush_all_helper(src_cpu, tlb_flush_page_bits_by_mmuidx_async_1, runon);
-        async_safe_run_on_cpu(src_cpu, tlb_flush_page_bits_by_mmuidx_async_1,
-                              runon);
-    } else {
-        CPUState *dst_cpu;
-        TLBFlushPageBitsByMMUIdxData *p;
-
-        /* Allocate a separate data block for each destination cpu.  */
-        CPU_FOREACH(dst_cpu) {
-            if (dst_cpu != src_cpu) {
-                p = g_new(TLBFlushPageBitsByMMUIdxData, 1);
-                *p = d;
-                async_run_on_cpu(dst_cpu, tlb_flush_page_bits_by_mmuidx_async_2,
-                                 RUN_ON_CPU_HOST_PTR(p));
-            }
+    /* Allocate a separate data block for each destination cpu.  */
+    CPU_FOREACH(dst_cpu) {
+        if (dst_cpu != src_cpu) {
+            p = g_memdup(&d, sizeof(d));
+            async_run_on_cpu(dst_cpu, tlb_flush_range_by_mmuidx_async_1,
+                             RUN_ON_CPU_HOST_PTR(p));
         }
-
-        p = g_new(TLBFlushPageBitsByMMUIdxData, 1);
-        *p = d;
-        async_safe_run_on_cpu(src_cpu, tlb_flush_page_bits_by_mmuidx_async_2,
-                              RUN_ON_CPU_HOST_PTR(p));
     }
+
+    p = g_memdup(&d, sizeof(d));
+    async_safe_run_on_cpu(src_cpu, tlb_flush_range_by_mmuidx_async_1,
+                          RUN_ON_CPU_HOST_PTR(p));
+}
+
+void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
+                                                   target_ulong addr,
+                                                   uint16_t idxmap,
+                                                   unsigned bits)
+{
+    tlb_flush_range_by_mmuidx_all_cpus_synced(src_cpu, addr, TARGET_PAGE_SIZE,
+                                              idxmap, bits);
 }
 
 /* update the TLBs so that writes to code in the virtual page 'addr'
-- 
2.25.1



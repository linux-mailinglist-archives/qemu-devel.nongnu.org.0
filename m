Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8853733D9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 05:12:59 +0200 (CEST)
Received: from localhost ([::1]:56034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le7y5-0003t2-00
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 23:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1le7qd-0008Ci-G8
 for qemu-devel@nongnu.org; Tue, 04 May 2021 23:05:15 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:37623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1le7qT-00031u-Hy
 for qemu-devel@nongnu.org; Tue, 04 May 2021 23:05:15 -0400
Received: by mail-qk1-x72b.google.com with SMTP id i67so307310qkc.4
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 20:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=btMaGj7ccU0HCYX4NRJ6hUY5JOpjFZjbz479ppWGpb4=;
 b=COjG2xbTiCbqE5q9t8lNX6MiFZgcmFD/CdZcNJDrCeJdMXfKMnrt6pnJpuzBpL1+OR
 158crcgWsWR8MK5DslG55/Gv9+vYyOjL3JL1YMHU4l3ShYAnYVDiUHedYsUG6Xr3uEgy
 zcLGZ2vL3SILl+tHSz5npM2P2x+tZqOnaECCNlKZRAo193K5RyupZGeixbOg5JzhoyGP
 xWpYO2LMK/Wt2OKrzPlsgq+7m2ns6uLfEId/UWrRqUxUtJfkkEK5mkZO07K/WRxl/jsV
 hxCcCvdOMayZzk0PKjDxG6jWwJKzp7fFhRsV4wfrAjYTdbek+2C9e8gHr8+ujwjarGlL
 gv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=btMaGj7ccU0HCYX4NRJ6hUY5JOpjFZjbz479ppWGpb4=;
 b=Rx3++u4sD+CRLxmK5AtKw4dTU8tZgpUV//r0Ygkxumd9jPHDKcfJenR0+OwDqDgqTT
 RLjVEGxtFR48xIdWDSNbh+qlgZQuacOpGPzWHUGQKP44XKYGlQ5Irl9J10AWKHiEQWSn
 Y2QVRkEbe/iJB+cWg58vJmfD++FUsgA/s8cCbsJfc9l00lLwaNOHEgYBhL+gGEEwuIcF
 jMJDowA3MaZOxRT67hIKLtO70BBVH7+IhVFJMPUyUadPms7c1nxWRpyeU5PTFHmnPN90
 jthLzwLFkbTHI9p0U0ElES2k+m0tzKAXxlXXruYq88Z8H2xLB5L9ctbIUT1DnT3IhkgM
 lPpw==
X-Gm-Message-State: AOAM531am0+fTfI3Nu5IVPIQwAq4QzqrRhigphyOkDLDHSmbYIdE8q3O
 35MX520QTFAIFVXQfszsacNnLg==
X-Google-Smtp-Source: ABdhPJwGiH5AYwN+lHKJsKswAyj/5XGLetW1t/AOBK21a72zM9WKRY1FSQQyXXaeCqaGRugYFLjJtg==
X-Received: by 2002:a05:620a:4a:: with SMTP id
 t10mr28484318qkt.249.1620183904647; 
 Tue, 04 May 2021 20:05:04 -0700 (PDT)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id a63sm12270550qkf.132.2021.05.04.20.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 20:05:04 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v8 1/4] accel/tcg: Add TLB invalidation support for ranges of
 addresses
Date: Tue,  4 May 2021 21:04:40 -0600
Message-Id: <20210505030443.25310-2-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210505030443.25310-1-rebecca@nuviainc.com>
References: <20210505030443.25310-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=rebecca@nuviainc.com; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add functions to support the FEAT_TLBIRANGE ARMv8.4 feature that adds
TLB invalidation instructions to invalidate ranges of addresses.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 accel/tcg/cputlb.c      | 128 +++++++++++++++++++-
 include/exec/exec-all.h |  46 +++++++
 2 files changed, 171 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 8a7b779270a4..9381745f2528 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -709,7 +709,7 @@ void tlb_flush_page_all_cpus_synced(CPUState *src, target_ulong addr)
     tlb_flush_page_by_mmuidx_all_cpus_synced(src, addr, ALL_MMUIDX_BITS);
 }
 
-static void tlb_flush_page_bits_locked(CPUArchState *env, int midx,
+static bool tlb_flush_page_bits_locked(CPUArchState *env, int midx,
                                        target_ulong page, unsigned bits)
 {
     CPUTLBDesc *d = &env_tlb(env)->d[midx];
@@ -729,7 +729,7 @@ static void tlb_flush_page_bits_locked(CPUArchState *env, int midx,
                   TARGET_FMT_lx "/" TARGET_FMT_lx ")\n",
                   midx, page, mask);
         tlb_flush_one_mmuidx_locked(env, midx, get_clock_realtime());
-        return;
+        return true;
     }
 
     /* Check if we need to flush due to large pages.  */
@@ -738,13 +738,14 @@ static void tlb_flush_page_bits_locked(CPUArchState *env, int midx,
                   TARGET_FMT_lx "/" TARGET_FMT_lx ")\n",
                   midx, d->large_page_addr, d->large_page_mask);
         tlb_flush_one_mmuidx_locked(env, midx, get_clock_realtime());
-        return;
+        return true;
     }
 
     if (tlb_flush_entry_mask_locked(tlb_entry(env, midx, page), page, mask)) {
         tlb_n_used_entries_dec(env, midx);
     }
     tlb_flush_vtlb_page_mask_locked(env, midx, page, mask);
+    return false;
 }
 
 typedef struct {
@@ -943,6 +944,127 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
     }
 }
 
+typedef struct {
+    target_ulong addr;
+    target_ulong length;
+    uint16_t idxmap;
+    uint16_t bits;
+}  TLBFlushPageRangeBitsByMMUIdxData;
+
+static void
+tlb_flush_page_range_bits_by_mmuidx_async_0(CPUState *cpu,
+                                            target_ulong addr,
+                                            target_ulong length,
+                                            uint16_t idxmap,
+                                            unsigned bits)
+{
+    CPUArchState *env = cpu->env_ptr;
+    bool full_flush;
+    int mmu_idx;
+    target_ulong page;
+
+    assert_cpu_is_self(cpu);
+
+    tlb_debug("page addr:" TARGET_FMT_lx "/%u len: " TARGET_FMT_lx
+              " mmu_map:0x%x\n",
+              addr, bits, length, idxmap);
+
+    qemu_spin_lock(&env_tlb(env)->c.lock);
+    for (mmu_idx = 0; mmu_idx < NB_MMU_MODES; mmu_idx++) {
+        if ((idxmap >> mmu_idx) & 1) {
+            for (page = addr; page < (addr + length); page += TARGET_PAGE_SIZE) {
+                full_flush = tlb_flush_page_bits_locked(env, mmu_idx,
+                                                        page, bits);
+                if (full_flush) {
+                    break;
+                }
+            }
+        }
+    }
+    qemu_spin_unlock(&env_tlb(env)->c.lock);
+
+    for (page = addr; page < (addr + length); page += TARGET_PAGE_SIZE) {
+        tb_flush_jmp_cache(cpu, page);
+    }
+}
+
+static void
+tlb_flush_page_range_bits_by_mmuidx_async_1(CPUState *cpu,
+                                            run_on_cpu_data data)
+{
+    TLBFlushPageRangeBitsByMMUIdxData *d = data.host_ptr;
+
+    tlb_flush_page_range_bits_by_mmuidx_async_0(cpu, d->addr, d->length,
+                                                d->idxmap, d->bits);
+
+    g_free(d);
+}
+
+void tlb_flush_page_range_bits_by_mmuidx(CPUState *cpu,
+                                         target_ulong addr,
+                                         target_ulong length,
+                                         uint16_t idxmap,
+                                         unsigned bits)
+{
+    TLBFlushPageRangeBitsByMMUIdxData d;
+    TLBFlushPageRangeBitsByMMUIdxData *p;
+
+    /* This should already be page aligned */
+    addr &= TARGET_PAGE_BITS;
+
+    d.addr = addr & TARGET_PAGE_MASK;
+    d.idxmap = idxmap;
+    d.bits = bits;
+    d.length = length;
+
+    if (qemu_cpu_is_self(cpu)) {
+        tlb_flush_page_range_bits_by_mmuidx_async_0(cpu, addr, length,
+                                                    idxmap, bits);
+    } else {
+        p = g_new(TLBFlushPageRangeBitsByMMUIdxData, 1);
+
+        /* Allocate a structure, freed by the worker.  */
+        *p = d;
+        async_run_on_cpu(cpu, tlb_flush_page_range_bits_by_mmuidx_async_1,
+                         RUN_ON_CPU_HOST_PTR(p));
+    }
+}
+
+void tlb_flush_page_range_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
+                                                         target_ulong addr,
+                                                         target_ulong length,
+                                                         uint16_t idxmap,
+                                                         unsigned bits)
+{
+    TLBFlushPageRangeBitsByMMUIdxData d;
+    TLBFlushPageRangeBitsByMMUIdxData *p;
+    CPUState *dst_cpu;
+
+    /* This should already be page aligned */
+    addr &= TARGET_PAGE_BITS;
+
+    d.addr = addr;
+    d.idxmap = idxmap;
+    d.bits = bits;
+    d.length = length;
+
+    /* Allocate a separate data block for each destination cpu.  */
+    CPU_FOREACH(dst_cpu) {
+        if (dst_cpu != src_cpu) {
+            p = g_new(TLBFlushPageRangeBitsByMMUIdxData, 1);
+            *p = d;
+            async_run_on_cpu(dst_cpu,
+                             tlb_flush_page_range_bits_by_mmuidx_async_1,
+                             RUN_ON_CPU_HOST_PTR(p));
+        }
+    }
+
+    p = g_new(TLBFlushPageRangeBitsByMMUIdxData, 1);
+    *p = d;
+    async_safe_run_on_cpu(src_cpu, tlb_flush_page_range_bits_by_mmuidx_async_1,
+                          RUN_ON_CPU_HOST_PTR(p));
+}
+
 /* update the TLBs so that writes to code in the virtual page 'addr'
    can be detected */
 void tlb_protect_code(ram_addr_t ram_addr)
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 6b036cae8f65..a7ff35efb865 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -212,6 +212,37 @@ void tlb_flush_page_by_mmuidx_all_cpus(CPUState *cpu, target_ulong addr,
  */
 void tlb_flush_page_by_mmuidx_all_cpus_synced(CPUState *cpu, target_ulong addr,
                                               uint16_t idxmap);
+/**
+ * tlb_flush_page_range_by_mmuidx:
+ * @cpu: CPU whose TLB should be flushed
+ * @addr: virtual address of start of page range to be flushed
+ * @length: the number of bytes to be flushed
+ * @idxmap: bitmap of MMU indexes to flush
+ *
+ * Flush a range of pages from the TLB of the specified CPU, for the specified
+ * MMU indexes.
+ */
+void tlb_flush_page_range_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
+                                         target_ulong length, uint16_t idxmap,
+                                         unsigned bits);
+/**
+ * tlb_flush_page_range_by_mmuidx_all_cpus_synced:
+ * @cpu: Originating CPU of the flush
+ * @addr: virtual address of start of page range to be flushed
+ * @length: the number of bytes to be flushed
+ * @idxmap: bitmap of MMU indexes to flush
+ *
+ * Flush a range of pages from the TLB of all CPUs, for the specified MMU
+ * indexes like tlb_flush_page_by_mmuidx_all_cpus except the source
+ * vCPUs work is scheduled as safe work meaning all flushes will be
+ * complete once the source vCPUs safe work is complete. This will
+ * depend on when the guests translation ends the TB.
+ */
+void tlb_flush_page_range_bits_by_mmuidx_all_cpus_synced(CPUState *cpu,
+                                                         target_ulong addr,
+                                                         target_ulong length,
+                                                         uint16_t idxmap,
+                                                         unsigned bits);
 /**
  * tlb_flush_by_mmuidx:
  * @cpu: CPU whose TLB should be flushed
@@ -313,6 +344,21 @@ static inline void tlb_flush_page_all_cpus_synced(CPUState *src,
                                                   target_ulong addr)
 {
 }
+static inline void tlb_flush_page_range_bits_by_mmuidx(CPUState *cpu,
+                                                       target_ulong addr,
+                                                       target_ulong length,
+                                                       uint16_t idxmap,
+                                                       unsigned bits)
+{
+}
+static inline void
+tlb_flush_page_range_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
+                                                    target_ulong addr,
+                                                    target_ulong length,
+                                                    uint16_t idxmap,
+                                                    unsigned bits)
+{
+}
 static inline void tlb_flush(CPUState *cpu)
 {
 }
-- 
2.26.2



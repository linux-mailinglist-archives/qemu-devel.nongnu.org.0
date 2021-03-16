Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B7933D83D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:52:57 +0100 (CET)
Received: from localhost ([::1]:47054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMC08-0001WY-Tl
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMBwk-0007xs-Dv
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:49:26 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:33763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMBwh-0002Ok-AI
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:49:26 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id o19so3762508qvu.0
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 08:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WlTbAfLu2DoAZP36+RynW2PahHMoaa5DENcU+NPEN40=;
 b=BZILsCtjls60M4urfqpey8G8vANWNyQRWC804yS+bJ8sXl0YGkokI/vNAzW98CwYj5
 Eg5pYnjq9U9Y/jWAUoI4KqOhDzMifUfOxnN566wkwvWKUxIDmcveeDRlLDbs46yeVMCy
 +SpDxK2DXM84LvybzIlDY7cSWmgdRb2odN1jPPsHswYgtKZ+2SzrBHYFiqiSMQ3CuD+Z
 zEfzkWRFfi1uPA8oh7YtLBhHxQBNtkr/BgCWWObm6qfMLoYgUAFDwQoC6tae1/73q+62
 nAyX0mGulQrhtnc1vxkUNFXGIIH6IaLyz/1mpT1QaYVE5qzZCmLd8romvzqHOuk1rC91
 +WzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WlTbAfLu2DoAZP36+RynW2PahHMoaa5DENcU+NPEN40=;
 b=L1gEhWlqHBFavlOgjArmkz5/v0ymy1jLd8aHukjstE78pU3IGGs0tKEguxiI2WTnTh
 rnAamlecTmB8116Js1I6q0Nz5QcyF+hiwiP3YJRhatyAt7yi+2NTIJPRxTa1+tfqj7qw
 OQg3CNlBgdbO0PC6ZbpDVcPESA4tHmLFBiYsdLjhuziA7VaRTahhs19F9qRAXnBdzGVa
 JjE4U7uKKJeiH6NVsX5oTZUc37jPPjF0/mfvWV3QOSCP6Q1RrK70IeJp98e8WbEqBYIX
 CCI+HumHVHFdH9fAyaNpnuQdOLcy00ii+uAVrqdvdfRYxvoHTWlsGFt186uRRxQ7sspk
 tn6Q==
X-Gm-Message-State: AOAM532Hy6+cHGEI6PmJY3vZF0fpqpF0LBBdAn6yvCweYgV6CL+lOtis
 MavlV/NafgFFHko/xGpvIraZ3Q==
X-Google-Smtp-Source: ABdhPJygwVBSJXcjSJWedt+Y4bS07/wCZ13fAWJ3KHP8DBds898N2kLvo0k1iEgtXQgNQFUHjqKGKQ==
X-Received: by 2002:a0c:f805:: with SMTP id r5mr281051qvn.45.1615909762128;
 Tue, 16 Mar 2021 08:49:22 -0700 (PDT)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id n5sm14855623qkp.133.2021.03.16.08.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 08:49:21 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v4 1/3] target/arm: Add support for FEAT_TLBIRANGE
Date: Tue, 16 Mar 2021 09:49:08 -0600
Message-Id: <20210316154910.25804-2-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210316154910.25804-1-rebecca@nuviainc.com>
References: <20210316154910.25804-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=rebecca@nuviainc.com; helo=mail-qv1-xf2e.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ARMv8.4 adds the mandatory FEAT_TLBIRANGE. It provides TLBI
maintenance instructions that apply to a range of input addresses.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 accel/tcg/cputlb.c      | 135 +++++++++
 include/exec/exec-all.h |  45 +++
 target/arm/cpu.h        |   5 +
 target/arm/helper.c     | 318 ++++++++++++++++++++
 4 files changed, 503 insertions(+)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 8a7b779270a4..5ef2a562f4d3 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -943,6 +943,141 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
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
+    for (page = addr; page < (addr + length); page += TARGET_PAGE_SIZE) {
+        for (mmu_idx = 0; mmu_idx < NB_MMU_MODES; mmu_idx++) {
+            if ((idxmap >> mmu_idx) & 1) {
+                tlb_flush_page_bits_locked(env, mmu_idx, page, bits);
+                tb_flush_jmp_cache(cpu, page);
+            }
+        }
+    }
+    qemu_spin_unlock(&env_tlb(env)->c.lock);
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
+    /* If all bits are significant, this devolves to tlb_flush_page. */
+    if (bits >= TARGET_LONG_BITS) {
+        tlb_flush_page_by_mmuidx(cpu, addr, idxmap);
+        return;
+    }
+    /* If no page bits are significant, this devolves to tlb_flush. */
+    if (bits < TARGET_PAGE_BITS) {
+        tlb_flush_by_mmuidx(cpu, idxmap);
+        return;
+    }
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
+    /* If all bits are significant, this devolves to tlb_flush_page. */
+    if (bits >= TARGET_LONG_BITS) {
+        tlb_flush_page_by_mmuidx_all_cpus_synced(src_cpu, addr, idxmap);
+        return;
+    }
+    /* If no page bits are significant, this devolves to tlb_flush. */
+    if (bits < TARGET_PAGE_BITS) {
+        tlb_flush_by_mmuidx_all_cpus_synced(src_cpu, idxmap);
+        return;
+    }
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
+                            RUN_ON_CPU_HOST_PTR(p));
+}
+
 /* update the TLBs so that writes to code in the virtual page 'addr'
    can be detected */
 void tlb_protect_code(ram_addr_t ram_addr)
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 6b036cae8f65..833e8d654a1c 100644
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
@@ -313,6 +344,20 @@ static inline void tlb_flush_page_all_cpus_synced(CPUState *src,
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
+static inline void tlb_flush_page_range_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
+                                                                       target_ulong addr,
+                                                                       target_ulong length,
+                                                                       uint16_t idxmap,
+                                                                       unsigned bits)
+{
+}
 static inline void tlb_flush(CPUState *cpu)
 {
 }
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 193a49ec7fac..32b78a4ef587 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4038,6 +4038,11 @@ static inline bool isar_feature_aa64_pauth_arch(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA) != 0;
 }
 
+static inline bool isar_feature_aa64_tlbirange(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 2;
+}
+
 static inline bool isar_feature_aa64_sb(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, SB) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d9220be7c5a0..7133454330d3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4759,6 +4759,241 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                                   ARMMMUIdxBit_SE3, bits);
 }
 
+#ifdef TARGET_AARCH64
+static uint64_t tlbi_aa64_range_get_length(CPUARMState *env,
+                                           uint64_t value)
+{
+    unsigned int page_size;
+    unsigned int page_size_granule;
+    uint64_t num;
+    uint64_t scale;
+    uint64_t exponent;
+    uint64_t length;
+
+    num = extract64(value, 39, 4);
+    scale = extract64(value, 44, 2);
+    page_size_granule = extract64(value, 46, 2);
+
+    switch (page_size_granule) {
+    case 1:
+      page_size = 4096;
+      break;
+    case 2:
+      page_size = 16384;
+      break;
+    case 3:
+      page_size = 65536;
+      break;
+    default:
+      qemu_log_mask(LOG_GUEST_ERROR, "Invalid page size granule %d\n",
+                    page_size_granule);
+      return 0;
+    }
+
+    exponent = (5 * scale) + 1;
+    length = ((num + 1) << exponent) * page_size;
+
+    return length;
+}
+
+static void tlbi_aa64_rvae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    /*
+     * Invalidate by VA range, EL1&0.
+     * Currently handles all of RVAE1, RVAAE1, RVAALE1 and RVALE1,
+     * since we don't support flush-for-specific-ASID-only or
+     * flush-last-level-only.
+     */
+    ARMMMUIdx mask;
+    int bits;
+    uint64_t pageaddr;
+    uint64_t length;
+
+    CPUState *cs = env_cpu(env);
+    mask = vae1_tlbmask(env);
+    if (regime_has_2_ranges(mask)) {
+        pageaddr = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
+    } else {
+        pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+    }
+    length = tlbi_aa64_range_get_length(env, value);
+    bits = tlbbits_for_regime(env, mask, pageaddr);
+
+    if (tlb_force_broadcast(env)) {
+        tlb_flush_page_range_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                            length, mask,
+                                                            bits);
+    } else {
+        tlb_flush_page_range_bits_by_mmuidx(cs, pageaddr, length, mask,
+                                            bits);
+    }
+}
+
+static void tlbi_aa64_rvae1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    uint64_t value)
+{
+    /*
+     * Invalidate by VA range, Inner/Outer Shareable EL1&0.
+     * Currently handles all of RVAE1IS, RVAE1OS, RVAAE1IS, RVAAE1OS,
+     * RVAALE1IS, RVAALE1OS, RVALE1IS and RVALE1OS, since we don't support
+     * flush-for-specific-ASID-only, flush-last-level-only or inner/outer
+     * shareable specific flushes.
+     */
+    ARMMMUIdx mask;
+    int bits;
+    uint64_t pageaddr;
+    uint64_t length;
+
+    CPUState *cs = env_cpu(env);
+    mask = vae1_tlbmask(env);
+    if (regime_has_2_ranges(mask)) {
+        pageaddr = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
+    } else {
+        pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+    }
+    length = tlbi_aa64_range_get_length(env, value);
+    bits = tlbbits_for_regime(env, mask, pageaddr);
+
+    tlb_flush_page_range_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                        length, mask,
+                                                        bits);
+}
+
+static void tlbi_aa64_rvae2_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    /*
+     * Invalidate by VA range, EL2.
+     * Currently handles all of RVAE2, RVAAE2, RVAALE2 and RVALE2,
+     * since we don't support flush-for-specific-ASID-only or
+     * flush-last-level-only.
+     */
+    ARMMMUIdx mask;
+    bool secure;
+    int bits;
+    uint64_t pageaddr;
+    uint64_t length;
+
+    CPUState *cs = env_cpu(env);
+    secure = arm_is_secure_below_el3(env);
+    if (regime_has_2_ranges(secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2)) {
+        pageaddr = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
+    } else {
+        pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+    }
+    length = tlbi_aa64_range_get_length(env, value);
+    mask = secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
+    bits = tlbbits_for_regime(env, secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2,
+                              pageaddr);
+
+    if (tlb_force_broadcast(env)) {
+        tlb_flush_page_range_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                            length, mask,
+                                                            bits);
+    } else {
+        tlb_flush_page_range_bits_by_mmuidx(cs, pageaddr, length, mask,
+                                            bits);
+    }
+}
+
+static void tlbi_aa64_rvae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    uint64_t value)
+{
+    /*
+     * Invalidate by VA range, Inner/Outer Shareable, EL2.
+     * Currently handles all of RVAE2IS, RVAE2OS, RVAAE2IS, RVAAE2OS,
+     * RVAALE2IS, RVAALE2OS, RVALE2IS and RVALE2OS, since we don't support
+     * flush-for-specific-ASID-only, flush-last-level-only or inner/outer
+     * shareable specific flushes.
+     */
+    ARMMMUIdx mask;
+    bool secure;
+    int bits;
+    uint64_t pageaddr;
+    uint64_t length;
+
+    CPUState *cs = env_cpu(env);
+    secure = arm_is_secure_below_el3(env);
+    if (regime_has_2_ranges(secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2)) {
+        pageaddr = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
+    } else {
+        pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+    }
+    length = tlbi_aa64_range_get_length(env, value);
+    mask = secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
+    bits = tlbbits_for_regime(env, secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2,
+                              pageaddr);
+
+    tlb_flush_page_range_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                        length, mask,
+                                                        bits);
+}
+
+static void tlbi_aa64_rvae3_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    /*
+     * Invalidate by VA range, EL3.
+     * Currently handles all of RVAE3, RVAAE3, RVAALE3 and RVALE3,
+     * since we don't support flush-for-specific-ASID-only or
+     * flush-last-level-only.
+     */
+    int bits;
+    uint64_t pageaddr;
+    uint64_t length;
+
+    CPUState *cs = env_cpu(env);
+    if (regime_has_2_ranges(ARMMMUIdxBit_SE3)) {
+        pageaddr = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
+    } else {
+        pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+    }
+    length = tlbi_aa64_range_get_length(env, value);
+    bits = tlbbits_for_regime(env, ARMMMUIdx_SE3, pageaddr);
+
+    if (tlb_force_broadcast(env)) {
+        tlb_flush_page_range_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                            length,
+                                                            ARMMMUIdxBit_SE3,
+                                                            bits);
+    } else {
+        tlb_flush_page_range_bits_by_mmuidx(cs, pageaddr, length,
+                                            ARMMMUIdxBit_SE3,
+                                            bits);
+    }
+}
+
+static void tlbi_aa64_rvae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    uint64_t value)
+{
+    /*
+     * Invalidate by VA range, EL3, Inner/Outer Shareable.
+     * Currently handles all of RVAE3IS, RVAE3OS, RVAAE3IS, RVAAE3OS,
+     * RVAALE3IS, RVAALE3OS, RVALE3IS, and RVALE3OS, since we don't support
+     * flush-for-specific-ASID-only, flush-last-level-only or inner/outer
+     * specific flushes.
+     */
+    int bits;
+    uint64_t pageaddr;
+    uint64_t length;
+
+    CPUState *cs = env_cpu(env);
+    if (regime_has_2_ranges(ARMMMUIdxBit_SE3)) {
+        pageaddr = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
+    } else {
+        pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+    }
+    length = tlbi_aa64_range_get_length(env, value);
+    bits = tlbbits_for_regime(env, ARMMMUIdx_SE3, pageaddr);
+
+    tlb_flush_page_range_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                        length,
+                                                        ARMMMUIdxBit_SE3,
+                                                        bits);
+}
+#endif
+
 static CPAccessResult aa64_zva_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                       bool isread)
 {
@@ -6920,6 +7155,86 @@ static const ARMCPRegInfo pauth_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+static const ARMCPRegInfo tlbirange_reginfo[] = {
+    { .name = "TLBI_RVAE1IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 1,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+    { .name = "TLBI_RVAAE1IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 3,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+   { .name = "TLBI_RVALE1IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 5,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+    { .name = "TLBI_RVAALE1IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 7,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+    { .name = "TLBI_RVAE1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 1,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1_write },
+    { .name = "TLBI_RVAAE1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 3,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1_write },
+   { .name = "TLBI_RVALE1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 5,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1_write },
+    { .name = "TLBI_RVAALE1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 7,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1_write },
+    { .name = "TLBI_RIPAS2E1IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 2,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RIPAS2LE1IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 6,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RVAE2IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 2, .opc2 = 1,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae2is_write },
+   { .name = "TLBI_RVALE2IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 2, .opc2 = 5,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae2is_write },
+    { .name = "TLBI_RIPAS2E1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 2,
+      .access = PL2_W, .type = ARM_CP_NOP },
+   { .name = "TLBI_RIPAS2LE1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 6,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RVAE2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 6, .opc2 = 1,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae2_write },
+   { .name = "TLBI_RVALE2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 6, .opc2 = 5,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae2_write },
+   { .name = "TLBI_RVAE3IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 2, .opc2 = 1,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae3is_write },
+   { .name = "TLBI_RVALE3IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 2, .opc2 = 5,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae3is_write },
+   { .name = "TLBI_RVAE3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 6, .opc2 = 1,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae3_write },
+   { .name = "TLBI_RVALE3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 6, .opc2 = 5,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae3_write },
+    REGINFO_SENTINEL
+};
+
 static uint64_t rndr_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     Error *err = NULL;
@@ -8289,6 +8604,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_rndr, cpu)) {
         define_arm_cp_regs(cpu, rndr_reginfo);
     }
+    if (cpu_isar_feature(aa64_tlbirange, cpu)) {
+        define_arm_cp_regs(cpu, tlbirange_reginfo);
+    }
 #ifndef CONFIG_USER_ONLY
     /* Data Cache clean instructions up to PoP */
     if (cpu_isar_feature(aa64_dcpop, cpu)) {
-- 
2.26.2



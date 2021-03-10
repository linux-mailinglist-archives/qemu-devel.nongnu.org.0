Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD37133327E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 01:33:29 +0100 (CET)
Received: from localhost ([::1]:33432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJmn2-0004Ly-TT
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 19:33:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJmjC-0000VB-8b
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 19:29:31 -0500
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:41791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJmj6-0001HR-Cw
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 19:29:29 -0500
Received: by mail-il1-x131.google.com with SMTP id c10so13903561ilo.8
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 16:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0rMz1FtL7RQxG5i7Rgib/rdQSH/PwoRE3DozIs3GVI0=;
 b=yi2Vz9IoleNeV3lasWMbrGSuvelUHaFGTA6noOEguI8QWsSDIZlctL5RiRWr6g93in
 LcD5fCK/AHyE8aPJoJgNlK8u7Ig7QfFHc4MVquO2Of/GtruWQ2MG4LgHndt0yKlaPwPg
 caejwLtYSya+lAILTSqnA5AsDcVFxZ+eEyFDyGfv53gfdYKL2DghsnweR7h0aU5MuHAA
 /NVHhla8R5ZLxKmMpySuMYd8KzJcJFXUPgXQXvPTA32oxxPZaUGKDQkAnQrmdeAJod+w
 4Tlr2nwwTcaquys8y4PA/Hv9L0eaZz4Ig2LZqDACbEFpJvjJrgS0OxGogTYO2p7UrWlj
 e3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0rMz1FtL7RQxG5i7Rgib/rdQSH/PwoRE3DozIs3GVI0=;
 b=kyiPKEeMfJeHMUMloM4JBkgbJpKNwmApgha/vz2Ui9KdCVbQY1ASHryYjedosWIugQ
 lEDrAb5zvyiUG8DHIOhPxRY9Ert4c/z+9xaySwbsZ0jJs4wUzBmy7Y+dbK1vQrPzpq9o
 LQKOFzo5cSruNtxMnPw57Y3Ben3ZkJygk6vIF19K3YrrSvH13JNvG8LSIPQQ7E/WYH2z
 bwgmNI9eji7GCw5A83e3YllXgmjvCXaFiUmCDo5A0RYwn4s1HpHZ2rK7/5hUkr5jPzcT
 u54M79y5+S79ZJSFwihfhZ2AtPrF7F/rjpi2fVRYLVR7HM3e2hCR7bUcgGAVWiBc8wsT
 C50A==
X-Gm-Message-State: AOAM531lc958OG2z0wJqJac31519gnp/IiZMT2Vn4O27wOKHy3C4DJoO
 SI/g3Y6749hxh7K9NTebeH4umw==
X-Google-Smtp-Source: ABdhPJzWwRpJE/H05jbLtQF+Ywp8v65sD5X5xZdJQ2+nUI+3pBd6YhKc94b49D7X/hGnnFgyy5Z7Lw==
X-Received: by 2002:a05:6e02:1351:: with SMTP id
 k17mr714578ilr.204.1615336163282; 
 Tue, 09 Mar 2021 16:29:23 -0800 (PST)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id h23sm8048808ila.15.2021.03.09.16.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 16:29:22 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v3 1/3] target/arm: Add support for FEAT_TLBIRANGE
Date: Tue,  9 Mar 2021 17:29:15 -0700
Message-Id: <20210310002917.8876-2-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310002917.8876-1-rebecca@nuviainc.com>
References: <20210310002917.8876-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ARMv8.4 adds the mandatory FEAT_TLBIRANGE. It provides TLBI
maintenance instructions that apply to a range of input addresses.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 accel/tcg/cputlb.c      |  22 ++
 include/exec/exec-all.h |  41 ++++
 target/arm/cpu.h        |   5 +
 target/arm/helper.c     | 248 ++++++++++++++++++++
 4 files changed, 316 insertions(+)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 8a7b779270a4..233fe302c236 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -623,6 +623,28 @@ void tlb_flush_page(CPUState *cpu, target_ulong addr)
     tlb_flush_page_by_mmuidx(cpu, addr, ALL_MMUIDX_BITS);
 }
 
+void tlb_flush_page_range_by_mmuidx(CPUState *cpu, target_ulong addr,
+                                    unsigned int num_pages, uint16_t idxmap)
+{
+  /*
+   * We currently do a full flush, but for performance this should be
+   * updated to only flush the requested pages, taking TBI into account.
+   */
+    tlb_flush_by_mmuidx(cpu, idxmap);
+}
+
+void tlb_flush_page_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
+                                                    target_ulong addr,
+                                                    unsigned int num_pages,
+                                                    uint16_t idxmap)
+{
+    /*
+     * We currently do a full flush, but for performance this should be
+     * updated to only flush the requested pages, taking TBI into account.
+     */
+    tlb_flush_by_mmuidx_all_cpus_synced(src_cpu, idxmap);
+}
+
 void tlb_flush_page_by_mmuidx_all_cpus(CPUState *src_cpu, target_ulong addr,
                                        uint16_t idxmap)
 {
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 6b036cae8f65..91232cd48d22 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -212,6 +212,35 @@ void tlb_flush_page_by_mmuidx_all_cpus(CPUState *cpu, target_ulong addr,
  */
 void tlb_flush_page_by_mmuidx_all_cpus_synced(CPUState *cpu, target_ulong addr,
                                               uint16_t idxmap);
+/**
+ * tlb_flush_page_range_by_mmuidx:
+ * @cpu: CPU whose TLB should be flushed
+ * @addr: virtual address of start of page range to be flushed
+ * @num_pages: the number of pages to be flushed
+ * @idxmap: bitmap of MMU indexes to flush
+ *
+ * Flush a range of pages from the TLB of the specified CPU, for the specified
+ * MMU indexes.
+ */
+void tlb_flush_page_range_by_mmuidx(CPUState *cpu, target_ulong addr,
+                                    unsigned int num_pages, uint16_t idxmap);
+/**
+ * tlb_flush_page_range_by_mmuidx_all_cpus_synced:
+ * @cpu: Originating CPU of the flush
+ * @addr: virtual address of start of page range to be flushed
+ * @num_pages: the number of pages to be flushed
+ * @idxmap: bitmap of MMU indexes to flush
+ *
+ * Flush a range of pages from the TLB of all CPUs, for the specified MMU
+ * indexes like tlb_flush_page_by_mmuidx_all_cpus except the source
+ * vCPUs work is scheduled as safe work meaning all flushes will be
+ * complete once the source vCPUs safe work is complete. This will
+ * depend on when the guests translation ends the TB.
+ */
+void tlb_flush_page_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
+                                                    target_ulong addr,
+                                                    unsigned int num_pages,
+                                                    uint16_t idxmap);
 /**
  * tlb_flush_by_mmuidx:
  * @cpu: CPU whose TLB should be flushed
@@ -313,6 +342,18 @@ static inline void tlb_flush_page_all_cpus_synced(CPUState *src,
                                                   target_ulong addr)
 {
 }
+static inline void tlb_flush_page_range_by_mmuidx(CPUState *cpu,
+                                                  target_ulong addr,
+                                                  unsigned int num_pages,
+                                                  int idxmap)
+{
+}
+static inline void tlb_flush_page_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
+                                                                  target_ulong addr,
+                                                                  unsigned int num_pages,
+                                                                  uint16_t idxmap)
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
index 904b0927cd22..ec81586d90dd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4759,6 +4759,171 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                                   ARMMMUIdxBit_SE3, bits);
 }
 
+#ifdef TARGET_AARCH64
+static unsigned int tlbi_aa64_range_get_num_pages(CPUARMState *env,
+                                                  uint64_t value,
+                                                  uint64_t addr)
+{
+    unsigned int page_size;
+    unsigned int page_shift;
+    unsigned int page_size_granule;
+    uint64_t num;
+    uint64_t scale;
+    uint64_t exponent;
+    uint64_t high_addr;
+
+    num = (value >> 39) & 0xF;
+    scale = (value >> 44) & 0x3;
+    page_size_granule = (value >> 46) & 0x3;
+
+    switch (page_size_granule) {
+    case 1:
+      page_size = 4096;
+      page_shift = 12;
+      break;
+    case 2:
+      page_size = 16384;
+      page_shift = 14;
+      break;
+    case 3:
+      page_size = 65536;
+      page_shift = 16;
+      break;
+    default:
+      qemu_log_mask(LOG_GUEST_ERROR, "Invalid page size granule %d\n",
+                    page_size_granule);
+
+      raise_exception(env, EXCP_UDEF, syn_uncategorized(),
+                      exception_target_el(env));
+
+      break;
+    }
+
+    exponent = (5 * scale) + 1;
+    high_addr = addr + (((num + 1) << exponent) * page_size);
+
+    return (high_addr - addr) >> page_shift;
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
+    CPUState *cs = env_cpu(env);
+    int mask = vae1_tlbmask(env);
+    uint64_t addr = (value & 0xFFFFFFFFFUL) << TARGET_PAGE_BITS;
+    unsigned int num_pages = tlbi_aa64_range_get_num_pages(env, value, addr);
+
+    if (tlb_force_broadcast(env)) {
+        tlb_flush_page_range_by_mmuidx_all_cpus_synced(cs, addr, num_pages,
+                                                       mask);
+    } else {
+        tlb_flush_page_range_by_mmuidx(cs, addr, num_pages, mask);
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
+    CPUState *cs = env_cpu(env);
+    int mask = vae1_tlbmask(env);
+    uint64_t addr = (value & 0xFFFFFFFFFUL) << TARGET_PAGE_BITS;
+    unsigned int num_pages = tlbi_aa64_range_get_num_pages(env, value, addr);
+
+    tlb_flush_page_range_by_mmuidx_all_cpus_synced(cs, addr, num_pages, mask);
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
+    CPUState *cs = env_cpu(env);
+    uint64_t addr = (value & 0xFFFFFFFFFUL) << TARGET_PAGE_BITS;
+    unsigned int num_pages = tlbi_aa64_range_get_num_pages(env, value, addr);
+
+    if (tlb_force_broadcast(env)) {
+        tlb_flush_page_range_by_mmuidx_all_cpus_synced(cs, addr, num_pages,
+                                                       ARMMMUIdxBit_E2);
+    } else {
+        tlb_flush_page_range_by_mmuidx(cs, addr, num_pages, ARMMMUIdxBit_E2);
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
+    CPUState *cs = env_cpu(env);
+    uint64_t addr = (value & 0xFFFFFFFFFUL) << TARGET_PAGE_BITS;
+    unsigned int num_pages = tlbi_aa64_range_get_num_pages(env, value, addr);
+
+    tlb_flush_page_range_by_mmuidx_all_cpus_synced(cs, addr, num_pages,
+                                                   ARMMMUIdxBit_E2);
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
+    CPUState *cs = env_cpu(env);
+    uint64_t addr = (value & 0xFFFFFFFFFUL) << TARGET_PAGE_BITS;
+    unsigned int num_pages = tlbi_aa64_range_get_num_pages(env, value, addr);
+
+    if (tlb_force_broadcast(env)) {
+        tlb_flush_page_range_by_mmuidx_all_cpus_synced(cs, addr, num_pages,
+                                                       ARMMMUIdxBit_SE3);
+    } else {
+        tlb_flush_page_range_by_mmuidx(cs, addr, num_pages, ARMMMUIdxBit_SE3);
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
+    CPUState *cs = env_cpu(env);
+    uint64_t addr = (value & 0xFFFFFFFFFUL) << TARGET_PAGE_BITS;
+    unsigned int num_pages = tlbi_aa64_range_get_num_pages(env, value, addr);
+
+    tlb_flush_page_range_by_mmuidx_all_cpus_synced(cs, addr, num_pages,
+                                                   ARMMMUIdxBit_SE3);
+}
+#endif
+
 static CPAccessResult aa64_zva_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                       bool isread)
 {
@@ -6920,6 +7085,86 @@ static const ARMCPRegInfo pauth_reginfo[] = {
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
@@ -8289,6 +8534,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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



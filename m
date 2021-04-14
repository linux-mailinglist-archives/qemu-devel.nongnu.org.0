Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C3235FCC4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 22:37:14 +0200 (CEST)
Received: from localhost ([::1]:44366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWmG9-000747-4D
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 16:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lWmBo-0005Dd-V2
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:32:44 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:42634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lWmBl-0004os-Je
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:32:44 -0400
Received: by mail-qt1-x833.google.com with SMTP id m16so15853933qtx.9
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 13:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wL16Zd4oMQFS2T7Fz5Sc7wUG4630vyzic4+qqOQmdOY=;
 b=eykZpxIkhlH6se3evk8jAGeYLgum8SWPY1fZBCJHihKVANPya1hauTNpPIArfWZeVJ
 8K6dgVLWT9BRwB363GiZxfZMU3IpGvZqvqUd7OG8o63tbEjG7PTL2LTVxqV+mpFrkk+v
 mhZ1ulIhffcfhP9st/A9zaWCfDMdKe9ZeGRf2DejtMu47WyXDYESp88DrkWYYPaRklmc
 MLG0vNNT3MAkJ1KscHIaf0fptVj7YXz7NVycIFdmEpJDalbtIiLn36/CeezwFioc6O4B
 uf6FKxtWB3muVoGejlmPfH6CRmcoaHMT67ukxdSrBRD+RPrcTXgkjcluNbNPWMQPEUsr
 dw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wL16Zd4oMQFS2T7Fz5Sc7wUG4630vyzic4+qqOQmdOY=;
 b=Yjz4nJQzY2OJNGgznfE3bdIl2+siIi57mU9JHztq59ArkSfYqlOrKWjV8wjf9e8YNc
 YRjPHhqyhFMMMlszy8uuW0PNc5RIiwnqHSvMYbNDId2FJ5jfdFjSu5FElKoFOewdc/Ve
 4z2kpB1O8URZggmtihiqszF0qMp7wGC7O4wbd7eUN3h5+5QAFHSE+mizVMJRvENJZB5L
 J/GCK/dmEUAIidjTqPkwq4lHiMVyVi2qp4KocGmi2pNP+unhgxNz38XUdixpNhUxdSuP
 pkXyXOuPn/jI2x6zd5mxK5Jct1vKt0h4aqQLqnjGoTI6A4OIg93LPFxUlSsGpJbpkM+d
 j8Wg==
X-Gm-Message-State: AOAM531QPb42rIWZQ/wsKapnAEPB1vlsDgPFKRwQkNHyA4vsXve16USL
 p6voskR8B3E7yM0nRXX37v4/Yw==
X-Google-Smtp-Source: ABdhPJwCuPqQktyO2dXZ0aw8nnkcnawkozimYRSFO0QWKLu45LTOF/SsgtCHYU73JZGbgwct4OaN2g==
X-Received: by 2002:ac8:5ad5:: with SMTP id d21mr37670633qtd.198.1618432360637; 
 Wed, 14 Apr 2021 13:32:40 -0700 (PDT)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id q3sm304692qtw.40.2021.04.14.13.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 13:32:40 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH v7 2/4] target/arm: Add support for FEAT_TLBIRANGE
Date: Wed, 14 Apr 2021 14:32:29 -0600
Message-Id: <20210414203231.824-3-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210414203231.824-1-rebecca@nuviainc.com>
References: <20210414203231.824-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=rebecca@nuviainc.com; helo=mail-qt1-x833.google.com
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

ARMv8.4 adds the mandatory FEAT_TLBIRANGE. It provides TLBI
maintenance instructions that apply to a range of input addresses.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu.h    |   5 +
 target/arm/helper.c | 296 ++++++++++++++++++++
 2 files changed, 301 insertions(+)

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
index d9220be7c5a0..fedc82efa57e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4759,6 +4759,219 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                                   ARMMMUIdxBit_SE3, bits);
 }
 
+#ifdef TARGET_AARCH64
+static uint64_t tlbi_aa64_range_get_length(CPUARMState *env,
+                                           uint64_t value)
+{
+    unsigned int page_shift;
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
+    page_shift = page_size_granule * 2 + 10;
+
+    if (page_size_granule == 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid page size granule %d\n",
+                      page_size_granule);
+        return 0;
+    }
+
+    exponent = (5 * scale) + 1;
+    length = (num + 1) << (exponent + page_shift);
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
+    ARMMMUIdx mmu_idx;
+    int mask;
+    int bits;
+    uint64_t pageaddr;
+    uint64_t length;
+
+    CPUState *cs = env_cpu(env);
+    mask = vae1_tlbmask(env);
+    mmu_idx = ARM_MMU_IDX_A | ctz32(mask);
+    if (regime_has_2_ranges(mmu_idx)) {
+        pageaddr = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
+    } else {
+        pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+    }
+    length = tlbi_aa64_range_get_length(env, value);
+    bits = tlbbits_for_regime(env, mmu_idx, pageaddr);
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
+    ARMMMUIdx mmu_idx;
+    int mask;
+    int bits;
+    uint64_t pageaddr;
+    uint64_t length;
+
+    CPUState *cs = env_cpu(env);
+    mask = vae1_tlbmask(env);
+    mmu_idx = ARM_MMU_IDX_A | ctz32(mask);
+    if (regime_has_2_ranges(mmu_idx)) {
+        pageaddr = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
+    } else {
+        pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+    }
+    length = tlbi_aa64_range_get_length(env, value);
+    bits = tlbbits_for_regime(env, mmu_idx, pageaddr);
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
+     * Currently handles all of RVAE2 and RVALE2,
+     * since we don't support flush-for-specific-ASID-only or
+     * flush-last-level-only.
+     */
+    bool secure;
+    int mask;
+    int bits;
+    uint64_t pageaddr;
+    uint64_t length;
+
+    CPUState *cs = env_cpu(env);
+    secure = arm_is_secure_below_el3(env);
+    pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+    length = tlbi_aa64_range_get_length(env, value);
+    mask = secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
+    bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_SE2 : ARMMMUIdx_E2,
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
+     * Currently handles all of RVAE2IS, RVAE2OS, RVALE2IS and RVALE2OS,
+     * since we don't support flush-for-specific-ASID-only,
+     * flush-last-level-only or inner/outer shareable specific flushes.
+     */
+    bool secure;
+    int mask;
+    int bits;
+    uint64_t pageaddr;
+    uint64_t length;
+
+    CPUState *cs = env_cpu(env);
+    secure = arm_is_secure_below_el3(env);
+    pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+    length = tlbi_aa64_range_get_length(env, value);
+    mask = secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
+    bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_SE2 : ARMMMUIdx_E2,
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
+     * Currently handles all of RVAE3 and RVALE3,
+     * since we don't support flush-for-specific-ASID-only or
+     * flush-last-level-only.
+     */
+    int bits;
+    uint64_t pageaddr;
+    uint64_t length;
+
+    CPUState *cs = env_cpu(env);
+    pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
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
+     * Currently handles all of RVAE3IS, RVAE3OS, RVALE3IS and RVALE3OS,
+     * since we don't support flush-for-specific-ASID-only,
+     * flush-last-level-only or inner/outer specific flushes.
+     */
+    int bits;
+    uint64_t pageaddr;
+    uint64_t length;
+
+    CPUState *cs = env_cpu(env);
+    pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
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
@@ -6920,6 +7133,86 @@ static const ARMCPRegInfo pauth_reginfo[] = {
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
@@ -8289,6 +8582,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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



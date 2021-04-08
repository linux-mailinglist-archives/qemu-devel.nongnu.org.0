Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E787B357907
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 02:24:00 +0200 (CEST)
Received: from localhost ([::1]:50016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUISj-0006sl-Uv
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 20:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lUIPw-0005Ec-J9
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 20:21:04 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:40763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lUIPm-0002du-N3
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 20:21:02 -0400
Received: by mail-il1-x135.google.com with SMTP id c18so278500iln.7
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 17:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S00jNqe5qwvG10WP/V0cTf/NyHRWwWBdToA8oYUTOt4=;
 b=pNbgwKXvwPL2R8V9r6Q4m0hNcx/euIxIeLWt6ba1TBI+5gM28mcNU5jwGJ4HRKWoAg
 4UavdPjecWWEsCOPjVDVtFm852CvPM3uiO0VZcurXyaR5a3sjwttsqNcozZ8Omw4q+Q0
 EXMWSaA2yg1nmTiYnMJy8CtK/bVEx0rGwLsPJ1OOSfWgVhqvCIyX5FGzrq49u838rebM
 5ASM6/fcAxoca9zAV052WPiyc8cWSS8haAutd+crZ9/z2P9KhQOAIhneQd7DFo574yXh
 BhXQlUzfV1y8iPD3KOUdu75VjurgKl5ITyknOvh5LhJ58sZUN89LSXBLd46oWbNUstW/
 ba6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S00jNqe5qwvG10WP/V0cTf/NyHRWwWBdToA8oYUTOt4=;
 b=UxmRLOpoJaRX3LG7nknYxAvYLMtTRzTHDxf856bNVS9ARDz5v1rFZzpicIM/W/Yr9y
 olFL4j4JkQ/u5Jq/8w/l3zkhsTChBMhGlK4s8Q9WmFkHtjDGAMY1A+0odjXLtekvMf1q
 +miJE3yMnDXxEcOAGgflKb8qvFmKTp2pF0JyW4yVFJUaqDVWgjeJF/BVBw8zyyXi9SOJ
 Ko1s1rTsWYfkm0hni5YDEAwWUSvA1LkRYDZ+AI3c5qeLt6J8zQf6e0K/CG1HAtSwx8TQ
 LF7tgI8xtOhKFYDIRHzr61k5S13UK5pMqhaMJKvwslhWabO6Lrs2x5jnj7OuZFWA7F7t
 FZUA==
X-Gm-Message-State: AOAM533FQFKtd0pme0UC9LHkY4tYHQrVNs9FOnTDPmQjX/xibRvXEELj
 Swgzu/z3BTSXu6hti2HcBD8ktA==
X-Google-Smtp-Source: ABdhPJyBaTEGZWJI2ONWqN2OUsF3IZu6NR88fGolTA+42XdnsLtGBglsyDojfqJhJud4GZYSwgJsuA==
X-Received: by 2002:a05:6e02:1a68:: with SMTP id
 w8mr5028288ilv.129.1617841253635; 
 Wed, 07 Apr 2021 17:20:53 -0700 (PDT)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id 11sm1818393ilg.53.2021.04.07.17.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 17:20:53 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH v6 2/4] target/arm: Add support for FEAT_TLBIRANGE
Date: Wed,  7 Apr 2021 18:20:37 -0600
Message-Id: <20210408002039.18027-3-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210408002039.18027-1-rebecca@nuviainc.com>
References: <20210408002039.18027-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x135.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ARMv8.4 adds the mandatory FEAT_TLBIRANGE. It provides TLBI
maintenance instructions that apply to a range of input addresses.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu.h    |   5 +
 target/arm/helper.c | 294 ++++++++++++++++++++
 2 files changed, 299 insertions(+)

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
index d9220be7c5a0..ce913deff490 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4759,6 +4759,217 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
+    ARMMMUIdx mask;
+    int bits;
+    uint64_t pageaddr;
+    uint64_t length;
+
+    CPUState *cs = env_cpu(env);
+    mask = vae1_tlbmask(env);
+    if (regime_has_2_ranges(ctz32(mask))) {
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
+    if (regime_has_2_ranges(ctz32(mask))) {
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
+     * Currently handles all of RVAE3, RVAAE3, RVAALE3 and RVALE3,
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
@@ -6920,6 +7131,86 @@ static const ARMCPRegInfo pauth_reginfo[] = {
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
@@ -8289,6 +8580,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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



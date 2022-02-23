Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C180C4C1F27
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:54:04 +0100 (CET)
Received: from localhost ([::1]:56462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0WJ-0001ck-Sz
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:54:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0BB-0007Di-Dn
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:32:15 -0500
Received: from [2607:f8b0:4864:20::52a] (port=34622
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0B7-0001JW-H7
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:32:12 -0500
Received: by mail-pg1-x52a.google.com with SMTP id 139so100099pge.1
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 14:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=19hfjB18qiT1jmcGWmvL02wOHBgHmeraSiuqJSfuTKE=;
 b=fboG4XYxuwhNIrOwWSpRKkeUdgCF6i5/UsCu2/T7o3XMrZAAXpWIDsITLMURkhlSfn
 CHNe7H6UkjTvcuzUknyU+p2rvdzOH5fAvUaA0EkNR9NCcj5+kQrzIgsMM/PGIXeAJHk8
 yW2dZDlT3duyECfo+EjVqgWGtdQlg+PDQxmOo5hwcC92kLHJPuh3y846DHYLkyYhTvbk
 QVh/ABHm/Txdy4KoQdJh66U0HT4XjHJZghJQTen9A4k8k4lcuYvsxcl+D802ev1WURuM
 fnTUPQuvFg5clDh/XA9L/bKU1As2ZvBRcwyhhfcNGG38q29qjG2u25QuQ8bbl4y6Bfyv
 nT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=19hfjB18qiT1jmcGWmvL02wOHBgHmeraSiuqJSfuTKE=;
 b=thS7o3rVzLQ9L5jg1NQygasMVdr25Vq29/7fXGMFuYiVH37wctxGV8Rdgao1RnBhMW
 TqdWsToUR3bQ+F4OpmPuEFgNX0/1MYapJo44r3RgYWd3Ds9fxy7WgX4fer7Ppm8VKP/0
 ozQ5UEebXjRdeY49m7zBPVq4HgDfPz/cMan3U6ipzDNHtrmn2uNDjXF5gDiJhVAif5oF
 zEVledxe0useqAA/Uedcp7Zx5n5U/5NtewsW0crSjGqGIsv697OoWYrwJmJWFgZkPZju
 qOd+sTOwdoMho2oLfuIZAGPNRAVsmVcLDh541WDB7HJAilu0H7J+OfrZT2l9adq6iA6N
 iEbA==
X-Gm-Message-State: AOAM531Mww2ne0HU22nvZgtTrr8XZqbqWzzboR94sR3EKQ43HLDzUS2b
 FftWbIsZwchPlZkHNA8wTwcv+NZd/+6Pvw==
X-Google-Smtp-Source: ABdhPJw/LpsNzAyJGKb5C2SXFQt5j2Gpw5SSK2M4fLvzNdlrn4QsxkNWEY3aSCgCeUcTHYUthTYpKw==
X-Received: by 2002:a05:6a00:2311:b0:4e1:52bf:e466 with SMTP id
 h17-20020a056a00231100b004e152bfe466mr1903687pfh.77.1645655527993; 
 Wed, 23 Feb 2022 14:32:07 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 14:32:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/17] target/arm: Implement FEAT_LPA2
Date: Wed, 23 Feb 2022 12:31:37 -1000
Message-Id: <20220223223137.114264-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This feature widens physical addresses (and intermediate physical
addresses for 2-stage translation) from 48 to 52 bits, when using
4k or 16k pages.

This introduces the DS bit to TCR_ELx, which is RES0 unless the
page size is enabled and supports LPA2, resulting in the effective
value of DS for a given table walk.  The DS bit changes the format
of the page table descriptor slightly, moving the PS field out to
TCR so that all pages have the same sharability and repurposing
those bits of the page table descriptor for the highest bits of
the output address.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Check DS in tlbi_aa64_get_range.
    Check TGRAN4_2 and TGRAN16_2.
---
 docs/system/arm/emulation.rst |   1 +
 target/arm/cpu.h              |  22 ++++++++
 target/arm/internals.h        |   2 +
 target/arm/cpu64.c            |   7 ++-
 target/arm/helper.c           | 102 +++++++++++++++++++++++++++++-----
 5 files changed, 116 insertions(+), 18 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 0053ddce20..520fd39071 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -25,6 +25,7 @@ the following architecture extensions:
 - FEAT_JSCVT (JavaScript conversion instructions)
 - FEAT_LOR (Limited ordering regions)
 - FEAT_LPA (Large Physical Address space)
+- FEAT_LPA2 (Large Physical and virtual Address space v2)
 - FEAT_LRCPC (Load-acquire RCpc instructions)
 - FEAT_LRCPC2 (Load-acquire RCpc instructions v2)
 - FEAT_LSE (Large System Extensions)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c52d56f669..24d9fff170 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4284,6 +4284,28 @@ static inline bool isar_feature_aa64_i8mm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, I8MM) != 0;
 }
 
+static inline bool isar_feature_aa64_tgran4_lpa2(const ARMISARegisters *id)
+{
+    return FIELD_SEX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN4) >= 1;
+}
+
+static inline bool isar_feature_aa64_tgran4_2_lpa2(const ARMISARegisters *id)
+{
+    unsigned t = FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN4_2);
+    return t >= 3 || (t == 0 && isar_feature_aa64_tgran4_lpa2(id));
+}
+
+static inline bool isar_feature_aa64_tgran16_lpa2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN16) >= 2;
+}
+
+static inline bool isar_feature_aa64_tgran16_2_lpa2(const ARMISARegisters *id)
+{
+    unsigned t = FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN16_2);
+    return t >= 3 || (t == 0 && isar_feature_aa64_tgran16_lpa2(id));
+}
+
 static inline bool isar_feature_aa64_ccidx(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, CCIDX) != 0;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 00af41d792..a34be2e459 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1056,6 +1056,7 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
 typedef struct ARMVAParameters {
     unsigned tsz    : 8;
     unsigned ps     : 3;
+    unsigned sh     : 2;
     unsigned select : 1;
     bool tbi        : 1;
     bool epd        : 1;
@@ -1063,6 +1064,7 @@ typedef struct ARMVAParameters {
     bool using16k   : 1;
     bool using64k   : 1;
     bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
+    bool ds         : 1;
 } ARMVAParameters;
 
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2fdc16bf18..fc3c65ab2a 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -796,10 +796,11 @@ static void aarch64_max_initfn(Object *obj)
 
     t = cpu->isar.id_aa64mmfr0;
     t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
-    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */
-    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 2); /* 16k stage2 supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 2);   /* 16k pages w/ LPA2 */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4, 1);    /*  4k pages w/ LPA2 */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 3); /* 16k stage2 w/ LPA2 */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 3);  /*  4k stage2 w/ LPA2 */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN64_2, 2); /* 64k stage2 supported */
-    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 2);  /*  4k stage2 supported */
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3a7f5cf6f0..088956eecf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4546,6 +4546,14 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
     } else {
         ret.base = extract64(value, 0, 37);
     }
+    if (param.ds) {
+        /*
+         * With DS=1, BaseADDR is always shifted 16 so that it is able
+         * to address all 52 va bits.  The input address is perforce
+         * aligned on a 64k boundary regardless of translation granule.
+         */
+        page_shift = 16;
+    }
     ret.base <<= page_shift;
 
     return ret;
@@ -11081,8 +11089,13 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
     const int grainsize = stride + 3;
     int startsizecheck;
 
-    /* Negative levels are never allowed.  */
-    if (level < 0) {
+    /*
+     * Negative levels are usually not allowed...
+     * Except for FEAT_LPA2, 4k page table, 52-bit address space, which
+     * begins with level -1.  Note that previous feature tests will have
+     * eliminated this combination if it is not enabled.
+     */
+    if (level < (inputsize == 52 && stride == 9 ? -1 : 0)) {
         return false;
     }
 
@@ -11223,8 +11236,9 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
-    bool epd, hpd, using16k, using64k, tsz_oob;
-    int select, tsz, tbi, max_tsz, min_tsz, ps;
+    bool epd, hpd, using16k, using64k, tsz_oob, ds;
+    int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
+    ARMCPU *cpu = env_archcpu(env);
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -11238,7 +11252,9 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract32(tcr, 24, 1);
         }
         epd = false;
+        sh = extract32(tcr, 12, 2);
         ps = extract32(tcr, 16, 3);
+        ds = extract64(tcr, 32, 1);
     } else {
         /*
          * Bit 55 is always between the two regions, and is canonical for
@@ -11248,6 +11264,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         if (!select) {
             tsz = extract32(tcr, 0, 6);
             epd = extract32(tcr, 7, 1);
+            sh = extract32(tcr, 12, 2);
             using64k = extract32(tcr, 14, 1);
             using16k = extract32(tcr, 15, 1);
             hpd = extract64(tcr, 41, 1);
@@ -11257,24 +11274,51 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             using64k = tg == 3;
             tsz = extract32(tcr, 16, 6);
             epd = extract32(tcr, 23, 1);
+            sh = extract32(tcr, 28, 2);
             hpd = extract64(tcr, 42, 1);
         }
         ps = extract64(tcr, 32, 3);
+        ds = extract64(tcr, 59, 1);
     }
 
-    if (cpu_isar_feature(aa64_st, env_archcpu(env))) {
+    if (cpu_isar_feature(aa64_st, cpu)) {
         max_tsz = 48 - using64k;
     } else {
         max_tsz = 39;
     }
 
+    /*
+     * DS is RES0 unless FEAT_LPA2 is supported for the given page size;
+     * adjust the effective value of DS, as documented.
+     */
     min_tsz = 16;
     if (using64k) {
-        if (cpu_isar_feature(aa64_lva, env_archcpu(env))) {
+        if (cpu_isar_feature(aa64_lva, cpu)) {
+            min_tsz = 12;
+        }
+        ds = false;
+    } else if (ds) {
+        switch (mmu_idx) {
+        case ARMMMUIdx_Stage2:
+        case ARMMMUIdx_Stage2_S:
+            if (using16k) {
+                ds = cpu_isar_feature(aa64_tgran16_2_lpa2, cpu);
+            } else {
+                ds = cpu_isar_feature(aa64_tgran4_2_lpa2, cpu);
+            }
+            break;
+        default:
+            if (using16k) {
+                ds = cpu_isar_feature(aa64_tgran16_lpa2, cpu);
+            } else {
+                ds = cpu_isar_feature(aa64_tgran4_lpa2, cpu);
+            }
+            break;
+        }
+        if (ds) {
             min_tsz = 12;
         }
     }
-    /* TODO: FEAT_LPA2 */
 
     if (tsz > max_tsz) {
         tsz = max_tsz;
@@ -11296,6 +11340,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     return (ARMVAParameters) {
         .tsz = tsz,
         .ps = ps,
+        .sh = sh,
         .select = select,
         .tbi = tbi,
         .epd = epd,
@@ -11303,6 +11348,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .using16k = using16k,
         .using64k = using64k,
         .tsz_oob = tsz_oob,
+        .ds = ds,
     };
 }
 
@@ -11528,10 +11574,19 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
          */
         uint32_t sl0 = extract32(tcr->raw_tcr, 6, 2);
+        uint32_t sl2 = extract64(tcr->raw_tcr, 33, 1);
         uint32_t startlevel;
         bool ok;
 
-        if (!aarch64 || stride == 9) {
+        /* SL2 is RES0 unless DS=1 & 4kb granule. */
+        if (param.ds && stride == 9 && sl2) {
+            if (sl0 != 0) {
+                level = 0;
+                fault_type = ARMFault_Translation;
+                goto do_fault;
+            }
+            startlevel = -1;
+        } else if (!aarch64 || stride == 9) {
             /* AArch32 or 4KB pages */
             startlevel = 2 - sl0;
 
@@ -11585,10 +11640,12 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      * for both v7 and v8.  However, for v8 the SBZ bits [47:40] must be 0
      * or an AddressSize fault is raised.  So for v8 we extract those SBZ
      * bits as part of the address, which will be checked via outputsize.
-     * For AArch64, the address field always goes up to bit 47 (with extra
-     * bits for FEAT_LPA placed elsewhere).  AArch64 implies v8.
+     * For AArch64, the address field goes up to bit 47, or 49 with FEAT_LPA2;
+     * the highest bits of a 52-bit output are placed elsewhere.
      */
-    if (arm_feature(env, ARM_FEATURE_V8)) {
+    if (param.ds) {
+        descaddrmask = MAKE_64BIT_MASK(0, 50);
+    } else if (arm_feature(env, ARM_FEATURE_V8)) {
         descaddrmask = MAKE_64BIT_MASK(0, 48);
     } else {
         descaddrmask = MAKE_64BIT_MASK(0, 40);
@@ -11623,11 +11680,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
         /*
          * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [15:12]
-         * of descriptor.  Otherwise, if descaddr is out of range, raise
-         * AddressSizeFault.
+         * of descriptor.  For FEAT_LPA2 and effective DS, bits [51:50] of
+         * descaddr are in [9:8].  Otherwise, if descaddr is out of range,
+         * raise AddressSizeFault.
          */
         if (outputsize > 48) {
-            descaddr |= extract64(descriptor, 12, 4) << 48;
+            if (param.ds) {
+                descaddr |= extract64(descriptor, 8, 2) << 50;
+            } else {
+                descaddr |= extract64(descriptor, 12, 4) << 48;
+            }
         } else if (descaddr >> outputsize) {
             fault_type = ARMFault_AddressSize;
             goto do_fault;
@@ -11721,7 +11783,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         assert(attrindx <= 7);
         cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
     }
-    cacheattrs->shareability = extract32(attrs, 6, 2);
+
+    /*
+     * For FEAT_LPA2 and effective DS, the SH field in the attributes
+     * was re-purposed for output address bits.  The SH attribute in
+     * that case comes from TCR_ELx, which we extracted earlier.
+     */
+    if (param.ds) {
+        cacheattrs->shareability = param.sh;
+    } else {
+        cacheattrs->shareability = extract32(attrs, 6, 2);
+    }
 
     *phys_ptr = descaddr;
     *page_size_ptr = page_size;
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2FB46DEFA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 00:18:42 +0100 (CET)
Received: from localhost ([::1]:47480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv6Cv-0006ov-Ba
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 18:18:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mv66V-0005DA-2R
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 18:12:03 -0500
Received: from [2607:f8b0:4864:20::1031] (port=34571
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mv66R-0004nN-OG
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 18:12:02 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 j5-20020a17090a318500b001a6c749e697so4911151pjb.1
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 15:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=J/dJZhp4tYu7wqYDqWQx/znhFVjWKRlJoKxN5tcfeHc=;
 b=IOvWIYShmAI+HNwmS31OEjEzRP4johVjr5XNAPLSWxkItnc0tf4Bz+hUtmpa0pDZa2
 Jw3MohuNKuHbKc1BuP7ZlHpVnnzkMuseAZErtke3XNlVOlqWvAP6n577gIc4EUKWGTxJ
 g1T4dsZeFzl839nXzgcOWXlNh7u76RO4zWHvu5hN3MtVZbW64MjrKl2TrQ+6Es/wAEI4
 SzSPCnzS8QWepCHYu3n02EHHxHlP2/UmqQXQ7iUZBH2iz0+2I2S6RQqOimcH60IF9PJZ
 pNiDTULuK7mtLKiwasHnI2XrQ0Og2KyZdecj+v4JRly1MVfHYSJAZgsMHCclXbXu0Cb5
 Goew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J/dJZhp4tYu7wqYDqWQx/znhFVjWKRlJoKxN5tcfeHc=;
 b=LrkI0JZteG2Miu2tKheVNxAqTYbaVoYwU56D0FJjIlK0SmYKCBu9sxn7lv3kOnZVx/
 bAtYuckAVHiujwNbIiFgtsEP518IXGvyHnirZTcqxyE0O0lpZ3lolI5m6HK+VxFCjruM
 YRTAoVDeqApnOPFT8+IiikJ5DxB9M+jx/VFIy9W7jiNfXcXMIaYoLibynmkl5bPGf5kJ
 l0kdW3jXNWDf852S40KJ9nXtOWpcaow+GOFu5QP1EbjdA6xTwZshetOmlqpi24zowerl
 RlYvlKmK3syxBiFj7eOAhTWlq9ghURNToVHb1sxp5sY2UAoW9za/KmH5TWYHHPjDOwqV
 7LnQ==
X-Gm-Message-State: AOAM5323G6MMGEeFANWbIL+Gp3PmjnbO5Yr/nWesGejYM5WPGlWFyeju
 sEMC9W2J7j4ulXdse2cJLDWRBVzbUsMDLg==
X-Google-Smtp-Source: ABdhPJwtIpB+nyVoDF/entRBambFbZje1+X+kZtuNOEOCcB8kYS2rc64BQMn8Bh+EHWGQ4nmgDz39A==
X-Received: by 2002:a17:902:b7c8:b0:141:9ddb:33e7 with SMTP id
 v8-20020a170902b7c800b001419ddb33e7mr63387132plz.60.1639005118430; 
 Wed, 08 Dec 2021 15:11:58 -0800 (PST)
Received: from localhost.localdomain
 (45-19-222-18.lightspeed.sntcca.sbcglobal.net. [45.19.222.18])
 by smtp.gmail.com with ESMTPSA id k15sm3301062pgn.91.2021.12.08.15.11.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 15:11:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] target/arm: Honor TCR_ELx.{I}PS
Date: Wed,  8 Dec 2021 15:11:51 -0800
Message-Id: <20211208231154.392029-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208231154.392029-1-richard.henderson@linaro.org>
References: <20211208231154.392029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This field controls the output (intermediate) physical address size
of the translation process.  V8 requires to raise an AddressSize
fault if the page tables are programmed incorrectly, such that any
intermediate descriptor address, or the final translated address,
is out of range.

Add an outputsize field to ARMVAParameters, and fill it in during
aa64_va_parameters.  Pass the value to check_s2_mmu_setup to use
instead of the raw PAMax value.  Test the descaddr as extracted
from TTBR and from page table entries.

Restrict descaddrmask so that we won't raise the fault for v7.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  1 +
 target/arm/helper.c    | 92 +++++++++++++++++++++++++++++-------------
 2 files changed, 65 insertions(+), 28 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 27d2fcd26c..3e801833b4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1032,6 +1032,7 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
  */
 typedef struct ARMVAParameters {
     unsigned tsz    : 8;
+    unsigned ps     : 3;
     unsigned select : 1;
     bool tbi        : 1;
     bool epd        : 1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index fab9ee70d8..568914bd42 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11003,7 +11003,7 @@ do_fault:
  * false otherwise.
  */
 static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
-                               int inputsize, int stride)
+                               int inputsize, int stride, int outputsize)
 {
     const int grainsize = stride + 3;
     int startsizecheck;
@@ -11019,22 +11019,19 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
     }
 
     if (is_aa64) {
-        CPUARMState *env = &cpu->env;
-        unsigned int pamax = arm_pamax(cpu);
-
         switch (stride) {
         case 13: /* 64KB Pages.  */
-            if (level == 0 || (level == 1 && pamax <= 42)) {
+            if (level == 0 || (level == 1 && outputsize <= 42)) {
                 return false;
             }
             break;
         case 11: /* 16KB Pages.  */
-            if (level == 0 || (level == 1 && pamax <= 40)) {
+            if (level == 0 || (level == 1 && outputsize <= 40)) {
                 return false;
             }
             break;
         case 9: /* 4KB Pages.  */
-            if (level == 0 && pamax <= 42) {
+            if (level == 0 && outputsize <= 42) {
                 return false;
             }
             break;
@@ -11043,8 +11040,8 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
         }
 
         /* Inputsize checks.  */
-        if (inputsize > pamax &&
-            (arm_el_is_aa64(env, 1) || inputsize > 40)) {
+        if (inputsize > outputsize &&
+            (arm_el_is_aa64(&cpu->env, 1) || inputsize > 40)) {
             /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.  */
             return false;
         }
@@ -11090,17 +11087,19 @@ static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
+/* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
+static const uint8_t pamax_map[] = {
+    [0] = 32,
+    [1] = 36,
+    [2] = 40,
+    [3] = 42,
+    [4] = 44,
+    [5] = 48,
+};
+
 /* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
 unsigned int arm_pamax(ARMCPU *cpu)
 {
-    static const unsigned int pamax_map[] = {
-        [0] = 32,
-        [1] = 36,
-        [2] = 40,
-        [3] = 42,
-        [4] = 44,
-        [5] = 48,
-    };
     unsigned int parange =
         FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
 
@@ -11151,7 +11150,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
     bool epd, hpd, using16k, using64k;
-    int select, tsz, tbi;
+    int select, tsz, tbi, ps;
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -11165,6 +11164,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract32(tcr, 24, 1);
         }
         epd = false;
+        ps = extract64(tcr, 16, 3);
     } else {
         /*
          * Bit 55 is always between the two regions, and is canonical for
@@ -11185,6 +11185,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             epd = extract32(tcr, 23, 1);
             hpd = extract64(tcr, 42, 1);
         }
+        ps = extract64(tcr, 32, 3);
     }
 
     /* Present TBI as a composite with TBID.  */
@@ -11196,6 +11197,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 
     return (ARMVAParameters) {
         .tsz = tsz,
+        .ps = ps,
         .select = select,
         .tbi = tbi,
         .epd = epd,
@@ -11312,7 +11314,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     target_ulong page_size;
     uint32_t attrs;
     int32_t stride;
-    int addrsize, inputsize;
+    int addrsize, inputsize, outputsize;
     TCR *tcr = regime_tcr(env, mmu_idx);
     int ap, ns, xn, pxn;
     uint32_t el = regime_el(env, mmu_idx);
@@ -11323,6 +11325,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
         int min_tsz = 16, max_tsz = 39;  /* TODO: ARMv8.2-LVA  */
+        int parange;
 
         param = aa64_va_parameters(env, address, mmu_idx,
                                    access_type != MMU_INST_FETCH);
@@ -11348,11 +11351,22 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
         addrsize = 64 - 8 * param.tbi;
         inputsize = 64 - param.tsz;
+
+        /*
+         * Bound PS by PARANGE to find the effective output address size.
+         * ID_AA64MMFR0 is a read-only register so values outside of the
+         * supported mappings can be considered an implementation error.
+         */
+        parange = FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
+        parange = MIN(parange, param.ps);
+        assert(parange < ARRAY_SIZE(pamax_map));
+        outputsize = pamax_map[parange];
     } else {
         param = aa32_va_parameters(env, address, mmu_idx);
         level = 1;
         addrsize = (mmu_idx == ARMMMUIdx_Stage2 ? 40 : 32);
         inputsize = addrsize - param.tsz;
+        outputsize = 40;
     }
 
     /*
@@ -11437,7 +11451,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
         /* Check that the starting level is valid. */
         ok = check_s2_mmu_setup(cpu, aarch64, startlevel,
-                                inputsize, stride);
+                                inputsize, stride, outputsize);
         if (!ok) {
             fault_type = ARMFault_Translation;
             goto do_fault;
@@ -11445,24 +11459,41 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         level = startlevel;
     }
 
-    indexmask_grainsize = (1ULL << (stride + 3)) - 1;
-    indexmask = (1ULL << (inputsize - (stride * (4 - level)))) - 1;
+    indexmask_grainsize = MAKE_64BIT_MASK(0, stride + 3);
+    indexmask = MAKE_64BIT_MASK(0, inputsize - (stride * (4 - level)));
 
     /* Now we can extract the actual base address from the TTBR */
     descaddr = extract64(ttbr, 0, 48);
+
+    /*
+     * If the base address is out of range, raise AddressSizeFault.
+     * In the pseudocode, this is !IsZero(baseregister<47:outputsize>),
+     * but we've just cleared the bits above 47, so simplify the test.
+     */
+    if (descaddr >> outputsize) {
+        level = 0;
+        fault_type = ARMFault_AddressSize;
+        goto do_fault;
+    }
+
     /*
      * We rely on this masking to clear the RES0 bits at the bottom of the TTBR
      * and also to mask out CnP (bit 0) which could validly be non-zero.
      */
     descaddr &= ~indexmask;
 
-    /* The address field in the descriptor goes up to bit 39 for ARMv7
-     * but up to bit 47 for ARMv8, but we use the descaddrmask
-     * up to bit 39 for AArch32, because we don't need other bits in that case
-     * to construct next descriptor address (anyway they should be all zeroes).
+    /*
+     * The address field in the descriptor goes up to bit 39 for ARMv7
+     * but up to bit 47 for ARMv8.  In ARMv7, those middle bits are SBZP,
+     * but in ARMv8 they are checked for zero and an AddressSize fault
+     * is raised if they are not.
      */
-    descaddrmask = ((1ull << (aarch64 ? 48 : 40)) - 1) &
-                   ~indexmask_grainsize;
+    if (aarch64 || arm_feature(env, ARM_FEATURE_V8)) {
+        descaddrmask = MAKE_64BIT_MASK(0, 48);
+    } else {
+        descaddrmask = MAKE_64BIT_MASK(0, 40);
+    }
+    descaddrmask &= ~indexmask_grainsize;
 
     /* Secure accesses start with the page table in secure memory and
      * can be downgraded to non-secure at any step. Non-secure accesses
@@ -11487,7 +11518,12 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
             /* Invalid, or the Reserved level 3 encoding */
             goto do_fault;
         }
+
         descaddr = descriptor & descaddrmask;
+        if (descaddr >> outputsize) {
+            fault_type = ARMFault_AddressSize;
+            goto do_fault;
+        }
 
         if ((descriptor & 2) && (level < 3)) {
             /* Table entry. The top five bits are attributes which may
-- 
2.25.1



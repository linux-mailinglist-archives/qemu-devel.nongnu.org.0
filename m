Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BF14C1ECB
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:44:16 +0100 (CET)
Received: from localhost ([::1]:33044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0Mp-0002Lu-D4
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:44:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0Av-0006ww-AB
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:31:57 -0500
Received: from [2607:f8b0:4864:20::102f] (port=39809
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0Ar-0001EZ-Ub
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:31:56 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 h17-20020a17090acf1100b001bc68ecce4aso3978319pju.4
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 14:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4y89pQ0OdmVIqwd6NdNcqx8YrKd1GuWayeQiD4wW2NU=;
 b=Z8zPDZfPN18iEOEzjhnS6MKg+S84OsixiiLfXVdyBWC1ZgRB3YWlFUX2CDg9b3GrR6
 /9xrkT19NUIMjXHs3RP5BWHGiq5QeXsi3+9eBgDnIO0dlv1ardly/P5jergM887C5AIQ
 YNgJ9HCNmtP3oMdl2k0t0ZMAY3kE8MEmSohOboaeIRk8a0v/zscmYUQdEiXhl7m8gaP3
 hktauuiLBtFLDTwreMBkVmemli1yvkX2y5wA5shT7HjFF+4Y5UMsbgcqb4kL/XuhhjI/
 Wf47CVV3htPYCKWjIzatF6Rp/eBM8HUhEkBMF/7FW4UV8eeUJY+iVBUEJrQe3VvALTbG
 R5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4y89pQ0OdmVIqwd6NdNcqx8YrKd1GuWayeQiD4wW2NU=;
 b=rFuJcnk7scb0+zDg2HtvjbKEMyCsmA7UIIc8bTbvYY21Ue5juiMJeQRdaAJUmLkIB2
 amnft1nbiRZ4gD6HN5A+CT28y3itB/c/uB4u4eLSvm9QXUbmDlc65CAH7ZKq2Ndy4hRE
 0J4OngRdt5LISPQAElh/YMirhCTJQDNEbRZRB64S9NgsSdhpUjRhttAEiy6hW0+ThbYo
 bGnsWkdU1tPKKhDHGl7Jaa+5E3/f7j9x1Dnads5mz+zrXoD720oR8Mx66qVnBVMKr2LJ
 hc5GkeCefH01OVOulaHO/zon77qqsQbxKtE8aEJ+G22FpyHCIPdN8i+/GmsC2ibYaRBu
 vPzA==
X-Gm-Message-State: AOAM532qYfkSThC8ncT7grTzox5LWYMxNKme+BrxoKS6epm3DoV7j7ab
 uAWBYEJfG6RwqyyD8bUzbsS8ipD4uJOR/Q==
X-Google-Smtp-Source: ABdhPJxhDFig15Q9NqAn4W6/VtX1zzoDBrbS/gUxF4ylSRS/3awSbwc7Lm8A/p0SfT0fpUbyBPgQjQ==
X-Received: by 2002:a17:902:e84e:b0:14e:cbf5:a9c6 with SMTP id
 t14-20020a170902e84e00b0014ecbf5a9c6mr1855153plg.169.1645655512485; 
 Wed, 23 Feb 2022 14:31:52 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 14:31:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/17] target/arm: Honor TCR_ELx.{I}PS
Date: Wed, 23 Feb 2022 12:31:27 -1000
Message-Id: <20220223223137.114264-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

This field controls the output (intermediate) physical address size
of the translation process.  V8 requires to raise an AddressSize
fault if the page tables are programmed incorrectly, such that any
intermediate descriptor address, or the final translated address,
is out of range.

Add a PS field to ARMVAParameters, and properly compute outputsize
in get_phys_addr_lpae.  Test the descaddr as extracted from TTBR
and from page table entries.

Restrict descaddrmask so that we won't raise the fault for v7.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  1 +
 target/arm/helper.c    | 72 ++++++++++++++++++++++++++++++++----------
 2 files changed, 57 insertions(+), 16 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index fefd1fb8d8..3d3d41ba2b 100644
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
index 675aec4bf3..c002100979 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11149,17 +11149,19 @@ static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
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
 
@@ -11210,7 +11212,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
     bool epd, hpd, using16k, using64k, tsz_oob;
-    int select, tsz, tbi, max_tsz, min_tsz;
+    int select, tsz, tbi, max_tsz, min_tsz, ps;
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -11224,6 +11226,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract32(tcr, 24, 1);
         }
         epd = false;
+        ps = extract32(tcr, 16, 3);
     } else {
         /*
          * Bit 55 is always between the two regions, and is canonical for
@@ -11244,6 +11247,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             epd = extract32(tcr, 23, 1);
             hpd = extract64(tcr, 42, 1);
         }
+        ps = extract64(tcr, 32, 3);
     }
 
     if (cpu_isar_feature(aa64_st, env_archcpu(env))) {
@@ -11272,6 +11276,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 
     return (ARMVAParameters) {
         .tsz = tsz,
+        .ps = ps,
         .select = select,
         .tbi = tbi,
         .epd = epd,
@@ -11399,6 +11404,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
+        int ps;
+
         param = aa64_va_parameters(env, address, mmu_idx,
                                    access_type != MMU_INST_FETCH);
         level = 0;
@@ -11419,7 +11426,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
         addrsize = 64 - 8 * param.tbi;
         inputsize = 64 - param.tsz;
-        outputsize = arm_pamax(cpu);
+
+        /*
+         * Bound PS by PARANGE to find the effective output address size.
+         * ID_AA64MMFR0 is a read-only register so values outside of the
+         * supported mappings can be considered an implementation error.
+         */
+        ps = FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
+        ps = MIN(ps, param.ps);
+        assert(ps < ARRAY_SIZE(pamax_map));
+        outputsize = pamax_map[ps];
     } else {
         param = aa32_va_parameters(env, address, mmu_idx);
         level = 1;
@@ -11523,19 +11539,38 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
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
+     * For AArch32, the address field in the descriptor goes up to bit 39
+     * for both v7 and v8.  However, for v8 the SBZ bits [47:40] must be 0
+     * or an AddressSize fault is raised.  So for v8 we extract those SBZ
+     * bits as part of the address, which will be checked via outputsize.
+     * For AArch64, the address field always goes up to bit 47 (with extra
+     * bits for FEAT_LPA placed elsewhere).  AArch64 implies v8.
      */
-    descaddrmask = ((1ull << (aarch64 ? 48 : 40)) - 1) &
-                   ~indexmask_grainsize;
+    if (arm_feature(env, ARM_FEATURE_V8)) {
+        descaddrmask = MAKE_64BIT_MASK(0, 48);
+    } else {
+        descaddrmask = MAKE_64BIT_MASK(0, 40);
+    }
+    descaddrmask &= ~indexmask_grainsize;
 
     /* Secure accesses start with the page table in secure memory and
      * can be downgraded to non-secure at any step. Non-secure accesses
@@ -11560,7 +11595,12 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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



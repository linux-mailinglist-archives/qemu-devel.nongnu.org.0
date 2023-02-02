Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D246876C9
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 08:54:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNUOw-0001Pn-3N; Thu, 02 Feb 2023 02:52:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNUOu-0001P4-2N
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:52:56 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNUOr-0007kT-Sb
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:52:55 -0500
Received: by mail-pl1-x62e.google.com with SMTP id r8so1061728pls.2
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 23:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BC1d9xfabeQA6e7b/ATlm8p465b5RUa/Id8p1TO595Q=;
 b=EIHgRZHcDMxKy2FpiQwAVVRHI7A4s2kcKcdIHX0zyzFriVxCbPmEBlrH2A7blVjiFU
 bb7l1GEL7vObvDEma67hT7NuFHfsB+l1K9P7yl/MbYIbx3l1LMj4vwC5wKsc6Dmtn2BP
 XXcWHnh9UFptfaPO4R2mN2godblZwkdhX1y9SsrRQvbTrKu2H4CaBa3zfh6+BA63hU3a
 rUf5xBxEiiZJXjx0ynzoyU6881hIziMWrKpcmutK0wHvE8Pn9s6ShNYgVzWljpNGxRcj
 93tNQn0XOpoELlwoNj8J86NLbdlJU/oevnV8nVSIsSY0lmjFzBCMtSzHRLvqoopCPG8a
 TMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BC1d9xfabeQA6e7b/ATlm8p465b5RUa/Id8p1TO595Q=;
 b=ns4lYeQJyG8JhO8v7Gp+YWmWqQIIt9DLCz1lNowuk445VZ4xgqTw0kFWnCcpK4RhBg
 IwRcHZMGtR9QYm4rCxKBJsawno5pGlRA8VtEtaylSpRrfaZ74p5/p0SnvPhI2qNA358v
 as7XK/oK7BeWlCi3xG+3i0r/qOWtaszml/ZIJnfl4o+QW9OkID7dEHn6R1QxuLvYc+C9
 UhrR3O0Z04kFhXi7haJb/fKhsETN/eT4eneIOCAHiw3Pv+eLTrnot6JiuN5fOi92W1p6
 TfcZDq3/IpOuCb2C9luYPsaaveYmxLnwiz5U0qPTTXbGIN3sIGJb5icSHLVOhiZbIjZI
 S9IQ==
X-Gm-Message-State: AO0yUKX+VJDUAyHcryNyO/Olg5ZlKXh6ju8dS01m00eNBg6NARR/PjrC
 Vn4FxVxMQEChgjPG9A9gJnytBelsp4D45HXp
X-Google-Smtp-Source: AK7set8IPJj7JNwP6MHgFPexYdKUxFj/DT6Ts8RgK9alxjLYpoeBcQW+5Py5Y6sweQaky8FugtOK9A==
X-Received: by 2002:a17:90a:190:b0:22c:8ba1:bd73 with SMTP id
 16-20020a17090a019000b0022c8ba1bd73mr5403884pjc.18.1675324372437; 
 Wed, 01 Feb 2023 23:52:52 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a17090a7ac400b0022c35afad5bsm2496763pjl.16.2023.02.01.23.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 23:52:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anders.roxell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 3/4] target/arm: Use FIELD for ARMVAParameters
Date: Wed,  1 Feb 2023 21:52:41 -1000
Message-Id: <20230202075242.260793-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202075242.260793-1-richard.henderson@linaro.org>
References: <20230202075242.260793-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Use hw/registerfields.h instead of bitfields for ARMVAParameters.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h          | 19 ++++++++++++++
 target/arm/internals.h    | 20 ---------------
 target/arm/helper.c       | 36 +++++++++++++-------------
 target/arm/pauth_helper.c | 20 +++++++++------
 target/arm/ptw.c          | 53 +++++++++++++++++++++------------------
 5 files changed, 79 insertions(+), 69 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8cf70693be..e961afe88a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -225,6 +225,25 @@ typedef struct CPUARMTBFlags {
     target_ulong flags2;
 } CPUARMTBFlags;
 
+/*
+ * Parameters of a given virtual address, as extracted from the
+ * translation control register (TCR) for a given regime.
+ */
+typedef uint32_t ARMVAParameters;
+    FIELD(ARMVAP, SELECT, 0, 1)
+    FIELD(ARMVAP, TSZ, 1, 8)
+    FIELD(ARMVAP, TSZ_OOB, 9, 1)  /* tsz has been clamped to legal range */
+    FIELD(ARMVAP, PS, 10, 3)
+    FIELD(ARMVAP, SH, 13, 2)
+    FIELD(ARMVAP, GRAN, 15, 2)
+    FIELD(ARMVAP, TBID, 17, 1)    /* final TBI for data, not TCR TBID field */
+    FIELD(ARMVAP, TBII, 18, 1)    /* final TBI for insns */
+    FIELD(ARMVAP, EPD, 19, 1)
+    FIELD(ARMVAP, HPD, 20, 1)
+    FIELD(ARMVAP, DS, 21, 1)
+    FIELD(ARMVAP, HA, 22, 1)
+    FIELD(ARMVAP, HD, 23, 1)
+
 typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
 
 typedef struct CPUArchState {
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 73b37478bf..2c24c2f39f 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1063,26 +1063,6 @@ static inline int arm_granule_bits(ARMGranuleSize gran)
     }
 }
 
-/*
- * Parameters of a given virtual address, as extracted from the
- * translation control register (TCR) for a given regime.
- */
-typedef struct ARMVAParameters {
-    unsigned tsz    : 8;
-    unsigned ps     : 3;
-    unsigned sh     : 2;
-    unsigned select : 1;
-    bool tbid       : 1;  /* final TBI for data, not the TBID field */
-    bool tbii       : 1;  /* final TBI for insns */
-    bool epd        : 1;
-    bool hpd        : 1;
-    bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
-    bool ds         : 1;
-    bool ha         : 1;
-    bool hd         : 1;
-    ARMGranuleSize gran : 2;
-} ARMVAParameters;
-
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index fda0b9da75..531a4bebb3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4882,7 +4882,7 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
     gran = tlbi_range_tg_to_gran_size(page_size_granule);
 
     /* The granule encoded in value must match the granule in use. */
-    if (gran != param.gran) {
+    if (gran != FIELD_EX32(param, ARMVAP, GRAN)) {
         qemu_log_mask(LOG_GUEST_ERROR, "Invalid tlbi page size granule %d\n",
                       page_size_granule);
         return ret;
@@ -4895,12 +4895,12 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
 
     ret.length = (num + 1) << (exponent + page_shift);
 
-    if (param.select) {
+    if (FIELD_EX32(param, ARMVAP, SELECT)) {
         ret.base = sextract64(value, 0, 37);
     } else {
         ret.base = extract64(value, 0, 37);
     }
-    if (param.ds) {
+    if (FIELD_EX32(param, ARMVAP, DS)) {
         /*
          * With DS=1, BaseADDR is always shifted 16 so that it is able
          * to address all 52 va bits.  The input address is perforce
@@ -11048,6 +11048,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
     bool stage2 = regime_is_stage2(mmu_idx);
+    ARMVAParameters r;
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -11152,21 +11153,20 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     tbid = (tbid >> select) & 1;
     tbii = (tbii >> select) & 1;
 
-    return (ARMVAParameters) {
-        .tsz = tsz,
-        .ps = ps,
-        .sh = sh,
-        .select = select,
-        .tbid = tbid,
-        .tbii = tbii,
-        .epd = epd,
-        .hpd = hpd,
-        .tsz_oob = tsz_oob,
-        .ds = ds,
-        .ha = ha,
-        .hd = ha && hd,
-        .gran = gran,
-    };
+    r = FIELD_DP32(0, ARMVAP, SELECT, select);
+    r = FIELD_DP32(r, ARMVAP, TSZ, tsz);
+    r = FIELD_DP32(r, ARMVAP, TSZ_OOB, tsz_oob);
+    r = FIELD_DP32(r, ARMVAP, PS, ps);
+    r = FIELD_DP32(r, ARMVAP, SH, sh);
+    r = FIELD_DP32(r, ARMVAP, GRAN, gran);
+    r = FIELD_DP32(r, ARMVAP, TBID, tbid);
+    r = FIELD_DP32(r, ARMVAP, TBII, tbii);
+    r = FIELD_DP32(r, ARMVAP, EPD, epd);
+    r = FIELD_DP32(r, ARMVAP, HPD, hpd);
+    r = FIELD_DP32(r, ARMVAP, DS, ds);
+    r = FIELD_DP32(r, ARMVAP, HA, ha);
+    r = FIELD_DP32(r, ARMVAP, HD, ha && hd);
+    return r;
 }
 
 /*
diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index bfed6f9722..1dffcef6c3 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -296,7 +296,9 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx);
     uint64_t pac, ext_ptr, ext, test;
     int bot_bit, top_bit;
-    bool tbi = data ? param.tbid : param.tbii;
+    bool tbi = (data ? FIELD_EX32(param, ARMVAP, TBID)
+                : FIELD_EX32(param, ARMVAP, TBII));
+    int tsz = FIELD_EX32(param, ARMVAP, TSZ);
 
     /* If tagged pointers are in use, use ptr<55>, otherwise ptr<63>.  */
     if (tbi) {
@@ -307,7 +309,7 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
 
     /* Build a pointer with known good extension bits.  */
     top_bit = 64 - 8 * tbi;
-    bot_bit = 64 - param.tsz;
+    bot_bit = 64 - tsz;
     ext_ptr = deposit64(ptr, bot_bit, top_bit - bot_bit, ext);
 
     pac = pauth_computepac(env, ext_ptr, modifier, *key);
@@ -355,13 +357,15 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
 {
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
     ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx);
-    bool tbi = data ? param.tbid : param.tbii;
+    bool tbi = (data ? FIELD_EX32(param, ARMVAP, TBID)
+                : FIELD_EX32(param, ARMVAP, TBII));
+    int tsz = FIELD_EX32(param, ARMVAP, TSZ);
     int bot_bit, top_bit;
     uint64_t pac, orig_ptr, test;
 
-    orig_ptr = pauth_original_ptr(ptr, param.tsz, tbi);
+    orig_ptr = pauth_original_ptr(ptr, tsz, tbi);
     pac = pauth_computepac(env, orig_ptr, modifier, *key);
-    bot_bit = 64 - param.tsz;
+    bot_bit = 64 - tsz;
     top_bit = 64 - 8 * tbi;
 
     test = (pac ^ ptr) & ~MAKE_64BIT_MASK(55, 1);
@@ -380,9 +384,11 @@ static uint64_t pauth_strip(CPUARMState *env, uint64_t ptr, bool data)
 {
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
     ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx);
-    bool tbi = data ? param.tbid : param.tbii;
+    bool tbi = (data ? FIELD_EX32(param, ARMVAP, TBID)
+                : FIELD_EX32(param, ARMVAP, TBII));
+    int tsz = FIELD_EX32(param, ARMVAP, TSZ);
 
-    return pauth_original_ptr(ptr, param.tsz, tbi);
+    return pauth_original_ptr(ptr, tsz, tbi);
 }
 
 static G_NORETURN
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a19d714985..ec3b18e981 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1014,6 +1014,7 @@ static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
     uint32_t el = regime_el(env, mmu_idx);
+    ARMVAParameters r;
     int select, tsz;
     bool epd, hpd;
 
@@ -1065,12 +1066,11 @@ static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
         hpd &= extract32(tcr, 6, 1);
     }
 
-    return (ARMVAParameters) {
-        .tsz = tsz,
-        .select = select,
-        .epd = epd,
-        .hpd = hpd,
-    };
+    r = FIELD_DP32(0, ARMVAP, SELECT, select);
+    r = FIELD_DP32(r, ARMVAP, TSZ, tsz);
+    r = FIELD_DP32(r, ARMVAP, EPD, epd);
+    r = FIELD_DP32(r, ARMVAP, HPD, hpd);
+    return r;
 }
 
 /*
@@ -1205,13 +1205,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          * With FEAT_LVA, fault on less than minimum becomes required,
          * so our choice is to always raise the fault.
          */
-        if (param.tsz_oob) {
+        if (FIELD_EX32(param, ARMVAP, TSZ_OOB)) {
             goto do_translation_fault;
         }
 
-        addrsize = access_type == MMU_INST_FETCH ? param.tbii : param.tbid;
+        if (access_type == MMU_INST_FETCH) {
+            addrsize = FIELD_EX32(param, ARMVAP, TBII);
+        } else {
+            addrsize = FIELD_EX32(param, ARMVAP, TBID);
+        }
         addrsize = 64 - 8 * addrsize;
-        inputsize = 64 - param.tsz;
+        inputsize = 64 - FIELD_EX32(param, ARMVAP, TSZ);
 
         /*
          * Bound PS by PARANGE to find the effective output address size.
@@ -1219,7 +1223,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          * supported mappings can be considered an implementation error.
          */
         ps = FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
-        ps = MIN(ps, param.ps);
+        ps = MIN(ps, FIELD_EX32(param, ARMVAP, PS));
         assert(ps < ARRAY_SIZE(pamax_map));
         outputsize = pamax_map[ps];
 
@@ -1227,14 +1231,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          * With LPA2, the effective output address (OA) size is at most 48 bits
          * unless TCR.DS == 1
          */
-        if (!param.ds && param.gran != Gran64K) {
+        if (!FIELD_EX32(param, ARMVAP, DS) &&
+            FIELD_EX32(param, ARMVAP, GRAN) != Gran64K) {
             outputsize = MIN(outputsize, 48);
         }
     } else {
         param = aa32_va_parameters(env, address, mmu_idx);
         level = 1;
         addrsize = (mmu_idx == ARMMMUIdx_Stage2 ? 40 : 32);
-        inputsize = addrsize - param.tsz;
+        inputsize = addrsize - FIELD_EX32(param, ARMVAP, TSZ);
         outputsize = 40;
     }
 
@@ -1250,13 +1255,13 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     if (inputsize < addrsize) {
         target_ulong top_bits = sextract64(address, inputsize,
                                            addrsize - inputsize);
-        if (-top_bits != param.select) {
+        if (-top_bits != FIELD_EX32(param, ARMVAP, SELECT)) {
             /* The gap between the two regions is a Translation fault */
             goto do_translation_fault;
         }
     }
 
-    stride = arm_granule_bits(param.gran) - 3;
+    stride = arm_granule_bits(FIELD_EX32(param, ARMVAP, GRAN)) - 3;
 
     /*
      * Note that QEMU ignores shareability and cacheability attributes,
@@ -1266,14 +1271,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * implement any ASID-like capability so we can ignore it (instead
      * we will always flush the TLB any time the ASID is changed).
      */
-    ttbr = regime_ttbr(env, mmu_idx, param.select);
+    ttbr = regime_ttbr(env, mmu_idx, FIELD_EX32(param, ARMVAP, SELECT));
 
     /*
      * Here we should have set up all the parameters for the translation:
      * inputsize, ttbr, epd, stride, tbi
      */
 
-    if (param.epd) {
+    if (FIELD_EX32(param, ARMVAP, EPD)) {
         /*
          * Translation table walk disabled => Translation fault on TLB miss
          * Note: This is always 0 on 64-bit EL2 and EL3.
@@ -1306,7 +1311,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         bool ok;
 
         /* SL2 is RES0 unless DS=1 & 4kb granule. */
-        if (param.ds && stride == 9 && sl2) {
+        if (FIELD_EX32(param, ARMVAP, DS) && stride == 9 && sl2) {
             if (sl0 != 0) {
                 level = 0;
                 goto do_translation_fault;
@@ -1368,7 +1373,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * For AArch64, the address field goes up to bit 47, or 49 with FEAT_LPA2;
      * the highest bits of a 52-bit output are placed elsewhere.
      */
-    if (param.ds) {
+    if (FIELD_EX32(param, ARMVAP, DS)) {
         descaddrmask = MAKE_64BIT_MASK(0, 50);
     } else if (arm_feature(env, ARM_FEATURE_V8)) {
         descaddrmask = MAKE_64BIT_MASK(0, 48);
@@ -1425,7 +1430,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * raise AddressSizeFault.
      */
     if (outputsize > 48) {
-        if (param.ds) {
+        if (FIELD_EX32(param, ARMVAP, DS)) {
             descaddr |= extract64(descriptor, 8, 2) << 50;
         } else {
             descaddr |= extract64(descriptor, 12, 4) << 48;
@@ -1470,7 +1475,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          * Otherwise, pass the access fault on to software.
          */
         if (!(descriptor & (1 << 10))) {
-            if (param.ha) {
+            if (FIELD_EX32(param, ARMVAP, HA)) {
                 new_descriptor |= 1 << 10; /* AF */
             } else {
                 fi->type = ARMFault_AccessFlag;
@@ -1484,7 +1489,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          * bit for writeback. The actual write protection test may still be
          * overridden by tableattrs, to be merged below.
          */
-        if (param.hd
+        if (FIELD_EX32(param, ARMVAP, HD)
             && extract64(descriptor, 51, 1)  /* DBM */
             && access_type == MMU_DATA_STORE) {
             if (regime_is_stage2(mmu_idx)) {
@@ -1504,7 +1509,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     attrs = new_descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
     if (!regime_is_stage2(mmu_idx)) {
         attrs |= nstable << 5; /* NS */
-        if (!param.hpd) {
+        if (!FIELD_EX32(param, ARMVAP, HPD)) {
             attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
             /*
              * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
@@ -1582,8 +1587,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * was re-purposed for output address bits.  The SH attribute in
      * that case comes from TCR_ELx, which we extracted earlier.
      */
-    if (param.ds) {
-        result->cacheattrs.shareability = param.sh;
+    if (FIELD_EX32(param, ARMVAP, DS)) {
+        result->cacheattrs.shareability = FIELD_EX32(param, ARMVAP, SH);
     } else {
         result->cacheattrs.shareability = extract32(attrs, 8, 2);
     }
-- 
2.34.1



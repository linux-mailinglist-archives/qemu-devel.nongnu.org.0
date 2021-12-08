Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0C146DEFE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 00:21:09 +0100 (CET)
Received: from localhost ([::1]:51944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv6FI-0001Nu-Pi
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 18:21:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mv66W-0005GU-2E
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 18:12:04 -0500
Received: from [2607:f8b0:4864:20::62f] (port=46867
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mv66U-0004oJ-6m
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 18:12:03 -0500
Received: by mail-pl1-x62f.google.com with SMTP id p18so2542709plf.13
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 15:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uAAN1kaoQfn9Rr4weQnVVbWtBx1U1Cj2+/RVGbi/Znc=;
 b=ZGWN0Qm8ZcnMBjqS+4QWdb8rEBhm1xVtj3vrz5bkaTjZPPQlhBVgtp41c3/K8jq4KI
 oKzGuLNfqpOTszNnOArZnNBCG050ycuJyO3MYn6Kd8YXo4sh0SvNRsZrjIxsvx9aAWiP
 yYbeolZsqHmOc0MK3im1YkpKl4ZMBhTuhTfuZ0UlLEclp0yviMUWGxCxlr5UG19HBzY3
 ZM7dGJU+7yPKLcci55w5J2yExBwhAqK86G+9WnDdl2UPIm7pWYUewTOgJy6GcktyhJ+m
 9spHRMgoc5PsqRGswjAtT9TaddOmPWkPpqqjlO7V/9KAlzXib14f6WMjIqqdl/jorntS
 joTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uAAN1kaoQfn9Rr4weQnVVbWtBx1U1Cj2+/RVGbi/Znc=;
 b=0JDv2BTuveL3+6HL2QXr2wLgBNvtyUUwEEmSrKntFY2/rsG9nohU9BT0XGWQpPTCtt
 P2uOeHYudNgof57wjvM82G4SvdMcG2oICkoicrR1H3ScpYXekeOgWpetll3Dwfq/Uk6m
 WWl7PLhS5fHvNnGXDe5lU7sGhqCJx4DPSH29kt9MG3C78jkN1Aiq6SeM/OdXoiuKV8Ld
 5XTTsrIufu55wx8ojUsbdJq85Qitam7o13nmsVubf8jEmIYYIE8InuOcO4F3tWg8ScV9
 xPdzZuNBDwErTNZqhndFWvpXR4j8fYOOaO1RkxrhdDXKiIaTdoyZ9p0grNvszGt9gYBB
 GIeQ==
X-Gm-Message-State: AOAM532apu2vdWSuxmQTot1ZqWk5V5Zkscu4GmmV0Th33Oy8b4dRYLAx
 rKEB67SJqBEwfdl0soNB3ogmsLS0Q2y/WQ==
X-Google-Smtp-Source: ABdhPJyhE975D33iExQZ6Ko3QHBA1KQf5DnyWgktw7RwQgjNdhniNVgwkrpVJoA0d+B3GsMLdZfKWw==
X-Received: by 2002:a17:903:1c5:b0:141:fbe2:56c1 with SMTP id
 e5-20020a17090301c500b00141fbe256c1mr62743920plh.52.1639005120803; 
 Wed, 08 Dec 2021 15:12:00 -0800 (PST)
Received: from localhost.localdomain
 (45-19-222-18.lightspeed.sntcca.sbcglobal.net. [45.19.222.18])
 by smtp.gmail.com with ESMTPSA id k15sm3301062pgn.91.2021.12.08.15.12.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 15:12:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] target/arm: Implement FEAT_LPA2
Date: Wed,  8 Dec 2021 15:11:54 -0800
Message-Id: <20211208231154.392029-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208231154.392029-1-richard.henderson@linaro.org>
References: <20211208231154.392029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 12 +++++++
 target/arm/internals.h |  2 ++
 target/arm/cpu64.c     |  2 ++
 target/arm/helper.c    | 80 +++++++++++++++++++++++++++++++++++-------
 4 files changed, 83 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 3149000004..379585352b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4283,6 +4283,18 @@ static inline bool isar_feature_aa64_i8mm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, I8MM) != 0;
 }
 
+static inline bool isar_feature_aa64_tgran4_lpa2(const ARMISARegisters *id)
+{
+    return sextract64(id->id_aa64mmfr0,
+                      R_ID_AA64MMFR0_TGRAN4_SHIFT,
+                      R_ID_AA64MMFR0_TGRAN4_LENGTH) >= 1;
+}
+
+static inline bool isar_feature_aa64_tgran16_lpa2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN16) >= 2;
+}
+
 static inline bool isar_feature_aa64_ccidx(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, CCIDX) != 0;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3e801833b4..868cae2a55 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1033,12 +1033,14 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
 typedef struct ARMVAParameters {
     unsigned tsz    : 8;
     unsigned ps     : 3;
+    unsigned sh     : 2;
     unsigned select : 1;
     bool tbi        : 1;
     bool epd        : 1;
     bool hpd        : 1;
     bool using16k   : 1;
     bool using64k   : 1;
+    bool ds         : 1;
 } ARMVAParameters;
 
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3bb79ca744..5a1940aa94 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -740,6 +740,8 @@ static void aarch64_max_initfn(Object *obj)
 
         t = cpu->isar.id_aa64mmfr0;
         t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
+        t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 2); /* FEAT_LPA2: 52 bits */
+        t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4, 1);  /* FEAT_LPA2: 52 bits */
         cpu->isar.id_aa64mmfr0 = t;
 
         t = cpu->isar.id_aa64mmfr1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e39c1f5b3a..f4a8b37f98 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11008,8 +11008,13 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
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
 
@@ -11150,8 +11155,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
-    bool epd, hpd, using16k, using64k;
-    int select, tsz, tbi, ps;
+    bool epd, hpd, using16k, using64k, ds;
+    int select, tsz, tbi, ps, sh;
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -11165,7 +11170,9 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract32(tcr, 24, 1);
         }
         epd = false;
+        sh = extract64(tcr, 12, 2);
         ps = extract64(tcr, 16, 3);
+        ds = extract64(tcr, 32, 1);
     } else {
         /*
          * Bit 55 is always between the two regions, and is canonical for
@@ -11175,6 +11182,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         if (!select) {
             tsz = extract32(tcr, 0, 6);
             epd = extract32(tcr, 7, 1);
+            sh = extract32(tcr, 12, 2);
             using64k = extract32(tcr, 14, 1);
             using16k = extract32(tcr, 15, 1);
             hpd = extract64(tcr, 41, 1);
@@ -11184,9 +11192,11 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             using64k = tg == 3;
             tsz = extract32(tcr, 16, 6);
             epd = extract32(tcr, 23, 1);
+            sh = extract32(tcr, 28, 2);
             hpd = extract64(tcr, 42, 1);
         }
         ps = extract64(tcr, 32, 3);
+        ds = extract64(tcr, 59, 1);
     }
 
     /* Present TBI as a composite with TBID.  */
@@ -11199,12 +11209,14 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     return (ARMVAParameters) {
         .tsz = tsz,
         .ps = ps,
+        .sh = sh,
         .select = select,
         .tbi = tbi,
         .epd = epd,
         .hpd = hpd,
         .using16k = using16k,
         .using64k = using64k,
+        .ds = ds,
     };
 }
 
@@ -11332,15 +11344,31 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                    access_type != MMU_INST_FETCH);
         level = 0;
 
-        if (cpu_isar_feature(aa64_st, env_archcpu(env))) {
+        /* Find the minimum allowed input address size. */
+        if (cpu_isar_feature(aa64_st, cpu)) {
             max_tsz = 48 - param.using64k;
         }
+
+        /*
+         * Find the maximum allowed input address size.
+         * DS is RES0 unless FEAT_LPA2 is supported for the given page size;
+         * adjust param.ds to the effective value of DS, as documented.
+         */
         if (param.using64k) {
-            if (cpu_isar_feature(aa64_lva, env_archcpu(env))) {
+            if (cpu_isar_feature(aa64_lva, cpu)) {
                 min_tsz = 12;
             }
+            param.ds = false;
+        } else if (param.ds) {
+            /* ??? Assume tgran{4,16}_2 == 0, i.e. match tgran{4,16}. */
+            if (param.using16k
+                ? cpu_isar_feature(aa64_tgran16_lpa2, cpu)
+                : cpu_isar_feature(aa64_tgran4_lpa2, cpu)) {
+                min_tsz = 12;
+            } else {
+                param.ds = false;
+            }
         }
-        /* TODO: FEAT_LPA2 */
 
         /*
          * If TxSZ is programmed to a value larger than the maximum,
@@ -11441,10 +11469,19 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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
 
@@ -11499,7 +11536,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      * but in ARMv8 they are checked for zero and an AddressSize fault
      * is raised if they are not.
      */
-    if (aarch64 || arm_feature(env, ARM_FEATURE_V8)) {
+    if (param.ds) {
+        descaddrmask = MAKE_64BIT_MASK(0, 50);
+    } else if (aarch64 || arm_feature(env, ARM_FEATURE_V8)) {
         descaddrmask = MAKE_64BIT_MASK(0, 48);
     } else {
         descaddrmask = MAKE_64BIT_MASK(0, 40);
@@ -11534,11 +11573,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
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
@@ -11632,7 +11676,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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



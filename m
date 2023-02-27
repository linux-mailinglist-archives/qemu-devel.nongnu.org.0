Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F136A4F6F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 00:03:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmVa-0000ni-Jp; Mon, 27 Feb 2023 18:02:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVM-0007xm-S7
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:02:01 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVK-00016k-Kj
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:02:00 -0500
Received: by mail-pl1-x643.google.com with SMTP id u5so5098454plq.7
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RTa5VZ1+2+RvKiAzovni2Fgpn0m7gqnULFZBvlHvbmc=;
 b=gziqo6kS3srln1fEhPZYmnGNdriZZplAru9Xyt9A7AvcLhl0WIdTOJ/GJdYovCV9wY
 xrw5dKAnS80+gXiVI8IG/ygdQv2Fb4vVn0hyor5f4n31F1Uod/sbhCxv+F/J6F9WXDLN
 1xgtxfF8t/qspxY3bmUv9baC46aqKRQRPSEB7i3qNyesQq47BJKO+TrudG2VpIGQC13q
 a0YPfps7ENeV1PoiUhmYj/2noKaF03h3ROkGlsQC6/IHVumK6FTJqTjmajdyfpRPJvrK
 5Q61fAR0odr2z7GbQsOjFUeLKQrKmyEfGwDrkGP4JYv7lxLJlnFIqsKTL03VCD+1Vd7Z
 e8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RTa5VZ1+2+RvKiAzovni2Fgpn0m7gqnULFZBvlHvbmc=;
 b=pWYgo0imGlNxY0IMp5KlS+8rH8ec+a8neJk2t7CKrwFgwO41LolKy5S34ZMHOAJGVz
 EbBZmstGu2lSjynG8yADc9tDGomJJykFb5W0y2FSzn6+JsV6PD5G4qPSLoQDcpAo9NTg
 hskiaX2gjEc618pg45gZRa+/datpKF2e7Rqqs1LGhXWRlj1x+3hTtFCsqZqdC2Xb+UXc
 M/8/Q+sh2wxysZVQD5WthLxa0soefU40UzYbPc+j/21FO54u99F3SH/70bRwwpjqq9Di
 PZZKKsW/D6X9gktpXR/kDvWGu8ay9vn5vmPCufcLBGXZmbG9sMQGzRgeb4IadiozB1zD
 baMw==
X-Gm-Message-State: AO0yUKW6KP3UI7aeOKe4V1WHu+2TZnQo/Wulersz1DCZabTC8QciP9Ug
 BsxGKjZZWvBndRKyuQwQmb4u9DJfTZ7c417DS36RPA==
X-Google-Smtp-Source: AK7set+R2y3x5Om2MdnJyZ++/quhEYEDByA8qi03qmGgEho9t+YrHfI0nMLYHRfmtRh5wzTSvvnqRw==
X-Received: by 2002:a17:902:f78b:b0:19c:f849:80a1 with SMTP id
 q11-20020a170902f78b00b0019cf84980a1mr638017pln.27.1677538916335; 
 Mon, 27 Feb 2023 15:01:56 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 19/21] target/arm: Implement the granule protection
 check
Date: Mon, 27 Feb 2023 13:01:20 -1000
Message-Id: <20230227230122.816702-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
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

Place the check at the end of get_phys_addr_with_struct,
so that we check all physical results.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 249 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 232 insertions(+), 17 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 95424bca4c..f3a3a74f74 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -37,11 +37,17 @@ typedef struct S1Translate {
     void *out_host;
 } S1Translate;
 
-static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
-                                      target_ulong address,
-                                      MMUAccessType access_type,
-                                      GetPhysAddrResult *result,
-                                      ARMMMUFaultInfo *fi);
+static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
+                                target_ulong address,
+                                MMUAccessType access_type,
+                                GetPhysAddrResult *result,
+                                ARMMMUFaultInfo *fi);
+
+static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
+                              target_ulong address,
+                              MMUAccessType access_type,
+                              GetPhysAddrResult *result,
+                              ARMMMUFaultInfo *fi);
 
 /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
 static const uint8_t pamax_map[] = {
@@ -197,6 +203,197 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
 }
 
+static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
+                                     ARMSecuritySpace pspace,
+                                     ARMMMUFaultInfo *fi)
+{
+    MemTxAttrs attrs = {
+        .secure = true,
+        .space = ARMSS_Root,
+    };
+    ARMCPU *cpu = env_archcpu(env);
+    uint64_t gpccr = env->cp15.gpccr_el3;
+    unsigned pps, pgs, l0gptsz, level = 0;
+    uint64_t tableaddr, pps_mask, align, entry, index;
+    AddressSpace *as;
+    MemTxResult result;
+    int gpi;
+
+    if (!FIELD_EX64(gpccr, GPCCR, GPC)) {
+        return true;
+    }
+
+    /*
+     * GPC Priority 1 (R_GMGRR):
+     * R_JWCSM: If the configuration of GPCCR_EL3 is invalid,
+     * the access fails as GPT walk fault at level 0.
+     */
+
+    /*
+     * Configuration of PPS to a value exceeding the implemented
+     * physical address size is invalid.
+     */
+    pps = FIELD_EX64(gpccr, GPCCR, PPS);
+    if (pps > FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE)) {
+        goto fault_walk;
+    }
+    pps = pamax_map[pps];
+    pps_mask = MAKE_64BIT_MASK(0, pps);
+
+    switch (FIELD_EX64(gpccr, GPCCR, SH)) {
+    case 0b10: /* outer shareable */
+        break;
+    case 0b00: /* non-shareable */
+    case 0b11: /* inner shareable */
+        /* Inner and Outer non-cacheable requires Outer shareable. */
+        if (FIELD_EX64(gpccr, GPCCR, ORGN) == 0 &&
+            FIELD_EX64(gpccr, GPCCR, IRGN) == 0) {
+            goto fault_walk;
+        }
+        break;
+    default:   /* reserved */
+        goto fault_walk;
+    }
+
+    switch (FIELD_EX64(gpccr, GPCCR, PGS)) {
+    case 0b00: /* 4KB */
+        pgs = 12;
+        break;
+    case 0b01: /* 64KB */
+        pgs = 16;
+        break;
+    case 0b10: /* 16KB */
+        pgs = 14;
+        break;
+    default: /* reserved */
+        goto fault_walk;
+    }
+
+    /* Note this field is read-only and fixed at reset. */
+    l0gptsz = 30 + FIELD_EX64(gpccr, GPCCR, L0GPTSZ);
+
+    /*
+     * GPC Priority 2: Secure, Realm or Root address exceeds PPS.
+     * R_CPDSB: A NonSecure physical address input exceeding PPS
+     * does not experience any fault.
+     */
+    if (paddress & ~pps_mask) {
+        if (pspace == ARMSS_NonSecure) {
+            return true;
+        }
+        goto fault_size;
+    }
+
+    /* GPC Priority 3: the base address of GPTBR_EL3 exceeds PPS. */
+    tableaddr = env->cp15.gptbr_el3 << 12;
+    if (tableaddr & ~pps_mask) {
+        goto fault_size;
+    }
+
+    /*
+     * BADDR is aligned per a function of PPS and L0GPTSZ.
+     * These bits of GPTBR_EL3 are RES0, but are not a configuration error,
+     * unlike the RES0 bits of the GPT entries (R_XNKFZ).
+     */
+    align = MAX(pps - l0gptsz + 3, 12);
+    align = MAKE_64BIT_MASK(0, align);
+    tableaddr &= ~align;
+
+    as = arm_addressspace(env_cpu(env), attrs);
+
+    /* Level 0 lookup. */
+    index = extract64(paddress, l0gptsz, pps - l0gptsz);
+    tableaddr += index * 8;
+    entry = address_space_ldq_le(as, tableaddr, attrs, &result);
+    if (result != MEMTX_OK) {
+        goto fault_eabt;
+    }
+
+    switch (extract32(entry, 0, 4)) {
+    case 1: /* block descriptor */
+        if (entry >> 8) {
+            goto fault_walk; /* RES0 bits not 0 */
+        }
+        gpi = extract32(entry, 4, 4);
+        goto found;
+    case 3: /* table descriptor */
+        tableaddr = entry & ~0xf;
+        align = MAX(l0gptsz - pgs - 1, 12);
+        align = MAKE_64BIT_MASK(0, align);
+        if (tableaddr & (~pps_mask | align)) {
+            goto fault_walk; /* RES0 bits not 0 */
+        }
+        break;
+    default: /* invalid */
+        goto fault_walk;
+    }
+
+    /* Level 1 lookup */
+    level = 1;
+    index = extract64(paddress, pgs + 4, l0gptsz - pgs - 4);
+    tableaddr += index * 8;
+    entry = address_space_ldq_le(as, tableaddr, attrs, &result);
+    if (result != MEMTX_OK) {
+        goto fault_eabt;
+    }
+
+    switch (extract32(entry, 0, 4)) {
+    case 1: /* contiguous descriptor */
+        if (entry >> 10) {
+            goto fault_walk; /* RES0 bits not 0 */
+        }
+        /*
+         * Because the softmmu tlb only works on units of TARGET_PAGE_SIZE,
+         * and because we cannot invalidate by pa, and thus will always
+         * flush entire tlbs, we don't actually care about the range here
+         * and can simply extract the GPI as the result.
+         */
+        if (extract32(entry, 8, 2) == 0) {
+            goto fault_walk; /* reserved contig */
+        }
+        gpi = extract32(entry, 4, 4);
+        break;
+    default:
+        index = extract64(paddress, pgs, 4);
+        gpi = extract64(entry, index * 4, 4);
+        break;
+    }
+
+ found:
+    switch (gpi) {
+    case 0b0000: /* no access */
+        break;
+    case 0b1111: /* all access */
+        return true;
+    case 0b1000:
+    case 0b1001:
+    case 0b1010:
+    case 0b1011:
+        if (pspace == (gpi & 3)) {
+            return true;
+        }
+        break;
+    default:
+        goto fault_walk; /* reserved */
+    }
+
+    fi->gpcf = GPCF_Fail;
+    goto fault_common;
+ fault_eabt:
+    fi->gpcf = GPCF_EABT;
+    goto fault_common;
+ fault_size:
+    fi->gpcf = GPCF_AddressSize;
+    goto fault_common;
+ fault_walk:
+    fi->gpcf = GPCF_Walk;
+ fault_common:
+    fi->level = level;
+    fi->paddr = paddress;
+    fi->paddr_space = pspace;
+    return false;
+}
+
 static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
 {
     /*
@@ -242,10 +439,10 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         };
         GetPhysAddrResult s2 = { };
 
-        if (get_phys_addr_with_struct(env, &s2ptw, addr,
-                                      MMU_DATA_LOAD, &s2, fi)) {
+        if (get_phys_addr_gpc(env, &s2ptw, addr, MMU_DATA_LOAD, &s2, fi)) {
             goto fail;
         }
+
         ptw->out_phys = s2.f.phys_addr;
         pte_attrs = s2.cacheattrs.attrs;
         pte_secure = s2.f.attrs.secure;
@@ -308,6 +505,9 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
 
  fail:
     assert(fi->type != ARMFault_None);
+    if (fi->type == ARMFault_GPCFOnOutput) {
+        fi->type = ARMFault_GPCFOnWalk;
+    }
     fi->s2addr = addr;
     fi->stage2 = true;
     fi->s1ptw = true;
@@ -2735,7 +2935,7 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
                                    ARMMMUFaultInfo *fi)
 {
     uint8_t memattr = 0x00;    /* Device nGnRnE */
-    uint8_t shareability = 0;  /* non-sharable */
+    uint8_t shareability = 0;  /* non-shareable */
     int r_el;
 
     switch (mmu_idx) {
@@ -2794,7 +2994,7 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
             } else {
                 memattr = 0x44;  /* Normal, NC, No */
             }
-            shareability = 2; /* outer sharable */
+            shareability = 2; /* outer shareable */
         }
         result->cacheattrs.is_s2_format = false;
         break;
@@ -2822,7 +3022,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     ARMSecuritySpace ipa_space, s2walk_space;
     uint64_t hcr;
 
-    ret = get_phys_addr_with_struct(env, ptw, address, access_type, result, fi);
+    ret = get_phys_addr_nogpc(env, ptw, address, access_type, result, fi);
 
     /* If S1 fails, return early.  */
     if (ret) {
@@ -2859,7 +3059,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    ret = get_phys_addr_with_struct(env, ptw, ipa, access_type, result, fi);
+    ret = get_phys_addr_nogpc(env, ptw, ipa, access_type, result, fi);
     fi->s2addr = ipa;
 
     /* Combine the S1 and S2 perms.  */
@@ -2919,7 +3119,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     return false;
 }
 
-static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
+static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
                                       target_ulong address,
                                       MMUAccessType access_type,
                                       GetPhysAddrResult *result,
@@ -3043,6 +3243,23 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
     }
 }
 
+static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
+                              target_ulong address,
+                              MMUAccessType access_type,
+                              GetPhysAddrResult *result,
+                              ARMMMUFaultInfo *fi)
+{
+    if (get_phys_addr_nogpc(env, ptw, address, access_type, result, fi)) {
+        return true;
+    }
+    if (!granule_protection_check(env, result->f.phys_addr,
+                                  result->f.attrs.space, fi)) {
+        fi->type = ARMFault_GPCFOnOutput;
+        return true;
+    }
+    return false;
+}
+
 bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                bool is_secure, GetPhysAddrResult *result,
@@ -3053,8 +3270,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
         .in_secure = is_secure,
         .in_space = arm_secure_to_space(is_secure),
     };
-    return get_phys_addr_with_struct(env, &ptw, address, access_type,
-                                     result, fi);
+    return get_phys_addr_gpc(env, &ptw, address, access_type, result, fi);
 }
 
 bool get_phys_addr(CPUARMState *env, target_ulong address,
@@ -3124,8 +3340,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
     ptw.in_space = ss;
     ptw.in_secure = arm_space_is_secure(ss);
-    return get_phys_addr_with_struct(env, &ptw, address, access_type,
-                                     result, fi);
+    return get_phys_addr_gpc(env, &ptw, address, access_type, result, fi);
 }
 
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
@@ -3145,7 +3360,7 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     ARMMMUFaultInfo fi = {};
     bool ret;
 
-    ret = get_phys_addr_with_struct(env, &ptw, addr, MMU_DATA_LOAD, &res, &fi);
+    ret = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, &res, &fi);
     *attrs = res.f.attrs;
 
     if (ret) {
-- 
2.34.1



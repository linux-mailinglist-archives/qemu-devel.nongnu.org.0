Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EFE5F1DEE
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:54:00 +0200 (CEST)
Received: from localhost ([::1]:49708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefkV-00011z-Un
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHp-0007HB-Kf
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:21 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:42614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHn-0006Gu-MF
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:21 -0400
Received: by mail-qk1-x72a.google.com with SMTP id d15so4533049qka.9
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=H5wRwyD67tK/HHDlYGbPLh0Azkr3is2XWTQhRNefVK0=;
 b=FqPMFrjXrK5LaLhkzo4xfkgIlt2Py9uJxb+7qq+6t7Bp3DXC6Myk8wVKbUWd053XiU
 iaLvwc0HEjspgy433K98Tv7lnISFlD5way/hj0Y13Mq/gCcEZUlafQIWVQrquGk0w5jf
 27rdJGf/bVK4AWun+GMjPVc+rF1zswg0UHRYQ0DNXrlWXKH05gfULRx6ojE/gCENPw9x
 34XSQs0mLIw4DetdE38ijPye6NvKgsD6K/aycj+fmwvhWThrXDoXjWfni5CvIEJuPIHj
 indQiJL9nEABANnCbUNyhPWTyX16jHAwW2QPxn6CHQdbvDPQEDgMDHDy7LMjxPYC4aha
 kSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=H5wRwyD67tK/HHDlYGbPLh0Azkr3is2XWTQhRNefVK0=;
 b=O9CwfEm8EYFuRY/HH3mTkHKGxCOx32b6djiouxywFr20/OwyerJwyWH6UJ55tHSQRO
 eDxuSkGEhPUpbWPDzGk4NJ7/pPBbJSh5xenoLG+rI4nYb54MEobojEfyLVNXjCR1usOV
 Z5km2y6DUZf60mVEQokti5Om3I91pRYiOoXxV1KfhFH7BQ/D88hqX1k4f7peaaGc7oAg
 I58jt4mvcmECpPLtjwrIfmLsw6ixaDbs/yjvYqE9XRCmNNIU4p7BgoiAgHUd6FtpHtZX
 G0KLeHav92Ig/HFFqyKTgwKZdssbD7UPec0gZ6Srm9n9JzcZdNEBJE9Roh0mb+SiDNg8
 IvJQ==
X-Gm-Message-State: ACrzQf2XU5tBOD0MOKoPQ6Za9NQnNTFCw/ALBGEZth8iTHDcmpy9skbn
 M+WgwolrVQxDtdnvBaBjNuzjI69w/7R9SQ==
X-Google-Smtp-Source: AMsMyM6QRqH5Gbbzu044bSywk45d6mnLeV2yWvYkQoa8DT9BuUMlcJCdxElvPOtJeQgSqdLb9mKnWg==
X-Received: by 2002:a05:620a:318a:b0:6ce:732a:f92 with SMTP id
 bi10-20020a05620a318a00b006ce732a0f92mr9662205qkb.347.1664641458978; 
 Sat, 01 Oct 2022 09:24:18 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 23/42] target/arm: Use probe_access_full for BTI
Date: Sat,  1 Oct 2022 09:22:59 -0700
Message-Id: <20221001162318.153420-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add a field to TARGET_PAGE_ENTRY_EXTRA to hold the guarded bit.
In is_guarded_page, use probe_access_full instead of just guessing
that the tlb entry is still present.  Also handles the FIXME about
executing from device memory.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h     |  8 ++++----
 target/arm/cpu.h           | 13 -------------
 target/arm/internals.h     |  1 +
 target/arm/ptw.c           |  7 ++++---
 target/arm/translate-a64.c | 22 ++++++++--------------
 5 files changed, 17 insertions(+), 34 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 118ca0e5c0..689a9645dc 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -32,12 +32,12 @@
 # define TARGET_PAGE_BITS_MIN  10
 
 /*
- * Cache the attrs and sharability fields from the page table entry.
+ * Cache the attrs, sharability, and gp fields from the page table entry.
  */
 # define TARGET_PAGE_ENTRY_EXTRA  \
-     uint8_t pte_attrs;           \
-     uint8_t shareability;
-
+    uint8_t pte_attrs;            \
+    uint8_t shareability;         \
+    bool guarded;
 #endif
 
 #define NB_MMU_MODES 8
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2694a93894..c8cad2ef7c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3382,19 +3382,6 @@ static inline uint64_t *aa64_vfp_qreg(CPUARMState *env, unsigned regno)
 /* Shared between translate-sve.c and sve_helper.c.  */
 extern const uint64_t pred_esz_masks[5];
 
-/* Helper for the macros below, validating the argument type. */
-static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
-{
-    return x;
-}
-
-/*
- * Lvalue macros for ARM TLB bits that we must cache in the TCG TLB.
- * Using these should be a bit more self-documenting than using the
- * generic target bits directly.
- */
-#define arm_tlb_bti_gp(x) (typecheck_memtxattrs(x)->target_tlb_bit0)
-
 /*
  * AArch64 usage of the PAGE_TARGET_* bits for linux-user.
  * Note that with the Linux kernel, PROT_MTE may not be cleared by mprotect
diff --git a/target/arm/internals.h b/target/arm/internals.h
index fd17aee459..a50189e2e4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1067,6 +1067,7 @@ typedef struct ARMCacheAttrs {
     unsigned int attrs:8;
     unsigned int shareability:2; /* as in the SH field of the VMSAv8-64 PTEs */
     bool is_s2_format:1;
+    bool guarded:1;              /* guarded bit of the v8-64 PTE */
 } ARMCacheAttrs;
 
 /* Fields that are valid upon success. */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1bc194ffa1..ccfef2caca 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1319,9 +1319,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          */
         result->f.attrs.secure = false;
     }
-    /* When in aarch64 mode, and BTI is enabled, remember GP in the IOTLB.  */
-    if (aarch64 && guarded && cpu_isar_feature(aa64_bti, cpu)) {
-        arm_tlb_bti_gp(&result->f.attrs) = true;
+
+    /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB.  */
+    if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
+        result->f.guarded = guarded;
     }
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5b67375f4e..22802d1d2f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14601,22 +14601,16 @@ static bool is_guarded_page(CPUARMState *env, DisasContext *s)
 #ifdef CONFIG_USER_ONLY
     return page_get_flags(addr) & PAGE_BTI;
 #else
+    CPUTLBEntryFull *full;
+    void *host;
     int mmu_idx = arm_to_core_mmu_idx(s->mmu_idx);
-    unsigned int index = tlb_index(env, mmu_idx, addr);
-    CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
+    int flags;
 
-    /*
-     * We test this immediately after reading an insn, which means
-     * that any normal page must be in the TLB.  The only exception
-     * would be for executing from flash or device memory, which
-     * does not retain the TLB entry.
-     *
-     * FIXME: Assume false for those, for now.  We could use
-     * arm_cpu_get_phys_page_attrs_debug to re-read the page
-     * table entry even for that case.
-     */
-    return (tlb_hit(entry->addr_code, addr) &&
-            arm_tlb_bti_gp(&env_tlb(env)->d[mmu_idx].fulltlb[index].attrs));
+    flags = probe_access_full(env, addr, MMU_INST_FETCH, mmu_idx,
+                              false, &host, &full, 0);
+    assert(!(flags & TLB_INVALID_MASK));
+
+    return full->guarded;
 #endif
 }
 
-- 
2.34.1



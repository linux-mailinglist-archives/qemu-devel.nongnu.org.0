Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DC95645C8
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:27:32 +0200 (CEST)
Received: from localhost ([::1]:37418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7ux1-0002rj-1o
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuM-0006c6-FZ
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:24:46 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:44807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuK-0005qB-MS
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:24:46 -0400
Received: by mail-pl1-x62b.google.com with SMTP id l6so6000446plg.11
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MmQAzcfABxlHx5cSzgemNY9cO4UZUm16Jrwpdca+cDs=;
 b=syNrUrfqTV+jUGLcamvcapouJjU71fCLgW0H6RozdhGOv+pGUMTLLB7gY5xM7RvN47
 iV/bm/qXMac3vurt+0IwG5A6MIjC8Rdx95UyxEqICqOQnQqwvoRGhH8tGGI8CakZBSW9
 AN7ajxRxZyoArEH2VHn49XTBBWaM8tMtdTOHPHM4nBM3s6GEmzy9WenYHZ0ivMqk0d0P
 5VNIUeTRv4X1JV+D7EEFvzr1WQWswfw6bX79foqItJFNY2MnaVqBdqWMb5aYkEYpf8D2
 GEgz0EkOEyZ8AsdiTEOTeUnvT9pPMfqt1u5J4ZvXjvp4cLyQZQfLK/32dc4F3Eeln1ZV
 JQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MmQAzcfABxlHx5cSzgemNY9cO4UZUm16Jrwpdca+cDs=;
 b=H3GJLTjN5wZfyB/xjUReEbq7vfDjA7m1mB1m9pQOlArL3GHHc79SIvsMCXPmF3kKJz
 l1tcQ3smlKa3CUuFGoIJhsOhMsYP+fuKP216uL0rQbKOhY3AkfNOoxY9yAp0rklu8YXT
 UDFXVYzMjRxJYkC+PM8P+xpTuSaPLpt69JgcEo37GJHz9Gu3RLDhWtbUL4vX46QJBDXY
 /eg05f+G9hDGpoHA3THaF6YLefyDOUrkgSZXB9xkknIDZYyDWBSYptkdZ0jBBZ5w5QPk
 4e9mj+D3I7Qc6MIORmu2yAqoIukK8U3JKP1+3MU6BSzSUlIVSWM6ZTRaVd2jEAfmyJiE
 j2ZQ==
X-Gm-Message-State: AJIora/hVS164los5V2PbFwTCgWJc0IrKCS0GpDVVU+whpYSlZ5di7ld
 2TtQeKWW8c5K7ehJ9ZL4IYZBFtP5H6fXtFRt
X-Google-Smtp-Source: AGRyM1tx9gYoBHI/apTPa1A5G335eBUvRH5GbUl3b9h4uyI7FhaDni4Z4iyLOVAN9+ALHrBlzuJbcw==
X-Received: by 2002:a17:902:f642:b0:169:714:b079 with SMTP id
 m2-20020a170902f64200b001690714b079mr28754514plg.117.1656836683461; 
 Sun, 03 Jul 2022 01:24:43 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:24:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/62] target/arm: Use PageEntryExtra for BTI
Date: Sun,  3 Jul 2022 13:53:23 +0530
Message-Id: <20220703082419.770989-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add a bit to ARMCacheAttrs to hold the guarded bit between
get_phys_addr_lpae and arm_cpu_tlb_fill, then put the bit
into PageEntryExtra.

In is_guarded_page, use probe_access_extra instead of just
guessing that the tlb entry is still present.  Also handles
the FIXME about executing from device memory.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 13 -------------
 target/arm/internals.h     |  2 ++
 target/arm/ptw.c           |  4 ++--
 target/arm/tlb_helper.c    |  2 ++
 target/arm/translate-a64.c | 22 ++++++++--------------
 5 files changed, 14 insertions(+), 29 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a26b9437e9..4a41b5dcef 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3357,19 +3357,6 @@ static inline uint64_t *aa64_vfp_qreg(CPUARMState *env, unsigned regno)
 /* Shared between translate-sve.c and sve_helper.c.  */
 extern const uint64_t pred_esz_masks[4];
 
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
  */
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 2b38a83574..268c3c7380 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -77,6 +77,7 @@ FIELD(V7M_EXCRET, RES1, 7, 25) /* including the must-be-1 prefix */
 /* Bit definitions for PageEntryExtra */
 FIELD(PAGEENTRYEXTRA, ATTRS, 0, 8)
 FIELD(PAGEENTRYEXTRA, SHAREABILITY, 8, 2)
+FIELD(PAGEENTRYEXTRA, GUARDED, 10, 1)
 FIELD(PAGEENTRYEXTRA, PA, 12, 52)
 
 /* Minimum value which is a magic number for exception return */
@@ -1129,6 +1130,7 @@ typedef struct ARMCacheAttrs {
     unsigned int attrs:8;
     unsigned int shareability:2; /* as in the SH field of the VMSAv8-64 PTEs */
     bool is_s2_format:1;
+    bool guarded:1;              /* guarded bit of the v8-64 PTE */
 } ARMCacheAttrs;
 
 bool get_phys_addr(CPUARMState *env, target_ulong address,
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index da478104f0..204c820026 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1320,8 +1320,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         txattrs->secure = false;
     }
     /* When in aarch64 mode, and BTI is enabled, remember GP in the IOTLB.  */
-    if (aarch64 && guarded && cpu_isar_feature(aa64_bti, cpu)) {
-        arm_tlb_bti_gp(txattrs) = true;
+    if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
+        cacheattrs->guarded = guarded;
     }
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 1305b6ec7d..7476fcafeb 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -244,6 +244,8 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                                  cacheattrs.attrs);
             extra.x = FIELD_DP64(extra.x, PAGEENTRYEXTRA, SHAREABILITY,
                                  cacheattrs.shareability);
+            extra.x = FIELD_DP64(extra.x, PAGEENTRYEXTRA, GUARDED,
+                                 cacheattrs.guarded);
         }
 
         tlb_set_page_with_extra(cs, address, phys_addr, attrs, extra,
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c86b97b1d4..57f492ccef 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14543,22 +14543,16 @@ static bool is_guarded_page(CPUARMState *env, DisasContext *s)
 #ifdef CONFIG_USER_ONLY
     return page_get_flags(addr) & PAGE_BTI;
 #else
+    MemTxAttrs attrs;
+    PageEntryExtra extra;
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
-            arm_tlb_bti_gp(&env_tlb(env)->d[mmu_idx].iotlb[index].attrs));
+    flags = probe_access_extra(env, addr, MMU_INST_FETCH, mmu_idx,
+                               false, &host, &attrs, &extra, 0);
+    assert(!(flags & TLB_INVALID_MASK));
+    return FIELD_EX64(extra.x, PAGEENTRYEXTRA, GUARDED);
 #endif
 }
 
-- 
2.34.1



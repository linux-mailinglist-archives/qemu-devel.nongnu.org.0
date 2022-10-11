Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F32D5FAB1A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 05:24:10 +0200 (CEST)
Received: from localhost ([::1]:37336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi5sH-000195-7d
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 23:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nk-0002FH-Td
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:30 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:46051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nc-0002zw-Vv
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:27 -0400
Received: by mail-pl1-x635.google.com with SMTP id i6so6958305pli.12
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rJhyjafjgqKk8I6LVsm5b/FzC0MtOu7IjX7/w4ZcQiI=;
 b=ZOC0dIozl7SO6MERyNTvLIksE8337e+0QIxBWoS1YG++s/rRK/B/2cgYt6VROHhroD
 wOFG1yYsPWn2Joi4vSHHhnrV7YdTrAIq9F2zoEOZ8xDMvCce2g24XUbjDJ8YIUTwRi0z
 Www/fPKLPR4QC24m4w1IjzhGM9sZr4EszvQMU/LiDzKq+T64dZeM68EQDR5WRWz3BGp7
 +MjlAKL/YeghgHbpztV5z3Asmc56yRGAgQ/BgmeQSpIryikeJs/1VFZjf3tcA3FGloAZ
 SI96Ey9s0JJsh+oCe/LDyWC4qWfXdxVpBe5oJBMvwDNwDerXOqoPh1Z/ZrswROM0mjas
 mrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rJhyjafjgqKk8I6LVsm5b/FzC0MtOu7IjX7/w4ZcQiI=;
 b=Wj258oyp2oOElomdAlTW42CcbvuzTBjcrmR9ObAuGDC3P/Es/xSmNmCS+AYvhPwZAt
 xLtuwPa4GaBajW5rIHFmfYwnMcs9mkvmW1qdpadkYdEH5X6OJv/2oeMAgHFl71Pj+IJB
 DjC07EdwjcMFOsp24UvN82d7ngwRwIxYGgpVSRKhV2tyd7WJHEaBXxTXGS6hopk5jGmR
 Kq91V9gUEKjKaZMC6paXsehHji7L3W9YgKBeaOMOpN2DE6kasVc1Ecmmn7+SAmKM60RW
 Jtd3ZXmPv+En/dS1IqeoeOJg13IZ43RdOR8JIOU2OamK3Ohc91uWWRuBBy0TTyPdFA2r
 H5jg==
X-Gm-Message-State: ACrzQf0cwwNfflPMbyadpAvTBjhgaPHITPdQnCISxtl5qeBlUo68ed/b
 xFVlXu3/BqUa8N+FrP58WAKu5/kMtUfQyw==
X-Google-Smtp-Source: AMsMyM7KtyCvOufldGVOsmo2WqsKbA2/Ng/fSyqTwvy1r5GhWULS0xGqQ+EXeIlsLdgs2qVh8sQ7PQ==
X-Received: by 2002:a17:902:da83:b0:17a:111:ebdf with SMTP id
 j3-20020a170902da8300b0017a0111ebdfmr22206155plx.149.1665458358387; 
 Mon, 10 Oct 2022 20:19:18 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 03/24] target/arm: Use probe_access_full for BTI
Date: Mon, 10 Oct 2022 20:18:50 -0700
Message-Id: <20221011031911.2408754-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h     |  9 +++++----
 target/arm/cpu.h           | 13 -------------
 target/arm/internals.h     |  1 +
 target/arm/ptw.c           |  7 ++++---
 target/arm/translate-a64.c | 21 ++++++++++-----------
 5 files changed, 20 insertions(+), 31 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 38347b0d20..f4338fd10e 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -36,12 +36,13 @@
  *
  * For ARMMMUIdx_Stage2*, pte_attrs is the S2 descriptor bits [5:2].
  * Otherwise, pte_attrs is the same as the MAIR_EL1 8-bit format.
- * For shareability, as in the SH field of the VMSAv8-64 PTEs.
+ * For shareability and guarded, as in the SH and GP fields respectively
+ * of the VMSAv8-64 PTEs.
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
index f09ec8aa03..a34d496c5b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3388,19 +3388,6 @@ static inline uint64_t *aa64_vfp_qreg(CPUARMState *env, unsigned regno)
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
index 9566364dca..c3c3920ded 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1095,6 +1095,7 @@ typedef struct ARMCacheAttrs {
     unsigned int attrs:8;
     unsigned int shareability:2; /* as in the SH field of the VMSAv8-64 PTEs */
     bool is_s2_format:1;
+    bool guarded:1;              /* guarded bit of the v8-64 PTE */
 } ARMCacheAttrs;
 
 /* Fields that are valid upon success. */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 23f16f4ff7..2d182d62e5 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1313,9 +1313,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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
index 5b67375f4e..60ff753d81 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14601,22 +14601,21 @@ static bool is_guarded_page(CPUARMState *env, DisasContext *s)
 #ifdef CONFIG_USER_ONLY
     return page_get_flags(addr) & PAGE_BTI;
 #else
+    CPUTLBEntryFull *full;
+    void *host;
     int mmu_idx = arm_to_core_mmu_idx(s->mmu_idx);
-    unsigned int index = tlb_index(env, mmu_idx, addr);
-    CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
+    int flags;
 
     /*
      * We test this immediately after reading an insn, which means
-     * that any normal page must be in the TLB.  The only exception
-     * would be for executing from flash or device memory, which
-     * does not retain the TLB entry.
-     *
-     * FIXME: Assume false for those, for now.  We could use
-     * arm_cpu_get_phys_page_attrs_debug to re-read the page
-     * table entry even for that case.
+     * that the TLB entry must be present and valid, and thus this
+     * access will never raise an exception.
      */
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



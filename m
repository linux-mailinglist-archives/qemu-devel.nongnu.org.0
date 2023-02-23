Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5186A116B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:46:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIRg-0002r0-3D; Thu, 23 Feb 2023 15:44:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRe-0002pb-18
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:44:02 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRc-0007S9-EZ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:44:01 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so548065pja.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 12:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=adwGVUESBK0GEWMpzNl1mlsUbwgbVqsJeAYNIU7i/OU=;
 b=BvWh+IpmMml1i+Nu1Wle7Htn4k1RH/mRH2y+RivLcJSfyIsgDvB3S/Hzq8x4DzRRnK
 u+KdyGtKaOgtk1v7oGIH3X0D5wybu1UOM/uBXbwrumbr0Aze/7bPs/ZSnfpfoWxlIOKh
 JYQPvuQ08gf43mQcV/q2EJhU91Cathv9UfWXhubK95I+OssCv66l3kHt+9tTVhV8yC7W
 OnoIpNAIrK5qAPWAm/uGSuU02oAeVqcuYZTbw3F374tzbYx8pD4UuwoOGTDdGqdSa51k
 gHcoht6N1bBWx9hoQgtAZc8bddSkAlQrV+b999U6l0OMlEpUNGIanX8oQrrCPUTMMNND
 DnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=adwGVUESBK0GEWMpzNl1mlsUbwgbVqsJeAYNIU7i/OU=;
 b=SObU76fNd2C2wAWZF7+7gfQs4n8rJBVh8Lyi9fTkeA4+gaKTw7gwHZZ5+7sEhMxo2m
 rE+HfGs/hZIUMv0TRe6WIUxefhAAHkjeZmPGuUZHQ+yOP7N/pTsWqV+zToHGBizzO2zK
 MOf0TdT2jv0jzhQKUr1PhnLyq/bnQlCGtbPJDc7a7VZH8sBgLXV9Ksv4rLRza4g94Myn
 QDNO8LsYoSQmRA7Nhcska16fx3501sIwhJLh1otWXcJqFG7eEeI0Qa1GeSOaY2Xuh7wl
 GxKwPBIIHOIV2HSHCsU0zGT5aAQHiH6+gFvMFxlWv3NqXGUkP1ykFl5ac5qi+2zfSBGt
 ntPQ==
X-Gm-Message-State: AO0yUKUh+lYrrLX2td7/q8OprqQVv6hoQ0Z7cZhXsRwA8MJGZRpC7nqu
 1dETQsYF4SM9eMLb88hbQjAHLEmpHXyqZKJBsGk=
X-Google-Smtp-Source: AK7set8tePRjwvDOhhcfzMtR10MM8VQZ+XRRVm1ROs83TNVZpyvqfT6Lhedruro1GkIbFpQ1kIWKjw==
X-Received: by 2002:a05:6a20:3d81:b0:be:da1c:df65 with SMTP id
 s1-20020a056a203d8100b000beda1cdf65mr15333638pzi.28.1677185038910; 
 Thu, 23 Feb 2023 12:43:58 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 e187-20020a6369c4000000b004b1fef0bf16sm5992850pgc.73.2023.02.23.12.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:43:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 07/13] accel/tcg: Move TLB_WATCHPOINT to TLB_SLOW_FLAGS_MASK
Date: Thu, 23 Feb 2023 10:43:36 -1000
Message-Id: <20230223204342.1093632-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223204342.1093632-1-richard.henderson@linaro.org>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

This frees up one bit of the primary tlb flags without
impacting the TLB_NOTDIRTY logic.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h | 12 ++++++------
 accel/tcg/cputlb.c     | 23 ++++++++++++++++-------
 2 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 080cb3112e..f3b2f4229c 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -378,12 +378,10 @@ CPUArchState *cpu_copy(CPUArchState *env);
 #define TLB_NOTDIRTY        (1 << (TARGET_PAGE_BITS_MIN - 2))
 /* Set if TLB entry is an IO callback.  */
 #define TLB_MMIO            (1 << (TARGET_PAGE_BITS_MIN - 3))
-/* Set if TLB entry contains a watchpoint.  */
-#define TLB_WATCHPOINT      (1 << (TARGET_PAGE_BITS_MIN - 4))
+/* Set if TLB entry writes ignored.  */
+#define TLB_DISCARD_WRITE   (1 << (TARGET_PAGE_BITS_MIN - 4))
 /* Set if the slow path must be used; more flags in CPUTLBEntryFull. */
 #define TLB_FORCE_SLOW      (1 << (TARGET_PAGE_BITS_MIN - 5))
-/* Set if TLB entry writes ignored.  */
-#define TLB_DISCARD_WRITE   (1 << (TARGET_PAGE_BITS_MIN - 6))
 
 /*
  * Use this mask to check interception with an alignment mask
@@ -391,7 +389,7 @@ CPUArchState *cpu_copy(CPUArchState *env);
  */
 #define TLB_FLAGS_MASK \
     (TLB_INVALID_MASK | TLB_NOTDIRTY | TLB_MMIO \
-    | TLB_WATCHPOINT | TLB_FORCE_SLOW | TLB_DISCARD_WRITE)
+    | TLB_FORCE_SLOW | TLB_DISCARD_WRITE)
 
 /*
  * Flags stored in CPUTLBEntryFull.slow_flags[x].
@@ -399,8 +397,10 @@ CPUArchState *cpu_copy(CPUArchState *env);
  */
 /* Set if TLB entry requires byte swap.  */
 #define TLB_BSWAP            (1 << 0)
+/* Set if TLB entry contains a watchpoint.  */
+#define TLB_WATCHPOINT       (1 << 1)
 
-#define TLB_SLOW_FLAGS_MASK  TLB_BSWAP
+#define TLB_SLOW_FLAGS_MASK  (TLB_BSWAP | TLB_WATCHPOINT)
 
 /* The two sets of flags must not overlap. */
 QEMU_BUILD_BUG_ON(TLB_FLAGS_MASK & TLB_SLOW_FLAGS_MASK);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e0765c8c10..cc98df9517 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1966,7 +1966,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
                  */
                 goto stop_the_world;
             }
-            /* Collect TLB_WATCHPOINT for read. */
+            /* Collect tlb flags for read. */
             tlb_addr |= tlbe->addr_read;
         }
     } else /* if (prot & PAGE_READ) */ {
@@ -1997,12 +1997,21 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
         notdirty_write(env_cpu(env), addr, size, full, retaddr);
     }
 
-    if (unlikely(tlb_addr & TLB_WATCHPOINT)) {
-        QEMU_BUILD_BUG_ON(PAGE_READ != BP_MEM_READ);
-        QEMU_BUILD_BUG_ON(PAGE_WRITE != BP_MEM_WRITE);
-        /* therefore prot == watchpoint bits */
-        cpu_check_watchpoint(env_cpu(env), addr, size,
-                             full->attrs, prot, retaddr);
+    if (unlikely(tlb_addr & TLB_FORCE_SLOW)) {
+        int wp_flags = 0;
+
+        if ((prot & PAGE_WRITE) &&
+            (full->slow_flags[MMU_DATA_STORE] & TLB_WATCHPOINT)) {
+            wp_flags |= BP_MEM_WRITE;
+        }
+        if ((prot & PAGE_READ) &&
+            (full->slow_flags[MMU_DATA_LOAD] & TLB_WATCHPOINT)) {
+            wp_flags |= BP_MEM_READ;
+        }
+        if (wp_flags) {
+            cpu_check_watchpoint(env_cpu(env), addr, size,
+                                 full->attrs, wp_flags, retaddr);
+        }
     }
 
     return hostaddr;
-- 
2.34.1



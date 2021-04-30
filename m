Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A789636F88A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:36:33 +0200 (CEST)
Received: from localhost ([::1]:56730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQVc-0000dT-NJ
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTt-0007De-BA
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:45 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:35459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTq-0001AP-Pf
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:44 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 26-20020a05600c22dab029013efd7879b8so1486654wmg.0
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Kw7jlqwrr+zV0rxqtI5yMdWAi84d/FR8/panxBOgGv8=;
 b=kN16AM3arv2GLXKm1VmhdhSAfbFDp3sA5L7929x3jmWhZtiReD+xm8ZqxoQDcHbdma
 eaACS8miAY2WgkfsbH2uTwF/XwATAS99P61/gOne5kq39Ew4mGwj2wPexmZaYYodNp+x
 Rl9pggCCPQ5HCmtBnRPi3vkTkaRL3hCLhgromAfwDVkvJK/vkUE/TGq8zovgBvVOK+qm
 ZzVeVFa/ct8YteyH5J19bMmlPPBEmcoPCLZQ4+KeH/DgBnxlIQ3ZAvpNOzygLYukgmT7
 vlJVjhxYEuMIB7YFMicHnCtCjJhSggsdq2V/h8S9GOWu8ggdOSoVIkgIiq10fC5khSfn
 6r6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kw7jlqwrr+zV0rxqtI5yMdWAi84d/FR8/panxBOgGv8=;
 b=qk4KmKLPig/f6PQRhf+TVIvDBZPG1y8C6HYZG4s8PU4Dzwu4Ksf0PXid0nAHK2FOps
 RqXIl9ufTBvD4zDWFycSpF0N41rkUm+2iPTE/dV3U2tqIQHGKEwqld+jkEbuO6OlhR4J
 nHeimBvBdAy9YWQTtg0UTsd60iNj9KMmu1s+3uKh/QnPp1kvY/x+I91a84XqwQcbY/90
 sXl6oiO4uQxuVPzjLzos/3wAiZUoeAPVGyinj4XaD3/QOw2DS5x2nQnaNLJtPHGtfecD
 OYpefKrSxnenagGcZhvszS/3W/ppTT2MrDEyHw6Y0cj3WQIBdZ4wbCuLr1A87j/jyzvn
 fG1w==
X-Gm-Message-State: AOAM530xpFgYrwA7eiovS/l6jfAjYCBhvPMsknvZ9k0wGgK35r77VrWW
 UBsy3++hSLmcPOCAak8O3wG0Sxz44LRlOSq9
X-Google-Smtp-Source: ABdhPJwZUmN/SXB9KtHXGzI5u9E9fjpFb/KFJDwXtl+vg6rBvVHjPqBiEKGt5szx10JttZY/XNg8FA==
X-Received: by 2002:a1c:7c15:: with SMTP id x21mr306882wmc.186.1619778881416; 
 Fri, 30 Apr 2021 03:34:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/43] target/arm: Fix mte_checkN
Date: Fri, 30 Apr 2021 11:33:57 +0100
Message-Id: <20210430103437.4140-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Richard Henderson <richard.henderson@linaro.org>

We were incorrectly assuming that only the first byte of an MTE access
is checked against the tags.  But per the ARM, unaligned accesses are
pre-decomposed into single-byte accesses.  So by the time we reach the
actual MTE check in the ARM pseudocode, all accesses are aligned.

Therefore, the first failure is always either the first byte of the
access, or the first byte of the granule.

In addition, some of the arithmetic is off for last-first -> count.
This does not become directly visible until a later patch that passes
single bytes into this function, so ptr == ptr_last.

Buglink: https://bugs.launchpad.net/bugs/1921948
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210416183106.1516563-2-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: tweaked a comment]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mte_helper.c | 40 ++++++++++++++++++----------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 8be17e1b707..010d1c2e993 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -757,10 +757,10 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
                     uint64_t ptr, uintptr_t ra)
 {
     int mmu_idx, ptr_tag, bit55;
-    uint64_t ptr_last, ptr_end, prev_page, next_page;
-    uint64_t tag_first, tag_end;
-    uint64_t tag_byte_first, tag_byte_end;
-    uint32_t esize, total, tag_count, tag_size, n, c;
+    uint64_t ptr_last, prev_page, next_page;
+    uint64_t tag_first, tag_last;
+    uint64_t tag_byte_first, tag_byte_last;
+    uint32_t total, tag_count, tag_size, n, c;
     uint8_t *mem1, *mem2;
     MMUAccessType type;
 
@@ -779,29 +779,27 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
 
     mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
     type = FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DATA_LOAD;
-    esize = FIELD_EX32(desc, MTEDESC, ESIZE);
     total = FIELD_EX32(desc, MTEDESC, TSIZE);
 
-    /* Find the addr of the end of the access, and of the last element. */
-    ptr_end = ptr + total;
-    ptr_last = ptr_end - esize;
+    /* Find the addr of the end of the access */
+    ptr_last = ptr + total - 1;
 
     /* Round the bounds to the tag granule, and compute the number of tags. */
     tag_first = QEMU_ALIGN_DOWN(ptr, TAG_GRANULE);
-    tag_end = QEMU_ALIGN_UP(ptr_last, TAG_GRANULE);
-    tag_count = (tag_end - tag_first) / TAG_GRANULE;
+    tag_last = QEMU_ALIGN_DOWN(ptr_last, TAG_GRANULE);
+    tag_count = ((tag_last - tag_first) / TAG_GRANULE) + 1;
 
     /* Round the bounds to twice the tag granule, and compute the bytes. */
     tag_byte_first = QEMU_ALIGN_DOWN(ptr, 2 * TAG_GRANULE);
-    tag_byte_end = QEMU_ALIGN_UP(ptr_last, 2 * TAG_GRANULE);
+    tag_byte_last = QEMU_ALIGN_DOWN(ptr_last, 2 * TAG_GRANULE);
 
     /* Locate the page boundaries. */
     prev_page = ptr & TARGET_PAGE_MASK;
     next_page = prev_page + TARGET_PAGE_SIZE;
 
-    if (likely(tag_end - prev_page <= TARGET_PAGE_SIZE)) {
+    if (likely(tag_last - prev_page <= TARGET_PAGE_SIZE)) {
         /* Memory access stays on one page. */
-        tag_size = (tag_byte_end - tag_byte_first) / (2 * TAG_GRANULE);
+        tag_size = ((tag_byte_last - tag_byte_first) / (2 * TAG_GRANULE)) + 1;
         mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, total,
                                   MMU_DATA_LOAD, tag_size, ra);
         if (!mem1) {
@@ -815,9 +813,9 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
         mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, next_page - ptr,
                                   MMU_DATA_LOAD, tag_size, ra);
 
-        tag_size = (tag_byte_end - next_page) / (2 * TAG_GRANULE);
+        tag_size = ((tag_byte_last - next_page) / (2 * TAG_GRANULE)) + 1;
         mem2 = allocation_tag_mem(env, mmu_idx, next_page, type,
-                                  ptr_end - next_page,
+                                  ptr_last - next_page + 1,
                                   MMU_DATA_LOAD, tag_size, ra);
 
         /*
@@ -838,15 +836,13 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
     }
 
     /*
-     * If we failed, we know which granule.  Compute the element that
-     * is first in that granule, and signal failure on that element.
+     * If we failed, we know which granule.  For the first granule, the
+     * failure address is @ptr, the first byte accessed.  Otherwise the
+     * failure address is the first byte of the nth granule.
      */
     if (unlikely(n < tag_count)) {
-        uint64_t fail_ofs;
-
-        fail_ofs = tag_first + n * TAG_GRANULE - ptr;
-        fail_ofs = ROUND_UP(fail_ofs, esize);
-        mte_check_fail(env, desc, ptr + fail_ofs, ra);
+        uint64_t fault = (n == 0 ? ptr : tag_first + n * TAG_GRANULE);
+        mte_check_fail(env, desc, fault, ra);
     }
 
  done:
-- 
2.20.1



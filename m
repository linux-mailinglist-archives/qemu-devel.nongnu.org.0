Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A303530DD
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 23:46:37 +0200 (CEST)
Received: from localhost ([::1]:47876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSRci-0005ti-Du
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 17:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYk-0000OW-W2
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:42:31 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:37537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYf-0007gU-Gr
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:42:30 -0400
Received: by mail-pl1-x62d.google.com with SMTP id h20so3029082plr.4
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 14:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y+w0gMMCEBK2Vtlb1FFYoCbN7uhYY0HOFcCe/poCdwU=;
 b=t7WSYds/LTRohORLyMGy3J20JQj6o+/XqYc5jd3CmRAcK/YnHQIavA3PqnDAJZLN4a
 euEyEYO65G43C1xm3Ikkyn6r2F1Xm2DiaCwl83fkHb/qkOpndv80D1kltqePBLNQ/x8R
 gaFR0G+FV2yqh6oo4RF/dK09o7s2YdoNiU4TO7mcWBy/G7oE1+7gGzRb6vKk8f+ofFUy
 9cquZXaTsPNt52+2PWU/l9rum6Wg3kXny1A3R+/6Z7E712R1LQ/3a7OK53QXMRq8y6wr
 FBOp1earr0nnL9H/LepiRSUws/p0RT3z8Z4sY69zTFrA7GqersuFHBc29dNIjOfUug8e
 Ddkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y+w0gMMCEBK2Vtlb1FFYoCbN7uhYY0HOFcCe/poCdwU=;
 b=DFkZ/Z5B5Ha8KXX8lwpHgkd3mE9eKEmuJ/OQ51BDSGOuyJwW8I0F6V5Peb7+NPji8z
 VJf1ADgMorORqHzazJk4/aeXfoVR0inotBxJx/FH0vmNrWlUcHtnNurz5JrO6VewA9B+
 5Z2ZQmYcrBeoVPXiICo6fqqMkxXwECfFfqg6dWqUG3j1eIhpQknI6/c8Cslm8CbQRw7r
 b2C6G9XDgFuDfZLebrsyMmQbV/6KZCzoqWxPzCkzzWciGCGlv5VD3q9xh6BZTqba268C
 aSlEsZ6AoX5l3L3Im9f7NKv2XQKkMtTGT/6yYFJBdOiCHr9Dm0ifeCXb5TWLpZ54FHbg
 Z+Og==
X-Gm-Message-State: AOAM530WJgsqZhMPfABjnMKZFjOqRtUOrAGskYThneEnKiaxTeDaeSRG
 vqnSwq666CiLDK3RzxEAJYjgsWbclN/q0A==
X-Google-Smtp-Source: ABdhPJz3g/ibX7R6/3JM8/nuPIQemcmmnaDd8tm/9cr+rcZz0N38kv1+UzSHGVE2nfZoWWTr+ST+PQ==
X-Received: by 2002:a17:90a:e542:: with SMTP id
 ei2mr15393080pjb.134.1617399744158; 
 Fri, 02 Apr 2021 14:42:24 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id f16sm7923329pfj.220.2021.04.02.14.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 14:42:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/11] target/arm: Fix unaligned mte checks for mte_checkN
Date: Fri,  2 Apr 2021 14:42:09 -0700
Message-Id: <20210402214217.422585-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402214217.422585-1-richard.henderson@linaro.org>
References: <20210402214217.422585-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were incorrectly assuming that only the first byte of an MTE access
is checked against the tags.  But per the ARM, unaligned accesses are
pre-decomposed into single-byte accesses.  So by the time we reach the
actual MTE check in the ARM pseudocode, all accesses are aligned.

Therefore, the first failure is always either the first byte of the
access, or the first byte of the granule.

Buglink: https://bugs.launchpad.net/bugs/1921948
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 8be17e1b70..473d84cee2 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -757,10 +757,10 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
                     uint64_t ptr, uintptr_t ra)
 {
     int mmu_idx, ptr_tag, bit55;
-    uint64_t ptr_last, ptr_end, prev_page, next_page;
+    uint64_t ptr_last, prev_page, next_page;
     uint64_t tag_first, tag_end;
     uint64_t tag_byte_first, tag_byte_end;
-    uint32_t esize, total, tag_count, tag_size, n, c;
+    uint32_t total, tag_count, tag_size, n, c;
     uint8_t *mem1, *mem2;
     MMUAccessType type;
 
@@ -779,12 +779,10 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
 
     mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
     type = FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DATA_LOAD;
-    esize = FIELD_EX32(desc, MTEDESC, ESIZE);
     total = FIELD_EX32(desc, MTEDESC, TSIZE);
 
     /* Find the addr of the end of the access, and of the last element. */
-    ptr_end = ptr + total;
-    ptr_last = ptr_end - esize;
+    ptr_last = ptr + total - 1;
 
     /* Round the bounds to the tag granule, and compute the number of tags. */
     tag_first = QEMU_ALIGN_DOWN(ptr, TAG_GRANULE);
@@ -817,7 +815,7 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
 
         tag_size = (tag_byte_end - next_page) / (2 * TAG_GRANULE);
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
2.25.1



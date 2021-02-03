Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F9130E399
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:53:49 +0100 (CET)
Received: from localhost ([::1]:55570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ODk-0005My-AQ
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NP3-0007kS-Tp
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:26 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOs-0001q8-2e
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:25 -0500
Received: by mail-pf1-x431.google.com with SMTP id j12so403142pfj.12
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9J8C2yhZQHwcHgCFCp6aWoyOwMetLwuIKJgxUSgtqBU=;
 b=ad/X3Pw/RzxAHyJ4ZfjzwUohqg7OPUzNVN4iwieT1iUQdqsL6C/fnKmFr6eCZObKY5
 pcf51OakGnhSF4m3lofyRIB3VAgXpizFmHWV5spODDXS84u5oa66Q9eTPqRLlOuNLter
 sGRCvCaYibowG09ha9Q5cU2eN5I0cimwa3lR1fnyP2JQjYFAIGKiIuRJyiViSU0vtWvZ
 HAUvXNSoWGKwT38A1EMePqWPXh+j59Z+/LS6haaUNbfR8o9CreGQnMlaknSCl3U8basp
 cLohd4GlpO6vkmptJeuj2bIq37fooYM4Fe2e2LFNcuPiE0M1ShabL+EyFZvlnxwscZNJ
 pceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9J8C2yhZQHwcHgCFCp6aWoyOwMetLwuIKJgxUSgtqBU=;
 b=XQvzalt5gjisFomtipPeS1bEN4jI7v4z7FhkmiC3BO27XfG2w+30lKQbV/hhnXygVy
 0A8GShy8Uc/RnN0amf+Wb6IUL8/Rs5IKUab0VuGuT8DZNQhGHlz3gcGLXVjUYJjJAW4i
 icuM73iMeb/ezD4sT1xJT6g8YyU4LJTdAEscneUA5KXVW9SOcqPS9/E2PT+Dc6tJSBgM
 xZyls0wRIJzaqTUpCJkoxXc5Ppjtf+kQGZF51ihWFvQmjHM1gCzyrImVQgEwwX2alGO0
 sPklbLQuy1xwe5eMd038/mjio+dmFzmrVHkAamm3WSJW8wAXm8LBZ+C+A9Hta4tEwiqj
 CQHQ==
X-Gm-Message-State: AOAM5333PSZ/Nm33z7P7m6h7Q20Z2yBvO1W7wVquVuRPYMaus5SU0Jbc
 DyvtsSzf32XMpRkNky6/bljsNyLB6EKrRJSk
X-Google-Smtp-Source: ABdhPJwDuOMSuWMS0zoReKI+eJGp8frmbl05QTLmApII4thC2q+N+WB2dCFhsZDTyLH8j/9D5nl4FA==
X-Received: by 2002:a65:5b47:: with SMTP id y7mr5080819pgr.221.1612378872795; 
 Wed, 03 Feb 2021 11:01:12 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:01:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 29/31] target/arm: Add allocation tag storage for user mode
Date: Wed,  3 Feb 2021 09:00:08 -1000
Message-Id: <20210203190010.759771-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the now-saved PAGE_ANON and PAGE_MTE bits,
and the per-page saved data.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index d55f8d1e1e..1c569336ea 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -78,8 +78,33 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
                                    int tag_size, uintptr_t ra)
 {
 #ifdef CONFIG_USER_ONLY
-    /* Tag storage not implemented.  */
-    return NULL;
+    uint64_t clean_ptr = useronly_clean_ptr(ptr);
+    int flags = page_get_flags(clean_ptr);
+    uint8_t *tags;
+    uintptr_t index;
+
+    if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE : PAGE_READ))) {
+        /* SIGSEGV */
+        arm_cpu_tlb_fill(env_cpu(env), ptr, ptr_size, ptr_access,
+                         ptr_mmu_idx, false, ra);
+        g_assert_not_reached();
+    }
+
+    /* Require both MAP_ANON and PROT_MTE for the page. */
+    if (!(flags & PAGE_ANON) || !(flags & PAGE_MTE)) {
+        return NULL;
+    }
+
+    tags = page_get_target_data(clean_ptr);
+    if (tags == NULL) {
+        size_t alloc_size = TARGET_PAGE_SIZE >> (LOG2_TAG_GRANULE + 1);
+        tags = page_alloc_target_data(clean_ptr, alloc_size);
+        assert(tags != NULL);
+    }
+
+    index = extract32(ptr, LOG2_TAG_GRANULE + 1,
+                      TARGET_PAGE_BITS - LOG2_TAG_GRANULE - 1);
+    return tags + index;
 #else
     uintptr_t index;
     CPUIOTLBEntry *iotlbentry;
-- 
2.25.1



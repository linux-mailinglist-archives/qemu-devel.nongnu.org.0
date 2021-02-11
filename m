Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D19318C2D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:38:58 +0100 (CET)
Received: from localhost ([::1]:58632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACBN-0003no-6m
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:38:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZO-0008S4-I5
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:42 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZE-00006d-D3
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:42 -0500
Received: by mail-wr1-x42f.google.com with SMTP id g10so4124656wrx.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=g2Yy6Gw+Zt5E0Xgr51AYWc0qRdU0SjlUfwyoeBPlQ/c=;
 b=RlJapo9DbgT4rlHnOoCiNNsJ1g3ckDZ9ioFGbaP0bi8eIVtS746/jqEpYAFSvha2Xo
 v8y9qdw9nlUFSZ0i8WVhgg7jB+6u4ph4p3F9dZ/vkDl98sb41NGRkoY/fi90Wgq6K4XQ
 Q9pI9N9BCpeOLj+dRTlyKcAZOrPsfdLnpoQPgJgKEJpRJfcU5QAE1Je/fNI/T4o4/hg0
 mpdZzy0ByQiZ5M8yxqWmahlCkgmdI3x1diJZgOH3ODui5qTMZKuRDfhGd/EXVc0Mp5+F
 9hJUvsQiI5BXHU9tygMJpUSAfQ0U59Suy1RIg6j2SKlmEHe2E8Dp6btD8dwXkHUKF5Nf
 2Kmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g2Yy6Gw+Zt5E0Xgr51AYWc0qRdU0SjlUfwyoeBPlQ/c=;
 b=LXP7+kTv/KKsih2bMMA25MWxn0hPu1dOrhPBez1U4Ry/85Ze6ppyU7d8TzrxuFPdPN
 44qdq0fcTzkLl5gTqE15uCSj2T0leJ6PGTdtxwPdIzRVINlhEV+5dCg1nTh8oIo7WhFX
 w4R/2Cgxw34+wsI5yFfaC/6G9ZtwvHWHqtq1leGkpWWIjkk0Bja36oCjIdyB8dEWrxz1
 uqkyMpt51Mja1POkomz4Mj8/CO5SumrVhIS+pajnB1Wcd+o71GNQq8kKgsIS9+M1mIpo
 HTAdVBFxtAwPnquz/Vw1kASl3CdIKIbztcn8OgHVGhwO890rKC/NzzrsMIBEw8TNDmR5
 jhhA==
X-Gm-Message-State: AOAM533R9apJa0MgJ6thuPPoiK93tjc4IC2rJZaPyECOYMg0n4fBbLY5
 VU58bwL8Rmolu0g1QBBfsrEMRNVmHLqp3g==
X-Google-Smtp-Source: ABdhPJxDzQaxx2WXmBpHkGKdAswdGy4S0S3y9uINErbfW52rDKt942pzgPqnBu6UPRh+QDBEfOlqkg==
X-Received: by 2002:a5d:4708:: with SMTP id y8mr5491816wrq.402.1613048371190; 
 Thu, 11 Feb 2021 04:59:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/45] target/arm: Add allocation tag storage for user mode
Date: Thu, 11 Feb 2021 12:58:53 +0000
Message-Id: <20210211125900.22777-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

Use the now-saved PAGE_ANON and PAGE_MTE bits,
and the per-page saved data.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-30-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mte_helper.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index d55f8d1e1ed..1c569336eae 100644
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
2.20.1



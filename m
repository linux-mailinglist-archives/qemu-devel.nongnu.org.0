Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F65831CE51
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:45:13 +0100 (CET)
Received: from localhost ([::1]:41258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3TM-0004v4-1Q
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:45:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC335-0000F6-H7
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:18:03 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32Q-0002VD-N9
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:18:03 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t15so13726385wrx.13
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9e9V0n7IBTjs6YDR/+9PeRgafaFDEAzf50hk1SqmPEc=;
 b=OdeUMejCWJeQJmIAdfr4Tv6usTEV6btq3mssO6Z+IphcpRWSQJT0x3WgNgSl6oBPDH
 D/egZWClbLWYqcJlx3wrWM5CyZykVjvITGVeiCze06wnq9sQDLMgVL0dWSTXABPFoCQX
 JaQ/bLoh7YenLY3jRVk0DI8vVL+GiOQ8aJyky1w3DGdRY9O6WzfblLTXd5PvyMrWaNKm
 y8v9HKVV2zayO4QdZy6HIF0qu3CBS2LZtpRD4KhknCECJRTHvWyalUOyckItYOOOK/9B
 ESx+iiSs8r0W5tTnNlNDmYpYhGAZG4BL03Wi2L+BsaD6dP8wI944sVL1hYuU1h9JH6OZ
 bIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9e9V0n7IBTjs6YDR/+9PeRgafaFDEAzf50hk1SqmPEc=;
 b=PPcHDY1K5VajcwJ2Q+j0AVXoqRtpTcrFD85jOShy0sjYUJakk871Stxm0Wu90KvlW2
 yhnNdOO1npthiR+qvxl421qo8AK10Yjm7BPkuUM3qxeM1e6f6lIJosaVGjtRD7gou5S4
 rGX7kjkhDC0KEAFioQQgErgS9BtbfekeC9pBzK0cg80VImlGSWLQfw2xHf2RqPsGPs5s
 unq1PTu5SMyQhKZJs6mrIlKhTdBIeab7zn7jxNIbmnQlTDLwD62k5sbPiLGno/E+vB+i
 ao9dtHda/RgLoJpaV36XMmbb/13G2r5DTWdzp59+0DG1h/gDfN7d35kx1tfT/OfGeqK3
 zs9g==
X-Gm-Message-State: AOAM530JQOPiSA0gZzK5hCZK1rXtmel5dAWoyne3iBW0GIQb2S42YCI3
 Tk4fqUDnyIT4t/coxgJPdTv1wH38BDMhvQ==
X-Google-Smtp-Source: ABdhPJybfaz7o0uE6pIU88PK0KikuaYxgQ17FbuIHYdAyX0itpCUUsqVcch6Ta+e9kocCMPzPDFvdQ==
X-Received: by 2002:adf:fc86:: with SMTP id g6mr24271849wrr.20.1613492240788; 
 Tue, 16 Feb 2021 08:17:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/40] target/arm: Add allocation tag storage for user mode
Date: Tue, 16 Feb 2021 16:16:47 +0000
Message-Id: <20210216161658.29881-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Message-id: 20210212184902.1251044-30-richard.henderson@linaro.org
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



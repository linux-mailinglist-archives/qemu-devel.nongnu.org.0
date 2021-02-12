Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC6A31A555
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:25:34 +0100 (CET)
Received: from localhost ([::1]:58764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAe4L-0005Oo-A5
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVg-000265-IV
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:44 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:42991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVd-0007vE-Vo
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:44 -0500
Received: by mail-pf1-x42b.google.com with SMTP id w18so55752pfu.9
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9J8C2yhZQHwcHgCFCp6aWoyOwMetLwuIKJgxUSgtqBU=;
 b=qRetuitnv1o1D9eDfyzBO+8538xggi2yHLCojhmkqlczUGERVQIJKwlmWTTK60ltTK
 HOTtw82etwNGtW7p9byUO8ttF5XifWUR3RAx2AAuAgohEKlRyaFr9/EH8fx/9bO44fBS
 kKXnRIJhhzm0DkbJyaum3BPfgctUcqcIivVO9BKjDl2AAzNPLZ39Tu7VbMY+qMevl+ck
 nKs22iz1xSSfWoVtOzcSYUk72FvhW9nEgAahSVeg2RJEtxEWIurwM+MCVkId0uLox6a8
 5XESAJ5wtnOoitnaQtMpxn2E9ueEl64MAFgPyalw0kPoDmrnaMDq16zU/YZeDFYhJls7
 dkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9J8C2yhZQHwcHgCFCp6aWoyOwMetLwuIKJgxUSgtqBU=;
 b=XUMpZX77WHIVlssmH1fikw5UHgbMlvTeNd1F0Ygo+6niop12r1DB9CfKwo2KLlYg0V
 n02FTLnOu0pX66PZCUQ6qtKaLOyslBHysCasaOiKRvdqIjsc51E3fgucdsucdJs9ZNY0
 3crDYs5CmpwMivnde25d54abZtPVJ+k6J0Loh2ZhUHskMjylfp07ihzUcTUFczGvHMfe
 q4Lvw6CufTHeGzigyNCZrrJ610ZsK+54q4EMUVvYd/SO4AjmBI5+LwMTjN9XvJjFTZMZ
 dB6TUTGI5pFAnr7UkUHexvSOFz2ZofjZXQkpuF1+wrueUNjA6bZKjCR8eKtOpnhZm4vk
 mjTg==
X-Gm-Message-State: AOAM532JeLsM+f8tSLvtTD1+W3FHF0k3u5AEFxQ2UJEcTn6aXIbZoc88
 BYVcXLTPSMbya5Kl+b8k5wjLowowV24uEg==
X-Google-Smtp-Source: ABdhPJzRzOCflwvFDNc943eDD4a3EAs5Cu1J4zxOjYv1KvMkUScWXx3t3JwLzuhkCN2H4+t1oKM11g==
X-Received: by 2002:a63:1c08:: with SMTP id c8mr4482061pgc.228.1613155779723; 
 Fri, 12 Feb 2021 10:49:39 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 29/31] target/arm: Add allocation tag storage for user mode
Date: Fri, 12 Feb 2021 10:49:00 -0800
Message-Id: <20210212184902.1251044-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: peter.maydell@linaro.org
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D827D315B51
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:36:14 +0100 (CET)
Received: from localhost ([::1]:57926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9dUM-0000ur-0B
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:36:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cyq-00042R-NH
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:40 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:45159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cyG-00088x-IN
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:38 -0500
Received: by mail-pf1-x42b.google.com with SMTP id j12so86918pfj.12
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9J8C2yhZQHwcHgCFCp6aWoyOwMetLwuIKJgxUSgtqBU=;
 b=JyBLYG/ElxhwVpg4aid+N/jwqkwptjB8yEKbOvUIQKcMORIHdr6ipJxFIGiHuJLiqu
 xEO/QlM9eFQXsFjn8/wnJqGGWSw6UVPEDJG8aB1Je1Lbzy7x8XkC/gV1bWFN8Nu8qBgc
 TYAsDKrQjpMV3sRdD/fP4++ajXezk0yMxjkk0+d8cAs7Y+YmoiKwqkh27SV3JCwthu1q
 LmJ24hZqn3T0PxNXKQcX/JaMDM6ha843Vlo4mOFo5gjb54M5mGMWqb+dC9VWa2iK6abO
 zMK4K4QUmGk4uRaRLllB5UWy+BZuF+0x9NuwVcXE6FC9hA1TRDt9fWkF7iK64iWb9qup
 33QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9J8C2yhZQHwcHgCFCp6aWoyOwMetLwuIKJgxUSgtqBU=;
 b=E9cuv3S34XK3SdI+SYmNS9wxfxPdyirRKLsfyBgium0GRRDAfCrFv7uARcmQ8CP3dA
 /juMqQ2HwvD4fPmNIh4vetoIVWhNL5magkSNx00H4EXsh10pJjuq3LuKjvP00+ETf786
 e0TdHS79pe2xmxeaUIENvEqPSoPD/ok9GUyekYt5Hnrub9t80VyRCDv+o40iiIzcFKte
 eyeky1SpztRJeHSo9wHe8rczCjznw89/Xd1M7E8x38invJpT/6ie5S2w6qVrUgkU9beR
 lcUjHGc2elyBgEJydGUg2VYskBtQSPOFeGtpwIuOi4CRJDG0yFPjtsCEKqa7rzQleFSj
 Uh/g==
X-Gm-Message-State: AOAM532iNOMnwK7onk4ZfGPib3A7oK9GfdE9WiM39UFUWngr/0IHq4rv
 idit+u8lak2ldna/Lk1oVy222zJz1ibFrw==
X-Google-Smtp-Source: ABdhPJx59CDQ65P+f+gHIl+PDgbEoDTa32FMQNcIdmeDJmZ2Y0qonQKFPZ4C9oUf9rVn8ujb4F73rA==
X-Received: by 2002:a63:720c:: with SMTP id n12mr418672pgc.97.1612915380723;
 Tue, 09 Feb 2021 16:03:00 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:03:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 29/31] target/arm: Add allocation tag storage for user mode
Date: Tue,  9 Feb 2021 16:02:21 -0800
Message-Id: <20210210000223.884088-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
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



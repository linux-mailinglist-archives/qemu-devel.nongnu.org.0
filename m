Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E34C2F8924
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 00:07:56 +0100 (CET)
Received: from localhost ([::1]:34832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0YCB-0004K8-Hl
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 18:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsN-0003vm-4l
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:27 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:53100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsH-0005Kc-32
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:26 -0500
Received: by mail-pj1-x102e.google.com with SMTP id v1so5895757pjr.2
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e1dRDYwqVg1e/BMj2WtrxEnKh4CuzKOtBUsWpusVo1U=;
 b=rIS9TFyK5NpMdRM+0ahyHi12GiHnDA7/L7VG4hDa8+RhC+6W/mOZ3zcgdrGjszWdXh
 h9j0UQn7wvuIl18f4TSY6gAfYxDwGftlZD1nluTKZMWOW7zJ5KfyZvNUMOPZhWV7Jsee
 g2XqRUaV9x/Ef/C9Nv+NqzpRF+F6Xn7mMQ4tDNCf1YDV3i9gD14/wFV4K7jSrFQgj8cw
 s790MCDblWSLhTXn1R82YFi9FsCF3rqvNv4F/blJcaYl8MBhPn9PDXewmxWS+2M6ybIq
 PkmUL0eThI3ZlUjZY8XBFJNpzwkxU4lhoRPd5J0ZPlRH8C/JgtuLX54tY9XVkOoznRrD
 IEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e1dRDYwqVg1e/BMj2WtrxEnKh4CuzKOtBUsWpusVo1U=;
 b=ZMGKiGNkL6IUdQGcMjxraorCBMelJawVd63+Z0z+CrgykDryLmgsCNWc/4+TalSZPg
 HDH51j4nKEN2DlmPwcF6MIXMd92qjGPrMfMdvFzxsU96bIZQiRB+Xjr/8moSdR67K88P
 aXl54Dc4ghGKgOFv3a4lKC70pxWvZEPF0St239vW7vCx9OIR2Kg4PMwWIoLoFM6USjRi
 q/G25Mo0WA4MN0kdsc/hgbVZJ29md1Oupwm+6ERBrdxWfMzIFH7QXQD21eHJLF/a9kht
 VNy5aM0q2LdsJ/bUxffYArxLSo+iFY+Sjw2U63E6nu+ZKSGuF5vqQjKrWA9R1HPBm3fE
 kFFQ==
X-Gm-Message-State: AOAM530ap9T+yv1LJNQULlOqf14X4yIgsUicAW4T/yadHQZ2GaGyXflg
 KNJWaQfgFCJdSAp94Djuv4vFhoBa84ghC+xF
X-Google-Smtp-Source: ABdhPJwuj7hIwSs9bgKHluMX/wctZ0NkzG3nqZ7sKkhaDIdqqjsdVoHLqzZK97zkOh2NqRLmpWL5HA==
X-Received: by 2002:a17:90a:5b18:: with SMTP id
 o24mr13093339pji.120.1610750839784; 
 Fri, 15 Jan 2021 14:47:19 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:47:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/21] target/arm: Add allocation tag storage for user mode
Date: Fri, 15 Jan 2021 12:46:43 -1000
Message-Id: <20210115224645.1196742-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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



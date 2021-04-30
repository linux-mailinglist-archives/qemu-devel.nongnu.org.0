Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B68F236F896
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:40:18 +0200 (CEST)
Received: from localhost ([::1]:40104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQZF-0005Sq-PF
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTw-0007H7-7k
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:48 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTs-0001C2-Hx
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:47 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x5so19716149wrv.13
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hDecypmLsBixP4oL8UwqI6CKcvvOLSatSEv+SoClHSc=;
 b=J/aEd8rmJhsMy2ZV99gYVSpkn8CNHz6OwVdRYEMO9I7zQ5/AedRhJy/qbwNBv0Lga/
 1iVty3xeCYb0VMjREqt8WgMgePFADHifJvJa+oGGD7FbPqMWRlPVwSO5SuWxIf2vvcgg
 UJ95u8OG0S7+50l0Yq1nADtsd18dWZ4SLvxknZ2SQkz4nnFBHfJZLhA/bQbab5AVKLuB
 cFgX7iimhsaswAeznT2WlIonLxng0M1FFiYgK2/8+t2jaR1+ClCFooXFbCqBi3m3yjnf
 iUdOG6Y4/WEmiGrFV5ItDcFGdjxXAJ8znN36x77137YPmqztbeCXaLKQvP7IgEUqr/yO
 4dBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hDecypmLsBixP4oL8UwqI6CKcvvOLSatSEv+SoClHSc=;
 b=pjLMUAo5eHucZRlTlvfKeWk7rfFYXHRMjNhDC9D9IJ8+PLKQBhuYGp5FQVDD6EHOtf
 5tFMiZQu0QSFZ2xOlhBgKqf5QORqYIEwrV38fjic4kTKyEY9dxpE3CNWKViHkVuIJn3o
 VonahrRWrUB8cGhAJLChe2zYdLiNrWRz482Et8VnWHCAWhwjHUIAFPFkLI/jVQgluaSe
 v4/wLtcdcDw/x5dCCunGuO1Ke4xFhpi1k2CrN4I+mbIDQKa0cT/g7svgQ7Tr6980t1Sj
 vmCrr6Zwyk0W8c1/dHMdpXY51YEOhOH7hCx7B26rWc8332m/QdihrPoNLR2EAo0Hc48K
 ghqg==
X-Gm-Message-State: AOAM5317+DuVLSCJ4dS572ZzMvj16ahmM98BIu5yyVg11vM/iWaOyglt
 rKsW1WnQWqvPfNwlXNkI2u4KFBvPDGjd+fJv
X-Google-Smtp-Source: ABdhPJyZBunLqueD8srdVuQs59IirqehUFBEiOHyKkJ85gO9A5yeLg6CN0GmqrhSBPrRp/AAqtQ+pg==
X-Received: by 2002:adf:f3c1:: with SMTP id g1mr6004121wrp.344.1619778883150; 
 Fri, 30 Apr 2021 03:34:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/43] target/arm: Fix unaligned checks for mte_check1,
 mte_probe1
Date: Fri, 30 Apr 2021 11:33:59 +0100
Message-Id: <20210430103437.4140-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We were incorrectly assuming that only the first byte of an MTE access
is checked against the tags.  But per the ARM, unaligned accesses are
pre-decomposed into single-byte accesses.  So by the time we reach the
actual MTE check in the ARM pseudocode, all accesses are aligned.

We cannot tell a priori whether or not a given scalar access is aligned,
therefore we must at least check.  Use mte_probe_int, which is already
set up for checking multiple granules.

Buglink: https://bugs.launchpad.net/bugs/1921948
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210416183106.1516563-4-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mte_helper.c | 109 +++++++++++++---------------------------
 1 file changed, 35 insertions(+), 74 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 2b5331f8dbc..0ee0397eb26 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -617,80 +617,6 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
     }
 }
 
-/*
- * Perform an MTE checked access for a single logical or atomic access.
- */
-static bool mte_probe1_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
-                           uintptr_t ra, int bit55)
-{
-    int mem_tag, mmu_idx, ptr_tag, size;
-    MMUAccessType type;
-    uint8_t *mem;
-
-    ptr_tag = allocation_tag_from_addr(ptr);
-
-    if (tcma_check(desc, bit55, ptr_tag)) {
-        return true;
-    }
-
-    mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
-    type = FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DATA_LOAD;
-    size = FIELD_EX32(desc, MTEDESC, ESIZE);
-
-    mem = allocation_tag_mem(env, mmu_idx, ptr, type, size,
-                             MMU_DATA_LOAD, 1, ra);
-    if (!mem) {
-        return true;
-    }
-
-    mem_tag = load_tag1(ptr, mem);
-    return ptr_tag == mem_tag;
-}
-
-/*
- * No-fault version of mte_check1, to be used by SVE for MemSingleNF.
- * Returns false if the access is Checked and the check failed.  This
- * is only intended to probe the tag -- the validity of the page must
- * be checked beforehand.
- */
-bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr)
-{
-    int bit55 = extract64(ptr, 55, 1);
-
-    /* If TBI is disabled, the access is unchecked. */
-    if (unlikely(!tbi_check(desc, bit55))) {
-        return true;
-    }
-
-    return mte_probe1_int(env, desc, ptr, 0, bit55);
-}
-
-uint64_t mte_check1(CPUARMState *env, uint32_t desc,
-                    uint64_t ptr, uintptr_t ra)
-{
-    int bit55 = extract64(ptr, 55, 1);
-
-    /* If TBI is disabled, the access is unchecked, and ptr is not dirty. */
-    if (unlikely(!tbi_check(desc, bit55))) {
-        return ptr;
-    }
-
-    if (unlikely(!mte_probe1_int(env, desc, ptr, ra, bit55))) {
-        mte_check_fail(env, desc, ptr, ra);
-    }
-
-    return useronly_clean_ptr(ptr);
-}
-
-uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t ptr)
-{
-    return mte_check1(env, desc, ptr, GETPC());
-}
-
-/*
- * Perform an MTE checked access for multiple logical accesses.
- */
-
 /**
  * checkN:
  * @tag: tag memory to test
@@ -882,6 +808,41 @@ uint64_t HELPER(mte_checkN)(CPUARMState *env, uint32_t desc, uint64_t ptr)
     return mte_checkN(env, desc, ptr, GETPC());
 }
 
+uint64_t mte_check1(CPUARMState *env, uint32_t desc,
+                    uint64_t ptr, uintptr_t ra)
+{
+    uint64_t fault;
+    uint32_t total = FIELD_EX32(desc, MTEDESC, ESIZE);
+    int ret = mte_probe_int(env, desc, ptr, ra, total, &fault);
+
+    if (unlikely(ret == 0)) {
+        mte_check_fail(env, desc, fault, ra);
+    } else if (ret < 0) {
+        return ptr;
+    }
+    return useronly_clean_ptr(ptr);
+}
+
+uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t ptr)
+{
+    return mte_check1(env, desc, ptr, GETPC());
+}
+
+/*
+ * No-fault version of mte_check1, to be used by SVE for MemSingleNF.
+ * Returns false if the access is Checked and the check failed.  This
+ * is only intended to probe the tag -- the validity of the page must
+ * be checked beforehand.
+ */
+bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr)
+{
+    uint64_t fault;
+    uint32_t total = FIELD_EX32(desc, MTEDESC, ESIZE);
+    int ret = mte_probe_int(env, desc, ptr, 0, total, &fault);
+
+    return ret != 0;
+}
+
 /*
  * Perform an MTE checked access for DC_ZVA.
  */
-- 
2.20.1



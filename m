Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D2A355AB6
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 19:48:31 +0200 (CEST)
Received: from localhost ([::1]:35720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTpoU-0001VE-2t
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 13:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgw-0001iB-UJ
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:42 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:39518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgt-0006L4-W2
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:42 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so10054206pjb.4
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 10:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bmRgp+hz0GAy8sBEmRvnPYPMAtwbiJML48v1bJslbg4=;
 b=O9BipY2WU4pSGlOlhX/14k5F3S8mHtQQ7IXOFREecGcmHEoViXZCQNOueXwQH9FGWs
 MQF4gBLIYXgoWsM+BKYf1KGcpmewgOIQB74fn9dwh5sEo9ipr+mejKzzNqE2W2KJ3Yze
 sOA9swCnbSZIX/sk1VgGIAeQkdFLtMXi9h+7Nwr7RJDMGUO8KsK3jrLmU/qV70qlk/Nj
 RZCqvg55wrbXAKT2+5WXEYMuIyY6diFG07jpTklBpT+P3/M3iYyQehoWHLWhxhm1kR/L
 kek7dVAnbuLjkzdRa2xaSMWcDv0HdQdbKPOTn64cEAViuu8gtS3MKcb06ZoLpZG1mUPy
 vp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bmRgp+hz0GAy8sBEmRvnPYPMAtwbiJML48v1bJslbg4=;
 b=EsoWjqw4o8NOoIGLwAf8AgVbYB7YVnumf5Z5iI3LZ4WKeiohHtT2gYLruMweWZBk4m
 tpph76MSvnMOPvzX9rtfrimlRalKerXxd1A4qfALe0EDXrmKNa8K595Wd2+sjnAicX2W
 uKtcwsDCjyddxaITNVeTnUoiWUQACvUIPM6ffYz4RGwd3WXRhO5/fu+WWqn5k8zETkZX
 llgOtuxY9f5CRiQhsIpluy4bJSNHFzSy93D49yK7lz48sLLpcAXTW9sWgWJXSE01R2zn
 8P88kE2Y1xbaUkSPqUtFctDYfGDcM3W/1FfyKZjZuvHRaIE8KfrSt1f0eX0WIylYRA+s
 su9Q==
X-Gm-Message-State: AOAM531b1VYbxkV7fn4986+kmLbIUf7BrjopviPyzrLUhmeJ9o8F2Mqa
 Efk8y2eg+jk/Tm3ir5/CXwUiK9p6kfdU4Q==
X-Google-Smtp-Source: ABdhPJwLdnuorCsi+Xh4YkvL8Wq00v6d4WTiAOftfVj5CvC8Xs9Gzb1be660qeo3LZ+yzvMT0cz2xQ==
X-Received: by 2002:a17:90b:e18:: with SMTP id
 ge24mr5479320pjb.199.1617730838218; 
 Tue, 06 Apr 2021 10:40:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h15sm19148056pfo.20.2021.04.06.10.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:40:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/12] target/arm: Fix unaligned checks for mte_check1,
 mte_probe1
Date: Tue,  6 Apr 2021 10:40:24 -0700
Message-Id: <20210406174031.64299-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406174031.64299-1-richard.henderson@linaro.org>
References: <20210406174031.64299-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were incorrectly assuming that only the first byte of an MTE access
is checked against the tags.  But per the ARM, unaligned accesses are
pre-decomposed into single-byte accesses.  So by the time we reach the
actual MTE check in the ARM pseudocode, all accesses are aligned.

We cannot tell a priori whether or not a given scalar access is aligned,
therefore we must at least check.  Use mte_probe_int, which is already
set up for checking multiple granules.

Buglink: https://bugs.launchpad.net/bugs/1921948
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 109 +++++++++++++---------------------------
 1 file changed, 35 insertions(+), 74 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 144bfa4a51..619c4b9351 100644
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
2.25.1



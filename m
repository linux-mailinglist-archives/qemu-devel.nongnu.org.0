Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EE5355AA1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 19:45:46 +0200 (CEST)
Received: from localhost ([::1]:57178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTplp-00075F-9V
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 13:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgv-0001eW-0a
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:41 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:35500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgs-0006Kd-KC
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:40 -0400
Received: by mail-pl1-x636.google.com with SMTP id j7so3225748plx.2
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 10:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YQ1L8vImC9BAqb2R2P9ZLLT4N7NCVNuCBmSGEW3fZ+M=;
 b=prMx0V7Mceo2sC/+8iI3ycNrW7C7iFVkUBUp/S2D4ZdUDN50Zk+KU70H7RYj0xmNuF
 p80sptEnD5w1QSwb8/YE5fRiXRuaaxu4EUdhY97oBWx0QEkDUJyMo0NQix1Gcb7oTfOH
 p8DhJnYuSO2Wwv6ArOfdnloZz5nO4FcwAPMoWpw2K8AgEwT0p1MeE+WtDDSQ2H6EVjTz
 zQxMjLYV59vsFKAVNLpDQsO/tHKy2RcJ7Y/Qv4f+SrH5IkrvkhshZJdpfmWUmwt4HAYe
 o8Fq7k2AyxFw/Z6GhhWUrV07QfZrm4u/yvYFqrjskJD29YU8l+1jnkB43+H1xWdMlbJY
 dAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YQ1L8vImC9BAqb2R2P9ZLLT4N7NCVNuCBmSGEW3fZ+M=;
 b=knsy4StLmAcFm9LhmRQYW1OTJwa6bYRJqqgBwwv7y+/TM+30/iIXR8AI5oAoIlk8o2
 hs5MXIMfuN2/78dGdyP7M7dhya5okCTR4WZwhmACO6mohf1tXYTFN9HhoqoSrVA8qNNz
 gnzT0ztktsANX3j7L2bqwd7EZSfqHsDki7CkjwarcYa7GaNeJWi5XaLF9VrkLYgE4Xfv
 nq/yW9ctLcRJN2rIqvqwuRvUm5W6LYjCAPxhPIMJLGM7nAGNQt0o/U9CkZdqhr1Qd+m4
 zvp/W9i5nKStPIsyT4qFob5cSM17HNvKSDxd5oV4XD/tpuO3Qw7AHczXGETneEAe+NbK
 ltAQ==
X-Gm-Message-State: AOAM530Q6/c4cjsWS1b4bjndww+eEVi7KNM58a+FgEtrHLzbXDB9igip
 CxVHu/x1Oszq8Hl6RxDVor/85DKMgXDkgw==
X-Google-Smtp-Source: ABdhPJwa3kpToFzf//hGp5f4NIvipds9hQKiU3gxWQqXIG2Ay36XHwHXeD3gIBw2/KjWWWj9/m8ZSg==
X-Received: by 2002:a17:902:7401:b029:e8:e6e5:3240 with SMTP id
 g1-20020a1709027401b02900e8e6e53240mr14389236pll.62.1617730837238; 
 Tue, 06 Apr 2021 10:40:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h15sm19148056pfo.20.2021.04.06.10.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:40:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/12] target/arm: Split out mte_probe_int
Date: Tue,  6 Apr 2021 10:40:23 -0700
Message-Id: <20210406174031.64299-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406174031.64299-1-richard.henderson@linaro.org>
References: <20210406174031.64299-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Split out a helper function from mte_checkN to perform
all of the checking and address manpulation.  So far,
just use this in mte_checkN itself.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 52 +++++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index c87717127c..144bfa4a51 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -753,33 +753,45 @@ static int checkN(uint8_t *mem, int odd, int cmp, int count)
     return n;
 }
 
-uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
-                    uint64_t ptr, uintptr_t ra)
+/*
+ * mte_probe_int:
+ * @env: CPU environment
+ * @desc: MTEDESC descriptor
+ * @ptr: virtual address of the base of the access
+ * @fault: return virtual address of the first check failure
+ *
+ * Internal routine for both mte_probe and mte_check.
+ * Return zero on failure, filling in *fault.
+ * Return negative on trivial success for tbi disabled.
+ * Return positive on success with tbi enabled.
+ */
+static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
+                         uintptr_t ra, uint32_t total, uint64_t *fault)
 {
     int mmu_idx, ptr_tag, bit55;
     uint64_t ptr_last, prev_page, next_page;
     uint64_t tag_first, tag_last;
     uint64_t tag_byte_first, tag_byte_last;
-    uint32_t total, tag_count, tag_size, n, c;
+    uint32_t tag_count, tag_size, n, c;
     uint8_t *mem1, *mem2;
     MMUAccessType type;
 
     bit55 = extract64(ptr, 55, 1);
+    *fault = ptr;
 
     /* If TBI is disabled, the access is unchecked, and ptr is not dirty. */
     if (unlikely(!tbi_check(desc, bit55))) {
-        return ptr;
+        return -1;
     }
 
     ptr_tag = allocation_tag_from_addr(ptr);
 
     if (tcma_check(desc, bit55, ptr_tag)) {
-        goto done;
+        return 1;
     }
 
     mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
     type = FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DATA_LOAD;
-    total = FIELD_EX32(desc, MTEDESC, TSIZE);
 
     /* Find the addr of the end of the access, and of the last element. */
     ptr_last = ptr + total - 1;
@@ -803,7 +815,7 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
         mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, total,
                                   MMU_DATA_LOAD, tag_size, ra);
         if (!mem1) {
-            goto done;
+            return 1;
         }
         /* Perform all of the comparisons. */
         n = checkN(mem1, ptr & TAG_GRANULE, ptr_tag, tag_count);
@@ -829,23 +841,39 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
         }
         if (n == c) {
             if (!mem2) {
-                goto done;
+                return 1;
             }
             n += checkN(mem2, 0, ptr_tag, tag_count - c);
         }
     }
 
+    if (likely(n == tag_count)) {
+        return 1;
+    }
+
     /*
      * If we failed, we know which granule.  For the first granule, the
      * failure address is @ptr, the first byte accessed.  Otherwise the
      * failure address is the first byte of the nth granule.
      */
-    if (unlikely(n < tag_count)) {
-        uint64_t fault = (n == 0 ? ptr : tag_first + n * TAG_GRANULE);
-        mte_check_fail(env, desc, fault, ra);
+    if (n > 0) {
+        *fault = tag_first + n * TAG_GRANULE;
     }
+    return 0;
+}
 
- done:
+uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
+                    uint64_t ptr, uintptr_t ra)
+{
+    uint64_t fault;
+    uint32_t total = FIELD_EX32(desc, MTEDESC, TSIZE);
+    int ret = mte_probe_int(env, desc, ptr, ra, total, &fault);
+
+    if (unlikely(ret == 0)) {
+        mte_check_fail(env, desc, fault, ra);
+    } else if (ret < 0) {
+        return ptr;
+    }
     return useronly_clean_ptr(ptr);
 }
 
-- 
2.25.1



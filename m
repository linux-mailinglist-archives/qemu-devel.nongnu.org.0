Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15E13627CB
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:35:01 +0200 (CEST)
Received: from localhost ([::1]:52370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTIy-0003b7-Pf
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTFK-0000hO-VU
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:31:14 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:43547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTFH-0003gv-SU
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:31:14 -0400
Received: by mail-pl1-x631.google.com with SMTP id u15so5888195plf.10
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 11:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VKhNo07AIpkWTNuysrty7FMgZRNyaIpXlGW/Jh9dVoY=;
 b=nDN9Yq9L13X2EHe2Mcp8lFsuv5x4tmxD0mXtGbE6b/5sot9KPekdCEzG3cqWPcG/IX
 dm2QMuOJFdTGi5qpibChvLRizLTE1wQUYFkdWHebdNEJEAHdjTYsPyMIzASLHp/ohVXr
 3nqSo77Neb6KiZLs/re5uK/mExocFExGFSW/3A4tzZIOBHq5MpMNvYURo44Cgt+zjsSZ
 lhTUit1P+s7aehQy+IIWjg2qiTg9+9KqKng5Ch/cYxZbQ139rpR8Y/pISptQNEYIDCCa
 mBK0UirjjbQNf53ZM8Jx+Wqedo3LGRfXeA2u/MSzrJ1K1teQmZVq6tBrQzuxsVRCetuP
 Jmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VKhNo07AIpkWTNuysrty7FMgZRNyaIpXlGW/Jh9dVoY=;
 b=gNlpXRcMXcn3T4GimvDI9rwWvYx1DwLRHi6awcBVUh1fw0HotlX9gcXwbL3aOYUo1V
 3RYEThEOIZcQjfQpqYkkCNLCc4seSpM8jQ6LeKCwGTkYhNzD5LpnTF5lrJvpCJE429i2
 emde3vbZSoN1aFcaBBxJGoXitxBXwgqEKLLKgo8x010+Zl6fOzhkmH2yrHGhC8b9fNBt
 L3tFdStUOBbHJTV3AuJeIzPXAOeAsZA41olS02zynfT9KPIauZmEkyw8JcltAPMQ+oz8
 OZ/IHO5KSwjsiwURMh1l3zU5s+3leRZCnnPxi4wfHuuhwS5dXRZcSjoRw9JGhSlHOqHW
 ne0w==
X-Gm-Message-State: AOAM533jikZiZX9Zfi9tt8Y1kpE75+BkjTZOZWSeLvG5fh5m2cnUlJG6
 it1qWufD2dH6C5vQ8LB78RPwKZYtulghag==
X-Google-Smtp-Source: ABdhPJxttUByusihVceiZFOV9/kHhoMnm65RrlYsk9utSVjoeBQgo8m1rYIfQ5D7aMz67D7fyD6+VA==
X-Received: by 2002:a17:902:e904:b029:eb:73f6:ac99 with SMTP id
 k4-20020a170902e904b02900eb73f6ac99mr10460893pld.12.1618597870552; 
 Fri, 16 Apr 2021 11:31:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id p18sm3057307pju.3.2021.04.16.11.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 11:31:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/9] target/arm: Split out mte_probe_int
Date: Fri, 16 Apr 2021 11:30:59 -0700
Message-Id: <20210416183106.1516563-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416183106.1516563-1-richard.henderson@linaro.org>
References: <20210416183106.1516563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out a helper function from mte_checkN to perform
all of the checking and address manpulation.  So far,
just use this in mte_checkN itself.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 52 +++++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index c87717127c..c7138dfc16 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -753,33 +753,45 @@ static int checkN(uint8_t *mem, int odd, int cmp, int count)
     return n;
 }
 
-uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
-                    uint64_t ptr, uintptr_t ra)
+/**
+ * mte_probe_int() - helper for mte_probe and mte_check
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



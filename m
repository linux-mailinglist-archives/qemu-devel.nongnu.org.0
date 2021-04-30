Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A94036F88B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:36:34 +0200 (CEST)
Received: from localhost ([::1]:56782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQVd-0000eq-7S
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTt-0007Dj-JE
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:45 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTr-0001BR-IA
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:45 -0400
Received: by mail-wr1-x434.google.com with SMTP id l14so149049wrx.5
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7k0slS5Qm8ux3QGcdgPebP+Vvjs6axythBtwet2XXQQ=;
 b=PvmwHtjO28+FV+/4VTluLx6C0P+9BAC9oQkBH2cPCdZrVV6jhDq3s2pkV4tskjooLr
 g1b3yy8U4nrAC3zihxHSoLL+ZxlFHIYK6RulecywOJ2QyV2lwAtZEGAhRr96HSvVyA+F
 7/3A1NtYzsVNy03BJQycPzSzhXMb2tTqNQ8cHRdV1MESTyq5+TiD4poEGUFvMWNdiJue
 YcZntlvg0gKcKimZ22C88asr/tK/Isj34Dufbze2y04RNLvc/xaimTqzetrWny4WBnaA
 idwYgw9LPzKo/PBC5CYW90IgaQxEW0bVZYHfXsGTzQoJ8ihXuMqGUQY2o4diz8v2HkL1
 p1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7k0slS5Qm8ux3QGcdgPebP+Vvjs6axythBtwet2XXQQ=;
 b=PBNW4dlheD+Mra0pfv5gMq17jUeeh0csNXa2lUe0+neffSLIRoBLM2ELKpgZ7y0JAn
 4rhTyyTdpDyDUIMCkY51VbkPU7kiOxnhJt31pON6D7Bqc9erS2rQCfNOuBEt+QO13FM5
 QWX/f5islYuo6ydU1tlbZZ+NPp/vKvL2f3vOXDUfAWa+Ag6wBgCLi6Y2pK01E8zRmIp5
 wPYNOtQJ7YbVg8UJVkacKtpj2On/ISPRkzfxgb9dn/vg1LvSDetYc7fM3tqnCrGdf4vW
 JB4YNLeDXsfst+n455FzTeEj7+P6CcJsfU09DfBsjXuI7HvSYNmPb3hv5yBWeRPSGmjL
 2nLw==
X-Gm-Message-State: AOAM533kgQLrElhCChmsiMDLiw6E9w2qyYTqSgM22wFjKcWkwK6Rz0lv
 xXbo5iKPyKBeqrPksjAP6q6+2I5GQT0l98e6
X-Google-Smtp-Source: ABdhPJyEHZlC8VICNtEw/PYehgVs0CsHQGBxSTKgcy88Wtxbnqdo7h7yHEAD8sh7Pbp90t+Mb0mj9A==
X-Received: by 2002:a5d:4386:: with SMTP id i6mr307500wrq.207.1619778882277;
 Fri, 30 Apr 2021 03:34:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/43] target/arm: Split out mte_probe_int
Date: Fri, 30 Apr 2021 11:33:58 +0100
Message-Id: <20210430103437.4140-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Split out a helper function from mte_checkN to perform
all of the checking and address manpulation.  So far,
just use this in mte_checkN itself.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210416183106.1516563-3-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mte_helper.c | 52 +++++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 010d1c2e993..2b5331f8dbc 100644
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
 
     /* Find the addr of the end of the access */
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
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ADB1EC6A4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 03:23:11 +0200 (CEST)
Received: from localhost ([::1]:33264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgI7a-0004tz-EN
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 21:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyf-0004Tq-CO
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 21:13:57 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:39332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyc-0003dG-OR
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 21:13:57 -0400
Received: by mail-pf1-x442.google.com with SMTP id d66so417483pfd.6
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 18:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+uzIV7dO8JDXOF8PjdnP8vAM1Vj2wACSpWbkwbf2z7U=;
 b=sSjsr+lTcFtP2ELmksFBwo00Fxek3vqLxh1hRKW31fRIIBna1iLOjNn9CWnIRBVu25
 c7LtCRvwypAzYdkL+bzzd/3znmTgxy9Jbiv3r6V0IJ7P71pEKWGWHKAy0L4ax1xY40YX
 Y7OjTX/qJnBAMcUx6U6v3pcGNkdqcUSn/kXnH+RfMgfqKIjcf54pe9EiR9dV/DDaaDfW
 F5O/JTWEGYMbqpGzBuhH/Fv+fQ9dtG6JRB3P67p1/TEGqQ2YTRN1qw6bIDCriP6kICY7
 nhp4Ldq4qEFhShN6fi3ziY9mshdehsodsgPUGQ939x0+xrRvqHdMQX7VzfVSk5aZBVS5
 k0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+uzIV7dO8JDXOF8PjdnP8vAM1Vj2wACSpWbkwbf2z7U=;
 b=uIRFeXYFGsvBO1DC5iANcVflbQ7rMOLF6Z+OE6VOHzkL6pJ2lyvTVEViYW9o3w+itT
 5vJ+IWu9VFQEAHGFvfWEpRasUN/Eij4l/JZ3ydJFkobI9P4zjlYzS2Nq/PLzsfEGF1xN
 KYdIechOE2qsu4nW0FwajUwWL9PQeAAokhTrIcB5CPnys0eSKl5WUnHf1P4DojPvqUB8
 eauDdTdY6FlDYir7XMJmzwm5sp6czuCYp2MxQmhSuTHiXB+W3EzgOaDES41wrGzuy6gq
 +DXoqAIB07gAIeJYFeexv3DhDVEFNtZ7Uvg+EOnKiq4vIZ0vSEspTOVMmJsYP0dyl7LR
 7hnw==
X-Gm-Message-State: AOAM530SXatL49kvSrvU89Z4OzS6dC4+T8Sa85MvXOhVtA8rtYk0sCA+
 61dgmmDm8+pi9L6v9jL+ZeuTeYwaFMc=
X-Google-Smtp-Source: ABdhPJw7EuoPDnTMAlcxmOKy/BsjdsoZScM0PQCRs4+ybUSxmvYMyL2MIQ5VyQufH22UWsq3RRVSRQ==
X-Received: by 2002:a65:5206:: with SMTP id o6mr25443433pgp.16.1591146832722; 
 Tue, 02 Jun 2020 18:13:52 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:13:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 26/42] target/arm: Implement helper_mte_checkN
Date: Tue,  2 Jun 2020 18:13:01 -0700
Message-Id: <20200603011317.473934-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fill out the stub that was added earlier.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v7: Fix page crossing test (szabolcs nagy).
---
 target/arm/internals.h  |   1 +
 target/arm/mte_helper.c | 165 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 165 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 8ae80f3945..cc485603a8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1320,6 +1320,7 @@ FIELD(MTEDESC, TSIZE, 14, 10)  /* mte_checkN only */
 
 bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
 uint64_t mte_check1(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
+uint64_t mte_checkN(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
 
 static inline int allocation_tag_from_addr(uint64_t ptr)
 {
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 72ff5543cf..c8a523ed4e 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -494,7 +494,170 @@ uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t ptr)
 /*
  * Perform an MTE checked access for multiple logical accesses.
  */
+
+/**
+ * checkN:
+ * @tag: tag memory to test
+ * @odd: true to begin testing at tags at odd nibble
+ * @cmp: the tag to compare against
+ * @count: number of tags to test
+ *
+ * Return the number of successful tests.
+ * Thus a return value < @count indicates a failure.
+ *
+ * A note about sizes: count is expected to be small.
+ *
+ * The most common use will be LDP/STP of two integer registers,
+ * which means 16 bytes of memory touching at most 2 tags, but
+ * often the access is aligned and thus just 1 tag.
+ *
+ * Using AdvSIMD LD/ST (multiple), one can access 64 bytes of memory,
+ * touching at most 5 tags.  SVE LDR/STR (vector) with the default
+ * vector length is also 64 bytes; the maximum architectural length
+ * is 256 bytes touching at most 9 tags.
+ *
+ * The loop below uses 7 logical operations and 1 memory operation
+ * per tag pair.  An implementation that loads an aligned word and
+ * uses masking to ignore adjacent tags requires 18 logical operations
+ * and thus does not begin to pay off until 6 tags.
+ * Which, according to the survey above, is unlikely to be common.
+ */
+
+static int checkN(uint8_t *mem, int odd, int cmp, int count)
+{
+    int n = 0, diff;
+
+    /* Replicate the test tag and compare.  */
+    cmp *= 0x11;
+    diff = *mem++ ^ cmp;
+
+    if (odd) {
+        goto start_odd;
+    }
+
+    while (1) {
+        /* Test even tag. */
+        if (unlikely((diff) & 0x0f)) {
+            break;
+        }
+        if (++n == count) {
+            break;
+        }
+
+    start_odd:
+        /* Test odd tag. */
+        if (unlikely((diff) & 0xf0)) {
+            break;
+        }
+        if (++n == count) {
+            break;
+        }
+
+        diff = *mem++ ^ cmp;
+    }
+    return n;
+}
+
+uint64_t mte_checkN(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra)
+{
+    int mmu_idx, ptr_tag, bit55;
+    uint64_t ptr_last, ptr_end, prev_page, next_page;
+    uint64_t tag_first, tag_end;
+    uint64_t tag_byte_first, tag_byte_end;
+    uint32_t esize, total, tag_count, tag_size, n, c;
+    uint8_t *mem1, *mem2;
+    MMUAccessType type;
+
+    bit55 = extract64(ptr, 55, 1);
+
+    /* If TBI is disabled, the access is unchecked, and ptr is not dirty. */
+    if (unlikely(!tbi_check(desc, bit55))) {
+        return ptr;
+    }
+
+    ptr_tag = allocation_tag_from_addr(ptr);
+
+    if (tcma_check(desc, bit55, ptr_tag)) {
+        goto done;
+    }
+
+    mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
+    type = FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DATA_LOAD;
+    esize = FIELD_EX32(desc, MTEDESC, ESIZE);
+    total = FIELD_EX32(desc, MTEDESC, TSIZE);
+
+    /* Find the addr of the end of the access, and of the last element. */
+    ptr_end = ptr + total;
+    ptr_last = ptr_end - esize;
+
+    /* Round the bounds to the tag granule, and compute the number of tags. */
+    tag_first = QEMU_ALIGN_DOWN(ptr, TAG_GRANULE);
+    tag_end = QEMU_ALIGN_UP(ptr_last, TAG_GRANULE);
+    tag_count = (tag_end - tag_first) / TAG_GRANULE;
+
+    /* Round the bounds to twice the tag granule, and compute the bytes. */
+    tag_byte_first = QEMU_ALIGN_DOWN(ptr, 2 * TAG_GRANULE);
+    tag_byte_end = QEMU_ALIGN_UP(ptr_last, 2 * TAG_GRANULE);
+
+    /* Locate the page boundaries. */
+    prev_page = ptr & TARGET_PAGE_MASK;
+    next_page = prev_page + TARGET_PAGE_SIZE;
+
+    if (likely(tag_end - prev_page <= TARGET_PAGE_SIZE)) {
+        /* Memory access stays on one page. */
+        tag_size = (tag_byte_end - tag_byte_first) / (2 * TAG_GRANULE);
+        mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, total,
+                                  MMU_DATA_LOAD, tag_size, ra);
+        if (!mem1) {
+            goto done;
+        }
+        /* Perform all of the comparisons. */
+        n = checkN(mem1, ptr & TAG_GRANULE, ptr_tag, tag_count);
+    } else {
+        /* Memory access crosses to next page. */
+        tag_size = (next_page - tag_byte_first) / (2 * TAG_GRANULE);
+        mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, next_page - ptr,
+                                  MMU_DATA_LOAD, tag_size, ra);
+
+        tag_size = (tag_byte_end - next_page) / (2 * TAG_GRANULE);
+        mem2 = allocation_tag_mem(env, mmu_idx, next_page, type,
+                                  ptr_end - next_page,
+                                  MMU_DATA_LOAD, tag_size, ra);
+
+        /*
+         * Perform all of the comparisons.
+         * Note the possible but unlikely case of the operation spanning
+         * two pages that do not both have tagging enabled.
+         */
+        n = c = (next_page - tag_first) / TAG_GRANULE;
+        if (mem1) {
+            n = checkN(mem1, ptr & TAG_GRANULE, ptr_tag, c);
+        }
+        if (n == c) {
+            if (!mem2) {
+                goto done;
+            }
+            n += checkN(mem2, 0, ptr_tag, tag_count - c);
+        }
+    }
+
+    /*
+     * If we failed, we know which granule.  Compute the element that
+     * is first in that granule, and signal failure on that element.
+     */
+    if (unlikely(n < tag_count)) {
+        uint64_t fail_ofs;
+
+        fail_ofs = tag_first + n * TAG_GRANULE - ptr;
+        fail_ofs = ROUND_UP(fail_ofs, esize);
+        mte_check_fail(env, mmu_idx, ptr + fail_ofs, ra);
+    }
+
+ done:
+    return useronly_clean_ptr(ptr);
+}
+
 uint64_t HELPER(mte_checkN)(CPUARMState *env, uint32_t desc, uint64_t ptr)
 {
-    return ptr;
+    return mte_checkN(env, desc, ptr, GETPC());
 }
-- 
2.25.1



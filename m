Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573AD3A506F
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 21:58:00 +0200 (CEST)
Received: from localhost ([::1]:35962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ls9lW-0003Kj-Sf
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 15:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ls9km-0002Z0-NZ
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 15:57:12 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:33444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ls9kk-0004eZ-Ll
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 15:57:12 -0400
Received: by mail-pg1-x52a.google.com with SMTP id e20so5367681pgg.0
 for <qemu-devel@nongnu.org>; Sat, 12 Jun 2021 12:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eFlUiR4nach9SSZ63PkafL5yiyJCD/wPgvyR6lVrcuY=;
 b=c8vJGyGZYCnn2ptTEoTABWwt6f+SXqSy/gUPj2wmuzoLjm1RCNOVi/pec8pQ6DCCl0
 7D1NJPtQQ9ZiY4//JRZqN8FPFNR4yXt26VZSts5WOXNsIPZlz/so5PDmjF1CHuW4l/s9
 hjUTOVasbPG6Z+G8UizSe1wzjET5GudTlgy6nGdNrGu5LqojqBvyTu5GASxtdtu5iTMJ
 RKTr4TbEp0nT9B3ChWSXSfk6MKu8faXcfaCQ3gAZrMF13vpwfXfb+Zsum3C4Ib7V2ltN
 Pw8+ULnuzaVnkIUxqX+vL8M4q9Eszy32iKJJjGIpav5Gj6GI5Mgo3ZwZXJt6I7tiDqko
 zSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eFlUiR4nach9SSZ63PkafL5yiyJCD/wPgvyR6lVrcuY=;
 b=XO4R8yCwAPf9j1ADz6KqcZxGy5aGX/MT0bGbCeXGllq/kw4/1w5H3igNV7UYy/5z3D
 WkE6vgElebxBwqgsqpPxFiV6eaCqdrGrxe0kvnfgErK4q5w029cOTlEhal8jrQPtptXG
 e18TS8y7ZP5++jEm0pUgg+9ZRJTHrwWfbMpiyv4OB5c8vLVU836gsyAD03saq77lQhvP
 sItj3tlISxwvWLQi/mlocaBB8c++Yd7pEk63fZSRwF5m8y8Eum2EiagmcuIqxNIMZhRF
 MTpJLRCW2Hax1OwJ3zbvV/1Ljo7ln5hqcX9uSYsLqIQh7uWCFgnrFt2ne7+eDL90ods/
 ErhA==
X-Gm-Message-State: AOAM533kDt9D6xNVUpgo3L97KfvfH0qLttZEGO5xexCEj0zA6UlNaYbS
 UoJsEH17+fFC4hT9aoyXPOHsCx79ctJktA==
X-Google-Smtp-Source: ABdhPJyyKtVmno6S9167SgIbSqNFtoUZp/65OcbW6zOa6A+ZANY6jXlsledJmvoddKqubj8j2GQlLg==
X-Received: by 2002:a05:6a00:24d0:b029:2ed:c309:8b0f with SMTP id
 d16-20020a056a0024d0b02902edc3098b0fmr14670051pfv.41.1623527828828; 
 Sat, 12 Jun 2021 12:57:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id s29sm9418092pgm.82.2021.06.12.12.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jun 2021 12:57:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Fix mte page crossing test
Date: Sat, 12 Jun 2021 12:57:07 -0700
Message-Id: <20210612195707.840217-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: peter.maydell@linaro.org, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test was off-by-one, because tag_last points to the
last byte of the tag to check, thus tag_last - prev_page
will equal TARGET_PAGE_SIZE when we use the first byte
of the next page.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/403
Reported-by: Peter Collingbourne <pcc@google.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c           |  2 +-
 tests/tcg/aarch64/mte-7.c         | 31 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  2 +-
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/aarch64/mte-7.c

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 166b9d260f..9e615cc513 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -730,7 +730,7 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
     prev_page = ptr & TARGET_PAGE_MASK;
     next_page = prev_page + TARGET_PAGE_SIZE;
 
-    if (likely(tag_last - prev_page <= TARGET_PAGE_SIZE)) {
+    if (likely(tag_last - prev_page < TARGET_PAGE_SIZE)) {
         /* Memory access stays on one page. */
         tag_size = ((tag_byte_last - tag_byte_first) / (2 * TAG_GRANULE)) + 1;
         mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, sizem1 + 1,
diff --git a/tests/tcg/aarch64/mte-7.c b/tests/tcg/aarch64/mte-7.c
new file mode 100644
index 0000000000..a981de62d4
--- /dev/null
+++ b/tests/tcg/aarch64/mte-7.c
@@ -0,0 +1,31 @@
+/*
+ * Memory tagging, unaligned access crossing pages.
+ * https://gitlab.com/qemu-project/qemu/-/issues/403
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "mte.h"
+
+int main(int ac, char **av)
+{
+    void *p;
+
+    enable_mte(PR_MTE_TCF_SYNC);
+    p = alloc_mte_mem(2 * 0x1000);
+
+    /* Tag the pointer. */
+    p = (void *)((unsigned long)p | (1ul << 56));
+
+    /* Store tag in sequential granules. */
+    asm("stg %0, [%0]" : : "r"(p + 0x0ff0));
+    asm("stg %0, [%0]" : : "r"(p + 0x1000));
+
+    /*
+     * Perform an unaligned store with tag 1 crossing the pages.
+     * Failure dies with SIGSEGV.
+     */
+    asm("str %0, [%0]" : : "r"(p + 0x0ffc));
+    return 0;
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 928357b10a..2c05c90d17 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -37,7 +37,7 @@ AARCH64_TESTS += bti-2
 
 # MTE Tests
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_MTE),)
-AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6
+AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6 mte-7
 mte-%: CFLAGS += -march=armv8.5-a+memtag
 endif
 
-- 
2.25.1



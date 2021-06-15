Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC673A8575
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:54:02 +0200 (CEST)
Received: from localhost ([::1]:35008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBO5-00041N-84
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBF9-00066v-G7
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:47 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEh-0000yP-Vs
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:47 -0400
Received: by mail-wr1-x436.google.com with SMTP id v9so2581637wrx.6
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=j0k9xnVMNuLNWBt5G9Ow8Dce+nq2YR61kkHpX3kHo9I=;
 b=vaiow/XCcqTTv4j3798VFKKrpiQb2ABddryKZ+FBEksSgBu/uL4y2awaCzaNqMWx5s
 WR3ez0D22npV6LfHEohA2BxU1j4BqFqjguFW36HLQ3jKWtbB6WJupCLhaqj9IcUgGvJ5
 YAQOdPICdwqdAgdzYshCkiHiUjRPW2TyHAyoqRGHHxmzORCk5L3vymJFwe8lu5Y1peSs
 NkHo5BKMB0oi0qlYQcI+k40w+G6SDzXVLx7ZuYi8bLe0peOWu4p751RNHKrAIubBGHNV
 0pu2Wi/cjC1eLdh8OFcXv+5KN0QOCsU+Unrpk0Pm0wo54WSWKSaLyJxxaZDcfR7ltvFY
 aiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j0k9xnVMNuLNWBt5G9Ow8Dce+nq2YR61kkHpX3kHo9I=;
 b=RfCKLRr9RK4ebawcwhjPc5xwot4lN3QIpzO4NOTBBcNJrJBtS1cHTSHMP876FdTCVz
 iEG5e2Unk6FSMcUxVuRjdk+OD6xm06Ck8N8r145fQiIbXnrkYxQeZQMddJ4vf3oIye+E
 zdY++SwyC9go74yinZKOLxureS3+lSf1TdKoVF140RyDfe7ADuui2JmDHG7FZDUY5uXe
 Vq9UQuK/OFEPgkw3YKFFfq6AYTfxfIa6RjkHlP51sJJxMgJJf9qAEiDpicrtMiPs63Hb
 JDSTB0c+2vohNVg+yOjkmxT4xdDYw1LW6SfV3xebap6mxuLWtRbAvDdmI9za7GE2Fbgz
 0fdA==
X-Gm-Message-State: AOAM533N1IMDiWbLs2X+DE75FtRkVh1uflUq3z1PGDb8vH+lUh7xP+7y
 zfLg6wg1NjcQ93oFJg4ZVbRtxkdkgAeh8Q==
X-Google-Smtp-Source: ABdhPJzgyAlNqF+Ow3LNK1HKgcnDzAn5a/5ACSGYlhN5Ixl7RYEVmyYNiNsTSWAOicBekNnooSerVg==
X-Received: by 2002:a5d:4401:: with SMTP id z1mr26399333wrq.149.1623771856693; 
 Tue, 15 Jun 2021 08:44:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/28] target/arm: Fix mte page crossing test
Date: Tue, 15 Jun 2021 16:43:49 +0100
Message-Id: <20210615154405.21399-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

The test was off-by-one, because tag_last points to the
last byte of the tag to check, thus tag_last - prev_page
will equal TARGET_PAGE_SIZE when we use the first byte
of the next page.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/403
Reported-by: Peter Collingbourne <pcc@google.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210612195707.840217-1-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mte_helper.c           |  2 +-
 tests/tcg/aarch64/mte-7.c         | 31 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  2 +-
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/aarch64/mte-7.c

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 166b9d260f8..9e615cc513c 100644
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
index 00000000000..a981de62d4a
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
index 928357b10a9..2c05c90d170 100644
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
2.20.1



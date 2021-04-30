Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B63036F890
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:39:18 +0200 (CEST)
Received: from localhost ([::1]:36930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQYH-00049c-Hu
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTv-0007Ga-LX
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:48 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTt-0001CN-LQ
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:47 -0400
Received: by mail-wr1-x42d.google.com with SMTP id n2so16824566wrm.0
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=v6VR+9uD8w53hdaBHlYSsfUrEwCJ0liC3DgXabSgbPw=;
 b=ClkUQlMzaYVXTH4QNGOwe3OlzzvBSEApxAtxFBpNxRiQycmy/TQ71YomAkHxVPbAij
 1GGjTmkFx0VzQlrMOwQJEfcx2HnZRZe4GQlaiy42joYtZMViE0govoToLdSlFXFRbjY7
 XM/e/4PePjAT4I2EV31hN8J292kFooiAtVaR2rR4Vt7QYY+g9fPZQ4IGBiMZT6rUaRBm
 YDw8RZLZEOJVfvK/VtAKNQKyApiNGhOOizLU28rwcm40ZIxKm0ubcIenOedZ+UcDBVMA
 cwcWFIg6O4jcRFsTxpo955KBKBfUiNzNT7usuaezF4yayAom7fc7c77mn+sbIWDgkmsB
 Wznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v6VR+9uD8w53hdaBHlYSsfUrEwCJ0liC3DgXabSgbPw=;
 b=pJdXC3BcPy1k2BuY4Y0baJKJTmLUke5THIYFmCnTzIzN4isAZQPsqj4iWy6R1c7UYI
 oYaRLGaqZVd/xYl87tmK1MLpifgWZl+Ptzk4R1NXb1QFGT5JY6w3naWo9pJbIdzEhnzA
 Pgn0sw9q9Lt0OfYDIbmSP2MVs0aGTEHsHQX3pBa20JrTTOKGtCktunjseeN4SklC8Ajr
 9CKHKMDEjyIFzkWKiKP6byZafQLBdSrV0v8WknzSJnFNmxEryD4M+6kszQVZYnbK+Jye
 PkSzTQEDdgsynGQXh4FeNq3lAzWFnnXPGj/dHD3ar37s9j+GLP1E+qrthw3CaJWykq+5
 yaUw==
X-Gm-Message-State: AOAM533NtERRBcEcaGntZs+lQ+a5YF/fhS1Lq2R0G9yQonsgQStZWv8k
 rrAHcXNqSpmDEQR0i1BgiUBGVotIhg9ypNao
X-Google-Smtp-Source: ABdhPJyxg96ppkysMgVUqtdjrahrIfOdGfunKVk+kvse5rzzM+BD+ZZxfds7nFq+EPHGNWExmmCMQw==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr6008284wrs.144.1619778883859; 
 Fri, 30 Apr 2021 03:34:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/43] test/tcg/aarch64: Add mte-5
Date: Fri, 30 Apr 2021 11:34:00 +0100
Message-Id: <20210430103437.4140-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

Buglink: https://bugs.launchpad.net/bugs/1921948
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210416183106.1516563-5-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/tcg/aarch64/mte-5.c         | 44 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  2 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/aarch64/mte-5.c

diff --git a/tests/tcg/aarch64/mte-5.c b/tests/tcg/aarch64/mte-5.c
new file mode 100644
index 00000000000..6dbd6ab3ea7
--- /dev/null
+++ b/tests/tcg/aarch64/mte-5.c
@@ -0,0 +1,44 @@
+/*
+ * Memory tagging, faulting unaligned access.
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "mte.h"
+
+void pass(int sig, siginfo_t *info, void *uc)
+{
+    assert(info->si_code == SEGV_MTESERR);
+    exit(0);
+}
+
+int main(int ac, char **av)
+{
+    struct sigaction sa;
+    void *p0, *p1, *p2;
+    long excl = 1;
+
+    enable_mte(PR_MTE_TCF_SYNC);
+    p0 = alloc_mte_mem(sizeof(*p0));
+
+    /* Create two differently tagged pointers.  */
+    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(excl));
+    asm("gmi %0,%1,%0" : "+r"(excl) : "r" (p1));
+    assert(excl != 1);
+    asm("irg %0,%1,%2" : "=r"(p2) : "r"(p0), "r"(excl));
+    assert(p1 != p2);
+
+    memset(&sa, 0, sizeof(sa));
+    sa.sa_sigaction = pass;
+    sa.sa_flags = SA_SIGINFO;
+    sigaction(SIGSEGV, &sa, NULL);
+
+    /* Store store two different tags in sequential granules. */
+    asm("stg %0, [%0]" : : "r"(p1));
+    asm("stg %0, [%0]" : : "r"(p2 + 16));
+
+    /* Perform an unaligned load crossing the granules. */
+    asm volatile("ldr %0, [%1]" : "=r"(p0) : "r"(p1 + 12));
+    abort();
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 05b2622bfc9..928357b10a9 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -37,7 +37,7 @@ AARCH64_TESTS += bti-2
 
 # MTE Tests
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_MTE),)
-AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-6
+AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6
 mte-%: CFLAGS += -march=armv8.5-a+memtag
 endif
 
-- 
2.20.1



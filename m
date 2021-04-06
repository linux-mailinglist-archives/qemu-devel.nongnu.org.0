Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73FA355ABD
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 19:50:49 +0200 (CEST)
Received: from localhost ([::1]:42236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTpqj-00047p-0y
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 13:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgz-0001nz-Cv
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:45 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:35489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgu-0006Lz-R8
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:44 -0400
Received: by mail-pl1-x62a.google.com with SMTP id j7so3225789plx.2
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 10:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w7i6Gze7kec69WvQyswSUuzpscM5477tzDtA09nT/yo=;
 b=K1mDPPAfmucysrMDj0Px1VNFU9cwfF7MwVGzzKLNnJsoEht4/nwtW+Bkmyf2DbI5CG
 Nr7qfXJhkb4ObX2MrMntkrBUR/Tz5LDdFFBzZfnvduCCiZJMzs4ygglDiuGUzjesr3i6
 ZoBQi55gOnR2F/gwBxDy4JBn/Z3XXdk7TplFYpdsM1QaaNP7DbNdv7n4GvCfsACUhf8Y
 w+u4PnjqdCsL0FjsdACMuCwEJsz0RTteCXh/T4jELfZAJotA3vn2m4L68aVQZRBBU26B
 oH0jZ1/hE8zu8xmC+nGlm1V3kA0jbLE4m067IaoKrAx5YlLdtolc5vCYKlYBlyk9gEjx
 a2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w7i6Gze7kec69WvQyswSUuzpscM5477tzDtA09nT/yo=;
 b=bWnUO2m+w765qX5qYIFXSVsF7YUcAo4w2EivyrzNvfXu0Hlt3TnvT/hvAhRsNaheOU
 dyBnv2tf/LYX1SzAORyqTaVHbonu3jVlVjbx9oxlIX0Nao+ySI9PYSPBPVBwldoFnXcB
 w/LN0OEZ3GAODmNywj4aEs2ZJUVLdtRhO1KnMXwzFKKaTA5oGuiyCY9Zh86eloq5IO4S
 MZvqmasH3m158v+TM0hSoZzAl/cljBpUxTtvAoY/TbaKDSkHiPpsWLU9pEblv3OMyypP
 i1kVq64KPda+CxxPORZhDNYWbRKhpswzKzOiGVPppS1n42mgKU5n3gnsYuAVeHApAwLa
 4Naw==
X-Gm-Message-State: AOAM533tQLPemfTFWPWVL3obsJL8Wk8jgWw7IY99SY2QOJ0uQNTJeMgg
 g8g3bZG894NxmQp/rKc0AfbfirzSn93IzA==
X-Google-Smtp-Source: ABdhPJwl5Us6mrTsL8cBm1hLBh8seWBgkPmVKIZFJe0Kt3hcivlMIHzyn1IElcZN16gJy8XPUZfpJw==
X-Received: by 2002:a17:90a:c08a:: with SMTP id
 o10mr5342090pjs.67.1617730839266; 
 Tue, 06 Apr 2021 10:40:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h15sm19148056pfo.20.2021.04.06.10.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:40:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/12] test/tcg/aarch64: Add mte-5
Date: Tue,  6 Apr 2021 10:40:25 -0700
Message-Id: <20210406174031.64299-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406174031.64299-1-richard.henderson@linaro.org>
References: <20210406174031.64299-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Buglink: https://bugs.launchpad.net/bugs/1921948
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/mte-5.c         | 44 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  2 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/aarch64/mte-5.c

diff --git a/tests/tcg/aarch64/mte-5.c b/tests/tcg/aarch64/mte-5.c
new file mode 100644
index 0000000000..6dbd6ab3ea
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
index 05b2622bfc..928357b10a 100644
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
2.25.1



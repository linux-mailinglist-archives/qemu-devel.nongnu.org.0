Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D653627C8
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:34:36 +0200 (CEST)
Received: from localhost ([::1]:51292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTIZ-00031P-8V
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTFM-0000kN-CE
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:31:16 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:36666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTFJ-0003iv-RT
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:31:16 -0400
Received: by mail-pf1-x430.google.com with SMTP id c3so90743pfo.3
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 11:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ArcUUYgFNH5v/yku39T/BAW6N5EhX13DVLb3URS9HQI=;
 b=R24xOu9eEldG3P4DNtDmpW9KXSrjmN67QugiM8TuhsYHAulvw4vmIDxDhYSGgjdHcd
 1M6JAxyeISuXV1S37XmUHyp1VSFZgxELrP9kop9928f0j5SEbNi2eJCVTKx5aswUqgPT
 DiHB2j9lCJ9aVC/AnWDGFfi8xLC0+T6M0u9ew6nrFCqPONz/iLH0EzS0BtNtT46TMr6T
 +z2qlueaILhd99lzMnJ99ArSJ4EX5Hco/HX9+MFVHPERdRM3pbDonAw7FeCMgXzjfI6z
 BUGbvrkw2B9I/uOXenXxwA4DQbedkfIf1CfNuoFZCAKBMGUkFTPlwFWctdtimYDJMpaB
 LatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ArcUUYgFNH5v/yku39T/BAW6N5EhX13DVLb3URS9HQI=;
 b=PaWDwiB8HDScE86sruDRPAmuGHr7DMLQUc3JhxRreLDTxaerWTKVhI8kNVE570+vHq
 oN4emW67ReENKmD2RnTyxu8oKcM7wxly8WANBtOZR8bJTDib/onEKRXDCANW+HJPkQIW
 8zAuC9KdP6t7bXKc6VA74gjMaWLVb2Go4k7Vuyqh7+yNJbZ/pl983iuXlRAPInGW3KYI
 SSeukxrk7m9lsWEiZ9xRWBM668XFs0f6PCrMHfBOfpyimfUn9rtUYb0yu/8BwEDEZz90
 U0raplLj69+0QCq6z33H5KcWkZ26iPEJ2Wxt6Qjk0kUHNwB9Xe5XjvKnxVp3vQAgCvpx
 XyLg==
X-Gm-Message-State: AOAM531cyal9puxrcxEjcGId5GxclMIknBaNIHE25Why4/xCnHUL2ZjA
 poHkGRwQMBaW2E4IRR/vw4HaB2xcS7aluw==
X-Google-Smtp-Source: ABdhPJyUQfjCLel9d2unx9Cm5wdZAZZ0AON/JJ0tsNOEyWh4+dsGM5Zm7JHGAErnVsKPcwTcLoHI5Q==
X-Received: by 2002:a65:6907:: with SMTP id s7mr403990pgq.296.1618597872419;
 Fri, 16 Apr 2021 11:31:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id p18sm3057307pju.3.2021.04.16.11.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 11:31:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/9] test/tcg/aarch64: Add mte-5
Date: Fri, 16 Apr 2021 11:31:01 -0700
Message-Id: <20210416183106.1516563-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416183106.1516563-1-richard.henderson@linaro.org>
References: <20210416183106.1516563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Buglink: https://bugs.launchpad.net/bugs/1921948
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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



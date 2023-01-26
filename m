Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F4A67C3EF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:42:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu2j-0000Ii-8A; Wed, 25 Jan 2023 23:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2Y-0000Hi-JE
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:10 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2V-0004U8-FV
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:10 -0500
Received: by mail-pj1-x102e.google.com with SMTP id j5so518356pjn.5
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LHzGWvWFa4q7FhR/Zjnl6sZxcznG5V94Bca4nmBi0Ko=;
 b=rOVlxI8YqoKxFk72U9ZAs/52C4kwvRR+c4od1L3IHzN+ut5OXGPc5pKM9KaLHAlOdG
 v4hcGbtqFY4Z1gS5NyltnJHAuR4366QTNOMp5lQT6P+v+aow2Pa5Cz2mOyLtlGid7RLO
 eF9DhtbM/s9FGlYQM+sPiSCN7s2K10yqhLpOcb7sCw/+dMpGRg8mrO5mJmpb+y6EArLc
 zqzGh8D/H1m49ip46R1Tdo5R1XhlKaqWaONCjcn6U4xJNHpBb8mMxyItBLunZucmlt8P
 NihkrGLBDgFx/lL2azz3MLCTUwC9BrOMLaST7kfZ19uQkJlKj9/G/QOD7zoE/OChHpF6
 Lg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LHzGWvWFa4q7FhR/Zjnl6sZxcznG5V94Bca4nmBi0Ko=;
 b=pRs+wimGcy11pGBARquPUfNAVJ4gHpq/U0VkMKpy8bsrcUnjfcb13KYwZ37w21a7JJ
 +RQz+2vTIwr3A2Uz1CIOtEzmOY6y3MB7m5LV2+tZBVLb6pKcLT1//Qvf0qNca0Wiqopc
 6E3E7PNi0mhJIllHJhGqnTvWpRE0vnmaBnmyMb5qxURli9jvAIy1RBo1+MiBrRYO2fDp
 lQfPjuq40ntqKTxv1F+k6iH5iLgAuGcBXazCkfJcTBSy9vOj//k59A75ttv8tHHeA/I0
 i93XPgDpPxZX1dZ61QkqCjYyNCkSV0mhW3azc8+tmXLyTWBISTdl8SdaAPEKgQBPezfe
 MdUA==
X-Gm-Message-State: AO0yUKUAVYYZ+czoRTCladcQvy+H1yh5LDesdxIgBWA1l7TZBlGmUhW6
 ZlbnfxcGcqElfDtM8DMBK8CBy500nXYFb725HY8=
X-Google-Smtp-Source: AK7set/G8xvW2tUdOpeC6juLeK4Pk6AVi3Xx4DGw7W2SGHj9cn+RVsW+xJGF5L5pxnzEiTAxjRFL8g==
X-Received: by 2002:a17:90b:4c8e:b0:22c:1749:7ea5 with SMTP id
 my14-20020a17090b4c8e00b0022c17497ea5mr856234pjb.12.1674707941785; 
 Wed, 25 Jan 2023 20:39:01 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:39:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v5 22/36] tests/tcg/s390x: Add clst.c
Date: Wed, 25 Jan 2023 18:38:10 -1000
Message-Id: <20230126043824.54819-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a basic test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20221025213008.2209006-2-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/s390x/clst.c          | 82 +++++++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 tests/tcg/s390x/clst.c

diff --git a/tests/tcg/s390x/clst.c b/tests/tcg/s390x/clst.c
new file mode 100644
index 0000000000..ed2fe7326c
--- /dev/null
+++ b/tests/tcg/s390x/clst.c
@@ -0,0 +1,82 @@
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+
+static int clst(char sep, const char **s1, const char **s2)
+{
+    const char *r1 = *s1;
+    const char *r2 = *s2;
+    int cc;
+
+    do {
+        register int r0 asm("r0") = sep;
+
+        asm("clst %[r1],%[r2]\n"
+            "ipm %[cc]\n"
+            "srl %[cc],28"
+            : [r1] "+r" (r1), [r2] "+r" (r2), "+r" (r0), [cc] "=r" (cc)
+            :
+            : "cc");
+        *s1 = r1;
+        *s2 = r2;
+    } while (cc == 3);
+
+    return cc;
+}
+
+static const struct test {
+    const char *name;
+    char sep;
+    const char *s1;
+    const char *s2;
+    int exp_cc;
+    int exp_off;
+} tests[] = {
+    {
+        .name = "cc0",
+        .sep = 0,
+        .s1 = "aa",
+        .s2 = "aa",
+        .exp_cc = 0,
+        .exp_off = 0,
+    },
+    {
+        .name = "cc1",
+        .sep = 1,
+        .s1 = "a\x01",
+        .s2 = "aa\x01",
+        .exp_cc = 1,
+        .exp_off = 1,
+    },
+    {
+        .name = "cc2",
+        .sep = 2,
+        .s1 = "abc\x02",
+        .s2 = "abb\x02",
+        .exp_cc = 2,
+        .exp_off = 2,
+    },
+};
+
+int main(void)
+{
+    const struct test *t;
+    const char *s1, *s2;
+    size_t i;
+    int cc;
+
+    for (i = 0; i < sizeof(tests) / sizeof(tests[0]); i++) {
+        t = &tests[i];
+        s1 = t->s1;
+        s2 = t->s2;
+        cc = clst(t->sep, &s1, &s2);
+        if (cc != t->exp_cc ||
+                s1 != t->s1 + t->exp_off ||
+                s2 != t->s2 + t->exp_off) {
+            fprintf(stderr, "%s\n", t->name);
+            return EXIT_FAILURE;
+        }
+    }
+
+    return EXIT_SUCCESS;
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index ab7a3bcfb2..79250f31dd 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -25,6 +25,7 @@ TESTS+=signals-s390x
 TESTS+=branch-relative-long
 TESTS+=noexec
 TESTS+=div
+TESTS+=clst
 
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
-- 
2.34.1



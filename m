Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E253681D4F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:52:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc1m-00023K-V3; Mon, 30 Jan 2023 16:49:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1k-00022E-Qj
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:24 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1j-0005cH-9h
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:24 -0500
Received: by mail-pj1-x102e.google.com with SMTP id b10so12406652pjo.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lE4xtEA+pGCE8llxbq4kNT+2kFoTqQa5IGjt6U1bFuE=;
 b=a/mKnFWkFkrsMDSXNIUz1YXZmxG6PFzNAWl/Rh37uU7OD3ZrgaducTv2SSvr3uu3a8
 AA59FOktECBjvPn8RTETU2qgkXzo7LUWjVDcuaChmIHHi/LcN0a96Q9+38Hcqjpw/ZhH
 CTx3xhDpYtwpVscfV+OuwhYpFr6X8SlqbsF3gCrAH8BBrUZHj6lqgKBY0Jj5QWVxgfMj
 OU+XH5XPPWy0V4rEr2ABx1b0FZkkwN5AkZi4IqWIAqx1SQni6VfaKgmNt3F6baUyfmW8
 s0Q6ZKdna4BA0Xk/xJDYTyPFPJlhDjZEpFrdX9JOyAOAZaUd3/ldN9M+J1D/OTwFR1DV
 A9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lE4xtEA+pGCE8llxbq4kNT+2kFoTqQa5IGjt6U1bFuE=;
 b=hlKxc7vGD/nKRs5y1/AXf2es8hJ3aWRXmf68RS9Mcxaojj6SuHsxUNALDwoAnhVSN6
 pn3DiaPKq2xDmWlI6KryhIekre/ETg/6kDiZzGtCDPOTHBapcugD76hoXPtW4cPSVkOG
 HE6chJx1v20vPxufr5Hei25ErR+ZCZLWAkP9o12aWzXPpd4iqjzYQrk/naY/wXQ86ML6
 UxG/3rflLuDbMvmGSiinmruYJAMp8vIOb1z6Op9GE50HvPhgxFXkRLjLfaGR18OGC1Zj
 sX+BYpeZCne3T9ecJ9tjrDr/YQGXN/l6nT8hVdw4d9Gl97ia0mZm9dfPWLGExKPbwd6y
 yeqg==
X-Gm-Message-State: AO0yUKX94eBQEVLuB3oNSPbRpjeY1jNeznVKLGFcA2b99TZ7+fn80pTJ
 +5r3tkhqCniVeMnRpFiMjiwr9QMxio8eB+uv
X-Google-Smtp-Source: AK7set/8klT1lPW9ZPjK8HOCDXvNMpi8SSikJzhiejkCA9jIIG10t2kbGBw0v35191Skfwttxa+Jpw==
X-Received: by 2002:a17:90b:1d11:b0:22c:944b:3724 with SMTP id
 on17-20020a17090b1d1100b0022c944b3724mr6656943pjb.8.1675115362526; 
 Mon, 30 Jan 2023 13:49:22 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ad14400b00219220edf0dsm7451215pjw.48.2023.01.30.13.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:49:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v6 21/36] tests/tcg/s390x: Add div.c
Date: Mon, 30 Jan 2023 11:48:29 -1000
Message-Id: <20230130214844.1158612-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130214844.1158612-1-richard.henderson@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
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
Message-Id: <20221101111300.2539919-1-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/s390x/div.c           | 40 +++++++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 tests/tcg/s390x/div.c

diff --git a/tests/tcg/s390x/div.c b/tests/tcg/s390x/div.c
new file mode 100644
index 0000000000..5807295614
--- /dev/null
+++ b/tests/tcg/s390x/div.c
@@ -0,0 +1,40 @@
+#include <assert.h>
+#include <stdint.h>
+
+static void test_dr(void)
+{
+    register int32_t r0 asm("r0") = -1;
+    register int32_t r1 asm("r1") = -4241;
+    int32_t b = 101, q, r;
+
+    asm("dr %[r0],%[b]"
+        : [r0] "+r" (r0), [r1] "+r" (r1)
+        : [b] "r" (b)
+        : "cc");
+    q = r1;
+    r = r0;
+    assert(q == -41);
+    assert(r == -100);
+}
+
+static void test_dlr(void)
+{
+    register uint32_t r0 asm("r0") = 0;
+    register uint32_t r1 asm("r1") = 4243;
+    uint32_t b = 101, q, r;
+
+    asm("dlr %[r0],%[b]"
+        : [r0] "+r" (r0), [r1] "+r" (r1)
+        : [b] "r" (b)
+        : "cc");
+    q = r1;
+    r = r0;
+    assert(q == 42);
+    assert(r == 1);
+}
+
+int main(void)
+{
+    test_dr();
+    test_dlr();
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 07fcc6d0ce..ab7a3bcfb2 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -24,6 +24,7 @@ TESTS+=trap
 TESTS+=signals-s390x
 TESTS+=branch-relative-long
 TESTS+=noexec
+TESTS+=div
 
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
-- 
2.34.1



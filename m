Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B5067C3EB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:42:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu2p-0000OV-IS; Wed, 25 Jan 2023 23:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2Y-0000HM-DY
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:10 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2V-0004OJ-Fp
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:10 -0500
Received: by mail-pl1-x636.google.com with SMTP id a18so930571plm.2
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lE4xtEA+pGCE8llxbq4kNT+2kFoTqQa5IGjt6U1bFuE=;
 b=fsRAkMGQUW4N2QcnZSnYvzBT+7ZxQPSjiow+8PyLsf3RATiIIALz3vPrW5nkLperBz
 nb3+2HbOl0A+tGsgpJ/ZxSxPAune0SV7AKADZvcxIB79qdKDphVuBV1cXyFCCzq2DzTS
 P3oiNMomSBG/VkR0MDlG+/5sDMD5uGZYuv3aIeYtQPyttzw8veJtxiF1sajb4T8zhtI5
 LjXQbFWN59ZBMKFzbt4WYjv4u/Itr06e8V5pS/oMl8gttHupgkYlKKqrmC7UdPc/SUdO
 RlXezqto6EhqisCe6Go7Iu4LjdVY0mIEHh6VLbUvN+tiMFp1uz2RsaOzmyoW+bb4cbF3
 7nrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lE4xtEA+pGCE8llxbq4kNT+2kFoTqQa5IGjt6U1bFuE=;
 b=lAQ54efGtbaVoCHGOWSBaxgaHMS3eZIY/H8BMXyYOy0r7TLGh9cUS5X+9zq5b94KNw
 XFfqMn5vKoLdFV7kpmd8ibqWhP6bf9Po4zFBLtTesNq1SsuYSPOMQR4myt7YzIH5yF1i
 0mpMb8lIAMdxe6FWBgyZCzQIuRSXJaYydIoLSjRDOPtbwE49TrQdz1rGBQ43y8P7lZSM
 ZoaOCpmF/GgpnnKskXZJhDFbOqrdlrZ88k6A+G1AXrlXjHdgF59oYlEPsnvHyMrkloXh
 Ed2YTKewlh5TNJVZ1yx6PfAY4L4q6RmyEXFzI+gGPBOnVHbIpefnxL7dsLhg0nEvDaGt
 yt8g==
X-Gm-Message-State: AFqh2krGzW2JuSYJrlEse+uMGGfTEjyxejuTjBH21478gx5jQec1LXYf
 4s1n18vh+yxUMjqNVKr6jif2IidCDHk/nGUQaXo=
X-Google-Smtp-Source: AMrXdXtk+Es3anERhHoLIt/u9NuAh8vydInx4W5cd4LosJ5ra3IOrRLp4CMr0Zv+fry9uNyrbDvb9w==
X-Received: by 2002:a17:90b:1d0c:b0:22b:b46d:ebed with SMTP id
 on12-20020a17090b1d0c00b0022bb46debedmr22299279pjb.47.1674707940250; 
 Wed, 25 Jan 2023 20:39:00 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:38:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v5 21/36] tests/tcg/s390x: Add div.c
Date: Wed, 25 Jan 2023 18:38:09 -1000
Message-Id: <20230126043824.54819-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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



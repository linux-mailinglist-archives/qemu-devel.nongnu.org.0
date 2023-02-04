Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B4668AB51
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:37:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLUD-0005D3-Uv; Sat, 04 Feb 2023 11:33:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLUC-0005Cs-HX
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:56 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLUA-0002X0-UH
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:56 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 on9-20020a17090b1d0900b002300a96b358so7622430pjb.1
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eZTavF7es3O2ujG9mYHigJTrObpuqrsvusel8D8p0rM=;
 b=r3Td0hmalNK4UiMvKaWHjRYm9pv5EZsRMZ/gTWeX2ttFPylk1RofXrYjUUSkTs7+wP
 +vI/w9iqYUwRPspuaIC6dW0iiOlX2J1YsUjkDSvKPn+e3mLz3QRpAltAJiTlO3+5KcXT
 Tn6mFAxbxTRQsxbWzFIlO9J3/kYYDsw6uz7U5BGfnfzQeLJjqPRR42GgFUwgUWwE85TX
 k72PaRw+/8S/JJ7eJGRnZ2ix3E+1klUg61Itz6jM0zT/R6viFFLs28k69io+IcqW73Rj
 zpAQqRuTABBlnlEWIzNw5429CPHQqnZH/5YxL+qMkQlqMtP9R4XBywynk4fWV7J/rWiJ
 d52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eZTavF7es3O2ujG9mYHigJTrObpuqrsvusel8D8p0rM=;
 b=v1hOhUBa9cEHbZpwqlLVwNL/RbEyicaES+FJ43/s3b0MwTedcKbV8GosKD90Iu0r37
 bNbH+xX/3YDvlPokg4sazLLqg6hhIiXkng9vUpcuXAnqa9uBpO0hlfgF38R1x3raldz2
 34Y9x0yQk9WpCCAN6N5CtlajraFRJa7MLbMrmdNwCg3Egpv/O0StgNVJMUz6ZpKS/vC8
 bKxRAxtWqn+KF0h7LqGYbXaIkJYmGAT1HgERghY5AjieA/e9XFq8AY2iG5CVyhTq8ET5
 FcjQz0O9217KAD6kX9SnqFLXD1DUqTSPPBsmexu2deQYtjImCYDBZCbT78/2x9iLyR3H
 AG9Q==
X-Gm-Message-State: AO0yUKXl36ckHeMgeyOD3Xez3vjv+/0rhI3gLmFTSNldKCPzce7b6wM2
 /8KTshGEGLVQ8u/0Gx2SZR6EWozCXIdI/H+L
X-Google-Smtp-Source: AK7set+wjILRwjt2X/fguub1YL6UW7bAyMyeg/1vaM61qRKEoK5ufR62vNPip/yh3QyqteLOOpJyVQ==
X-Received: by 2002:a17:902:d093:b0:198:ee12:ce93 with SMTP id
 v19-20020a170902d09300b00198ee12ce93mr2585510plv.46.1675528434063; 
 Sat, 04 Feb 2023 08:33:54 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 26/40] tests/tcg/s390x: Add cdsg.c
Date: Sat,  4 Feb 2023 06:32:56 -1000
Message-Id: <20230204163310.815536-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
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

Add a simple test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20230201133257.3223115-1-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/s390x/cdsg.c          | 93 +++++++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |  4 ++
 2 files changed, 97 insertions(+)
 create mode 100644 tests/tcg/s390x/cdsg.c

diff --git a/tests/tcg/s390x/cdsg.c b/tests/tcg/s390x/cdsg.c
new file mode 100644
index 0000000000..800618ff4b
--- /dev/null
+++ b/tests/tcg/s390x/cdsg.c
@@ -0,0 +1,93 @@
+/*
+ * Test CDSG instruction.
+ *
+ * Increment the first half of aligned_quadword by 1, and the second half by 2
+ * from 2 threads. Verify that the result is consistent.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include <assert.h>
+#include <pthread.h>
+#include <stdbool.h>
+#include <stdlib.h>
+
+static volatile bool start;
+typedef unsigned long aligned_quadword[2] __attribute__((__aligned__(16)));
+static aligned_quadword val;
+static const int n_iterations = 1000000;
+
+static inline int cdsg(unsigned long *orig0, unsigned long *orig1,
+                       unsigned long new0, unsigned long new1,
+                       aligned_quadword *mem)
+{
+    register unsigned long r0 asm("r0");
+    register unsigned long r1 asm("r1");
+    register unsigned long r2 asm("r2");
+    register unsigned long r3 asm("r3");
+    int cc;
+
+    r0 = *orig0;
+    r1 = *orig1;
+    r2 = new0;
+    r3 = new1;
+    asm("cdsg %[r0],%[r2],%[db2]\n"
+        "ipm %[cc]"
+        : [r0] "+r" (r0)
+        , [r1] "+r" (r1)
+        , [db2] "+m" (*mem)
+        , [cc] "=r" (cc)
+        : [r2] "r" (r2)
+        , [r3] "r" (r3)
+        : "cc");
+    *orig0 = r0;
+    *orig1 = r1;
+
+    return (cc >> 28) & 3;
+}
+
+void *cdsg_loop(void *arg)
+{
+    unsigned long orig0, orig1, new0, new1;
+    int cc;
+    int i;
+
+    while (!start) {
+    }
+
+    orig0 = val[0];
+    orig1 = val[1];
+    for (i = 0; i < n_iterations;) {
+        new0 = orig0 + 1;
+        new1 = orig1 + 2;
+
+        cc = cdsg(&orig0, &orig1, new0, new1, &val);
+
+        if (cc == 0) {
+            orig0 = new0;
+            orig1 = new1;
+            i++;
+        } else {
+            assert(cc == 1);
+        }
+    }
+
+    return NULL;
+}
+
+int main(void)
+{
+    pthread_t thread;
+    int ret;
+
+    ret = pthread_create(&thread, NULL, cdsg_loop, NULL);
+    assert(ret == 0);
+    start = true;
+    cdsg_loop(NULL);
+    ret = pthread_join(thread, NULL);
+    assert(ret == 0);
+
+    assert(val[0] == n_iterations * 2);
+    assert(val[1] == n_iterations * 4);
+
+    return EXIT_SUCCESS;
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 1d454270c0..72ad309b27 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -27,6 +27,10 @@ TESTS+=noexec
 TESTS+=div
 TESTS+=clst
 TESTS+=long-double
+TESTS+=cdsg
+
+cdsg: CFLAGS+=-pthread
+cdsg: LDFLAGS+=-pthread
 
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9381410E87
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 04:51:26 +0200 (CEST)
Received: from localhost ([::1]:51898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS9Ov-0004gP-Rd
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 22:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Iy-0005EV-Ux
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 22:45:17 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:52827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Iu-0008G2-Lf
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 22:45:16 -0400
Received: by mail-pj1-x1032.google.com with SMTP id v19so10934687pjh.2
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 19:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j3xcIy2m2TMlH3aTyvVTXEM5j7IHz1QAadoWnnY7f2s=;
 b=gQfk2n/atPRc156DUuDKcUyIdvxHyV4Lq6eNG87+n0MqEBvl3ojxApYlOn1D2TaEcI
 3pe7tJXqsy1nt5PmvAbj14070jjnAfX30/KXYZepkdwsqNYqpskrspmec+2IanP6eSVb
 eW3oR2uIi1b0by06fhgmNYKVRXYLLzVvi2it1vVqrTqdMAQ1wYKYvk2Ijh052kMwnb4P
 704j/zAEiociZIywWLqzxWaXK8e1bC5GPSlcFLhehV/MXzjGovd2tfQFi4RBc98ETFtb
 +YaJQNvGbspvzvFiBkfzaELQ94u7zL3BRcoIG7luKIyAT+VkG1W9aMqHcVXYAFbGgXcb
 o2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j3xcIy2m2TMlH3aTyvVTXEM5j7IHz1QAadoWnnY7f2s=;
 b=H1OfJOeAkZ/ceIq8Wm7nDRr9kIjoOX4NGDaaIt5Fs65rXxly8Q4M6z5rt3A786Gzu5
 9BkD5aAEhfpo8y3CZ7ig0edrIwoWicHmrciW7fULrXgqXR2Ow8pKRbj3SsHGDY59VV1q
 MwVcxCCviNGweBQB52Y9h4KsETpbAh5pIJyB1VTqqXlEj3zgi0RY+WgGxynDVSQOtWOK
 LvBDlhIHnnZgscNkSMURLFpv1PecDTvcSTmEKELw9gpxswsFfUPnMEn1ZxzhcuMOQOtv
 eSS1fpV+dIy80ZbhPCC9shp9yUN7SyQlssBVEFdW5FDxzzeFKUd0HW3sbdUl5pR7y7YN
 3yzA==
X-Gm-Message-State: AOAM532g4gdSZTk1fwLw3ztdDzsw7df/0p1cvNNQgABcvo/X40JvIsBL
 d6jTVc3RpNVFoCqIqIKfj/c+9bn+D1luwA==
X-Google-Smtp-Source: ABdhPJwljhIamF8wrXHq6ug80dWQh4wDzQ/3GqYQtFELGDRm6OEFeMM4FrXXZkLcfmuqIV9h1w6uPQ==
X-Received: by 2002:a17:90a:eb02:: with SMTP id
 j2mr35772445pjz.174.1632105910917; 
 Sun, 19 Sep 2021 19:45:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id fh3sm16164767pjb.8.2021.09.19.19.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 19:45:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/6] tests/tcg: Add arm and aarch64 pc alignment tests
Date: Sun, 19 Sep 2021 19:45:04 -0700
Message-Id: <20210920024504.625965-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920024504.625965-1-richard.henderson@linaro.org>
References: <20210920024504.625965-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/pcalign-a64.c   | 37 +++++++++++++++++++++++++
 tests/tcg/arm/pcalign-a32.c       | 46 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  4 +--
 tests/tcg/arm/Makefile.target     |  4 +++
 4 files changed, 89 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/aarch64/pcalign-a64.c
 create mode 100644 tests/tcg/arm/pcalign-a32.c

diff --git a/tests/tcg/aarch64/pcalign-a64.c b/tests/tcg/aarch64/pcalign-a64.c
new file mode 100644
index 0000000000..6b9277f919
--- /dev/null
+++ b/tests/tcg/aarch64/pcalign-a64.c
@@ -0,0 +1,37 @@
+/* Test PC misalignment exception */
+
+#include <assert.h>
+#include <signal.h>
+#include <stdlib.h>
+#include <stdio.h>
+
+static void *expected;
+
+static void sigbus(int sig, siginfo_t *info, void *vuc)
+{
+    assert(info->si_code == BUS_ADRALN);
+    assert(info->si_addr == expected);
+    exit(EXIT_SUCCESS);
+}
+
+int main()
+{
+    void *tmp;
+
+    struct sigaction sa = {
+        .sa_sigaction = sigbus,
+        .sa_flags = SA_SIGINFO
+    };
+
+    if (sigaction(SIGBUS, &sa, NULL) < 0) {
+        perror("sigaction");
+        return EXIT_FAILURE;
+    }
+
+    asm volatile("adr %0, 1f + 1\n\t"
+                 "str %0, %1\n\t"
+                 "br  %0\n"
+                 "1:"
+                 : "=&r"(tmp), "=m"(expected));
+    abort();
+}
diff --git a/tests/tcg/arm/pcalign-a32.c b/tests/tcg/arm/pcalign-a32.c
new file mode 100644
index 0000000000..3c9c8cc97b
--- /dev/null
+++ b/tests/tcg/arm/pcalign-a32.c
@@ -0,0 +1,46 @@
+/* Test PC misalignment exception */
+
+#ifdef __thumb__
+#error "This test must be compiled for ARM"
+#endif
+
+#include <assert.h>
+#include <signal.h>
+#include <stdlib.h>
+#include <stdio.h>
+
+static void *expected;
+
+static void sigbus(int sig, siginfo_t *info, void *vuc)
+{
+    assert(info->si_code == BUS_ADRALN);
+    assert(info->si_addr == expected);
+    exit(EXIT_SUCCESS);
+}
+
+int main()
+{
+    void *tmp;
+
+    struct sigaction sa = {
+        .sa_sigaction = sigbus,
+        .sa_flags = SA_SIGINFO
+    };
+
+    if (sigaction(SIGBUS, &sa, NULL) < 0) {
+        perror("sigaction");
+        return EXIT_FAILURE;
+    }
+
+    asm volatile("adr %0, 1f + 2\n\t"
+                 "str %0, %1\n\t"
+                 "bx  %0\n"
+                 "1:"
+                 : "=&r"(tmp), "=m"(expected));
+
+    /*
+     * From v8, it is CONSTRAINED UNPREDICTABLE whether BXWritePC aligns
+     * the address or not.  If so, we can legitimately fall through.
+     */
+    return EXIT_SUCCESS;
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 2c05c90d17..1d967901bd 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -8,8 +8,8 @@ VPATH 		+= $(ARM_SRC)
 AARCH64_SRC=$(SRC_PATH)/tests/tcg/aarch64
 VPATH 		+= $(AARCH64_SRC)
 
-# Float-convert Tests
-AARCH64_TESTS=fcvt
+# Base architecture tests
+AARCH64_TESTS=fcvt pcalign-a64
 
 fcvt: LDFLAGS+=-lm
 
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 5ab59ed6ce..f509d823d4 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -29,6 +29,10 @@ run-fcvt: fcvt
 	$(call run-test,fcvt,$(QEMU) $<,"$< on $(TARGET_NAME)")
 	$(call diff-out,fcvt,$(ARM_SRC)/fcvt.ref)
 
+# PC alignment test
+ARM_TESTS += pcalign-a32
+pcalign-a32: CFLAGS+=-marm
+
 ifeq ($(CONFIG_ARM_COMPATIBLE_SEMIHOSTING),y)
 
 # Semihosting smoke test for linux-user
-- 
2.25.1



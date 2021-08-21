Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECC63F3C66
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 22:10:42 +0200 (CEST)
Received: from localhost ([::1]:38826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHXKD-0002qY-BF
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 16:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHXA3-0002KQ-9b
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 16:00:11 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:38473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHX9y-0004Xc-Gw
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 16:00:11 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 om1-20020a17090b3a8100b0017941c44ce4so16044294pjb.3
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 13:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y0WTE2RfE+PmoTGLshyvWonUTc3RdZZ7/tjZ5VZamls=;
 b=PWp2PQBwm6yih3kMRLxKtVC1jHnJcj/Q6UwlxcnDY8oLtHHtLzU+x1Op1YlQ17AkD8
 MYZI43enOXjq4wZdXsj7kpRxQfaIw6a+nxLkww9ygejATzo35r+BZGvPM5lHJ61m8E48
 vW6CRID2uU0RGW2XwlYtWPbxOrdpSyPxBYejPrfvuxRw55xSe0xqI6CayZ1br138wvD9
 RhGknyWHDqWqdR1QshncqgLsoRZZSQdHmveSU+vga4z3CgNt43K4l+N//SYB6AZYBB4L
 NrkuuO4syr+0q9K9Lcqr6YMXA4oZoUoc6QoqikLQ5Dxqu2+erx+x6WqAn5jHcJE99fq2
 Fd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y0WTE2RfE+PmoTGLshyvWonUTc3RdZZ7/tjZ5VZamls=;
 b=h+ciIDRBLsyeUKdG7JQ+/5sZLOiIXOw/p0VlxP1PVoIKBSqe6rjgSBVijqG27n6dTm
 +YaPbRZpHgDlSiT5FzP22q3UG6Eafn05z7WwdmzHpr0clYO+avwDcHIKeVlx5bg2iInT
 GSHGLHqBhKxeEl2bYmsLubC3jGxjTj47HQlDM5dglfkGpi/NT02/sFSuMtWjmIkoBpM7
 Ol9US/i7qBdyaF3z3NCUGhbeoWhPIvD9SAZ7r8K6b58sIjVakzylDg9U2uRflaOMxX81
 G4owFDryyORaJolcBwHp8S3X7Pr56TmcXd2oTN+xVZf08HLsY+Unrqf+vWddSrw3O/ZR
 y6wQ==
X-Gm-Message-State: AOAM531yNFE9UY4uPH+Or5+VpPX11Z8T4oLzaJYe8ayGLDB5K/EWSlZR
 bRwcnwQfqLVpLT0hlUzCuAwzidnzmwEXFw==
X-Google-Smtp-Source: ABdhPJxoxcgYMokej79ryLvfPAoGkSvcZ1GnRJxdDmC2T8wK51f4+EL4mzUPCDJjbxiloS8b//K/ug==
X-Received: by 2002:a17:902:6949:b029:12c:591a:2ed7 with SMTP id
 k9-20020a1709026949b029012c591a2ed7mr21968741plt.14.1629576005146; 
 Sat, 21 Aug 2021 13:00:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h13sm12562257pgh.93.2021.08.21.13.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 13:00:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] tests/tcg: Add arm and aarch64 pc alignment tests
Date: Sat, 21 Aug 2021 12:59:58 -0700
Message-Id: <20210821195958.41312-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210821195958.41312-1-richard.henderson@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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



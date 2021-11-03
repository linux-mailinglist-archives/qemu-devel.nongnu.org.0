Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 187E7443C1B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 05:08:59 +0100 (CET)
Received: from localhost ([::1]:49620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi7a6-0005M3-6K
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 00:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VN-0005G3-SF
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:04:06 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:42689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VL-0000wN-EZ
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:04:05 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id b17so1481790qvl.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 21:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j3xcIy2m2TMlH3aTyvVTXEM5j7IHz1QAadoWnnY7f2s=;
 b=JeL6e5zCxxONpWPtKVZ/l5YNS4AcWs48xxKKlqdHbKIiM8xq9QwFcRpEsUrTauMkJ+
 4CevVkNSr+T/uEroVwfeBjY1tipbjzVhrGEPDvl8xUaiwgaPNhS5i90vngod+RCSt48K
 x1y3OMzu0uCeOmq9G1RJBJLE0O6w+96W9cT3kf6u0Uk3q+Iae0pByexyjJbnHH+J8YNg
 Pn4qGdu1WLa9yIBfhOwjAM3V5FJq4lPVLv90HrsfZuucfiuI1P3rtFGRnCK1qm4Dyrkz
 b0ly/4u17rC3kfU+FX8Lk3HpzG3UP4SfP9t0MITEUazTPPbwGg/TAYXKW+rlxANQHeaD
 BMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j3xcIy2m2TMlH3aTyvVTXEM5j7IHz1QAadoWnnY7f2s=;
 b=cr5EaHTn7D4VJEV3c4jThc18+jIdmfxDZ7XcbT6nUEVLWiHDTg+1OoplyrPa7WTZ8v
 3yZB7uGd81ZeleVHeg6OdCDKdhSGDVcStcWUIPlq3ZrUsnd1WdobazNX3HD3DKxwqdhd
 Lb4l6v62316m2xq4L7g+TMaQjDkItvNzGIK+/8Sr30WKFGb7R5QJS3Wln5r7c9A3yPgy
 QIaJqlIFhdc89sYwprEiXUZ+dRUF6yEODtkvP1kFqVj8p58JYGDeMMW31uHis34noFez
 7JSp7SLyCWjNH+2kXOPkxfgQzcNC7pMbTNxIax9MMrIaemFD0pBjf8qQCRXOYiYB/so0
 rtbQ==
X-Gm-Message-State: AOAM533x3tmQCKtG73SJux+g8CoQ2+fgsvm9XdA9EMUL4GjLfbfTRXix
 M4jqXBtXVankOYN/tJHzmgmKEypTGj49RA==
X-Google-Smtp-Source: ABdhPJyXRyaVLqmXIYU6Xk7pV9taBE7pjZRkkIU4HfY1aOzhfSlaopHF3j5kdlozhCCKZ3/23zxhwQ==
X-Received: by 2002:ad4:5f4c:: with SMTP id p12mr24008002qvg.11.1635912240400; 
 Tue, 02 Nov 2021 21:04:00 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id br20sm730408qkb.104.2021.11.02.21.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 21:04:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/10] tests/tcg: Add arm and aarch64 pc alignment tests
Date: Wed,  3 Nov 2021 00:03:52 -0400
Message-Id: <20211103040352.373688-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103040352.373688-1-richard.henderson@linaro.org>
References: <20211103040352.373688-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



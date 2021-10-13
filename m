Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B248042B369
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:26:21 +0200 (CEST)
Received: from localhost ([::1]:39118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUuK-0005IO-Nn
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUL8-0005lh-Ut
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:49:58 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUL7-0001Bz-6N
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:49:58 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 75so904909pga.3
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E7JCU1a/pkRMOjn44wnlj8F4Wtu8gz5MK8RJjxKzysE=;
 b=QttM69rr2YJ0XQymGknqZjhxqacKtBlR5NtYOtop9E5g9Ds9iIMQ2HtwVluF7VrY2Q
 jRa6Y7YpI2FJt4Lc1x62vbLJ0myUedsIaOGEz1VKJyl+pG9lJj3u7qfnD+Jvdu0zJ8Op
 ytB6nvf8yLbNr1tFC/T8yazKVy7Zbk0LKXd1v81FP04+87r/plzjCWWkdyTtZFqsWsbu
 k47Haefufm4Etup9iB0BX8BTKP2KY6nzdSj/BPxmcL4Mkh22jrBSLhSE4J6BQ0ADCqqd
 6RxuEA8K3c/f4bNozCLc1qVQOppEHx/WcXjRRpn/RtuM6WJCTE4oxgCLxJIFIMJb3xv7
 NIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E7JCU1a/pkRMOjn44wnlj8F4Wtu8gz5MK8RJjxKzysE=;
 b=yFB0YyLiOLFBUjMmSlNbOF4HmdL80MMMCbuN5Gb91I2SrLjnIys6HEzxu8MbTDbgEN
 pzde/uZS4MuI7AMLWyfdyGHzPlGV3kkpPxx9t99cbVq9K8g9+q1vw9SlXut57KvRB4OY
 /hwLXyX8m1UQCOcljTxB0NBT1Wdq8KpDw4k1n9YTJ8XhdwySvh71hiiF1TAtODEY3bXO
 juoOzxYkyvRowXZPl9DyhGtpPBMs9fgYRs9F9Zu0kq7wXwUbIXwnej4VwmGLWU4PU/ow
 oiGausLni7f6Ww5GHAo47N6nMULKJbyOPVw5eZjSxeROY7jZ5t3FsA3qYhRXXb7dwmho
 Tz+A==
X-Gm-Message-State: AOAM533E7etRLohsYjgW4F3VSj/goZfiZ+aLYVcMSEFYDFbCDPXM2iQl
 cNieiTlDf19C/ZGIKumqAjqaIz0Vh4aqGg==
X-Google-Smtp-Source: ABdhPJzRRfSmNKbTGfKgEjHa9/iiFnTxoHAcM5aMGC2FqzPl6ioPiBzRsY7NsZoNsSrsMlOBGxNrGg==
X-Received: by 2002:a62:a50b:0:b0:44d:39f2:a94f with SMTP id
 v11-20020a62a50b000000b0044d39f2a94fmr7920082pfm.75.1634093395871; 
 Tue, 12 Oct 2021 19:49:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y20sm12579610pfp.68.2021.10.12.19.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:49:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 48/48] tests/tcg/multiarch: Add sigbus.c
Date: Tue, 12 Oct 2021 19:46:07 -0700
Message-Id: <20211013024607.731881-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A mostly generic test for unaligned access raising SIGBUS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/multiarch/sigbus.c | 68 ++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 tests/tcg/multiarch/sigbus.c

diff --git a/tests/tcg/multiarch/sigbus.c b/tests/tcg/multiarch/sigbus.c
new file mode 100644
index 0000000000..8134c5fd56
--- /dev/null
+++ b/tests/tcg/multiarch/sigbus.c
@@ -0,0 +1,68 @@
+#define _GNU_SOURCE 1
+
+#include <assert.h>
+#include <stdlib.h>
+#include <signal.h>
+#include <endian.h>
+
+
+unsigned long long x = 0x8877665544332211ull;
+void * volatile p = (void *)&x + 1;
+
+void sigbus(int sig, siginfo_t *info, void *uc)
+{
+    assert(sig == SIGBUS);
+    assert(info->si_signo == SIGBUS);
+#ifdef BUS_ADRALN
+    assert(info->si_code == BUS_ADRALN);
+#endif
+    assert(info->si_addr == p);
+    exit(EXIT_SUCCESS);
+}
+
+int main()
+{
+    struct sigaction sa = {
+        .sa_sigaction = sigbus,
+        .sa_flags = SA_SIGINFO
+    };
+    int allow_fail = 0;
+    int tmp;
+
+    tmp = sigaction(SIGBUS, &sa, NULL);
+    assert(tmp == 0);
+
+    /*
+     * Select an operation that's likely to enforce alignment.
+     * On many guests that support unaligned accesses by default,
+     * this is often an atomic operation.
+     */
+#if defined(__aarch64__)
+    asm volatile("ldxr %w0,[%1]" : "=r"(tmp) : "r"(p) : "memory");
+#elif defined(__alpha__)
+    asm volatile("ldl_l %0,0(%1)" : "=r"(tmp) : "r"(p) : "memory");
+#elif defined(__arm__)
+    asm volatile("ldrex %0,[%1]" : "=r"(tmp) : "r"(p) : "memory");
+#elif defined(__powerpc__)
+    asm volatile("lwarx %0,0,%1" : "=r"(tmp) : "r"(p) : "memory");
+#elif defined(__riscv_atomic)
+    asm volatile("lr.w %0,(%1)" : "=r"(tmp) : "r"(p) : "memory");
+#else
+    /* No insn known to fault unaligned -- try for a straight load. */
+    allow_fail = 1;
+    tmp = *(volatile int *)p;
+#endif
+
+    assert(allow_fail);
+
+    /*
+     * We didn't see a signal.
+     * We might as well validate the unaligned load worked.
+     */
+    if (BYTE_ORDER == LITTLE_ENDIAN) {
+        assert(tmp == 0x55443322);
+    } else {
+        assert(tmp == 0x77665544);
+    }
+    return EXIT_SUCCESS;
+}
-- 
2.25.1



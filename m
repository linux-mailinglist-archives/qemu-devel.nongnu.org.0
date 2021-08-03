Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AFE3DE572
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:36:33 +0200 (CEST)
Received: from localhost ([::1]:48024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAmAK-0003E1-L9
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlt5-0005YD-FV
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:43 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:42797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlt2-0005Eh-Uf
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:43 -0400
Received: by mail-pl1-x632.google.com with SMTP id t3so20049094plg.9
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JXEm0LQzBp7FYdF62IKS2HTHAwaTAwDqUq6VzQ5+a94=;
 b=uaLES6g5HOysHgzE5iXrqj9z7/HswoB9aGJdJ5g/rGBriGRdcSqVrRhqGTMFDCorJB
 EOXD32pIuWrPLJg97vwgzyziZG0adoWvzNkpc5SJi3f2J9CoXdLuKwcZ5Af1rUps22/N
 9Hh8rjx8nQs938JHSUwrZLxzn4dsCTKI3WdjZSvEXe1PNpIc/IVi7GSVtJ3JoZxTxv+A
 zLzyBJuMNMpHrJNFxSaPYsb5P+VLNtRhpBBZNfEqU7SkNtrFUJGBvTiE+1h8rv/XTdmi
 YpShGLfudmIV4lSk+J9qnQzArfVmP8wCt6ulUuvmIR2KOENCOGVEwy79mhF1EllkZgQb
 yd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JXEm0LQzBp7FYdF62IKS2HTHAwaTAwDqUq6VzQ5+a94=;
 b=in3uI2H6w4tfegN9x6qH3+sN3tm44ex6ixl9Wg9I6AMculVjVwNv1//JC7xf1mvKmo
 fmI0Hmz675IQp6ji1hbVF3nmbMUoCX13nz+12EcNYh2cp7Wkv4ArCFoFhz7QwN+RHK7L
 xMkS0WER1AhHsWsJsmH68Hf/hjcveOV9hzs+gsTYSZIqqMKOMbQXLM3NwygwBc3efpMB
 MM/THCNWgYLx1Y9mt6NbCPfHd3iTLmScuH+n2NNEDm/iQti3sdKH2lBv/IZyG9dBheOc
 FVuKCoZ6GokO3QKcEYiev5y+gDmwIS4ZRwOGIGGNO0GsUri2m2DiLdBntJ5wX90v5FLH
 aDRg==
X-Gm-Message-State: AOAM531iTgxCbIatlIzaRcwIzT6v61SJ/jiatbzybsPkp8c5/dl5VSND
 8r6VChNeDZOHqbp89ZAsCqYAj9I21C4g9w==
X-Google-Smtp-Source: ABdhPJx0o00qOSrf6kbYzlIE5jnqtxvIDsZmW9u/rxc+OsNJFCJwiybpI6kQEYPKjbhMb8ktmZ7AsA==
X-Received: by 2002:a63:6e83:: with SMTP id j125mr290260pgc.12.1627964319258; 
 Mon, 02 Aug 2021 21:18:39 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id ns18sm12091020pjb.31.2021.08.02.21.18.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:18:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 44/55] tests/tcg/multiarch: Add sigbus.c
Date: Mon,  2 Aug 2021 18:14:32 -1000
Message-Id: <20210803041443.55452-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A mostly generic test for unaligned access raising SIGBUS.

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



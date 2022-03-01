Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385904C8933
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:24:38 +0100 (CET)
Received: from localhost ([::1]:53124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzgL-0006R0-8g
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:24:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOzEz-0007yk-UQ
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:56:22 -0500
Received: from [2a00:1450:4864:20::62f] (port=33567
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOzEx-0001xO-9j
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:56:21 -0500
Received: by mail-ej1-x62f.google.com with SMTP id kt27so1247039ejb.0
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 01:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9R6z4B4mLQw367uaJ4iZig/x1Xw1bFRMsLiBv+G2ki8=;
 b=TQq3gcfzRziqDVVKW7ML8jejLp+dF63fMJ5uHLXDBMSjq4cnh9EfLlUUrHpYbyR4sL
 eJm1zKwqV3WVd/crcfaZzXop9okmDtyWNRcYwRpwTHXXtg8y0sERTFGBTiaELNRqgxLw
 6/2nPpWnB6zpa+rH4H+z1D0Xik/Ez4VIzTrXfnpzSR0+2nOb+cYJBgf/XNpAGK6O/UR/
 xzTBmZQEZCxzYWeix4g8+OzBpk6XJhsEzl4nT1MCo61ExCKxxIL9pfazKjGTar9PJf57
 RfkBplejo2pVv93GWBM1U5VFDHTewAkImz2FUmbVUzXM+VMROBGmBQHune7PcTedYk1c
 /ZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9R6z4B4mLQw367uaJ4iZig/x1Xw1bFRMsLiBv+G2ki8=;
 b=lMauhKCerAD38y0KRIWsOg6gC510k+KO+FOg5XPYCiZZJ4XSvp8+cehbFBIx6bJ920
 N3dyNWTSofH+/y/svQl8BcMHMZMbzw3Fbmw6XPwCL/rxn6tHg+MHWG1u+SxemBf2PXhr
 uztOAd/JUIiotj5UiQOHent2800lYsg4qYdoEG6TID+w0ddgS5Ny6E+ZcwAn/bcA0u+6
 XdBlDbPbu4pxj2qsqiJGFZMWBZ26fbcCSa1FgeXUDGR5gDdMCBTD0oIMCKP3/vBeC67u
 B/3wN+o96IQh+0e05BI1tnsVRh3KyEzAN8qQ41LzrGtXhYE7DkSRXRc7JA6lT/C5sHBu
 /thQ==
X-Gm-Message-State: AOAM532f3OB2MZeMpprxxkGvIv55iF/MUyIlKoktYe8E3VoZQNJHrcrd
 nhCaNHOYgl+l2jDjlqZr3of8lQ==
X-Google-Smtp-Source: ABdhPJwquB41a7eyZ2UkUA/Sn6/kd7cTCLvVZ3wV6D0lYCaC/nEnLHnrT9aXRJe+C3bZ0lABQgGLQA==
X-Received: by 2002:a17:906:743:b0:6d0:7f19:d737 with SMTP id
 z3-20020a170906074300b006d07f19d737mr18550517ejb.11.1646128576865; 
 Tue, 01 Mar 2022 01:56:16 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 ov6-20020a170906fc0600b006cf54ef58ddsm5256400ejb.149.2022.03.01.01.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 01:56:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 04F4E1FFCA;
 Tue,  1 Mar 2022 09:47:17 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 18/18] tests/tcg: port SYS_HEAPINFO to a system test
Date: Tue,  1 Mar 2022 09:47:15 +0000
Message-Id: <20220301094715.550871-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301094715.550871-1-alex.bennee@linaro.org>
References: <20220301094715.550871-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows us to check our new SYS_HEAPINFO implementation generates
sane values.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220225172021.3493923-19-alex.bennee@linaro.org>

diff --git a/tests/tcg/aarch64/system/semiheap.c b/tests/tcg/aarch64/system/semiheap.c
new file mode 100644
index 0000000000..4ed258476d
--- /dev/null
+++ b/tests/tcg/aarch64/system/semiheap.c
@@ -0,0 +1,93 @@
+/*
+ * Semihosting System HEAPINFO Test
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <inttypes.h>
+#include <stddef.h>
+#include <minilib.h>
+
+#define SYS_HEAPINFO    0x16
+
+uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
+{
+    register uintptr_t t asm("x0") = type;
+    register uintptr_t a0 asm("x1") = arg0;
+    asm("hlt 0xf000"
+        : "=r" (t)
+        : "r" (t), "r" (a0)
+        : "memory" );
+
+    return t;
+}
+
+int main(int argc, char *argv[argc])
+{
+    struct {
+        void *heap_base;
+        void *heap_limit;
+        void *stack_base;
+        void *stack_limit;
+    } info = { };
+    void *ptr_to_info = (void *) &info;
+    uint32_t *ptr_to_heap;
+    int i;
+
+    ml_printf("Semihosting Heap Info Test\n");
+
+    __semi_call(SYS_HEAPINFO, (uintptr_t) &ptr_to_info);
+
+    if (info.heap_base == NULL || info.heap_limit == NULL) {
+        ml_printf("null heap: %p -> %p\n", info.heap_base, info.heap_limit);
+        return -1;
+    }
+
+    /* Error if heap base is above limit */
+    if ((uintptr_t) info.heap_base >= (uintptr_t) info.heap_limit) {
+        ml_printf("heap base %p >= heap_limit %p\n",
+               info.heap_base, info.heap_limit);
+        return -2;
+    }
+
+    if (info.stack_base == NULL) {
+        ml_printf("null stack: %p -> %p\n", info.stack_base, info.stack_limit);
+        return -3;
+    }
+
+    /*
+     * boot.S put our stack somewhere inside the data segment of the
+     * ELF file, and we know that SYS_HEAPINFO won't pick a range
+     * that overlaps with part of a loaded ELF file. So the info
+     * struct (on the stack) should not be inside the reported heap.
+     */
+    if (ptr_to_info > info.heap_base && ptr_to_info < info.heap_limit) {
+        ml_printf("info appears to be inside the heap: %p in %p:%p\n",
+               ptr_to_info, info.heap_base, info.heap_limit);
+        return -4;
+    }
+
+    ml_printf("heap: %p -> %p\n", info.heap_base, info.heap_limit);
+    ml_printf("stack: %p <- %p\n", info.stack_limit, info.stack_base);
+
+    /* finally can we read/write the heap */
+    ptr_to_heap = (uint32_t *) info.heap_base;
+    for (i = 0; i < 512; i++) {
+        *ptr_to_heap++ = i;
+    }
+    ptr_to_heap = (uint32_t *) info.heap_base;
+    for (i = 0; i < 512; i++) {
+        uint32_t tmp = *ptr_to_heap;
+        if (tmp != i) {
+            ml_printf("unexpected value in heap: %d @ %p", tmp, ptr_to_heap);
+            return -5;
+        }
+        ptr_to_heap++;
+    }
+    ml_printf("r/w to heap upto %p\n", ptr_to_heap);
+
+    ml_printf("Passed HeapInfo checks\n");
+    return 0;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index fa8adc2618..68adaac373 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3549,6 +3549,7 @@ S: Maintained
 F: semihosting/
 F: include/semihosting/
 F: tests/tcg/multiarch/arm-compat-semi/
+F: tests/tcg/aarch64/system/semiheap.c
 
 Multi-process QEMU
 M: Elena Ufimtseva <elena.ufimtseva@oracle.com>
-- 
2.30.2



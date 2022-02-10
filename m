Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CCA4B0C9D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:42:53 +0100 (CET)
Received: from localhost ([::1]:46278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI7qe-0006pu-Do
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:42:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nI7ef-0003ie-FI
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:30:32 -0500
Received: from [2a00:1450:4864:20::629] (port=45584
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nI7ed-0002Vp-5O
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:30:29 -0500
Received: by mail-ej1-x629.google.com with SMTP id s21so14365260ejx.12
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 03:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9qy7IV48skw6PiK32u8+FO1zaKIr1zsoKUR1tPCSI0c=;
 b=wVmNAdBG53HscQ0hYgt7SAJbb4aIflYY8gWqyGKt4d2ZpkFLsRK3NMoswRZanLHMGE
 gCytAEagVH+Bn2mykwZjtPL/DHRdA0uYjODktv+2gzleeJWs307QGicWIkeWad3/Sseu
 pWUx2fgq6QtKRLR7VwmwZJNrHLt0bektrPzWno9ddPcGY1QrcswLgs9M0H429CcEKPta
 uLRnVrXkxojsiid9ACIfsqi9qoQDLlOVogZWv9t4CvHNe84G7AWJP83ndE/ie7oDTXX1
 GRHK2+PNqVcBOHpbkbmMaRNrNkoj6p0/EpqUGp74LMdhATvxPZQKOxQfH7M8V0ojnyai
 6+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9qy7IV48skw6PiK32u8+FO1zaKIr1zsoKUR1tPCSI0c=;
 b=2xDQ++0LsgdsmtRmNOJnQ8UogTTwHzqtmGbpzulE8i2tEUtUFQkYRtLliRX28S1oC7
 QqNKQRRUWFvOUV08k2d7IKS6GA03Yr92cCObyHq1NNCMzrbw7Ua7Avn/OmoFTfEa2gj9
 0nrRVMZBZqEISsuDTnmyRhSG0ZvxlbgVvoufr6YYz8QhEtZ2Q5LvCpe5ZrSkzi0c+nst
 ILyprRnRe1GIRx3KaelAiyBZqKrZtefF5du6NMkcr7kLCiShrtzjPe8oW94vCoHe2fca
 9iWMX5B2gauCaMuebCU6FUmq/P9BkmtUiEQe9eNt75clZCve4lk1AoXXJ3MWA3SGJzKO
 QT6g==
X-Gm-Message-State: AOAM5305T6M21wqOQK81hbbk9zAYcV86XFDoaXNVWtLDhtFzBjQk+i1w
 t6QIdaZnczJqBLuVbriPuZtBWA==
X-Google-Smtp-Source: ABdhPJwfVX22NAq1VhDZ/haNQlOJHs0z3kFlnw55yJ9GZw+NZJvmvO1VnEGC5oLvMXGmPKqRS2tPfw==
X-Received: by 2002:a17:907:7207:: with SMTP id
 dr7mr5965867ejc.500.1644492625806; 
 Thu, 10 Feb 2022 03:30:25 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id ku15sm5624043ejc.25.2022.02.10.03.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 03:30:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B81B91FFBA;
 Thu, 10 Feb 2022 11:30:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH  v5 2/2] tests/tcg: port SYS_HEAPINFO to a system test
Date: Thu, 10 Feb 2022 11:30:21 +0000
Message-Id: <20220210113021.3799514-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220210113021.3799514-1-alex.bennee@linaro.org>
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows us to check our new SYS_HEAPINFO implementation generates
sane values.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v5
  - static init of heapinfo structure
  - clean-up comment on why we can test stack position
  - add memory clobber for semicall
  - test we can read/write to a portion of the heap
  - fix MAINTAINERS
---
 tests/tcg/aarch64/system/semiheap.c | 93 +++++++++++++++++++++++++++++
 MAINTAINERS                         |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 tests/tcg/aarch64/system/semiheap.c

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
index b0b845f445..251f96af9e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3536,6 +3536,7 @@ S: Maintained
 F: semihosting/
 F: include/semihosting/
 F: tests/tcg/multiarch/arm-compat-semi/
+F: tests/tcg/aarch64/system/semiheap.c
 
 Multi-process QEMU
 M: Elena Ufimtseva <elena.ufimtseva@oracle.com>
-- 
2.30.2



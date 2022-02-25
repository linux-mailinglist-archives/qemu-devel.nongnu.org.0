Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EF84C4D1F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 19:01:10 +0100 (CET)
Received: from localhost ([::1]:60094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNetw-0004zb-Vg
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 13:01:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeH7-0004ML-BO
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:21:01 -0500
Received: from [2a00:1450:4864:20::635] (port=33665
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGz-0002Ph-68
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:21:01 -0500
Received: by mail-ej1-x635.google.com with SMTP id vz16so12272807ejb.0
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JR//9KiItwNd050+o2fTFYSPa/InsS8zg93yxzEMbvU=;
 b=MIR9fjQGObmfYVyPs8RiTn1Gyn9PhdLYqKP9mjQ0tWCU60JtVv/OPe9COr5aNqlT8n
 N2b3AsAmKY4Pb1qXDiahycL+UB25K4w2C018tf+BSaPvBaOLL8bg9s4TYolwBrgjVEYE
 SaqC8UyUW2blolstwkuHd8n6FRa6jzAlUa20jnTQtSAYsCiotc2UX9gaJTvOn9O6aJoa
 hJoQCgqlBD5gnr+RT7Mr97hoqOMBbkYEFSGR8tHD5IuA1i5F4BrHV45L/4Yu1PQE/MtI
 Gx+tzyKAKIzyC7lCW+8/dc0lVNaEFjUvONo0BO5K+KYAaIE8m++u5kUKXExkOKCfWFRt
 wXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JR//9KiItwNd050+o2fTFYSPa/InsS8zg93yxzEMbvU=;
 b=J+snzyW8OUJYSIelNPdxH9EyiN1FqSnzaC6dNfaTpRdcnMB2C9QQLe/AJMzmnqVpok
 zmrnWk8ijSpZz706hqIalVA7DQJ2Wze7h5hjcyr0kN6xqrJkJQYYqoFRvA/VzZtY3wo1
 mAdkebLwAeR0YzFB+sFd66YpWNsvQBwjDX64oPZXUpqpxAO1VyW8m4brdolGTXH6OY9H
 PnF9nxBUfDcuTDvXuzu/X5o0tdQ2XJFZik8o/fK7FZZHEBAzvfwncsuPsdWuJtyEXxnM
 sa79Kir+LmSynWYWszO79KUMF9SQBQ2fzPWlKd2Bt1bu8ix6qTsbH+w6gKaoU8u0ZSkA
 6t1Q==
X-Gm-Message-State: AOAM532iCop/bd2Bdz4j/I8NoZ7L/kbTvJwuBQDXBaKKTiRnFR6TVw1s
 uTgDPUBfUb8rUYkTLNeXRsuYzg==
X-Google-Smtp-Source: ABdhPJykZyo7T22luFno0e5zA86EPLd9uVFnFfgmS569EYzqY8PXe+FebRsZv+6u9dbHiS4ojEW6UQ==
X-Received: by 2002:a17:906:3803:b0:6cf:56b9:60a9 with SMTP id
 v3-20020a170906380300b006cf56b960a9mr6613981ejc.716.1645809643944; 
 Fri, 25 Feb 2022 09:20:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 r3-20020aa7cb83000000b0040decce18bdsm1571180edt.99.2022.02.25.09.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 09:20:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D2AA61FFCA;
 Fri, 25 Feb 2022 17:20:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 18/18] tests/tcg: port SYS_HEAPINFO to a system test
Date: Fri, 25 Feb 2022 17:20:21 +0000
Message-Id: <20220225172021.3493923-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, sw@weilnetz.de, richard.henderson@linaro.org,
 f4bug@amsat.org, qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows us to check our new SYS_HEAPINFO implementation generates
sane values.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220210113021.3799514-3-alex.bennee@linaro.org>
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



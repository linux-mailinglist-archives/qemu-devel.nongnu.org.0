Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B833466D6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:55:23 +0100 (CET)
Received: from localhost ([::1]:50602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlFS-0001aS-5u
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHd-0007FW-EM
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:36 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHZ-0002wp-PB
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:33 -0400
Received: by mail-ej1-x62b.google.com with SMTP id e14so10028838ejz.11
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nV9FEUQi26PpeGtroH8dN7VBa8pABbTHxvm6zGW6zk8=;
 b=PxuCy63b+oDajrVFBnBx2kFZKwLtXCBhZkinNakBRYsKa409ri2bYPhvz1gdxhgSlU
 deW9jg60yGtHDNT1Tp3OIvZmVzaGsAb0d1MEE8J+uhBEIZms2+0P4bCousWV8oalqo/v
 pSxhPVLueB240BnOgz+79mhDY5X1c+8iCn4W3Sk59VTrYPCC7qv3M22zgRy+mV2hS+c7
 vtzC/W5CGJNSRT2fao2UPz3l0DFbDiu4FBotNaz6LyMTmdQrgBblcbncoFU72F5AFQDq
 H6FVBnd3rHFdRjILhja2eZZI80M7r56FKZ3ispyODRIFz24y9g9pphaK65DfJtUtN0/s
 L1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nV9FEUQi26PpeGtroH8dN7VBa8pABbTHxvm6zGW6zk8=;
 b=VIhgX9ZHNV6I/ADFYSC2FHttpAdxp/nAGVgHmKAI3oP+xNVqeaFxgTVxWLaX5qq2i2
 s4fZ0fMyJA75kcDnr0BcK0wsYM0Wo1+qAhf+IUdZRiekZtuF4aNLWeYXtCkX6558D5zz
 JM277E1lAVxd18QzgsQWuMVaguhrMr/uEtNLZrdi+/GpoEN+M2oY6NLV1kLth/9b5RgV
 FHqamkb7mznbC6OJodAtXRm4hWyKhTG37I7DIPO8ypyxbNBvwbUXLEKBMR3btE9div+I
 b+ODNsGgAcOMEipUGagctil8+IKG3IYih6iplm2tNIqWkcnL+bIKHZNBw++N5P0Mnpbd
 ZsjA==
X-Gm-Message-State: AOAM533KGQ2ioieuSYQMDKJ24H45bf+z9Na7QAQu4AhShbTMaJroicKK
 VRK1+fOdH1WSBf78+G8QZZEr8RZoYNNILY88
X-Google-Smtp-Source: ABdhPJxiza9ZevcQXGljZXk3yP3Ktt+UdrvX0uMmoeQhznQOy3Q/3ykxz870UM5EsRFgvW/1j8DN3A==
X-Received: by 2002:a17:906:dbd0:: with SMTP id
 yc16mr5787292ejb.71.1616518408601; 
 Tue, 23 Mar 2021 09:53:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f3sm11474290ejd.42.2021.03.23.09.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:53:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 428981FF98;
 Tue, 23 Mar 2021 16:53:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/22] tests/tcg: add HeapInfo checking to semihosting test
Date: Tue, 23 Mar 2021 16:52:55 +0000
Message-Id: <20210323165308.15244-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Query the SYS_HEAPINFO semicall and do some basic verification of the
information via libc calls.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210320133706.21475-10-alex.bennee@linaro.org>

---
v2
  - expand test as suggested by Richard
---
 .../multiarch/arm-compat-semi/semihosting.c   | 55 ++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/multiarch/arm-compat-semi/semihosting.c b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
index b3fd16cd12..8627eee3cf 100644
--- a/tests/tcg/multiarch/arm-compat-semi/semihosting.c
+++ b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
@@ -8,9 +8,13 @@
  */
 
 #define SYS_WRITE0      0x04
+#define SYS_HEAPINFO    0x16
 #define SYS_REPORTEXC   0x18
 
 #include <stdint.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
 #include "semicall.h"
 
 int main(int argc, char *argv[argc])
@@ -21,8 +25,57 @@ int main(int argc, char *argv[argc])
     uintptr_t exit_block[2] = {0x20026, 0};
     uintptr_t exit_code = (uintptr_t) &exit_block;
 #endif
+    struct {
+        void *heap_base;
+        void *heap_limit;
+        void *stack_base;
+        void *stack_limit;
+    } info;
+    void *ptr_to_info = (void *) &info;
 
-    __semi_call(SYS_WRITE0, (uintptr_t) "Hello World");
+    __semi_call(SYS_WRITE0, (uintptr_t) "Checking HeapInfo\n");
+
+    memset(&info, 0, sizeof(info));
+    __semi_call(SYS_HEAPINFO, (uintptr_t) &ptr_to_info);
+
+    if (info.heap_base == NULL || info.heap_limit == NULL) {
+        printf("null heap: %p -> %p\n", info.heap_base, info.heap_limit);
+        exit(1);
+    }
+
+    /* Error if heap base is above limit */
+    if ((uintptr_t) info.heap_base >= (uintptr_t) info.heap_limit) {
+        printf("heap base %p >= heap_limit %p\n",
+               info.heap_base, info.heap_limit);
+        exit(2);
+    }
+
+    if (info.stack_base == NULL || info.stack_limit) {
+        printf("null stack: %p -> %p\n", info.stack_base, info.stack_limit);
+        exit(3);
+    }
+
+    /* check our local variables are indeed inside the reported stack */
+    if (ptr_to_info > info.stack_base) {
+        printf("info appears to be above stack: %p > %p\n", ptr_to_info,
+               info.stack_base);
+        exit(4);
+    } else if (ptr_to_info < info.stack_limit) {
+        printf("info appears to be outside stack: %p < %p\n", ptr_to_info,
+               info.stack_limit);
+        exit(5);
+    }
+
+    if (ptr_to_info > info.heap_base && ptr_to_info < info.heap_limit) {
+        printf("info appears to be inside the heap: %p in %p:%p\n",
+               ptr_to_info, info.heap_base, info.heap_limit);
+        exit(6);
+    }
+
+    printf("heap: %p -> %p\n", info.heap_base, info.heap_limit);
+    printf("stack: %p -> %p\n", info.stack_base, info.stack_limit);
+
+    __semi_call(SYS_WRITE0, (uintptr_t) "Passed HeapInfo checks");
     __semi_call(SYS_REPORTEXC, exit_code);
     /* if we get here we failed */
     return -1;
-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2DF3CC5E5
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 21:30:09 +0200 (CEST)
Received: from localhost ([::1]:46194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4q0m-0000lJ-9a
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 15:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pvK-00043z-JW
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:24:31 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:33572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pvH-0002lN-9j
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:24:30 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 v18-20020a17090ac912b0290173b9578f1cso9464001pjt.0
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 12:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H69VQRcIHav6NRyDaqGME7Hbpj5mmm0o6MKDRCvNXTw=;
 b=VGh2pTbssECZdNS/KqJIufo3FzENmaygEXpREzEZGVqcyFgM+i1THbl8wQ08/o8nbO
 ybNoSkvsHJDekOOCufuhLqyVn24psbZ/vctaeDj3EuQ1hZyLufuIE01II9WQJMg+MwqH
 Ik7GkRCmuSW0OYYPdeeGCQ5BWIBJlZeXlRNl0XHN/ndw+VmW3qxrWKjexfmsEGLuQgB7
 zqlSUr+Mbr+E2t9rwV9I28ACTihkvNHDilbkEJe2lPGvLN10rMjGYnHicAFrqupxuwdf
 u3OoVCf/aVeszKtA9qfGs2gQ4buiqaKCfE8RbkRql5IJIzVQ7u8pdmFbUE/mc57MvqPT
 VliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H69VQRcIHav6NRyDaqGME7Hbpj5mmm0o6MKDRCvNXTw=;
 b=pxf4SCRz1lLaEhaAl/stSQiIZ4szcp8Kk2tCVbtEVIhSmb0n3zTfai5ApPqNXluVTw
 kQwxRryX1Ki1DMHk1It6yXcloWFn/3WSAw2YNCF0GxQ4Ex8wdo9ZXyKim3c4tWmCICux
 ErzRN2flQAAfrT7jtyHH0ax5o6NIcFh/TEnU1ZYmNg3YUQc97VUhHOzAGrUBizvUMUcb
 wDma0FW3yKhKylYqSw4M0Gl521rOdJDMj9+rzsu96MOWzN+1eTYrv2DLKh14KDmkUKfk
 3YMaRC3pkDMdORzTFmG1geLbiCcvc3Vj+MYbeEHl0h86OLcaeNckn4OmuvS9IAtzB5w0
 4Ckg==
X-Gm-Message-State: AOAM533Hm0aBjpQWvLdzGz0sKaoX5RZT0tzl9uE7VukV+LwTkcwStMjo
 w30KoSHP3HYMT3jyuSO81H7sglsv06V02g==
X-Google-Smtp-Source: ABdhPJzyXNQj3P46rGRPdnpJG4zhMv5ZSCA3owAIf6sezvrCDAi+Px1LXngYO5e6QnkS9m53zRbk4w==
X-Received: by 2002:a17:90b:1b4d:: with SMTP id
 nv13mr16114602pjb.216.1626549866067; 
 Sat, 17 Jul 2021 12:24:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y82sm14547527pfb.121.2021.07.17.12.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 12:24:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/10] trace: Fold mem-internal.h into mem.h
Date: Sat, 17 Jul 2021 12:24:18 -0700
Message-Id: <20210717192419.2066778-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717192419.2066778-1-richard.henderson@linaro.org>
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the last thing that mem.h does is include mem-internal.h,
the symbols are not actually private.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 trace/mem-internal.h | 50 --------------------------------------------
 trace/mem.h          | 50 ++++++++++++++++++++++++++++++++++----------
 plugins/core.c       |  2 +-
 3 files changed, 40 insertions(+), 62 deletions(-)
 delete mode 100644 trace/mem-internal.h

diff --git a/trace/mem-internal.h b/trace/mem-internal.h
deleted file mode 100644
index 8b72b678fa..0000000000
--- a/trace/mem-internal.h
+++ /dev/null
@@ -1,50 +0,0 @@
-/*
- * Helper functions for guest memory tracing
- *
- * Copyright (C) 2016 Lluís Vilanova <vilanova@ac.upc.edu>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef TRACE__MEM_INTERNAL_H
-#define TRACE__MEM_INTERNAL_H
-
-#define TRACE_MEM_SZ_SHIFT_MASK 0xf /* size shift mask */
-#define TRACE_MEM_SE (1ULL << 4)    /* sign extended (y/n) */
-#define TRACE_MEM_BE (1ULL << 5)    /* big endian (y/n) */
-#define TRACE_MEM_ST (1ULL << 6)    /* store (y/n) */
-#define TRACE_MEM_MMU_SHIFT 8       /* mmu idx */
-
-static inline uint16_t trace_mem_build_info(
-    int size_shift, bool sign_extend, MemOp endianness,
-    bool store, unsigned int mmu_idx)
-{
-    uint16_t res;
-
-    res = size_shift & TRACE_MEM_SZ_SHIFT_MASK;
-    if (sign_extend) {
-        res |= TRACE_MEM_SE;
-    }
-    if (endianness == MO_BE) {
-        res |= TRACE_MEM_BE;
-    }
-    if (store) {
-        res |= TRACE_MEM_ST;
-    }
-#ifdef CONFIG_SOFTMMU
-    res |= mmu_idx << TRACE_MEM_MMU_SHIFT;
-#endif
-    return res;
-}
-
-static inline uint16_t trace_mem_get_info(MemOp op,
-                                          unsigned int mmu_idx,
-                                          bool store)
-{
-    return trace_mem_build_info(op & MO_SIZE, !!(op & MO_SIGN),
-                                op & MO_BSWAP, store,
-                                mmu_idx);
-}
-
-#endif /* TRACE__MEM_INTERNAL_H */
diff --git a/trace/mem.h b/trace/mem.h
index 9644f592b4..2f27e7bdf0 100644
--- a/trace/mem.h
+++ b/trace/mem.h
@@ -12,24 +12,52 @@
 
 #include "tcg/tcg.h"
 
-
-/**
- * trace_mem_get_info:
- *
- * Return a value for the 'info' argument in guest memory access traces.
- */
-static uint16_t trace_mem_get_info(MemOp op, unsigned int mmu_idx, bool store);
+#define TRACE_MEM_SZ_SHIFT_MASK 0xf /* size shift mask */
+#define TRACE_MEM_SE (1ULL << 4)    /* sign extended (y/n) */
+#define TRACE_MEM_BE (1ULL << 5)    /* big endian (y/n) */
+#define TRACE_MEM_ST (1ULL << 6)    /* store (y/n) */
+#define TRACE_MEM_MMU_SHIFT 8       /* mmu idx */
 
 /**
  * trace_mem_build_info:
  *
  * Return a value for the 'info' argument in guest memory access traces.
  */
-static uint16_t trace_mem_build_info(int size_shift, bool sign_extend,
-                                     MemOp endianness, bool store,
-                                     unsigned int mmuidx);
+static inline uint16_t trace_mem_build_info(int size_shift, bool sign_extend,
+                                            MemOp endianness, bool store,
+                                            unsigned int mmu_idx)
+{
+    uint16_t res;
+
+    res = size_shift & TRACE_MEM_SZ_SHIFT_MASK;
+    if (sign_extend) {
+        res |= TRACE_MEM_SE;
+    }
+    if (endianness == MO_BE) {
+        res |= TRACE_MEM_BE;
+    }
+    if (store) {
+        res |= TRACE_MEM_ST;
+    }
+#ifdef CONFIG_SOFTMMU
+    res |= mmu_idx << TRACE_MEM_MMU_SHIFT;
+#endif
+    return res;
+}
 
 
-#include "trace/mem-internal.h"
+/**
+ * trace_mem_get_info:
+ *
+ * Return a value for the 'info' argument in guest memory access traces.
+ */
+static inline uint16_t trace_mem_get_info(MemOp op,
+                                          unsigned int mmu_idx,
+                                          bool store)
+{
+    return trace_mem_build_info(op & MO_SIZE, !!(op & MO_SIGN),
+                                op & MO_BSWAP, store,
+                                mmu_idx);
+}
 
 #endif /* TRACE__MEM_H */
diff --git a/plugins/core.c b/plugins/core.c
index e1bcdb570d..474db287cb 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -27,7 +27,7 @@
 #include "exec/helper-proto.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-op.h"
-#include "trace/mem-internal.h" /* mem_info macros */
+#include "trace/mem.h" /* mem_info macros */
 #include "plugin.h"
 #include "qemu/compiler.h"
 
-- 
2.25.1



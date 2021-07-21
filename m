Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5113D1782
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:07:35 +0200 (CEST)
Received: from localhost ([::1]:42276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6IVC-0000MI-He
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IO4-0002kT-QM
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:12 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:37812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IO3-0005ik-3J
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:12 -0400
Received: by mail-pl1-x62d.google.com with SMTP id y3so1646956plp.4
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lxWc/RvP2HP3ROUQi7CWrSdIRxEa6wVjFG+/s3ElqKw=;
 b=JFfR/aftAGjAQ0wcUTUf2A3PuXn/DyS1H5IjkntwDDTy4XuaRrgQMpRFE/3rlg284H
 7V0lrHNsLb+eAn8pM1T9GcuPq9NKgTejICrPnLZzjgZD9asFj7fhdgNgxfT0We0TX0ut
 TsZpVnZGlTb/jiVBe7iGlHa/ieSzCNAPT8Z8F80vPgYgtfq/RGwz68mI628PUV/C0W2w
 gAMIMYanLJHGG3rpiiFHSRuxUS73Lkr6K7pSAWYvvHc164KXoQJiso9o6FqRnFBjhg2e
 SWLqoH+TUArWnvcG5d0C8hUqkb7HapdeWgPLG8eugI+wzYTaVVUuBTjDV2fccSLLpIq4
 I+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lxWc/RvP2HP3ROUQi7CWrSdIRxEa6wVjFG+/s3ElqKw=;
 b=A3vfl9XtaNmwBSgJtqTa0xUwMgrHLpSE1oyROW7XBiN6CzYCxvo2HMkLwnIqWsyA+e
 iEs0evpfn2RWARC0cJvcxbo9T4lqPSr7Vmt0H314fnd06eakw9jh9KwC/hKws4EJJLQQ
 4cN6C4vxsP+MpzRNSUzR/buujGYJjAVT6NAL2/x522KD/4PnH3K9aUq3EEPiV6LKhQ54
 uFcrdMD2KI03wUclJYJ2c4wqHNdYMq8RXiDvKPFx+mw7X2Xt8yzPO82XAEqGU+Kwb8L7
 UWWAo+FUtzfxOE0eWrat5LvZDGqb4a6+CBSW29OFXVRGnS5hC3DrCejHFz7l1qDKkCZ7
 zZ0A==
X-Gm-Message-State: AOAM533MgSEp7zVWBK1K5haDcmRnWwLy770tZCdNV00Y+N7rVpUvzVPf
 0hWJZvB08HcD8BY5y961fCicFgayINtThA==
X-Google-Smtp-Source: ABdhPJwcsUYEwglax+iQ/ioK1HsTcYgFTqHmcMqFZHGQxKC4nm0aDRDL1kvzUhJ+5yKnRBfml/SjKQ==
X-Received: by 2002:a17:90a:e453:: with SMTP id
 jp19mr5486083pjb.19.1626897609728; 
 Wed, 21 Jul 2021 13:00:09 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.13.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:00:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/27] trace: Fold mem-internal.h into mem.h
Date: Wed, 21 Jul 2021 09:59:36 -1000
Message-Id: <20210721195954.879535-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the last thing that mem.h does is include mem-internal.h,
the symbols are not actually private.

Tested-by: Cole Robinson <crobinso@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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



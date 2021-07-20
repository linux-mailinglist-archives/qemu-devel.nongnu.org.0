Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C153D0402
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 23:44:15 +0200 (CEST)
Received: from localhost ([::1]:36446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5xXC-0000Ei-Fx
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 17:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5xQs-0006Do-Da
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:37:42 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:41765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5xQq-0000I3-H2
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:37:42 -0400
Received: by mail-pg1-x52b.google.com with SMTP id s18so23749778pgg.8
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 14:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lxWc/RvP2HP3ROUQi7CWrSdIRxEa6wVjFG+/s3ElqKw=;
 b=OIZOG7aOtoO+BenZuLWVyd/+ShaFPMjpUYUG68qHUPzZcbIRZUpeuGNDRDmcQaQq1U
 ZZqAkUXLIrjBrtIxjsGq6mzQZDBN0NGPLIh6WjP28joSj7XTLGiXGskHv28cp/luzsI7
 gV/ocQ2T3zaCO3U55KMX6BACKIlgQGcSAPQFu3kAvf29XVFBomcyUUMQ3gzvz4wGNZRL
 a9ck1alluZk+H6DNpOXqoLxWOZQDpX1P8rVUgmK55SFr8IAKV7DENuUfW2wgp8Pl1Xcc
 v4LY7JK5F2848XQ/YrSfx2m8gIw1tIlPYyH6xZ2t1QAZj1gwqF0H8tIUVnk5wAiwrqdb
 1lvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lxWc/RvP2HP3ROUQi7CWrSdIRxEa6wVjFG+/s3ElqKw=;
 b=cYgUgUCwD2p9myXHoW46ft1FKn/r4Zo6C9Sa+r4dxzpWeIhijn2BuvmsZIhFWoZiAW
 KemlBCwZzWxrWjKsv++uLWw7vOiJjOgTYJIZSpSs/OUcQ6qH6oTN9kJEMDpv1a9LswDI
 8DmYx1WoOEl5E7jodcp1aKvayivCqGXiZbuna8FZjcumvzV+ELMOwYFuSDSAJ9/9TpGh
 hAzzLLm/GUPqrsCV1vdyhk3L6N3qhkJA0n6/vxggSR8yI2QsezI6x0ZalR12lNSVXdV1
 ohzTBGoc/773/oZUfAXawUJBgRrfLlXKcSZY5/Q0EXA36N98gZ8d/n+pmvB+Jae8Atjd
 bqDA==
X-Gm-Message-State: AOAM533kciwJtyTGnjf+k8uw4pbC85oe+2+LvLezk0Vk1xGbyA/tqKzX
 mHignZpWQw7xAtjhr6WvZwn/v749xaENfw==
X-Google-Smtp-Source: ABdhPJyH+rS7eFnrLCp/6xBmCY5Lui8lX1Tyeo9gxYVnJtNoXgCRprnsEIGvYy6AMfFWhX8vvkdJFA==
X-Received: by 2002:a62:ea0f:0:b029:319:8eef:5ff1 with SMTP id
 t15-20020a62ea0f0000b02903198eef5ff1mr33609329pfh.74.1626817059243; 
 Tue, 20 Jul 2021 14:37:39 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id r10sm24376813pff.7.2021.07.20.14.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 14:37:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/10] trace: Fold mem-internal.h into mem.h
Date: Tue, 20 Jul 2021 11:37:22 -1000
Message-Id: <20210720213723.630552-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720213723.630552-1-richard.henderson@linaro.org>
References: <20210720213723.630552-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
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



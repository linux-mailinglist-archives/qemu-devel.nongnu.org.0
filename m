Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560BF3CC0A5
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 03:49:57 +0200 (CEST)
Received: from localhost ([::1]:34330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4ZSm-0008DE-4n
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 21:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4ZKe-00014x-Tc
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 21:41:32 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4ZKd-00013n-6O
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 21:41:32 -0400
Received: by mail-pj1-x102c.google.com with SMTP id my10so7367561pjb.1
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 18:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ApQq+v37c6zDZZe3y7UCjEKGhyIwiJDW9wX/ROrljYo=;
 b=KG8amjEw0GL7fmHF3rvhFMy1BXGNLO9tOSbxvFz6r25k/1NXcm/XBIbLLmEOo/bHPN
 XZ1mhXOWM6CSZ+bd9uxO135m1uevfLgki/GBR8Go1nCzxV53m/C+weEwAF3Yra751Rxm
 YteWFyhT72H+usH1TI55J2RJNw7z4TxkoQ5dkUS93SJS2KXDUnV6QmrAL52pk3fdNUZ7
 SMQBcT63hpMV/qS9baMSyYuM4Bc1AUpMlZOkPw84Dt+AQRl6l9dtb+PREGjc1BLJ6oC0
 dphlRyvU8FT4FD4fr4alagdK5kUrqbTiROaso6X5PeZUeT+mYrt1K8mtTBjiWtOGlZAg
 cotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ApQq+v37c6zDZZe3y7UCjEKGhyIwiJDW9wX/ROrljYo=;
 b=Ex7aEf4JmL2ajT6K26/rE9ezJwtJJ2bjU5OmRZgXKtlNJuG9SOEHNLqYiQgStftdif
 Cz0uNaij+02R14c+zg4S7a+bE72OCAMeCSn/DbXb2hqFMa9HOIm2BHWpCACNavPEgk5c
 v+QxjIZBFz1lab68d2YL2dXRvfRYWIWmUxwIf/cZbo5Fx67aHPJw2GsZaaU7U0Oqku+k
 lcGscb60bICa+727fB5q37i/PC3AjmH8+LTAi/THjn8BrwQoTGs6XTR6i3Z9Lyd7tUaM
 ATb7soiub2MF+ByEuXrFBdu3CgOMYPONbMMPRdJqq61IifYDgpa9RCWGuAXiBHC/M4a5
 Zb3A==
X-Gm-Message-State: AOAM530M2Z2xn9WXVT68jeRu+bLhPMOGDXunN0JLb72Shjk6n+GekV12
 jfavqe5TfKdVBKv2KhApQ8BELSvPzDvcng==
X-Google-Smtp-Source: ABdhPJyam3QkZXtLfQk6go1ktWX7fDSt57CiKEgX/xOQdSY+zHPP+U36QHuZErE1GIZGx7Jj92ZxxQ==
X-Received: by 2002:a17:90a:658c:: with SMTP id
 k12mr17996528pjj.167.1626486089793; 
 Fri, 16 Jul 2021 18:41:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id q18sm12812738pgj.8.2021.07.16.18.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 18:41:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/11] trace: Fold mem-internal.h into mem.h
Date: Fri, 16 Jul 2021 18:41:20 -0700
Message-Id: <20210717014121.1784956-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717014121.1784956-1-richard.henderson@linaro.org>
References: <20210717014121.1784956-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the last thing that mem.h does is include mem-internal.h,
the symbols are not actually private.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 trace/mem-internal.h | 50 --------------------------------------------
 trace/mem.h          | 50 ++++++++++++++++++++++++++++++++++----------
 2 files changed, 39 insertions(+), 61 deletions(-)
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
-- 
2.25.1



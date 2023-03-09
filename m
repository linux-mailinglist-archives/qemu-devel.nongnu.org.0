Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B89C6B2E33
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:09:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWi-0004PT-HU; Thu, 09 Mar 2023 15:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWe-0004DW-Ta
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:08 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWd-0000j3-1T
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:08 -0500
Received: by mail-pl1-x631.google.com with SMTP id h8so3188920plf.10
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qm/yXBhbN4+TiVW2AwsQzq4+Dvs/WvUYy2EMrBGkES4=;
 b=KnAF7RxR/zXl8h6R6Ocaxg8LHVehURYGegZ98962ySGUvNmgBhhfhH5Ww+xgyNVFdK
 Xbtlxy2fjdyxwcZ4m96DOtldHciR0r4t/HrZr5GmqznogaWsusWT/CyjcL9HJAiJ8llM
 adgGfO+YAeb+zt7UCqeibqY1kbIgYPWJYv1Vsqi/N0Vww33kLtGuD8mlPaPgQijFevek
 S5EYI4C+iD23ew9hPKW4xhpHUZY2ZkmyxRzftW6roZEsntbRWT8Z6FZBgN4lXiGwDpVf
 RcCFCtlyG94JFsi9LnNx8kGeaZux1eVN8TQz/t+ybS4hyxsh4ITiLQgjdj7iAF25RPuZ
 xnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qm/yXBhbN4+TiVW2AwsQzq4+Dvs/WvUYy2EMrBGkES4=;
 b=TnogKSYjFQCsRRhm6hCgDLqSnA1VK0dSSBWfCPWCaUw9bhlJ5UZ5POhW90corrf1ST
 E6p7eXRUE/qLs5qCt/oUUzlIpSqt2UV1iKHS1eqzosXA5Kt/wW72SUdlha5XVEWKYVs+
 bp0+W3L6i/pkD82nKVQbEOXW70h6gGAb0EiMXrKHPHav/6t4IGTQ0AQglsWjL8Hjsuge
 sQG4qLuYW5y5JHlBpfXwosQYLSGbX23mHor+4HGSCXph9kbBgzfCBGU3PP7o/Idfetdd
 8D9D4jbvXsuFskzy+Yk5cycj2mxej6K5vDeuQNII9pV4GUTHjgI79NWzEB3NEPLZBkwi
 axgw==
X-Gm-Message-State: AO0yUKVDlRZu9caf/0O3aMekcbaGkABVcWO5Wb9ojO6avgXIDO5EFYVg
 L4mcMEoxDui72+Q4zZ/lVRPkM9Dq2M5/MoWVv2A=
X-Google-Smtp-Source: AK7set+hQkroydnK5PmX9PhSRXbx30AiB/azI19gFYy+TM8d7l4uuZUMGa9zPjwCoyXgnGzRiXoetQ==
X-Received: by 2002:a17:90b:3b4b:b0:234:19a1:8690 with SMTP id
 ot11-20020a17090b3b4b00b0023419a18690mr23895365pjb.26.1678392365337; 
 Thu, 09 Mar 2023 12:06:05 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 15/91] tcg: Create tcg/tcg-temp-internal.h
Date: Thu,  9 Mar 2023 12:04:34 -0800
Message-Id: <20230309200550.3878088-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, BITCOIN_OBFU_SUBJ=1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FUZZY_BITCOIN=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Move the tcg_temp_free_* and tcg_temp_ebb_new_* declarations
and inlines to the new header.  These are private to the
implementation, and will prevent tcg_temp_free_* from creeping
back into the guest front ends.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-temp-internal.h | 83 +++++++++++++++++++++++++++++++++
 include/tcg/tcg.h               | 54 ---------------------
 accel/tcg/plugin-gen.c          |  1 +
 tcg/tcg-op-gvec.c               |  1 +
 tcg/tcg-op-vec.c                |  1 +
 tcg/tcg-op.c                    |  1 +
 tcg/tcg.c                       |  1 +
 7 files changed, 88 insertions(+), 54 deletions(-)
 create mode 100644 include/tcg/tcg-temp-internal.h

diff --git a/include/tcg/tcg-temp-internal.h b/include/tcg/tcg-temp-internal.h
new file mode 100644
index 0000000000..dded2917e5
--- /dev/null
+++ b/include/tcg/tcg-temp-internal.h
@@ -0,0 +1,83 @@
+/*
+ * TCG internals related to TCG temp allocation
+ *
+ * Copyright (c) 2008 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef TCG_TEMP_INTERNAL_H
+#define TCG_TEMP_INTERNAL_H
+
+/*
+ * Allocation and freeing of EBB temps is reserved to TCG internals
+ */
+
+void tcg_temp_free_internal(TCGTemp *);
+
+static inline void tcg_temp_free_i32(TCGv_i32 arg)
+{
+    tcg_temp_free_internal(tcgv_i32_temp(arg));
+}
+
+static inline void tcg_temp_free_i64(TCGv_i64 arg)
+{
+    tcg_temp_free_internal(tcgv_i64_temp(arg));
+}
+
+static inline void tcg_temp_free_i128(TCGv_i128 arg)
+{
+    tcg_temp_free_internal(tcgv_i128_temp(arg));
+}
+
+static inline void tcg_temp_free_ptr(TCGv_ptr arg)
+{
+    tcg_temp_free_internal(tcgv_ptr_temp(arg));
+}
+
+static inline void tcg_temp_free_vec(TCGv_vec arg)
+{
+    tcg_temp_free_internal(tcgv_vec_temp(arg));
+}
+
+static inline TCGv_i32 tcg_temp_ebb_new_i32(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
+    return temp_tcgv_i32(t);
+}
+
+static inline TCGv_i64 tcg_temp_ebb_new_i64(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
+    return temp_tcgv_i64(t);
+}
+
+static inline TCGv_i128 tcg_temp_ebb_new_i128(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
+    return temp_tcgv_i128(t);
+}
+
+static inline TCGv_ptr tcg_temp_ebb_new_ptr(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
+    return temp_tcgv_ptr(t);
+}
+
+#endif /* TCG_TEMP_FREE_H */
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index a5cf21be83..00c4fbe613 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -862,35 +862,9 @@ void tcg_set_frame(TCGContext *s, TCGReg reg, intptr_t start, intptr_t size);
 TCGTemp *tcg_global_mem_new_internal(TCGType, TCGv_ptr,
                                      intptr_t, const char *);
 TCGTemp *tcg_temp_new_internal(TCGType, TCGTempKind);
-void tcg_temp_free_internal(TCGTemp *);
 TCGv_vec tcg_temp_new_vec(TCGType type);
 TCGv_vec tcg_temp_new_vec_matching(TCGv_vec match);
 
-static inline void tcg_temp_free_i32(TCGv_i32 arg)
-{
-    tcg_temp_free_internal(tcgv_i32_temp(arg));
-}
-
-static inline void tcg_temp_free_i64(TCGv_i64 arg)
-{
-    tcg_temp_free_internal(tcgv_i64_temp(arg));
-}
-
-static inline void tcg_temp_free_i128(TCGv_i128 arg)
-{
-    tcg_temp_free_internal(tcgv_i128_temp(arg));
-}
-
-static inline void tcg_temp_free_ptr(TCGv_ptr arg)
-{
-    tcg_temp_free_internal(tcgv_ptr_temp(arg));
-}
-
-static inline void tcg_temp_free_vec(TCGv_vec arg)
-{
-    tcg_temp_free_internal(tcgv_vec_temp(arg));
-}
-
 static inline TCGv_i32 tcg_global_mem_new_i32(TCGv_ptr reg, intptr_t offset,
                                               const char *name)
 {
@@ -898,13 +872,6 @@ static inline TCGv_i32 tcg_global_mem_new_i32(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_i32(t);
 }
 
-/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
-static inline TCGv_i32 tcg_temp_ebb_new_i32(void)
-{
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
-    return temp_tcgv_i32(t);
-}
-
 static inline TCGv_i32 tcg_temp_new_i32(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_TB);
@@ -918,26 +885,12 @@ static inline TCGv_i64 tcg_global_mem_new_i64(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_i64(t);
 }
 
-/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
-static inline TCGv_i64 tcg_temp_ebb_new_i64(void)
-{
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
-    return temp_tcgv_i64(t);
-}
-
 static inline TCGv_i64 tcg_temp_new_i64(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_TB);
     return temp_tcgv_i64(t);
 }
 
-/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
-static inline TCGv_i128 tcg_temp_ebb_new_i128(void)
-{
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
-    return temp_tcgv_i128(t);
-}
-
 static inline TCGv_i128 tcg_temp_new_i128(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_TB);
@@ -951,13 +904,6 @@ static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_ptr(t);
 }
 
-/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
-static inline TCGv_ptr tcg_temp_ebb_new_ptr(void)
-{
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
-    return temp_tcgv_ptr(t);
-}
-
 static inline TCGv_ptr tcg_temp_new_ptr(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_TB);
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index c42a436c0c..5efb8db258 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -44,6 +44,7 @@
  */
 #include "qemu/osdep.h"
 #include "tcg/tcg.h"
+#include "tcg/tcg-temp-internal.h"
 #include "tcg/tcg-op.h"
 #include "exec/exec-all.h"
 #include "exec/plugin-gen.h"
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 291a65c4bf..047a832f44 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "tcg/tcg.h"
+#include "tcg/tcg-temp-internal.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-op-gvec.h"
 #include "tcg/tcg-gvec-desc.h"
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index 966d41d65a..0f023f42c6 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "tcg/tcg.h"
+#include "tcg/tcg-temp-internal.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-mo.h"
 #include "tcg-internal.h"
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 77658a88f0..1a039a292c 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
+#include "tcg/tcg-temp-internal.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-mo.h"
 #include "exec/plugin-gen.h"
diff --git a/tcg/tcg.c b/tcg/tcg.c
index e4fccbd0d8..d2993826c8 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -60,6 +60,7 @@
 #include "elf.h"
 #include "exec/log.h"
 #include "tcg/tcg-ldst.h"
+#include "tcg/tcg-temp-internal.h"
 #include "tcg-internal.h"
 #include "accel/tcg/perf.h"
 
-- 
2.34.1



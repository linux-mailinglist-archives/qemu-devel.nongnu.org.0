Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B16F6AABD7
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 19:21:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYWTl-0006Yt-T5; Sat, 04 Mar 2023 13:19:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTd-0006W9-63
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:25 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTY-0003ML-3z
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:24 -0500
Received: by mail-pg1-x534.google.com with SMTP id d10so3280704pgt.12
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 10:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677953959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+8CMysm0nZW0ujd2x2qIzUk6AQce3kuPNlTpMMrNJw0=;
 b=p0hOZog9ngz3FphXfy2+eOPxNfLFLCNy9Hc02HYy4HjOdpdz9H37d9H3bCRPSzqBZo
 DjeibyCQVb7noFIptLR/QbxM0wBizeNASN//M7cHd2O8FWxu2PxU6oa+BX06EjDY/psL
 vUXI3IEFOabnWFQIeoJAc7fByxCDw1yx2+WtnbfAbyZ630P5YcVzxKyHt8SraDNQL4Q1
 PZmY5aH2zaSNPfmLc1I/1J3fQ95woU6ZAqolVOa9a68+iC0IenNJbNHZBtLs/fSYs2/X
 KAwCrrl96x70GIh97Vvft9HvTtNHG6l1enHqvldvdfjDl8cIggD93LxY0Jib9chmwikj
 s9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677953959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+8CMysm0nZW0ujd2x2qIzUk6AQce3kuPNlTpMMrNJw0=;
 b=n8iP8TxXZhBittFv410AWBP0FVtVAMtI3/PgoisG8gnkXVL2fSQBU/pDtFPzrRRUdj
 PLIhvZ+PR4PMbcvvGJDgFJbDFdPgO9MuVOCiL9BJp88/aXFZ5ojDjIz0iSJYva8QW1rf
 +uNe/oAjRAeae21B6yPhMvGUOoxU8BU/6jsK6TppmiW0yrrICAiH7ipU9LKO90oxeHs7
 9/0vKzDuiyrm031pO/5ynxlRKYpivPwrfUS8Y93sYRUmt/Blk+oyuTgvlv8V3nEtqh6n
 UNcWvfML6lFNG4JLxa7TpoVdP69slr9rwEzu+UBGnxYGZmrh0Hq0nV/NQq6clsLkkD6t
 M7hA==
X-Gm-Message-State: AO0yUKWrpBa+6ZyFmgYaIUu9fs3AYxrl/5UAE/C1SSNKo6prsDwpkzKK
 HkrQYFjQrdM4Kpz4pUCb1eU+CyNI7zA53TsnkPxs7A==
X-Google-Smtp-Source: AK7set/NxMhS05YC7ZzgJqwPrbUuz92EIHoCuXx0ryHPS1WFJUogGAasmxx2gTaS0I10rdI0sMOm1g==
X-Received: by 2002:a62:5243:0:b0:5dc:6dec:e9d0 with SMTP id
 g64-20020a625243000000b005dc6dece9d0mr5436149pfb.3.1677953959362; 
 Sat, 04 Mar 2023 10:19:19 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:62b1:64d8:8207:f04e])
 by smtp.gmail.com with ESMTPSA id
 25-20020aa79259000000b005d866d184b5sm3529668pfp.46.2023.03.04.10.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 10:19:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 20/20] tcg: Create tcg/tcg-temp-internal.h
Date: Sat,  4 Mar 2023 10:19:00 -0800
Message-Id: <20230304181900.1097116-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230304181900.1097116-1-richard.henderson@linaro.org>
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index e8f73115ec..43ce4bfa7d 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -855,35 +855,9 @@ void tcg_set_frame(TCGContext *s, TCGReg reg, intptr_t start, intptr_t size);
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
@@ -891,13 +865,6 @@ static inline TCGv_i32 tcg_global_mem_new_i32(TCGv_ptr reg, intptr_t offset,
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
@@ -911,26 +878,12 @@ static inline TCGv_i64 tcg_global_mem_new_i64(TCGv_ptr reg, intptr_t offset,
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
@@ -944,13 +897,6 @@ static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
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
index f2269a1b91..53e96b5b69 100644
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
index 07127bb276..a64f18db99 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -59,6 +59,7 @@
 #include "elf.h"
 #include "exec/log.h"
 #include "tcg/tcg-ldst.h"
+#include "tcg/tcg-temp-internal.h"
 #include "tcg-internal.h"
 #include "accel/tcg/perf.h"
 
-- 
2.34.1



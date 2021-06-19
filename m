Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802613ADB68
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:41:36 +0200 (CEST)
Received: from localhost ([::1]:52982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufuR-0004Cr-Ij
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufV4-0000yl-AB
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:22 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:45623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUu-0002PC-UN
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:22 -0400
Received: by mail-pf1-x429.google.com with SMTP id k6so10328338pfk.12
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Yk8M8YsYRyZDmwz+XZzO4sGMZKz1Bfw67bchE2cYjA=;
 b=HEkI5RLq7AoN/6woG8GSWz/bEWN++gtcfnbPJtsCEZ04CTtgk9wi9bcpPUdGwIDyXo
 uGzM5mVjLWgol6V9aw7mAxgEonh2iiYSpp8jwC5dJOjcl1jB6w8EoFlY5QlI6LbCeWbQ
 eVG0vPxAy0LJLxeJkxbJ9+74V40afajsr4kGnuveFm7J075IIjDYEKq8/M9QaR5MGo/y
 CLuru4jGoRVzkt3ZVNf+qJexJYDD/0WvGzq4r37Sf83FORiem5ZUL722LP+scmilNOH4
 b0j82ESkaNYj60UwMBR3dXD+Wu2DRtPjWMv8SWh63+DTxWqcoOPy3V+rRlGWC8AxGIjh
 xdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Yk8M8YsYRyZDmwz+XZzO4sGMZKz1Bfw67bchE2cYjA=;
 b=Po7Z7q74smLUVBD3piPCZivh4l7HYsulj3Tdd8WiVSXYVPR7V3lp5TsuXhmKgeT+IZ
 QaBIdQ+Muss2hW/L/VwvC1Su5zbMkHpaG9IjEcQxX7c2jfCx2hqC63+PgjN9x+hQH/7K
 LGmhakqy27+h4rlExLKeiMU99ZrbnjHAn8Gn8CyHt7jSJp5bq0A8THQXNIqriim7iRzV
 ISk3LG6i1z3Ei53EcgMINcCqIYOHiytBYza7iAnO8qgKAIulJ/R9bBBU+keCjIDlV1TV
 17T4TLKw8PeF9TGEyW7r0UVUzV6tptR8nciThYI6AJPy0MCsn2iOnDmOLsITtb9ctV2S
 4rhQ==
X-Gm-Message-State: AOAM531+pn5pIrwUVjL4i+bKrIVatCglG4lWm2GoplBpFInqmcH39dYj
 i+SthVBvJq2gkz/gu+r2qYi+uuR1RrwADg==
X-Google-Smtp-Source: ABdhPJxEygJx/P3TFElimSFffIlYI1EhB9HTL2KI9EuewOIDpy9HGMncW/fsbtZt2MH6zyV5StfM0A==
X-Received: by 2002:a63:1360:: with SMTP id 32mr16052270pgt.233.1624126511660; 
 Sat, 19 Jun 2021 11:15:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:15:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/33] tcg: expose TCGCond manipulation routines
Date: Sat, 19 Jun 2021 11:14:51 -0700
Message-Id: <20210619181452.877683-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: Alessandro Di Federico <ale@rev.ng>, peter.maydell@linaro.org,
 Paolo Montesel <babush@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

This commit moves into a separate file routines used to manipulate
TCGCond. These will be employed by the idef-parser.

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Paolo Montesel <babush@rev.ng>
Message-Id: <20210619093713.1845446-2-ale.qemu@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-cond.h | 101 +++++++++++++++++++++++++++++++++++++++++
 include/tcg/tcg.h      |  70 +---------------------------
 2 files changed, 102 insertions(+), 69 deletions(-)
 create mode 100644 include/tcg/tcg-cond.h

diff --git a/include/tcg/tcg-cond.h b/include/tcg/tcg-cond.h
new file mode 100644
index 0000000000..2a38a386d4
--- /dev/null
+++ b/include/tcg/tcg-cond.h
@@ -0,0 +1,101 @@
+/*
+ * Tiny Code Generator for QEMU
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
+#ifndef TCG_COND_H
+#define TCG_COND_H
+
+/*
+ * Conditions.  Note that these are laid out for easy manipulation by
+ * the functions below:
+ *    bit 0 is used for inverting;
+ *    bit 1 is signed,
+ *    bit 2 is unsigned,
+ *    bit 3 is used with bit 0 for swapping signed/unsigned.
+ */
+typedef enum {
+    /* non-signed */
+    TCG_COND_NEVER  = 0 | 0 | 0 | 0,
+    TCG_COND_ALWAYS = 0 | 0 | 0 | 1,
+    TCG_COND_EQ     = 8 | 0 | 0 | 0,
+    TCG_COND_NE     = 8 | 0 | 0 | 1,
+    /* signed */
+    TCG_COND_LT     = 0 | 0 | 2 | 0,
+    TCG_COND_GE     = 0 | 0 | 2 | 1,
+    TCG_COND_LE     = 8 | 0 | 2 | 0,
+    TCG_COND_GT     = 8 | 0 | 2 | 1,
+    /* unsigned */
+    TCG_COND_LTU    = 0 | 4 | 0 | 0,
+    TCG_COND_GEU    = 0 | 4 | 0 | 1,
+    TCG_COND_LEU    = 8 | 4 | 0 | 0,
+    TCG_COND_GTU    = 8 | 4 | 0 | 1,
+} TCGCond;
+
+/* Invert the sense of the comparison.  */
+static inline TCGCond tcg_invert_cond(TCGCond c)
+{
+    return (TCGCond)(c ^ 1);
+}
+
+/* Swap the operands in a comparison.  */
+static inline TCGCond tcg_swap_cond(TCGCond c)
+{
+    return c & 6 ? (TCGCond)(c ^ 9) : c;
+}
+
+/* Create an "unsigned" version of a "signed" comparison.  */
+static inline TCGCond tcg_unsigned_cond(TCGCond c)
+{
+    return c & 2 ? (TCGCond)(c ^ 6) : c;
+}
+
+/* Create a "signed" version of an "unsigned" comparison.  */
+static inline TCGCond tcg_signed_cond(TCGCond c)
+{
+    return c & 4 ? (TCGCond)(c ^ 6) : c;
+}
+
+/* Must a comparison be considered unsigned?  */
+static inline bool is_unsigned_cond(TCGCond c)
+{
+    return (c & 4) != 0;
+}
+
+/*
+ * Create a "high" version of a double-word comparison.
+ * This removes equality from a LTE or GTE comparison.
+ */
+static inline TCGCond tcg_high_cond(TCGCond c)
+{
+    switch (c) {
+    case TCG_COND_GE:
+    case TCG_COND_LE:
+    case TCG_COND_GEU:
+    case TCG_COND_LEU:
+        return (TCGCond)(c ^ 8);
+    default:
+        return c;
+    }
+}
+
+#endif /* TCG_COND_H */
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 236315b682..41a6c4bfe5 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -33,6 +33,7 @@
 #include "tcg/tcg-mo.h"
 #include "tcg-target.h"
 #include "qemu/int128.h"
+#include "tcg/tcg-cond.h"
 
 /* XXX: make safe guess about sizes */
 #define MAX_OP_PER_INSTR 266
@@ -407,75 +408,6 @@ typedef TCGv_ptr TCGv_env;
 /* Used to align parameters.  See the comment before tcgv_i32_temp.  */
 #define TCG_CALL_DUMMY_ARG      ((TCGArg)0)
 
-/* Conditions.  Note that these are laid out for easy manipulation by
-   the functions below:
-     bit 0 is used for inverting;
-     bit 1 is signed,
-     bit 2 is unsigned,
-     bit 3 is used with bit 0 for swapping signed/unsigned.  */
-typedef enum {
-    /* non-signed */
-    TCG_COND_NEVER  = 0 | 0 | 0 | 0,
-    TCG_COND_ALWAYS = 0 | 0 | 0 | 1,
-    TCG_COND_EQ     = 8 | 0 | 0 | 0,
-    TCG_COND_NE     = 8 | 0 | 0 | 1,
-    /* signed */
-    TCG_COND_LT     = 0 | 0 | 2 | 0,
-    TCG_COND_GE     = 0 | 0 | 2 | 1,
-    TCG_COND_LE     = 8 | 0 | 2 | 0,
-    TCG_COND_GT     = 8 | 0 | 2 | 1,
-    /* unsigned */
-    TCG_COND_LTU    = 0 | 4 | 0 | 0,
-    TCG_COND_GEU    = 0 | 4 | 0 | 1,
-    TCG_COND_LEU    = 8 | 4 | 0 | 0,
-    TCG_COND_GTU    = 8 | 4 | 0 | 1,
-} TCGCond;
-
-/* Invert the sense of the comparison.  */
-static inline TCGCond tcg_invert_cond(TCGCond c)
-{
-    return (TCGCond)(c ^ 1);
-}
-
-/* Swap the operands in a comparison.  */
-static inline TCGCond tcg_swap_cond(TCGCond c)
-{
-    return c & 6 ? (TCGCond)(c ^ 9) : c;
-}
-
-/* Create an "unsigned" version of a "signed" comparison.  */
-static inline TCGCond tcg_unsigned_cond(TCGCond c)
-{
-    return c & 2 ? (TCGCond)(c ^ 6) : c;
-}
-
-/* Create a "signed" version of an "unsigned" comparison.  */
-static inline TCGCond tcg_signed_cond(TCGCond c)
-{
-    return c & 4 ? (TCGCond)(c ^ 6) : c;
-}
-
-/* Must a comparison be considered unsigned?  */
-static inline bool is_unsigned_cond(TCGCond c)
-{
-    return (c & 4) != 0;
-}
-
-/* Create a "high" version of a double-word comparison.
-   This removes equality from a LTE or GTE comparison.  */
-static inline TCGCond tcg_high_cond(TCGCond c)
-{
-    switch (c) {
-    case TCG_COND_GE:
-    case TCG_COND_LE:
-    case TCG_COND_GEU:
-    case TCG_COND_LEU:
-        return (TCGCond)(c ^ 8);
-    default:
-        return c;
-    }
-}
-
 typedef enum TCGTempVal {
     TEMP_VAL_DEAD,
     TEMP_VAL_REG,
-- 
2.25.1



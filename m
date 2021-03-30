Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC0934EAA9
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 16:40:36 +0200 (CEST)
Received: from localhost ([::1]:54790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRFXn-0004x0-8y
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 10:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lRFVc-000301-Ny
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:38:20 -0400
Received: from rev.ng ([5.9.113.41]:39183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lRFVa-0004v8-FK
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2RwTHTorS670vO4eCktAe3M0cB7xAsEMv6yPznJKvhs=; b=VV7zYk2fBwmAelF5Zeu75J0Nzn
 ZwZ5Am8ts6Sx9cC2j/tC92eNVqYr3yua7pchbZB9pYFB4uV7f1mSOtuG9sspcktztsorqNv16dT1t
 OeonK+qddbsqNP3ezr4gxFBGi+kcpoEoQwv32Frz7MDNIyORaQsfU7Em+bQf3Lv2nHrY=;
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 philmd@redhat.com, richard.henderson@linaro.org,
 Alessandro Di Federico <ale@rev.ng>
Subject: [PATCH v3 01/12] tcg: expose TCGCond manipulation routines
Date: Tue, 30 Mar 2021 16:37:39 +0200
Message-Id: <20210330143750.3037824-2-ale.qemu@rev.ng>
In-Reply-To: <20210330143750.3037824-1-ale.qemu@rev.ng>
References: <20210330143750.3037824-1-ale.qemu@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alessandro Di Federico <ale.qemu@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

This commit moves into a separate file routines used to manipulate
TCGCond. These will be employed by the idef-parser.

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Paolo Montesel <babush@rev.ng>
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
index 0f0695e90d..3dc468ebd8 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -34,6 +34,7 @@
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
2.31.1



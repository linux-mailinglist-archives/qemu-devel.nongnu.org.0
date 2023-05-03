Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 861D36F51D6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:38:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tW-0004Ye-Rz; Wed, 03 May 2023 03:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tN-0003xf-6T
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:13 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tL-0005ce-1O
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:12 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso29149925e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098829; x=1685690829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xd2AyLWHfL7nMXWfsFoMvsK6i0qMKcBbZmk4IdtvNsM=;
 b=wE44yUeHbqWR8Jb0P0N0wZ+UaeQwSFrInRzHDtsItoduMMCYFWNp22Db987HKsoaKJ
 cY8ACIqJ3xEHnVEYBeMZHX9FWlMONUmCSOdJ5PGBK5jpTBAjzj7bQEvbU4LL4w7G1K2B
 WPM35CSzIpBBHzB5zBquqC5u70SCxr5awAUwMqFoDRxZ7kCBl9c12blUrNGdJmz4s1w4
 oPgDysDD6hUXFiv5trPxI3IlZBMShKcP70A/hNGFi+7ruDTruR9qbb6y5aogFgC2uFlm
 CAPiW4u2u/DlL2R9nJAtw4aX1Vam6tyzZ6lkmI1e5Er2QC5rEUqcDI0KTwQoY20M9CD0
 dzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098829; x=1685690829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xd2AyLWHfL7nMXWfsFoMvsK6i0qMKcBbZmk4IdtvNsM=;
 b=E3Ql9PDfHvlIDSPPptxlMxZ+0RxB/LrwtGv7m1ER6f0OLaGWxdXoz1nKCc3FrCgjRT
 7k5r3U8PCQzGVgiZ3d9eqJBBEH8UrRrDxnmky+8QkyHa6E1/+/kT8fl6MKJoj7DtH0ek
 LLkASr3QC2I14iOoqLuBQgXlxd0SS03J/ejln89+FkFfMAPLY351LtQsy0Kp2vHq06sM
 eov/QEipbUrMtnRkU0jge49RorCsoI4AKaXw8IFa+6wEHC+bxmpOHbP/aLaJbjAv3wYR
 ScPP/VVvZkxr4PATciz1hW+kRV7PjClheRYxmwCjUlHfBzaybjmpmzp2pEkLYiLJChSM
 JRbg==
X-Gm-Message-State: AC+VfDyJNzW6SaGxI6PnqcehkEqIJOa+UX1ATUxqwTEXN0ryqjrKIC9G
 wMkarcuoafpoUypWylBfY01CUjYUVrNxKnvs9GeCbg==
X-Google-Smtp-Source: ACHHUZ7O3wZwsr/BwBWJMUrHc2TWaEp6Ttl6X1rnxXoWG4/lIEWS7UttR+IGk37jv4HArRR9WDKqIQ==
X-Received: by 2002:a7b:cbcb:0:b0:3f0:310c:e3cf with SMTP id
 n11-20020a7bcbcb000000b003f0310ce3cfmr13355611wmi.37.1683098829148; 
 Wed, 03 May 2023 00:27:09 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 48/84] tcg: Move TCGHelperInfo and dependencies to
 tcg/helper-info.h
Date: Wed,  3 May 2023 08:22:55 +0100
Message-Id: <20230503072331.1747057-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This will be required outside of tcg-internal.h soon.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/helper-info.h | 59 +++++++++++++++++++++++++++++++++++++++
 tcg/tcg-internal.h        | 47 +------------------------------
 2 files changed, 60 insertions(+), 46 deletions(-)
 create mode 100644 include/tcg/helper-info.h

diff --git a/include/tcg/helper-info.h b/include/tcg/helper-info.h
new file mode 100644
index 0000000000..f65f81c2e7
--- /dev/null
+++ b/include/tcg/helper-info.h
@@ -0,0 +1,59 @@
+/*
+ * TCG Helper Infomation Structure
+ *
+ * Copyright (c) 2023 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef TCG_HELPER_INFO_H
+#define TCG_HELPER_INFO_H
+
+#ifdef CONFIG_TCG_INTERPRETER
+#include <ffi.h>
+#endif
+
+/*
+ * Describe the calling convention of a given argument type.
+ */
+typedef enum {
+    TCG_CALL_RET_NORMAL,         /* by registers */
+    TCG_CALL_RET_BY_REF,         /* for i128, by reference */
+    TCG_CALL_RET_BY_VEC,         /* for i128, by vector register */
+} TCGCallReturnKind;
+
+typedef enum {
+    TCG_CALL_ARG_NORMAL,         /* by registers (continuing onto stack) */
+    TCG_CALL_ARG_EVEN,           /* like normal, but skipping odd slots */
+    TCG_CALL_ARG_EXTEND,         /* for i32, as a sign/zero-extended i64 */
+    TCG_CALL_ARG_EXTEND_U,       /*      ... as a zero-extended i64 */
+    TCG_CALL_ARG_EXTEND_S,       /*      ... as a sign-extended i64 */
+    TCG_CALL_ARG_BY_REF,         /* for i128, by reference, first */
+    TCG_CALL_ARG_BY_REF_N,       /*       ... by reference, subsequent */
+} TCGCallArgumentKind;
+
+typedef struct TCGCallArgumentLoc {
+    TCGCallArgumentKind kind    : 8;
+    unsigned arg_slot           : 8;
+    unsigned ref_slot           : 8;
+    unsigned arg_idx            : 4;
+    unsigned tmp_subindex       : 2;
+} TCGCallArgumentLoc;
+
+typedef struct TCGHelperInfo {
+    void *func;
+    const char *name;
+#ifdef CONFIG_TCG_INTERPRETER
+    ffi_cif *cif;
+#endif
+    unsigned typemask           : 32;
+    unsigned flags              : 8;
+    unsigned nr_in              : 8;
+    unsigned nr_out             : 8;
+    TCGCallReturnKind out_kind  : 8;
+
+    /* Maximum physical arguments are constrained by TCG_TYPE_I128. */
+    TCGCallArgumentLoc in[MAX_CALL_IARGS * (128 / TCG_TARGET_REG_BITS)];
+} TCGHelperInfo;
+
+#endif /* TCG_HELPER_INFO_H */
diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 67b698bd5c..fbe62b31b8 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -25,55 +25,10 @@
 #ifndef TCG_INTERNAL_H
 #define TCG_INTERNAL_H
 
-#ifdef CONFIG_TCG_INTERPRETER
-#include <ffi.h>
-#endif
+#include "tcg/helper-info.h"
 
 #define TCG_HIGHWATER 1024
 
-/*
- * Describe the calling convention of a given argument type.
- */
-typedef enum {
-    TCG_CALL_RET_NORMAL,         /* by registers */
-    TCG_CALL_RET_BY_REF,         /* for i128, by reference */
-    TCG_CALL_RET_BY_VEC,         /* for i128, by vector register */
-} TCGCallReturnKind;
-
-typedef enum {
-    TCG_CALL_ARG_NORMAL,         /* by registers (continuing onto stack) */
-    TCG_CALL_ARG_EVEN,           /* like normal, but skipping odd slots */
-    TCG_CALL_ARG_EXTEND,         /* for i32, as a sign/zero-extended i64 */
-    TCG_CALL_ARG_EXTEND_U,       /*      ... as a zero-extended i64 */
-    TCG_CALL_ARG_EXTEND_S,       /*      ... as a sign-extended i64 */
-    TCG_CALL_ARG_BY_REF,         /* for i128, by reference, first */
-    TCG_CALL_ARG_BY_REF_N,       /*       ... by reference, subsequent */
-} TCGCallArgumentKind;
-
-typedef struct TCGCallArgumentLoc {
-    TCGCallArgumentKind kind    : 8;
-    unsigned arg_slot           : 8;
-    unsigned ref_slot           : 8;
-    unsigned arg_idx            : 4;
-    unsigned tmp_subindex       : 2;
-} TCGCallArgumentLoc;
-
-typedef struct TCGHelperInfo {
-    void *func;
-    const char *name;
-#ifdef CONFIG_TCG_INTERPRETER
-    ffi_cif *cif;
-#endif
-    unsigned typemask           : 32;
-    unsigned flags              : 8;
-    unsigned nr_in              : 8;
-    unsigned nr_out             : 8;
-    TCGCallReturnKind out_kind  : 8;
-
-    /* Maximum physical arguments are constrained by TCG_TYPE_I128. */
-    TCGCallArgumentLoc in[MAX_CALL_IARGS * (128 / TCG_TARGET_REG_BITS)];
-} TCGHelperInfo;
-
 extern TCGContext tcg_init_ctx;
 extern TCGContext **tcg_ctxs;
 extern unsigned int tcg_cur_ctxs;
-- 
2.34.1



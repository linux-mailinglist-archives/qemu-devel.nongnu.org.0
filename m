Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5596C343FB3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:28:32 +0100 (CET)
Received: from localhost ([::1]:50060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIjX-0001Vu-E1
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOIfq-0006Zi-FY
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:24:42 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOIfo-0005Fi-FL
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:24:42 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x13so16264351wrs.9
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 04:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cDSXceljWqcXDx04k32YsIurC/KdJcDt8gGgRtwSfiY=;
 b=Gornl2f/h+Pp18smoGCzIQJsGW+mnBR7NalkLcGdIa3V9pZZ9fIATwCtkFJrLL01ZW
 D8/C5Zp2Dnk7qfbinotedDKe5QQBoKUldtKlqYqqBJkZFo1NvrG19riHKz9/Kv/AM48W
 ydXZPBGh7DlSbe/C2D/tFnpriwEzvBLgy72Om+VJjnSp+hjLtZXRvi4DSVHAxWZ2w9hX
 m4tofyMiprES0Z+mQhN3+gk/z8o47xKGRGNNmSyPHkhfuFSp5tKMMloPpJyXXwLy/DXP
 ZZWh3AIbum4lJeUZv6RW95oUKnQPCqteinNu0ZHa0iTp1QfV3TADU8fTgFbrRyNx9VwL
 LuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cDSXceljWqcXDx04k32YsIurC/KdJcDt8gGgRtwSfiY=;
 b=ZYwZp2+0QWhJexguxp3bSJ7O2PImRxQMm3DDckN+eHWBcbZ5meoUTtLYgSabguOJ3v
 6mIpY37lIOCcx7K0COWH4becGBqwXZea9/onJruv/2ApOoyKFVyLSFK589CGcen18mi/
 tWORGLFKCtfHu+IG9RASiELpb0xljGthwqXMwNpQG4Luz6/V8kH231KL9c5GPYGxAPvw
 ATKRaHQ50nfdA5ugYTibBTva0UIseJmKAKBTDpooj9YlaRMVI0dSNymswADlWgMN7z1p
 OnsqTERdtCpadG6kK/vILntNRNB4qhcqjzrfp39aZai1L6HZuP33MuHySmU11RWZ/8Kr
 j5bg==
X-Gm-Message-State: AOAM530gEXV7YvZdQWSjYoBPGT8uyse1zxedBGERRp8UiFIBRVShDT9Z
 a+9zVs+RQS1lxF0lChqJ5yfMB8p7mfBJTw==
X-Google-Smtp-Source: ABdhPJwngemH6Nwvr6xCTfsxQGu+ca66n2V7IBBBxnzu+QB00V79T5K1BNw4+dTI3l6hHsP6wTscEw==
X-Received: by 2002:adf:ab52:: with SMTP id r18mr17611488wrc.65.1616412278516; 
 Mon, 22 Mar 2021 04:24:38 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q15sm19239794wrx.56.2021.03.22.04.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 04:24:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] exec: Extract 'page-vary.h' header
Date: Mon, 22 Mar 2021 12:24:25 +0100
Message-Id: <20210322112427.4045204-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322112427.4045204-1-f4bug@amsat.org>
References: <20210322112427.4045204-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

In the next commit we will extract the generic code out of
page-vary.c, only keeping the target specific code. Both
files will use the same TargetPageBits structure, so make
its declaration in a shared header.

As the common header can not use target specific types,
use a uint64_t to hold the page mask value, and add a
cast back to target_long in the TARGET_PAGE_MASK definitions.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/cpu-all.h   | 11 ++++-------
 include/exec/page-vary.h | 29 +++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 7 deletions(-)
 create mode 100644 include/exec/page-vary.h

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 76443eb11d5..b0a422c7b62 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -215,11 +215,7 @@ static inline void stl_phys_notdirty(AddressSpace *as, hwaddr addr, uint32_t val
 /* page related stuff */
 
 #ifdef TARGET_PAGE_BITS_VARY
-typedef struct {
-    bool decided;
-    int bits;
-    target_long mask;
-} TargetPageBits;
+# include "exec/page-vary.h"
 #if defined(CONFIG_ATTRIBUTE_ALIAS) || !defined(IN_EXEC_VARY)
 extern const TargetPageBits target_page;
 #else
@@ -227,10 +223,11 @@ extern TargetPageBits target_page;
 #endif
 #ifdef CONFIG_DEBUG_TCG
 #define TARGET_PAGE_BITS   ({ assert(target_page.decided); target_page.bits; })
-#define TARGET_PAGE_MASK   ({ assert(target_page.decided); target_page.mask; })
+#define TARGET_PAGE_MASK   ({ assert(target_page.decided); \
+                              (target_long)target_page.mask; })
 #else
 #define TARGET_PAGE_BITS   target_page.bits
-#define TARGET_PAGE_MASK   target_page.mask
+#define TARGET_PAGE_MASK   ((target_long)target_page.mask)
 #endif
 #define TARGET_PAGE_SIZE   (-(int)TARGET_PAGE_MASK)
 #else
diff --git a/include/exec/page-vary.h b/include/exec/page-vary.h
new file mode 100644
index 00000000000..799d6310d6c
--- /dev/null
+++ b/include/exec/page-vary.h
@@ -0,0 +1,29 @@
+/*
+ * Definitions for cpus with variable page sizes.
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef EXEC_PAGE_VARY_H
+#define EXEC_PAGE_VARY_H
+
+typedef struct {
+    bool decided;
+    int bits;
+    uint64_t mask;
+} TargetPageBits;
+
+#endif /* EXEC_PAGE_VARY_H */
-- 
2.26.2



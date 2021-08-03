Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDEB3DE54B
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:26:40 +0200 (CEST)
Received: from localhost ([::1]:34648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAm0m-0000hm-0s
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpl-0003gy-1X
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:17 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpj-0002Lr-69
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:16 -0400
Received: by mail-pj1-x1034.google.com with SMTP id mt6so28092162pjb.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J9rPOAfrVBDrqHtq45P5qdmr5bo/FAMYzfvKwys2uDA=;
 b=LZHMz383E0s5qbMKlKlD06iVz+jgXTfsdjKOHxHbKa5v/T5hqHrS9mCeFZh78pEm2w
 8/1MSNyh8LKHYURw41DGCke27jPlWIp9YQ+Zmb/E/DiorBleeSv528tBNGEHzYIU4qhB
 0htb502A6KO0vePZgQM6jOFteJ87cJra7wYRKWZ2KvOmAzidrdJo4hSZUxVvi5likgdf
 M8leUis3Pvp3tB68sIlxHzS+f4G+i8EzMegu1Lc/KVosNRTCTt8TtehCeChqD9acE3do
 GfBCMn4l09BfW+mOme7ZkYdtgbFv6X3ltjwYb5a6I70iNsxT4uk5xqS8F2TPwZKByNxP
 Lc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J9rPOAfrVBDrqHtq45P5qdmr5bo/FAMYzfvKwys2uDA=;
 b=NOgOXdrJ44iwCRD2aFe5npEg42+0k1A5IBzuie8d7ZRGaZLJ8AqER7UoknMmF3ODEI
 rzPRlRHMNh1FZ57gevona+1RajLBYfbjIpI5hSwyShnEgT0vrulAdLXLVaoClAjpS0C6
 Vng+D6rSTddKMV7tN88NI53ao/szY4KRSXEaLobab4L2MVzFSBXzNKb9/vfwTTbFwteW
 s7YbQ/EVtR/gjZHCb+h7K6W7J+QfSmJjZPCYdggAEbF8hqxAN8xAjsTP6oFcipaEncau
 DJQVmWqRTGSlsyVQofJ/FPTfMNNtzaKsK3SGMf5A3LgOJxU1/ibsjr0RcYexlrzkcBx1
 750A==
X-Gm-Message-State: AOAM5316sQTmmrBWVw7PlSGAfwoDlwDz/BplJ5FHwFOVuP8Jp7i4tky8
 8LPrfX1IBKloGyObto6VTbWp7qtr+VCjPg==
X-Google-Smtp-Source: ABdhPJxzw47J4pfSOikTnB91eilGmzrsmP8nU3jvs4AW6vIjlJZD0R9m1O8/r2weOm9csAm3W3DSdQ==
X-Received: by 2002:a63:c22:: with SMTP id b34mr58962pgl.422.1627964113913;
 Mon, 02 Aug 2021 21:15:13 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/55] tcg: Split out MemOpIdx to exec/memopidx.h
Date: Mon,  2 Aug 2021 18:14:12 -1000
Message-Id: <20210803041443.55452-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move this code from tcg/tcg.h to its own header.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memopidx.h | 55 +++++++++++++++++++++++++++++++++++++++++
 include/tcg/tcg.h       | 39 +----------------------------
 2 files changed, 56 insertions(+), 38 deletions(-)
 create mode 100644 include/exec/memopidx.h

diff --git a/include/exec/memopidx.h b/include/exec/memopidx.h
new file mode 100644
index 0000000000..83bce97874
--- /dev/null
+++ b/include/exec/memopidx.h
@@ -0,0 +1,55 @@
+/*
+ * Combine the MemOp and mmu_idx parameters into a single value.
+ *
+ * Authors:
+ *  Richard Henderson <rth@twiddle.net>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef EXEC_MEMOPIDX_H
+#define EXEC_MEMOPIDX_H 1
+
+#include "exec/memop.h"
+
+typedef uint32_t MemOpIdx;
+
+/**
+ * make_memop_idx
+ * @op: memory operation
+ * @idx: mmu index
+ *
+ * Encode these values into a single parameter.
+ */
+static inline MemOpIdx make_memop_idx(MemOp op, unsigned idx)
+{
+#ifdef CONFIG_DEBUG_TCG
+    assert(idx <= 15);
+#endif
+    return (op << 4) | idx;
+}
+
+/**
+ * get_memop
+ * @oi: combined op/idx parameter
+ *
+ * Extract the memory operation from the combined value.
+ */
+static inline MemOp get_memop(MemOpIdx oi)
+{
+    return oi >> 4;
+}
+
+/**
+ * get_mmuidx
+ * @oi: combined op/idx parameter
+ *
+ * Extract the mmu index from the combined value.
+ */
+static inline unsigned get_mmuidx(MemOpIdx oi)
+{
+    return oi & 15;
+}
+
+#endif
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index f91ebd0743..e67ef34694 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -27,6 +27,7 @@
 
 #include "cpu.h"
 #include "exec/memop.h"
+#include "exec/memopidx.h"
 #include "qemu/bitops.h"
 #include "qemu/plugin.h"
 #include "qemu/queue.h"
@@ -1147,44 +1148,6 @@ static inline size_t tcg_current_code_size(TCGContext *s)
     return tcg_ptr_byte_diff(s->code_ptr, s->code_buf);
 }
 
-/* Combine the MemOp and mmu_idx parameters into a single value.  */
-typedef uint32_t MemOpIdx;
-
-/**
- * make_memop_idx
- * @op: memory operation
- * @idx: mmu index
- *
- * Encode these values into a single parameter.
- */
-static inline MemOpIdx make_memop_idx(MemOp op, unsigned idx)
-{
-    tcg_debug_assert(idx <= 15);
-    return (op << 4) | idx;
-}
-
-/**
- * get_memop
- * @oi: combined op/idx parameter
- *
- * Extract the memory operation from the combined value.
- */
-static inline MemOp get_memop(MemOpIdx oi)
-{
-    return oi >> 4;
-}
-
-/**
- * get_mmuidx
- * @oi: combined op/idx parameter
- *
- * Extract the mmu index from the combined value.
- */
-static inline unsigned get_mmuidx(MemOpIdx oi)
-{
-    return oi & 15;
-}
-
 /**
  * tcg_qemu_tb_exec:
  * @env: pointer to CPUArchState for the CPU
-- 
2.25.1



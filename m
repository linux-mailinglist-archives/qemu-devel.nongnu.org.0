Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4F242413F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:24:16 +0200 (CEST)
Received: from localhost ([::1]:59170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY8mE-0006d7-Lc
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8ie-0002KF-AV
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:32 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:45852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8iU-0007h3-Db
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:28 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so2559861pjb.4
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FpNwQ0HRi56DgwyroVMnJICST8kXE9rLr7CLkanbYEk=;
 b=jMQ/hU+fDRh2uBRKhvv+fwPyszev5K2YYHwmFmZ6TJ7Od7BnCRaoyykJ3n5IOVZVYs
 ZD9e7oH5H4EPGNfgLBUCfpc5g6W6v/JvADDkI/lWzK6asPHnl+3tm5AP1QvfxcEpCYTI
 LQ76LbGhUXL59M7bbNgsbVuafYQ/nwCdE5BBPL0Tl07bd9WZce9wQZ5o/CuKt3Fp9Z+u
 tCxLJ2gF8iH0u2Oy9nefX79ZyDZZasAkdoK1vHbDRATNS50IMRSlGx/Wu4kIx1Nx72C7
 WUwUIXOv4UoMdxHurde/Rm8dczfoKGS9pBcP3bdc8leToWqQR+RFdtaMsTo+MRpGm96Y
 EYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FpNwQ0HRi56DgwyroVMnJICST8kXE9rLr7CLkanbYEk=;
 b=jztxGJVssxZOlR/aKpaH42mWm2ABksCKJd57yuct59wc9Ck31HzCVuLPZr16qGEd80
 ncq7J6gAN8WYKWXSJC8erXmOLGzjFyASybk8w7bpNydl8p+afZGKeAC9J4ynj9l1VhFO
 j3DQpZj+Jr5vI73oPojk+V1B+ZZjUw7A+Bk+zsRmZTn6+FuG90E411/PiP/Og4f85LK8
 LPVTpWmTxauO1tU2dcaXPJoyeznTG372GoTPO0Wkyvy0gnL0Px3Lr91+HFgrdXjZNWwk
 q07cXk8t1/TBOFpqM18FkGQDhBb5Oshzd8gtKQODnxuoe+J8oD2BRofbw0Fl1/Ni4BuD
 Artg==
X-Gm-Message-State: AOAM5331cy5Afce63yBaOBA8vDYpAhyNpZzr9dZ3P5r+Kvz6BijVgS4B
 PWOTFFWohmKrmyF3lNDsd25S8mEM1Df8hw==
X-Google-Smtp-Source: ABdhPJyQFoZv+mKhfBBlB6wjOaX2aoZO6iKAw0Q67olZv1a7Fq2Olg98CFQqGMx8yT/RT3C6Yux/Tg==
X-Received: by 2002:a17:902:9b88:b0:13e:55b1:2939 with SMTP id
 y8-20020a1709029b8800b0013e55b12939mr11424229plp.80.1633533620669; 
 Wed, 06 Oct 2021 08:20:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/28] tcg: Split out MemOpIdx to exec/memopidx.h
Date: Wed,  6 Oct 2021 08:19:53 -0700
Message-Id: <20211006152014.741026-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
References: <20211006152014.741026-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
index 1a0da58f92..ba13ab1151 100644
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



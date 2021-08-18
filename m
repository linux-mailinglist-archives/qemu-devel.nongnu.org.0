Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7982A3F0C06
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:45:08 +0200 (CEST)
Received: from localhost ([::1]:60240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRUp-00054q-4V
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6S-0000pj-L4
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:57 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:46692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6R-0000E4-0Y
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:56 -0400
Received: by mail-pl1-x62a.google.com with SMTP id u15so2399594plg.13
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J9rPOAfrVBDrqHtq45P5qdmr5bo/FAMYzfvKwys2uDA=;
 b=cdtUjyXS35y2pGK4b6oyoA7lhXky3Y11iGvONs4ntpD96WHsjdnJvF/CFtKwIiqicI
 qdZSA6z+/zvcE3Ou1MqRf+9gHFCoXEO4F5yJT9moBFUyfvb0ww27P5KHcenyFWVXEnNK
 irDQCnc62YxSZCHc5VwtKKjJdCO+wI9Dr6/NJuNSa6KI1sEdABU3IGrSc5qmlUcNxphL
 sQPJ6kkYKUbp2uCHTXxoFy8dLodrV94P/MO1dBYqLwwjERXnYFpCL8A/3f2MuJoW6Di6
 0T+1oalnlPb4PVac7Mgp0e6+JLrh2TF5gaqA8msDp5i6lV+oGLsc2gL8olrlxf5x+6hX
 xevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J9rPOAfrVBDrqHtq45P5qdmr5bo/FAMYzfvKwys2uDA=;
 b=ZQuy0rgULo1z7IhoUKIfxnJAyU3ZOb9vIR+eM0k4Ytoh9wecaTsPHDa3C6M3Ph7VDq
 s3Z2ZdzJGkDDyPcBgVEZd6NSWXEjMV/SMTf5UzKcYXia3X07KVzpPOciskqTTJmz6nBg
 G9LTdYS5jcDZoxrcICmDLopUR1+PB/slZTapw2jT9h/IhZ4aWRyTkMeCRWFtZG32kA6x
 1yhM9ZC4wy+j7FsliBHMtjmYLAp4YfqBKDJs2Y3r6hnzXTFcoBD0Vduk5sd/bS0Cxb5N
 HNWtWo9nppfjh3dMQDFPBP+2b0xy64dd4p9ZZ6h29KJqo12c6sq6IkfjTQrUqbP0Fp9x
 U/3g==
X-Gm-Message-State: AOAM532PsXg2CCMhmJuYklZRLeLf95FtH4RZWsNo16hSlEBiqMQso+hK
 Id4fs2KFA0cF4Rd1UfMis01uNH4YMx0bOA==
X-Google-Smtp-Source: ABdhPJwTXk898KZIxAiTG6/8/ac0Q2vU2OK5Blq2Aagkb4xt91kEFlkOgxTSISDbOxbDZsbJldoLIg==
X-Received: by 2002:a17:902:8f8b:b029:12c:d085:7918 with SMTP id
 z11-20020a1709028f8bb029012cd0857918mr8535034plo.10.1629314393410; 
 Wed, 18 Aug 2021 12:19:53 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/66] tcg: Split out MemOpIdx to exec/memopidx.h
Date: Wed, 18 Aug 2021 09:18:39 -1000
Message-Id: <20210818191920.390759-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DC264BE67
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:29:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cmh-0000bt-An; Tue, 13 Dec 2022 16:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmf-0000b9-Hm
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:25:53 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmd-0003DK-OO
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:25:53 -0500
Received: by mail-oi1-x231.google.com with SMTP id m204so1037829oib.6
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vcQlxYY7mFIcT5pvKb1eZPHlZnAn92mI9Ka1689AM7M=;
 b=t29JFW9WGAPib60zxr+mdozspVkf/RZ0Dvi9AOFfDlq6lSEgD+0jtgerkKBHhWRD6f
 Z/L8N8MR5CW3aIE3hN/Cxo/TsmX4Sr1TBI5zFJVJnpgb9kA9K5AzihFu8VZfaf3+jEY3
 QVV5o+knYTwmL6TSWZpgMof9GfKjfWsJ7f0TkQaT7cMv/bC/Sdo4u1w1xnmj/cfiw5Ci
 cMqmv/toL2I/fFk/yZlFf3JGIvKHB3tELMq2DmopQd+bn5Vgb8ZKlT7aH0RND8Pk3nzB
 OeNCbDYvJAdBB+1m8YxjT18lojX30G2NC2bwCzrrIYee3QP4DJ3DoGt4RIW81sqiIp0s
 pFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vcQlxYY7mFIcT5pvKb1eZPHlZnAn92mI9Ka1689AM7M=;
 b=eM2FNpLbM6fg2DdvIb8PMoUurYIcXY76MV4NEy9I5VjjMNHtA02F+xCnT8xPg1Dutp
 JAzRpA+ybujv/WpGN0XJI1FDfe6gig8H9+0f7R2pZVx3NVCapfp0iOAyuXnaiR+Xf3J0
 QsfYGpPIff5QSfmpki8XTGvFN8JnwMuza0TzQ0C6FjaCamGlPmtmI+o6ofpJu11ed8YW
 JAs/DHxn3YPk+jFOxiNyTKlW2RvWa6FSXJdRz03baNH3i86wx5swedGSBjklxsp+AwJk
 qiprJkQX6jT+dvUVLpLwnn575V+R+4kKyRpijS6COycJtDd1tGPL9GgW5Wf5/9L63VuC
 ZYOw==
X-Gm-Message-State: ANoB5pnpUomAHzNCzS2qWXiizSHmPyYCSYLshwCjNEhdw+MThyjDwuCV
 zDgr9wWIrniEXHcsY4ElG3rHZcLGfB3pohUdQXE=
X-Google-Smtp-Source: AA0mqf7ZNohG0AEVsYzsPMNfVpKS19+onjE9ZjdGg/vWKaCc0kzYKzYavm/L6FL+0/nuUenZCMlTNQ==
X-Received: by 2002:a05:6808:355:b0:35c:4d3a:6ce4 with SMTP id
 j21-20020a056808035500b0035c4d3a6ce4mr10147906oie.54.1670966750475; 
 Tue, 13 Dec 2022 13:25:50 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0035c073aa0d8sm5006831oic.18.2022.12.13.13.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:25:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 07/27] tcg: Move TCG_{LOW,HIGH} to tcg-internal.h
Date: Tue, 13 Dec 2022 15:25:21 -0600
Message-Id: <20221213212541.1820840-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213212541.1820840-1-richard.henderson@linaro.org>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Move the error-generating fallback from tcg-op.c, and
replace "_link_error" with modern QEMU_ERROR markup.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h | 33 +++++----------------------------
 include/tcg/tcg.h    | 12 ------------
 tcg/tcg-internal.h   | 14 ++++++++++++++
 tcg/tcg-op-vec.c     |  2 ++
 tcg/tcg-op.c         | 37 ++++++++++++++++++++++++++++---------
 5 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 209e168305..8176f194cb 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -667,35 +667,12 @@ static inline void tcg_gen_mul_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
     tcg_gen_op3_i64(INDEX_op_mul_i64, ret, arg1, arg2);
 }
 #else /* TCG_TARGET_REG_BITS == 32 */
-static inline void tcg_gen_st8_i64(TCGv_i64 arg1, TCGv_ptr arg2,
-                                   tcg_target_long offset)
-{
-    tcg_gen_st8_i32(TCGV_LOW(arg1), arg2, offset);
-}
+void tcg_gen_st8_i64(TCGv_i64 arg1, TCGv_ptr arg2, tcg_target_long offset);
+void tcg_gen_st16_i64(TCGv_i64 arg1, TCGv_ptr arg2, tcg_target_long offset);
+void tcg_gen_st32_i64(TCGv_i64 arg1, TCGv_ptr arg2, tcg_target_long offset);
 
-static inline void tcg_gen_st16_i64(TCGv_i64 arg1, TCGv_ptr arg2,
-                                    tcg_target_long offset)
-{
-    tcg_gen_st16_i32(TCGV_LOW(arg1), arg2, offset);
-}
-
-static inline void tcg_gen_st32_i64(TCGv_i64 arg1, TCGv_ptr arg2,
-                                    tcg_target_long offset)
-{
-    tcg_gen_st_i32(TCGV_LOW(arg1), arg2, offset);
-}
-
-static inline void tcg_gen_add_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
-{
-    tcg_gen_add2_i32(TCGV_LOW(ret), TCGV_HIGH(ret), TCGV_LOW(arg1),
-                     TCGV_HIGH(arg1), TCGV_LOW(arg2), TCGV_HIGH(arg2));
-}
-
-static inline void tcg_gen_sub_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
-{
-    tcg_gen_sub2_i32(TCGV_LOW(ret), TCGV_HIGH(ret), TCGV_LOW(arg1),
-                     TCGV_HIGH(arg1), TCGV_LOW(arg2), TCGV_HIGH(arg2));
-}
+void tcg_gen_add_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2);
+void tcg_gen_sub_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2);
 
 void tcg_gen_discard_i64(TCGv_i64 arg);
 void tcg_gen_mov_i64(TCGv_i64 ret, TCGv_i64 arg);
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 5c2254ce9f..d207bc47be 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -737,18 +737,6 @@ static inline TCGv_vec temp_tcgv_vec(TCGTemp *t)
     return (TCGv_vec)temp_tcgv_i32(t);
 }
 
-#if TCG_TARGET_REG_BITS == 32
-static inline TCGv_i32 TCGV_LOW(TCGv_i64 t)
-{
-    return temp_tcgv_i32(tcgv_i64_temp(t));
-}
-
-static inline TCGv_i32 TCGV_HIGH(TCGv_i64 t)
-{
-    return temp_tcgv_i32(tcgv_i64_temp(t) + 1);
-}
-#endif
-
 static inline TCGArg tcg_get_insn_param(TCGOp *op, int arg)
 {
     return op->args[arg];
diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index cc82088d52..a9ea27f67a 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -59,4 +59,18 @@ static inline unsigned tcg_call_flags(TCGOp *op)
     return tcg_call_info(op)->flags;
 }
 
+#if TCG_TARGET_REG_BITS == 32
+static inline TCGv_i32 TCGV_LOW(TCGv_i64 t)
+{
+    return temp_tcgv_i32(tcgv_i64_temp(t));
+}
+static inline TCGv_i32 TCGV_HIGH(TCGv_i64 t)
+{
+    return temp_tcgv_i32(tcgv_i64_temp(t) + 1);
+}
+#else
+extern TCGv_i32 TCGV_LOW(TCGv_i64) QEMU_ERROR("32-bit code path is reachable");
+extern TCGv_i32 TCGV_HIGH(TCGv_i64) QEMU_ERROR("32-bit code path is reachable");
+#endif
+
 #endif /* TCG_INTERNAL_H */
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index 463dabf515..5bf100ea7d 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -21,6 +21,8 @@
 #include "tcg/tcg.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-mo.h"
+#include "tcg-internal.h"
+
 
 /* Reduce the number of ifdefs below.  This assumes that all uses of
    TCGV_HIGH and TCGV_LOW are properly protected by a conditional that
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 019fab00cc..6168327030 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -28,16 +28,8 @@
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-mo.h"
 #include "exec/plugin-gen.h"
+#include "tcg-internal.h"
 
-/* Reduce the number of ifdefs below.  This assumes that all uses of
-   TCGV_HIGH and TCGV_LOW are properly protected by a conditional that
-   the compiler can eliminate.  */
-#if TCG_TARGET_REG_BITS == 64
-extern TCGv_i32 TCGV_LOW_link_error(TCGv_i64);
-extern TCGv_i32 TCGV_HIGH_link_error(TCGv_i64);
-#define TCGV_LOW  TCGV_LOW_link_error
-#define TCGV_HIGH TCGV_HIGH_link_error
-#endif
 
 void tcg_gen_op1(TCGOpcode opc, TCGArg a1)
 {
@@ -1171,6 +1163,21 @@ void tcg_gen_ld_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offset)
 #endif
 }
 
+void tcg_gen_st8_i64(TCGv_i64 arg1, TCGv_ptr arg2, tcg_target_long offset)
+{
+    tcg_gen_st8_i32(TCGV_LOW(arg1), arg2, offset);
+}
+
+void tcg_gen_st16_i64(TCGv_i64 arg1, TCGv_ptr arg2, tcg_target_long offset)
+{
+    tcg_gen_st16_i32(TCGV_LOW(arg1), arg2, offset);
+}
+
+void tcg_gen_st32_i64(TCGv_i64 arg1, TCGv_ptr arg2, tcg_target_long offset)
+{
+    tcg_gen_st_i32(TCGV_LOW(arg1), arg2, offset);
+}
+
 void tcg_gen_st_i64(TCGv_i64 arg1, TCGv_ptr arg2, tcg_target_long offset)
 {
 #if HOST_BIG_ENDIAN
@@ -1182,6 +1189,18 @@ void tcg_gen_st_i64(TCGv_i64 arg1, TCGv_ptr arg2, tcg_target_long offset)
 #endif
 }
 
+void tcg_gen_add_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
+{
+    tcg_gen_add2_i32(TCGV_LOW(ret), TCGV_HIGH(ret), TCGV_LOW(arg1),
+                     TCGV_HIGH(arg1), TCGV_LOW(arg2), TCGV_HIGH(arg2));
+}
+
+void tcg_gen_sub_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
+{
+    tcg_gen_sub2_i32(TCGV_LOW(ret), TCGV_HIGH(ret), TCGV_LOW(arg1),
+                     TCGV_HIGH(arg1), TCGV_LOW(arg2), TCGV_HIGH(arg2));
+}
+
 void tcg_gen_and_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
 {
     tcg_gen_and_i32(TCGV_LOW(ret), TCGV_LOW(arg1), TCGV_LOW(arg2));
-- 
2.34.1



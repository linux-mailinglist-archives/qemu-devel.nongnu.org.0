Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C705863FFFB
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:51:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymY-0002ce-Di; Fri, 02 Dec 2022 00:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymW-0002bi-FY
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:16 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymU-0003Lz-Dn
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:16 -0500
Received: by mail-pf1-x432.google.com with SMTP id w129so3959004pfb.5
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vcQlxYY7mFIcT5pvKb1eZPHlZnAn92mI9Ka1689AM7M=;
 b=oJ5gTan4ZxHa0OPk5b9KeBwKlXdF9V6K/xr+E4OcCWAaYO9zrFgJkwhaF9XDURZ1Uw
 SlLDJGTJX9+fc01DAhTnNRi1XleADX2xxYw2KS/iO3YgCSqBUeyHJzBR0NO2EIqBdttC
 IGynAG0flOwYQIbThZLX+UkC2yP7ld+ortlr0mp1pZM7VeyftBPV7EqCZ90kcfM7UVvM
 OOUeGeSKT/0eSN3gDUrZEjkE3omOEszSEXuyOBcaBrGy53gCa12ClsqOYgHaFL1mdvRz
 vVG1inAdjzIzpOmAoo3t9jhf5AvZ4lbRpp3tbp1K3sKw8QeT2x7rRDMQCNmqihuAvfdC
 zxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vcQlxYY7mFIcT5pvKb1eZPHlZnAn92mI9Ka1689AM7M=;
 b=b7YkvGHc+XmqFKYutoc2gn3CWyB6L4xNWS01CCwPVklCB4rzReIkC2NmkL3SBC+wsT
 0efgrPAm7/zCgeB2aE0VEgVWpNutrLxXtpj/y4v9lFy7uFR3aiHX1a/Rr2D9Tyx/Gv2a
 IUEnDbwUuwPfaHxCAPQzC5psiAy0GMbt+likaOE6aJvIhIvuwW7fi2/RONYXxFqtSlIP
 AO2IdzodXu/QOOi0YQOgxVOo3J8lvuz9YTv4g9yvANyxeV7UA/LRgt7GwWVKY4fykaJs
 N89/zluXo+Oy/XpRBZQi+8DcZNdTaquRcBvp/Iv3g2DrU9AiO/ts0FX2uPpfGnZ+dpcM
 hcUQ==
X-Gm-Message-State: ANoB5pl7voneSXIZcKyjAUwhOslj2AvXTJ88y0hr7zvSMU8M+X0K+kVf
 kWeOzjV/hcb/qvR8pmbiy+dNuUnoRA9HG8j0
X-Google-Smtp-Source: AA0mqf6c8Ey4G07boPrU48hV/bYetSSXzDHz53It5V95hxuVE2hRRPzrRUXmuHIvGJyZ3a/TGeFvFg==
X-Received: by 2002:a62:4e0c:0:b0:574:a82b:aa1e with SMTP id
 c12-20020a624e0c000000b00574a82baa1emr36223482pfb.35.1669959613192; 
 Thu, 01 Dec 2022 21:40:13 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 13/34] tcg: Move TCG_{LOW,HIGH} to tcg-internal.h
Date: Thu,  1 Dec 2022 21:39:37 -0800
Message-Id: <20221202053958.223890-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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



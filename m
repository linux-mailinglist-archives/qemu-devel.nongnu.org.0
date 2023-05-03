Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72386F53DF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 10:59:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8IO-0000yW-8d; Wed, 03 May 2023 04:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8IL-0000w8-7K
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:05 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8IJ-0006cU-F5
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:04 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f193ca059bso29819175e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 01:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683104222; x=1685696222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vA4s98neZpqj9zeFmYZ5W9ppvIkfNwCZ34PLJ036UyI=;
 b=Ve2lLTsX7+oELdBt1WKFIP58djTcnLds2YzFK5BnvO7FvVAtcBEwAlvKrb/RPwhF2S
 QRZpo78jcg8vqbMdAVubNxMU+nGFnPKlM6WPezcx9F5jgraLBHzAyLxfB/z12pPODuTj
 x0mnoBJ+roPLyNQ/pzyW8R6iiiCEWLGEfjQJQYA9OFyv215EWV+fj5z9pmzZ2j0NGl+i
 4Y2Il6u+6yASbuFQcRkAjUaREll3xRcvWFAnvZVi+le4JyjiYn7NomrfMX/w8Jqk++Y9
 YqirnDu8//UeHADXMBML0t36Es44sCExHqvmld+5N9X4yCbRgJfbJCTxMv6m/AFnhE+f
 OJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683104222; x=1685696222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vA4s98neZpqj9zeFmYZ5W9ppvIkfNwCZ34PLJ036UyI=;
 b=jwvTIpVR0Punib20/DebkHMF2/1ejf6B1JwpSBv7uHeDQSz/qArZf1KFW2S0n9kdnX
 8xZY5jcCq+wkzSQQlIg57pRrKcHBdOV+ipmWZgpttZQArgVdKzIm6EtEJYnQBjwawu6O
 nuc4dUpWioDG0DjvC/mY9PH+m4sKUSpY0ROMQyaqwL7afPgAvfZd+iBnMDe0wQhViYSA
 aDNjoObAx/zK58YiP7dpht4fDlJBO5beloQr5SSjKKhZgBWj3QW2DSy1tn8LjGY691vg
 x6v/GmqQ4AefpTl41hYbyaT7R6vbQg0rizJHW02ApbBrYaIBVUOkkHHQOBk+Aoq91JsK
 5QDA==
X-Gm-Message-State: AC+VfDxk/y5KOfE3u6L+DAu1IR6nQeHg3jMwTFDE2kzXFaulXkmZ6xm3
 gaoGmI/Vy4XirEI14KUCivghkzZMGMoVWp1ryVY4Lw==
X-Google-Smtp-Source: ACHHUZ5GZb6EYPb5AszFN38K9wepneS+oXZ+sIjwdNnf//buZpZnEArf3EvB/lKRRy/IJtQzDkBY6w==
X-Received: by 2002:a05:600c:21d1:b0:3f1:987b:7a28 with SMTP id
 x17-20020a05600c21d100b003f1987b7a28mr13798465wmj.29.1683104222051; 
 Wed, 03 May 2023 01:57:02 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a7bcd1a000000b003ef5f77901dsm1191307wmj.45.2023.05.03.01.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 01:57:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: dbarboza@ventanamicro.com
Subject: [PATCH 07/11] tcg/riscv: Support REV8 from Zbb
Date: Wed,  3 May 2023 09:56:53 +0100
Message-Id: <20230503085657.1814850-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503085657.1814850-1-richard.henderson@linaro.org>
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.h     | 10 +++++-----
 tcg/riscv/tcg-target.c.inc | 29 +++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 317d385924..8e327afc3a 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -116,8 +116,8 @@ extern bool have_zbb;
 #define TCG_TARGET_HAS_ext16s_i32       1
 #define TCG_TARGET_HAS_ext8u_i32        1
 #define TCG_TARGET_HAS_ext16u_i32       1
-#define TCG_TARGET_HAS_bswap16_i32      0
-#define TCG_TARGET_HAS_bswap32_i32      0
+#define TCG_TARGET_HAS_bswap16_i32      have_zbb
+#define TCG_TARGET_HAS_bswap32_i32      have_zbb
 #define TCG_TARGET_HAS_not_i32          1
 #define TCG_TARGET_HAS_neg_i32          1
 #define TCG_TARGET_HAS_andc_i32         have_zbb
@@ -149,9 +149,9 @@ extern bool have_zbb;
 #define TCG_TARGET_HAS_ext8u_i64        1
 #define TCG_TARGET_HAS_ext16u_i64       1
 #define TCG_TARGET_HAS_ext32u_i64       1
-#define TCG_TARGET_HAS_bswap16_i64      0
-#define TCG_TARGET_HAS_bswap32_i64      0
-#define TCG_TARGET_HAS_bswap64_i64      0
+#define TCG_TARGET_HAS_bswap16_i64      have_zbb
+#define TCG_TARGET_HAS_bswap32_i64      have_zbb
+#define TCG_TARGET_HAS_bswap64_i64      have_zbb
 #define TCG_TARGET_HAS_not_i64          1
 #define TCG_TARGET_HAS_neg_i64          1
 #define TCG_TARGET_HAS_andc_i64         have_zbb
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 58f969b4fe..9cbefb2833 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1488,6 +1488,30 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    case INDEX_op_bswap64_i64:
+        tcg_out_opc_imm(s, OPC_REV8, a0, a1, 0);
+        break;
+    case INDEX_op_bswap32_i32:
+        a2 = 0;
+        /* fall through */
+    case INDEX_op_bswap32_i64:
+        tcg_out_opc_imm(s, OPC_REV8, a0, a1, 0);
+        if (a2 & TCG_BSWAP_OZ) {
+            tcg_out_opc_imm(s, OPC_SRLI, a0, a0, 32);
+        } else {
+            tcg_out_opc_imm(s, OPC_SRAI, a0, a0, 32);
+        }
+        break;
+    case INDEX_op_bswap16_i64:
+    case INDEX_op_bswap16_i32:
+        tcg_out_opc_imm(s, OPC_REV8, a0, a1, 0);
+        if (a2 & TCG_BSWAP_OZ) {
+            tcg_out_opc_imm(s, OPC_SRLI, a0, a0, 48);
+        } else {
+            tcg_out_opc_imm(s, OPC_SRAI, a0, a0, 48);
+        }
+        break;
+
     case INDEX_op_add2_i32:
         tcg_out_addsub2(s, a0, a1, a2, args[3], args[4], args[5],
                         const_args[4], const_args[5], false, true);
@@ -1605,6 +1629,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_extrl_i64_i32:
     case INDEX_op_extrh_i64_i32:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_bswap16_i32:
+    case INDEX_op_bswap32_i32:
+    case INDEX_op_bswap16_i64:
+    case INDEX_op_bswap32_i64:
+    case INDEX_op_bswap64_i64:
         return C_O1_I1(r, r);
 
     case INDEX_op_st8_i32:
-- 
2.34.1



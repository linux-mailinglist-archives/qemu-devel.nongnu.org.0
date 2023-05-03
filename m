Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6CE6F53E2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 10:59:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8IN-0000xn-Mo; Wed, 03 May 2023 04:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8IK-0000vj-Np
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:04 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8II-0006cD-Ud
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:04 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so48270235e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 01:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683104221; x=1685696221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ChIPeONpzj2TEPZj/xz2/KXYVtYrlG9OCGeOFkjd/x4=;
 b=SSWe9pF9V7oMZc/sJ6oWk/9Xfd0bskGSnsAoW5BVY0fYcHLgUmrUXExq+EGmKbiDdS
 nrccdjpBwTJjx8u1d2xqO/8P+AY5Of7xHtr1ya6k/NTqsffpYXdhvZ/rVzcshJZGbl69
 SgQL78xWRq4fFKIErmgxCq6M3vvqICtyvxKrDdaoU5jxw4nMMTED7qHhmIMHTlA+oJHI
 DrKRmMXMWGpQsytkJyKYnS+6PxXb7Ex/RpsOgcuYYhh/yjz2HgQJbS3dTvP5rsVxpg95
 9cagMuxsRnBTWAp5XzFaZesxaMlxLVwWsZDOKv5Ej2kn/yTYTpXRrwgZfK6M1m5WC0yI
 uoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683104221; x=1685696221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ChIPeONpzj2TEPZj/xz2/KXYVtYrlG9OCGeOFkjd/x4=;
 b=dqmvvQYoOPZG6ZpynHNgi57u0EN3YtDsheryRsiIwwa4utJ4S8HKcRQXxLpStno3Xj
 m6SSw9o/ZMXaF22p/Cx4ljdPwPiOtKa2HzYjxJEKj/RuM6inIkU4ZMHmILYO5hfZmsVV
 FwV5KUUnF5Ho4jPPRVd2U93VsGDYgvu0nE96+IIaiWG6rAGiQv+SMSq/tZFBHo8UplFV
 pwOK7bH1PHuhElkd3nsCoQ29V3c35DGjPiPvrc+rm4Zr3ThddeJ3nEpF6y0aeOFpYmr/
 kQqboYVEJMlXZbBs/8QtRuvgUU4ay9evTct8sYtFMWuEigerOcZ8mENYBT7wIE0I+umL
 BMJw==
X-Gm-Message-State: AC+VfDz9hm4ZlUuBQY+NSLDtvCXs6wUyCDP5Pq5MTuJbG76/Q30rk6Fg
 PdwmEaabMMo2Ae08Z1fD7WbLwsbry56EBnTWmn0lhg==
X-Google-Smtp-Source: ACHHUZ4vQzYLHSt0o0NZ2XcSPNDGANDgAb4WQ9W1QGR1cp19zAhqsvmjESFVXQM515p9NbytbL+l7A==
X-Received: by 2002:a1c:4b06:0:b0:3ed:e5db:52e1 with SMTP id
 y6-20020a1c4b06000000b003ede5db52e1mr15046080wma.15.1683104221464; 
 Wed, 03 May 2023 01:57:01 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a7bcd1a000000b003ef5f77901dsm1191307wmj.45.2023.05.03.01.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 01:57:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: dbarboza@ventanamicro.com
Subject: [PATCH 06/11] tcg/riscv: Support rotates from Zbb
Date: Wed,  3 May 2023 09:56:52 +0100
Message-Id: <20230503085657.1814850-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503085657.1814850-1-richard.henderson@linaro.org>
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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
 tcg/riscv/tcg-target.h     |  4 ++--
 tcg/riscv/tcg-target.c.inc | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 9f58d46208..317d385924 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -101,7 +101,7 @@ extern bool have_zbb;
 #define TCG_TARGET_HAS_div_i32          1
 #define TCG_TARGET_HAS_rem_i32          1
 #define TCG_TARGET_HAS_div2_i32         0
-#define TCG_TARGET_HAS_rot_i32          0
+#define TCG_TARGET_HAS_rot_i32          have_zbb
 #define TCG_TARGET_HAS_deposit_i32      0
 #define TCG_TARGET_HAS_extract_i32      0
 #define TCG_TARGET_HAS_sextract_i32     0
@@ -136,7 +136,7 @@ extern bool have_zbb;
 #define TCG_TARGET_HAS_div_i64          1
 #define TCG_TARGET_HAS_rem_i64          1
 #define TCG_TARGET_HAS_div2_i64         0
-#define TCG_TARGET_HAS_rot_i64          0
+#define TCG_TARGET_HAS_rot_i64          have_zbb
 #define TCG_TARGET_HAS_deposit_i64      0
 #define TCG_TARGET_HAS_extract_i64      0
 #define TCG_TARGET_HAS_sextract_i64     0
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index f64eaa8515..58f969b4fe 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1458,6 +1458,36 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    case INDEX_op_rotl_i32:
+        if (c2) {
+            tcg_out_opc_imm(s, OPC_RORIW, a0, a1, -a2 & 0x1f);
+        } else {
+            tcg_out_opc_reg(s, OPC_ROLW, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_rotl_i64:
+        if (c2) {
+            tcg_out_opc_imm(s, OPC_RORI, a0, a1, -a2 & 0x3f);
+        } else {
+            tcg_out_opc_reg(s, OPC_ROL, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_rotr_i32:
+        if (c2) {
+            tcg_out_opc_imm(s, OPC_RORIW, a0, a1, a2 & 0x1f);
+        } else {
+            tcg_out_opc_reg(s, OPC_RORW, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_rotr_i64:
+        if (c2) {
+            tcg_out_opc_imm(s, OPC_RORI, a0, a1, a2 & 0x3f);
+        } else {
+            tcg_out_opc_reg(s, OPC_ROR, a0, a1, a2);
+        }
+        break;
+
     case INDEX_op_add2_i32:
         tcg_out_addsub2(s, a0, a1, a2, args[3], args[4], args[5],
                         const_args[4], const_args[5], false, true);
@@ -1629,9 +1659,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shl_i32:
     case INDEX_op_shr_i32:
     case INDEX_op_sar_i32:
+    case INDEX_op_rotl_i32:
+    case INDEX_op_rotr_i32:
     case INDEX_op_shl_i64:
     case INDEX_op_shr_i64:
     case INDEX_op_sar_i64:
+    case INDEX_op_rotl_i64:
+    case INDEX_op_rotr_i64:
         return C_O1_I2(r, r, ri);
 
     case INDEX_op_brcond_i32:
-- 
2.34.1



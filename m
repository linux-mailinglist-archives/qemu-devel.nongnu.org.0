Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D620D45CC8C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 19:55:01 +0100 (CET)
Received: from localhost ([::1]:52056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpxQ4-0005VR-Rf
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 13:55:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mpx5a-0007Gj-By
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:33:50 -0500
Received: from mail.xen0n.name ([115.28.160.31]:43548
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mpx5V-0004hz-Kx
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:33:50 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C88A060AF6;
 Thu, 25 Nov 2021 02:33:27 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1637778808; bh=gINwPSDZo/N5Zr3J/G+MLV70SqXJkuPsVvwWjo3LWSQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hgH1se04rTCpZuFGKFl6amOYuWVDK52FBT479EzgsMJSXubOupwKx0C2re3iQn3Qn
 jab7OLwoe+gaa8D6vOc/Hu+fmDpIck+8XbxKOnUdaKT9BqfS5a1KycqYug+5dvhKwA
 ydP6xxti9oIJkaVO1qEKooqUaA7gZ5EPPcGXqDos=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 v8 12/31] tcg/loongarch64: Implement
 not/and/or/xor/nor/andc/orc ops
Date: Thu, 25 Nov 2021 02:32:12 +0800
Message-Id: <20211124183231.1503090-13-git@xen0n.name>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211124183231.1503090-1-git@xen0n.name>
References: <20211124183231.1503090-1-git@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  2 +
 tcg/loongarch64/tcg-target.c.inc     | 88 ++++++++++++++++++++++++++++
 tcg/loongarch64/tcg-target.h         | 16 ++---
 3 files changed, 98 insertions(+), 8 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 7e459490ea..9ac24b8ad0 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -16,3 +16,5 @@
  */
 C_O0_I1(r)
 C_O1_I1(r, r)
+C_O1_I2(r, r, rC)
+C_O1_I2(r, r, rU)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 0c075c7521..d610b83c37 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -422,6 +422,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 {
     TCGArg a0 = args[0];
     TCGArg a1 = args[1];
+    TCGArg a2 = args[2];
+    int c2 = const_args[2];
 
     switch (opc) {
     case INDEX_op_mb:
@@ -467,6 +469,68 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_opc_srai_d(s, a0, a1, 32);
         break;
 
+    case INDEX_op_not_i32:
+    case INDEX_op_not_i64:
+        tcg_out_opc_nor(s, a0, a1, TCG_REG_ZERO);
+        break;
+
+    case INDEX_op_nor_i32:
+    case INDEX_op_nor_i64:
+        if (c2) {
+            tcg_out_opc_ori(s, a0, a1, a2);
+            tcg_out_opc_nor(s, a0, a0, TCG_REG_ZERO);
+        } else {
+            tcg_out_opc_nor(s, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_andc_i32:
+    case INDEX_op_andc_i64:
+        if (c2) {
+            /* guaranteed to fit due to constraint */
+            tcg_out_opc_andi(s, a0, a1, ~a2);
+        } else {
+            tcg_out_opc_andn(s, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_orc_i32:
+    case INDEX_op_orc_i64:
+        if (c2) {
+            /* guaranteed to fit due to constraint */
+            tcg_out_opc_ori(s, a0, a1, ~a2);
+        } else {
+            tcg_out_opc_orn(s, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_and_i32:
+    case INDEX_op_and_i64:
+        if (c2) {
+            tcg_out_opc_andi(s, a0, a1, a2);
+        } else {
+            tcg_out_opc_and(s, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_or_i32:
+    case INDEX_op_or_i64:
+        if (c2) {
+            tcg_out_opc_ori(s, a0, a1, a2);
+        } else {
+            tcg_out_opc_or(s, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_xor_i32:
+    case INDEX_op_xor_i64:
+        if (c2) {
+            tcg_out_opc_xori(s, a0, a1, a2);
+        } else {
+            tcg_out_opc_xor(s, a0, a1, a2);
+        }
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
@@ -494,8 +558,32 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_extrl_i64_i32:
     case INDEX_op_extrh_i64_i32:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_not_i32:
+    case INDEX_op_not_i64:
         return C_O1_I1(r, r);
 
+    case INDEX_op_andc_i32:
+    case INDEX_op_andc_i64:
+    case INDEX_op_orc_i32:
+    case INDEX_op_orc_i64:
+        /*
+         * LoongArch insns for these ops don't have reg-imm forms, but we
+         * can express using andi/ori if ~constant satisfies
+         * TCG_CT_CONST_U12.
+         */
+        return C_O1_I2(r, r, rC);
+
+    case INDEX_op_and_i32:
+    case INDEX_op_and_i64:
+    case INDEX_op_nor_i32:
+    case INDEX_op_nor_i64:
+    case INDEX_op_or_i32:
+    case INDEX_op_or_i64:
+    case INDEX_op_xor_i32:
+    case INDEX_op_xor_i64:
+        /* LoongArch reg-imm bitops have their imms ZERO-extended */
+        return C_O1_I2(r, r, rU);
+
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 2b7d5a19b9..cb1739a54a 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -113,13 +113,13 @@ typedef enum {
 #define TCG_TARGET_HAS_ext16u_i32       1
 #define TCG_TARGET_HAS_bswap16_i32      0
 #define TCG_TARGET_HAS_bswap32_i32      0
-#define TCG_TARGET_HAS_not_i32          0
+#define TCG_TARGET_HAS_not_i32          1
 #define TCG_TARGET_HAS_neg_i32          0
-#define TCG_TARGET_HAS_andc_i32         0
-#define TCG_TARGET_HAS_orc_i32          0
+#define TCG_TARGET_HAS_andc_i32         1
+#define TCG_TARGET_HAS_orc_i32          1
 #define TCG_TARGET_HAS_eqv_i32          0
 #define TCG_TARGET_HAS_nand_i32         0
-#define TCG_TARGET_HAS_nor_i32          0
+#define TCG_TARGET_HAS_nor_i32          1
 #define TCG_TARGET_HAS_clz_i32          0
 #define TCG_TARGET_HAS_ctz_i32          0
 #define TCG_TARGET_HAS_ctpop_i32        0
@@ -149,13 +149,13 @@ typedef enum {
 #define TCG_TARGET_HAS_bswap16_i64      0
 #define TCG_TARGET_HAS_bswap32_i64      0
 #define TCG_TARGET_HAS_bswap64_i64      0
-#define TCG_TARGET_HAS_not_i64          0
+#define TCG_TARGET_HAS_not_i64          1
 #define TCG_TARGET_HAS_neg_i64          0
-#define TCG_TARGET_HAS_andc_i64         0
-#define TCG_TARGET_HAS_orc_i64          0
+#define TCG_TARGET_HAS_andc_i64         1
+#define TCG_TARGET_HAS_orc_i64          1
 #define TCG_TARGET_HAS_eqv_i64          0
 #define TCG_TARGET_HAS_nand_i64         0
-#define TCG_TARGET_HAS_nor_i64          0
+#define TCG_TARGET_HAS_nor_i64          1
 #define TCG_TARGET_HAS_clz_i64          0
 #define TCG_TARGET_HAS_ctz_i64          0
 #define TCG_TARGET_HAS_ctpop_i64        0
-- 
2.34.0



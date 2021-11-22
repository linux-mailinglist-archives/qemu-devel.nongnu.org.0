Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB78458CBC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 11:51:06 +0100 (CET)
Received: from localhost ([::1]:42586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp6ug-0007JT-0F
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 05:51:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mp6n4-0001Y7-0E
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:43:14 -0500
Received: from mail.xen0n.name ([115.28.160.31]:40766
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mp6mz-0007g3-8Q
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:43:13 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id A12A960AF9;
 Mon, 22 Nov 2021 18:42:52 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1637577772; bh=+VdSiHM8uUBL9oERB55eIHDo3cewJNd5gy5m/JJoae4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sIt2cZzyFglonsszMLUBAu7P2ikZPRkeYNNOS6YyAcaWVQ2y9FzG3V/ILNPmIH4n5
 o/akF0gupfN1ypLteeHta2iCrSJw0/crE49wYYSJNHRKOUa9bHbCnRub2tk5FL9Wx7
 ho7QJI2NSGFT2wAY1KnXWequj6MuP1os/vXdjM6k=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 16/31] tcg/loongarch64: Implement shl/shr/sar/rotl/rotr ops
Date: Mon, 22 Nov 2021 18:41:46 +0800
Message-Id: <20211122104201.112695-17-git@xen0n.name>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122104201.112695-1-git@xen0n.name>
References: <20211122104201.112695-1-git@xen0n.name>
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
 tcg/loongarch64/tcg-target-con-set.h |  1 +
 tcg/loongarch64/tcg-target.c.inc     | 91 ++++++++++++++++++++++++++++
 tcg/loongarch64/tcg-target.h         |  4 +-
 3 files changed, 94 insertions(+), 2 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 2975e03127..42f8e28741 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -17,6 +17,7 @@
 C_O0_I1(r)
 C_O1_I1(r, r)
 C_O1_I2(r, r, rC)
+C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rU)
 C_O1_I2(r, r, rW)
 C_O1_I2(r, 0, rZ)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 4c1c1d6182..d0a24cc009 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -608,6 +608,85 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_clzctz(s, OPC_CTZ_D, a0, a1, a2, c2, false);
         break;
 
+    case INDEX_op_shl_i32:
+        if (c2) {
+            tcg_out_opc_slli_w(s, a0, a1, a2 & 0x1f);
+        } else {
+            tcg_out_opc_sll_w(s, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_shl_i64:
+        if (c2) {
+            tcg_out_opc_slli_d(s, a0, a1, a2 & 0x3f);
+        } else {
+            tcg_out_opc_sll_d(s, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_shr_i32:
+        if (c2) {
+            tcg_out_opc_srli_w(s, a0, a1, a2 & 0x1f);
+        } else {
+            tcg_out_opc_srl_w(s, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_shr_i64:
+        if (c2) {
+            tcg_out_opc_srli_d(s, a0, a1, a2 & 0x3f);
+        } else {
+            tcg_out_opc_srl_d(s, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_sar_i32:
+        if (c2) {
+            tcg_out_opc_srai_w(s, a0, a1, a2 & 0x1f);
+        } else {
+            tcg_out_opc_sra_w(s, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_sar_i64:
+        if (c2) {
+            tcg_out_opc_srai_d(s, a0, a1, a2 & 0x3f);
+        } else {
+            tcg_out_opc_sra_d(s, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_rotl_i32:
+        /* transform into equivalent rotr/rotri */
+        if (c2) {
+            tcg_out_opc_rotri_w(s, a0, a1, (32 - a2) & 0x1f);
+        } else {
+            tcg_out_opc_sub_w(s, TCG_REG_TMP0, TCG_REG_ZERO, a2);
+            tcg_out_opc_rotr_w(s, a0, a1, TCG_REG_TMP0);
+        }
+        break;
+    case INDEX_op_rotl_i64:
+        /* transform into equivalent rotr/rotri */
+        if (c2) {
+            tcg_out_opc_rotri_d(s, a0, a1, (64 - a2) & 0x3f);
+        } else {
+            tcg_out_opc_sub_w(s, TCG_REG_TMP0, TCG_REG_ZERO, a2);
+            tcg_out_opc_rotr_d(s, a0, a1, TCG_REG_TMP0);
+        }
+        break;
+
+    case INDEX_op_rotr_i32:
+        if (c2) {
+            tcg_out_opc_rotri_w(s, a0, a1, a2 & 0x1f);
+        } else {
+            tcg_out_opc_rotr_w(s, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_rotr_i64:
+        if (c2) {
+            tcg_out_opc_rotri_d(s, a0, a1, a2 & 0x3f);
+        } else {
+            tcg_out_opc_rotr_d(s, a0, a1, a2);
+        }
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
@@ -657,6 +736,18 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
          */
         return C_O1_I2(r, r, rC);
 
+    case INDEX_op_shl_i32:
+    case INDEX_op_shl_i64:
+    case INDEX_op_shr_i32:
+    case INDEX_op_shr_i64:
+    case INDEX_op_sar_i32:
+    case INDEX_op_sar_i64:
+    case INDEX_op_rotl_i32:
+    case INDEX_op_rotl_i64:
+    case INDEX_op_rotr_i32:
+    case INDEX_op_rotr_i64:
+        return C_O1_I2(r, r, ri);
+
     case INDEX_op_and_i32:
     case INDEX_op_and_i64:
     case INDEX_op_nor_i32:
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index ef489cbc86..e59c2a7bec 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -96,7 +96,7 @@ typedef enum {
 #define TCG_TARGET_HAS_div_i32          0
 #define TCG_TARGET_HAS_rem_i32          0
 #define TCG_TARGET_HAS_div2_i32         0
-#define TCG_TARGET_HAS_rot_i32          0
+#define TCG_TARGET_HAS_rot_i32          1
 #define TCG_TARGET_HAS_deposit_i32      1
 #define TCG_TARGET_HAS_extract_i32      1
 #define TCG_TARGET_HAS_sextract_i32     0
@@ -133,7 +133,7 @@ typedef enum {
 #define TCG_TARGET_HAS_div_i64          0
 #define TCG_TARGET_HAS_rem_i64          0
 #define TCG_TARGET_HAS_div2_i64         0
-#define TCG_TARGET_HAS_rot_i64          0
+#define TCG_TARGET_HAS_rot_i64          1
 #define TCG_TARGET_HAS_deposit_i64      1
 #define TCG_TARGET_HAS_extract_i64      1
 #define TCG_TARGET_HAS_sextract_i64     0
-- 
2.34.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F006E473E0D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 09:11:22 +0100 (CET)
Received: from localhost ([::1]:38886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx2uA-0000dG-0Z
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 03:11:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mx2mw-00079o-Q0
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 03:03:54 -0500
Received: from mail.xen0n.name ([115.28.160.31]:48646
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mx2ms-0000Wf-V5
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 03:03:54 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 59C8A6055C;
 Tue, 14 Dec 2021 16:03:33 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1639469013; bh=pRCui5HS+IdeQYnVC9pYrYkVoG7VUfNtPVvxfLze5Yg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f83wNeMsE2XcOTU2re/uThLLafXweYtewGOrs3/FrMagHKsCgWWNJgka9mdkEHeMS
 3GRvXfBEfq4+NFzVdGlE8pK2rng1zBJBGDYwR81Fopb8/OmWtmWl+9TNO2MDQ/+aZY
 24w/vK1IJgY+Jlckjaq21vWgRroSl+j00iGsMGRU=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 20/31] tcg/loongarch64: Implement setcond ops
Date: Tue, 14 Dec 2021 16:01:43 +0800
Message-Id: <20211214080154.196350-21-git@xen0n.name>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211214080154.196350-1-git@xen0n.name>
References: <20211214080154.196350-1-git@xen0n.name>
MIME-Version: 1.0
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
---
 tcg/loongarch64/tcg-target-con-set.h |  1 +
 tcg/loongarch64/tcg-target.c.inc     | 69 ++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 367689c2e2..a2ec61237e 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -22,6 +22,7 @@ C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
 C_O1_I2(r, r, rU)
 C_O1_I2(r, r, rW)
+C_O1_I2(r, r, rZ)
 C_O1_I2(r, 0, rZ)
 C_O1_I2(r, rZ, rN)
 C_O1_I2(r, rZ, rZ)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 816b16f10f..682bf76ceb 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -434,6 +434,66 @@ static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
     tcg_out_opc_or(s, a0, TCG_REG_TMP0, a0);
 }
 
+static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
+                            TCGReg arg1, TCGReg arg2, bool c2)
+{
+    TCGReg tmp;
+
+    if (c2) {
+        tcg_debug_assert(arg2 == 0);
+    }
+
+    switch (cond) {
+    case TCG_COND_EQ:
+        if (c2) {
+            tmp = arg1;
+        } else {
+            tcg_out_opc_sub_d(s, ret, arg1, arg2);
+            tmp = ret;
+        }
+        tcg_out_opc_sltui(s, ret, tmp, 1);
+        break;
+    case TCG_COND_NE:
+        if (c2) {
+            tmp = arg1;
+        } else {
+            tcg_out_opc_sub_d(s, ret, arg1, arg2);
+            tmp = ret;
+        }
+        tcg_out_opc_sltu(s, ret, TCG_REG_ZERO, tmp);
+        break;
+    case TCG_COND_LT:
+        tcg_out_opc_slt(s, ret, arg1, arg2);
+        break;
+    case TCG_COND_GE:
+        tcg_out_opc_slt(s, ret, arg1, arg2);
+        tcg_out_opc_xori(s, ret, ret, 1);
+        break;
+    case TCG_COND_LE:
+        tcg_out_setcond(s, TCG_COND_GE, ret, arg2, arg1, false);
+        break;
+    case TCG_COND_GT:
+        tcg_out_setcond(s, TCG_COND_LT, ret, arg2, arg1, false);
+        break;
+    case TCG_COND_LTU:
+        tcg_out_opc_sltu(s, ret, arg1, arg2);
+        break;
+    case TCG_COND_GEU:
+        tcg_out_opc_sltu(s, ret, arg1, arg2);
+        tcg_out_opc_xori(s, ret, ret, 1);
+        break;
+    case TCG_COND_LEU:
+        tcg_out_setcond(s, TCG_COND_GEU, ret, arg2, arg1, false);
+        break;
+    case TCG_COND_GTU:
+        tcg_out_setcond(s, TCG_COND_LTU, ret, arg2, arg1, false);
+        break;
+    default:
+        g_assert_not_reached();
+        break;
+    }
+}
+
 /*
  * Branch helpers
  */
@@ -815,6 +875,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_opc_mod_du(s, a0, a1, a2);
         break;
 
+    case INDEX_op_setcond_i32:
+    case INDEX_op_setcond_i64:
+        tcg_out_setcond(s, args[3], a0, a1, a2, c2);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
@@ -901,6 +966,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ctz_i64:
         return C_O1_I2(r, r, rW);
 
+    case INDEX_op_setcond_i32:
+    case INDEX_op_setcond_i64:
+        return C_O1_I2(r, r, rZ);
+
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
         /* Must deposit into the same register as input */
-- 
2.34.0



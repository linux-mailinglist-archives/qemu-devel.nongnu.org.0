Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165DB41500D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 20:41:39 +0200 (CEST)
Received: from localhost ([::1]:46296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7Ba-00009B-1w
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 14:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mT6hA-00072n-3m
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:10:12 -0400
Received: from [115.28.160.31] (port=40376 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mT6h5-0007Fs-Io
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:10:11 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 61D3D63407;
 Thu, 23 Sep 2021 02:09:44 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632334184; bh=IAOKpc8N/sxdkQgzQ9gdC+OB3RNcR6wUeEcB6YFNQJs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=toKkAk9pfMnY6jG2T44ScpQVx0ghbnF2INNT/HS41OPHWeu1mpWwP4A3OEcGDloPo
 jm3p4LwTj1+I3zvSus/fSDxY8udtC9NnbvI9FduE242iaBuyfSi67t/AHEPqBIDjGV
 MmVhmaRIJBeyVYUCfPN3MqabX5xPK/GxyHleaXhQ=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/30] tcg/loongarch64: Implement setcond ops
Date: Thu, 23 Sep 2021 02:09:17 +0800
Message-Id: <20210922180927.666273-21-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922180927.666273-1-git@xen0n.name>
References: <20210922180927.666273-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 tcg/loongarch64/tcg-target.c.inc | 67 ++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index b65852ef2f..e30277b43a 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -386,6 +386,66 @@ static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
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
@@ -767,6 +827,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -876,6 +941,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_rem_i64:
     case INDEX_op_remu_i32:
     case INDEX_op_remu_i64:
+    case INDEX_op_setcond_i32:
+    case INDEX_op_setcond_i64:
         return C_O1_I2(r, rZ, rZ);
 
     default:
-- 
2.33.0



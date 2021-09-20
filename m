Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE6241166D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:10:47 +0200 (CEST)
Received: from localhost ([::1]:51172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSK0M-0004Z0-R6
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEOl-0007fk-Qt
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:35 -0400
Received: from [115.28.160.31] (port=35552 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEOj-0005De-49
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:35 -0400
Received: from ld50.lan (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B487063405;
 Mon, 20 Sep 2021 16:06:02 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632125162; bh=j4EjGiVRLTHDBonKZ1vRz9k/sx0JNUED3iBUWqcCYYw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HsamA/uq9EM7iYp9VVl4DJlDci8cenzgP3ePzGVSGENKfC5Z8GepcKsekvlrgcPur
 b+HAw8/Q/7Vxt3QqC8e4K3VGuEtpjuMqV7xdJx1ZOKEIBLLlAYYZsyvTVC9/NCOn1a
 G9KSZmyAX4oh5YbltM2iXZhgP359iuBCZkl64DB0=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/30] tcg/loongarch: Implement setcond ops
Date: Mon, 20 Sep 2021 16:04:41 +0800
Message-Id: <20210920080451.408655-21-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920080451.408655-1-git@xen0n.name>
References: <20210920080451.408655-1-git@xen0n.name>
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
X-Mailman-Approved-At: Mon, 20 Sep 2021 09:57:24 -0400
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 tcg/loongarch/tcg-target.c.inc | 53 ++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/tcg/loongarch/tcg-target.c.inc b/tcg/loongarch/tcg-target.c.inc
index a533a5619d..fb0143474a 100644
--- a/tcg/loongarch/tcg-target.c.inc
+++ b/tcg/loongarch/tcg-target.c.inc
@@ -373,6 +373,52 @@ static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
     tcg_out_opc_or(s, a0, TCG_REG_TMP0, a0);
 }
 
+static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
+                            TCGReg arg1, TCGReg arg2)
+{
+    switch (cond) {
+    case TCG_COND_EQ:
+        tcg_out_opc_sub_d(s, ret, arg1, arg2);
+        tcg_out_opc_sltui(s, ret, ret, 1);
+        break;
+    case TCG_COND_NE:
+        tcg_out_opc_sub_d(s, ret, arg1, arg2);
+        tcg_out_opc_sltu(s, ret, TCG_REG_ZERO, ret);
+        break;
+    case TCG_COND_LT:
+        tcg_out_opc_slt(s, ret, arg1, arg2);
+        break;
+    case TCG_COND_GE:
+        tcg_out_opc_slt(s, ret, arg1, arg2);
+        tcg_out_opc_xori(s, ret, ret, 1);
+        break;
+    case TCG_COND_LE:
+        tcg_out_opc_slt(s, ret, arg2, arg1);
+        tcg_out_opc_xori(s, ret, ret, 1);
+        break;
+    case TCG_COND_GT:
+        tcg_out_opc_slt(s, ret, arg2, arg1);
+        break;
+    case TCG_COND_LTU:
+        tcg_out_opc_sltu(s, ret, arg1, arg2);
+        break;
+    case TCG_COND_GEU:
+        tcg_out_opc_sltu(s, ret, arg1, arg2);
+        tcg_out_opc_xori(s, ret, ret, 1);
+        break;
+    case TCG_COND_LEU:
+        tcg_out_opc_sltu(s, ret, arg2, arg1);
+        tcg_out_opc_xori(s, ret, ret, 1);
+        break;
+    case TCG_COND_GTU:
+        tcg_out_opc_sltu(s, ret, arg2, arg1);
+        break;
+    default:
+         g_assert_not_reached();
+         break;
+     }
+}
+
 /*
  * Branch helpers
  */
@@ -726,6 +772,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_opc_mod_du(s, a0, a1, a2);
         break;
 
+    case INDEX_op_setcond_i32:
+    case INDEX_op_setcond_i64:
+        tcg_out_setcond(s, args[3], a0, a1, a2);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
@@ -830,6 +881,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_rem_i64:
     case INDEX_op_remu_i32:
     case INDEX_op_remu_i64:
+    case INDEX_op_setcond_i32:
+    case INDEX_op_setcond_i64:
         return C_O1_I2(r, rZ, rZ);
 
     default:
-- 
2.33.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 455F241163C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:04:00 +0200 (CEST)
Received: from localhost ([::1]:34156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSJtn-0001ai-8X
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEOn-0007hd-82
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:37 -0400
Received: from [115.28.160.31] (port=35556 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEOj-0005Dg-4B
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:36 -0400
Received: from ld50.lan (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C932263404;
 Mon, 20 Sep 2021 16:06:00 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632125160; bh=U/JY2ROj+DDqB84lxVVDTEUnyURoOCo5VKOMBJpWSNA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bcjGrfjKXb3OwcyplM/shRit9UcCA96EYwTxJ67XPZ3WrVLE+IhSAVVHkQEXPJzL9
 OdLBhar8FjW5latWHVfVkVhWB2cwggWyzTmafBzoUbcZYiD2FZDuv+7vOs+rsu7CLs
 ryizP+1LAulvoDzpjMfBwGiNXAT0M9cwMtxbCG5w=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/30] tcg/loongarch: Implement br/brcond ops
Date: Mon, 20 Sep 2021 16:04:40 +0800
Message-Id: <20210920080451.408655-20-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920080451.408655-1-git@xen0n.name>
References: <20210920080451.408655-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 tcg/loongarch/tcg-target-con-set.h |  1 +
 tcg/loongarch/tcg-target.c.inc     | 52 ++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/tcg/loongarch/tcg-target-con-set.h b/tcg/loongarch/tcg-target-con-set.h
index 57b2846d82..bcbf0780ff 100644
--- a/tcg/loongarch/tcg-target-con-set.h
+++ b/tcg/loongarch/tcg-target-con-set.h
@@ -15,6 +15,7 @@
  * tcg-target-con-str.h; the constraint combination is inclusive or.
  */
 C_O0_I1(r)
+C_O0_I2(rZ, rZ)
 C_O1_I1(r, r)
 C_O1_I2(r, r, r)
 C_O1_I2(r, r, ri)
diff --git a/tcg/loongarch/tcg-target.c.inc b/tcg/loongarch/tcg-target.c.inc
index eaa155ad68..a533a5619d 100644
--- a/tcg/loongarch/tcg-target.c.inc
+++ b/tcg/loongarch/tcg-target.c.inc
@@ -373,6 +373,44 @@ static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
     tcg_out_opc_or(s, a0, TCG_REG_TMP0, a0);
 }
 
+/*
+ * Branch helpers
+ */
+
+static const struct {
+    LoongArchInsn op;
+    bool swap;
+} tcg_brcond_to_loongarch[] = {
+    [TCG_COND_EQ] =  { OPC_BEQ,  false },
+    [TCG_COND_NE] =  { OPC_BNE,  false },
+    [TCG_COND_LT] =  { OPC_BGT,  true  },
+    [TCG_COND_GE] =  { OPC_BLE,  true  },
+    [TCG_COND_LE] =  { OPC_BLE,  false },
+    [TCG_COND_GT] =  { OPC_BGT,  false },
+    [TCG_COND_LTU] = { OPC_BGTU, true  },
+    [TCG_COND_GEU] = { OPC_BLEU, true  },
+    [TCG_COND_LEU] = { OPC_BLEU, false },
+    [TCG_COND_GTU] = { OPC_BGTU, false }
+};
+
+static void tcg_out_brcond(TCGContext *s, TCGCond cond, TCGReg arg1,
+                           TCGReg arg2, TCGLabel *l)
+{
+    LoongArchInsn op = tcg_brcond_to_loongarch[cond].op;
+
+    tcg_debug_assert(op != 0);
+
+    if (tcg_brcond_to_loongarch[cond].swap) {
+        TCGReg t = arg1;
+        arg1 = arg2;
+        arg2 = t;
+    }
+
+    /* all conditional branch insns belong to DJSk16-format */
+    tcg_out_reloc(s, s->code_ptr, R_LOONGARCH_SK16, l, 0);
+    tcg_out32(s, encode_djsk16_insn(op, arg1, arg2, 0));
+}
+
 /*
  * Entry-points
  */
@@ -395,6 +433,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_opc_jirl(s, TCG_REG_ZERO, a0, 0);
         break;
 
+    case INDEX_op_br:
+        tcg_out_reloc(s, s->code_ptr, R_LOONGARCH_SD10K16, arg_label(a0), 0);
+        tcg_out_opc_b(s, 0);
+        break;
+
+    case INDEX_op_brcond_i32:
+    case INDEX_op_brcond_i64:
+        tcg_out_brcond(s, a2, a0, a1, arg_label(args[3]));
+        break;
+
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
         tcg_out_ext8s(s, a0, a1);
@@ -691,6 +739,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_goto_ptr:
         return C_O0_I1(r);
 
+    case INDEX_op_brcond_i32:
+    case INDEX_op_brcond_i64:
+        return C_O0_I2(rZ, rZ);
+
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
-- 
2.33.0



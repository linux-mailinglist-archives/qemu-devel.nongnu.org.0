Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0EE413B5E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 22:29:45 +0200 (CEST)
Received: from localhost ([::1]:39626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSmOe-00041h-Po
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 16:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmF6-0004VB-RB
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:19:52 -0400
Received: from [115.28.160.31] (port=56004 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmF4-0000VM-EB
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:19:52 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 4C4FA633FD;
 Wed, 22 Sep 2021 04:19:27 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632255567; bh=4SnGoSBYRaDR63L2TckxuqEtpaXQfvu0IfWL1+Cc7vE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DdN0gakXf/enDHRYJ5il5cunjbgm1x8FPeuX2SQU8tQtUdDyZrMw2LzeuHrDP/b9q
 aYqI3dmxLxfnLtjntS8/W/T4wOPPO0cwfAo+nV2D7XRPz0GrcW8uMm5U9zS60Fxv/U
 zFWU4ifbQavQiwJF98hCkRO052AwAVUN1COTZPl4=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/30] tcg/loongarch64: Implement
 not/and/or/xor/nor/andc/orc/eqv ops
Date: Wed, 22 Sep 2021 04:18:57 +0800
Message-Id: <20210921201915.601245-13-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921201915.601245-1-git@xen0n.name>
References: <20210921201915.601245-1-git@xen0n.name>
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 tcg/loongarch64/tcg-target-con-set.h |   2 +
 tcg/loongarch64/tcg-target.c.inc     | 101 +++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)

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
index e000a31a06..89fdb6d7c3 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -374,6 +374,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 {
     TCGArg a0 = args[0];
     TCGArg a1 = args[1];
+    TCGArg a2 = args[2];
+    int c2 = const_args[2];
 
     switch (opc) {
     case INDEX_op_mb:
@@ -419,6 +421,79 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
+    case INDEX_op_eqv_i32:
+    case INDEX_op_eqv_i64:
+        if (c2) {
+            /* guaranteed to fit due to constraint */
+            tcg_out_opc_xori(s, a0, a1, ~a2);
+        } else {
+            tcg_out_opc_nor(s, a0, a2, TCG_REG_ZERO);
+            tcg_out_opc_xor(s, a0, a1, a0);
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
@@ -446,8 +521,34 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_extrl_i64_i32:
     case INDEX_op_extrh_i64_i32:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_not_i32:
+    case INDEX_op_not_i64:
         return C_O1_I1(r, r);
 
+    case INDEX_op_andc_i32:
+    case INDEX_op_andc_i64:
+    case INDEX_op_eqv_i32:
+    case INDEX_op_eqv_i64:
+    case INDEX_op_orc_i32:
+    case INDEX_op_orc_i64:
+        /*
+         * LoongArch insns for these ops don't have reg-imm forms, but we
+         * can express using andi/ori/xori if ~constant satisfies
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
-- 
2.33.0



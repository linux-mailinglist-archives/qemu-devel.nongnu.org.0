Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B77A413BAE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 22:46:23 +0200 (CEST)
Received: from localhost ([::1]:48660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSmek-0004lC-Az
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 16:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmF8-0004bw-Fa
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:19:54 -0400
Received: from [115.28.160.31] (port=56012 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmF6-0000WM-4N
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:19:54 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id AC70363400;
 Wed, 22 Sep 2021 04:19:27 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632255567; bh=EXsr/9rMamohosQZ73uu0Ij/82a8rL5CbEaOLsq+lZY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NUOPBm8Tvjul7uWB1kTz2xJINLuow9CK5D0SdEhCSyxGysZCZz2egfOWvS0i5vxYO
 uspY9DbuUTornDhIDknz2Agb+KryzRYiH9HFUsMaXATKVL88BZ+quBaxLp+0H5tTak
 u8WPEcJtpWcvocVgNcL1ZXwT9ywd1JpNWmDDZMBs=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/30] tcg/loongarch64: Implement clz/ctz ops
Date: Wed, 22 Sep 2021 04:19:00 +0800
Message-Id: <20210921201915.601245-16-git@xen0n.name>
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
 tcg/loongarch64/tcg-target-con-set.h |  1 +
 tcg/loongarch64/tcg-target.c.inc     | 42 ++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index d958183020..2975e03127 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -18,4 +18,5 @@ C_O0_I1(r)
 C_O1_I1(r, r)
 C_O1_I2(r, r, rC)
 C_O1_I2(r, r, rU)
+C_O1_I2(r, r, rW)
 C_O1_I2(r, 0, rZ)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index e7b5f2c5ab..65545f7636 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -364,6 +364,28 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
     tcg_out_opc_addi_w(s, ret, arg, 0);
 }
 
+static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
+                           TCGReg a0, TCGReg a1, TCGReg a2,
+                           bool c2, bool is_32bit)
+{
+    if (c2) {
+        /*
+         * Fast path: semantics already satisfied due to constraint and
+         * insn behavior, single instruction is enough.
+         */
+        tcg_debug_assert(a2 == (is_32bit ? 32 : 64));
+        /* all clz/ctz insns belong to DJ-format */
+        tcg_out32(s, encode_dj_insn(opc, a0, a1));
+        return;
+    }
+
+    tcg_out32(s, encode_dj_insn(opc, TCG_REG_TMP0, a1));
+    /* a0 = a1 ? REG_TMP0 : a2 */
+    tcg_out_opc_maskeqz(s, TCG_REG_TMP0, TCG_REG_TMP0, a1);
+    tcg_out_opc_masknez(s, a0, a2, a1);
+    tcg_out_opc_or(s, a0, TCG_REG_TMP0, a0);
+}
+
 /*
  * Entry-points
  */
@@ -525,6 +547,20 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_opc_revb_d(s, a0, a1);
         break;
 
+    case INDEX_op_clz_i32:
+        tcg_out_clzctz(s, OPC_CLZ_W, a0, a1, a2, c2, true);
+        break;
+    case INDEX_op_clz_i64:
+        tcg_out_clzctz(s, OPC_CLZ_D, a0, a1, a2, c2, false);
+        break;
+
+    case INDEX_op_ctz_i32:
+        tcg_out_clzctz(s, OPC_CTZ_W, a0, a1, a2, c2, true);
+        break;
+    case INDEX_op_ctz_i64:
+        tcg_out_clzctz(s, OPC_CTZ_D, a0, a1, a2, c2, false);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
@@ -585,6 +621,12 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         /* LoongArch reg-imm bitops have their imms ZERO-extended */
         return C_O1_I2(r, r, rU);
 
+    case INDEX_op_clz_i32:
+    case INDEX_op_clz_i64:
+    case INDEX_op_ctz_i32:
+    case INDEX_op_ctz_i64:
+        return C_O1_I2(r, r, rW);
+
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
         /* Must deposit into the same register as input */
-- 
2.33.0



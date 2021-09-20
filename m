Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401DE41166F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:10:49 +0200 (CEST)
Received: from localhost ([::1]:51186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSK0O-0004ZT-9R
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEOn-0007he-7b
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:37 -0400
Received: from [115.28.160.31] (port=35554 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEOj-0005Df-49
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:37 -0400
Received: from ld50.lan (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 3E33F63400;
 Mon, 20 Sep 2021 16:05:50 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632125150; bh=CNbYzy9iyb7PL6X4R0+qyf9GBLd1LhfpCtVtZ5W5r4s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cU/fiHayVN7GSYDjEURZB/xv0YGuvNFy1jnQizoma4Gv19yi1nsnfSrEjon+QVQML
 k7sUeR0aiMa02mQE3+3R3pPcuB2dMh3IpVQlJ8bYtYhBQN7qRhNFvfV5E0HSMjBiw0
 mh2TWhPOkyFm/YnjEZ1LivSU0PTuY0EWg97Y04aY=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/30] tcg/loongarch: Implement clz/ctz ops
Date: Mon, 20 Sep 2021 16:04:36 +0800
Message-Id: <20210920080451.408655-16-git@xen0n.name>
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
 tcg/loongarch/tcg-target-con-set.h |  1 +
 tcg/loongarch/tcg-target.c.inc     | 31 ++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/tcg/loongarch/tcg-target-con-set.h b/tcg/loongarch/tcg-target-con-set.h
index b0751c4bb0..417c97549a 100644
--- a/tcg/loongarch/tcg-target-con-set.h
+++ b/tcg/loongarch/tcg-target-con-set.h
@@ -18,4 +18,5 @@ C_O0_I1(r)
 C_O1_I1(r, r)
 C_O1_I2(r, r, r)
 C_O1_I2(r, r, rU)
+C_O1_I2(r, r, rZ)
 C_O1_I2(r, 0, rZ)
diff --git a/tcg/loongarch/tcg-target.c.inc b/tcg/loongarch/tcg-target.c.inc
index d617b833e5..e817964a7e 100644
--- a/tcg/loongarch/tcg-target.c.inc
+++ b/tcg/loongarch/tcg-target.c.inc
@@ -362,6 +362,17 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
     tcg_out_opc_addi_w(s, ret, arg, 0);
 }
 
+static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
+                           TCGReg a0, TCGReg a1, TCGReg a2)
+{
+    /* all clz/ctz insns belong to DJ-format */
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
@@ -488,6 +499,20 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_opc_revb_d(s, a0, a1);
         break;
 
+    case INDEX_op_clz_i32:
+        tcg_out_clzctz(s, OPC_CLZ_W, a0, a1, a2);
+        break;
+    case INDEX_op_clz_i64:
+        tcg_out_clzctz(s, OPC_CLZ_D, a0, a1, a2);
+        break;
+
+    case INDEX_op_ctz_i32:
+        tcg_out_clzctz(s, OPC_CTZ_W, a0, a1, a2);
+        break;
+    case INDEX_op_ctz_i64:
+        tcg_out_clzctz(s, OPC_CTZ_D, a0, a1, a2);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
@@ -541,6 +566,12 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         /* LoongArch reg-imm bitops have their imms ZERO-extended */
         return C_O1_I2(r, r, rU);
 
+    case INDEX_op_clz_i32:
+    case INDEX_op_clz_i64:
+    case INDEX_op_ctz_i32:
+    case INDEX_op_ctz_i64:
+        return C_O1_I2(r, r, rZ);
+
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
         /* Must deposit into the same register as input */
-- 
2.33.0



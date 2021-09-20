Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78E34116B0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:17:39 +0200 (CEST)
Received: from localhost ([::1]:39578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSK70-0007K9-Ek
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEOs-0007pG-80
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:43 -0400
Received: from [115.28.160.31] (port=35564 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEOp-0005LK-E5
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:42 -0400
Received: from ld50.lan (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id BDA55633FD;
 Mon, 20 Sep 2021 16:05:41 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632125141; bh=ni7MWMxkDe5yTRg++aAg75SiilVWWQXzPUrFKLp2tbQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wOd+LZZJ34HcZ0pKP3xSi3v/QIwlj7RR2LRvOZPJqCADE/IpnVillW0HVdtcuBvSN
 audbo2qA2s8ffHB6gyvpKUxU/UCqR/blG3+eDeG6sqVne/TXmorP7tsR3gWl5heNeo
 Lxu7SBE3RumNgaK3ZMseJNo/MknYDFsJZFTDhInY=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/30] tcg/loongarch: Implement not/and/or/xor/nor/andc/orc ops
Date: Mon, 20 Sep 2021 16:04:33 +0800
Message-Id: <20210920080451.408655-13-git@xen0n.name>
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
 tcg/loongarch/tcg-target-con-set.h |  2 +
 tcg/loongarch/tcg-target.c.inc     | 69 ++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/tcg/loongarch/tcg-target-con-set.h b/tcg/loongarch/tcg-target-con-set.h
index 7e459490ea..385f503552 100644
--- a/tcg/loongarch/tcg-target-con-set.h
+++ b/tcg/loongarch/tcg-target-con-set.h
@@ -16,3 +16,5 @@
  */
 C_O0_I1(r)
 C_O1_I1(r, r)
+C_O1_I2(r, r, r)
+C_O1_I2(r, r, rU)
diff --git a/tcg/loongarch/tcg-target.c.inc b/tcg/loongarch/tcg-target.c.inc
index 0ee389fdaa..e364b6c1da 100644
--- a/tcg/loongarch/tcg-target.c.inc
+++ b/tcg/loongarch/tcg-target.c.inc
@@ -372,6 +372,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 {
     TCGArg a0 = args[0];
     TCGArg a1 = args[1];
+    TCGArg a2 = args[2];
+    int c2 = const_args[2];
 
     switch (opc) {
     case INDEX_op_mb:
@@ -417,6 +419,53 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_opc_srai_d(s, a0, a1, 32);
         break;
 
+    case INDEX_op_not_i32:
+    case INDEX_op_not_i64:
+        tcg_out_opc_nor(s, a0, a1, TCG_REG_ZERO);
+        break;
+
+    case INDEX_op_nor_i32:
+    case INDEX_op_nor_i64:
+        tcg_out_opc_nor(s, a0, a1, a2);
+        break;
+
+    case INDEX_op_andc_i32:
+    case INDEX_op_andc_i64:
+        tcg_out_opc_andn(s, a0, a1, a2);
+        break;
+
+    case INDEX_op_orc_i32:
+    case INDEX_op_orc_i64:
+        tcg_out_opc_orn(s, a0, a1, a2);
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
@@ -444,8 +493,28 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_extrl_i64_i32:
     case INDEX_op_extrh_i64_i32:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_not_i32:
+    case INDEX_op_not_i64:
         return C_O1_I1(r, r);
 
+    case INDEX_op_nor_i32:
+    case INDEX_op_andc_i32:
+    case INDEX_op_orc_i32:
+    case INDEX_op_nor_i64:
+    case INDEX_op_andc_i64:
+    case INDEX_op_orc_i64:
+        /* LoongArch insns for these ops don't have reg-imm forms */
+        return C_O1_I2(r, r, r);
+
+    case INDEX_op_and_i32:
+    case INDEX_op_or_i32:
+    case INDEX_op_xor_i32:
+    case INDEX_op_and_i64:
+    case INDEX_op_or_i64:
+    case INDEX_op_xor_i64:
+        /* LoongArch reg-imm bitops have their imms ZERO-extended */
+        return C_O1_I2(r, r, rU);
+
     default:
         g_assert_not_reached();
     }
-- 
2.33.0



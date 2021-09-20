Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AFA411662
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:07:51 +0200 (CEST)
Received: from localhost ([::1]:42786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSJxW-0007S6-HP
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEOs-0007ou-3a
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:43 -0400
Received: from [115.28.160.31] (port=35566 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEOp-0005LJ-9j
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:41 -0400
Received: from ld50.lan (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 6CCD763401;
 Mon, 20 Sep 2021 16:05:52 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632125152; bh=0QMTsi0TahJH4m+7t0jhPvrCiFBVkSLpJenID01b+DA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cwtaE8ne1Ipo5y8fOUZf/Aftf/0OMXQWbJcDmgvMiWq/jUNNCvn29EvlWv+h0OowA
 KEuVZ4rxeamJygAMoyzgnypcoJPnDXddTl4ay1DJmMti35F3VOXCCdnvu96z7QIjJ9
 t/q8KuTArQHjuNDwu2cEuv4Svpk3iAN16X4sMnxE=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/30] tcg/loongarch: Implement shl/shr/sar/rotl/rotr ops
Date: Mon, 20 Sep 2021 16:04:37 +0800
Message-Id: <20210920080451.408655-17-git@xen0n.name>
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
 tcg/loongarch/tcg-target.c.inc     | 91 ++++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/tcg/loongarch/tcg-target-con-set.h b/tcg/loongarch/tcg-target-con-set.h
index 417c97549a..8630d1ee6e 100644
--- a/tcg/loongarch/tcg-target-con-set.h
+++ b/tcg/loongarch/tcg-target-con-set.h
@@ -17,6 +17,7 @@
 C_O0_I1(r)
 C_O1_I1(r, r)
 C_O1_I2(r, r, r)
+C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rU)
 C_O1_I2(r, r, rZ)
 C_O1_I2(r, 0, rZ)
diff --git a/tcg/loongarch/tcg-target.c.inc b/tcg/loongarch/tcg-target.c.inc
index e817964a7e..acbd0e65ef 100644
--- a/tcg/loongarch/tcg-target.c.inc
+++ b/tcg/loongarch/tcg-target.c.inc
@@ -513,6 +513,85 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_clzctz(s, OPC_CTZ_D, a0, a1, a2);
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
+        /* transform into equivalent rotr_i32 */
+        if (c2) {
+            a2 = 32 - a2;
+        } else {
+            tcg_out_opc_sub_w(s, a2, TCG_REG_ZERO, a2);
+            tcg_out_opc_addi_w(s, a2, a2, 32);
+        }
+        /* fallthrough */
+    case INDEX_op_rotr_i32:
+        if (c2) {
+            tcg_out_opc_rotri_w(s, a0, a1, a2 & 0x1f);
+        } else {
+            tcg_out_opc_rotr_w(s, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_rotl_i64:
+        /* transform into equivalent rotr_i64 */
+        if (c2) {
+            a2 = 64 - a2;
+        } else {
+            tcg_out_opc_sub_w(s, a2, TCG_REG_ZERO, a2);
+            tcg_out_opc_addi_w(s, a2, a2, 64);
+        }
+        /* fallthrough */
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
@@ -557,6 +636,18 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         /* LoongArch insns for these ops don't have reg-imm forms */
         return C_O1_I2(r, r, r);
 
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
     case INDEX_op_or_i32:
     case INDEX_op_xor_i32:
-- 
2.33.0



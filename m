Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D644411633
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 15:59:55 +0200 (CEST)
Received: from localhost ([::1]:53712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSJpq-0004CP-D9
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 09:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEP5-0008Hw-0y
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:55 -0400
Received: from [115.28.160.31] (port=35586 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEP3-0005Pp-3S
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:54 -0400
Received: from ld50.lan (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 747BD63402;
 Mon, 20 Sep 2021 16:05:55 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632125155; bh=RzCAPeUwu1c6n1MA5068MRQwMrVm4D1AJAPgv08dO7U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vp+fIZsagoF/3VRS609bM2u1G+6YAmZiZKWYOOiyuOnfx/KP/wBw/+sT6HKKyCbRL
 7ltBZJv5sGUHti50oTkCf7SifEaaQodTgeOCJ3XbPwz9jbxDt4kZzHGX1T4GNkpiXU
 nSUV6j4FRaST1lZOQrCfnuAWQHHl2OLO0V+r2QqE=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/30] tcg/loongarch: Implement neg/add/sub ops
Date: Mon, 20 Sep 2021 16:04:38 +0800
Message-Id: <20210920080451.408655-18-git@xen0n.name>
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
 tcg/loongarch/tcg-target-con-set.h |  2 ++
 tcg/loongarch/tcg-target.c.inc     | 47 ++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/tcg/loongarch/tcg-target-con-set.h b/tcg/loongarch/tcg-target-con-set.h
index 8630d1ee6e..58b5c487e2 100644
--- a/tcg/loongarch/tcg-target-con-set.h
+++ b/tcg/loongarch/tcg-target-con-set.h
@@ -18,6 +18,8 @@ C_O0_I1(r)
 C_O1_I1(r, r)
 C_O1_I2(r, r, r)
 C_O1_I2(r, r, ri)
+C_O1_I2(r, r, rI)
 C_O1_I2(r, r, rU)
 C_O1_I2(r, r, rZ)
 C_O1_I2(r, 0, rZ)
+C_O1_I2(r, rZ, rN)
diff --git a/tcg/loongarch/tcg-target.c.inc b/tcg/loongarch/tcg-target.c.inc
index acbd0e65ef..e5518c0102 100644
--- a/tcg/loongarch/tcg-target.c.inc
+++ b/tcg/loongarch/tcg-target.c.inc
@@ -592,6 +592,43 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    case INDEX_op_neg_i32:
+        tcg_out_opc_sub_w(s, a0, TCG_REG_ZERO, a1);
+        break;
+    case INDEX_op_neg_i64:
+        tcg_out_opc_sub_d(s, a0, TCG_REG_ZERO, a1);
+        break;
+
+    case INDEX_op_add_i32:
+        if (c2) {
+            tcg_out_opc_addi_w(s, a0, a1, a2);
+        } else {
+            tcg_out_opc_add_w(s, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_add_i64:
+        if (c2) {
+            tcg_out_opc_addi_d(s, a0, a1, a2);
+        } else {
+            tcg_out_opc_add_d(s, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_sub_i32:
+        if (c2) {
+            tcg_out_opc_addi_w(s, a0, a1, -a2);
+        } else {
+            tcg_out_opc_sub_w(s, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_sub_i64:
+        if (c2) {
+            tcg_out_opc_addi_d(s, a0, a1, -a2);
+        } else {
+            tcg_out_opc_sub_d(s, a0, a1, a2);
+        }
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
@@ -625,6 +662,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_extract_i64:
     case INDEX_op_bswap32_i32:
     case INDEX_op_bswap64_i64:
+    case INDEX_op_neg_i32:
+    case INDEX_op_neg_i64:
         return C_O1_I1(r, r);
 
     case INDEX_op_nor_i32:
@@ -648,6 +687,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_rotr_i64:
         return C_O1_I2(r, r, ri);
 
+    case INDEX_op_add_i32:
+    case INDEX_op_add_i64:
+        return C_O1_I2(r, r, rI);
+
     case INDEX_op_and_i32:
     case INDEX_op_or_i32:
     case INDEX_op_xor_i32:
@@ -668,6 +711,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         /* Must deposit into the same register as input */
         return C_O1_I2(r, 0, rZ);
 
+    case INDEX_op_sub_i32:
+    case INDEX_op_sub_i64:
+        return C_O1_I2(r, rZ, rN);
+
     default:
         g_assert_not_reached();
     }
-- 
2.33.0



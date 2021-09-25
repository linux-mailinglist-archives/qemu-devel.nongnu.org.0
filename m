Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168D24183BD
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 19:46:08 +0200 (CEST)
Received: from localhost ([::1]:39232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUBkV-0005sh-2i
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 13:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mUBWL-0002Wp-Nm
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:31:29 -0400
Received: from [115.28.160.31] (port=57206 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mUBWH-0005U8-G4
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:31:28 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B5B1060B41;
 Sun, 26 Sep 2021 01:30:55 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632591055; bh=761/xkxZRmzusdo2RzJAhC2ld/h5Mtv5Q7yJCSj0B38=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r+DHhp+t81Y9Kd+SFDPnxAxpKWeXgFHqcGMojCsVUt04GH5fpjoDXqDZ2io1tJiNp
 KooDXVgJ/6js6YkzuVjHhvpioh+M7Nyllu5Kry5Is9jEqHs/i7vRuYdrb/Fm8GL/yc
 nLPiy96BekIyBCwv3MjgEdn0/5Lp6WlzgMxjfRk4=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 17/30] tcg/loongarch64: Implement add/sub ops
Date: Sun, 26 Sep 2021 01:30:19 +0800
Message-Id: <20210925173032.2434906-18-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210925173032.2434906-1-git@xen0n.name>
References: <20210925173032.2434906-1-git@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 WANG Xuerui <git@xen0n.name>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The neg_i{32,64} ops is fully expressible with sub, so omitted for
simplicity.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  2 ++
 tcg/loongarch64/tcg-target.c.inc     | 38 ++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 42f8e28741..4b8ce85897 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -18,6 +18,8 @@ C_O0_I1(r)
 C_O1_I1(r, r)
 C_O1_I2(r, r, rC)
 C_O1_I2(r, r, ri)
+C_O1_I2(r, r, rI)
 C_O1_I2(r, r, rU)
 C_O1_I2(r, r, rW)
 C_O1_I2(r, 0, rZ)
+C_O1_I2(r, rZ, rN)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index d0a24cc009..0e6b241097 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -687,6 +687,36 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
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
@@ -748,6 +778,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_rotr_i64:
         return C_O1_I2(r, r, ri);
 
+    case INDEX_op_add_i32:
+    case INDEX_op_add_i64:
+        return C_O1_I2(r, r, rI);
+
     case INDEX_op_and_i32:
     case INDEX_op_and_i64:
     case INDEX_op_nor_i32:
@@ -770,6 +804,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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



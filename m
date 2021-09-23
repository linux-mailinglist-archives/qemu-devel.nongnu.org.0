Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430E2416431
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 19:16:21 +0200 (CEST)
Received: from localhost ([::1]:53428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTSKa-0006VU-6d
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 13:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mTS5D-0005rI-2d
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 13:00:27 -0400
Received: from [115.28.160.31] (port=54394 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mTS5A-0005XK-P6
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 13:00:26 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C9DE960AF7;
 Fri, 24 Sep 2021 01:00:21 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632416421; bh=JpLLpQ1/9V2GKYJEdoNgg5xadnJR1Wj6f8D1MRxriCg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e4Qf8XPbqL7pKjo6PnqPbD5qKAS2jMpm99cLrJxx2WHlZtNGMHJT63gcj1uGykPTq
 +8P7XINkmk5p1SWVT73k2+0WX+xJmWcMSaq9rLDQL9sBSUK0flItIrE066NzbdXmkj
 IPGrY+Vn38T3w2PWY8VkkLZZEGnlIRwAzmKyLdEI=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/30] tcg/loongarch64: Implement sign-/zero-extension ops
Date: Fri, 24 Sep 2021 00:59:20 +0800
Message-Id: <20210923165939.729081-12-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923165939.729081-1-git@xen0n.name>
References: <20210923165939.729081-1-git@xen0n.name>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  1 +
 tcg/loongarch64/tcg-target.c.inc     | 82 ++++++++++++++++++++++++++++
 tcg/loongarch64/tcg-target.h         | 24 ++++----
 3 files changed, 95 insertions(+), 12 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 5cc4407367..7e459490ea 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -15,3 +15,4 @@
  * tcg-target-con-str.h; the constraint combination is inclusive or.
  */
 C_O0_I1(r)
+C_O1_I1(r, r)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 21f812a6a9..346e232129 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -356,6 +356,36 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
     }
 }
 
+static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_andi(s, ret, arg, 0xff);
+}
+
+static void tcg_out_ext16u(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_bstrpick_w(s, ret, arg, 0, 15);
+}
+
+static void tcg_out_ext32u(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_bstrpick_d(s, ret, arg, 0, 31);
+}
+
+static void tcg_out_ext8s(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_sext_b(s, ret, arg);
+}
+
+static void tcg_out_ext16s(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_sext_h(s, ret, arg);
+}
+
+static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_addi_w(s, ret, arg, 0);
+}
+
 /*
  * Entry-points
  */
@@ -365,6 +395,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGArg a0 = args[0];
+    TCGArg a1 = args[1];
 
     switch (opc) {
     case INDEX_op_mb:
@@ -375,6 +406,41 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_opc_jirl(s, TCG_REG_ZERO, a0, 0);
         break;
 
+    case INDEX_op_ext8s_i32:
+    case INDEX_op_ext8s_i64:
+        tcg_out_ext8s(s, a0, a1);
+        break;
+
+    case INDEX_op_ext8u_i32:
+    case INDEX_op_ext8u_i64:
+        tcg_out_ext8u(s, a0, a1);
+        break;
+
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
+        tcg_out_ext16s(s, a0, a1);
+        break;
+
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
+        tcg_out_ext16u(s, a0, a1);
+        break;
+
+    case INDEX_op_ext32u_i64:
+    case INDEX_op_extu_i32_i64:
+        tcg_out_ext32u(s, a0, a1);
+        break;
+
+    case INDEX_op_ext32s_i64:
+    case INDEX_op_extrl_i64_i32:
+    case INDEX_op_ext_i32_i64:
+        tcg_out_ext32s(s, a0, a1);
+        break;
+
+    case INDEX_op_extrh_i64_i32:
+        tcg_out_opc_srai_d(s, a0, a1, 32);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
@@ -388,6 +454,22 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_goto_ptr:
         return C_O0_I1(r);
 
+    case INDEX_op_ext8s_i32:
+    case INDEX_op_ext8s_i64:
+    case INDEX_op_ext8u_i32:
+    case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
+    case INDEX_op_ext32s_i64:
+    case INDEX_op_ext32u_i64:
+    case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
+    case INDEX_op_extrh_i64_i32:
+    case INDEX_op_ext_i32_i64:
+        return C_O1_I1(r, r);
+
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 5fc097b3c1..2b7d5a19b9 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -107,10 +107,10 @@ typedef enum {
 #define TCG_TARGET_HAS_muls2_i32        0
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
-#define TCG_TARGET_HAS_ext8s_i32        0
-#define TCG_TARGET_HAS_ext16s_i32       0
-#define TCG_TARGET_HAS_ext8u_i32        0
-#define TCG_TARGET_HAS_ext16u_i32       0
+#define TCG_TARGET_HAS_ext8s_i32        1
+#define TCG_TARGET_HAS_ext16s_i32       1
+#define TCG_TARGET_HAS_ext8u_i32        1
+#define TCG_TARGET_HAS_ext16u_i32       1
 #define TCG_TARGET_HAS_bswap16_i32      0
 #define TCG_TARGET_HAS_bswap32_i32      0
 #define TCG_TARGET_HAS_not_i32          0
@@ -138,14 +138,14 @@ typedef enum {
 #define TCG_TARGET_HAS_extract_i64      0
 #define TCG_TARGET_HAS_sextract_i64     0
 #define TCG_TARGET_HAS_extract2_i64     0
-#define TCG_TARGET_HAS_extrl_i64_i32    0
-#define TCG_TARGET_HAS_extrh_i64_i32    0
-#define TCG_TARGET_HAS_ext8s_i64        0
-#define TCG_TARGET_HAS_ext16s_i64       0
-#define TCG_TARGET_HAS_ext32s_i64       0
-#define TCG_TARGET_HAS_ext8u_i64        0
-#define TCG_TARGET_HAS_ext16u_i64       0
-#define TCG_TARGET_HAS_ext32u_i64       0
+#define TCG_TARGET_HAS_extrl_i64_i32    1
+#define TCG_TARGET_HAS_extrh_i64_i32    1
+#define TCG_TARGET_HAS_ext8s_i64        1
+#define TCG_TARGET_HAS_ext16s_i64       1
+#define TCG_TARGET_HAS_ext32s_i64       1
+#define TCG_TARGET_HAS_ext8u_i64        1
+#define TCG_TARGET_HAS_ext16u_i64       1
+#define TCG_TARGET_HAS_ext32u_i64       1
 #define TCG_TARGET_HAS_bswap16_i64      0
 #define TCG_TARGET_HAS_bswap32_i64      0
 #define TCG_TARGET_HAS_bswap64_i64      0
-- 
2.33.0



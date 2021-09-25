Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5464183CC
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 19:50:10 +0200 (CEST)
Received: from localhost ([::1]:47746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUBoO-0003IV-F3
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 13:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mUBWP-0002a3-I0
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:31:35 -0400
Received: from [115.28.160.31] (port=57204 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mUBWH-0005U9-GX
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:31:33 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 0409C60B42;
 Sun, 26 Sep 2021 01:30:55 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632591056; bh=RlWIwDGEnYCVsh1ppznaey1ePzVnXCDqGe3U9uh8jXs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cpub2RwRASLRzC1FrbIWoshWUDhrTzqPjEh2kQVmkSiHtd2uCKfL1S3QKzXrc7mEs
 8yG0wPo2FF1KHBnwI6avZCXEhlffjEfmi9uyH1Fx8FscTZV2k/jIa9a2LOsBQ6Syya
 8luqTBoGVmR6bQxMx7gq72/62Azz9o7vkK/QW/F0=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 18/30] tcg/loongarch64: Implement
 mul/mulsh/muluh/div/divu/rem/remu ops
Date: Sun, 26 Sep 2021 01:30:20 +0800
Message-Id: <20210925173032.2434906-19-git@xen0n.name>
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

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  1 +
 tcg/loongarch64/tcg-target.c.inc     | 65 ++++++++++++++++++++++++++++
 tcg/loongarch64/tcg-target.h         | 16 +++----
 3 files changed, 74 insertions(+), 8 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 4b8ce85897..fb56f3a295 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -23,3 +23,4 @@ C_O1_I2(r, r, rU)
 C_O1_I2(r, r, rW)
 C_O1_I2(r, 0, rZ)
 C_O1_I2(r, rZ, rN)
+C_O1_I2(r, rZ, rZ)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 0e6b241097..67f07a3853 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -717,6 +717,55 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    case INDEX_op_mul_i32:
+        tcg_out_opc_mul_w(s, a0, a1, a2);
+        break;
+    case INDEX_op_mul_i64:
+        tcg_out_opc_mul_d(s, a0, a1, a2);
+        break;
+
+    case INDEX_op_mulsh_i32:
+        tcg_out_opc_mulh_w(s, a0, a1, a2);
+        break;
+    case INDEX_op_mulsh_i64:
+        tcg_out_opc_mulh_d(s, a0, a1, a2);
+        break;
+
+    case INDEX_op_muluh_i32:
+        tcg_out_opc_mulh_wu(s, a0, a1, a2);
+        break;
+    case INDEX_op_muluh_i64:
+        tcg_out_opc_mulh_du(s, a0, a1, a2);
+        break;
+
+    case INDEX_op_div_i32:
+        tcg_out_opc_div_w(s, a0, a1, a2);
+        break;
+    case INDEX_op_div_i64:
+        tcg_out_opc_div_d(s, a0, a1, a2);
+        break;
+
+    case INDEX_op_divu_i32:
+        tcg_out_opc_div_wu(s, a0, a1, a2);
+        break;
+    case INDEX_op_divu_i64:
+        tcg_out_opc_div_du(s, a0, a1, a2);
+        break;
+
+    case INDEX_op_rem_i32:
+        tcg_out_opc_mod_w(s, a0, a1, a2);
+        break;
+    case INDEX_op_rem_i64:
+        tcg_out_opc_mod_d(s, a0, a1, a2);
+        break;
+
+    case INDEX_op_remu_i32:
+        tcg_out_opc_mod_wu(s, a0, a1, a2);
+        break;
+    case INDEX_op_remu_i64:
+        tcg_out_opc_mod_du(s, a0, a1, a2);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
@@ -808,6 +857,22 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_sub_i64:
         return C_O1_I2(r, rZ, rN);
 
+    case INDEX_op_mul_i32:
+    case INDEX_op_mul_i64:
+    case INDEX_op_mulsh_i32:
+    case INDEX_op_mulsh_i64:
+    case INDEX_op_muluh_i32:
+    case INDEX_op_muluh_i64:
+    case INDEX_op_div_i32:
+    case INDEX_op_div_i64:
+    case INDEX_op_divu_i32:
+    case INDEX_op_divu_i64:
+    case INDEX_op_rem_i32:
+    case INDEX_op_rem_i64:
+    case INDEX_op_remu_i32:
+    case INDEX_op_remu_i64:
+        return C_O1_I2(r, rZ, rZ);
+
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index e59c2a7bec..2ac2c342c7 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -93,8 +93,8 @@ typedef enum {
 
 /* optional instructions */
 #define TCG_TARGET_HAS_movcond_i32      0
-#define TCG_TARGET_HAS_div_i32          0
-#define TCG_TARGET_HAS_rem_i32          0
+#define TCG_TARGET_HAS_div_i32          1
+#define TCG_TARGET_HAS_rem_i32          1
 #define TCG_TARGET_HAS_div2_i32         0
 #define TCG_TARGET_HAS_rot_i32          1
 #define TCG_TARGET_HAS_deposit_i32      1
@@ -105,8 +105,8 @@ typedef enum {
 #define TCG_TARGET_HAS_sub2_i32         0
 #define TCG_TARGET_HAS_mulu2_i32        0
 #define TCG_TARGET_HAS_muls2_i32        0
-#define TCG_TARGET_HAS_muluh_i32        0
-#define TCG_TARGET_HAS_mulsh_i32        0
+#define TCG_TARGET_HAS_muluh_i32        1
+#define TCG_TARGET_HAS_mulsh_i32        1
 #define TCG_TARGET_HAS_ext8s_i32        1
 #define TCG_TARGET_HAS_ext16s_i32       1
 #define TCG_TARGET_HAS_ext8u_i32        1
@@ -130,8 +130,8 @@ typedef enum {
 
 /* 64-bit operations */
 #define TCG_TARGET_HAS_movcond_i64      0
-#define TCG_TARGET_HAS_div_i64          0
-#define TCG_TARGET_HAS_rem_i64          0
+#define TCG_TARGET_HAS_div_i64          1
+#define TCG_TARGET_HAS_rem_i64          1
 #define TCG_TARGET_HAS_div2_i64         0
 #define TCG_TARGET_HAS_rot_i64          1
 #define TCG_TARGET_HAS_deposit_i64      1
@@ -163,8 +163,8 @@ typedef enum {
 #define TCG_TARGET_HAS_sub2_i64         0
 #define TCG_TARGET_HAS_mulu2_i64        0
 #define TCG_TARGET_HAS_muls2_i64        0
-#define TCG_TARGET_HAS_muluh_i64        0
-#define TCG_TARGET_HAS_mulsh_i64        0
+#define TCG_TARGET_HAS_muluh_i64        1
+#define TCG_TARGET_HAS_mulsh_i64        1
 
 /* not defined -- call should be eliminated at compile time */
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
-- 
2.33.0



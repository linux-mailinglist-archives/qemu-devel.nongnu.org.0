Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824C1473E00
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 09:08:15 +0100 (CET)
Received: from localhost ([::1]:58570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx2r8-0003M8-Kh
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 03:08:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mx2mv-00074Y-1C
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 03:03:53 -0500
Received: from mail.xen0n.name ([115.28.160.31]:48622
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mx2mr-0000WW-Ao
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 03:03:51 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 0F5976019B;
 Tue, 14 Dec 2021 16:03:31 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1639469011; bh=4+YSPqote877zVls2wyAaAcCnnz1PiAYXkI8YjFNuvI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sZL9eBqe1ze4wmLnKI+xThqxPtIrk57G8U0vPfCghboA8xb3VUDzj9tJixdJmBPU/
 DZq0sJXaj5YR7VAUzjPr9tAIbDqi+a0CrQg3jYvt4Z3iAPw6R0xMjX6LpCVgZv9QO9
 IsjeqN2Qi7QQHSCizBCqbDIFm41EY+ojk2W3HFeY=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 18/31] tcg/loongarch64: Implement
 mul/mulsh/muluh/div/divu/rem/remu ops
Date: Tue, 14 Dec 2021 16:01:41 +0800
Message-Id: <20211214080154.196350-19-git@xen0n.name>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211214080154.196350-1-git@xen0n.name>
References: <20211214080154.196350-1-git@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Song Gao <gaosong@loongson.cn>
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
2.34.0



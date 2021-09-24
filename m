Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0347E4179F8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:44:28 +0200 (CEST)
Received: from localhost ([::1]:42310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTpFJ-00043X-Qv
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mToyS-00075b-7d
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 13:27:00 -0400
Received: from [115.28.160.31] (port=41460 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mToyQ-0004Z9-4V
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 13:27:00 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id F195460B1A;
 Sat, 25 Sep 2021 01:26:54 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632504415; bh=t0zjfJ23w7e/HyadW08PkqYpHv/p4aKWRKzKu4E1qGc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uGtIFq4SXreO7Sew79FAiyi5ayTmQiP+J70BAwNhHetavkqrT41Uj0DOrpmGcUQgC
 MFumJBcBKSxT/qbn90AfWVicr4eXsSHkfdJTRsfZvt35+XCKlENORFgVnKniCC0kZp
 hWymXAXlrLIkocIhQT3vxge88mD0/XI6mLnLicyk=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/30] tcg/loongarch64: Implement deposit/extract ops
Date: Sat, 25 Sep 2021 01:25:10 +0800
Message-Id: <20210924172527.904294-14-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924172527.904294-1-git@xen0n.name>
References: <20210924172527.904294-1-git@xen0n.name>
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
 tcg/loongarch64/tcg-target.c.inc     | 21 +++++++++++++++++++++
 tcg/loongarch64/tcg-target.h         |  8 ++++----
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 9ac24b8ad0..d958183020 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -18,3 +18,4 @@ C_O0_I1(r)
 C_O1_I1(r, r)
 C_O1_I2(r, r, rC)
 C_O1_I2(r, r, rU)
+C_O1_I2(r, 0, rZ)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index fd77afdd90..c9554936fc 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -503,6 +503,20 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    case INDEX_op_extract_i32:
+        tcg_out_opc_bstrpick_w(s, a0, a1, a2, a2 + args[3] - 1);
+        break;
+    case INDEX_op_extract_i64:
+        tcg_out_opc_bstrpick_d(s, a0, a1, a2, a2 + args[3] - 1);
+        break;
+
+    case INDEX_op_deposit_i32:
+        tcg_out_opc_bstrins_w(s, a0, a2, args[3], args[3] + args[4] - 1);
+        break;
+    case INDEX_op_deposit_i64:
+        tcg_out_opc_bstrins_d(s, a0, a2, args[3], args[3] + args[4] - 1);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
@@ -532,6 +546,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ext_i32_i64:
     case INDEX_op_not_i32:
     case INDEX_op_not_i64:
+    case INDEX_op_extract_i32:
+    case INDEX_op_extract_i64:
         return C_O1_I1(r, r);
 
     case INDEX_op_andc_i32:
@@ -556,6 +572,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         /* LoongArch reg-imm bitops have their imms ZERO-extended */
         return C_O1_I2(r, r, rU);
 
+    case INDEX_op_deposit_i32:
+    case INDEX_op_deposit_i64:
+        /* Must deposit into the same register as input */
+        return C_O1_I2(r, 0, rZ);
+
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index cb1739a54a..084d635a8e 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -97,8 +97,8 @@ typedef enum {
 #define TCG_TARGET_HAS_rem_i32          0
 #define TCG_TARGET_HAS_div2_i32         0
 #define TCG_TARGET_HAS_rot_i32          0
-#define TCG_TARGET_HAS_deposit_i32      0
-#define TCG_TARGET_HAS_extract_i32      0
+#define TCG_TARGET_HAS_deposit_i32      1
+#define TCG_TARGET_HAS_extract_i32      1
 #define TCG_TARGET_HAS_sextract_i32     0
 #define TCG_TARGET_HAS_extract2_i32     0
 #define TCG_TARGET_HAS_add2_i32         0
@@ -134,8 +134,8 @@ typedef enum {
 #define TCG_TARGET_HAS_rem_i64          0
 #define TCG_TARGET_HAS_div2_i64         0
 #define TCG_TARGET_HAS_rot_i64          0
-#define TCG_TARGET_HAS_deposit_i64      0
-#define TCG_TARGET_HAS_extract_i64      0
+#define TCG_TARGET_HAS_deposit_i64      1
+#define TCG_TARGET_HAS_extract_i64      1
 #define TCG_TARGET_HAS_sextract_i64     0
 #define TCG_TARGET_HAS_extract2_i64     0
 #define TCG_TARGET_HAS_extrl_i64_i32    1
-- 
2.33.0



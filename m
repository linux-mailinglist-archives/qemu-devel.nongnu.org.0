Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDD0413B61
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 22:31:32 +0200 (CEST)
Received: from localhost ([::1]:44226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSmQN-00076E-Rf
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 16:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmF9-0004gA-Jz
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:19:55 -0400
Received: from [115.28.160.31] (port=56018 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmF6-0000X6-Tf
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:19:55 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 13E3E63403;
 Wed, 22 Sep 2021 04:19:28 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632255568; bh=f1NEE8g7+34sLipIY1d0LN7sUTofXYXsGDMwSWe2IA0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PxLNtLqBxjonNeXMyY7mGSXuJ9QvKm9i5sBgX7MQG++Te1tuc0TaNY2Q2JdTHPa6o
 wKiN4EtoWcQsqv6jJgXjyGJONt6ibY3nBrCDCG88mfhktZvPzMbjmRKQSniwJxw5NC
 8Zjfks/f2XUpc1hFv2GmeZfCHSXOdSANpbUFgYnk=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/30] tcg/loongarch64: Implement
 mul/mulsh/muluh/div/divu/rem/remu ops
Date: Wed, 22 Sep 2021 04:19:03 +0800
Message-Id: <20210921201915.601245-19-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921201915.601245-1-git@xen0n.name>
References: <20210921201915.601245-1-git@xen0n.name>
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
Cc: WANG Xuerui <git@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  1 +
 tcg/loongarch64/tcg-target.c.inc     | 65 ++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

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
index e1b333120d..802066035b 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -670,6 +670,55 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -761,6 +810,22 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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
-- 
2.33.0



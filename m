Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 784CB413B63
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 22:31:39 +0200 (CEST)
Received: from localhost ([::1]:44690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSmQU-0007Op-Ds
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 16:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmF9-0004hX-TC
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:19:55 -0400
Received: from [115.28.160.31] (port=56022 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmF7-0000Xv-Lt
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:19:55 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 795C963406;
 Wed, 22 Sep 2021 04:19:28 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632255568; bh=jqiuI2TMYYZhvjXdPOUkPnDq+r0pUiZfXerj64dp1Ns=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DLs8c6cf3uOg6m0SAaSP0A5owBtEX5LH9CH6BoAG4fvhj1Ze13nsgUtpJSZSAudhU
 gURY8xxzDmvxfIj58y4yb6/3FlFptWWMDYk7Ab/9nyreZnMz8VbDVLAdt4QXiXV90x
 o0iSpActhMz4WK2tM6ezULiZ7S0T1CMoB9EtbrsU=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/30] tcg/loongarch64: Implement tcg_out_call
Date: Wed, 22 Sep 2021 04:19:06 +0800
Message-Id: <20210921201915.601245-22-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921201915.601245-1-git@xen0n.name>
References: <20210921201915.601245-1-git@xen0n.name>
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 tcg/loongarch64/tcg-target.c.inc | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 08e6541dcf..44532ee1e4 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -491,6 +491,39 @@ static void tcg_out_brcond(TCGContext *s, TCGCond cond, TCGReg arg1,
     tcg_out32(s, encode_djsk16_insn(op, arg1, arg2, 0));
 }
 
+static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
+{
+    TCGReg link = tail ? TCG_REG_ZERO : TCG_REG_RA;
+    ptrdiff_t offset = tcg_pcrel_diff(s, arg);
+
+    tcg_debug_assert((offset & 3) == 0);
+    if (offset == sextreg(offset, 0, 28)) {
+        /* short jump: +/- 256MiB */
+        if (tail) {
+            tcg_out_opc_b(s, offset >> 2);
+        } else {
+            tcg_out_opc_bl(s, offset >> 2);
+        }
+    } else if (offset == sextreg(offset, 0, 38)) {
+        /* long jump: +/- 256GiB */
+        tcg_target_long lo = sextreg(offset, 0, 18);
+        tcg_target_long hi = offset - lo;
+        tcg_out_opc_pcaddu18i(s, TCG_REG_TMP0, hi >> 18);
+        tcg_out_opc_jirl(s, link, TCG_REG_TMP0, lo >> 2);
+    } else {
+        /* far jump: 64-bit */
+        tcg_target_long lo = sextreg((tcg_target_long)arg, 0, 18);
+        tcg_target_long hi = (tcg_target_long)arg - lo;
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP0, hi);
+        tcg_out_opc_jirl(s, link, TCG_REG_TMP0, lo >> 2);
+    }
+}
+
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
+{
+    tcg_out_call_int(s, arg, false);
+}
+
 /*
  * Entry-points
  */
@@ -842,6 +875,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
+    case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     default:
         g_assert_not_reached();
     }
-- 
2.33.0



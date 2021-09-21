Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E983C413B55
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 22:28:08 +0200 (CEST)
Received: from localhost ([::1]:35852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSmN6-0001Vu-04
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 16:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmF8-0004aS-4C
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:19:54 -0400
Received: from [115.28.160.31] (port=56006 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmF5-0000Vr-3t
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:19:53 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 8DDBA633FF;
 Wed, 22 Sep 2021 04:19:27 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632255567; bh=Isq8Bm1hj7jeXto+9cPshOSHymkPz07Q6T0DGZ1hhos=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wKZMkjWkJ8vZGNb1nVaJxZrgVtoryTn+t0gIXtEvoWcgsZaA7Eh/JfgztquZ1sTw/
 I53EQeVip4q6rU8h/PES1x1hWo63Kq5ZdON3kuTdy/BAojPkebb7Bo/ym5bZfLq9Ax
 754YDjUupDIRlaO8WBdSl+tkwS5SQrB/UEX+BCbM=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/30] tcg/loongarch64: Implement
 bswap32_i32/bswap32_i64/bswap64_i64
Date: Wed, 22 Sep 2021 04:18:59 +0800
Message-Id: <20210921201915.601245-15-git@xen0n.name>
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 tcg/loongarch64/tcg-target.c.inc | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 27066960cf..e7b5f2c5ab 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -508,6 +508,23 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_opc_bstrins_d(s, a0, a2, args[3], args[3] + args[4] - 1);
         break;
 
+    case INDEX_op_bswap32_i32:
+        /* All 32-bit values are computed sign-extended in the register.  */
+        a2 = TCG_BSWAP_OS;
+        /* fallthrough */
+    case INDEX_op_bswap32_i64:
+        tcg_out_opc_revb_2w(s, a0, a1);
+        if (a2 & TCG_BSWAP_OS) {
+            tcg_out_ext32s(s, a0, a0);
+        } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            tcg_out_ext32u(s, a0, a0);
+        }
+        break;
+
+    case INDEX_op_bswap64_i64:
+        tcg_out_opc_revb_d(s, a0, a1);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
@@ -539,6 +556,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_not_i64:
     case INDEX_op_extract_i32:
     case INDEX_op_extract_i64:
+    case INDEX_op_bswap32_i32:
+    case INDEX_op_bswap32_i64:
+    case INDEX_op_bswap64_i64:
         return C_O1_I1(r, r);
 
     case INDEX_op_andc_i32:
-- 
2.33.0



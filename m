Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE378411661
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:07:50 +0200 (CEST)
Received: from localhost ([::1]:42550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSJxV-0007I2-TL
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEOn-0007hc-2R
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:37 -0400
Received: from [115.28.160.31] (port=35560 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEOj-0005Dx-4A
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:36 -0400
Received: from ld50.lan (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 3524C63406;
 Mon, 20 Sep 2021 16:06:05 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632125165; bh=YMTlbote+jZVGnAyPC9IZ5S0JP/N577aC42WFM/ARxE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qqYT8x2bXQVgqORA2A/PuSD4urZZKzKfFJwiNB2Ln5/AnAg8nWOLsgdqfZoz7Qite
 a6krojO0c8ORviV5dmSkNEwzdYgW/6M5k2RgY6MCmEYx2SoNlEbig2T7O2juNNURRj
 WLFQXmYFBRyJ0ywyQKPkFObKqJobAZRv9LyO+eNg=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/30] tcg/loongarch: Implement tcg_out_call
Date: Mon, 20 Sep 2021 16:04:42 +0800
Message-Id: <20210920080451.408655-22-git@xen0n.name>
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
 tcg/loongarch/tcg-target.c.inc | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tcg/loongarch/tcg-target.c.inc b/tcg/loongarch/tcg-target.c.inc
index fb0143474a..01c6002fdb 100644
--- a/tcg/loongarch/tcg-target.c.inc
+++ b/tcg/loongarch/tcg-target.c.inc
@@ -457,6 +457,42 @@ static void tcg_out_brcond(TCGContext *s, TCGCond cond, TCGReg arg1,
     tcg_out32(s, encode_djsk16_insn(op, arg1, arg2, 0));
 }
 
+static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
+{
+    TCGReg link = tail ? TCG_REG_ZERO : TCG_REG_RA;
+    ptrdiff_t offset = tcg_pcrel_diff(s, arg);
+    int ret;
+
+    tcg_debug_assert((offset & 2) == 0);
+    if (offset == sextreg(offset, 0, 28)) {
+        /* short jump: +/- 256MiB */
+        if (tail) {
+            tcg_out_opc_b(s, offset >> 2);
+        } else {
+            tcg_out_opc_bl(s, offset >> 2);
+        }
+    } else if (TCG_TARGET_REG_BITS == 32 || offset == (int32_t)offset) {
+        /* long jump: +/- 2GiB */
+        tcg_out_opc_pcaddu12i(s, TCG_REG_TMP0, 0);
+        tcg_out_opc_jirl(s, link, TCG_REG_TMP0, 0);
+        ret = reloc_call(s->code_ptr - 2, arg);
+        tcg_debug_assert(ret == true);
+    } else if (TCG_TARGET_REG_BITS == 64) {
+        /* far jump: 64-bit */
+        tcg_target_long imm = sextreg((tcg_target_long)arg, 0, 12);
+        tcg_target_long base = (tcg_target_long)arg - imm;
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP0, base);
+        tcg_out_opc_jirl(s, link, TCG_REG_TMP0, imm >> 2);
+    } else {
+        g_assert_not_reached();
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
@@ -779,6 +815,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
+    case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     default:
         g_assert_not_reached();
     }
-- 
2.33.0



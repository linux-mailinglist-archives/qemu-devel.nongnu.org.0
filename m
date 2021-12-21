Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BB447B9C6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 06:59:21 +0100 (CET)
Received: from localhost ([::1]:45428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzYBE-0004s7-FQ
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 00:59:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mzXvC-0001wD-PI
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 00:42:46 -0500
Received: from mail.xen0n.name ([115.28.160.31]:56620
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mzXvA-00024b-OC
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 00:42:46 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id AFBB4606E9;
 Tue, 21 Dec 2021 13:42:28 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1640065348; bh=97uOqKKELUILAomJEpjLtqSNWqcjW8UL4RLsEpkUDzs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U2DotbSg7ilB5SR7lg006ol5e/nlKg/BM2Ejzl59BHAQBTo991lX2K+3lf/QGof8F
 Xg2H//wHZOhEZ65y1lTO2yvomp9JNQNJHjyt3H3kA21QF/R1gHB5KYQKZ9zpn4foJa
 dwn2KRtWwNX3ExSSavE3U6Yennbcv6a7QJt7oKLw=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 21/31] tcg/loongarch64: Implement tcg_out_call
Date: Tue, 21 Dec 2021 13:40:55 +0800
Message-Id: <20211221054105.178795-22-git@xen0n.name>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211221054105.178795-1-git@xen0n.name>
References: <20211221054105.178795-1-git@xen0n.name>
MIME-Version: 1.0
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
---
 tcg/loongarch64/tcg-target.c.inc | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 23c151f473..151d3308ea 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -532,6 +532,39 @@ static void tcg_out_brcond(TCGContext *s, TCGCond cond, TCGReg arg1,
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
@@ -882,6 +915,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
+    case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     default:
         g_assert_not_reached();
     }
-- 
2.34.0



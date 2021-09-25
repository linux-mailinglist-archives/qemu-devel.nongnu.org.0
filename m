Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223334183D6
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 19:57:59 +0200 (CEST)
Received: from localhost ([::1]:43054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUBvy-0002LI-51
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 13:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mUBWJ-0002Vv-Rm
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:31:29 -0400
Received: from [115.28.160.31] (port=57214 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mUBWH-0005UF-O6
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:31:27 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id CF91360B45;
 Sun, 26 Sep 2021 01:30:56 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632591057; bh=7u6cY/ps4yEGGxQ56mRWFhWcwZpbLIP2A2fgf9v9reY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YJXlqwFURd65JvLwAwRaO7Ieo8l3dbbvnMBYjtm/ASHEWI3Iot0BfdKiJ3PXa5aWw
 IfMFBV7wmykFVfiw8bNtZ9zSC4vdvhuxO+JYfR+Fb+icXo5+YmiOEFwLs2mhMN/a0O
 H67P/UwRuRz4UmiYq8Yjz1N5Avvuy5mhUlztlo/k=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 21/30] tcg/loongarch64: Implement tcg_out_call
Date: Sun, 26 Sep 2021 01:30:23 +0800
Message-Id: <20210925173032.2434906-22-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210925173032.2434906-1-git@xen0n.name>
References: <20210925173032.2434906-1-git@xen0n.name>
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
---
 tcg/loongarch64/tcg-target.c.inc | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 682bf76ceb..e470d7e145 100644
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
2.33.0



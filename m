Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C192551858
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 14:10:57 +0200 (CEST)
Received: from localhost ([::1]:54480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3GF6-0005Hn-JA
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 08:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1o3G9r-0006Rq-Mm
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 08:05:31 -0400
Received: from mail.ispras.ru ([83.149.199.84]:41480)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1o3G9p-0004YD-TH
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 08:05:31 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 45FC940737DF;
 Mon, 20 Jun 2022 12:05:27 +0000 (UTC)
Subject: [PATCH v3 2/4] target/mips: implement Octeon-specific BBIT
 instructions
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 aurelien@aurel32.net, aleksandar.rikalo@syrmia.com
Date: Mon, 20 Jun 2022 15:05:27 +0300
Message-ID: <165572672705.167724.16667636081912075906.stgit@pasha-ThinkPad-X280>
In-Reply-To: <165572671617.167724.12940170194930233873.stgit@pasha-ThinkPad-X280>
References: <165572671617.167724.12940170194930233873.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch introduces Octeon-specific decoder and implements
check-bit-and-jump instructions.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

--

v3 changes:
     - Split new decodetree and BBIT decoding into two patches
       (suggested by Philippe Mathieu-Daudé)
v2 changes:
     - Changed insn field description and simplified the jumps
       (suggested by Richard Henderson)
---
 target/mips/tcg/octeon.decode      |    9 +++++++++
 target/mips/tcg/octeon_translate.c |   30 ++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/target/mips/tcg/octeon.decode b/target/mips/tcg/octeon.decode
index b21c735a6c..8062715578 100644
--- a/target/mips/tcg/octeon.decode
+++ b/target/mips/tcg/octeon.decode
@@ -4,3 +4,12 @@
 #
 # SPDX-License-Identifier: LGPL-2.1-or-later
 #
+
+# Branch on bit set or clear
+# BBIT0      110010 ..... ..... ................
+# BBIT032    110110 ..... ..... ................
+# BBIT1      111010 ..... ..... ................
+# BBIT132    111110 ..... ..... ................
+
+%bbit_p      28:1 16:5
+BBIT         11 set:1 . 10 rs:5 ..... offset:16 p=%bbit_p
diff --git a/target/mips/tcg/octeon_translate.c b/target/mips/tcg/octeon_translate.c
index 8b5eb1a823..1558f74a8e 100644
--- a/target/mips/tcg/octeon_translate.c
+++ b/target/mips/tcg/octeon_translate.c
@@ -14,3 +14,33 @@
 
 /* Include the auto-generated decoder.  */
 #include "decode-octeon.c.inc"
+
+static bool trans_BBIT(DisasContext *ctx, arg_BBIT *a)
+{
+    TCGv p;
+
+    if (ctx->hflags & MIPS_HFLAG_BMASK) {
+        LOG_DISAS("Branch in delay / forbidden slot at PC 0x"
+                  TARGET_FMT_lx "\n", ctx->base.pc_next);
+        generate_exception_end(ctx, EXCP_RI);
+        return true;
+    }
+
+    /* Load needed operands */
+    TCGv t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rs);
+
+    p = tcg_constant_tl(1ULL << a->p);
+    if (a->set) {
+        tcg_gen_and_tl(bcond, p, t0);
+    } else {
+        tcg_gen_andc_tl(bcond, p, t0);
+    }
+
+    ctx->hflags |= MIPS_HFLAG_BC;
+    ctx->btarget = ctx->base.pc_next + 4 + a->offset * 4;
+    ctx->hflags |= MIPS_HFLAG_BDS32;
+
+    tcg_temp_free(t0);
+    return true;
+}



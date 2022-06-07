Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F83353F9DB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 11:33:17 +0200 (CEST)
Received: from localhost ([::1]:49554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyVaO-0000UF-8A
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 05:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nyV41-0007BT-Np
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 04:59:49 -0400
Received: from mail.ispras.ru ([83.149.199.84]:39564)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nyV3z-0005NE-Qx
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 04:59:49 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 2EEAC4142B3D;
 Tue,  7 Jun 2022 08:59:25 +0000 (UTC)
Subject: [PATCH 2/3] target/mips: implement Octeon-specific BBIT instructions
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 aurelien@aurel32.net, aleksandar.rikalo@syrmia.com
Date: Tue, 07 Jun 2022 11:59:25 +0300
Message-ID: <165459236498.143371.12833007759486308114.stgit@pasha-ThinkPad-X280>
In-Reply-To: <165459235408.143371.17715826203190085295.stgit@pasha-ThinkPad-X280>
References: <165459235408.143371.17715826203190085295.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
---
 target/mips/tcg/meson.build        |    2 +
 target/mips/tcg/octeon.decode      |   14 ++++++++++
 target/mips/tcg/octeon_translate.c |   53 ++++++++++++++++++++++++++++++++++++
 target/mips/tcg/translate.c        |    5 +++
 target/mips/tcg/translate.h        |    1 +
 5 files changed, 75 insertions(+)
 create mode 100644 target/mips/tcg/octeon.decode
 create mode 100644 target/mips/tcg/octeon_translate.c

diff --git a/target/mips/tcg/meson.build b/target/mips/tcg/meson.build
index 98003779ae..7ee969ec8f 100644
--- a/target/mips/tcg/meson.build
+++ b/target/mips/tcg/meson.build
@@ -3,6 +3,7 @@ gen = [
   decodetree.process('msa.decode', extra_args: '--decode=decode_ase_msa'),
   decodetree.process('tx79.decode', extra_args: '--static-decode=decode_tx79'),
   decodetree.process('vr54xx.decode', extra_args: '--decode=decode_ext_vr54xx'),
+  decodetree.process('octeon.decode', extra_args: '--decode=decode_ext_octeon'),
 ]
 
 mips_ss.add(gen)
@@ -24,6 +25,7 @@ mips_ss.add(files(
 ))
 mips_ss.add(when: 'TARGET_MIPS64', if_true: files(
   'tx79_translate.c',
+  'octeon_translate.c',
 ), if_false: files(
   'mxu_translate.c',
 ))
diff --git a/target/mips/tcg/octeon.decode b/target/mips/tcg/octeon.decode
new file mode 100644
index 0000000000..c06d576292
--- /dev/null
+++ b/target/mips/tcg/octeon.decode
@@ -0,0 +1,14 @@
+# Octeon Architecture Module instruction set
+#
+# Copyright (C) 2022 Pavel Dovgalyuk
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+
+# Branch on bit set or clear
+# BBIT0      110010 ..... ..... ................
+# BBIT032    110110 ..... ..... ................
+# BBIT1      111010 ..... ..... ................
+# BBIT132    111110 ..... ..... ................
+
+BBIT         11 set:1 shift:1 10 rs:5 p:5 offset:16
diff --git a/target/mips/tcg/octeon_translate.c b/target/mips/tcg/octeon_translate.c
new file mode 100644
index 0000000000..bd87066b01
--- /dev/null
+++ b/target/mips/tcg/octeon_translate.c
@@ -0,0 +1,53 @@
+/*
+ * Octeon-specific instructions translation routines
+ *
+ *  Copyright (c) 2022 Pavel Dovgalyuk
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "tcg/tcg-op.h"
+#include "tcg/tcg-op-gvec.h"
+#include "exec/helper-gen.h"
+#include "translate.h"
+
+/* Include the auto-generated decoder.  */
+#include "decode-octeon.c.inc"
+
+static bool trans_BBIT(DisasContext *ctx, arg_BBIT *a)
+{
+    int p = a->p;
+
+    if (ctx->hflags & MIPS_HFLAG_BMASK) {
+#ifdef MIPS_DEBUG_DISAS
+        LOG_DISAS("Branch in delay / forbidden slot at PC 0x"
+                  TARGET_FMT_lx "\n", ctx->base.pc_next);
+#endif
+        generate_exception_end(ctx, EXCP_RI);
+        return true;
+    }
+
+    /* Load needed operands */
+    TCGv t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rs);
+
+    if (a->shift) {
+        p += 32;
+    }
+    tcg_gen_andi_tl(t0, t0, 1ULL << p);
+
+    /* Jump conditions */
+    if (a->set) {
+        tcg_gen_setcondi_tl(TCG_COND_NE, bcond, t0, 0);
+    } else {
+        tcg_gen_setcondi_tl(TCG_COND_EQ, bcond, t0, 0);
+    }
+
+    ctx->hflags |= MIPS_HFLAG_BC;
+    ctx->btarget = ctx->base.pc_next + 4 + a->offset * 4;
+    ctx->hflags |= MIPS_HFLAG_BDS32;
+
+    tcg_temp_free(t0);
+    return true;
+}
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 6de5b66650..4f41a9b00a 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -15963,6 +15963,11 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
     if (cpu_supports_isa(env, INSN_VR54XX) && decode_ext_vr54xx(ctx, ctx->opcode)) {
         return;
     }
+#if defined(TARGET_MIPS64)
+    if (cpu_supports_isa(env, INSN_OCTEON) && decode_ext_octeon(ctx, ctx->opcode)) {
+        return;
+    }
+#endif
 
     /* ISA extensions */
     if (ase_msa_available(env) && decode_ase_msa(ctx, ctx->opcode)) {
diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
index 9997fe2f3c..55053226ae 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -215,6 +215,7 @@ bool decode_ase_msa(DisasContext *ctx, uint32_t insn);
 bool decode_ext_txx9(DisasContext *ctx, uint32_t insn);
 #if defined(TARGET_MIPS64)
 bool decode_ext_tx79(DisasContext *ctx, uint32_t insn);
+bool decode_ext_octeon(DisasContext *ctx, uint32_t insn);
 #endif
 bool decode_ext_vr54xx(DisasContext *ctx, uint32_t insn);
 



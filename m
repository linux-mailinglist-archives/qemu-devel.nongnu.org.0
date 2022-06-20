Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF0E551837
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 14:07:47 +0200 (CEST)
Received: from localhost ([::1]:46826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3GC2-0000BE-2i
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 08:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1o3G9l-0006Ab-4u
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 08:05:25 -0400
Received: from mail.ispras.ru ([83.149.199.84]:41444)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1o3G9j-0004WC-BS
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 08:05:24 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id D1F4D40737DE;
 Mon, 20 Jun 2022 12:05:21 +0000 (UTC)
Subject: [PATCH v3 1/4] target/mips: introduce decodetree structure for
 Cavium Octeon extension
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 aurelien@aurel32.net, aleksandar.rikalo@syrmia.com
Date: Mon, 20 Jun 2022 15:05:21 +0300
Message-ID: <165572672162.167724.13656301229517693806.stgit@pasha-ThinkPad-X280>
In-Reply-To: <165572671617.167724.12940170194930233873.stgit@pasha-ThinkPad-X280>
References: <165572671617.167724.12940170194930233873.stgit@pasha-ThinkPad-X280>
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

This patch adds decodetree for Cavium Octeon extension and
an instruction set extension flag for using it in CPU models.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 target/mips/mips-defs.h            |    1 +
 target/mips/tcg/meson.build        |    2 ++
 target/mips/tcg/octeon.decode      |    6 ++++++
 target/mips/tcg/octeon_translate.c |   16 ++++++++++++++++
 target/mips/tcg/translate.c        |    5 +++++
 target/mips/tcg/translate.h        |    1 +
 6 files changed, 31 insertions(+)
 create mode 100644 target/mips/tcg/octeon.decode
 create mode 100644 target/mips/tcg/octeon_translate.c

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 0a12d982a7..a6cebe0265 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -42,6 +42,7 @@
 #define INSN_LOONGSON2E   0x0000040000000000ULL
 #define INSN_LOONGSON2F   0x0000080000000000ULL
 #define INSN_LOONGSON3A   0x0000100000000000ULL
+#define INSN_OCTEON       0x0000200000000000ULL
 /*
  *   bits 52-63: vendor-specific ASEs
  */
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
index 0000000000..b21c735a6c
--- /dev/null
+++ b/target/mips/tcg/octeon.decode
@@ -0,0 +1,6 @@
+# Octeon Architecture Module instruction set
+#
+# Copyright (C) 2022 Pavel Dovgalyuk
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
diff --git a/target/mips/tcg/octeon_translate.c b/target/mips/tcg/octeon_translate.c
new file mode 100644
index 0000000000..8b5eb1a823
--- /dev/null
+++ b/target/mips/tcg/octeon_translate.c
@@ -0,0 +1,16 @@
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
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 5f460fb687..f4345ce0c7 100644
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
 



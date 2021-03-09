Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A6E332A6D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:29:57 +0100 (CET)
Received: from localhost ([::1]:42100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeJ1-0001HS-Ha
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:29:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdnF-0004S2-9C
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:57:05 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdnC-0002N5-Kh
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:57:04 -0500
Received: by mail-ed1-x532.google.com with SMTP id v13so20689662edw.9
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q7nq5o9TxMl2TCgRvlizm2HmF2paab+oiwWUX3N4H7A=;
 b=la8h6iCd9VB+k0iDSpGqkGWO4679nXGMm0UmmDaX56+wNFU+XwS+YrbET8yi4xFuUB
 zvyoIY8r6ee/H6qO4hA2+5WHyhicL41sKx8IT0KcbFzPURdXei3QCmULMZQyYZ4l+oLz
 vou8vZk3xpl2i3KrpiEh5lP8gwxbwIDeJWBftfURuf8ZJAAcKwwVRlMBn6nX32G6602U
 f5APyKRp4xE8UfhakLUBSzwj7bY9APLJTpbTPS8GVmyDKosq11c02+PkBzX/l6NyR5/6
 7/DEOQEHq46nzEsBbc5W2RN2zvFX+hbC7l5MBrsKKul9e5Ryi97UtKaYEmqpUeDYUx09
 Zs0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Q7nq5o9TxMl2TCgRvlizm2HmF2paab+oiwWUX3N4H7A=;
 b=t+aXuZ5tUhi55zUnyZTfk4hwR/LMtYJlikXUjPknhsdXlAtbBQDljQ+5nMjRGaiynb
 zUDEaWoGoMuOqSKuei2jf+YqgDLZ6zZmCRHRrrkXq/l0HINiXRhFaVbhksHlNr1lIYBl
 pomhVJXsobJ8jHtEwhQ51oWdiQ4XD1a9VIFmeYySb39+2iQjyJH7HIdxB2PVJxJoz2wA
 H2riRwGALwTHy2NAXuDXlpd9VXPPss1fJW+/NbyBHMvhEcimuyx0Sb4+kBgy6HuH+tVy
 nLVukeX5k0DKuDTD5mv0D+TKeWC9RGAzimTdoyJVvVoWlgtKiaCODdtyjbrDpl04qGhE
 J1MQ==
X-Gm-Message-State: AOAM531TTomsoJYH/IsU1r8W1afSV8R2olIDz/ENIh5TVGqqYALCJ96s
 UawFINkY8MqZ0/xpVdH/+EjmCv/xd6c=
X-Google-Smtp-Source: ABdhPJzgq5dfCmpVZ+sAET/BHlNwKapInHphKGcCPvYIUejcsqUCaj2+5lGzYQ1fLEdIRLFolKnXNQ==
X-Received: by 2002:aa7:c78e:: with SMTP id n14mr4495605eds.31.1615301820489; 
 Tue, 09 Mar 2021 06:57:00 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u17sm9327450edr.0.2021.03.09.06.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:57:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 01/22] target/mips/tx79: Move MFHI1 / MFLO1 opcodes to
 decodetree
Date: Tue,  9 Mar 2021 15:56:32 +0100
Message-Id: <20210309145653.743937-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
References: <20210309145653.743937-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce decodetree structure to decode the tx79 opcodes.
Start it by moving the existing MFHI1 and MFLO1 opcodes.
Remove unnecessary comments.

As the TX79 share opcodes with the TX19/TX39/TX49 CPUs,
we introduce the decode_ext_txx9() dispatcher where we
will add the other decoders later.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-9-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h      |  4 ++++
 target/mips/tx79.decode      | 25 ++++++++++++++++++++++++
 target/mips/translate.c      | 15 +++------------
 target/mips/tx79_translate.c | 37 ++++++++++++++++++++++++++++++++++++
 target/mips/txx9_translate.c | 20 +++++++++++++++++++
 target/mips/meson.build      |  5 +++++
 6 files changed, 94 insertions(+), 12 deletions(-)
 create mode 100644 target/mips/tx79.decode
 create mode 100644 target/mips/tx79_translate.c
 create mode 100644 target/mips/txx9_translate.c

diff --git a/target/mips/translate.h b/target/mips/translate.h
index a807b3d2566..e4f2f26de89 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -185,5 +185,9 @@ bool decode_ase_mxu(DisasContext *ctx, uint32_t insn);
 /* decodetree generated */
 bool decode_isa_rel6(DisasContext *ctx, uint32_t insn);
 bool decode_ase_msa(DisasContext *ctx, uint32_t insn);
+bool decode_ext_txx9(DisasContext *ctx, uint32_t insn);
+#if defined(TARGET_MIPS64)
+bool decode_ext_tx79(DisasContext *ctx, uint32_t insn);
+#endif
 
 #endif
diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
new file mode 100644
index 00000000000..2e287ebbf36
--- /dev/null
+++ b/target/mips/tx79.decode
@@ -0,0 +1,25 @@
+# Toshiba C790's instruction set
+#
+# Copyright (C) 2021  Philippe Mathieu-Daudé
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# Toshiba Appendix B  C790-Specific Instruction Set Details
+
+###########################################################################
+# Named attribute sets.  These are used to make nice(er) names
+# when creating helpers common to those for the individual
+# instruction patterns.
+
+&rtype           rs rt rd sa
+
+###########################################################################
+# Named instruction formats.  These are generally used to
+# reduce the amount of duplication between instruction patterns.
+
+@rd             ...... ..........  rd:5  ..... ......   &rtype rs=0 rt=0 sa=0
+
+###########################################################################
+
+MFHI1           011100 0000000000  ..... 00000 010000   @rd
+MFLO1           011100 0000000000  ..... 00000 010010   @rd
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 9b08785f2b8..aa35d0f680e 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -1360,9 +1360,7 @@ enum {
     MMI_OPC_PLZCW      = 0x04 | MMI_OPC_CLASS_MMI,
     MMI_OPC_CLASS_MMI0 = 0x08 | MMI_OPC_CLASS_MMI,
     MMI_OPC_CLASS_MMI2 = 0x09 | MMI_OPC_CLASS_MMI,
-    MMI_OPC_MFHI1      = 0x10 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MFHI */
     MMI_OPC_MTHI1      = 0x11 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MTHI */
-    MMI_OPC_MFLO1      = 0x12 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MFLO */
     MMI_OPC_MTLO1      = 0x13 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MTLO */
     MMI_OPC_MULT1      = 0x18 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MULT */
     MMI_OPC_MULTU1     = 0x19 | MMI_OPC_CLASS_MMI, /* Same min. as OPC_MULTU */
@@ -3469,12 +3467,6 @@ static void gen_shift(DisasContext *ctx, uint32_t opc,
 static void gen_HILO1_tx79(DisasContext *ctx, uint32_t opc, int reg)
 {
     switch (opc) {
-    case MMI_OPC_MFHI1:
-        gen_store_gpr(cpu_HI[1], reg);
-        break;
-    case MMI_OPC_MFLO1:
-        gen_store_gpr(cpu_LO[1], reg);
-        break;
     case MMI_OPC_MTHI1:
         gen_load_gpr(cpu_HI[1], reg);
         break;
@@ -25120,10 +25112,6 @@ static void decode_mmi(CPUMIPSState *env, DisasContext *ctx)
     case MMI_OPC_MTHI1:
         gen_HILO1_tx79(ctx, opc, rs);
         break;
-    case MMI_OPC_MFLO1:
-    case MMI_OPC_MFHI1:
-        gen_HILO1_tx79(ctx, opc, rd);
-        break;
     case MMI_OPC_PLZCW:         /* TODO: MMI_OPC_PLZCW */
     case MMI_OPC_PMFHL:         /* TODO: MMI_OPC_PMFHL */
     case MMI_OPC_PMTHL:         /* TODO: MMI_OPC_PMTHL */
@@ -26095,6 +26083,9 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
     if (cpu_supports_isa(env, ISA_MIPS_R6) && decode_isa_rel6(ctx, ctx->opcode)) {
         return;
     }
+    if (cpu_supports_isa(env, INSN_R5900) && decode_ext_txx9(ctx, ctx->opcode)) {
+        return;
+    }
 
     if (decode_opc_legacy(env, ctx)) {
         return;
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
new file mode 100644
index 00000000000..22bd6033e55
--- /dev/null
+++ b/target/mips/tx79_translate.c
@@ -0,0 +1,37 @@
+/*
+ * Toshiba TX79-specific instructions translation routines
+ *
+ *  Copyright (c) 2018 Fredrik Noring
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "tcg/tcg-op.h"
+#include "exec/helper-gen.h"
+#include "translate.h"
+
+/* Include the auto-generated decoder.  */
+#include "decode-tx79.c.inc"
+
+bool decode_ext_tx79(DisasContext *ctx, uint32_t insn)
+{
+    if (TARGET_LONG_BITS == 64 && decode_tx79(ctx, insn)) {
+        return true;
+    }
+    return false;
+}
+
+static bool trans_MFHI1(DisasContext *ctx, arg_rtype *a)
+{
+    gen_store_gpr(cpu_HI[1], a->rd);
+
+    return true;
+}
+
+static bool trans_MFLO1(DisasContext *ctx, arg_rtype *a)
+{
+    gen_store_gpr(cpu_LO[1], a->rd);
+
+    return true;
+}
diff --git a/target/mips/txx9_translate.c b/target/mips/txx9_translate.c
new file mode 100644
index 00000000000..8a2c0b766bd
--- /dev/null
+++ b/target/mips/txx9_translate.c
@@ -0,0 +1,20 @@
+/*
+ * Toshiba TXx9 instructions translation routines
+ *
+ *  Copyright (c) 2021 Philippe Mathieu-Daudé
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "translate.h"
+
+bool decode_ext_txx9(DisasContext *ctx, uint32_t insn)
+{
+#if defined(TARGET_MIPS64)
+    if (decode_ext_tx79(ctx, insn)) {
+        return true;
+    }
+#endif
+    return false;
+}
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 4a951e522d4..3b131c4a7f6 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -3,6 +3,7 @@
   decodetree.process('mips64r6.decode', extra_args: '--static-decode=decode_mips64r6'),
   decodetree.process('msa32.decode', extra_args: '--static-decode=decode_msa32'),
   decodetree.process('msa64.decode', extra_args: '--static-decode=decode_msa64'),
+  decodetree.process('tx79.decode', extra_args: '--static-decode=decode_tx79'),
 ]
 
 mips_ss = ss.source_set()
@@ -23,6 +24,10 @@
   'tlb_helper.c',
   'translate.c',
   'translate_addr_const.c',
+  'txx9_translate.c',
+))
+mips_ss.add(when: ['CONFIG_TCG', 'TARGET_MIPS64'], if_true: files(
+  'tx79_translate.c',
 ))
 mips_tcg_ss.add(when: 'TARGET_MIPS64', if_false: files(
   'mxu_translate.c',
-- 
2.26.2



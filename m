Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE6E2F3BF7
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 22:57:23 +0100 (CET)
Received: from localhost ([::1]:52248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzRfE-0003xJ-Ow
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 16:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzRdQ-0002Z4-5I
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:55:32 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzRdL-0001V5-Dq
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:55:27 -0500
Received: by mail-wm1-x330.google.com with SMTP id e25so3521437wme.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Efga8C9/tgnHmSbNOP3ZUS6CFBkLsRNYxdS981blvVE=;
 b=fdvY5HEPMrGv6leYNZcZuxlP7yn3lBD4wBaGsTtR0ausd57bja1lcQ5aTX4GhCi4xh
 h1o8aUeFC4RvOQkzCqc32XoiTiRCpusOPXBoJlPK1PMw6I3AnFjLJQ+RRHLP1xrY8ws+
 SV3hBnS7yyO9V9LPQVaWuHirBNqsn80ZDun9LLznnBn0NzYaq8kolG+47oPOZcRaOVKk
 EYU6JuLUyQTx0ifwUHQO/qy9WAiAmvRfxb5et2t5ZUVlsVReoC3GI0eJpCq2dxPw4MPp
 IluoXUf5/vh2+PUDXi49FvfPXB+NMKtaqazvD9c+LcuBb50P7bI5gDrB7yjeCvAm0evz
 Ox3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Efga8C9/tgnHmSbNOP3ZUS6CFBkLsRNYxdS981blvVE=;
 b=iw6X/RipSK4U8t4ZczvOnFdzisasMzYBx6iBRRy+k2Aa06fM0yrQPdU3iZrXqAzUDF
 7BkgVHOtqcMeQ+/jPeK2btRoTGhs6RNJIYL9pxeNgbf202HjUD1pKf/dwgPwWx00J4u+
 ArEWl0/XyOn1x9KgmbO84+gXv3/EBs9nuxqCiDzTTGB8ppgWBC5pg9+UL+nGfWs91dpg
 klh/OYQHKVZ3ia/lVSWZJTBgf1EfPdBKtCNPGUM6HFNsTH175L+ABQ+LI24SjXOD3Be5
 lepg9WYhtJdeCfOIph8F/KJhIBUz2ifhnXgp4VpC9x+mgzKzWPAJ/qORkHBd2rltFJuG
 P32A==
X-Gm-Message-State: AOAM530zkpDdbp2fixI1itaxV7wE3rKkcnK3ySHpKqrsAbWBjz/H1Fxn
 amoLow6MYhFOVSEWv8qDpe1A8AfCCmU=
X-Google-Smtp-Source: ABdhPJyxrXXGTEiudugBPqh7Ttn5S0gf8Ds1a5VN1dKTSemK44nAr51qixKtuK9vpkgR1Ow3sT62xg==
X-Received: by 2002:a1c:5fd4:: with SMTP id t203mr1087495wmb.15.1610488518513; 
 Tue, 12 Jan 2021 13:55:18 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id m21sm5426293wml.13.2021.01.12.13.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 13:55:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] target/mips: Convert Loongson DDIV.G opcodes to decodetree
Date: Tue, 12 Jan 2021 22:55:00 +0100
Message-Id: <20210112215504.2093955-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112215504.2093955-1-f4bug@amsat.org>
References: <20210112215504.2093955-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce decode_loongson() to decode all Loongson vendor
specific opcodes. Start converting a single opcode: DDIV.G
(divide 64-bit signed integers).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h       |  1 +
 target/mips/godson2.decode    | 16 +++++++
 target/mips/loong-ext.decode  | 17 +++++++
 target/mips/loong_translate.c | 89 +++++++++++++++++++++++++++++++++++
 target/mips/translate.c       | 28 ++---------
 target/mips/meson.build       |  3 ++
 6 files changed, 131 insertions(+), 23 deletions(-)
 create mode 100644 target/mips/godson2.decode
 create mode 100644 target/mips/loong-ext.decode
 create mode 100644 target/mips/loong_translate.c

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 11730f5b2e6..b67c45012b8 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -164,5 +164,6 @@ void msa_translate_init(void);
 /* decodetree generated */
 bool decode_isa_rel6(DisasContext *ctx, uint32_t insn);
 bool decode_ase_msa(DisasContext *ctx, uint32_t insn);
+bool decode_loongson(DisasContext *ctx, uint32_t insn);
 
 #endif
diff --git a/target/mips/godson2.decode b/target/mips/godson2.decode
new file mode 100644
index 00000000000..cbe22285740
--- /dev/null
+++ b/target/mips/godson2.decode
@@ -0,0 +1,16 @@
+# Godson2 Integer instructions
+#
+# Copyright (C) 2021  Philippe Mathieu-Daudé
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# Reference:
+#       Godson-2E Software Manual
+#       (Document Number: godson2e-user-manual-V0.6)
+#
+
+&muldiv         rs rt rd
+
+@rs_rt_rd       ...... rs:5  rt:5  rd:5  ..... ......   &muldiv
+
+DDIV.G          011111 ..... ..... ..... 00000 011110   @rs_rt_rd
diff --git a/target/mips/loong-ext.decode b/target/mips/loong-ext.decode
new file mode 100644
index 00000000000..557fe06c14a
--- /dev/null
+++ b/target/mips/loong-ext.decode
@@ -0,0 +1,17 @@
+# Loongson Extension instructions
+#
+# Copyright (C) 2021  Philippe Mathieu-Daudé
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# Reference:
+#       STLS2F01 User Manual
+#       Appendix A: new integer instructions
+#       (Document Number: UM0447)
+#
+
+&muldiv         rs rt rd !extern
+
+@rs_rt_rd       ...... rs:5  rt:5  rd:5  ..... ......   &muldiv
+
+DDIV.G          011100 ..... ..... ..... 00000 010101   @rs_rt_rd
diff --git a/target/mips/loong_translate.c b/target/mips/loong_translate.c
new file mode 100644
index 00000000000..c452472e7a7
--- /dev/null
+++ b/target/mips/loong_translate.c
@@ -0,0 +1,89 @@
+/*
+ * MIPS Loongson translation routines
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *  Copyright (c) 2011 Richard Henderson <rth@twiddle.net>
+ *  Copyright (c) 2021 Philippe Mathieu-Daudé
+ *
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#include "qemu/osdep.h"
+#include "tcg/tcg-op.h"
+#include "exec/helper-gen.h"
+#include "translate.h"
+
+/* Include the auto-generated decoder.  */
+#include "decode-godson2.c.inc"
+#include "decode-loong-ext.c.inc"
+
+/*
+ * Word or double-word Fixed-point instructions.
+ * --------------------------------------------
+ *
+ * Fixed-point multiplies and divisions write only one result
+ * into general-purpose registers.
+ */
+
+static bool gen_lext_DIV_G(DisasContext *s, int rd, int rs, int rt)
+{
+    TCGv t0, t1;
+    TCGLabel *l1, *l2, *l3;
+
+    if (TARGET_LONG_BITS != 64) {
+        return false;
+    }
+    check_mips_64(s);
+
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return true;
+    }
+
+    t0 = tcg_temp_local_new();
+    t1 = tcg_temp_local_new();
+    l1 = gen_new_label();
+    l2 = gen_new_label();
+    l3 = gen_new_label();
+
+    gen_load_gpr(t0, rs);
+    gen_load_gpr(t1, rt);
+
+    tcg_gen_brcondi_tl(TCG_COND_NE, t1, 0, l1);
+    tcg_gen_movi_tl(cpu_gpr[rd], 0);
+    tcg_gen_br(l3);
+    gen_set_label(l1);
+
+    tcg_gen_brcondi_tl(TCG_COND_NE, t0, -1LL << 63, l2);
+    tcg_gen_brcondi_tl(TCG_COND_NE, t1, -1LL, l2);
+    tcg_gen_mov_tl(cpu_gpr[rd], t0);
+
+    tcg_gen_br(l3);
+    gen_set_label(l2);
+    tcg_gen_div_tl(cpu_gpr[rd], t0, t1);
+    gen_set_label(l3);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_DDIV_G(DisasContext *s, arg_muldiv *a)
+{
+    return gen_lext_DIV_G(s, a->rt, a->rs, a->rd);
+}
+
+bool decode_loongson(DisasContext *ctx, uint32_t insn)
+{
+    if ((ctx->insn_flags & INSN_LOONGSON2E)
+            && decode_godson2(ctx, ctx->opcode)) {
+        return true;
+    }
+    if ((ctx->insn_flags & ASE_LEXT) && decode_loong_ext(ctx, ctx->opcode)) {
+        return true;
+    }
+    return false;
+}
diff --git a/target/mips/translate.c b/target/mips/translate.c
index cbd152eff50..c427ea98952 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -343,7 +343,6 @@ enum {
     OPC_MULTU_G_2F  = 0x12 | OPC_SPECIAL2,
     OPC_DMULTU_G_2F = 0x13 | OPC_SPECIAL2,
     OPC_DIV_G_2F    = 0x14 | OPC_SPECIAL2,
-    OPC_DDIV_G_2F   = 0x15 | OPC_SPECIAL2,
     OPC_DIVU_G_2F   = 0x16 | OPC_SPECIAL2,
     OPC_DDIVU_G_2F  = 0x17 | OPC_SPECIAL2,
     OPC_MOD_G_2F    = 0x1c | OPC_SPECIAL2,
@@ -385,7 +384,6 @@ enum {
     OPC_DIVU_G_2E   = 0x1B | OPC_SPECIAL3,
     OPC_DMULT_G_2E  = 0x1C | OPC_SPECIAL3,
     OPC_DMULTU_G_2E = 0x1D | OPC_SPECIAL3,
-    OPC_DDIV_G_2E   = 0x1E | OPC_SPECIAL3,
     OPC_DDIVU_G_2E  = 0x1F | OPC_SPECIAL3,
     OPC_MOD_G_2E    = 0x22 | OPC_SPECIAL3,
     OPC_MODU_G_2E   = 0x23 | OPC_SPECIAL3,
@@ -5108,25 +5106,6 @@ static void gen_loongson_integer(DisasContext *ctx, uint32_t opc,
     case OPC_DMULTU_G_2F:
         tcg_gen_mul_tl(cpu_gpr[rd], t0, t1);
         break;
-    case OPC_DDIV_G_2E:
-    case OPC_DDIV_G_2F:
-        {
-            TCGLabel *l1 = gen_new_label();
-            TCGLabel *l2 = gen_new_label();
-            TCGLabel *l3 = gen_new_label();
-            tcg_gen_brcondi_tl(TCG_COND_NE, t1, 0, l1);
-            tcg_gen_movi_tl(cpu_gpr[rd], 0);
-            tcg_gen_br(l3);
-            gen_set_label(l1);
-            tcg_gen_brcondi_tl(TCG_COND_NE, t0, -1LL << 63, l2);
-            tcg_gen_brcondi_tl(TCG_COND_NE, t1, -1LL, l2);
-            tcg_gen_mov_tl(cpu_gpr[rd], t0);
-            tcg_gen_br(l3);
-            gen_set_label(l2);
-            tcg_gen_div_tl(cpu_gpr[rd], t0, t1);
-            gen_set_label(l3);
-        }
-        break;
     case OPC_DDIVU_G_2E:
     case OPC_DDIVU_G_2F:
         {
@@ -27180,7 +27159,6 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
         break;
     case OPC_DMULT_G_2F:
     case OPC_DMULTU_G_2F:
-    case OPC_DDIV_G_2F:
     case OPC_DDIVU_G_2F:
     case OPC_DMOD_G_2F:
     case OPC_DMODU_G_2F:
@@ -27590,7 +27568,6 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
         }
         break;
 #if defined(TARGET_MIPS64)
-    case OPC_DDIV_G_2E:
     case OPC_DDIVU_G_2E:
     case OPC_DMULT_G_2E:
     case OPC_DMULTU_G_2E:
@@ -28976,6 +28953,11 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
 
     /* Transition to the auto-generated decoder.  */
 
+    /* Vendor specific extensions */
+    if (decode_loongson(ctx, ctx->opcode)) {
+        return;
+    }
+
     /* ISA extensions */
     if (ase_msa_available(env) && decode_ase_msa(ctx, ctx->opcode)) {
         return;
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 9741545440c..0b6067f96c3 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -1,4 +1,6 @@
 gen = [
+  decodetree.process('godson2.decode', extra_args: ['--static-decode=decode_godson2']),
+  decodetree.process('loong-ext.decode', extra_args: ['--static-decode=decode_loong_ext']),
   decodetree.process('mips32r6.decode', extra_args: '--static-decode=decode_mips32r6'),
   decodetree.process('mips64r6.decode', extra_args: '--static-decode=decode_mips64r6'),
   decodetree.process('msa32.decode', extra_args: '--static-decode=decode_msa32'),
@@ -15,6 +17,7 @@
   'dsp_helper.c',
   'fpu_helper.c',
   'lmmi_helper.c',
+  'loong_translate.c',
   'msa_helper.c',
   'msa_translate.c',
   'op_helper.c',
-- 
2.26.2



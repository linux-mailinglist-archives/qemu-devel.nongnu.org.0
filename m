Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB6C2F6612
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:38:20 +0100 (CET)
Received: from localhost ([::1]:52914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05db-0002ko-Py
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05NA-0003wr-NQ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:21:20 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05N3-0000Td-On
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:21:18 -0500
Received: by mail-wr1-x42d.google.com with SMTP id c5so6384298wrp.6
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YDpNR8ICHcWWAFxZ/f13PnXxIi/ek0pueoc3t6GAVj0=;
 b=NROG7Pgt1zP5fGFTfhnGfqPiACjAzmeQJiGKWUSTyL9RxE1STcZOEiQvkMuSTJTHGi
 XgshOMy7M373yOfOpuWiiwnpBWSrkz1xhbTG8ZqKtl/tzdnPHBDhQeDcvdqOCpZq7ppK
 7LQQY+DnHamYUyJjLvfeHhl3ibzu6de/yXgXLiZIvNjpOrlruijC6p0fljQr5BISugkD
 +R/a1+wVF8AmcC3OaYd0VIkymM2wRM60cQoE9wE3apV+kpdW8eKwqv2lfxjcuHdnJr2O
 LlX9GM3wHVD2nqQ67z2Yy+iN1LsbXf5aDQEoYuwsXEpEC3SnQD7RZEp8yiY3Kj0pRzV1
 TUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YDpNR8ICHcWWAFxZ/f13PnXxIi/ek0pueoc3t6GAVj0=;
 b=Sfv+h3gImSnq20X0F2L1WEciNKagCpsrBcz9wGaYj8AqzGmtS+2oKUwBBe1d/qPmpy
 uxVIJ15ZXh1V4fixeuzM3dsleJ2Tt+wUcNAmnDh3ivWSpHW07AVTViVsPeorqtqmeFZZ
 CVr122KjjxhRJ5ku88WGsK0qzInJYLjkw2ZxknBXw8X3BbztFrDPut1SoAXghWykvwtG
 fFhLDX3wwMr6UA4oVqvnexkmIUOhrtWyN6equl7b5hL9nRBnKV96LYVM3TPqoqP10rOv
 acskulKDJiI6FfHxNcmGoR7GCq0LacT2dVnvvATCyXRxD9GewkaQuU6oyFzz6rzwjsAi
 udWQ==
X-Gm-Message-State: AOAM532l+XBL8pQMlVjavrmSa4mgCR9MHiOKjQOCA8N31AHkXi5JIo4q
 kL6TVSzfzM2EuY4oYGLIEWW6IE3I9nA=
X-Google-Smtp-Source: ABdhPJwkEyOudEFBMLn9qHbzgXixBn5xNCWhZDN7z2b7GJkCFbUyDHTtA7j0a+8HDkY1LbJrVe5LoA==
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr8593482wrq.47.1610641270299; 
 Thu, 14 Jan 2021 08:21:10 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id q6sm9233802wmj.32.2021.01.14.08.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:21:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: 
Subject: [PULL v2 54/69] target/mips: Extract LSA/DLSA translation generators
Date: Thu, 14 Jan 2021 17:20:08 +0100
Message-Id: <20210114162016.2901557-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114162016.2901557-1-f4bug@amsat.org>
References: <20210114162016.2901557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract gen_lsa() from translate.c and explode it as
gen_LSA() and gen_DLSA().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201215225757.764263-22-f4bug@amsat.org>
---
 target/mips/translate.h            |  5 +++
 target/mips/translate.c            | 36 ++----------------
 target/mips/translate_addr_const.c | 61 ++++++++++++++++++++++++++++++
 target/mips/meson.build            |  1 +
 4 files changed, 71 insertions(+), 32 deletions(-)
 create mode 100644 target/mips/translate_addr_const.c

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 9b38f82ecd9..f93df0c5ab2 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -137,7 +137,12 @@ void gen_store_fpr32(DisasContext *ctx, TCGv_i32 t, int reg);
 void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg);
 int get_fp_bit(int cc);
 
+/*
+ * Address Computation and Large Constant Instructions
+ */
 void gen_op_addr_add(DisasContext *ctx, TCGv ret, TCGv arg0, TCGv arg1);
+bool gen_lsa(DisasContext *ctx, int rd, int rt, int rs, int sa);
+bool gen_dlsa(DisasContext *ctx, int rd, int rt, int rs, int sa);
 
 extern TCGv cpu_gpr[32], cpu_PC;
 extern TCGv_i32 fpu_fcr0, fpu_fcr31;
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 6b59358b390..bed1a286f43 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -6615,31 +6615,6 @@ static void gen_bshfl(DisasContext *ctx, uint32_t op2, int rt, int rd)
     tcg_temp_free(t0);
 }
 
-static void gen_lsa(DisasContext *ctx, int opc, int rd, int rs, int rt,
-                    int imm2)
-{
-    TCGv t0;
-    TCGv t1;
-    if (rd == 0) {
-        /* Treat as NOP. */
-        return;
-    }
-    t0 = tcg_temp_new();
-    t1 = tcg_temp_new();
-    gen_load_gpr(t0, rs);
-    gen_load_gpr(t1, rt);
-    tcg_gen_shli_tl(t0, t0, imm2 + 1);
-    tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
-    if (opc == OPC_LSA) {
-        tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-    }
-
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
-
-    return;
-}
-
 static void gen_align_bits(DisasContext *ctx, int wordsz, int rd, int rs,
                            int rt, int bits)
 {
@@ -16495,8 +16470,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
             return;
         case LSA:
             check_insn(ctx, ISA_MIPS_R6);
-            gen_lsa(ctx, OPC_LSA, rd, rs, rt,
-                    extract32(ctx->opcode, 9, 2));
+            gen_lsa(ctx, rd, rt, rs, extract32(ctx->opcode, 9, 2));
             break;
         case ALIGN:
             check_insn(ctx, ISA_MIPS_R6);
@@ -21459,8 +21433,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                  * amount, meaning that the supported shift values are in
                  * the range 0 to 3 (instead of 1 to 4 in MIPSR6).
                  */
-                gen_lsa(ctx, OPC_LSA, rd, rs, rt,
-                        extract32(ctx->opcode, 9, 2) - 1);
+                gen_lsa(ctx, rd, rt, rs, extract32(ctx->opcode, 9, 2) - 1);
                 break;
             case NM_EXTW:
                 gen_ext(ctx, 32, rd, rs, rt, extract32(ctx->opcode, 6, 5));
@@ -24346,7 +24319,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
     op1 = MASK_SPECIAL(ctx->opcode);
     switch (op1) {
     case OPC_LSA:
-        gen_lsa(ctx, op1, rd, rs, rt, extract32(ctx->opcode, 6, 2));
+        gen_lsa(ctx, rd, rt, rs, extract32(ctx->opcode, 6, 2));
         break;
     case OPC_MULT:
     case OPC_MULTU:
@@ -24399,8 +24372,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
         break;
 #if defined(TARGET_MIPS64)
     case OPC_DLSA:
-        check_mips_64(ctx);
-        gen_lsa(ctx, op1, rd, rs, rt, extract32(ctx->opcode, 6, 2));
+        gen_dlsa(ctx, rd, rt, rs, extract32(ctx->opcode, 6, 2));
         break;
     case R6_OPC_DCLO:
     case R6_OPC_DCLZ:
diff --git a/target/mips/translate_addr_const.c b/target/mips/translate_addr_const.c
new file mode 100644
index 00000000000..96f483418eb
--- /dev/null
+++ b/target/mips/translate_addr_const.c
@@ -0,0 +1,61 @@
+/*
+ * Address Computation and Large Constant Instructions
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *  Copyright (c) 2009 CodeSourcery (MIPS16 and microMIPS support)
+ *  Copyright (c) 2012 Jia Liu & Dongxue Zhang (MIPS ASE DSP support)
+ *  Copyright (c) 2020 Philippe Mathieu-Daudé
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+#include "qemu/osdep.h"
+#include "tcg/tcg-op.h"
+#include "translate.h"
+
+bool gen_lsa(DisasContext *ctx, int rd, int rt, int rs, int sa)
+{
+    TCGv t0;
+    TCGv t1;
+
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return true;
+    }
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    gen_load_gpr(t0, rs);
+    gen_load_gpr(t1, rt);
+    tcg_gen_shli_tl(t0, t0, sa + 1);
+    tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
+    tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+
+    tcg_temp_free(t1);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+bool gen_dlsa(DisasContext *ctx, int rd, int rt, int rs, int sa)
+{
+    TCGv t0;
+    TCGv t1;
+
+    check_mips_64(ctx);
+
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return true;
+    }
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    gen_load_gpr(t0, rs);
+    gen_load_gpr(t1, rt);
+    tcg_gen_shli_tl(t0, t0, sa + 1);
+    tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
+    tcg_temp_free(t1);
+    tcg_temp_free(t0);
+
+    return true;
+}
diff --git a/target/mips/meson.build b/target/mips/meson.build
index a3c37241884..3810554343c 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -17,6 +17,7 @@
   'op_helper.c',
   'tlb_helper.c',
   'translate.c',
+  'translate_addr_const.c',
 ))
 mips_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
 
-- 
2.26.2



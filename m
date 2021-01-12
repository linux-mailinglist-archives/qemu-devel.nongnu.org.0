Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3608E2F3C0D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 22:59:31 +0100 (CET)
Received: from localhost ([::1]:58164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzRhK-0006Mj-9F
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 16:59:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzRdV-0002ZM-53
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:55:36 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzRdT-0001f6-3r
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:55:32 -0500
Received: by mail-wm1-x32f.google.com with SMTP id e25so3521694wme.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aKF8Ov+jUrnlot8cgyBolauUR7tCFJnSWhClvDT6qUI=;
 b=obrDR8Q/JnJPgEcBNfrY96HbbtFv907pyMXpAfi8SBDKpsw8TssLrWsGmcfkbtWUI3
 2+rBDgo4677QQ8iDogdiA1tmqo7s1i889Rn9aGbBZmqUITncRrF420L9o8DLbv8yh5qZ
 ytu5g8ZuX/oxrHrQ7QpO+8/XV63JbGGMkwXoW6t9crt9Yr1uot0NqmaS5od71FFZj/3g
 hE5N0GZCDGMMhliqeYSzqWr/1mlH/oZrMs/yvGgMqcutw0xIOKNzdUQTM991ozbWFnLw
 C5j3ACG6nxI6DHxJ8EZ427kwAoZb5ggIQ56M/CKPpDqZh4XxA1S4rRS81OuXrq2CDtwO
 QLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aKF8Ov+jUrnlot8cgyBolauUR7tCFJnSWhClvDT6qUI=;
 b=YeZkafSkVTq3jjUe+76VTm2BTHSgudsIZqWIis1wiWDPju67RlQtlxKw3BkmUboPA3
 bR2h6+fqUDJqR2SYkYDhoxzuzlNDuxCvsSv5EQkhCz7j+j3m0PujOJGw1Ex+K8Fngiul
 P+i7axEbNXpZUu08tLjaUcVrPML/f+DXmaXxKks7dcOJjedqpHWhFDQVko5XzqBLPA5C
 rfuXh5iOy7rL/7me+eVowRSx9Ttw2dU+BRVWqPUuKpZsOALL+dK0jyUoDosFOEYRzMRj
 07XnSWk7uNpuL7z6BV0YPQPUHovY7ud57JlnBL8HSc6cPPCRlztrMMkfX1BWGL1Ohbnr
 jyIg==
X-Gm-Message-State: AOAM530dIErs+blMj9ljLJ5ucOq9lFyeYnR1QeBVaSKWC8juRsofrKWT
 QmeUMyxbudY1guOZGNEjTATePlA1rp0=
X-Google-Smtp-Source: ABdhPJx3A1+V4QwYl/XLcjA7f17B7O8ieQshWGd67jeUhD8byghP2pKa517sw0oj2o4O164zsJtu/w==
X-Received: by 2002:a7b:cd91:: with SMTP id y17mr1054053wmj.171.1610488528744; 
 Tue, 12 Jan 2021 13:55:28 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id 67sm5919951wmb.47.2021.01.12.13.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 13:55:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] target/mips: Convert Loongson [D]DIVU.G opcodes to
 decodetree
Date: Tue, 12 Jan 2021 22:55:02 +0100
Message-Id: <20210112215504.2093955-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112215504.2093955-1-f4bug@amsat.org>
References: <20210112215504.2093955-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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

Convert DIVU.G (divide 32-bit unsigned integers) and DDIVU.G
(divide 64-bit unsigned integers) opcodes to decodetree.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/godson2.decode    |  2 ++
 target/mips/loong-ext.decode  |  2 ++
 target/mips/loong_translate.c | 55 +++++++++++++++++++++++++++++++++++
 target/mips/translate.c       | 37 -----------------------
 4 files changed, 59 insertions(+), 37 deletions(-)

diff --git a/target/mips/godson2.decode b/target/mips/godson2.decode
index b56a93a1999..0d5a72064d2 100644
--- a/target/mips/godson2.decode
+++ b/target/mips/godson2.decode
@@ -14,4 +14,6 @@
 @rs_rt_rd       ...... rs:5  rt:5  rd:5  ..... ......   &muldiv
 
 DIV.G           011111 ..... ..... ..... 00000 011010   @rs_rt_rd
+DIVU.G          011111 ..... ..... ..... 00000 011011   @rs_rt_rd
 DDIV.G          011111 ..... ..... ..... 00000 011110   @rs_rt_rd
+DDIVU.G         011111 ..... ..... ..... 00000 011111   @rs_rt_rd
diff --git a/target/mips/loong-ext.decode b/target/mips/loong-ext.decode
index 331c2226ae3..2e98262b81d 100644
--- a/target/mips/loong-ext.decode
+++ b/target/mips/loong-ext.decode
@@ -16,3 +16,5 @@
 
 DIV.G           011100 ..... ..... ..... 00000 010100   @rs_rt_rd
 DDIV.G          011100 ..... ..... ..... 00000 010101   @rs_rt_rd
+DIVU.G          011100 ..... ..... ..... 00000 010110   @rs_rt_rd
+DDIVU.G         011100 ..... ..... ..... 00000 010111   @rs_rt_rd
diff --git a/target/mips/loong_translate.c b/target/mips/loong_translate.c
index 634d4ba8031..7b3304ec749 100644
--- a/target/mips/loong_translate.c
+++ b/target/mips/loong_translate.c
@@ -92,6 +92,61 @@ static bool trans_DDIV_G(DisasContext *s, arg_muldiv *a)
     return gen_lext_DIV_G(s, a->rt, a->rs, a->rd, true);
 }
 
+static bool gen_lext_DIVU_G(DisasContext *s, int rd, int rs, int rt,
+                            bool is_double)
+{
+    TCGv t0, t1;
+    TCGLabel *l1, *l2;
+
+    if (is_double) {
+        if (TARGET_LONG_BITS != 64) {
+            return false;
+        }
+        check_mips_64(s);
+    }
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
+
+    gen_load_gpr(t0, rs);
+    gen_load_gpr(t1, rt);
+
+    if (!is_double) {
+        tcg_gen_ext32u_tl(t0, t0);
+        tcg_gen_ext32u_tl(t1, t1);
+    }
+    tcg_gen_brcondi_tl(TCG_COND_NE, t1, 0, l1);
+    tcg_gen_movi_tl(cpu_gpr[rd], 0);
+
+    tcg_gen_br(l2);
+    gen_set_label(l1);
+    tcg_gen_divu_tl(cpu_gpr[rd], t0, t1);
+    tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+    gen_set_label(l2);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_DIVU_G(DisasContext *s, arg_muldiv *a)
+{
+    return gen_lext_DIVU_G(s, a->rt, a->rs, a->rd, false);
+}
+
+static bool trans_DDIVU_G(DisasContext *s, arg_muldiv *a)
+{
+    return gen_lext_DIVU_G(s, a->rt, a->rs, a->rd, true);
+}
+
 bool decode_loongson(DisasContext *ctx, uint32_t insn)
 {
     if ((ctx->insn_flags & INSN_LOONGSON2E)
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 7cefff44d74..69463e3b42d 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -342,8 +342,6 @@ enum {
     OPC_DMULT_G_2F  = 0x11 | OPC_SPECIAL2,
     OPC_MULTU_G_2F  = 0x12 | OPC_SPECIAL2,
     OPC_DMULTU_G_2F = 0x13 | OPC_SPECIAL2,
-    OPC_DIVU_G_2F   = 0x16 | OPC_SPECIAL2,
-    OPC_DDIVU_G_2F  = 0x17 | OPC_SPECIAL2,
     OPC_MOD_G_2F    = 0x1c | OPC_SPECIAL2,
     OPC_DMOD_G_2F   = 0x1d | OPC_SPECIAL2,
     OPC_MODU_G_2F   = 0x1e | OPC_SPECIAL2,
@@ -379,10 +377,8 @@ enum {
     /* Loongson 2E */
     OPC_MULT_G_2E   = 0x18 | OPC_SPECIAL3,
     OPC_MULTU_G_2E  = 0x19 | OPC_SPECIAL3,
-    OPC_DIVU_G_2E   = 0x1B | OPC_SPECIAL3,
     OPC_DMULT_G_2E  = 0x1C | OPC_SPECIAL3,
     OPC_DMULTU_G_2E = 0x1D | OPC_SPECIAL3,
-    OPC_DDIVU_G_2E  = 0x1F | OPC_SPECIAL3,
     OPC_MOD_G_2E    = 0x22 | OPC_SPECIAL3,
     OPC_MODU_G_2E   = 0x23 | OPC_SPECIAL3,
     OPC_DMOD_G_2E   = 0x26 | OPC_SPECIAL3,
@@ -5021,22 +5017,6 @@ static void gen_loongson_integer(DisasContext *ctx, uint32_t opc,
         tcg_gen_mul_tl(cpu_gpr[rd], t0, t1);
         tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
         break;
-    case OPC_DIVU_G_2E:
-    case OPC_DIVU_G_2F:
-        {
-            TCGLabel *l1 = gen_new_label();
-            TCGLabel *l2 = gen_new_label();
-            tcg_gen_ext32u_tl(t0, t0);
-            tcg_gen_ext32u_tl(t1, t1);
-            tcg_gen_brcondi_tl(TCG_COND_NE, t1, 0, l1);
-            tcg_gen_movi_tl(cpu_gpr[rd], 0);
-            tcg_gen_br(l2);
-            gen_set_label(l1);
-            tcg_gen_divu_tl(cpu_gpr[rd], t0, t1);
-            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-            gen_set_label(l2);
-        }
-        break;
     case OPC_MOD_G_2E:
     case OPC_MOD_G_2F:
         {
@@ -5082,19 +5062,6 @@ static void gen_loongson_integer(DisasContext *ctx, uint32_t opc,
     case OPC_DMULTU_G_2F:
         tcg_gen_mul_tl(cpu_gpr[rd], t0, t1);
         break;
-    case OPC_DDIVU_G_2E:
-    case OPC_DDIVU_G_2F:
-        {
-            TCGLabel *l1 = gen_new_label();
-            TCGLabel *l2 = gen_new_label();
-            tcg_gen_brcondi_tl(TCG_COND_NE, t1, 0, l1);
-            tcg_gen_movi_tl(cpu_gpr[rd], 0);
-            tcg_gen_br(l2);
-            gen_set_label(l1);
-            tcg_gen_divu_tl(cpu_gpr[rd], t0, t1);
-            gen_set_label(l2);
-        }
-        break;
     case OPC_DMOD_G_2E:
     case OPC_DMOD_G_2F:
         {
@@ -27100,7 +27067,6 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MUL:
         gen_arith(ctx, op1, rd, rs, rt);
         break;
-    case OPC_DIVU_G_2F:
     case OPC_MULT_G_2F:
     case OPC_MULTU_G_2F:
     case OPC_MOD_G_2F:
@@ -27134,7 +27100,6 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
         break;
     case OPC_DMULT_G_2F:
     case OPC_DMULTU_G_2F:
-    case OPC_DDIVU_G_2F:
     case OPC_DMOD_G_2F:
     case OPC_DMODU_G_2F:
         check_insn(ctx, INSN_LOONGSON2F | ASE_LEXT);
@@ -27272,7 +27237,6 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
 
     op1 = MASK_SPECIAL3(ctx->opcode);
     switch (op1) {
-    case OPC_DIVU_G_2E:
     case OPC_MOD_G_2E:
     case OPC_MODU_G_2E:
     case OPC_MULT_G_2E:
@@ -27542,7 +27506,6 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
         }
         break;
 #if defined(TARGET_MIPS64)
-    case OPC_DDIVU_G_2E:
     case OPC_DMULT_G_2E:
     case OPC_DMULTU_G_2E:
     case OPC_DMOD_G_2E:
-- 
2.26.2



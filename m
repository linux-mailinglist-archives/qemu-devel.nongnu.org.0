Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849552F3C17
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 23:03:13 +0100 (CET)
Received: from localhost ([::1]:34398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzRku-0008N5-GW
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 17:03:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzRdR-0002Z6-7o
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:55:36 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:47091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzRdP-0001at-BT
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:55:28 -0500
Received: by mail-wr1-x435.google.com with SMTP id d13so4021927wrc.13
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ENLslfsm1B59+V1dnfv0a0Wd7gr1IJbCp3QQ6a86opw=;
 b=jwHL3yK0QzVqGNZ7kBvsw/cUxs1DXYRhMbBlEFIORgFwicR8ugrqb2duqWBHMotAJK
 429++HQ8Zfcm5n4kXrswMaDPORMRpLt9B+89RnuJLCq7iuzjKQBU908ITDbdfa3UKnvI
 Z607Eo83KoyJdPpyQeTgmKvjY0VEr66wD7jpvpZ5R0YHPxi4ZVFS1u2166aeAoVoKZmw
 aCe3rrkwBacEV3BnqwoEGAMLwkYUbPjus6x+HErUatJCaPQIi0t68DJe/EWRYDtiHMKn
 7kMEAPBX+gG30NcykOEC6D1t0FhK1ep8O6tQjId94wJxCTSWDKgn6nGQ/TRN0QdWvnhp
 CQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ENLslfsm1B59+V1dnfv0a0Wd7gr1IJbCp3QQ6a86opw=;
 b=cmkb3egHvX3IDlKfrT6rJf3OGtBrZQgQYlsuxx+IwpGpHEK9NFzHpPWWIu58Co8JX9
 bUtpULmQB6rsHBpqCoWUMwJ6O9smCuaJrQUb+qO3CKEiLG5qmL8i/bpAb6S5xke2cSgu
 +XtIcm9baGzcu36xUppFT+fMhwIKdqkV56cCXQCcp5v8due0mzwKnRZNv/52HP7XeVMG
 aano5otFYRWkGXqThqIY236vjp6bby/a7LDaCuWkCd5fbpzfm3pUeEYx//gq9lALv+ii
 PffQadQP4Hkemtnf4TOithJa9O7kFFv5+fzEuTFT9G9O+SEcvbHxfpFAUzmqVXY/81Gz
 5/fA==
X-Gm-Message-State: AOAM532xR7al684s5bleImbVxc/Dh9ONDLkrLklFKAbpyt9o9ODl0jPO
 krgxDGKqvydftVXIztUPZ6frhJxAZls=
X-Google-Smtp-Source: ABdhPJwfIge+0wGWzxa05FnaKaUIU0h0TR4j7BgXugS4cTG3Inmw14u+mp3TzHaiFCYkCQdh+lfvVg==
X-Received: by 2002:a5d:4d8b:: with SMTP id b11mr799831wru.215.1610488523579; 
 Tue, 12 Jan 2021 13:55:23 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id u13sm7152891wrw.11.2021.01.12.13.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 13:55:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] target/mips: Convert Loongson DIV.G opcodes to decodetree
Date: Tue, 12 Jan 2021 22:55:01 +0100
Message-Id: <20210112215504.2093955-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112215504.2093955-1-f4bug@amsat.org>
References: <20210112215504.2093955-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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

DIV.G and DDIV.G are very similar. Provide gen_lext_DIV_G() a
'is_double' argument so it can generate DIV.G (divide 32-bit
signed integers).

With this commit we explicit the template used to generate
opcode for 32/64-bit word variants. Next commits will be less
verbose by providing both variants at once.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/godson2.decode    |  1 +
 target/mips/loong-ext.decode  |  1 +
 target/mips/loong_translate.c | 28 ++++++++++++++++++++++------
 target/mips/translate.c       | 26 --------------------------
 4 files changed, 24 insertions(+), 32 deletions(-)

diff --git a/target/mips/godson2.decode b/target/mips/godson2.decode
index cbe22285740..b56a93a1999 100644
--- a/target/mips/godson2.decode
+++ b/target/mips/godson2.decode
@@ -13,4 +13,5 @@
 
 @rs_rt_rd       ...... rs:5  rt:5  rd:5  ..... ......   &muldiv
 
+DIV.G           011111 ..... ..... ..... 00000 011010   @rs_rt_rd
 DDIV.G          011111 ..... ..... ..... 00000 011110   @rs_rt_rd
diff --git a/target/mips/loong-ext.decode b/target/mips/loong-ext.decode
index 557fe06c14a..331c2226ae3 100644
--- a/target/mips/loong-ext.decode
+++ b/target/mips/loong-ext.decode
@@ -14,4 +14,5 @@
 
 @rs_rt_rd       ...... rs:5  rt:5  rd:5  ..... ......   &muldiv
 
+DIV.G           011100 ..... ..... ..... 00000 010100   @rs_rt_rd
 DDIV.G          011100 ..... ..... ..... 00000 010101   @rs_rt_rd
diff --git a/target/mips/loong_translate.c b/target/mips/loong_translate.c
index c452472e7a7..634d4ba8031 100644
--- a/target/mips/loong_translate.c
+++ b/target/mips/loong_translate.c
@@ -27,15 +27,18 @@
  * into general-purpose registers.
  */
 
-static bool gen_lext_DIV_G(DisasContext *s, int rd, int rs, int rt)
+static bool gen_lext_DIV_G(DisasContext *s, int rd, int rs, int rt,
+                           bool is_double)
 {
     TCGv t0, t1;
     TCGLabel *l1, *l2, *l3;
 
-    if (TARGET_LONG_BITS != 64) {
-        return false;
+    if (is_double) {
+        if (TARGET_LONG_BITS != 64) {
+            return false;
+        }
+        check_mips_64(s);
     }
-    check_mips_64(s);
 
     if (rd == 0) {
         /* Treat as NOP. */
@@ -51,18 +54,26 @@ static bool gen_lext_DIV_G(DisasContext *s, int rd, int rs, int rt)
     gen_load_gpr(t0, rs);
     gen_load_gpr(t1, rt);
 
+    if (!is_double) {
+        tcg_gen_ext32s_tl(t0, t0);
+        tcg_gen_ext32s_tl(t0, t0);
+        tcg_gen_ext32s_tl(t1, t1);
+    }
     tcg_gen_brcondi_tl(TCG_COND_NE, t1, 0, l1);
     tcg_gen_movi_tl(cpu_gpr[rd], 0);
     tcg_gen_br(l3);
     gen_set_label(l1);
 
-    tcg_gen_brcondi_tl(TCG_COND_NE, t0, -1LL << 63, l2);
+    tcg_gen_brcondi_tl(TCG_COND_NE, t0, is_double ? -1LL << 63 : INT_MIN, l2);
     tcg_gen_brcondi_tl(TCG_COND_NE, t1, -1LL, l2);
     tcg_gen_mov_tl(cpu_gpr[rd], t0);
 
     tcg_gen_br(l3);
     gen_set_label(l2);
     tcg_gen_div_tl(cpu_gpr[rd], t0, t1);
+    if (!is_double) {
+        tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+    }
     gen_set_label(l3);
 
     tcg_temp_free(t0);
@@ -71,9 +82,14 @@ static bool gen_lext_DIV_G(DisasContext *s, int rd, int rs, int rt)
     return true;
 }
 
+static bool trans_DIV_G(DisasContext *s, arg_muldiv *a)
+{
+    return gen_lext_DIV_G(s, a->rt, a->rs, a->rd, false);
+}
+
 static bool trans_DDIV_G(DisasContext *s, arg_muldiv *a)
 {
-    return gen_lext_DIV_G(s, a->rt, a->rs, a->rd);
+    return gen_lext_DIV_G(s, a->rt, a->rs, a->rd, true);
 }
 
 bool decode_loongson(DisasContext *ctx, uint32_t insn)
diff --git a/target/mips/translate.c b/target/mips/translate.c
index c427ea98952..7cefff44d74 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -342,7 +342,6 @@ enum {
     OPC_DMULT_G_2F  = 0x11 | OPC_SPECIAL2,
     OPC_MULTU_G_2F  = 0x12 | OPC_SPECIAL2,
     OPC_DMULTU_G_2F = 0x13 | OPC_SPECIAL2,
-    OPC_DIV_G_2F    = 0x14 | OPC_SPECIAL2,
     OPC_DIVU_G_2F   = 0x16 | OPC_SPECIAL2,
     OPC_DDIVU_G_2F  = 0x17 | OPC_SPECIAL2,
     OPC_MOD_G_2F    = 0x1c | OPC_SPECIAL2,
@@ -380,7 +379,6 @@ enum {
     /* Loongson 2E */
     OPC_MULT_G_2E   = 0x18 | OPC_SPECIAL3,
     OPC_MULTU_G_2E  = 0x19 | OPC_SPECIAL3,
-    OPC_DIV_G_2E    = 0x1A | OPC_SPECIAL3,
     OPC_DIVU_G_2E   = 0x1B | OPC_SPECIAL3,
     OPC_DMULT_G_2E  = 0x1C | OPC_SPECIAL3,
     OPC_DMULTU_G_2E = 0x1D | OPC_SPECIAL3,
@@ -5023,28 +5021,6 @@ static void gen_loongson_integer(DisasContext *ctx, uint32_t opc,
         tcg_gen_mul_tl(cpu_gpr[rd], t0, t1);
         tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
         break;
-    case OPC_DIV_G_2E:
-    case OPC_DIV_G_2F:
-        {
-            TCGLabel *l1 = gen_new_label();
-            TCGLabel *l2 = gen_new_label();
-            TCGLabel *l3 = gen_new_label();
-            tcg_gen_ext32s_tl(t0, t0);
-            tcg_gen_ext32s_tl(t1, t1);
-            tcg_gen_brcondi_tl(TCG_COND_NE, t1, 0, l1);
-            tcg_gen_movi_tl(cpu_gpr[rd], 0);
-            tcg_gen_br(l3);
-            gen_set_label(l1);
-            tcg_gen_brcondi_tl(TCG_COND_NE, t0, INT_MIN, l2);
-            tcg_gen_brcondi_tl(TCG_COND_NE, t1, -1, l2);
-            tcg_gen_mov_tl(cpu_gpr[rd], t0);
-            tcg_gen_br(l3);
-            gen_set_label(l2);
-            tcg_gen_div_tl(cpu_gpr[rd], t0, t1);
-            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-            gen_set_label(l3);
-        }
-        break;
     case OPC_DIVU_G_2E:
     case OPC_DIVU_G_2F:
         {
@@ -27124,7 +27100,6 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MUL:
         gen_arith(ctx, op1, rd, rs, rt);
         break;
-    case OPC_DIV_G_2F:
     case OPC_DIVU_G_2F:
     case OPC_MULT_G_2F:
     case OPC_MULTU_G_2F:
@@ -27297,7 +27272,6 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
 
     op1 = MASK_SPECIAL3(ctx->opcode);
     switch (op1) {
-    case OPC_DIV_G_2E:
     case OPC_DIVU_G_2E:
     case OPC_MOD_G_2E:
     case OPC_MODU_G_2E:
-- 
2.26.2



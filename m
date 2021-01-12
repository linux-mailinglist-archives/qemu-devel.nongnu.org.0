Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0D12F3C1D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 23:04:52 +0100 (CET)
Received: from localhost ([::1]:39828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzRmV-0002HN-Dc
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 17:04:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzRdZ-0002bH-A4
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:55:37 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzRdX-0001gh-H8
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:55:37 -0500
Received: by mail-wr1-x435.google.com with SMTP id q18so38736wrn.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gGCMmxvlx4ZHqOffAOkN9CXPMwMwdru/fLrpk0jKgDg=;
 b=dXLfnec4hKvYB/E/Duy+mRNmCpe0HMRr44fzl11aNqdSdi9GgrAFyp8JZzeK7IXNCj
 qijrNvzPYLxVru7vZ8OJ+Icz8lwePmj5o3UpE6Z7LkRVV0/zL2vjxi1kth9yOPuPGVbW
 xAP2AvED+gRuBqr9z0MjCAizdyQbI6JBgvlROypTVNnZq47nHgrWntzqY+TkdIv6uf1+
 HM/ZhClqTK3r/n3aY/ioDFrfzxyOSUvgIzeOyv7qNkYCVyOq6Iw9/QFsbBtVVbYe05sF
 TAg8REersff1veHOGjaUmuBDJGJaohX/nP+LfQ+U88XOVOiUzNyYDbXL4jhvCnerc8Lh
 PkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gGCMmxvlx4ZHqOffAOkN9CXPMwMwdru/fLrpk0jKgDg=;
 b=TVCJgybF8uQBW/5qKWh0/hyja0W1VW3cB99uBt+BzKSCVGB/ys2JuzMneDNyckFhcJ
 ezxlu7G9Wsf6NztPav0lAuyy0PQ6sbEE599VWbxYc+NOW4u2WhdgTsKZranUyI/znQUj
 oXeeAXbpbN0UCvz3Ipp7g/2V6e56sVJSoXggU8Tj0W8gzYJO9FeDh0PpQmahsFusBPfa
 eDgGQvbiBOPzeWjveNtwjmFCeXcAPrHXORyUmJiH8dUxr66wyFoiEy94g08KN9wBovF0
 /lqzT5Ma2shL1qUXIJedw/VYgGbbXK8v+6sC+8ramPyBUL1DfYPgswqiY3aq481ZVhRH
 JYgQ==
X-Gm-Message-State: AOAM5329rDR5Y138r4U5FftK3Z061YqkFihnPZZ73v0RNteFRV4V1aYu
 H6trGs31NFPpamSrQU95WSXQqAf4brk=
X-Google-Smtp-Source: ABdhPJxb1zLgu+BWT9uUhKjX2x9l0cgWDjmfCakoV4PHkYEuqfiNtRCAz/pj3+d7sS1ctnVRcHrBVQ==
X-Received: by 2002:a05:6000:1882:: with SMTP id
 a2mr797004wri.237.1610488533925; 
 Tue, 12 Jan 2021 13:55:33 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id d191sm5531790wmd.24.2021.01.12.13.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 13:55:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] target/mips: Convert Loongson [D]MOD[U].G opcodes to
 decodetree
Date: Tue, 12 Jan 2021 22:55:03 +0100
Message-Id: <20210112215504.2093955-6-f4bug@amsat.org>
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

Convert the following opcodes to decodetree:

- MOD.G - mod 32-bit signed integers
- MODU.G - mod 32-bit unsigned integers
- DMOD.G - mod 64-bit signed integers
- DMODU.G - mod 64-bit unsigned integers

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/godson2.decode    |   5 ++
 target/mips/loong-ext.decode  |   5 ++
 target/mips/loong_translate.c | 116 ++++++++++++++++++++++++++++++++++
 target/mips/translate.c       |  86 -------------------------
 4 files changed, 126 insertions(+), 86 deletions(-)

diff --git a/target/mips/godson2.decode b/target/mips/godson2.decode
index 0d5a72064d2..805452fa975 100644
--- a/target/mips/godson2.decode
+++ b/target/mips/godson2.decode
@@ -17,3 +17,8 @@ DIV.G           011111 ..... ..... ..... 00000 011010   @rs_rt_rd
 DIVU.G          011111 ..... ..... ..... 00000 011011   @rs_rt_rd
 DDIV.G          011111 ..... ..... ..... 00000 011110   @rs_rt_rd
 DDIVU.G         011111 ..... ..... ..... 00000 011111   @rs_rt_rd
+
+MOD.G           011111 ..... ..... ..... 00000 100010   @rs_rt_rd
+MODU.G          011111 ..... ..... ..... 00000 100011   @rs_rt_rd
+DMOD.G          011111 ..... ..... ..... 00000 100110   @rs_rt_rd
+DMODU.G         011111 ..... ..... ..... 00000 100111   @rs_rt_rd
diff --git a/target/mips/loong-ext.decode b/target/mips/loong-ext.decode
index 2e98262b81d..b0715894ee1 100644
--- a/target/mips/loong-ext.decode
+++ b/target/mips/loong-ext.decode
@@ -18,3 +18,8 @@ DIV.G           011100 ..... ..... ..... 00000 010100   @rs_rt_rd
 DDIV.G          011100 ..... ..... ..... 00000 010101   @rs_rt_rd
 DIVU.G          011100 ..... ..... ..... 00000 010110   @rs_rt_rd
 DDIVU.G         011100 ..... ..... ..... 00000 010111   @rs_rt_rd
+
+MOD.G           011100 ..... ..... ..... 00000 011100   @rs_rt_rd
+DMOD.G          011100 ..... ..... ..... 00000 011101   @rs_rt_rd
+MODU.G          011100 ..... ..... ..... 00000 011110   @rs_rt_rd
+DMODU.G         011100 ..... ..... ..... 00000 011111   @rs_rt_rd
diff --git a/target/mips/loong_translate.c b/target/mips/loong_translate.c
index 7b3304ec749..50609ce4178 100644
--- a/target/mips/loong_translate.c
+++ b/target/mips/loong_translate.c
@@ -147,6 +147,122 @@ static bool trans_DDIVU_G(DisasContext *s, arg_muldiv *a)
     return gen_lext_DIVU_G(s, a->rt, a->rs, a->rd, true);
 }
 
+static bool gen_lext_MOD_G(DisasContext *s, int rd, int rs, int rt,
+                           bool is_double)
+{
+    TCGv t0, t1;
+    TCGLabel *l1, *l2, *l3;
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
+    l3 = gen_new_label();
+
+    gen_load_gpr(t0, rs);
+    gen_load_gpr(t1, rt);
+
+    if (!is_double) {
+        tcg_gen_ext32u_tl(t0, t0);
+        tcg_gen_ext32u_tl(t1, t1);
+    }
+    tcg_gen_brcondi_tl(TCG_COND_EQ, t1, 0, l1);
+    tcg_gen_brcondi_tl(TCG_COND_NE, t0, is_double ? -1LL << 63 : INT_MIN, l2);
+    tcg_gen_brcondi_tl(TCG_COND_NE, t1, -1LL, l2);
+    gen_set_label(l1);
+    tcg_gen_movi_tl(cpu_gpr[rd], 0);
+    tcg_gen_br(l3);
+    gen_set_label(l2);
+    tcg_gen_rem_tl(cpu_gpr[rd], t0, t1);
+    if (!is_double) {
+        tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+    }
+    gen_set_label(l3);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_MOD_G(DisasContext *s, arg_muldiv *a)
+{
+    return gen_lext_MOD_G(s, a->rt, a->rs, a->rd, false);
+}
+
+static bool trans_DMOD_G(DisasContext *s, arg_muldiv *a)
+{
+    return gen_lext_MOD_G(s, a->rt, a->rs, a->rd, true);
+}
+
+static bool gen_lext_MODU_G(DisasContext *s, int rd, int rs, int rt,
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
+    tcg_gen_br(l2);
+    gen_set_label(l1);
+    tcg_gen_remu_tl(cpu_gpr[rd], t0, t1);
+    if (!is_double) {
+        tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+    }
+    gen_set_label(l2);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_MODU_G(DisasContext *s, arg_muldiv *a)
+{
+    return gen_lext_MODU_G(s, a->rt, a->rs, a->rd, false);
+}
+
+static bool trans_DMODU_G(DisasContext *s, arg_muldiv *a)
+{
+    return gen_lext_MODU_G(s, a->rt, a->rs, a->rd, true);
+}
+
 bool decode_loongson(DisasContext *ctx, uint32_t insn)
 {
     if ((ctx->insn_flags & INSN_LOONGSON2E)
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 69463e3b42d..144e51b063a 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -342,10 +342,6 @@ enum {
     OPC_DMULT_G_2F  = 0x11 | OPC_SPECIAL2,
     OPC_MULTU_G_2F  = 0x12 | OPC_SPECIAL2,
     OPC_DMULTU_G_2F = 0x13 | OPC_SPECIAL2,
-    OPC_MOD_G_2F    = 0x1c | OPC_SPECIAL2,
-    OPC_DMOD_G_2F   = 0x1d | OPC_SPECIAL2,
-    OPC_MODU_G_2F   = 0x1e | OPC_SPECIAL2,
-    OPC_DMODU_G_2F  = 0x1f | OPC_SPECIAL2,
     /* Misc */
     OPC_CLZ      = 0x20 | OPC_SPECIAL2,
     OPC_CLO      = 0x21 | OPC_SPECIAL2,
@@ -379,10 +375,6 @@ enum {
     OPC_MULTU_G_2E  = 0x19 | OPC_SPECIAL3,
     OPC_DMULT_G_2E  = 0x1C | OPC_SPECIAL3,
     OPC_DMULTU_G_2E = 0x1D | OPC_SPECIAL3,
-    OPC_MOD_G_2E    = 0x22 | OPC_SPECIAL3,
-    OPC_MODU_G_2E   = 0x23 | OPC_SPECIAL3,
-    OPC_DMOD_G_2E   = 0x26 | OPC_SPECIAL3,
-    OPC_DMODU_G_2E  = 0x27 | OPC_SPECIAL3,
 
     /* MIPS DSP Load */
     OPC_LX_DSP         = 0x0A | OPC_SPECIAL3,
@@ -4995,10 +4987,6 @@ static void gen_loongson_integer(DisasContext *ctx, uint32_t opc,
         t0 = tcg_temp_new();
         t1 = tcg_temp_new();
         break;
-    default:
-        t0 = tcg_temp_local_new();
-        t1 = tcg_temp_local_new();
-        break;
     }
 
     gen_load_gpr(t0, rs);
@@ -5017,42 +5005,6 @@ static void gen_loongson_integer(DisasContext *ctx, uint32_t opc,
         tcg_gen_mul_tl(cpu_gpr[rd], t0, t1);
         tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
         break;
-    case OPC_MOD_G_2E:
-    case OPC_MOD_G_2F:
-        {
-            TCGLabel *l1 = gen_new_label();
-            TCGLabel *l2 = gen_new_label();
-            TCGLabel *l3 = gen_new_label();
-            tcg_gen_ext32u_tl(t0, t0);
-            tcg_gen_ext32u_tl(t1, t1);
-            tcg_gen_brcondi_tl(TCG_COND_EQ, t1, 0, l1);
-            tcg_gen_brcondi_tl(TCG_COND_NE, t0, INT_MIN, l2);
-            tcg_gen_brcondi_tl(TCG_COND_NE, t1, -1, l2);
-            gen_set_label(l1);
-            tcg_gen_movi_tl(cpu_gpr[rd], 0);
-            tcg_gen_br(l3);
-            gen_set_label(l2);
-            tcg_gen_rem_tl(cpu_gpr[rd], t0, t1);
-            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-            gen_set_label(l3);
-        }
-        break;
-    case OPC_MODU_G_2E:
-    case OPC_MODU_G_2F:
-        {
-            TCGLabel *l1 = gen_new_label();
-            TCGLabel *l2 = gen_new_label();
-            tcg_gen_ext32u_tl(t0, t0);
-            tcg_gen_ext32u_tl(t1, t1);
-            tcg_gen_brcondi_tl(TCG_COND_NE, t1, 0, l1);
-            tcg_gen_movi_tl(cpu_gpr[rd], 0);
-            tcg_gen_br(l2);
-            gen_set_label(l1);
-            tcg_gen_remu_tl(cpu_gpr[rd], t0, t1);
-            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-            gen_set_label(l2);
-        }
-        break;
 #if defined(TARGET_MIPS64)
     case OPC_DMULT_G_2E:
     case OPC_DMULT_G_2F:
@@ -5062,36 +5014,6 @@ static void gen_loongson_integer(DisasContext *ctx, uint32_t opc,
     case OPC_DMULTU_G_2F:
         tcg_gen_mul_tl(cpu_gpr[rd], t0, t1);
         break;
-    case OPC_DMOD_G_2E:
-    case OPC_DMOD_G_2F:
-        {
-            TCGLabel *l1 = gen_new_label();
-            TCGLabel *l2 = gen_new_label();
-            TCGLabel *l3 = gen_new_label();
-            tcg_gen_brcondi_tl(TCG_COND_EQ, t1, 0, l1);
-            tcg_gen_brcondi_tl(TCG_COND_NE, t0, -1LL << 63, l2);
-            tcg_gen_brcondi_tl(TCG_COND_NE, t1, -1LL, l2);
-            gen_set_label(l1);
-            tcg_gen_movi_tl(cpu_gpr[rd], 0);
-            tcg_gen_br(l3);
-            gen_set_label(l2);
-            tcg_gen_rem_tl(cpu_gpr[rd], t0, t1);
-            gen_set_label(l3);
-        }
-        break;
-    case OPC_DMODU_G_2E:
-    case OPC_DMODU_G_2F:
-        {
-            TCGLabel *l1 = gen_new_label();
-            TCGLabel *l2 = gen_new_label();
-            tcg_gen_brcondi_tl(TCG_COND_NE, t1, 0, l1);
-            tcg_gen_movi_tl(cpu_gpr[rd], 0);
-            tcg_gen_br(l2);
-            gen_set_label(l1);
-            tcg_gen_remu_tl(cpu_gpr[rd], t0, t1);
-            gen_set_label(l2);
-        }
-        break;
 #endif
     }
 
@@ -27069,8 +26991,6 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
         break;
     case OPC_MULT_G_2F:
     case OPC_MULTU_G_2F:
-    case OPC_MOD_G_2F:
-    case OPC_MODU_G_2F:
         check_insn(ctx, INSN_LOONGSON2F | ASE_LEXT);
         gen_loongson_integer(ctx, op1, rd, rs, rt);
         break;
@@ -27100,8 +27020,6 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
         break;
     case OPC_DMULT_G_2F:
     case OPC_DMULTU_G_2F:
-    case OPC_DMOD_G_2F:
-    case OPC_DMODU_G_2F:
         check_insn(ctx, INSN_LOONGSON2F | ASE_LEXT);
         gen_loongson_integer(ctx, op1, rd, rs, rt);
         break;
@@ -27237,8 +27155,6 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
 
     op1 = MASK_SPECIAL3(ctx->opcode);
     switch (op1) {
-    case OPC_MOD_G_2E:
-    case OPC_MODU_G_2E:
     case OPC_MULT_G_2E:
     case OPC_MULTU_G_2E:
         /*
@@ -27508,8 +27424,6 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
 #if defined(TARGET_MIPS64)
     case OPC_DMULT_G_2E:
     case OPC_DMULTU_G_2E:
-    case OPC_DMOD_G_2E:
-    case OPC_DMODU_G_2E:
         check_insn(ctx, INSN_LOONGSON2E);
         gen_loongson_integer(ctx, op1, rd, rs, rt);
         break;
-- 
2.26.2



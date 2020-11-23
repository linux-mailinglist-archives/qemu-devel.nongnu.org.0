Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA99C2C178C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:20:25 +0100 (CET)
Received: from localhost ([::1]:55268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJG4-0001kL-Lx
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:20:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIjR-0002XY-Cj
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:46:41 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:50286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIjN-0001om-Uc
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:46:41 -0500
Received: by mail-wm1-x333.google.com with SMTP id c198so628625wmd.0
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wzjpmD/cVMaQhUz0TjxaCicaPXOpKMRCXqJxa9f0/F0=;
 b=PqViStlsyODrHDB90o69yIo57eKQSUEN/O3mPLEb/Jfp3s7NOxLyMEuQG/b+9A/bTx
 WhJMyGlPX6leCJvpYOtv8mluVFlFMXF9ekD8gBbnz28U8dUi3dGD3yDy5YoiFZOhZ9uH
 Hlt4VUFMoYhS2TefCEZzRTs3FcI1KoD0xCPJyzhpgYxNO9IO2KqfhQUX6HVmn+h7Jao0
 yEQ7sCiPoLgGt9mYHa3zJzgj00yrhbssGzFO2vYqaYWBCONjn9dPIZaJQzxKnca9qWcD
 +f+i4iWAzYy9Mepes7omIu0CKdkJJwiHVWDDBAol2oRtig9MxAzArDxPpKY+Np8Imn/b
 9DtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wzjpmD/cVMaQhUz0TjxaCicaPXOpKMRCXqJxa9f0/F0=;
 b=qrv/0xFEeHA4Ayzo78iTPvie1ntZMN84qmQKL4Zs8UYwO2dAJIVdVP9Pc+L+xe4kHC
 ODK/iln2I6Bcr+F2g7aZ2mx+cbwiCeQaF9Cj69S1Fccx97EjqtxoTlO/9KQexRx2nA4+
 bwwC2CrTtSU4AoTYfoUOG34OMoj/SxoY2AEnuzvC7p5AE0w0BK42tP4BKjUFv36d5R7F
 mkVZb92NmisBEbeFPAAx+jK+uA6qdY7z5Gqlp7jPrMtG4PfNlElavMSEhbLaLwvPzGIu
 59mNj0jblmD+iFzp7qY8fCuwgpb7+b88gVAC95DTni5Ljn/0d93haiVZSa9Uoia8H2g6
 Jltw==
X-Gm-Message-State: AOAM533L44SJIa2zuYW4LHdHOKia0vRGumFEwya3koEDce8KQXuMDzxa
 VBTbRoW2MZOweBnQKNRejE1gI9Y+rJ0=
X-Google-Smtp-Source: ABdhPJywagLuIpauFc6CBaev1IhkZyzJdSRm67zblB7d/mv9hD4UmAWEC01MLHIBO4w6hlHIYXCMrg==
X-Received: by 2002:a1c:a9c4:: with SMTP id s187mr737360wme.180.1606164395071; 
 Mon, 23 Nov 2020 12:46:35 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id c64sm758259wmd.41.2020.11.23.12.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 12:46:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/28] target/mips: Extract Loongson EXTensions translation
 routines
Date: Mon, 23 Nov 2020 21:44:41 +0100
Message-Id: <20201123204448.3260804-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123204448.3260804-1-f4bug@amsat.org>
References: <20201123204448.3260804-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

LoongEXTs are general-purpose extensions from the LoongISA.

Extract 650 lines of translation routines to
'vendor-loong-ext_translate.c.inc'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c                      | 652 +-----------------
 target/mips/vendor-loong-ext_translate.c.inc | 665 +++++++++++++++++++
 2 files changed, 666 insertions(+), 651 deletions(-)
 create mode 100644 target/mips/vendor-loong-ext_translate.c.inc

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 745bf9a9dd9..90ab84c69a3 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -330,19 +330,6 @@ enum {
     OPC_MUL      = 0x02 | OPC_SPECIAL2,
     OPC_MSUB     = 0x04 | OPC_SPECIAL2,
     OPC_MSUBU    = 0x05 | OPC_SPECIAL2,
-    /* Loongson 2F */
-    OPC_MULT_G_2F   = 0x10 | OPC_SPECIAL2,
-    OPC_DMULT_G_2F  = 0x11 | OPC_SPECIAL2,
-    OPC_MULTU_G_2F  = 0x12 | OPC_SPECIAL2,
-    OPC_DMULTU_G_2F = 0x13 | OPC_SPECIAL2,
-    OPC_DIV_G_2F    = 0x14 | OPC_SPECIAL2,
-    OPC_DDIV_G_2F   = 0x15 | OPC_SPECIAL2,
-    OPC_DIVU_G_2F   = 0x16 | OPC_SPECIAL2,
-    OPC_DDIVU_G_2F  = 0x17 | OPC_SPECIAL2,
-    OPC_MOD_G_2F    = 0x1c | OPC_SPECIAL2,
-    OPC_DMOD_G_2F   = 0x1d | OPC_SPECIAL2,
-    OPC_MODU_G_2F   = 0x1e | OPC_SPECIAL2,
-    OPC_DMODU_G_2F  = 0x1f | OPC_SPECIAL2,
     /* Misc */
     OPC_CLZ      = 0x20 | OPC_SPECIAL2,
     OPC_CLO      = 0x21 | OPC_SPECIAL2,
@@ -412,48 +399,6 @@ enum {
     R6_OPC_SCD         = 0x27 | OPC_SPECIAL3,
 };
 
-/* Loongson EXT load/store quad word opcodes */
-#define MASK_LOONGSON_GSLSQ(op)           (MASK_OP_MAJOR(op) | (op & 0x8020))
-enum {
-    OPC_GSLQ        = 0x0020 | OPC_LWC2,
-    OPC_GSLQC1      = 0x8020 | OPC_LWC2,
-    OPC_GSSHFL      = OPC_LWC2,
-    OPC_GSSQ        = 0x0020 | OPC_SWC2,
-    OPC_GSSQC1      = 0x8020 | OPC_SWC2,
-    OPC_GSSHFS      = OPC_SWC2,
-};
-
-/* Loongson EXT shifted load/store opcodes */
-#define MASK_LOONGSON_GSSHFLS(op)         (MASK_OP_MAJOR(op) | (op & 0xc03f))
-enum {
-    OPC_GSLWLC1     = 0x4 | OPC_GSSHFL,
-    OPC_GSLWRC1     = 0x5 | OPC_GSSHFL,
-    OPC_GSLDLC1     = 0x6 | OPC_GSSHFL,
-    OPC_GSLDRC1     = 0x7 | OPC_GSSHFL,
-    OPC_GSSWLC1     = 0x4 | OPC_GSSHFS,
-    OPC_GSSWRC1     = 0x5 | OPC_GSSHFS,
-    OPC_GSSDLC1     = 0x6 | OPC_GSSHFS,
-    OPC_GSSDRC1     = 0x7 | OPC_GSSHFS,
-};
-
-/* Loongson EXT LDC2/SDC2 opcodes */
-#define MASK_LOONGSON_LSDC2(op)           (MASK_OP_MAJOR(op) | (op & 0x7))
-
-enum {
-    OPC_GSLBX      = 0x0 | OPC_LDC2,
-    OPC_GSLHX      = 0x1 | OPC_LDC2,
-    OPC_GSLWX      = 0x2 | OPC_LDC2,
-    OPC_GSLDX      = 0x3 | OPC_LDC2,
-    OPC_GSLWXC1    = 0x6 | OPC_LDC2,
-    OPC_GSLDXC1    = 0x7 | OPC_LDC2,
-    OPC_GSSBX      = 0x0 | OPC_SDC2,
-    OPC_GSSHX      = 0x1 | OPC_SDC2,
-    OPC_GSSWX      = 0x2 | OPC_SDC2,
-    OPC_GSSDX      = 0x3 | OPC_SDC2,
-    OPC_GSSWXC1    = 0x6 | OPC_SDC2,
-    OPC_GSSDXC1    = 0x7 | OPC_SDC2,
-};
-
 /* BSHFL opcodes */
 #define MASK_BSHFL(op)              (MASK_SPECIAL3(op) | (op & (0x1F << 6)))
 
@@ -4472,602 +4417,6 @@ static void gen_cl(DisasContext *ctx, uint32_t opc,
     }
 }
 
-/* Godson integer instructions */
-static void gen_loongson_integer(DisasContext *ctx, uint32_t opc,
-                                 int rd, int rs, int rt)
-{
-    TCGv t0, t1;
-
-    if (rd == 0) {
-        /* Treat as NOP. */
-        return;
-    }
-
-    switch (opc) {
-    case OPC_MULT_G_2E:
-    case OPC_MULT_G_2F:
-    case OPC_MULTU_G_2E:
-    case OPC_MULTU_G_2F:
-#if defined(TARGET_MIPS64)
-    case OPC_DMULT_G_2E:
-    case OPC_DMULT_G_2F:
-    case OPC_DMULTU_G_2E:
-    case OPC_DMULTU_G_2F:
-#endif
-        t0 = tcg_temp_new();
-        t1 = tcg_temp_new();
-        break;
-    default:
-        t0 = tcg_temp_local_new();
-        t1 = tcg_temp_local_new();
-        break;
-    }
-
-    gen_load_gpr(t0, rs);
-    gen_load_gpr(t1, rt);
-
-    switch (opc) {
-    case OPC_MULT_G_2E:
-    case OPC_MULT_G_2F:
-        tcg_gen_mul_tl(cpu_gpr[rd], t0, t1);
-        tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-        break;
-    case OPC_MULTU_G_2E:
-    case OPC_MULTU_G_2F:
-        tcg_gen_ext32u_tl(t0, t0);
-        tcg_gen_ext32u_tl(t1, t1);
-        tcg_gen_mul_tl(cpu_gpr[rd], t0, t1);
-        tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-        break;
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
-#if defined(TARGET_MIPS64)
-    case OPC_DMULT_G_2E:
-    case OPC_DMULT_G_2F:
-        tcg_gen_mul_tl(cpu_gpr[rd], t0, t1);
-        break;
-    case OPC_DMULTU_G_2E:
-    case OPC_DMULTU_G_2F:
-        tcg_gen_mul_tl(cpu_gpr[rd], t0, t1);
-        break;
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
-#endif
-    }
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-}
-
-static void gen_loongson_lswc2(DisasContext *ctx, int rt,
-                               int rs, int rd)
-{
-    TCGv t0, t1, t2;
-    TCGv_i32 fp0;
-#if defined(TARGET_MIPS64)
-    int lsq_rt1 = ctx->opcode & 0x1f;
-    int lsq_offset = sextract32(ctx->opcode, 6, 9) << 4;
-#endif
-    int shf_offset = sextract32(ctx->opcode, 6, 8);
-
-    t0 = tcg_temp_new();
-
-    switch (MASK_LOONGSON_GSLSQ(ctx->opcode)) {
-#if defined(TARGET_MIPS64)
-    case OPC_GSLQ:
-        t1 = tcg_temp_new();
-        gen_base_offset_addr(ctx, t0, rs, lsq_offset);
-        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TEQ |
-                           ctx->default_tcg_memop_mask);
-        gen_base_offset_addr(ctx, t0, rs, lsq_offset + 8);
-        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ |
-                           ctx->default_tcg_memop_mask);
-        gen_store_gpr(t1, rt);
-        gen_store_gpr(t0, lsq_rt1);
-        tcg_temp_free(t1);
-        break;
-    case OPC_GSLQC1:
-        check_cp1_enabled(ctx);
-        t1 = tcg_temp_new();
-        gen_base_offset_addr(ctx, t0, rs, lsq_offset);
-        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TEQ |
-                           ctx->default_tcg_memop_mask);
-        gen_base_offset_addr(ctx, t0, rs, lsq_offset + 8);
-        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ |
-                           ctx->default_tcg_memop_mask);
-        gen_store_fpr64(ctx, t1, rt);
-        gen_store_fpr64(ctx, t0, lsq_rt1);
-        tcg_temp_free(t1);
-        break;
-    case OPC_GSSQ:
-        t1 = tcg_temp_new();
-        gen_base_offset_addr(ctx, t0, rs, lsq_offset);
-        gen_load_gpr(t1, rt);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEQ |
-                           ctx->default_tcg_memop_mask);
-        gen_base_offset_addr(ctx, t0, rs, lsq_offset + 8);
-        gen_load_gpr(t1, lsq_rt1);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEQ |
-                           ctx->default_tcg_memop_mask);
-        tcg_temp_free(t1);
-        break;
-    case OPC_GSSQC1:
-        check_cp1_enabled(ctx);
-        t1 = tcg_temp_new();
-        gen_base_offset_addr(ctx, t0, rs, lsq_offset);
-        gen_load_fpr64(ctx, t1, rt);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEQ |
-                           ctx->default_tcg_memop_mask);
-        gen_base_offset_addr(ctx, t0, rs, lsq_offset + 8);
-        gen_load_fpr64(ctx, t1, lsq_rt1);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEQ |
-                           ctx->default_tcg_memop_mask);
-        tcg_temp_free(t1);
-        break;
-#endif
-    case OPC_GSSHFL:
-        switch (MASK_LOONGSON_GSSHFLS(ctx->opcode)) {
-        case OPC_GSLWLC1:
-            check_cp1_enabled(ctx);
-            gen_base_offset_addr(ctx, t0, rs, shf_offset);
-            t1 = tcg_temp_new();
-            tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
-            tcg_gen_andi_tl(t1, t0, 3);
-#ifndef TARGET_WORDS_BIGENDIAN
-            tcg_gen_xori_tl(t1, t1, 3);
-#endif
-            tcg_gen_shli_tl(t1, t1, 3);
-            tcg_gen_andi_tl(t0, t0, ~3);
-            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUL);
-            tcg_gen_shl_tl(t0, t0, t1);
-            t2 = tcg_const_tl(-1);
-            tcg_gen_shl_tl(t2, t2, t1);
-            fp0 = tcg_temp_new_i32();
-            gen_load_fpr32(ctx, fp0, rt);
-            tcg_gen_ext_i32_tl(t1, fp0);
-            tcg_gen_andc_tl(t1, t1, t2);
-            tcg_temp_free(t2);
-            tcg_gen_or_tl(t0, t0, t1);
-            tcg_temp_free(t1);
-#if defined(TARGET_MIPS64)
-            tcg_gen_extrl_i64_i32(fp0, t0);
-#else
-            tcg_gen_ext32s_tl(fp0, t0);
-#endif
-            gen_store_fpr32(ctx, fp0, rt);
-            tcg_temp_free_i32(fp0);
-            break;
-        case OPC_GSLWRC1:
-            check_cp1_enabled(ctx);
-            gen_base_offset_addr(ctx, t0, rs, shf_offset);
-            t1 = tcg_temp_new();
-            tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
-            tcg_gen_andi_tl(t1, t0, 3);
-#ifdef TARGET_WORDS_BIGENDIAN
-            tcg_gen_xori_tl(t1, t1, 3);
-#endif
-            tcg_gen_shli_tl(t1, t1, 3);
-            tcg_gen_andi_tl(t0, t0, ~3);
-            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUL);
-            tcg_gen_shr_tl(t0, t0, t1);
-            tcg_gen_xori_tl(t1, t1, 31);
-            t2 = tcg_const_tl(0xfffffffeull);
-            tcg_gen_shl_tl(t2, t2, t1);
-            fp0 = tcg_temp_new_i32();
-            gen_load_fpr32(ctx, fp0, rt);
-            tcg_gen_ext_i32_tl(t1, fp0);
-            tcg_gen_and_tl(t1, t1, t2);
-            tcg_temp_free(t2);
-            tcg_gen_or_tl(t0, t0, t1);
-            tcg_temp_free(t1);
-#if defined(TARGET_MIPS64)
-            tcg_gen_extrl_i64_i32(fp0, t0);
-#else
-            tcg_gen_ext32s_tl(fp0, t0);
-#endif
-            gen_store_fpr32(ctx, fp0, rt);
-            tcg_temp_free_i32(fp0);
-            break;
-#if defined(TARGET_MIPS64)
-        case OPC_GSLDLC1:
-            check_cp1_enabled(ctx);
-            gen_base_offset_addr(ctx, t0, rs, shf_offset);
-            t1 = tcg_temp_new();
-            tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
-            tcg_gen_andi_tl(t1, t0, 7);
-#ifndef TARGET_WORDS_BIGENDIAN
-            tcg_gen_xori_tl(t1, t1, 7);
-#endif
-            tcg_gen_shli_tl(t1, t1, 3);
-            tcg_gen_andi_tl(t0, t0, ~7);
-            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ);
-            tcg_gen_shl_tl(t0, t0, t1);
-            t2 = tcg_const_tl(-1);
-            tcg_gen_shl_tl(t2, t2, t1);
-            gen_load_fpr64(ctx, t1, rt);
-            tcg_gen_andc_tl(t1, t1, t2);
-            tcg_temp_free(t2);
-            tcg_gen_or_tl(t0, t0, t1);
-            tcg_temp_free(t1);
-            gen_store_fpr64(ctx, t0, rt);
-            break;
-        case OPC_GSLDRC1:
-            check_cp1_enabled(ctx);
-            gen_base_offset_addr(ctx, t0, rs, shf_offset);
-            t1 = tcg_temp_new();
-            tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
-            tcg_gen_andi_tl(t1, t0, 7);
-#ifdef TARGET_WORDS_BIGENDIAN
-            tcg_gen_xori_tl(t1, t1, 7);
-#endif
-            tcg_gen_shli_tl(t1, t1, 3);
-            tcg_gen_andi_tl(t0, t0, ~7);
-            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ);
-            tcg_gen_shr_tl(t0, t0, t1);
-            tcg_gen_xori_tl(t1, t1, 63);
-            t2 = tcg_const_tl(0xfffffffffffffffeull);
-            tcg_gen_shl_tl(t2, t2, t1);
-            gen_load_fpr64(ctx, t1, rt);
-            tcg_gen_and_tl(t1, t1, t2);
-            tcg_temp_free(t2);
-            tcg_gen_or_tl(t0, t0, t1);
-            tcg_temp_free(t1);
-            gen_store_fpr64(ctx, t0, rt);
-            break;
-#endif
-        default:
-            MIPS_INVAL("loongson_gsshfl");
-            generate_exception_end(ctx, EXCP_RI);
-            break;
-        }
-        break;
-    case OPC_GSSHFS:
-        switch (MASK_LOONGSON_GSSHFLS(ctx->opcode)) {
-        case OPC_GSSWLC1:
-            check_cp1_enabled(ctx);
-            t1 = tcg_temp_new();
-            gen_base_offset_addr(ctx, t0, rs, shf_offset);
-            fp0 = tcg_temp_new_i32();
-            gen_load_fpr32(ctx, fp0, rt);
-            tcg_gen_ext_i32_tl(t1, fp0);
-            gen_helper_0e2i(swl, t1, t0, ctx->mem_idx);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free(t1);
-            break;
-        case OPC_GSSWRC1:
-            check_cp1_enabled(ctx);
-            t1 = tcg_temp_new();
-            gen_base_offset_addr(ctx, t0, rs, shf_offset);
-            fp0 = tcg_temp_new_i32();
-            gen_load_fpr32(ctx, fp0, rt);
-            tcg_gen_ext_i32_tl(t1, fp0);
-            gen_helper_0e2i(swr, t1, t0, ctx->mem_idx);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free(t1);
-            break;
-#if defined(TARGET_MIPS64)
-        case OPC_GSSDLC1:
-            check_cp1_enabled(ctx);
-            t1 = tcg_temp_new();
-            gen_base_offset_addr(ctx, t0, rs, shf_offset);
-            gen_load_fpr64(ctx, t1, rt);
-            gen_helper_0e2i(sdl, t1, t0, ctx->mem_idx);
-            tcg_temp_free(t1);
-            break;
-        case OPC_GSSDRC1:
-            check_cp1_enabled(ctx);
-            t1 = tcg_temp_new();
-            gen_base_offset_addr(ctx, t0, rs, shf_offset);
-            gen_load_fpr64(ctx, t1, rt);
-            gen_helper_0e2i(sdr, t1, t0, ctx->mem_idx);
-            tcg_temp_free(t1);
-            break;
-#endif
-        default:
-            MIPS_INVAL("loongson_gsshfs");
-            generate_exception_end(ctx, EXCP_RI);
-            break;
-        }
-        break;
-    default:
-        MIPS_INVAL("loongson_gslsq");
-        generate_exception_end(ctx, EXCP_RI);
-        break;
-    }
-    tcg_temp_free(t0);
-}
-
-/* Loongson EXT LDC2/SDC2 */
-static void gen_loongson_lsdc2(DisasContext *ctx, int rt,
-                               int rs, int rd)
-{
-    int offset = sextract32(ctx->opcode, 3, 8);
-    uint32_t opc = MASK_LOONGSON_LSDC2(ctx->opcode);
-    TCGv t0, t1;
-    TCGv_i32 fp0;
-
-    /* Pre-conditions */
-    switch (opc) {
-    case OPC_GSLBX:
-    case OPC_GSLHX:
-    case OPC_GSLWX:
-    case OPC_GSLDX:
-        /* prefetch, implement as NOP */
-        if (rt == 0) {
-            return;
-        }
-        break;
-    case OPC_GSSBX:
-    case OPC_GSSHX:
-    case OPC_GSSWX:
-    case OPC_GSSDX:
-        break;
-    case OPC_GSLWXC1:
-#if defined(TARGET_MIPS64)
-    case OPC_GSLDXC1:
-#endif
-        check_cp1_enabled(ctx);
-        /* prefetch, implement as NOP */
-        if (rt == 0) {
-            return;
-        }
-        break;
-    case OPC_GSSWXC1:
-#if defined(TARGET_MIPS64)
-    case OPC_GSSDXC1:
-#endif
-        check_cp1_enabled(ctx);
-        break;
-    default:
-        MIPS_INVAL("loongson_lsdc2");
-        generate_exception_end(ctx, EXCP_RI);
-        return;
-        break;
-    }
-
-    t0 = tcg_temp_new();
-
-    gen_base_offset_addr(ctx, t0, rs, offset);
-    gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
-
-    switch (opc) {
-    case OPC_GSLBX:
-        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_SB);
-        gen_store_gpr(t0, rt);
-        break;
-    case OPC_GSLHX:
-        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TESW |
-                           ctx->default_tcg_memop_mask);
-        gen_store_gpr(t0, rt);
-        break;
-    case OPC_GSLWX:
-        gen_base_offset_addr(ctx, t0, rs, offset);
-        if (rd) {
-            gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
-        }
-        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TESL |
-                           ctx->default_tcg_memop_mask);
-        gen_store_gpr(t0, rt);
-        break;
-#if defined(TARGET_MIPS64)
-    case OPC_GSLDX:
-        gen_base_offset_addr(ctx, t0, rs, offset);
-        if (rd) {
-            gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
-        }
-        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ |
-                           ctx->default_tcg_memop_mask);
-        gen_store_gpr(t0, rt);
-        break;
-#endif
-    case OPC_GSLWXC1:
-        check_cp1_enabled(ctx);
-        gen_base_offset_addr(ctx, t0, rs, offset);
-        if (rd) {
-            gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
-        }
-        fp0 = tcg_temp_new_i32();
-        tcg_gen_qemu_ld_i32(fp0, t0, ctx->mem_idx, MO_TESL |
-                            ctx->default_tcg_memop_mask);
-        gen_store_fpr32(ctx, fp0, rt);
-        tcg_temp_free_i32(fp0);
-        break;
-#if defined(TARGET_MIPS64)
-    case OPC_GSLDXC1:
-        check_cp1_enabled(ctx);
-        gen_base_offset_addr(ctx, t0, rs, offset);
-        if (rd) {
-            gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
-        }
-        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ |
-                           ctx->default_tcg_memop_mask);
-        gen_store_fpr64(ctx, t0, rt);
-        break;
-#endif
-    case OPC_GSSBX:
-        t1 = tcg_temp_new();
-        gen_load_gpr(t1, rt);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_SB);
-        tcg_temp_free(t1);
-        break;
-    case OPC_GSSHX:
-        t1 = tcg_temp_new();
-        gen_load_gpr(t1, rt);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUW |
-                           ctx->default_tcg_memop_mask);
-        tcg_temp_free(t1);
-        break;
-    case OPC_GSSWX:
-        t1 = tcg_temp_new();
-        gen_load_gpr(t1, rt);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL |
-                           ctx->default_tcg_memop_mask);
-        tcg_temp_free(t1);
-        break;
-#if defined(TARGET_MIPS64)
-    case OPC_GSSDX:
-        t1 = tcg_temp_new();
-        gen_load_gpr(t1, rt);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEQ |
-                           ctx->default_tcg_memop_mask);
-        tcg_temp_free(t1);
-        break;
-#endif
-    case OPC_GSSWXC1:
-        fp0 = tcg_temp_new_i32();
-        gen_load_fpr32(ctx, fp0, rt);
-        tcg_gen_qemu_st_i32(fp0, t0, ctx->mem_idx, MO_TEUL |
-                            ctx->default_tcg_memop_mask);
-        tcg_temp_free_i32(fp0);
-        break;
-#if defined(TARGET_MIPS64)
-    case OPC_GSSDXC1:
-        t1 = tcg_temp_new();
-        gen_load_fpr64(ctx, t1, rt);
-        tcg_gen_qemu_st_i64(t1, t0, ctx->mem_idx, MO_TEQ |
-                            ctx->default_tcg_memop_mask);
-        tcg_temp_free(t1);
-        break;
-#endif
-    default:
-        break;
-    }
-
-    tcg_temp_free(t0);
-}
-
 /* Traps */
 static void gen_trap(DisasContext *ctx, uint32_t opc,
                      int rs, int rt, int16_t imm)
@@ -12458,6 +11807,7 @@ out:
 
 #include "vendor-vr54xx_translate.c.inc"
 #include "vendor-loong-simd_translate.c.inc"
+#include "vendor-loong-ext_translate.c.inc"
 
 static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
 {
diff --git a/target/mips/vendor-loong-ext_translate.c.inc b/target/mips/vendor-loong-ext_translate.c.inc
new file mode 100644
index 00000000000..824a3994d16
--- /dev/null
+++ b/target/mips/vendor-loong-ext_translate.c.inc
@@ -0,0 +1,665 @@
+/*
+ *  Loongson EXTensions translation routines.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *  Copyright (c) 2009 CodeSourcery (MIPS16 and microMIPS support)
+ *  Copyright (c) 2012 Jia Liu & Dongxue Zhang (MIPS ASE DSP support)
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+enum {
+    /* Loongson 2F */
+    OPC_MULT_G_2F   = 0x10 | OPC_SPECIAL2,
+    OPC_DMULT_G_2F  = 0x11 | OPC_SPECIAL2,
+    OPC_MULTU_G_2F  = 0x12 | OPC_SPECIAL2,
+    OPC_DMULTU_G_2F = 0x13 | OPC_SPECIAL2,
+    OPC_DIV_G_2F    = 0x14 | OPC_SPECIAL2,
+    OPC_DDIV_G_2F   = 0x15 | OPC_SPECIAL2,
+    OPC_DIVU_G_2F   = 0x16 | OPC_SPECIAL2,
+    OPC_DDIVU_G_2F  = 0x17 | OPC_SPECIAL2,
+    OPC_MOD_G_2F    = 0x1c | OPC_SPECIAL2,
+    OPC_DMOD_G_2F   = 0x1d | OPC_SPECIAL2,
+    OPC_MODU_G_2F   = 0x1e | OPC_SPECIAL2,
+    OPC_DMODU_G_2F  = 0x1f | OPC_SPECIAL2,
+};
+
+/* Loongson EXT load/store quad word opcodes */
+#define MASK_LOONGSON_GSLSQ(op)           (MASK_OP_MAJOR(op) | (op & 0x8020))
+enum {
+    OPC_GSLQ        = 0x0020 | OPC_LWC2,
+    OPC_GSLQC1      = 0x8020 | OPC_LWC2,
+    OPC_GSSHFL      = OPC_LWC2,
+    OPC_GSSQ        = 0x0020 | OPC_SWC2,
+    OPC_GSSQC1      = 0x8020 | OPC_SWC2,
+    OPC_GSSHFS      = OPC_SWC2,
+};
+
+/* Loongson EXT shifted load/store opcodes */
+#define MASK_LOONGSON_GSSHFLS(op)         (MASK_OP_MAJOR(op) | (op & 0xc03f))
+enum {
+    OPC_GSLWLC1     = 0x4 | OPC_GSSHFL,
+    OPC_GSLWRC1     = 0x5 | OPC_GSSHFL,
+    OPC_GSLDLC1     = 0x6 | OPC_GSSHFL,
+    OPC_GSLDRC1     = 0x7 | OPC_GSSHFL,
+    OPC_GSSWLC1     = 0x4 | OPC_GSSHFS,
+    OPC_GSSWRC1     = 0x5 | OPC_GSSHFS,
+    OPC_GSSDLC1     = 0x6 | OPC_GSSHFS,
+    OPC_GSSDRC1     = 0x7 | OPC_GSSHFS,
+};
+
+/* Loongson EXT LDC2/SDC2 opcodes */
+#define MASK_LOONGSON_LSDC2(op)           (MASK_OP_MAJOR(op) | (op & 0x7))
+
+enum {
+    OPC_GSLBX      = 0x0 | OPC_LDC2,
+    OPC_GSLHX      = 0x1 | OPC_LDC2,
+    OPC_GSLWX      = 0x2 | OPC_LDC2,
+    OPC_GSLDX      = 0x3 | OPC_LDC2,
+    OPC_GSLWXC1    = 0x6 | OPC_LDC2,
+    OPC_GSLDXC1    = 0x7 | OPC_LDC2,
+    OPC_GSSBX      = 0x0 | OPC_SDC2,
+    OPC_GSSHX      = 0x1 | OPC_SDC2,
+    OPC_GSSWX      = 0x2 | OPC_SDC2,
+    OPC_GSSDX      = 0x3 | OPC_SDC2,
+    OPC_GSSWXC1    = 0x6 | OPC_SDC2,
+    OPC_GSSDXC1    = 0x7 | OPC_SDC2,
+};
+
+/* Godson integer instructions */
+static void gen_loongson_integer(DisasContext *ctx, uint32_t opc,
+                                 int rd, int rs, int rt)
+{
+    TCGv t0, t1;
+
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return;
+    }
+
+    switch (opc) {
+    case OPC_MULT_G_2E:
+    case OPC_MULT_G_2F:
+    case OPC_MULTU_G_2E:
+    case OPC_MULTU_G_2F:
+#if defined(TARGET_MIPS64)
+    case OPC_DMULT_G_2E:
+    case OPC_DMULT_G_2F:
+    case OPC_DMULTU_G_2E:
+    case OPC_DMULTU_G_2F:
+#endif
+        t0 = tcg_temp_new();
+        t1 = tcg_temp_new();
+        break;
+    default:
+        t0 = tcg_temp_local_new();
+        t1 = tcg_temp_local_new();
+        break;
+    }
+
+    gen_load_gpr(t0, rs);
+    gen_load_gpr(t1, rt);
+
+    switch (opc) {
+    case OPC_MULT_G_2E:
+    case OPC_MULT_G_2F:
+        tcg_gen_mul_tl(cpu_gpr[rd], t0, t1);
+        tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+        break;
+    case OPC_MULTU_G_2E:
+    case OPC_MULTU_G_2F:
+        tcg_gen_ext32u_tl(t0, t0);
+        tcg_gen_ext32u_tl(t1, t1);
+        tcg_gen_mul_tl(cpu_gpr[rd], t0, t1);
+        tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+        break;
+    case OPC_DIV_G_2E:
+    case OPC_DIV_G_2F:
+        {
+            TCGLabel *l1 = gen_new_label();
+            TCGLabel *l2 = gen_new_label();
+            TCGLabel *l3 = gen_new_label();
+            tcg_gen_ext32s_tl(t0, t0);
+            tcg_gen_ext32s_tl(t1, t1);
+            tcg_gen_brcondi_tl(TCG_COND_NE, t1, 0, l1);
+            tcg_gen_movi_tl(cpu_gpr[rd], 0);
+            tcg_gen_br(l3);
+            gen_set_label(l1);
+            tcg_gen_brcondi_tl(TCG_COND_NE, t0, INT_MIN, l2);
+            tcg_gen_brcondi_tl(TCG_COND_NE, t1, -1, l2);
+            tcg_gen_mov_tl(cpu_gpr[rd], t0);
+            tcg_gen_br(l3);
+            gen_set_label(l2);
+            tcg_gen_div_tl(cpu_gpr[rd], t0, t1);
+            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+            gen_set_label(l3);
+        }
+        break;
+    case OPC_DIVU_G_2E:
+    case OPC_DIVU_G_2F:
+        {
+            TCGLabel *l1 = gen_new_label();
+            TCGLabel *l2 = gen_new_label();
+            tcg_gen_ext32u_tl(t0, t0);
+            tcg_gen_ext32u_tl(t1, t1);
+            tcg_gen_brcondi_tl(TCG_COND_NE, t1, 0, l1);
+            tcg_gen_movi_tl(cpu_gpr[rd], 0);
+            tcg_gen_br(l2);
+            gen_set_label(l1);
+            tcg_gen_divu_tl(cpu_gpr[rd], t0, t1);
+            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+            gen_set_label(l2);
+        }
+        break;
+    case OPC_MOD_G_2E:
+    case OPC_MOD_G_2F:
+        {
+            TCGLabel *l1 = gen_new_label();
+            TCGLabel *l2 = gen_new_label();
+            TCGLabel *l3 = gen_new_label();
+            tcg_gen_ext32u_tl(t0, t0);
+            tcg_gen_ext32u_tl(t1, t1);
+            tcg_gen_brcondi_tl(TCG_COND_EQ, t1, 0, l1);
+            tcg_gen_brcondi_tl(TCG_COND_NE, t0, INT_MIN, l2);
+            tcg_gen_brcondi_tl(TCG_COND_NE, t1, -1, l2);
+            gen_set_label(l1);
+            tcg_gen_movi_tl(cpu_gpr[rd], 0);
+            tcg_gen_br(l3);
+            gen_set_label(l2);
+            tcg_gen_rem_tl(cpu_gpr[rd], t0, t1);
+            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+            gen_set_label(l3);
+        }
+        break;
+    case OPC_MODU_G_2E:
+    case OPC_MODU_G_2F:
+        {
+            TCGLabel *l1 = gen_new_label();
+            TCGLabel *l2 = gen_new_label();
+            tcg_gen_ext32u_tl(t0, t0);
+            tcg_gen_ext32u_tl(t1, t1);
+            tcg_gen_brcondi_tl(TCG_COND_NE, t1, 0, l1);
+            tcg_gen_movi_tl(cpu_gpr[rd], 0);
+            tcg_gen_br(l2);
+            gen_set_label(l1);
+            tcg_gen_remu_tl(cpu_gpr[rd], t0, t1);
+            tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+            gen_set_label(l2);
+        }
+        break;
+#if defined(TARGET_MIPS64)
+    case OPC_DMULT_G_2E:
+    case OPC_DMULT_G_2F:
+        tcg_gen_mul_tl(cpu_gpr[rd], t0, t1);
+        break;
+    case OPC_DMULTU_G_2E:
+    case OPC_DMULTU_G_2F:
+        tcg_gen_mul_tl(cpu_gpr[rd], t0, t1);
+        break;
+    case OPC_DDIV_G_2E:
+    case OPC_DDIV_G_2F:
+        {
+            TCGLabel *l1 = gen_new_label();
+            TCGLabel *l2 = gen_new_label();
+            TCGLabel *l3 = gen_new_label();
+            tcg_gen_brcondi_tl(TCG_COND_NE, t1, 0, l1);
+            tcg_gen_movi_tl(cpu_gpr[rd], 0);
+            tcg_gen_br(l3);
+            gen_set_label(l1);
+            tcg_gen_brcondi_tl(TCG_COND_NE, t0, -1LL << 63, l2);
+            tcg_gen_brcondi_tl(TCG_COND_NE, t1, -1LL, l2);
+            tcg_gen_mov_tl(cpu_gpr[rd], t0);
+            tcg_gen_br(l3);
+            gen_set_label(l2);
+            tcg_gen_div_tl(cpu_gpr[rd], t0, t1);
+            gen_set_label(l3);
+        }
+        break;
+    case OPC_DDIVU_G_2E:
+    case OPC_DDIVU_G_2F:
+        {
+            TCGLabel *l1 = gen_new_label();
+            TCGLabel *l2 = gen_new_label();
+            tcg_gen_brcondi_tl(TCG_COND_NE, t1, 0, l1);
+            tcg_gen_movi_tl(cpu_gpr[rd], 0);
+            tcg_gen_br(l2);
+            gen_set_label(l1);
+            tcg_gen_divu_tl(cpu_gpr[rd], t0, t1);
+            gen_set_label(l2);
+        }
+        break;
+    case OPC_DMOD_G_2E:
+    case OPC_DMOD_G_2F:
+        {
+            TCGLabel *l1 = gen_new_label();
+            TCGLabel *l2 = gen_new_label();
+            TCGLabel *l3 = gen_new_label();
+            tcg_gen_brcondi_tl(TCG_COND_EQ, t1, 0, l1);
+            tcg_gen_brcondi_tl(TCG_COND_NE, t0, -1LL << 63, l2);
+            tcg_gen_brcondi_tl(TCG_COND_NE, t1, -1LL, l2);
+            gen_set_label(l1);
+            tcg_gen_movi_tl(cpu_gpr[rd], 0);
+            tcg_gen_br(l3);
+            gen_set_label(l2);
+            tcg_gen_rem_tl(cpu_gpr[rd], t0, t1);
+            gen_set_label(l3);
+        }
+        break;
+    case OPC_DMODU_G_2E:
+    case OPC_DMODU_G_2F:
+        {
+            TCGLabel *l1 = gen_new_label();
+            TCGLabel *l2 = gen_new_label();
+            tcg_gen_brcondi_tl(TCG_COND_NE, t1, 0, l1);
+            tcg_gen_movi_tl(cpu_gpr[rd], 0);
+            tcg_gen_br(l2);
+            gen_set_label(l1);
+            tcg_gen_remu_tl(cpu_gpr[rd], t0, t1);
+            gen_set_label(l2);
+        }
+        break;
+#endif
+    }
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+
+static void gen_loongson_lswc2(DisasContext *ctx, int rt,
+                               int rs, int rd)
+{
+    TCGv t0, t1, t2;
+    TCGv_i32 fp0;
+#if defined(TARGET_MIPS64)
+    int lsq_rt1 = ctx->opcode & 0x1f;
+    int lsq_offset = sextract32(ctx->opcode, 6, 9) << 4;
+#endif
+    int shf_offset = sextract32(ctx->opcode, 6, 8);
+
+    t0 = tcg_temp_new();
+
+    switch (MASK_LOONGSON_GSLSQ(ctx->opcode)) {
+#if defined(TARGET_MIPS64)
+    case OPC_GSLQ:
+        t1 = tcg_temp_new();
+        gen_base_offset_addr(ctx, t0, rs, lsq_offset);
+        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TEQ |
+                           ctx->default_tcg_memop_mask);
+        gen_base_offset_addr(ctx, t0, rs, lsq_offset + 8);
+        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ |
+                           ctx->default_tcg_memop_mask);
+        gen_store_gpr(t1, rt);
+        gen_store_gpr(t0, lsq_rt1);
+        tcg_temp_free(t1);
+        break;
+    case OPC_GSLQC1:
+        check_cp1_enabled(ctx);
+        t1 = tcg_temp_new();
+        gen_base_offset_addr(ctx, t0, rs, lsq_offset);
+        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TEQ |
+                           ctx->default_tcg_memop_mask);
+        gen_base_offset_addr(ctx, t0, rs, lsq_offset + 8);
+        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ |
+                           ctx->default_tcg_memop_mask);
+        gen_store_fpr64(ctx, t1, rt);
+        gen_store_fpr64(ctx, t0, lsq_rt1);
+        tcg_temp_free(t1);
+        break;
+    case OPC_GSSQ:
+        t1 = tcg_temp_new();
+        gen_base_offset_addr(ctx, t0, rs, lsq_offset);
+        gen_load_gpr(t1, rt);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEQ |
+                           ctx->default_tcg_memop_mask);
+        gen_base_offset_addr(ctx, t0, rs, lsq_offset + 8);
+        gen_load_gpr(t1, lsq_rt1);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEQ |
+                           ctx->default_tcg_memop_mask);
+        tcg_temp_free(t1);
+        break;
+    case OPC_GSSQC1:
+        check_cp1_enabled(ctx);
+        t1 = tcg_temp_new();
+        gen_base_offset_addr(ctx, t0, rs, lsq_offset);
+        gen_load_fpr64(ctx, t1, rt);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEQ |
+                           ctx->default_tcg_memop_mask);
+        gen_base_offset_addr(ctx, t0, rs, lsq_offset + 8);
+        gen_load_fpr64(ctx, t1, lsq_rt1);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEQ |
+                           ctx->default_tcg_memop_mask);
+        tcg_temp_free(t1);
+        break;
+#endif
+    case OPC_GSSHFL:
+        switch (MASK_LOONGSON_GSSHFLS(ctx->opcode)) {
+        case OPC_GSLWLC1:
+            check_cp1_enabled(ctx);
+            gen_base_offset_addr(ctx, t0, rs, shf_offset);
+            t1 = tcg_temp_new();
+            tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
+            tcg_gen_andi_tl(t1, t0, 3);
+#ifndef TARGET_WORDS_BIGENDIAN
+            tcg_gen_xori_tl(t1, t1, 3);
+#endif
+            tcg_gen_shli_tl(t1, t1, 3);
+            tcg_gen_andi_tl(t0, t0, ~3);
+            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUL);
+            tcg_gen_shl_tl(t0, t0, t1);
+            t2 = tcg_const_tl(-1);
+            tcg_gen_shl_tl(t2, t2, t1);
+            fp0 = tcg_temp_new_i32();
+            gen_load_fpr32(ctx, fp0, rt);
+            tcg_gen_ext_i32_tl(t1, fp0);
+            tcg_gen_andc_tl(t1, t1, t2);
+            tcg_temp_free(t2);
+            tcg_gen_or_tl(t0, t0, t1);
+            tcg_temp_free(t1);
+#if defined(TARGET_MIPS64)
+            tcg_gen_extrl_i64_i32(fp0, t0);
+#else
+            tcg_gen_ext32s_tl(fp0, t0);
+#endif
+            gen_store_fpr32(ctx, fp0, rt);
+            tcg_temp_free_i32(fp0);
+            break;
+        case OPC_GSLWRC1:
+            check_cp1_enabled(ctx);
+            gen_base_offset_addr(ctx, t0, rs, shf_offset);
+            t1 = tcg_temp_new();
+            tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
+            tcg_gen_andi_tl(t1, t0, 3);
+#ifdef TARGET_WORDS_BIGENDIAN
+            tcg_gen_xori_tl(t1, t1, 3);
+#endif
+            tcg_gen_shli_tl(t1, t1, 3);
+            tcg_gen_andi_tl(t0, t0, ~3);
+            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUL);
+            tcg_gen_shr_tl(t0, t0, t1);
+            tcg_gen_xori_tl(t1, t1, 31);
+            t2 = tcg_const_tl(0xfffffffeull);
+            tcg_gen_shl_tl(t2, t2, t1);
+            fp0 = tcg_temp_new_i32();
+            gen_load_fpr32(ctx, fp0, rt);
+            tcg_gen_ext_i32_tl(t1, fp0);
+            tcg_gen_and_tl(t1, t1, t2);
+            tcg_temp_free(t2);
+            tcg_gen_or_tl(t0, t0, t1);
+            tcg_temp_free(t1);
+#if defined(TARGET_MIPS64)
+            tcg_gen_extrl_i64_i32(fp0, t0);
+#else
+            tcg_gen_ext32s_tl(fp0, t0);
+#endif
+            gen_store_fpr32(ctx, fp0, rt);
+            tcg_temp_free_i32(fp0);
+            break;
+#if defined(TARGET_MIPS64)
+        case OPC_GSLDLC1:
+            check_cp1_enabled(ctx);
+            gen_base_offset_addr(ctx, t0, rs, shf_offset);
+            t1 = tcg_temp_new();
+            tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
+            tcg_gen_andi_tl(t1, t0, 7);
+#ifndef TARGET_WORDS_BIGENDIAN
+            tcg_gen_xori_tl(t1, t1, 7);
+#endif
+            tcg_gen_shli_tl(t1, t1, 3);
+            tcg_gen_andi_tl(t0, t0, ~7);
+            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ);
+            tcg_gen_shl_tl(t0, t0, t1);
+            t2 = tcg_const_tl(-1);
+            tcg_gen_shl_tl(t2, t2, t1);
+            gen_load_fpr64(ctx, t1, rt);
+            tcg_gen_andc_tl(t1, t1, t2);
+            tcg_temp_free(t2);
+            tcg_gen_or_tl(t0, t0, t1);
+            tcg_temp_free(t1);
+            gen_store_fpr64(ctx, t0, rt);
+            break;
+        case OPC_GSLDRC1:
+            check_cp1_enabled(ctx);
+            gen_base_offset_addr(ctx, t0, rs, shf_offset);
+            t1 = tcg_temp_new();
+            tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
+            tcg_gen_andi_tl(t1, t0, 7);
+#ifdef TARGET_WORDS_BIGENDIAN
+            tcg_gen_xori_tl(t1, t1, 7);
+#endif
+            tcg_gen_shli_tl(t1, t1, 3);
+            tcg_gen_andi_tl(t0, t0, ~7);
+            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ);
+            tcg_gen_shr_tl(t0, t0, t1);
+            tcg_gen_xori_tl(t1, t1, 63);
+            t2 = tcg_const_tl(0xfffffffffffffffeull);
+            tcg_gen_shl_tl(t2, t2, t1);
+            gen_load_fpr64(ctx, t1, rt);
+            tcg_gen_and_tl(t1, t1, t2);
+            tcg_temp_free(t2);
+            tcg_gen_or_tl(t0, t0, t1);
+            tcg_temp_free(t1);
+            gen_store_fpr64(ctx, t0, rt);
+            break;
+#endif
+        default:
+            MIPS_INVAL("loongson_gsshfl");
+            generate_exception_end(ctx, EXCP_RI);
+            break;
+        }
+        break;
+    case OPC_GSSHFS:
+        switch (MASK_LOONGSON_GSSHFLS(ctx->opcode)) {
+        case OPC_GSSWLC1:
+            check_cp1_enabled(ctx);
+            t1 = tcg_temp_new();
+            gen_base_offset_addr(ctx, t0, rs, shf_offset);
+            fp0 = tcg_temp_new_i32();
+            gen_load_fpr32(ctx, fp0, rt);
+            tcg_gen_ext_i32_tl(t1, fp0);
+            gen_helper_0e2i(swl, t1, t0, ctx->mem_idx);
+            tcg_temp_free_i32(fp0);
+            tcg_temp_free(t1);
+            break;
+        case OPC_GSSWRC1:
+            check_cp1_enabled(ctx);
+            t1 = tcg_temp_new();
+            gen_base_offset_addr(ctx, t0, rs, shf_offset);
+            fp0 = tcg_temp_new_i32();
+            gen_load_fpr32(ctx, fp0, rt);
+            tcg_gen_ext_i32_tl(t1, fp0);
+            gen_helper_0e2i(swr, t1, t0, ctx->mem_idx);
+            tcg_temp_free_i32(fp0);
+            tcg_temp_free(t1);
+            break;
+#if defined(TARGET_MIPS64)
+        case OPC_GSSDLC1:
+            check_cp1_enabled(ctx);
+            t1 = tcg_temp_new();
+            gen_base_offset_addr(ctx, t0, rs, shf_offset);
+            gen_load_fpr64(ctx, t1, rt);
+            gen_helper_0e2i(sdl, t1, t0, ctx->mem_idx);
+            tcg_temp_free(t1);
+            break;
+        case OPC_GSSDRC1:
+            check_cp1_enabled(ctx);
+            t1 = tcg_temp_new();
+            gen_base_offset_addr(ctx, t0, rs, shf_offset);
+            gen_load_fpr64(ctx, t1, rt);
+            gen_helper_0e2i(sdr, t1, t0, ctx->mem_idx);
+            tcg_temp_free(t1);
+            break;
+#endif
+        default:
+            MIPS_INVAL("loongson_gsshfs");
+            generate_exception_end(ctx, EXCP_RI);
+            break;
+        }
+        break;
+    default:
+        MIPS_INVAL("loongson_gslsq");
+        generate_exception_end(ctx, EXCP_RI);
+        break;
+    }
+    tcg_temp_free(t0);
+}
+
+/* Loongson EXT LDC2/SDC2 */
+static void gen_loongson_lsdc2(DisasContext *ctx, int rt,
+                               int rs, int rd)
+{
+    int offset = sextract32(ctx->opcode, 3, 8);
+    uint32_t opc = MASK_LOONGSON_LSDC2(ctx->opcode);
+    TCGv t0, t1;
+    TCGv_i32 fp0;
+
+    /* Pre-conditions */
+    switch (opc) {
+    case OPC_GSLBX:
+    case OPC_GSLHX:
+    case OPC_GSLWX:
+    case OPC_GSLDX:
+        /* prefetch, implement as NOP */
+        if (rt == 0) {
+            return;
+        }
+        break;
+    case OPC_GSSBX:
+    case OPC_GSSHX:
+    case OPC_GSSWX:
+    case OPC_GSSDX:
+        break;
+    case OPC_GSLWXC1:
+#if defined(TARGET_MIPS64)
+    case OPC_GSLDXC1:
+#endif
+        check_cp1_enabled(ctx);
+        /* prefetch, implement as NOP */
+        if (rt == 0) {
+            return;
+        }
+        break;
+    case OPC_GSSWXC1:
+#if defined(TARGET_MIPS64)
+    case OPC_GSSDXC1:
+#endif
+        check_cp1_enabled(ctx);
+        break;
+    default:
+        MIPS_INVAL("loongson_lsdc2");
+        generate_exception_end(ctx, EXCP_RI);
+        return;
+        break;
+    }
+
+    t0 = tcg_temp_new();
+
+    gen_base_offset_addr(ctx, t0, rs, offset);
+    gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
+
+    switch (opc) {
+    case OPC_GSLBX:
+        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_SB);
+        gen_store_gpr(t0, rt);
+        break;
+    case OPC_GSLHX:
+        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TESW |
+                           ctx->default_tcg_memop_mask);
+        gen_store_gpr(t0, rt);
+        break;
+    case OPC_GSLWX:
+        gen_base_offset_addr(ctx, t0, rs, offset);
+        if (rd) {
+            gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
+        }
+        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TESL |
+                           ctx->default_tcg_memop_mask);
+        gen_store_gpr(t0, rt);
+        break;
+#if defined(TARGET_MIPS64)
+    case OPC_GSLDX:
+        gen_base_offset_addr(ctx, t0, rs, offset);
+        if (rd) {
+            gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
+        }
+        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ |
+                           ctx->default_tcg_memop_mask);
+        gen_store_gpr(t0, rt);
+        break;
+#endif
+    case OPC_GSLWXC1:
+        check_cp1_enabled(ctx);
+        gen_base_offset_addr(ctx, t0, rs, offset);
+        if (rd) {
+            gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
+        }
+        fp0 = tcg_temp_new_i32();
+        tcg_gen_qemu_ld_i32(fp0, t0, ctx->mem_idx, MO_TESL |
+                            ctx->default_tcg_memop_mask);
+        gen_store_fpr32(ctx, fp0, rt);
+        tcg_temp_free_i32(fp0);
+        break;
+#if defined(TARGET_MIPS64)
+    case OPC_GSLDXC1:
+        check_cp1_enabled(ctx);
+        gen_base_offset_addr(ctx, t0, rs, offset);
+        if (rd) {
+            gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
+        }
+        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ |
+                           ctx->default_tcg_memop_mask);
+        gen_store_fpr64(ctx, t0, rt);
+        break;
+#endif
+    case OPC_GSSBX:
+        t1 = tcg_temp_new();
+        gen_load_gpr(t1, rt);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_SB);
+        tcg_temp_free(t1);
+        break;
+    case OPC_GSSHX:
+        t1 = tcg_temp_new();
+        gen_load_gpr(t1, rt);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUW |
+                           ctx->default_tcg_memop_mask);
+        tcg_temp_free(t1);
+        break;
+    case OPC_GSSWX:
+        t1 = tcg_temp_new();
+        gen_load_gpr(t1, rt);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL |
+                           ctx->default_tcg_memop_mask);
+        tcg_temp_free(t1);
+        break;
+#if defined(TARGET_MIPS64)
+    case OPC_GSSDX:
+        t1 = tcg_temp_new();
+        gen_load_gpr(t1, rt);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEQ |
+                           ctx->default_tcg_memop_mask);
+        tcg_temp_free(t1);
+        break;
+#endif
+    case OPC_GSSWXC1:
+        fp0 = tcg_temp_new_i32();
+        gen_load_fpr32(ctx, fp0, rt);
+        tcg_gen_qemu_st_i32(fp0, t0, ctx->mem_idx, MO_TEUL |
+                            ctx->default_tcg_memop_mask);
+        tcg_temp_free_i32(fp0);
+        break;
+#if defined(TARGET_MIPS64)
+    case OPC_GSSDXC1:
+        t1 = tcg_temp_new();
+        gen_load_fpr64(ctx, t1, rt);
+        tcg_gen_qemu_st_i64(t1, t0, ctx->mem_idx, MO_TEQ |
+                            ctx->default_tcg_memop_mask);
+        tcg_temp_free(t1);
+        break;
+#endif
+    default:
+        break;
+    }
+
+    tcg_temp_free(t0);
+}
-- 
2.26.2



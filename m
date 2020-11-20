Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9912BB860
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 22:35:55 +0100 (CET)
Received: from localhost ([::1]:41236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgE4Q-00030e-8O
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 16:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDfn-0004Lw-H6
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:10:28 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDfk-0004HE-9y
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:10:27 -0500
Received: by mail-wm1-x329.google.com with SMTP id d142so11859113wmd.4
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KfAp08XE0D2s8Fjwe59WUfdrK7InEGIvBOoZZbDUm/0=;
 b=WOddeF5891lhkwUQdyXB7EIkLhRCqhXisRaEPwURomX3TyMt+azAYpXiE0q7SJeaRX
 YHTHnJw/wK19Zz0d6rVMThFwGocVCT7FnlrLry5jApDPiIgb1STOR0nqSl3h6OVskH/4
 CFROJZwrLhjRNp4xJ5JrSBa4VtyA0P2jN8t5vdzyTHy7KzK5+xXW8o8iCaU9wpuRGy2R
 XEqJfK11STOVO2GrlfKt2fOBu8swQdq6jECM8MSKCuw+Nisu2j72KiSZCVIx7K8sH+y6
 qqB4lZYcWVjaYHUe6xcyOXKpZ0s2PMOgcXG3r4MAapNBiGLUbDGFecobK2lN2SSycfSA
 ufbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KfAp08XE0D2s8Fjwe59WUfdrK7InEGIvBOoZZbDUm/0=;
 b=QuDCQ4HZyD5yQ2ncZOPky1d+OLDmiiaYM828y6a2YfJsua0bwmfkcYw6FtSjtHSv9A
 kiOxfsANcreXMkXH1Pbg0xXhug0NUyIWjpSRNI62qfCB/5SD22hzpPEAz+b7FU86igjH
 ltook9L9Tt337gzri0y07ecTGLW48ZBLweDAK8IrpeGwsqtpU7pHpGxPePnrbfiub07a
 DvlLBPUBYd+MteAbGTEzcHFaQd9rQbVebAcTvRM1FwFtZJ3R+srIvrrwyfgcUAmBI5TU
 HR/xmE5or2/1sgCMZKSqMs5HJpJkJSSpLRN7DRUt1dA+5e0yxxrLtFF1cKKTSF9rp0NW
 NeWQ==
X-Gm-Message-State: AOAM531wOrvTg0merixZXpkbFbD7kKx8acKagVz/F6L0zOIzRKtyJZCY
 eVWl/XAvKIQY9Q6AHkQElYetqsyjktM=
X-Google-Smtp-Source: ABdhPJy6UB6VIvI1hU8iZ8g7/vcp7+5px1D6ABX7IOF7EUmpu0ba8XUHSkP/gY+dkZabyiM2lRVuvA==
X-Received: by 2002:a1c:9ec9:: with SMTP id h192mr11859866wme.8.1605906621631; 
 Fri, 20 Nov 2020 13:10:21 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id a9sm6177162wrp.21.2020.11.20.13.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 13:10:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/26] target/mips: Extract Loongson SIMD translation routines
Date: Fri, 20 Nov 2020 22:08:36 +0100
Message-Id: <20201120210844.2625602-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120210844.2625602-1-f4bug@amsat.org>
References: <20201120210844.2625602-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

LoongSIMD (formerly LoongMMI in Loongson 2E/F) is the
128-bit SIMD extension from the LoongISA.

Extract 600 lines of translation routines to
'vendor-loong-simd_translate.c.inc'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c                       | 598 +----------------
 target/mips/vendor-loong-simd_translate.c.inc | 611 ++++++++++++++++++
 2 files changed, 612 insertions(+), 597 deletions(-)
 create mode 100644 target/mips/vendor-loong-simd_translate.c.inc

diff --git a/target/mips/translate.c b/target/mips/translate.c
index b01a16e9da4..105a104bb0c 100644
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
@@ -4569,590 +4556,6 @@ static void gen_cl(DisasContext *ctx, uint32_t opc,
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
-/* Loongson multimedia instructions */
-static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
-{
-    uint32_t opc, shift_max;
-    TCGv_i64 t0, t1;
-    TCGCond cond;
-
-    opc = MASK_LMMI(ctx->opcode);
-    switch (opc) {
-    case OPC_ADD_CP2:
-    case OPC_SUB_CP2:
-    case OPC_DADD_CP2:
-    case OPC_DSUB_CP2:
-        t0 = tcg_temp_local_new_i64();
-        t1 = tcg_temp_local_new_i64();
-        break;
-    default:
-        t0 = tcg_temp_new_i64();
-        t1 = tcg_temp_new_i64();
-        break;
-    }
-
-    check_cp1_enabled(ctx);
-    gen_load_fpr64(ctx, t0, rs);
-    gen_load_fpr64(ctx, t1, rt);
-
-    switch (opc) {
-    case OPC_PADDSH:
-        gen_helper_paddsh(t0, t0, t1);
-        break;
-    case OPC_PADDUSH:
-        gen_helper_paddush(t0, t0, t1);
-        break;
-    case OPC_PADDH:
-        gen_helper_paddh(t0, t0, t1);
-        break;
-    case OPC_PADDW:
-        gen_helper_paddw(t0, t0, t1);
-        break;
-    case OPC_PADDSB:
-        gen_helper_paddsb(t0, t0, t1);
-        break;
-    case OPC_PADDUSB:
-        gen_helper_paddusb(t0, t0, t1);
-        break;
-    case OPC_PADDB:
-        gen_helper_paddb(t0, t0, t1);
-        break;
-
-    case OPC_PSUBSH:
-        gen_helper_psubsh(t0, t0, t1);
-        break;
-    case OPC_PSUBUSH:
-        gen_helper_psubush(t0, t0, t1);
-        break;
-    case OPC_PSUBH:
-        gen_helper_psubh(t0, t0, t1);
-        break;
-    case OPC_PSUBW:
-        gen_helper_psubw(t0, t0, t1);
-        break;
-    case OPC_PSUBSB:
-        gen_helper_psubsb(t0, t0, t1);
-        break;
-    case OPC_PSUBUSB:
-        gen_helper_psubusb(t0, t0, t1);
-        break;
-    case OPC_PSUBB:
-        gen_helper_psubb(t0, t0, t1);
-        break;
-
-    case OPC_PSHUFH:
-        gen_helper_pshufh(t0, t0, t1);
-        break;
-    case OPC_PACKSSWH:
-        gen_helper_packsswh(t0, t0, t1);
-        break;
-    case OPC_PACKSSHB:
-        gen_helper_packsshb(t0, t0, t1);
-        break;
-    case OPC_PACKUSHB:
-        gen_helper_packushb(t0, t0, t1);
-        break;
-
-    case OPC_PUNPCKLHW:
-        gen_helper_punpcklhw(t0, t0, t1);
-        break;
-    case OPC_PUNPCKHHW:
-        gen_helper_punpckhhw(t0, t0, t1);
-        break;
-    case OPC_PUNPCKLBH:
-        gen_helper_punpcklbh(t0, t0, t1);
-        break;
-    case OPC_PUNPCKHBH:
-        gen_helper_punpckhbh(t0, t0, t1);
-        break;
-    case OPC_PUNPCKLWD:
-        gen_helper_punpcklwd(t0, t0, t1);
-        break;
-    case OPC_PUNPCKHWD:
-        gen_helper_punpckhwd(t0, t0, t1);
-        break;
-
-    case OPC_PAVGH:
-        gen_helper_pavgh(t0, t0, t1);
-        break;
-    case OPC_PAVGB:
-        gen_helper_pavgb(t0, t0, t1);
-        break;
-    case OPC_PMAXSH:
-        gen_helper_pmaxsh(t0, t0, t1);
-        break;
-    case OPC_PMINSH:
-        gen_helper_pminsh(t0, t0, t1);
-        break;
-    case OPC_PMAXUB:
-        gen_helper_pmaxub(t0, t0, t1);
-        break;
-    case OPC_PMINUB:
-        gen_helper_pminub(t0, t0, t1);
-        break;
-
-    case OPC_PCMPEQW:
-        gen_helper_pcmpeqw(t0, t0, t1);
-        break;
-    case OPC_PCMPGTW:
-        gen_helper_pcmpgtw(t0, t0, t1);
-        break;
-    case OPC_PCMPEQH:
-        gen_helper_pcmpeqh(t0, t0, t1);
-        break;
-    case OPC_PCMPGTH:
-        gen_helper_pcmpgth(t0, t0, t1);
-        break;
-    case OPC_PCMPEQB:
-        gen_helper_pcmpeqb(t0, t0, t1);
-        break;
-    case OPC_PCMPGTB:
-        gen_helper_pcmpgtb(t0, t0, t1);
-        break;
-
-    case OPC_PSLLW:
-        gen_helper_psllw(t0, t0, t1);
-        break;
-    case OPC_PSLLH:
-        gen_helper_psllh(t0, t0, t1);
-        break;
-    case OPC_PSRLW:
-        gen_helper_psrlw(t0, t0, t1);
-        break;
-    case OPC_PSRLH:
-        gen_helper_psrlh(t0, t0, t1);
-        break;
-    case OPC_PSRAW:
-        gen_helper_psraw(t0, t0, t1);
-        break;
-    case OPC_PSRAH:
-        gen_helper_psrah(t0, t0, t1);
-        break;
-
-    case OPC_PMULLH:
-        gen_helper_pmullh(t0, t0, t1);
-        break;
-    case OPC_PMULHH:
-        gen_helper_pmulhh(t0, t0, t1);
-        break;
-    case OPC_PMULHUH:
-        gen_helper_pmulhuh(t0, t0, t1);
-        break;
-    case OPC_PMADDHW:
-        gen_helper_pmaddhw(t0, t0, t1);
-        break;
-
-    case OPC_PASUBUB:
-        gen_helper_pasubub(t0, t0, t1);
-        break;
-    case OPC_BIADD:
-        gen_helper_biadd(t0, t0);
-        break;
-    case OPC_PMOVMSKB:
-        gen_helper_pmovmskb(t0, t0);
-        break;
-
-    case OPC_PADDD:
-        tcg_gen_add_i64(t0, t0, t1);
-        break;
-    case OPC_PSUBD:
-        tcg_gen_sub_i64(t0, t0, t1);
-        break;
-    case OPC_XOR_CP2:
-        tcg_gen_xor_i64(t0, t0, t1);
-        break;
-    case OPC_NOR_CP2:
-        tcg_gen_nor_i64(t0, t0, t1);
-        break;
-    case OPC_AND_CP2:
-        tcg_gen_and_i64(t0, t0, t1);
-        break;
-    case OPC_OR_CP2:
-        tcg_gen_or_i64(t0, t0, t1);
-        break;
-
-    case OPC_PANDN:
-        tcg_gen_andc_i64(t0, t1, t0);
-        break;
-
-    case OPC_PINSRH_0:
-        tcg_gen_deposit_i64(t0, t0, t1, 0, 16);
-        break;
-    case OPC_PINSRH_1:
-        tcg_gen_deposit_i64(t0, t0, t1, 16, 16);
-        break;
-    case OPC_PINSRH_2:
-        tcg_gen_deposit_i64(t0, t0, t1, 32, 16);
-        break;
-    case OPC_PINSRH_3:
-        tcg_gen_deposit_i64(t0, t0, t1, 48, 16);
-        break;
-
-    case OPC_PEXTRH:
-        tcg_gen_andi_i64(t1, t1, 3);
-        tcg_gen_shli_i64(t1, t1, 4);
-        tcg_gen_shr_i64(t0, t0, t1);
-        tcg_gen_ext16u_i64(t0, t0);
-        break;
-
-    case OPC_ADDU_CP2:
-        tcg_gen_add_i64(t0, t0, t1);
-        tcg_gen_ext32s_i64(t0, t0);
-        break;
-    case OPC_SUBU_CP2:
-        tcg_gen_sub_i64(t0, t0, t1);
-        tcg_gen_ext32s_i64(t0, t0);
-        break;
-
-    case OPC_SLL_CP2:
-        shift_max = 32;
-        goto do_shift;
-    case OPC_SRL_CP2:
-        shift_max = 32;
-        goto do_shift;
-    case OPC_SRA_CP2:
-        shift_max = 32;
-        goto do_shift;
-    case OPC_DSLL_CP2:
-        shift_max = 64;
-        goto do_shift;
-    case OPC_DSRL_CP2:
-        shift_max = 64;
-        goto do_shift;
-    case OPC_DSRA_CP2:
-        shift_max = 64;
-        goto do_shift;
-    do_shift:
-        /* Make sure shift count isn't TCG undefined behaviour.  */
-        tcg_gen_andi_i64(t1, t1, shift_max - 1);
-
-        switch (opc) {
-        case OPC_SLL_CP2:
-        case OPC_DSLL_CP2:
-            tcg_gen_shl_i64(t0, t0, t1);
-            break;
-        case OPC_SRA_CP2:
-        case OPC_DSRA_CP2:
-            /*
-             * Since SRA is UndefinedResult without sign-extended inputs,
-             * we can treat SRA and DSRA the same.
-             */
-            tcg_gen_sar_i64(t0, t0, t1);
-            break;
-        case OPC_SRL_CP2:
-            /* We want to shift in zeros for SRL; zero-extend first.  */
-            tcg_gen_ext32u_i64(t0, t0);
-            /* FALLTHRU */
-        case OPC_DSRL_CP2:
-            tcg_gen_shr_i64(t0, t0, t1);
-            break;
-        }
-
-        if (shift_max == 32) {
-            tcg_gen_ext32s_i64(t0, t0);
-        }
-
-        /* Shifts larger than MAX produce zero.  */
-        tcg_gen_setcondi_i64(TCG_COND_LTU, t1, t1, shift_max);
-        tcg_gen_neg_i64(t1, t1);
-        tcg_gen_and_i64(t0, t0, t1);
-        break;
-
-    case OPC_ADD_CP2:
-    case OPC_DADD_CP2:
-        {
-            TCGv_i64 t2 = tcg_temp_new_i64();
-            TCGLabel *lab = gen_new_label();
-
-            tcg_gen_mov_i64(t2, t0);
-            tcg_gen_add_i64(t0, t1, t2);
-            if (opc == OPC_ADD_CP2) {
-                tcg_gen_ext32s_i64(t0, t0);
-            }
-            tcg_gen_xor_i64(t1, t1, t2);
-            tcg_gen_xor_i64(t2, t2, t0);
-            tcg_gen_andc_i64(t1, t2, t1);
-            tcg_temp_free_i64(t2);
-            tcg_gen_brcondi_i64(TCG_COND_GE, t1, 0, lab);
-            generate_exception(ctx, EXCP_OVERFLOW);
-            gen_set_label(lab);
-            break;
-        }
-
-    case OPC_SUB_CP2:
-    case OPC_DSUB_CP2:
-        {
-            TCGv_i64 t2 = tcg_temp_new_i64();
-            TCGLabel *lab = gen_new_label();
-
-            tcg_gen_mov_i64(t2, t0);
-            tcg_gen_sub_i64(t0, t1, t2);
-            if (opc == OPC_SUB_CP2) {
-                tcg_gen_ext32s_i64(t0, t0);
-            }
-            tcg_gen_xor_i64(t1, t1, t2);
-            tcg_gen_xor_i64(t2, t2, t0);
-            tcg_gen_and_i64(t1, t1, t2);
-            tcg_temp_free_i64(t2);
-            tcg_gen_brcondi_i64(TCG_COND_GE, t1, 0, lab);
-            generate_exception(ctx, EXCP_OVERFLOW);
-            gen_set_label(lab);
-            break;
-        }
-
-    case OPC_PMULUW:
-        tcg_gen_ext32u_i64(t0, t0);
-        tcg_gen_ext32u_i64(t1, t1);
-        tcg_gen_mul_i64(t0, t0, t1);
-        break;
-
-    case OPC_SEQU_CP2:
-    case OPC_SEQ_CP2:
-        cond = TCG_COND_EQ;
-        goto do_cc_cond;
-        break;
-    case OPC_SLTU_CP2:
-        cond = TCG_COND_LTU;
-        goto do_cc_cond;
-        break;
-    case OPC_SLT_CP2:
-        cond = TCG_COND_LT;
-        goto do_cc_cond;
-        break;
-    case OPC_SLEU_CP2:
-        cond = TCG_COND_LEU;
-        goto do_cc_cond;
-        break;
-    case OPC_SLE_CP2:
-        cond = TCG_COND_LE;
-    do_cc_cond:
-        {
-            int cc = (ctx->opcode >> 8) & 0x7;
-            TCGv_i64 t64 = tcg_temp_new_i64();
-            TCGv_i32 t32 = tcg_temp_new_i32();
-
-            tcg_gen_setcond_i64(cond, t64, t0, t1);
-            tcg_gen_extrl_i64_i32(t32, t64);
-            tcg_gen_deposit_i32(fpu_fcr31, fpu_fcr31, t32,
-                                get_fp_bit(cc), 1);
-
-            tcg_temp_free_i32(t32);
-            tcg_temp_free_i64(t64);
-        }
-        goto no_rd;
-        break;
-    default:
-        MIPS_INVAL("loongson_cp2");
-        generate_exception_end(ctx, EXCP_RI);
-        return;
-    }
-
-    gen_store_fpr64(ctx, t0, rd);
-
-no_rd:
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
-}
-
 static void gen_loongson_lswc2(DisasContext *ctx, int rt,
                                int rs, int rd)
 {
@@ -12939,6 +12342,7 @@ out:
 #include "mod-mips-dsp_translate.c.inc"
 
 #include "vendor-vr54xx_translate.c.inc"
+#include "vendor-loong-simd_translate.c.inc"
 
 static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
 {
diff --git a/target/mips/vendor-loong-simd_translate.c.inc b/target/mips/vendor-loong-simd_translate.c.inc
new file mode 100644
index 00000000000..6ea7e9a9b82
--- /dev/null
+++ b/target/mips/vendor-loong-simd_translate.c.inc
@@ -0,0 +1,611 @@
+/*
+ *  Loongson SIMD translation routines.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *  Copyright (c) 2009 CodeSourcery (MIPS16 and microMIPS support)
+ *  Copyright (c) 2011 Richard Henderson <rth@twiddle.net>
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
+/* Loongson multimedia instructions */
+static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
+{
+    uint32_t opc, shift_max;
+    TCGv_i64 t0, t1;
+    TCGCond cond;
+
+    opc = MASK_LMMI(ctx->opcode);
+    switch (opc) {
+    case OPC_ADD_CP2:
+    case OPC_SUB_CP2:
+    case OPC_DADD_CP2:
+    case OPC_DSUB_CP2:
+        t0 = tcg_temp_local_new_i64();
+        t1 = tcg_temp_local_new_i64();
+        break;
+    default:
+        t0 = tcg_temp_new_i64();
+        t1 = tcg_temp_new_i64();
+        break;
+    }
+
+    check_cp1_enabled(ctx);
+    gen_load_fpr64(ctx, t0, rs);
+    gen_load_fpr64(ctx, t1, rt);
+
+    switch (opc) {
+    case OPC_PADDSH:
+        gen_helper_paddsh(t0, t0, t1);
+        break;
+    case OPC_PADDUSH:
+        gen_helper_paddush(t0, t0, t1);
+        break;
+    case OPC_PADDH:
+        gen_helper_paddh(t0, t0, t1);
+        break;
+    case OPC_PADDW:
+        gen_helper_paddw(t0, t0, t1);
+        break;
+    case OPC_PADDSB:
+        gen_helper_paddsb(t0, t0, t1);
+        break;
+    case OPC_PADDUSB:
+        gen_helper_paddusb(t0, t0, t1);
+        break;
+    case OPC_PADDB:
+        gen_helper_paddb(t0, t0, t1);
+        break;
+
+    case OPC_PSUBSH:
+        gen_helper_psubsh(t0, t0, t1);
+        break;
+    case OPC_PSUBUSH:
+        gen_helper_psubush(t0, t0, t1);
+        break;
+    case OPC_PSUBH:
+        gen_helper_psubh(t0, t0, t1);
+        break;
+    case OPC_PSUBW:
+        gen_helper_psubw(t0, t0, t1);
+        break;
+    case OPC_PSUBSB:
+        gen_helper_psubsb(t0, t0, t1);
+        break;
+    case OPC_PSUBUSB:
+        gen_helper_psubusb(t0, t0, t1);
+        break;
+    case OPC_PSUBB:
+        gen_helper_psubb(t0, t0, t1);
+        break;
+
+    case OPC_PSHUFH:
+        gen_helper_pshufh(t0, t0, t1);
+        break;
+    case OPC_PACKSSWH:
+        gen_helper_packsswh(t0, t0, t1);
+        break;
+    case OPC_PACKSSHB:
+        gen_helper_packsshb(t0, t0, t1);
+        break;
+    case OPC_PACKUSHB:
+        gen_helper_packushb(t0, t0, t1);
+        break;
+
+    case OPC_PUNPCKLHW:
+        gen_helper_punpcklhw(t0, t0, t1);
+        break;
+    case OPC_PUNPCKHHW:
+        gen_helper_punpckhhw(t0, t0, t1);
+        break;
+    case OPC_PUNPCKLBH:
+        gen_helper_punpcklbh(t0, t0, t1);
+        break;
+    case OPC_PUNPCKHBH:
+        gen_helper_punpckhbh(t0, t0, t1);
+        break;
+    case OPC_PUNPCKLWD:
+        gen_helper_punpcklwd(t0, t0, t1);
+        break;
+    case OPC_PUNPCKHWD:
+        gen_helper_punpckhwd(t0, t0, t1);
+        break;
+
+    case OPC_PAVGH:
+        gen_helper_pavgh(t0, t0, t1);
+        break;
+    case OPC_PAVGB:
+        gen_helper_pavgb(t0, t0, t1);
+        break;
+    case OPC_PMAXSH:
+        gen_helper_pmaxsh(t0, t0, t1);
+        break;
+    case OPC_PMINSH:
+        gen_helper_pminsh(t0, t0, t1);
+        break;
+    case OPC_PMAXUB:
+        gen_helper_pmaxub(t0, t0, t1);
+        break;
+    case OPC_PMINUB:
+        gen_helper_pminub(t0, t0, t1);
+        break;
+
+    case OPC_PCMPEQW:
+        gen_helper_pcmpeqw(t0, t0, t1);
+        break;
+    case OPC_PCMPGTW:
+        gen_helper_pcmpgtw(t0, t0, t1);
+        break;
+    case OPC_PCMPEQH:
+        gen_helper_pcmpeqh(t0, t0, t1);
+        break;
+    case OPC_PCMPGTH:
+        gen_helper_pcmpgth(t0, t0, t1);
+        break;
+    case OPC_PCMPEQB:
+        gen_helper_pcmpeqb(t0, t0, t1);
+        break;
+    case OPC_PCMPGTB:
+        gen_helper_pcmpgtb(t0, t0, t1);
+        break;
+
+    case OPC_PSLLW:
+        gen_helper_psllw(t0, t0, t1);
+        break;
+    case OPC_PSLLH:
+        gen_helper_psllh(t0, t0, t1);
+        break;
+    case OPC_PSRLW:
+        gen_helper_psrlw(t0, t0, t1);
+        break;
+    case OPC_PSRLH:
+        gen_helper_psrlh(t0, t0, t1);
+        break;
+    case OPC_PSRAW:
+        gen_helper_psraw(t0, t0, t1);
+        break;
+    case OPC_PSRAH:
+        gen_helper_psrah(t0, t0, t1);
+        break;
+
+    case OPC_PMULLH:
+        gen_helper_pmullh(t0, t0, t1);
+        break;
+    case OPC_PMULHH:
+        gen_helper_pmulhh(t0, t0, t1);
+        break;
+    case OPC_PMULHUH:
+        gen_helper_pmulhuh(t0, t0, t1);
+        break;
+    case OPC_PMADDHW:
+        gen_helper_pmaddhw(t0, t0, t1);
+        break;
+
+    case OPC_PASUBUB:
+        gen_helper_pasubub(t0, t0, t1);
+        break;
+    case OPC_BIADD:
+        gen_helper_biadd(t0, t0);
+        break;
+    case OPC_PMOVMSKB:
+        gen_helper_pmovmskb(t0, t0);
+        break;
+
+    case OPC_PADDD:
+        tcg_gen_add_i64(t0, t0, t1);
+        break;
+    case OPC_PSUBD:
+        tcg_gen_sub_i64(t0, t0, t1);
+        break;
+    case OPC_XOR_CP2:
+        tcg_gen_xor_i64(t0, t0, t1);
+        break;
+    case OPC_NOR_CP2:
+        tcg_gen_nor_i64(t0, t0, t1);
+        break;
+    case OPC_AND_CP2:
+        tcg_gen_and_i64(t0, t0, t1);
+        break;
+    case OPC_OR_CP2:
+        tcg_gen_or_i64(t0, t0, t1);
+        break;
+
+    case OPC_PANDN:
+        tcg_gen_andc_i64(t0, t1, t0);
+        break;
+
+    case OPC_PINSRH_0:
+        tcg_gen_deposit_i64(t0, t0, t1, 0, 16);
+        break;
+    case OPC_PINSRH_1:
+        tcg_gen_deposit_i64(t0, t0, t1, 16, 16);
+        break;
+    case OPC_PINSRH_2:
+        tcg_gen_deposit_i64(t0, t0, t1, 32, 16);
+        break;
+    case OPC_PINSRH_3:
+        tcg_gen_deposit_i64(t0, t0, t1, 48, 16);
+        break;
+
+    case OPC_PEXTRH:
+        tcg_gen_andi_i64(t1, t1, 3);
+        tcg_gen_shli_i64(t1, t1, 4);
+        tcg_gen_shr_i64(t0, t0, t1);
+        tcg_gen_ext16u_i64(t0, t0);
+        break;
+
+    case OPC_ADDU_CP2:
+        tcg_gen_add_i64(t0, t0, t1);
+        tcg_gen_ext32s_i64(t0, t0);
+        break;
+    case OPC_SUBU_CP2:
+        tcg_gen_sub_i64(t0, t0, t1);
+        tcg_gen_ext32s_i64(t0, t0);
+        break;
+
+    case OPC_SLL_CP2:
+        shift_max = 32;
+        goto do_shift;
+    case OPC_SRL_CP2:
+        shift_max = 32;
+        goto do_shift;
+    case OPC_SRA_CP2:
+        shift_max = 32;
+        goto do_shift;
+    case OPC_DSLL_CP2:
+        shift_max = 64;
+        goto do_shift;
+    case OPC_DSRL_CP2:
+        shift_max = 64;
+        goto do_shift;
+    case OPC_DSRA_CP2:
+        shift_max = 64;
+        goto do_shift;
+    do_shift:
+        /* Make sure shift count isn't TCG undefined behaviour.  */
+        tcg_gen_andi_i64(t1, t1, shift_max - 1);
+
+        switch (opc) {
+        case OPC_SLL_CP2:
+        case OPC_DSLL_CP2:
+            tcg_gen_shl_i64(t0, t0, t1);
+            break;
+        case OPC_SRA_CP2:
+        case OPC_DSRA_CP2:
+            /*
+             * Since SRA is UndefinedResult without sign-extended inputs,
+             * we can treat SRA and DSRA the same.
+             */
+            tcg_gen_sar_i64(t0, t0, t1);
+            break;
+        case OPC_SRL_CP2:
+            /* We want to shift in zeros for SRL; zero-extend first.  */
+            tcg_gen_ext32u_i64(t0, t0);
+            /* FALLTHRU */
+        case OPC_DSRL_CP2:
+            tcg_gen_shr_i64(t0, t0, t1);
+            break;
+        }
+
+        if (shift_max == 32) {
+            tcg_gen_ext32s_i64(t0, t0);
+        }
+
+        /* Shifts larger than MAX produce zero.  */
+        tcg_gen_setcondi_i64(TCG_COND_LTU, t1, t1, shift_max);
+        tcg_gen_neg_i64(t1, t1);
+        tcg_gen_and_i64(t0, t0, t1);
+        break;
+
+    case OPC_ADD_CP2:
+    case OPC_DADD_CP2:
+        {
+            TCGv_i64 t2 = tcg_temp_new_i64();
+            TCGLabel *lab = gen_new_label();
+
+            tcg_gen_mov_i64(t2, t0);
+            tcg_gen_add_i64(t0, t1, t2);
+            if (opc == OPC_ADD_CP2) {
+                tcg_gen_ext32s_i64(t0, t0);
+            }
+            tcg_gen_xor_i64(t1, t1, t2);
+            tcg_gen_xor_i64(t2, t2, t0);
+            tcg_gen_andc_i64(t1, t2, t1);
+            tcg_temp_free_i64(t2);
+            tcg_gen_brcondi_i64(TCG_COND_GE, t1, 0, lab);
+            generate_exception(ctx, EXCP_OVERFLOW);
+            gen_set_label(lab);
+            break;
+        }
+
+    case OPC_SUB_CP2:
+    case OPC_DSUB_CP2:
+        {
+            TCGv_i64 t2 = tcg_temp_new_i64();
+            TCGLabel *lab = gen_new_label();
+
+            tcg_gen_mov_i64(t2, t0);
+            tcg_gen_sub_i64(t0, t1, t2);
+            if (opc == OPC_SUB_CP2) {
+                tcg_gen_ext32s_i64(t0, t0);
+            }
+            tcg_gen_xor_i64(t1, t1, t2);
+            tcg_gen_xor_i64(t2, t2, t0);
+            tcg_gen_and_i64(t1, t1, t2);
+            tcg_temp_free_i64(t2);
+            tcg_gen_brcondi_i64(TCG_COND_GE, t1, 0, lab);
+            generate_exception(ctx, EXCP_OVERFLOW);
+            gen_set_label(lab);
+            break;
+        }
+
+    case OPC_PMULUW:
+        tcg_gen_ext32u_i64(t0, t0);
+        tcg_gen_ext32u_i64(t1, t1);
+        tcg_gen_mul_i64(t0, t0, t1);
+        break;
+
+    case OPC_SEQU_CP2:
+    case OPC_SEQ_CP2:
+        cond = TCG_COND_EQ;
+        goto do_cc_cond;
+        break;
+    case OPC_SLTU_CP2:
+        cond = TCG_COND_LTU;
+        goto do_cc_cond;
+        break;
+    case OPC_SLT_CP2:
+        cond = TCG_COND_LT;
+        goto do_cc_cond;
+        break;
+    case OPC_SLEU_CP2:
+        cond = TCG_COND_LEU;
+        goto do_cc_cond;
+        break;
+    case OPC_SLE_CP2:
+        cond = TCG_COND_LE;
+    do_cc_cond:
+        {
+            int cc = (ctx->opcode >> 8) & 0x7;
+            TCGv_i64 t64 = tcg_temp_new_i64();
+            TCGv_i32 t32 = tcg_temp_new_i32();
+
+            tcg_gen_setcond_i64(cond, t64, t0, t1);
+            tcg_gen_extrl_i64_i32(t32, t64);
+            tcg_gen_deposit_i32(fpu_fcr31, fpu_fcr31, t32,
+                                get_fp_bit(cc), 1);
+
+            tcg_temp_free_i32(t32);
+            tcg_temp_free_i64(t64);
+        }
+        goto no_rd;
+        break;
+    default:
+        MIPS_INVAL("loongson_cp2");
+        generate_exception_end(ctx, EXCP_RI);
+        return;
+    }
+
+    gen_store_fpr64(ctx, t0, rd);
+
+no_rd:
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+}
-- 
2.26.2



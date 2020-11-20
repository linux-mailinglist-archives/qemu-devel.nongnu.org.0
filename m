Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ADC2BB83D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 22:21:55 +0100 (CET)
Received: from localhost ([::1]:38412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgDqs-0006oc-Uq
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 16:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDfs-0004TC-RF
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:10:32 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDfp-0004Iq-Jy
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:10:32 -0500
Received: by mail-wr1-x42e.google.com with SMTP id o15so11711761wru.6
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lz4O3VSdeq8YY2AcXxACks3Rk8SOTJPFTORx1KyBhHY=;
 b=HfzVrAlofaRwkvttP2ReQcT5fr/lrZH0pWh0yeHoTghC4ptf3Gk/KVTyg0ncNAy+OU
 wuWezs30qFgNacQ/pfyfRXGbBeBRH1f8eNqJ6uLY0w6++2HeE07Nz+KURR/2PmjRmM+u
 188IW8zMBSbqDidI+s9YRzAzdkSbP628IPcvvSoZHXXsoAy+hP7oky7erJz7RlExlinD
 zkD/5AjmzKGGed2efkaN0Z8DOT84xMKERNeRho4EpMrGatIqfM+Hm6sDFSs2I/P9+evz
 daeY9okDyX/gjT8EWQ7MpOVrmAEdFcbZ4VOfaEpEdJEjSwRDeTmQqMRpRzDo/7tnVa3W
 7N6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Lz4O3VSdeq8YY2AcXxACks3Rk8SOTJPFTORx1KyBhHY=;
 b=jxyzpKdU0PlDBYlQ2oHb1i2u0Dt2wHizN0QQ40p9RT+udkkPfZGB/xuQ9Saeq9lWYo
 pb+u98rczaoFLBABtwGD3z6bl5+syFaQC58jtIQxYW5VcZ115Ug/QEqgy2aoedDZhO+U
 HFy/2E95Ewyc+Bc7TkM7g1GSaBQqbPKB++pJLaUoj4wd5NTxysZoRv2dWxcF+sNIn/7f
 oS8012Kck7M8incojxO3pDXljm5EUQpPcWExHDMhTt2R3Mm9VyKSBdOeQEzxVTSWdwRT
 Q4xnaThmUlhvLSCEbDTISP5JSGfeZTdeHsG6oiF/C9Bm6gTDj3tdE25iLB2j8Xp+WRuk
 yJEA==
X-Gm-Message-State: AOAM531wAZCzuh/A4rF0rnRAmjUEH32vrFkJtBGvXUhJVXHOPKxvAlUQ
 2c9sK4FlOA4YRatpnxgeRDB6BDh50Mw=
X-Google-Smtp-Source: ABdhPJyI8lzfMKTbAuluiQfCECL1d1hALf0MKUo/ViWj2UG20D5VOyVzxbQSbV+mjU6XBRRpd07gwQ==
X-Received: by 2002:adf:f208:: with SMTP id p8mr18890572wro.280.1605906626867; 
 Fri, 20 Nov 2020 13:10:26 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id o67sm2055544wmo.31.2020.11.20.13.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 13:10:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/26] target/mips: Extract Loongson EXTensions translation
 routines
Date: Fri, 20 Nov 2020 22:08:37 +0100
Message-Id: <20201120210844.2625602-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120210844.2625602-1-f4bug@amsat.org>
References: <20201120210844.2625602-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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

LoongEXTs are general-purpose extensions from the LoongISA.

Extract 440 lines of translation routines to
'vendor-loong-lext_translate.c.inc'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c                       | 440 +----------------
 target/mips/vendor-loong-lext_translate.c.inc | 450 ++++++++++++++++++
 2 files changed, 451 insertions(+), 439 deletions(-)
 create mode 100644 target/mips/vendor-loong-lext_translate.c.inc

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 105a104bb0c..46306ab7e9c 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -399,48 +399,6 @@ enum {
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
 
@@ -4556,403 +4514,6 @@ static void gen_cl(DisasContext *ctx, uint32_t opc,
     }
 }
 
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
@@ -12343,6 +11904,7 @@ out:
 
 #include "vendor-vr54xx_translate.c.inc"
 #include "vendor-loong-simd_translate.c.inc"
+#include "vendor-loong-lext_translate.c.inc"
 
 static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
 {
diff --git a/target/mips/vendor-loong-lext_translate.c.inc b/target/mips/vendor-loong-lext_translate.c.inc
new file mode 100644
index 00000000000..5ea82394587
--- /dev/null
+++ b/target/mips/vendor-loong-lext_translate.c.inc
@@ -0,0 +1,450 @@
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



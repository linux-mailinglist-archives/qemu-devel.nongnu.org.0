Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC392D9FAA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 19:56:43 +0100 (CET)
Received: from localhost ([::1]:54432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kot1W-0007Tq-MW
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 13:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koskA-0000JW-KR
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:51 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:35463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kosk6-0007To-0T
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:46 -0500
Received: by mail-wm1-x32b.google.com with SMTP id e25so16194994wme.0
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 10:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zOZe2uFU6BqfO8jeL11G69ZcASFHm/sscpUhCkf7gHM=;
 b=iXHrVljB7AwPb77aDQJHecHkrRjLpBZGTDdQJW68Ex4ApdRKZ6PAkHTpCgdK44DCGP
 XW7QLQLROlblzc2RY77M57YHzuv/ZC9cgLbVERK+uoSuZe1XmtLNpY2wvUGpDVu0WiL9
 /9hqjyH7BjWnqEs+d1r8bgh3Hejqj+9E5pw8gcVzalhZitnNCInYrT1pxPdhEu1tTNhq
 zMdejDBlWhwvfypuyVz8Q5vNR0v7901Dj/XSNbUe3NNf7hwe0iqpJK2fvkvscaBSyEiy
 VmGiK4Z4JGnHTngcq9MGv4aUQr/pGl3VcfN9j50qGqk98CDfQIUD9ztxN8JQcjRNuovC
 /Nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zOZe2uFU6BqfO8jeL11G69ZcASFHm/sscpUhCkf7gHM=;
 b=IKbn3pdD8min5tYYaEdQW6WGdPsNxAy7tdViEOlA0VGiSVmGifIPjLjWGOcOnakeC2
 TtBaYIQl37J1RYaPZWGbz7MIH9dqRzFXY78uPje5EUf4T/opsOeXcKPJ22qEyzLj1kLM
 URakMViLWoyuHDru1m+H/WpS/jNYrLLOFzCwI58aHB5oVKmSZFmE9tUSgd99Zr+LooIh
 M8rSztQndemHSGnrtNO8xhCgX4XF86Ss4Wrg2bgDdZOTh3//COkC2qJ3gWCmqCPVNuSC
 KYF+Mdhhg4/llnqVVk+KBmzSs2Bi/HMWVWDwwT2i1RHi18rQA1KQqdFBQ5rrjvlJPkrQ
 Nx1A==
X-Gm-Message-State: AOAM532AFZQUQnARf2tGmyqxKbWH7rt1plAjwM4uwAl+LQ31neTys9kP
 z5Tb4t1E0DDaamA6r4x6B9chrhzIeHs=
X-Google-Smtp-Source: ABdhPJyXfJHofcrL/CKLHe0k/7UrymMY7gtmRigbbtHLfPsb06EDNz6XIhrkPE97Oop5Fxz/J4Hqrg==
X-Received: by 2002:a1c:741a:: with SMTP id p26mr30189208wmc.47.1607971118535; 
 Mon, 14 Dec 2020 10:38:38 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id s63sm35837608wms.18.2020.12.14.10.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 10:38:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/16] target/mips: Replace gen_exception_end(EXCP_RI) by
 gen_rsvd_instruction
Date: Mon, 14 Dec 2020 19:37:34 +0100
Message-Id: <20201214183739.500368-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214183739.500368-1-f4bug@amsat.org>
References: <20201214183739.500368-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gen_reserved_instruction() is easier to read than
generate_exception_end(ctx, EXCP_RI), replace it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 724 ++++++++++++++++++++--------------------
 1 file changed, 362 insertions(+), 362 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 2662cf26fe7..49570a95615 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2975,7 +2975,7 @@ static inline void check_cp1_enabled(DisasContext *ctx)
 static inline void check_cop1x(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_COP1X))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 
@@ -2986,7 +2986,7 @@ static inline void check_cop1x(DisasContext *ctx)
 static inline void check_cp1_64bitmode(DisasContext *ctx)
 {
     if (unlikely(~ctx->hflags & (MIPS_HFLAG_F64 | MIPS_HFLAG_COP1X))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 
@@ -3004,7 +3004,7 @@ static inline void check_cp1_64bitmode(DisasContext *ctx)
 static inline void check_cp1_registers(DisasContext *ctx, int regs)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_F64) && (regs & 1))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 
@@ -3018,7 +3018,7 @@ static inline void check_dsp(DisasContext *ctx)
         if (ctx->insn_flags & ASE_DSP) {
             generate_exception_end(ctx, EXCP_DSPDIS);
         } else {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
     }
 }
@@ -3029,7 +3029,7 @@ static inline void check_dsp_r2(DisasContext *ctx)
         if (ctx->insn_flags & ASE_DSP) {
             generate_exception_end(ctx, EXCP_DSPDIS);
         } else {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
     }
 }
@@ -3040,7 +3040,7 @@ static inline void check_dsp_r3(DisasContext *ctx)
         if (ctx->insn_flags & ASE_DSP) {
             generate_exception_end(ctx, EXCP_DSPDIS);
         } else {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
     }
 }
@@ -3052,7 +3052,7 @@ static inline void check_dsp_r3(DisasContext *ctx)
 static inline void check_insn(DisasContext *ctx, uint64_t flags)
 {
     if (unlikely(!(ctx->insn_flags & flags))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 
@@ -3064,7 +3064,7 @@ static inline void check_insn(DisasContext *ctx, uint64_t flags)
 static inline void check_insn_opc_removed(DisasContext *ctx, uint64_t flags)
 {
     if (unlikely(ctx->insn_flags & flags)) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 
@@ -3103,7 +3103,7 @@ static inline void check_ps(DisasContext *ctx)
 static inline void check_mips_64(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_64))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 #endif
@@ -3124,7 +3124,7 @@ static inline void check_mvh(DisasContext *ctx)
 static inline void check_xnp(DisasContext *ctx)
 {
     if (unlikely(ctx->CP0_Config5 & (1 << CP0C5_XNP))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 
@@ -3136,7 +3136,7 @@ static inline void check_xnp(DisasContext *ctx)
 static inline void check_pw(DisasContext *ctx)
 {
     if (unlikely(!(ctx->CP0_Config3 & (1 << CP0C3_PW)))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 #endif
@@ -3148,7 +3148,7 @@ static inline void check_pw(DisasContext *ctx)
 static inline void check_mt(DisasContext *ctx)
 {
     if (unlikely(!(ctx->CP0_Config3 & (1 << CP0C3_MT)))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 
@@ -3165,7 +3165,7 @@ static inline void check_cp0_mt(DisasContext *ctx)
         generate_exception_end(ctx, EXCP_CpU);
     } else {
         if (unlikely(!(ctx->CP0_Config3 & (1 << CP0C3_MT)))) {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
     }
 }
@@ -3178,7 +3178,7 @@ static inline void check_cp0_mt(DisasContext *ctx)
 static inline void check_nms(DisasContext *ctx)
 {
     if (unlikely(ctx->CP0_Config5 & (1 << CP0C5_NMS))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 
@@ -3195,7 +3195,7 @@ static inline void check_nms_dl_il_sl_tl_l2c(DisasContext *ctx)
                  !(ctx->CP0_Config2 & (1 << CP0C2_SL)) &&
                  !(ctx->CP0_Config2 & (1 << CP0C2_TL)) &&
                  !(ctx->CP0_Config5 & (1 << CP0C5_L2C)))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 
@@ -3206,7 +3206,7 @@ static inline void check_nms_dl_il_sl_tl_l2c(DisasContext *ctx)
 static inline void check_eva(DisasContext *ctx)
 {
     if (unlikely(!(ctx->CP0_Config5 & (1 << CP0C5_EVA)))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 
@@ -3872,7 +3872,7 @@ static void gen_flt_ldst(DisasContext *ctx, uint32_t opc, int ft,
         break;
     default:
         MIPS_INVAL("flt_ldst");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -4521,7 +4521,7 @@ static void gen_HILO1_tx79(DisasContext *ctx, uint32_t opc, int reg)
         break;
     default:
         MIPS_INVAL("mfthilo1 TX79");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -4656,7 +4656,7 @@ static inline void gen_pcrel(DisasContext *ctx, int opc, target_ulong pc,
 #endif
         default:
             MIPS_INVAL("OPC_PCREL");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -4867,7 +4867,7 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
 #endif
     default:
         MIPS_INVAL("r6 mul/div");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
  out:
@@ -4925,7 +4925,7 @@ static void gen_div1_tx79(DisasContext *ctx, uint32_t opc, int rs, int rt)
         break;
     default:
         MIPS_INVAL("div1 TX79");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
  out:
@@ -5118,7 +5118,7 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
         break;
     default:
         MIPS_INVAL("mul/div");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
  out:
@@ -5249,7 +5249,7 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
         break;
     default:
         MIPS_INVAL("mul/madd TXx9");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -5312,7 +5312,7 @@ static void gen_mul_vr54xx(DisasContext *ctx, uint32_t opc,
         break;
     default:
         MIPS_INVAL("mul vr54xx");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
     gen_store_gpr(t0, rd);
@@ -5938,7 +5938,7 @@ static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
         break;
     default:
         MIPS_INVAL("loongson_cp2");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 
@@ -6127,7 +6127,7 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
 #endif
         default:
             MIPS_INVAL("loongson_gsshfl");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -6175,13 +6175,13 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
 #endif
         default:
             MIPS_INVAL("loongson_gsshfs");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
     default:
         MIPS_INVAL("loongson_gslsq");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
     tcg_temp_free(t0);
@@ -6230,7 +6230,7 @@ static void gen_loongson_lsdc2(DisasContext *ctx, int rt,
         break;
     default:
         MIPS_INVAL("loongson_lsdc2");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
         break;
     }
@@ -6486,7 +6486,7 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc,
         LOG_DISAS("Branch in delay / forbidden slot at PC 0x"
                   TARGET_FMT_lx "\n", ctx->base.pc_next);
 #endif
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -6549,14 +6549,14 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc,
              * others are reserved.
              */
             MIPS_INVAL("jump hint");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             goto out;
         }
         gen_load_gpr(btarget, rs);
         break;
     default:
         MIPS_INVAL("branch/jump");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
     if (bcond_compute == 0) {
@@ -6621,7 +6621,7 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc,
             break;
         default:
             MIPS_INVAL("branch/jump");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             goto out;
         }
     } else {
@@ -6692,7 +6692,7 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc,
             break;
         default:
             MIPS_INVAL("conditional branch/jump");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             goto out;
         }
     }
@@ -6769,14 +6769,14 @@ static void gen_compute_branch_nm(DisasContext *ctx, uint32_t opc,
              * others are reserved.
              */
             MIPS_INVAL("jump hint");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             goto out;
         }
         gen_load_gpr(btarget, rs);
         break;
     default:
         MIPS_INVAL("branch/jump");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
     if (bcond_compute == 0) {
@@ -6809,7 +6809,7 @@ static void gen_compute_branch_nm(DisasContext *ctx, uint32_t opc,
             break;
         default:
             MIPS_INVAL("branch/jump");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             goto out;
         }
     } else {
@@ -6832,7 +6832,7 @@ static void gen_compute_branch_nm(DisasContext *ctx, uint32_t opc,
             break;
         default:
             MIPS_INVAL("conditional branch/jump");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             goto out;
         }
     }
@@ -6912,7 +6912,7 @@ static void gen_bitops(DisasContext *ctx, uint32_t opc, int rt,
     default:
 fail:
         MIPS_INVAL("bitops");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         tcg_temp_free(t0);
         tcg_temp_free(t1);
         return;
@@ -6990,7 +6990,7 @@ static void gen_bshfl(DisasContext *ctx, uint32_t op2, int rt, int rd)
 #endif
     default:
         MIPS_INVAL("bsfhl");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         tcg_temp_free(t0);
         return;
     }
@@ -10644,7 +10644,7 @@ static void gen_mftr(CPUMIPSState *env, DisasContext *ctx, int rt, int rd,
 die:
     tcg_temp_free(t0);
     LOG_DISAS("mftr (reg %d u %d sel %d h %d)\n", rt, u, sel, h);
-    generate_exception_end(ctx, EXCP_RI);
+    gen_reserved_instruction(ctx);
 }
 
 static void gen_mttr(CPUMIPSState *env, DisasContext *ctx, int rd, int rt,
@@ -10854,7 +10854,7 @@ static void gen_mttr(CPUMIPSState *env, DisasContext *ctx, int rd, int rt,
 die:
     tcg_temp_free(t0);
     LOG_DISAS("mttr (reg %d u %d sel %d h %d)\n", rd, u, sel, h);
-    generate_exception_end(ctx, EXCP_RI);
+    gen_reserved_instruction(ctx);
 }
 
 static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
@@ -11014,7 +11014,7 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
         }
         if (!(ctx->hflags & MIPS_HFLAG_DM)) {
             MIPS_INVAL(opn);
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         } else {
             gen_helper_deret(cpu_env);
             ctx->base.is_jmp = DISAS_EXIT;
@@ -11037,7 +11037,7 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
     default:
  die:
         MIPS_INVAL(opn);
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
     (void)opn; /* avoid a compiler warning */
@@ -11052,7 +11052,7 @@ static void gen_compute_branch1(DisasContext *ctx, uint32_t op,
     TCGv_i32 t0 = tcg_temp_new_i32();
 
     if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->hflags & MIPS_HFLAG_BMASK)) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -11143,7 +11143,7 @@ static void gen_compute_branch1(DisasContext *ctx, uint32_t op,
         break;
     default:
         MIPS_INVAL("cp1 cond branch");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
     ctx->btarget = btarget;
@@ -11165,7 +11165,7 @@ static void gen_compute_branch1_r6(DisasContext *ctx, uint32_t op,
         LOG_DISAS("Branch in delay / forbidden slot at PC 0x" TARGET_FMT_lx
                   "\n", ctx->base.pc_next);
 #endif
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -11185,7 +11185,7 @@ static void gen_compute_branch1_r6(DisasContext *ctx, uint32_t op,
         break;
     default:
         MIPS_INVAL("cp1 cond branch");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -11493,7 +11493,7 @@ static void gen_cp1(DisasContext *ctx, uint32_t opc, int rt, int fs)
         break;
     default:
         MIPS_INVAL("cp1 move");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -11630,7 +11630,7 @@ static void gen_sel_s(DisasContext *ctx, enum fopcode op1, int fd, int ft,
         break;
     default:
         MIPS_INVAL("gen_sel_s");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -11667,7 +11667,7 @@ static void gen_sel_d(DisasContext *ctx, enum fopcode op1, int fd, int ft,
         break;
     default:
         MIPS_INVAL("gen_sel_d");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -13101,7 +13101,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
         break;
     default:
         MIPS_INVAL("farith");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 }
@@ -13440,7 +13440,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
         break;
     default:
         MIPS_INVAL("flt3_arith");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 }
@@ -13515,13 +13515,13 @@ static void gen_rdhwr(DisasContext *ctx, int rt, int rd, int sel)
                           offsetof(CPUMIPSState, active_tc.CP0_UserLocal));
             gen_store_gpr(t0, rt);
         } else {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
         break;
 #endif
     default:            /* Invalid */
         MIPS_INVAL("rdhwr");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
     tcg_temp_free(t0);
@@ -13620,7 +13620,7 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
         LOG_DISAS("Branch in delay / forbidden slot at PC 0x" TARGET_FMT_lx
                   "\n", ctx->base.pc_next);
 #endif
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -13682,7 +13682,7 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
         break;
     default:
         MIPS_INVAL("Compact branch/jump");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -13703,7 +13703,7 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
             break;
         default:
             MIPS_INVAL("Compact branch/jump");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             goto out;
         }
 
@@ -13826,7 +13826,7 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
             break;
         default:
             MIPS_INVAL("Compact conditional branch/jump");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             goto out;
         }
 
@@ -14000,7 +14000,7 @@ static void gen_mips16_save(DisasContext *ctx,
         args = 4;
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 
@@ -14096,7 +14096,7 @@ static void gen_mips16_save(DisasContext *ctx,
         astatic = 4;
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 
@@ -14202,7 +14202,7 @@ static void gen_mips16_restore(DisasContext *ctx,
         astatic = 4;
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 
@@ -14233,7 +14233,7 @@ static void gen_addiupc(DisasContext *ctx, int rx, int imm,
     TCGv t0;
 
     if (extended && (ctx->hflags & MIPS_HFLAG_BMASK)) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 
@@ -14291,7 +14291,7 @@ static void decode_i64_mips16(DisasContext *ctx,
         check_insn(ctx, ISA_MIPS3);
         check_mips_64(ctx);
         if (extended && (ctx->hflags & MIPS_HFLAG_BMASK)) {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         } else {
             offset = extended ? offset : offset << 3;
             gen_ld(ctx, OPC_LDPC, ry, 0, offset);
@@ -14368,7 +14368,7 @@ static int decode_extended_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
             check_mips_64(ctx);
             gen_shift_imm(ctx, OPC_DSLL, rx, ry, sa);
 #else
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
 #endif
             break;
         case 0x2:
@@ -14396,7 +14396,7 @@ static int decode_extended_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
             check_mips_64(ctx);
             gen_arith_imm(ctx, OPC_DADDIU, ry, rx, imm);
 #else
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
 #endif
         } else {
             gen_arith_imm(ctx, OPC_ADDIU, ry, rx, imm);
@@ -14448,7 +14448,7 @@ static int decode_extended_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
             }
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -14511,7 +14511,7 @@ static int decode_extended_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
         break;
 #endif
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -14600,7 +14600,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
             check_mips_64(ctx);
             gen_shift_imm(ctx, OPC_DSLL, rx, ry, sa);
 #else
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
 #endif
             break;
         case 0x2:
@@ -14628,7 +14628,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
                 check_mips_64(ctx);
                 gen_arith_imm(ctx, OPC_DADDIU, ry, rx, imm);
 #else
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
 #endif
             } else {
                 gen_arith_imm(ctx, OPC_ADDIU, ry, rx, imm);
@@ -14712,7 +14712,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
                 gen_arith(ctx, OPC_ADDU, ry, reg32, 0);
                 break;
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
         }
@@ -14802,7 +14802,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
                 break;
 #endif
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 goto done;
             }
 
@@ -14919,7 +14919,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
                 break;
 #endif
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
             break;
@@ -14983,7 +14983,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
             break;
 #endif
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -14998,7 +14998,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
         break;
 #endif
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -15696,7 +15696,7 @@ static void gen_ldst_multiple(DisasContext *ctx, uint32_t opc, int reglist,
     TCGv_i32 t2;
 
     if (ctx->hflags & MIPS_HFLAG_BMASK) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 
@@ -15849,7 +15849,7 @@ static void gen_pool16c_insn(DisasContext *ctx)
         }
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -15994,7 +15994,7 @@ static void gen_ldst_pair(DisasContext *ctx, uint32_t opc, int rd,
     TCGv t0, t1;
 
     if (ctx->hflags & MIPS_HFLAG_BMASK || rd == 31) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 
@@ -16006,7 +16006,7 @@ static void gen_ldst_pair(DisasContext *ctx, uint32_t opc, int rd,
     switch (opc) {
     case LWP:
         if (rd == base) {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             return;
         }
         tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TESL);
@@ -16027,7 +16027,7 @@ static void gen_ldst_pair(DisasContext *ctx, uint32_t opc, int rd,
 #ifdef TARGET_MIPS64
     case LDP:
         if (rd == base) {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             return;
         }
         tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TEQ);
@@ -16372,7 +16372,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
             } else {
                 check_insn(ctx, ISA_MIPS32);
                 if (ctx->hflags & MIPS_HFLAG_SBRI) {
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                 } else {
                     generate_exception_end(ctx, EXCP_DBp);
                 }
@@ -16422,7 +16422,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
     default:
     pool32axf_invalid:
         MIPS_INVAL("pool32axf");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -16691,7 +16691,7 @@ static void gen_pool32fxf(DisasContext *ctx, int rt, int rs)
         break;
     default:
         MIPS_INVAL("pool32fxf");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -16895,12 +16895,12 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
             break;
         case SIGRIE:
             check_insn(ctx, ISA_MIPS32R6);
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         default:
         pool32a_invalid:
                 MIPS_INVAL("pool32a");
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
         }
         break;
@@ -16942,7 +16942,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:
             MIPS_INVAL("pool32b");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -17422,7 +17422,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
             default:
             pool32f_invalid:
                 MIPS_INVAL("pool32f");
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
         } else {
@@ -17584,7 +17584,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
             /* Fall through */
         default:
             MIPS_INVAL("pool32i");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -17667,7 +17667,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
         case LD_EVA:
             if (!ctx->eva) {
                 MIPS_INVAL("pool32c ld-eva");
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
             check_cp0_enabled(ctx);
@@ -17706,7 +17706,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
         case ST_EVA:
             if (!ctx->eva) {
                 MIPS_INVAL("pool32c st-eva");
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
             check_cp0_enabled(ctx);
@@ -17758,7 +17758,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:
             MIPS_INVAL("pool32c");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -18050,7 +18050,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
         gen_st(ctx, mips32_op, rt, rs, imm);
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -18081,7 +18081,7 @@ static int decode_micromips_opc(CPUMIPSState *env, DisasContext *ctx)
         case 7:
         /* LB32, LH32, LWC132, LDC132, LW32 */
             if (ctx->hflags & MIPS_HFLAG_BDS16) {
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 return 2;
             }
             break;
@@ -18092,7 +18092,7 @@ static int decode_micromips_opc(CPUMIPSState *env, DisasContext *ctx)
         case 3:
         /* MOVE16, ANDI16, POOL16D, POOL16E, BEQZ16, BNEZ16, B16, LI16 */
             if (ctx->hflags & MIPS_HFLAG_BDS32) {
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 return 2;
             }
             break;
@@ -18165,7 +18165,7 @@ static int decode_micromips_opc(CPUMIPSState *env, DisasContext *ctx)
     case POOL16F:
         check_insn_opc_removed(ctx, ISA_MIPS32R6);
         if (ctx->opcode & 1) {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         } else {
             /* MOVEP */
             int enc_dest = uMIPS_RD(ctx->opcode);
@@ -18303,7 +18303,7 @@ static int decode_micromips_opc(CPUMIPSState *env, DisasContext *ctx)
     case RES_29:
     case RES_31:
     case RES_39:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         decode_micromips32_opc(env, ctx);
@@ -19561,7 +19561,7 @@ static void gen_pool32a0_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
                     gen_helper_dvpe(t0, cpu_env);
                     gen_store_gpr(t0, rt);
                 } else {
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                 }
                 break;
             case 1:
@@ -19576,7 +19576,7 @@ static void gen_pool32a0_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
                     gen_helper_evpe(t0, cpu_env);
                     gen_store_gpr(t0, rt);
                 } else {
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                 }
                 break;
             }
@@ -19626,7 +19626,7 @@ static void gen_pool32a0_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
         break;
 #endif
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -19667,7 +19667,7 @@ static void gen_pool32axf_1_5_nanomips_insn(DisasContext *ctx, uint32_t opc,
         gen_helper_maq_sa_w_phl(t0, v1_t, v0_t, cpu_env);
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -19718,7 +19718,7 @@ static void gen_pool32axf_1_nanomips_insn(DisasContext *ctx, uint32_t opc,
             gen_helper_shilo(t0, v0_t, cpu_env);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -19792,7 +19792,7 @@ static void gen_pool32axf_1_nanomips_insn(DisasContext *ctx, uint32_t opc,
         }
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -19830,7 +19830,7 @@ static void gen_pool32axf_2_multiply(DisasContext *ctx, uint32_t opc,
             gen_helper_dpsq_s_w_ph(t0, v1, v0, cpu_env);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -19853,7 +19853,7 @@ static void gen_pool32axf_2_multiply(DisasContext *ctx, uint32_t opc,
             gen_helper_dpsq_sa_l_w(t0, v0, v1, cpu_env);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -19880,7 +19880,7 @@ static void gen_pool32axf_2_multiply(DisasContext *ctx, uint32_t opc,
             gen_helper_mulsa_w_ph(t0, v0, v1, cpu_env);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -19907,12 +19907,12 @@ static void gen_pool32axf_2_multiply(DisasContext *ctx, uint32_t opc,
             gen_helper_mulsaq_s_w_ph(t0, v1, v0, cpu_env);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -20056,7 +20056,7 @@ static void gen_pool32axf_2_nanomips_insn(DisasContext *ctx, uint32_t opc,
             gen_store_gpr(t0, ret);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -20149,7 +20149,7 @@ static void gen_pool32axf_2_nanomips_insn(DisasContext *ctx, uint32_t opc,
         }
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -20292,7 +20292,7 @@ static void gen_pool32axf_4_nanomips_insn(DisasContext *ctx, uint32_t opc,
         gen_bshfl(ctx, OPC_WSBH, ret, rs);
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -20347,7 +20347,7 @@ static void gen_pool32axf_7_nanomips_insn(DisasContext *ctx, uint32_t opc,
         }
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
     tcg_temp_free(t0);
@@ -20444,7 +20444,7 @@ static void gen_pool32axf_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
             break;
 #endif
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -20455,7 +20455,7 @@ static void gen_pool32axf_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
         }
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -20488,7 +20488,7 @@ static void gen_compute_imm_branch(DisasContext *ctx, uint32_t opc,
     case NM_BBNEZC:
         check_nms(ctx);
         if (imm >= 32 && !(ctx->hflags & MIPS_HFLAG_64)) {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             goto out;
         } else if (rt == 0 && opc == NM_BBEQZC) {
             /* Unconditional branch */
@@ -20538,7 +20538,7 @@ static void gen_compute_imm_branch(DisasContext *ctx, uint32_t opc,
         break;
     default:
         MIPS_INVAL("Immediate Value Compact branch");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -20651,7 +20651,7 @@ static void gen_compute_compact_branch_nm(DisasContext *ctx, uint32_t opc,
         break;
     default:
         MIPS_INVAL("Compact branch/jump");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -20663,7 +20663,7 @@ static void gen_compute_compact_branch_nm(DisasContext *ctx, uint32_t opc,
             break;
         default:
             MIPS_INVAL("Compact branch/jump");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             goto out;
         }
     } else {
@@ -20724,7 +20724,7 @@ static void gen_compute_compact_branch_nm(DisasContext *ctx, uint32_t opc,
             break;
         default:
             MIPS_INVAL("Compact conditional branch/jump");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             goto out;
         }
 
@@ -20768,7 +20768,7 @@ static void gen_compute_branch_cp1_nm(DisasContext *ctx, uint32_t op,
         break;
     default:
         MIPS_INVAL("cp1 cond branch");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -20898,7 +20898,7 @@ static void gen_p_lsx(DisasContext *ctx, int rd, int rs, int rt)
         }
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -20915,7 +20915,7 @@ static void gen_pool32f_nanomips_insn(DisasContext *ctx)
     rd = extract32(ctx->opcode, 11, 5);
 
     if (!(ctx->CP0_Config1 & (1 << CP0C1_FP))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
     check_cp1_enabled(ctx);
@@ -20989,7 +20989,7 @@ static void gen_pool32f_nanomips_insn(DisasContext *ctx)
             gen_farith(ctx, OPC_MSUBF_D, rt, rs, rd, 0);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -21178,7 +21178,7 @@ static void gen_pool32f_nanomips_insn(DisasContext *ctx)
                     gen_farith(ctx, OPC_CVT_S_L, -1, rs, rt, 0);
                     break;
                 default:
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                     break;
                 }
                 break;
@@ -21195,12 +21195,12 @@ static void gen_pool32f_nanomips_insn(DisasContext *ctx)
             gen_r6_cmp_d(ctx, extract32(ctx->opcode, 6, 5), rt, rs, rd);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -21726,7 +21726,7 @@ static void gen_pool32a5_nanomips_insn(DisasContext *ctx, int opc,
             gen_store_gpr(v1_t, rt);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -21748,7 +21748,7 @@ static void gen_pool32a5_nanomips_insn(DisasContext *ctx, int opc,
         }
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -21776,13 +21776,13 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
             switch (extract32(ctx->opcode, 19, 2)) {
             case NM_SIGRIE:
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             case NM_P_SYSCALL:
                 if ((extract32(ctx->opcode, 18, 1)) == NM_SYSCALL) {
                     generate_exception_end(ctx, EXCP_SYSCALL);
                 } else {
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                 }
                 break;
             case NM_BREAK:
@@ -21793,7 +21793,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                     gen_helper_do_semihosting(cpu_env);
                 } else {
                     if (ctx->hflags & MIPS_HFLAG_SBRI) {
-                        generate_exception_end(ctx, EXCP_RI);
+                        gen_reserved_instruction(ctx);
                     } else {
                         generate_exception_end(ctx, EXCP_DBp);
                     }
@@ -21851,12 +21851,12 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                 gen_pool32axf_nanomips_insn(env, ctx);
                 break;
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -21875,7 +21875,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_st(ctx, OPC_SW, rt, 28, extract32(ctx->opcode, 2, 19) << 2);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -21946,7 +21946,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                 }
                 break;
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
             return 6;
@@ -21981,12 +21981,12 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                     }
                     break;
                 default:
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                     break;
                 }
                 break;
             case NM_P_SR_F:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
             break;
@@ -22074,7 +22074,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                            extract32(ctx->opcode, 6, 5));
                 break;
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
             break;
@@ -22087,12 +22087,12 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                            extract32(ctx->opcode, 6, 5));
                 break;
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -22160,7 +22160,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                     gen_st(ctx, OPC_SH, rt, 28, u);
                     break;
                 default:
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                     break;
                 }
                 break;
@@ -22182,7 +22182,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                 }
                 break;
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
         }
@@ -22242,7 +22242,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                 gen_cop1_ldst(ctx, OPC_SDC1, rt, rs, u);
                 break;
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
         }
@@ -22305,7 +22305,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                     }
                     break;
                 default:
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                     break;
                 }
                 break;
@@ -22445,7 +22445,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                         gen_llwp(ctx, rs, 0, rt, extract32(ctx->opcode, 3, 5));
                         break;
                     default:
-                        generate_exception_end(ctx, EXCP_RI);
+                        gen_reserved_instruction(ctx);
                         break;
                     }
                     break;
@@ -22465,7 +22465,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                                  true);
                         break;
                     default:
-                        generate_exception_end(ctx, EXCP_RI);
+                        gen_reserved_instruction(ctx);
                         break;
                     }
                     break;
@@ -22516,7 +22516,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                 }
                 break;
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
         }
@@ -22560,7 +22560,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_compute_nanomips_pbalrsc_branch(ctx, rs, rt);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -22595,7 +22595,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                     }
                     break;
                 default:
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                     break;
                 }
                 break;
@@ -22644,7 +22644,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                 }
                 break;
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
         }
@@ -22660,7 +22660,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
         }
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
     return 4;
@@ -22699,7 +22699,7 @@ static int decode_nanomips_opc(CPUMIPSState *env, DisasContext *ctx)
                 if (extract32(ctx->opcode, 2, 1) == 0) {
                     generate_exception_end(ctx, EXCP_SYSCALL);
                 } else {
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                 }
                 break;
             case NM_BREAK16:
@@ -22710,14 +22710,14 @@ static int decode_nanomips_opc(CPUMIPSState *env, DisasContext *ctx)
                     gen_helper_do_semihosting(cpu_env);
                 } else {
                     if (ctx->hflags & MIPS_HFLAG_SBRI) {
-                        generate_exception_end(ctx, EXCP_RI);
+                        gen_reserved_instruction(ctx);
                     } else {
                         generate_exception_end(ctx, EXCP_DBp);
                     }
                 }
                 break;
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
         }
@@ -22756,7 +22756,7 @@ static int decode_nanomips_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_arith_imm(ctx, OPC_ADDIU, rt, 29, imm);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -22805,7 +22805,7 @@ static int decode_nanomips_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_r6_muldiv(ctx, R6_OPC_MUL, rt, rs, rt);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -22841,7 +22841,7 @@ static int decode_nanomips_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_ld(ctx, OPC_LBU, rt, rs, offset);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -22860,7 +22860,7 @@ static int decode_nanomips_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_ld(ctx, OPC_LHU, rt, rs, offset);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -23639,7 +23639,7 @@ static void gen_mipsdsp_shift(DisasContext *ctx, uint32_t opc,
                 break;
             default:            /* Invalid */
                 MIPS_INVAL("MASK SHLL.QB");
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
             break;
@@ -23754,7 +23754,7 @@ static void gen_mipsdsp_shift(DisasContext *ctx, uint32_t opc,
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK SHLL.OB");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -24445,7 +24445,7 @@ static void gen_mipsdsp_append(CPUMIPSState *env, DisasContext *ctx,
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK APPEND");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -24479,7 +24479,7 @@ static void gen_mipsdsp_append(CPUMIPSState *env, DisasContext *ctx,
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK DAPPEND");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -24748,7 +24748,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:
             MIPS_INVAL("special_r6 muldiv");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -24765,7 +24765,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
              */
             gen_cl(ctx, op1, rd, rs);
         } else {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
         break;
     case R6_OPC_SDBBP:
@@ -24773,7 +24773,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
             gen_helper_do_semihosting(cpu_env);
         } else {
             if (ctx->hflags & MIPS_HFLAG_SBRI) {
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
             } else {
                 generate_exception_end(ctx, EXCP_DBp);
             }
@@ -24794,7 +24794,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
             check_mips_64(ctx);
             gen_cl(ctx, op1, rd, rs);
         } else {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
         break;
     case OPC_DMULT:
@@ -24817,14 +24817,14 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:
             MIPS_INVAL("special_r6 muldiv");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
 #endif
     default:            /* Invalid */
         MIPS_INVAL("special_r6");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -24871,7 +24871,7 @@ static void decode_opc_special_tx79(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:            /* Invalid */
         MIPS_INVAL("special_tx79");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -24942,16 +24942,16 @@ static void decode_opc_special_legacy(CPUMIPSState *env, DisasContext *ctx)
     case OPC_SPIM:
 #ifdef MIPS_STRICT_STANDARD
         MIPS_INVAL("SPIM");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
 #else
         /* Implemented as RI exception for now. */
         MIPS_INVAL("spim (unofficial)");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
 #endif
         break;
     default:            /* Invalid */
         MIPS_INVAL("special_legacy");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -24973,7 +24973,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
             rs == 0 && rt == 0) { /* PAUSE */
             if ((ctx->insn_flags & ISA_MIPS32R6) &&
                 (ctx->hflags & MIPS_HFLAG_BMASK)) {
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
         }
@@ -24993,7 +24993,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
             gen_shift_imm(ctx, op1, rd, rt, sa);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -25019,7 +25019,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
             gen_shift(ctx, op1, rd, rs, rt);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -25053,7 +25053,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
             /* Pmon entry point, also R4010 selsl */
 #ifdef MIPS_STRICT_STANDARD
             MIPS_INVAL("PMON / selsl");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
 #else
             gen_helper_0e0i(pmon, sa);
 #endif
@@ -25094,7 +25094,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
             gen_shift_imm(ctx, op1, rd, rt, sa);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -25112,7 +25112,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
             gen_shift_imm(ctx, op1, rd, rt, sa);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -25144,7 +25144,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
             gen_shift(ctx, op1, rd, rs, rt);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -25209,7 +25209,7 @@ static void gen_mmi_pcpyh(DisasContext *ctx)
     rd = extract32(opcode, 11, 5);
 
     if (unlikely(pd != 0)) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     } else if (rd == 0) {
         /* nop */
     } else if (rt == 0) {
@@ -26416,16 +26416,16 @@ static void decode_opc_mxu__pool00(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_Q8SLT:
         /* TODO: Implement emulation of Q8SLT instruction. */
         MIPS_INVAL("OPC_MXU_Q8SLT");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_Q8SLTU:
         /* TODO: Implement emulation of Q8SLTU instruction. */
         MIPS_INVAL("OPC_MXU_Q8SLTU");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -26455,41 +26455,41 @@ static void decode_opc_mxu__pool01(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_S32SLT:
         /* TODO: Implement emulation of S32SLT instruction. */
         MIPS_INVAL("OPC_MXU_S32SLT");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_D16SLT:
         /* TODO: Implement emulation of D16SLT instruction. */
         MIPS_INVAL("OPC_MXU_D16SLT");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_D16AVG:
         /* TODO: Implement emulation of D16AVG instruction. */
         MIPS_INVAL("OPC_MXU_D16AVG");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_D16AVGR:
         /* TODO: Implement emulation of D16AVGR instruction. */
         MIPS_INVAL("OPC_MXU_D16AVGR");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_Q8AVG:
         /* TODO: Implement emulation of Q8AVG instruction. */
         MIPS_INVAL("OPC_MXU_Q8AVG");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_Q8AVGR:
         /* TODO: Implement emulation of Q8AVGR instruction. */
         MIPS_INVAL("OPC_MXU_Q8AVGR");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_Q8ADD:
         /* TODO: Implement emulation of Q8ADD instruction. */
         MIPS_INVAL("OPC_MXU_Q8ADD");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -26512,26 +26512,26 @@ static void decode_opc_mxu__pool02(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_S32CPS:
         /* TODO: Implement emulation of S32CPS instruction. */
         MIPS_INVAL("OPC_MXU_S32CPS");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_D16CPS:
         /* TODO: Implement emulation of D16CPS instruction. */
         MIPS_INVAL("OPC_MXU_D16CPS");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_Q8ABD:
         /* TODO: Implement emulation of Q8ABD instruction. */
         MIPS_INVAL("OPC_MXU_Q8ABD");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_Q16SAT:
         /* TODO: Implement emulation of Q16SAT instruction. */
         MIPS_INVAL("OPC_MXU_Q16SAT");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -26561,16 +26561,16 @@ static void decode_opc_mxu__pool03(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_D16MULF:
         /* TODO: Implement emulation of D16MULF instruction. */
         MIPS_INVAL("OPC_MXU_D16MULF");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_D16MULE:
         /* TODO: Implement emulation of D16MULE instruction. */
         MIPS_INVAL("OPC_MXU_D16MULE");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -26596,7 +26596,7 @@ static void decode_opc_mxu__pool04(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -26619,16 +26619,16 @@ static void decode_opc_mxu__pool05(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_S32STD:
         /* TODO: Implement emulation of S32STD instruction. */
         MIPS_INVAL("OPC_MXU_S32STD");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_S32STDR:
         /* TODO: Implement emulation of S32STDR instruction. */
         MIPS_INVAL("OPC_MXU_S32STDR");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -26651,16 +26651,16 @@ static void decode_opc_mxu__pool06(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_S32LDDV:
         /* TODO: Implement emulation of S32LDDV instruction. */
         MIPS_INVAL("OPC_MXU_S32LDDV");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_S32LDDVR:
         /* TODO: Implement emulation of S32LDDVR instruction. */
         MIPS_INVAL("OPC_MXU_S32LDDVR");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -26683,16 +26683,16 @@ static void decode_opc_mxu__pool07(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_S32STDV:
         /* TODO: Implement emulation of S32TDV instruction. */
         MIPS_INVAL("OPC_MXU_S32TDV");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_S32STDVR:
         /* TODO: Implement emulation of S32TDVR instruction. */
         MIPS_INVAL("OPC_MXU_S32TDVR");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -26715,16 +26715,16 @@ static void decode_opc_mxu__pool08(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_S32LDI:
         /* TODO: Implement emulation of S32LDI instruction. */
         MIPS_INVAL("OPC_MXU_S32LDI");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_S32LDIR:
         /* TODO: Implement emulation of S32LDIR instruction. */
         MIPS_INVAL("OPC_MXU_S32LDIR");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -26747,16 +26747,16 @@ static void decode_opc_mxu__pool09(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_S32SDI:
         /* TODO: Implement emulation of S32SDI instruction. */
         MIPS_INVAL("OPC_MXU_S32SDI");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_S32SDIR:
         /* TODO: Implement emulation of S32SDIR instruction. */
         MIPS_INVAL("OPC_MXU_S32SDIR");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -26779,16 +26779,16 @@ static void decode_opc_mxu__pool10(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_S32LDIV:
         /* TODO: Implement emulation of S32LDIV instruction. */
         MIPS_INVAL("OPC_MXU_S32LDIV");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_S32LDIVR:
         /* TODO: Implement emulation of S32LDIVR instruction. */
         MIPS_INVAL("OPC_MXU_S32LDIVR");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -26811,16 +26811,16 @@ static void decode_opc_mxu__pool11(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_S32SDIV:
         /* TODO: Implement emulation of S32SDIV instruction. */
         MIPS_INVAL("OPC_MXU_S32SDIV");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_S32SDIVR:
         /* TODO: Implement emulation of S32SDIVR instruction. */
         MIPS_INVAL("OPC_MXU_S32SDIVR");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -26843,21 +26843,21 @@ static void decode_opc_mxu__pool12(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_D32ACC:
         /* TODO: Implement emulation of D32ACC instruction. */
         MIPS_INVAL("OPC_MXU_D32ACC");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_D32ACCM:
         /* TODO: Implement emulation of D32ACCM instruction. */
         MIPS_INVAL("OPC_MXU_D32ACCM");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_D32ASUM:
         /* TODO: Implement emulation of D32ASUM instruction. */
         MIPS_INVAL("OPC_MXU_D32ASUM");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -26880,21 +26880,21 @@ static void decode_opc_mxu__pool13(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_Q16ACC:
         /* TODO: Implement emulation of Q16ACC instruction. */
         MIPS_INVAL("OPC_MXU_Q16ACC");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_Q16ACCM:
         /* TODO: Implement emulation of Q16ACCM instruction. */
         MIPS_INVAL("OPC_MXU_Q16ACCM");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_Q16ASUM:
         /* TODO: Implement emulation of Q16ASUM instruction. */
         MIPS_INVAL("OPC_MXU_Q16ASUM");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -26924,21 +26924,21 @@ static void decode_opc_mxu__pool14(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_Q8ADDE:
         /* TODO: Implement emulation of Q8ADDE instruction. */
         MIPS_INVAL("OPC_MXU_Q8ADDE");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_D8SUM:
         /* TODO: Implement emulation of D8SUM instruction. */
         MIPS_INVAL("OPC_MXU_D8SUM");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_D8SUMC:
         /* TODO: Implement emulation of D8SUMC instruction. */
         MIPS_INVAL("OPC_MXU_D8SUMC");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -26968,26 +26968,26 @@ static void decode_opc_mxu__pool15(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_S32MUL:
         /* TODO: Implement emulation of S32MUL instruction. */
         MIPS_INVAL("OPC_MXU_S32MUL");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_S32MULU:
         /* TODO: Implement emulation of S32MULU instruction. */
         MIPS_INVAL("OPC_MXU_S32MULU");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_S32EXTR:
         /* TODO: Implement emulation of S32EXTR instruction. */
         MIPS_INVAL("OPC_MXU_S32EXTR");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_S32EXTRV:
         /* TODO: Implement emulation of S32EXTRV instruction. */
         MIPS_INVAL("OPC_MXU_S32EXTRV");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -27035,12 +27035,12 @@ static void decode_opc_mxu__pool16(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_D32SARW:
         /* TODO: Implement emulation of D32SARW instruction. */
         MIPS_INVAL("OPC_MXU_D32SARW");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_S32ALN:
         /* TODO: Implement emulation of S32ALN instruction. */
         MIPS_INVAL("OPC_MXU_S32ALN");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_S32ALNI:
         gen_mxu_S32ALNI(ctx);
@@ -27048,7 +27048,7 @@ static void decode_opc_mxu__pool16(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_S32LUI:
         /* TODO: Implement emulation of S32LUI instruction. */
         MIPS_INVAL("OPC_MXU_S32LUI");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_S32NOR:
         gen_mxu_S32NOR(ctx);
@@ -27064,7 +27064,7 @@ static void decode_opc_mxu__pool16(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -27087,31 +27087,31 @@ static void decode_opc_mxu__pool17(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_LXW:
         /* TODO: Implement emulation of LXW instruction. */
         MIPS_INVAL("OPC_MXU_LXW");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_LXH:
         /* TODO: Implement emulation of LXH instruction. */
         MIPS_INVAL("OPC_MXU_LXH");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_LXHU:
         /* TODO: Implement emulation of LXHU instruction. */
         MIPS_INVAL("OPC_MXU_LXHU");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_LXB:
         /* TODO: Implement emulation of LXB instruction. */
         MIPS_INVAL("OPC_MXU_LXB");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_LXBU:
         /* TODO: Implement emulation of LXBU instruction. */
         MIPS_INVAL("OPC_MXU_LXBU");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -27133,36 +27133,36 @@ static void decode_opc_mxu__pool18(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_D32SLLV:
         /* TODO: Implement emulation of D32SLLV instruction. */
         MIPS_INVAL("OPC_MXU_D32SLLV");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_D32SLRV:
         /* TODO: Implement emulation of D32SLRV instruction. */
         MIPS_INVAL("OPC_MXU_D32SLRV");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_D32SARV:
         /* TODO: Implement emulation of D32SARV instruction. */
         MIPS_INVAL("OPC_MXU_D32SARV");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_Q16SLLV:
         /* TODO: Implement emulation of Q16SLLV instruction. */
         MIPS_INVAL("OPC_MXU_Q16SLLV");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_Q16SLRV:
         /* TODO: Implement emulation of Q16SLRV instruction. */
         MIPS_INVAL("OPC_MXU_Q16SLRV");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_Q16SARV:
         /* TODO: Implement emulation of Q16SARV instruction. */
         MIPS_INVAL("OPC_MXU_Q16SARV");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -27188,7 +27188,7 @@ static void decode_opc_mxu__pool19(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -27211,36 +27211,36 @@ static void decode_opc_mxu__pool20(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_Q8MOVZ:
         /* TODO: Implement emulation of Q8MOVZ instruction. */
         MIPS_INVAL("OPC_MXU_Q8MOVZ");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_Q8MOVN:
         /* TODO: Implement emulation of Q8MOVN instruction. */
         MIPS_INVAL("OPC_MXU_Q8MOVN");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_D16MOVZ:
         /* TODO: Implement emulation of D16MOVZ instruction. */
         MIPS_INVAL("OPC_MXU_D16MOVZ");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_D16MOVN:
         /* TODO: Implement emulation of D16MOVN instruction. */
         MIPS_INVAL("OPC_MXU_D16MOVN");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_S32MOVZ:
         /* TODO: Implement emulation of S32MOVZ instruction. */
         MIPS_INVAL("OPC_MXU_S32MOVZ");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_S32MOVN:
         /* TODO: Implement emulation of S32MOVN instruction. */
         MIPS_INVAL("OPC_MXU_S32MOVN");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -27263,16 +27263,16 @@ static void decode_opc_mxu__pool21(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_Q8MAC:
         /* TODO: Implement emulation of Q8MAC instruction. */
         MIPS_INVAL("OPC_MXU_Q8MAC");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_Q8MACSU:
         /* TODO: Implement emulation of Q8MACSU instruction. */
         MIPS_INVAL("OPC_MXU_Q8MACSU");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -27331,12 +27331,12 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
         case OPC_MXU_S32MADD:
             /* TODO: Implement emulation of S32MADD instruction. */
             MIPS_INVAL("OPC_MXU_S32MADD");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_S32MADDU:
             /* TODO: Implement emulation of S32MADDU instruction. */
             MIPS_INVAL("OPC_MXU_S32MADDU");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU__POOL00:
             decode_opc_mxu__pool00(env, ctx);
@@ -27344,12 +27344,12 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
         case OPC_MXU_S32MSUB:
             /* TODO: Implement emulation of S32MSUB instruction. */
             MIPS_INVAL("OPC_MXU_S32MSUB");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_S32MSUBU:
             /* TODO: Implement emulation of S32MSUBU instruction. */
             MIPS_INVAL("OPC_MXU_S32MSUBU");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU__POOL01:
             decode_opc_mxu__pool01(env, ctx);
@@ -27369,27 +27369,27 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
         case OPC_MXU_D16MACF:
             /* TODO: Implement emulation of D16MACF instruction. */
             MIPS_INVAL("OPC_MXU_D16MACF");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_D16MADL:
             /* TODO: Implement emulation of D16MADL instruction. */
             MIPS_INVAL("OPC_MXU_D16MADL");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_S16MAD:
             /* TODO: Implement emulation of S16MAD instruction. */
             MIPS_INVAL("OPC_MXU_S16MAD");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_Q16ADD:
             /* TODO: Implement emulation of Q16ADD instruction. */
             MIPS_INVAL("OPC_MXU_Q16ADD");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_D16MACE:
             /* TODO: Implement emulation of D16MACE instruction. */
             MIPS_INVAL("OPC_MXU_D16MACE");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU__POOL04:
             decode_opc_mxu__pool04(env, ctx);
@@ -27418,7 +27418,7 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
         case OPC_MXU_D32ADD:
             /* TODO: Implement emulation of D32ADD instruction. */
             MIPS_INVAL("OPC_MXU_D32ADD");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU__POOL12:
             decode_opc_mxu__pool12(env, ctx);
@@ -27432,7 +27432,7 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
         case OPC_MXU_Q8ACCE:
             /* TODO: Implement emulation of Q8ACCE instruction. */
             MIPS_INVAL("OPC_MXU_Q8ACCE");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_S8LDD:
             gen_mxu_s8ldd(ctx);
@@ -27440,17 +27440,17 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
         case OPC_MXU_S8STD:
             /* TODO: Implement emulation of S8STD instruction. */
             MIPS_INVAL("OPC_MXU_S8STD");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_S8LDI:
             /* TODO: Implement emulation of S8LDI instruction. */
             MIPS_INVAL("OPC_MXU_S8LDI");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_S8SDI:
             /* TODO: Implement emulation of S8SDI instruction. */
             MIPS_INVAL("OPC_MXU_S8SDI");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU__POOL15:
             decode_opc_mxu__pool15(env, ctx);
@@ -27464,52 +27464,52 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
         case OPC_MXU_S16LDD:
             /* TODO: Implement emulation of S16LDD instruction. */
             MIPS_INVAL("OPC_MXU_S16LDD");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_S16STD:
             /* TODO: Implement emulation of S16STD instruction. */
             MIPS_INVAL("OPC_MXU_S16STD");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_S16LDI:
             /* TODO: Implement emulation of S16LDI instruction. */
             MIPS_INVAL("OPC_MXU_S16LDI");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_S16SDI:
             /* TODO: Implement emulation of S16SDI instruction. */
             MIPS_INVAL("OPC_MXU_S16SDI");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_D32SLL:
             /* TODO: Implement emulation of D32SLL instruction. */
             MIPS_INVAL("OPC_MXU_D32SLL");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_D32SLR:
             /* TODO: Implement emulation of D32SLR instruction. */
             MIPS_INVAL("OPC_MXU_D32SLR");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_D32SARL:
             /* TODO: Implement emulation of D32SARL instruction. */
             MIPS_INVAL("OPC_MXU_D32SARL");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_D32SAR:
             /* TODO: Implement emulation of D32SAR instruction. */
             MIPS_INVAL("OPC_MXU_D32SAR");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_Q16SLL:
             /* TODO: Implement emulation of Q16SLL instruction. */
             MIPS_INVAL("OPC_MXU_Q16SLL");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_Q16SLR:
             /* TODO: Implement emulation of Q16SLR instruction. */
             MIPS_INVAL("OPC_MXU_Q16SLR");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU__POOL18:
             decode_opc_mxu__pool18(env, ctx);
@@ -27517,7 +27517,7 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
         case OPC_MXU_Q16SAR:
             /* TODO: Implement emulation of Q16SAR instruction. */
             MIPS_INVAL("OPC_MXU_Q16SAR");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU__POOL19:
             decode_opc_mxu__pool19(env, ctx);
@@ -27531,26 +27531,26 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
         case OPC_MXU_Q16SCOP:
             /* TODO: Implement emulation of Q16SCOP instruction. */
             MIPS_INVAL("OPC_MXU_Q16SCOP");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_Q8MADL:
             /* TODO: Implement emulation of Q8MADL instruction. */
             MIPS_INVAL("OPC_MXU_Q8MADL");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_S32SFL:
             /* TODO: Implement emulation of S32SFL instruction. */
             MIPS_INVAL("OPC_MXU_S32SFL");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_Q8SAD:
             /* TODO: Implement emulation of Q8SAD instruction. */
             MIPS_INVAL("OPC_MXU_Q8SAD");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         default:
             MIPS_INVAL("decode_opc_mxu");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
 
         gen_set_label(l_exit);
@@ -27629,7 +27629,7 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
 #endif
     default:            /* Invalid */
         MIPS_INVAL("special2_legacy");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -27651,7 +27651,7 @@ static void decode_opc_special3_r6(CPUMIPSState *env, DisasContext *ctx)
     case R6_OPC_PREF:
         if (rt >= 24) {
             /* hint codes 24-31 are reserved and signal RI */
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
         /* Treat as NOP. */
         break;
@@ -27690,7 +27690,7 @@ static void decode_opc_special3_r6(CPUMIPSState *env, DisasContext *ctx)
 #ifndef CONFIG_USER_ONLY
     case OPC_GINV:
         if (unlikely(ctx->gi <= 1)) {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
         check_cp0_enabled(ctx);
         switch ((ctx->opcode >> 6) & 3) {
@@ -27701,7 +27701,7 @@ static void decode_opc_special3_r6(CPUMIPSState *env, DisasContext *ctx)
             gen_helper_0e1i(ginvt, cpu_gpr[rs], extract32(ctx->opcode, 8, 2));
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -27742,7 +27742,7 @@ static void decode_opc_special3_r6(CPUMIPSState *env, DisasContext *ctx)
 #endif
     default:            /* Invalid */
         MIPS_INVAL("special3_r6");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -27793,13 +27793,13 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
                 break;
             default:
                 MIPS_INVAL("MASK ADDUH.QB");
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
         } else if (ctx->insn_flags & INSN_LOONGSON2E) {
             gen_loongson_integer(ctx, op1, rd, rs, rt);
         } else {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
         break;
     case OPC_LX_DSP:
@@ -27815,7 +27815,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK LX");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -27846,7 +27846,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:
             MIPS_INVAL("MASK ABSQ_S.PH");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -27883,7 +27883,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK ADDU.QB");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
 
         }
@@ -27923,7 +27923,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK CMPU.EQ.QB");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -27959,7 +27959,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK DPAW.PH");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -27989,7 +27989,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             }
         default:            /* Invalid */
             MIPS_INVAL("MASK INSV");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -28024,7 +28024,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK EXTR.W");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -28070,7 +28070,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK ABSQ_S.QH");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -28109,7 +28109,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK ADDU.OB");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -28154,7 +28154,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK CMPU_EQ.OB");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -28191,7 +28191,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK EXTR.W");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -28230,7 +28230,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK DPAQ.W.QH");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -28260,7 +28260,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
         }
         default:            /* Invalid */
             MIPS_INVAL("MASK DINSV");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -28270,7 +28270,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
 #endif
     default:            /* Invalid */
         MIPS_INVAL("special3_legacy");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -28308,11 +28308,11 @@ static void decode_mmi0(CPUMIPSState *env, DisasContext *ctx)
     case MMI_OPC_0_PPACB:     /* TODO: MMI_OPC_0_PPACB */
     case MMI_OPC_0_PEXT5:     /* TODO: MMI_OPC_0_PEXT5 */
     case MMI_OPC_0_PPAC5:     /* TODO: MMI_OPC_0_PPAC5 */
-        generate_exception_end(ctx, EXCP_RI); /* TODO: MMI_OPC_CLASS_MMI0 */
+        gen_reserved_instruction(ctx); /* TODO: MMI_OPC_CLASS_MMI0 */
         break;
     default:
         MIPS_INVAL("TX79 MMI class MMI0");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -28340,11 +28340,11 @@ static void decode_mmi1(CPUMIPSState *env, DisasContext *ctx)
     case MMI_OPC_1_PSUBUB:    /* TODO: MMI_OPC_1_PSUBUB */
     case MMI_OPC_1_PEXTUB:    /* TODO: MMI_OPC_1_PEXTUB */
     case MMI_OPC_1_QFSRV:     /* TODO: MMI_OPC_1_QFSRV */
-        generate_exception_end(ctx, EXCP_RI); /* TODO: MMI_OPC_CLASS_MMI1 */
+        gen_reserved_instruction(ctx); /* TODO: MMI_OPC_CLASS_MMI1 */
         break;
     default:
         MIPS_INVAL("TX79 MMI class MMI1");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -28375,14 +28375,14 @@ static void decode_mmi2(CPUMIPSState *env, DisasContext *ctx)
     case MMI_OPC_2_PDIVBW:    /* TODO: MMI_OPC_2_PDIVBW */
     case MMI_OPC_2_PEXEW:     /* TODO: MMI_OPC_2_PEXEW */
     case MMI_OPC_2_PROT3W:    /* TODO: MMI_OPC_2_PROT3W */
-        generate_exception_end(ctx, EXCP_RI); /* TODO: MMI_OPC_CLASS_MMI2 */
+        gen_reserved_instruction(ctx); /* TODO: MMI_OPC_CLASS_MMI2 */
         break;
     case MMI_OPC_2_PCPYLD:
         gen_mmi_pcpyld(ctx);
         break;
     default:
         MIPS_INVAL("TX79 MMI class MMI2");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -28403,7 +28403,7 @@ static void decode_mmi3(CPUMIPSState *env, DisasContext *ctx)
     case MMI_OPC_3_PNOR:       /* TODO: MMI_OPC_3_PNOR */
     case MMI_OPC_3_PEXCH:      /* TODO: MMI_OPC_3_PEXCH */
     case MMI_OPC_3_PEXCW:      /* TODO: MMI_OPC_3_PEXCW */
-        generate_exception_end(ctx, EXCP_RI); /* TODO: MMI_OPC_CLASS_MMI3 */
+        gen_reserved_instruction(ctx); /* TODO: MMI_OPC_CLASS_MMI3 */
         break;
     case MMI_OPC_3_PCPYH:
         gen_mmi_pcpyh(ctx);
@@ -28413,7 +28413,7 @@ static void decode_mmi3(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("TX79 MMI class MMI3");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -28467,23 +28467,23 @@ static void decode_mmi(CPUMIPSState *env, DisasContext *ctx)
     case MMI_OPC_PSLLW:         /* TODO: MMI_OPC_PSLLW */
     case MMI_OPC_PSRLW:         /* TODO: MMI_OPC_PSRLW */
     case MMI_OPC_PSRAW:         /* TODO: MMI_OPC_PSRAW */
-        generate_exception_end(ctx, EXCP_RI);    /* TODO: MMI_OPC_CLASS_MMI */
+        gen_reserved_instruction(ctx);    /* TODO: MMI_OPC_CLASS_MMI */
         break;
     default:
         MIPS_INVAL("TX79 MMI class");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
 
 static void gen_mmi_lq(CPUMIPSState *env, DisasContext *ctx)
 {
-    generate_exception_end(ctx, EXCP_RI);    /* TODO: MMI_OPC_LQ */
+    gen_reserved_instruction(ctx);    /* TODO: MMI_OPC_LQ */
 }
 
 static void gen_mmi_sq(DisasContext *ctx, int base, int rt, int offset)
 {
-    generate_exception_end(ctx, EXCP_RI);    /* TODO: MMI_OPC_SQ */
+    gen_reserved_instruction(ctx);    /* TODO: MMI_OPC_SQ */
 }
 
 /*
@@ -28691,7 +28691,7 @@ static inline int check_msa_access(DisasContext *ctx)
 {
     if (unlikely((ctx->hflags & MIPS_HFLAG_FPU) &&
                  !(ctx->hflags & MIPS_HFLAG_F64))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return 0;
     }
 
@@ -28700,7 +28700,7 @@ static inline int check_msa_access(DisasContext *ctx)
             generate_exception_end(ctx, EXCP_MSADIS);
             return 0;
         } else {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             return 0;
         }
     }
@@ -28757,7 +28757,7 @@ static void gen_msa_branch(CPUMIPSState *env, DisasContext *ctx, uint32_t op1)
     check_msa_access(ctx);
 
     if (ctx->hflags & MIPS_HFLAG_BMASK) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
     switch (op1) {
@@ -28832,7 +28832,7 @@ static void gen_msa_i8(CPUMIPSState *env, DisasContext *ctx)
         {
             uint8_t df = (ctx->opcode >> 24) & 0x3;
             if (df == DF_DOUBLE) {
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
             } else {
                 TCGv_i32 tdf = tcg_const_i32(df);
                 gen_helper_msa_shf_df(cpu_env, tdf, twd, tws, ti8);
@@ -28842,7 +28842,7 @@ static void gen_msa_i8(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -28914,7 +28914,7 @@ static void gen_msa_i5(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -28950,7 +28950,7 @@ static void gen_msa_bit(CPUMIPSState *env, DisasContext *ctx)
         m = dfm & 0x7;
         df = DF_BYTE;
     } else {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 
@@ -28998,7 +28998,7 @@ static void gen_msa_bit(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -29843,7 +29843,7 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
     case OPC_HSUB_S_df:
     case OPC_HSUB_U_df:
         if (df == DF_BYTE) {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         switch (MASK_MSA_3R(ctx->opcode)) {
@@ -29981,7 +29981,7 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
     tcg_temp_free_i32(twd);
@@ -30013,7 +30013,7 @@ static void gen_msa_elm_3e(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -30050,12 +30050,12 @@ static void gen_msa_elm_df(CPUMIPSState *env, DisasContext *ctx, uint32_t df,
 #if !defined(TARGET_MIPS64)
         /* Double format valid only for MIPS64 */
         if (df == DF_DOUBLE) {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         if ((MASK_MSA_ELM(ctx->opcode) == OPC_COPY_U_df) &&
               (df == DF_WORD)) {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
 #endif
@@ -30125,7 +30125,7 @@ static void gen_msa_elm_df(CPUMIPSState *env, DisasContext *ctx, uint32_t df,
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
     tcg_temp_free_i32(twd);
     tcg_temp_free_i32(tws);
@@ -30155,7 +30155,7 @@ static void gen_msa_elm(CPUMIPSState *env, DisasContext *ctx)
         gen_msa_elm_3e(env, ctx);
         return;
     } else {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 
@@ -30310,7 +30310,7 @@ static void gen_msa_3rf(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -30338,7 +30338,7 @@ static void gen_msa_2r(CPUMIPSState *env, DisasContext *ctx)
 #if !defined(TARGET_MIPS64)
         /* Double format valid only for MIPS64 */
         if (df == DF_DOUBLE) {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
 #endif
@@ -30394,7 +30394,7 @@ static void gen_msa_2r(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -30509,7 +30509,7 @@ static void gen_msa_vec_v(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -30538,7 +30538,7 @@ static void gen_msa_vec(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -30636,7 +30636,7 @@ static void gen_msa(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -30720,7 +30720,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
                     /* OPC_NAL, OPC_BAL */
                     gen_compute_branch(ctx, op1, 4, 0, -1, imm << 2, 4);
                 } else {
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                 }
             } else {
                 gen_compute_branch(ctx, op1, 4, rs, -1, imm << 2, 4);
@@ -30739,7 +30739,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
             break;
         case OPC_SIGRIE:
             check_insn(ctx, ISA_MIPS32R6);
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_SYNCI:
             check_insn(ctx, ISA_MIPS32R2);
@@ -30774,7 +30774,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
 #endif
         default:            /* Invalid */
             MIPS_INVAL("regimm");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -30883,7 +30883,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
                     break;
                 default:            /* Invalid */
                     MIPS_INVAL("mfmc0");
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                     break;
                 }
                 tcg_temp_free(t0);
@@ -30900,7 +30900,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:
             MIPS_INVAL("cp0");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -30936,7 +30936,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
     case OPC_BLEZC: /* OPC_BGEZC, OPC_BGEC, OPC_BLEZL */
         if (ctx->insn_flags & ISA_MIPS32R6) {
             if (rt == 0) {
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
             /* OPC_BLEZC, OPC_BGEZC, OPC_BGEC */
@@ -30949,7 +30949,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
     case OPC_BGTZC: /* OPC_BLTZC, OPC_BLTC, OPC_BGTZL */
         if (ctx->insn_flags & ISA_MIPS32R6) {
             if (rt == 0) {
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
             /* OPC_BGTZC, OPC_BLTZC, OPC_BLTC */
@@ -31198,7 +31198,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:
             MIPS_INVAL("cp1");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -31284,7 +31284,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
                 break;
             default:
                 MIPS_INVAL("cp3");
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
         } else {
@@ -31349,7 +31349,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_compute_compact_branch(ctx, op, rs, rt, imm << 2);
         } else {
             MIPS_INVAL("major opcode");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
         break;
 #endif
@@ -31367,7 +31367,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
                 tcg_temp_free(t0);
             }
 #else
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             MIPS_INVAL("major opcode");
 #endif
         } else {
@@ -31393,7 +31393,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:            /* Invalid */
         MIPS_INVAL("major opcode");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -31498,7 +31498,7 @@ static void mips_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         ctx->opcode = cpu_lduw_code(env, ctx->base.pc_next);
         insn_bytes = decode_mips16_opc(env, ctx);
     } else {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         g_assert(ctx->base.is_jmp == DISAS_NORETURN);
         return;
     }
-- 
2.26.2



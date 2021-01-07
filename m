Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B2F2EE927
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:49:20 +0100 (CET)
Received: from localhost ([::1]:45522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxe5n-0001ia-17
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdix-0001HT-DD
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:43 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdit-0005gh-O2
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:43 -0500
Received: by mail-wr1-x430.google.com with SMTP id r3so7142274wrt.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iP/yQoC1cC5h4WW93lkmoKE9d3fh72SY6xP1uvGMMus=;
 b=utJOYDZg6XKw+KkqbJ763aS2EPNB2GOad/LxuEkpTp4tSSY6dq2wwJ2YkgrmTUS6S3
 OjORntCMJ1lDIph9xEtaLjb1Z+skrj826mEnsMDIhgd0Vrb8DWz3WxMDFCpDcZtC8UDm
 vfu8i9mfdW4lByFb3GYfOXAB6OkDznpztDCyoXo98vc0S+QP2oUW6EKZP9NHGA9dBG2m
 hJovz6BzVUhYvow44TukNNB3wghNV9E8MKux5UnrIe9i2b8DHIytocqMvTAz1UBJg+jz
 36vuvNUTp1tYWpS1t3fRhoSXduNBelGri88FtbGpzxDSsOLqAz0HH/U52GZ8R1aJ4tYW
 k3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iP/yQoC1cC5h4WW93lkmoKE9d3fh72SY6xP1uvGMMus=;
 b=lPLJGTRwESolMBpJVZ0cRXF7xea/VlO5S/gGwQhHk9srQg1Q4aauv14fsJlqixHWMR
 m9swblbnjqQAqQY+zwXiXA3ngf0CCqhRGfzS0g3JV+x5+5Aq/1vHon/UI9Nk6OwgaKG0
 DH6RyomQL0DqNL0LlMpIBi/RlEr51zCiPG5pAnyifDOAIxN0OMfgNTOUZLf60+Jdt1U9
 hDevDmg5stJ9sbFU1d95VbUNsCoR04rQYbJK2hGxPZGDQ9YDSzQKSra36/I/u2kT2QnC
 4xES1OcLWNHAynSdXI9aTdwzQk48hek+DQEc1TKL+or+CZaV4rUFWIfhP90cQrVbtC9p
 91uw==
X-Gm-Message-State: AOAM530KeR+Il8+XAbnzTLlV5rfp4OqfBw0cWmsEFklFkccdEkKnP4Mu
 zyRkfJyhljcrSwpVbKqErS1yL8OBuPY=
X-Google-Smtp-Source: ABdhPJxkKq6yQzdrlG9eIC2WHLlijAmyslqLgl9VgulSHcaQSnlx0gmORs1FIjup5Px30rhElcVcJg==
X-Received: by 2002:adf:a543:: with SMTP id j3mr635715wrb.175.1610058336798;
 Thu, 07 Jan 2021 14:25:36 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id k10sm9756189wrq.38.2021.01.07.14.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:25:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/66] target/mips: Replace gen_exception_end(EXCP_RI) by
 gen_rsvd_instruction
Date: Thu,  7 Jan 2021 23:22:18 +0100
Message-Id: <20210107222253.20382-32-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gen_reserved_instruction() is easier to read than
generate_exception_end(ctx, EXCP_RI), replace it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201214183739.500368-12-f4bug@amsat.org>
---
 target/mips/translate.h |   1 +
 target/mips/translate.c | 729 ++++++++++++++++++++--------------------
 2 files changed, 368 insertions(+), 362 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index d9d4d3943af..5f744c63374 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -55,6 +55,7 @@ typedef struct DisasContext {
 void generate_exception(DisasContext *ctx, int excp);
 void generate_exception_err(DisasContext *ctx, int excp, int err);
 void generate_exception_end(DisasContext *ctx, int excp);
+void gen_reserved_instruction(DisasContext *ctx);
 void check_insn(DisasContext *ctx, uint64_t flags);
 #ifdef TARGET_MIPS64
 void check_mips_64(DisasContext *ctx);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 445858591a4..7c20ed33df7 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2762,6 +2762,11 @@ void generate_exception_end(DisasContext *ctx, int excp)
     generate_exception_err(ctx, excp, 0);
 }
 
+void gen_reserved_instruction(DisasContext *ctx)
+{
+    generate_exception_end(ctx, EXCP_RI);
+}
+
 /* Floating point register moves. */
 static void gen_load_fpr32(DisasContext *ctx, TCGv_i32 t, int reg)
 {
@@ -2917,7 +2922,7 @@ static inline void check_cp1_enabled(DisasContext *ctx)
 static inline void check_cop1x(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_COP1X))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 
@@ -2928,7 +2933,7 @@ static inline void check_cop1x(DisasContext *ctx)
 static inline void check_cp1_64bitmode(DisasContext *ctx)
 {
     if (unlikely(~ctx->hflags & (MIPS_HFLAG_F64 | MIPS_HFLAG_COP1X))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 
@@ -2946,7 +2951,7 @@ static inline void check_cp1_64bitmode(DisasContext *ctx)
 static inline void check_cp1_registers(DisasContext *ctx, int regs)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_F64) && (regs & 1))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 
@@ -2960,7 +2965,7 @@ static inline void check_dsp(DisasContext *ctx)
         if (ctx->insn_flags & ASE_DSP) {
             generate_exception_end(ctx, EXCP_DSPDIS);
         } else {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
     }
 }
@@ -2971,7 +2976,7 @@ static inline void check_dsp_r2(DisasContext *ctx)
         if (ctx->insn_flags & ASE_DSP) {
             generate_exception_end(ctx, EXCP_DSPDIS);
         } else {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
     }
 }
@@ -2982,7 +2987,7 @@ static inline void check_dsp_r3(DisasContext *ctx)
         if (ctx->insn_flags & ASE_DSP) {
             generate_exception_end(ctx, EXCP_DSPDIS);
         } else {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
     }
 }
@@ -2994,7 +2999,7 @@ static inline void check_dsp_r3(DisasContext *ctx)
 void check_insn(DisasContext *ctx, uint64_t flags)
 {
     if (unlikely(!(ctx->insn_flags & flags))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 
@@ -3006,7 +3011,7 @@ void check_insn(DisasContext *ctx, uint64_t flags)
 static inline void check_insn_opc_removed(DisasContext *ctx, uint64_t flags)
 {
     if (unlikely(ctx->insn_flags & flags)) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 
@@ -3045,7 +3050,7 @@ static inline void check_ps(DisasContext *ctx)
 void check_mips_64(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_64))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 #endif
@@ -3066,7 +3071,7 @@ static inline void check_mvh(DisasContext *ctx)
 static inline void check_xnp(DisasContext *ctx)
 {
     if (unlikely(ctx->CP0_Config5 & (1 << CP0C5_XNP))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 
@@ -3078,7 +3083,7 @@ static inline void check_xnp(DisasContext *ctx)
 static inline void check_pw(DisasContext *ctx)
 {
     if (unlikely(!(ctx->CP0_Config3 & (1 << CP0C3_PW)))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 #endif
@@ -3090,7 +3095,7 @@ static inline void check_pw(DisasContext *ctx)
 static inline void check_mt(DisasContext *ctx)
 {
     if (unlikely(!(ctx->CP0_Config3 & (1 << CP0C3_MT)))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 
@@ -3107,7 +3112,7 @@ static inline void check_cp0_mt(DisasContext *ctx)
         generate_exception_end(ctx, EXCP_CpU);
     } else {
         if (unlikely(!(ctx->CP0_Config3 & (1 << CP0C3_MT)))) {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
     }
 }
@@ -3120,7 +3125,7 @@ static inline void check_cp0_mt(DisasContext *ctx)
 static inline void check_nms(DisasContext *ctx)
 {
     if (unlikely(ctx->CP0_Config5 & (1 << CP0C5_NMS))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 
@@ -3137,7 +3142,7 @@ static inline void check_nms_dl_il_sl_tl_l2c(DisasContext *ctx)
                  !(ctx->CP0_Config2 & (1 << CP0C2_SL)) &&
                  !(ctx->CP0_Config2 & (1 << CP0C2_TL)) &&
                  !(ctx->CP0_Config5 & (1 << CP0C5_L2C)))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 
@@ -3148,7 +3153,7 @@ static inline void check_nms_dl_il_sl_tl_l2c(DisasContext *ctx)
 static inline void check_eva(DisasContext *ctx)
 {
     if (unlikely(!(ctx->CP0_Config5 & (1 << CP0C5_EVA)))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
 }
 
@@ -3813,7 +3818,7 @@ static void gen_flt_ldst(DisasContext *ctx, uint32_t opc, int ft,
         break;
     default:
         MIPS_INVAL("flt_ldst");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -4462,7 +4467,7 @@ static void gen_HILO1_tx79(DisasContext *ctx, uint32_t opc, int reg)
         break;
     default:
         MIPS_INVAL("mfthilo1 TX79");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -4597,7 +4602,7 @@ static inline void gen_pcrel(DisasContext *ctx, int opc, target_ulong pc,
 #endif
         default:
             MIPS_INVAL("OPC_PCREL");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -4808,7 +4813,7 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
 #endif
     default:
         MIPS_INVAL("r6 mul/div");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
  out:
@@ -4866,7 +4871,7 @@ static void gen_div1_tx79(DisasContext *ctx, uint32_t opc, int rs, int rt)
         break;
     default:
         MIPS_INVAL("div1 TX79");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
  out:
@@ -5059,7 +5064,7 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
         break;
     default:
         MIPS_INVAL("mul/div");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
  out:
@@ -5190,7 +5195,7 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
         break;
     default:
         MIPS_INVAL("mul/madd TXx9");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -5253,7 +5258,7 @@ static void gen_mul_vr54xx(DisasContext *ctx, uint32_t opc,
         break;
     default:
         MIPS_INVAL("mul vr54xx");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
     gen_store_gpr(t0, rd);
@@ -5879,7 +5884,7 @@ static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
         break;
     default:
         MIPS_INVAL("loongson_cp2");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 
@@ -6068,7 +6073,7 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
 #endif
         default:
             MIPS_INVAL("loongson_gsshfl");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -6116,13 +6121,13 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
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
@@ -6171,7 +6176,7 @@ static void gen_loongson_lsdc2(DisasContext *ctx, int rt,
         break;
     default:
         MIPS_INVAL("loongson_lsdc2");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
         break;
     }
@@ -6427,7 +6432,7 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc,
         LOG_DISAS("Branch in delay / forbidden slot at PC 0x"
                   TARGET_FMT_lx "\n", ctx->base.pc_next);
 #endif
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -6490,14 +6495,14 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc,
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
@@ -6562,7 +6567,7 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc,
             break;
         default:
             MIPS_INVAL("branch/jump");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             goto out;
         }
     } else {
@@ -6633,7 +6638,7 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc,
             break;
         default:
             MIPS_INVAL("conditional branch/jump");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             goto out;
         }
     }
@@ -6710,14 +6715,14 @@ static void gen_compute_branch_nm(DisasContext *ctx, uint32_t opc,
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
@@ -6750,7 +6755,7 @@ static void gen_compute_branch_nm(DisasContext *ctx, uint32_t opc,
             break;
         default:
             MIPS_INVAL("branch/jump");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             goto out;
         }
     } else {
@@ -6773,7 +6778,7 @@ static void gen_compute_branch_nm(DisasContext *ctx, uint32_t opc,
             break;
         default:
             MIPS_INVAL("conditional branch/jump");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             goto out;
         }
     }
@@ -6853,7 +6858,7 @@ static void gen_bitops(DisasContext *ctx, uint32_t opc, int rt,
     default:
 fail:
         MIPS_INVAL("bitops");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         tcg_temp_free(t0);
         tcg_temp_free(t1);
         return;
@@ -6931,7 +6936,7 @@ static void gen_bshfl(DisasContext *ctx, uint32_t op2, int rt, int rd)
 #endif
     default:
         MIPS_INVAL("bsfhl");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         tcg_temp_free(t0);
         return;
     }
@@ -10585,7 +10590,7 @@ static void gen_mftr(CPUMIPSState *env, DisasContext *ctx, int rt, int rd,
 die:
     tcg_temp_free(t0);
     LOG_DISAS("mftr (reg %d u %d sel %d h %d)\n", rt, u, sel, h);
-    generate_exception_end(ctx, EXCP_RI);
+    gen_reserved_instruction(ctx);
 }
 
 static void gen_mttr(CPUMIPSState *env, DisasContext *ctx, int rd, int rt,
@@ -10795,7 +10800,7 @@ static void gen_mttr(CPUMIPSState *env, DisasContext *ctx, int rd, int rt,
 die:
     tcg_temp_free(t0);
     LOG_DISAS("mttr (reg %d u %d sel %d h %d)\n", rd, u, sel, h);
-    generate_exception_end(ctx, EXCP_RI);
+    gen_reserved_instruction(ctx);
 }
 
 static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
@@ -10955,7 +10960,7 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
         }
         if (!(ctx->hflags & MIPS_HFLAG_DM)) {
             MIPS_INVAL(opn);
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         } else {
             gen_helper_deret(cpu_env);
             ctx->base.is_jmp = DISAS_EXIT;
@@ -10978,7 +10983,7 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
     default:
  die:
         MIPS_INVAL(opn);
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
     (void)opn; /* avoid a compiler warning */
@@ -10993,7 +10998,7 @@ static void gen_compute_branch1(DisasContext *ctx, uint32_t op,
     TCGv_i32 t0 = tcg_temp_new_i32();
 
     if ((ctx->insn_flags & ISA_MIPS_R6) && (ctx->hflags & MIPS_HFLAG_BMASK)) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -11084,7 +11089,7 @@ static void gen_compute_branch1(DisasContext *ctx, uint32_t op,
         break;
     default:
         MIPS_INVAL("cp1 cond branch");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
     ctx->btarget = btarget;
@@ -11106,7 +11111,7 @@ static void gen_compute_branch1_r6(DisasContext *ctx, uint32_t op,
         LOG_DISAS("Branch in delay / forbidden slot at PC 0x" TARGET_FMT_lx
                   "\n", ctx->base.pc_next);
 #endif
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -11126,7 +11131,7 @@ static void gen_compute_branch1_r6(DisasContext *ctx, uint32_t op,
         break;
     default:
         MIPS_INVAL("cp1 cond branch");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -11434,7 +11439,7 @@ static void gen_cp1(DisasContext *ctx, uint32_t opc, int rt, int fs)
         break;
     default:
         MIPS_INVAL("cp1 move");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -11571,7 +11576,7 @@ static void gen_sel_s(DisasContext *ctx, enum fopcode op1, int fd, int ft,
         break;
     default:
         MIPS_INVAL("gen_sel_s");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -11608,7 +11613,7 @@ static void gen_sel_d(DisasContext *ctx, enum fopcode op1, int fd, int ft,
         break;
     default:
         MIPS_INVAL("gen_sel_d");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -13042,7 +13047,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
         break;
     default:
         MIPS_INVAL("farith");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 }
@@ -13381,7 +13386,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
         break;
     default:
         MIPS_INVAL("flt3_arith");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 }
@@ -13456,13 +13461,13 @@ static void gen_rdhwr(DisasContext *ctx, int rt, int rd, int sel)
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
@@ -13561,7 +13566,7 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
         LOG_DISAS("Branch in delay / forbidden slot at PC 0x" TARGET_FMT_lx
                   "\n", ctx->base.pc_next);
 #endif
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -13623,7 +13628,7 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
         break;
     default:
         MIPS_INVAL("Compact branch/jump");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -13644,7 +13649,7 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
             break;
         default:
             MIPS_INVAL("Compact branch/jump");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             goto out;
         }
 
@@ -13767,7 +13772,7 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
             break;
         default:
             MIPS_INVAL("Compact conditional branch/jump");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             goto out;
         }
 
@@ -13941,7 +13946,7 @@ static void gen_mips16_save(DisasContext *ctx,
         args = 4;
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 
@@ -14037,7 +14042,7 @@ static void gen_mips16_save(DisasContext *ctx,
         astatic = 4;
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 
@@ -14143,7 +14148,7 @@ static void gen_mips16_restore(DisasContext *ctx,
         astatic = 4;
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 
@@ -14174,7 +14179,7 @@ static void gen_addiupc(DisasContext *ctx, int rx, int imm,
     TCGv t0;
 
     if (extended && (ctx->hflags & MIPS_HFLAG_BMASK)) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 
@@ -14232,7 +14237,7 @@ static void decode_i64_mips16(DisasContext *ctx,
         check_insn(ctx, ISA_MIPS3);
         check_mips_64(ctx);
         if (extended && (ctx->hflags & MIPS_HFLAG_BMASK)) {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         } else {
             offset = extended ? offset : offset << 3;
             gen_ld(ctx, OPC_LDPC, ry, 0, offset);
@@ -14309,7 +14314,7 @@ static int decode_extended_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
             check_mips_64(ctx);
             gen_shift_imm(ctx, OPC_DSLL, rx, ry, sa);
 #else
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
 #endif
             break;
         case 0x2:
@@ -14337,7 +14342,7 @@ static int decode_extended_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
             check_mips_64(ctx);
             gen_arith_imm(ctx, OPC_DADDIU, ry, rx, imm);
 #else
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
 #endif
         } else {
             gen_arith_imm(ctx, OPC_ADDIU, ry, rx, imm);
@@ -14389,7 +14394,7 @@ static int decode_extended_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
             }
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -14452,7 +14457,7 @@ static int decode_extended_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
         break;
 #endif
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -14541,7 +14546,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
             check_mips_64(ctx);
             gen_shift_imm(ctx, OPC_DSLL, rx, ry, sa);
 #else
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
 #endif
             break;
         case 0x2:
@@ -14569,7 +14574,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
                 check_mips_64(ctx);
                 gen_arith_imm(ctx, OPC_DADDIU, ry, rx, imm);
 #else
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
 #endif
             } else {
                 gen_arith_imm(ctx, OPC_ADDIU, ry, rx, imm);
@@ -14653,7 +14658,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
                 gen_arith(ctx, OPC_ADDU, ry, reg32, 0);
                 break;
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
         }
@@ -14743,7 +14748,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
                 break;
 #endif
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 goto done;
             }
 
@@ -14860,7 +14865,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
                 break;
 #endif
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
             break;
@@ -14924,7 +14929,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
             break;
 #endif
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -14939,7 +14944,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
         break;
 #endif
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -15637,7 +15642,7 @@ static void gen_ldst_multiple(DisasContext *ctx, uint32_t opc, int reglist,
     TCGv_i32 t2;
 
     if (ctx->hflags & MIPS_HFLAG_BMASK) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 
@@ -15790,7 +15795,7 @@ static void gen_pool16c_insn(DisasContext *ctx)
         }
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -15935,7 +15940,7 @@ static void gen_ldst_pair(DisasContext *ctx, uint32_t opc, int rd,
     TCGv t0, t1;
 
     if (ctx->hflags & MIPS_HFLAG_BMASK || rd == 31) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 
@@ -15947,7 +15952,7 @@ static void gen_ldst_pair(DisasContext *ctx, uint32_t opc, int rd,
     switch (opc) {
     case LWP:
         if (rd == base) {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             return;
         }
         tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TESL);
@@ -15968,7 +15973,7 @@ static void gen_ldst_pair(DisasContext *ctx, uint32_t opc, int rd,
 #ifdef TARGET_MIPS64
     case LDP:
         if (rd == base) {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             return;
         }
         tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TEQ);
@@ -16313,7 +16318,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
             } else {
                 check_insn(ctx, ISA_MIPS_R1);
                 if (ctx->hflags & MIPS_HFLAG_SBRI) {
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                 } else {
                     generate_exception_end(ctx, EXCP_DBp);
                 }
@@ -16363,7 +16368,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
     default:
     pool32axf_invalid:
         MIPS_INVAL("pool32axf");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -16632,7 +16637,7 @@ static void gen_pool32fxf(DisasContext *ctx, int rt, int rs)
         break;
     default:
         MIPS_INVAL("pool32fxf");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -16836,12 +16841,12 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
             break;
         case SIGRIE:
             check_insn(ctx, ISA_MIPS_R6);
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
@@ -16883,7 +16888,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:
             MIPS_INVAL("pool32b");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -17363,7 +17368,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
             default:
             pool32f_invalid:
                 MIPS_INVAL("pool32f");
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
         } else {
@@ -17525,7 +17530,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
             /* Fall through */
         default:
             MIPS_INVAL("pool32i");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -17608,7 +17613,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
         case LD_EVA:
             if (!ctx->eva) {
                 MIPS_INVAL("pool32c ld-eva");
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
             check_cp0_enabled(ctx);
@@ -17647,7 +17652,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
         case ST_EVA:
             if (!ctx->eva) {
                 MIPS_INVAL("pool32c st-eva");
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
             check_cp0_enabled(ctx);
@@ -17699,7 +17704,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:
             MIPS_INVAL("pool32c");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -17991,7 +17996,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
         gen_st(ctx, mips32_op, rt, rs, imm);
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -18022,7 +18027,7 @@ static int decode_micromips_opc(CPUMIPSState *env, DisasContext *ctx)
         case 7:
         /* LB32, LH32, LWC132, LDC132, LW32 */
             if (ctx->hflags & MIPS_HFLAG_BDS16) {
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 return 2;
             }
             break;
@@ -18033,7 +18038,7 @@ static int decode_micromips_opc(CPUMIPSState *env, DisasContext *ctx)
         case 3:
         /* MOVE16, ANDI16, POOL16D, POOL16E, BEQZ16, BNEZ16, B16, LI16 */
             if (ctx->hflags & MIPS_HFLAG_BDS32) {
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 return 2;
             }
             break;
@@ -18106,7 +18111,7 @@ static int decode_micromips_opc(CPUMIPSState *env, DisasContext *ctx)
     case POOL16F:
         check_insn_opc_removed(ctx, ISA_MIPS_R6);
         if (ctx->opcode & 1) {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         } else {
             /* MOVEP */
             int enc_dest = uMIPS_RD(ctx->opcode);
@@ -18244,7 +18249,7 @@ static int decode_micromips_opc(CPUMIPSState *env, DisasContext *ctx)
     case RES_29:
     case RES_31:
     case RES_39:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     default:
         decode_micromips32_opc(env, ctx);
@@ -19502,7 +19507,7 @@ static void gen_pool32a0_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
                     gen_helper_dvpe(t0, cpu_env);
                     gen_store_gpr(t0, rt);
                 } else {
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                 }
                 break;
             case 1:
@@ -19517,7 +19522,7 @@ static void gen_pool32a0_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
                     gen_helper_evpe(t0, cpu_env);
                     gen_store_gpr(t0, rt);
                 } else {
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                 }
                 break;
             }
@@ -19567,7 +19572,7 @@ static void gen_pool32a0_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
         break;
 #endif
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -19608,7 +19613,7 @@ static void gen_pool32axf_1_5_nanomips_insn(DisasContext *ctx, uint32_t opc,
         gen_helper_maq_sa_w_phl(t0, v1_t, v0_t, cpu_env);
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -19659,7 +19664,7 @@ static void gen_pool32axf_1_nanomips_insn(DisasContext *ctx, uint32_t opc,
             gen_helper_shilo(t0, v0_t, cpu_env);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -19733,7 +19738,7 @@ static void gen_pool32axf_1_nanomips_insn(DisasContext *ctx, uint32_t opc,
         }
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -19771,7 +19776,7 @@ static void gen_pool32axf_2_multiply(DisasContext *ctx, uint32_t opc,
             gen_helper_dpsq_s_w_ph(t0, v1, v0, cpu_env);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -19794,7 +19799,7 @@ static void gen_pool32axf_2_multiply(DisasContext *ctx, uint32_t opc,
             gen_helper_dpsq_sa_l_w(t0, v0, v1, cpu_env);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -19821,7 +19826,7 @@ static void gen_pool32axf_2_multiply(DisasContext *ctx, uint32_t opc,
             gen_helper_mulsa_w_ph(t0, v0, v1, cpu_env);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -19848,12 +19853,12 @@ static void gen_pool32axf_2_multiply(DisasContext *ctx, uint32_t opc,
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
 
@@ -19997,7 +20002,7 @@ static void gen_pool32axf_2_nanomips_insn(DisasContext *ctx, uint32_t opc,
             gen_store_gpr(t0, ret);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -20090,7 +20095,7 @@ static void gen_pool32axf_2_nanomips_insn(DisasContext *ctx, uint32_t opc,
         }
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -20233,7 +20238,7 @@ static void gen_pool32axf_4_nanomips_insn(DisasContext *ctx, uint32_t opc,
         gen_bshfl(ctx, OPC_WSBH, ret, rs);
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -20288,7 +20293,7 @@ static void gen_pool32axf_7_nanomips_insn(DisasContext *ctx, uint32_t opc,
         }
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
     tcg_temp_free(t0);
@@ -20385,7 +20390,7 @@ static void gen_pool32axf_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
             break;
 #endif
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -20396,7 +20401,7 @@ static void gen_pool32axf_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
         }
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -20429,7 +20434,7 @@ static void gen_compute_imm_branch(DisasContext *ctx, uint32_t opc,
     case NM_BBNEZC:
         check_nms(ctx);
         if (imm >= 32 && !(ctx->hflags & MIPS_HFLAG_64)) {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             goto out;
         } else if (rt == 0 && opc == NM_BBEQZC) {
             /* Unconditional branch */
@@ -20479,7 +20484,7 @@ static void gen_compute_imm_branch(DisasContext *ctx, uint32_t opc,
         break;
     default:
         MIPS_INVAL("Immediate Value Compact branch");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -20592,7 +20597,7 @@ static void gen_compute_compact_branch_nm(DisasContext *ctx, uint32_t opc,
         break;
     default:
         MIPS_INVAL("Compact branch/jump");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -20604,7 +20609,7 @@ static void gen_compute_compact_branch_nm(DisasContext *ctx, uint32_t opc,
             break;
         default:
             MIPS_INVAL("Compact branch/jump");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             goto out;
         }
     } else {
@@ -20665,7 +20670,7 @@ static void gen_compute_compact_branch_nm(DisasContext *ctx, uint32_t opc,
             break;
         default:
             MIPS_INVAL("Compact conditional branch/jump");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             goto out;
         }
 
@@ -20709,7 +20714,7 @@ static void gen_compute_branch_cp1_nm(DisasContext *ctx, uint32_t op,
         break;
     default:
         MIPS_INVAL("cp1 cond branch");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         goto out;
     }
 
@@ -20839,7 +20844,7 @@ static void gen_p_lsx(DisasContext *ctx, int rd, int rs, int rt)
         }
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -20856,7 +20861,7 @@ static void gen_pool32f_nanomips_insn(DisasContext *ctx)
     rd = extract32(ctx->opcode, 11, 5);
 
     if (!(ctx->CP0_Config1 & (1 << CP0C1_FP))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
     check_cp1_enabled(ctx);
@@ -20930,7 +20935,7 @@ static void gen_pool32f_nanomips_insn(DisasContext *ctx)
             gen_farith(ctx, OPC_MSUBF_D, rt, rs, rd, 0);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -21119,7 +21124,7 @@ static void gen_pool32f_nanomips_insn(DisasContext *ctx)
                     gen_farith(ctx, OPC_CVT_S_L, -1, rs, rt, 0);
                     break;
                 default:
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                     break;
                 }
                 break;
@@ -21136,12 +21141,12 @@ static void gen_pool32f_nanomips_insn(DisasContext *ctx)
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
@@ -21667,7 +21672,7 @@ static void gen_pool32a5_nanomips_insn(DisasContext *ctx, int opc,
             gen_store_gpr(v1_t, rt);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -21689,7 +21694,7 @@ static void gen_pool32a5_nanomips_insn(DisasContext *ctx, int opc,
         }
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -21717,13 +21722,13 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
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
@@ -21734,7 +21739,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                     gen_helper_do_semihosting(cpu_env);
                 } else {
                     if (ctx->hflags & MIPS_HFLAG_SBRI) {
-                        generate_exception_end(ctx, EXCP_RI);
+                        gen_reserved_instruction(ctx);
                     } else {
                         generate_exception_end(ctx, EXCP_DBp);
                     }
@@ -21792,12 +21797,12 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
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
@@ -21816,7 +21821,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_st(ctx, OPC_SW, rt, 28, extract32(ctx->opcode, 2, 19) << 2);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -21887,7 +21892,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                 }
                 break;
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
             return 6;
@@ -21922,12 +21927,12 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
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
@@ -22015,7 +22020,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                            extract32(ctx->opcode, 6, 5));
                 break;
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
             break;
@@ -22028,12 +22033,12 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
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
@@ -22101,7 +22106,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                     gen_st(ctx, OPC_SH, rt, 28, u);
                     break;
                 default:
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                     break;
                 }
                 break;
@@ -22123,7 +22128,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                 }
                 break;
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
         }
@@ -22183,7 +22188,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                 gen_cop1_ldst(ctx, OPC_SDC1, rt, rs, u);
                 break;
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
         }
@@ -22246,7 +22251,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                     }
                     break;
                 default:
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                     break;
                 }
                 break;
@@ -22386,7 +22391,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                         gen_llwp(ctx, rs, 0, rt, extract32(ctx->opcode, 3, 5));
                         break;
                     default:
-                        generate_exception_end(ctx, EXCP_RI);
+                        gen_reserved_instruction(ctx);
                         break;
                     }
                     break;
@@ -22406,7 +22411,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                                  true);
                         break;
                     default:
-                        generate_exception_end(ctx, EXCP_RI);
+                        gen_reserved_instruction(ctx);
                         break;
                     }
                     break;
@@ -22457,7 +22462,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                 }
                 break;
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
         }
@@ -22501,7 +22506,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_compute_nanomips_pbalrsc_branch(ctx, rs, rt);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -22536,7 +22541,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                     }
                     break;
                 default:
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                     break;
                 }
                 break;
@@ -22585,7 +22590,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                 }
                 break;
             default:
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
         }
@@ -22601,7 +22606,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
         }
         break;
     default:
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
     return 4;
@@ -22640,7 +22645,7 @@ static int decode_nanomips_opc(CPUMIPSState *env, DisasContext *ctx)
                 if (extract32(ctx->opcode, 2, 1) == 0) {
                     generate_exception_end(ctx, EXCP_SYSCALL);
                 } else {
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                 }
                 break;
             case NM_BREAK16:
@@ -22651,14 +22656,14 @@ static int decode_nanomips_opc(CPUMIPSState *env, DisasContext *ctx)
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
@@ -22697,7 +22702,7 @@ static int decode_nanomips_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_arith_imm(ctx, OPC_ADDIU, rt, 29, imm);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -22746,7 +22751,7 @@ static int decode_nanomips_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_r6_muldiv(ctx, R6_OPC_MUL, rt, rs, rt);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -22782,7 +22787,7 @@ static int decode_nanomips_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_ld(ctx, OPC_LBU, rt, rs, offset);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -22801,7 +22806,7 @@ static int decode_nanomips_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_ld(ctx, OPC_LHU, rt, rs, offset);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -23580,7 +23585,7 @@ static void gen_mipsdsp_shift(DisasContext *ctx, uint32_t opc,
                 break;
             default:            /* Invalid */
                 MIPS_INVAL("MASK SHLL.QB");
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
             break;
@@ -23695,7 +23700,7 @@ static void gen_mipsdsp_shift(DisasContext *ctx, uint32_t opc,
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK SHLL.OB");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -24386,7 +24391,7 @@ static void gen_mipsdsp_append(CPUMIPSState *env, DisasContext *ctx,
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK APPEND");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -24420,7 +24425,7 @@ static void gen_mipsdsp_append(CPUMIPSState *env, DisasContext *ctx,
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK DAPPEND");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -24689,7 +24694,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:
             MIPS_INVAL("special_r6 muldiv");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -24706,7 +24711,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
              */
             gen_cl(ctx, op1, rd, rs);
         } else {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
         break;
     case R6_OPC_SDBBP:
@@ -24714,7 +24719,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
             gen_helper_do_semihosting(cpu_env);
         } else {
             if (ctx->hflags & MIPS_HFLAG_SBRI) {
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
             } else {
                 generate_exception_end(ctx, EXCP_DBp);
             }
@@ -24735,7 +24740,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
             check_mips_64(ctx);
             gen_cl(ctx, op1, rd, rs);
         } else {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
         break;
     case OPC_DMULT:
@@ -24758,14 +24763,14 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
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
@@ -24812,7 +24817,7 @@ static void decode_opc_special_tx79(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:            /* Invalid */
         MIPS_INVAL("special_tx79");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -24883,16 +24888,16 @@ static void decode_opc_special_legacy(CPUMIPSState *env, DisasContext *ctx)
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
@@ -24914,7 +24919,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
             rs == 0 && rt == 0) { /* PAUSE */
             if ((ctx->insn_flags & ISA_MIPS_R6) &&
                 (ctx->hflags & MIPS_HFLAG_BMASK)) {
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
         }
@@ -24934,7 +24939,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
             gen_shift_imm(ctx, op1, rd, rt, sa);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -24960,7 +24965,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
             gen_shift(ctx, op1, rd, rs, rt);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -24994,7 +24999,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
             /* Pmon entry point, also R4010 selsl */
 #ifdef MIPS_STRICT_STANDARD
             MIPS_INVAL("PMON / selsl");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
 #else
             gen_helper_0e0i(pmon, sa);
 #endif
@@ -25035,7 +25040,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
             gen_shift_imm(ctx, op1, rd, rt, sa);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -25053,7 +25058,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
             gen_shift_imm(ctx, op1, rd, rt, sa);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -25085,7 +25090,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
             gen_shift(ctx, op1, rd, rs, rt);
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -25150,7 +25155,7 @@ static void gen_mmi_pcpyh(DisasContext *ctx)
     rd = extract32(opcode, 11, 5);
 
     if (unlikely(pd != 0)) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     } else if (rd == 0) {
         /* nop */
     } else if (rt == 0) {
@@ -26357,16 +26362,16 @@ static void decode_opc_mxu__pool00(CPUMIPSState *env, DisasContext *ctx)
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
@@ -26396,41 +26401,41 @@ static void decode_opc_mxu__pool01(CPUMIPSState *env, DisasContext *ctx)
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
@@ -26453,26 +26458,26 @@ static void decode_opc_mxu__pool02(CPUMIPSState *env, DisasContext *ctx)
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
@@ -26502,16 +26507,16 @@ static void decode_opc_mxu__pool03(CPUMIPSState *env, DisasContext *ctx)
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
@@ -26537,7 +26542,7 @@ static void decode_opc_mxu__pool04(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -26560,16 +26565,16 @@ static void decode_opc_mxu__pool05(CPUMIPSState *env, DisasContext *ctx)
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
@@ -26592,16 +26597,16 @@ static void decode_opc_mxu__pool06(CPUMIPSState *env, DisasContext *ctx)
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
@@ -26624,16 +26629,16 @@ static void decode_opc_mxu__pool07(CPUMIPSState *env, DisasContext *ctx)
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
@@ -26656,16 +26661,16 @@ static void decode_opc_mxu__pool08(CPUMIPSState *env, DisasContext *ctx)
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
@@ -26688,16 +26693,16 @@ static void decode_opc_mxu__pool09(CPUMIPSState *env, DisasContext *ctx)
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
@@ -26720,16 +26725,16 @@ static void decode_opc_mxu__pool10(CPUMIPSState *env, DisasContext *ctx)
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
@@ -26752,16 +26757,16 @@ static void decode_opc_mxu__pool11(CPUMIPSState *env, DisasContext *ctx)
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
@@ -26784,21 +26789,21 @@ static void decode_opc_mxu__pool12(CPUMIPSState *env, DisasContext *ctx)
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
@@ -26821,21 +26826,21 @@ static void decode_opc_mxu__pool13(CPUMIPSState *env, DisasContext *ctx)
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
@@ -26865,21 +26870,21 @@ static void decode_opc_mxu__pool14(CPUMIPSState *env, DisasContext *ctx)
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
@@ -26909,26 +26914,26 @@ static void decode_opc_mxu__pool15(CPUMIPSState *env, DisasContext *ctx)
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
@@ -26976,12 +26981,12 @@ static void decode_opc_mxu__pool16(CPUMIPSState *env, DisasContext *ctx)
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
@@ -26989,7 +26994,7 @@ static void decode_opc_mxu__pool16(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_S32LUI:
         /* TODO: Implement emulation of S32LUI instruction. */
         MIPS_INVAL("OPC_MXU_S32LUI");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     case OPC_MXU_S32NOR:
         gen_mxu_S32NOR(ctx);
@@ -27005,7 +27010,7 @@ static void decode_opc_mxu__pool16(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -27028,31 +27033,31 @@ static void decode_opc_mxu__pool17(CPUMIPSState *env, DisasContext *ctx)
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
@@ -27074,36 +27079,36 @@ static void decode_opc_mxu__pool18(CPUMIPSState *env, DisasContext *ctx)
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
@@ -27129,7 +27134,7 @@ static void decode_opc_mxu__pool19(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("decode_opc_mxu");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -27152,36 +27157,36 @@ static void decode_opc_mxu__pool20(CPUMIPSState *env, DisasContext *ctx)
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
@@ -27204,16 +27209,16 @@ static void decode_opc_mxu__pool21(CPUMIPSState *env, DisasContext *ctx)
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
@@ -27272,12 +27277,12 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
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
@@ -27285,12 +27290,12 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
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
@@ -27310,27 +27315,27 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
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
@@ -27359,7 +27364,7 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
         case OPC_MXU_D32ADD:
             /* TODO: Implement emulation of D32ADD instruction. */
             MIPS_INVAL("OPC_MXU_D32ADD");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU__POOL12:
             decode_opc_mxu__pool12(env, ctx);
@@ -27373,7 +27378,7 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
         case OPC_MXU_Q8ACCE:
             /* TODO: Implement emulation of Q8ACCE instruction. */
             MIPS_INVAL("OPC_MXU_Q8ACCE");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU_S8LDD:
             gen_mxu_s8ldd(ctx);
@@ -27381,17 +27386,17 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
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
@@ -27405,52 +27410,52 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
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
@@ -27458,7 +27463,7 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
         case OPC_MXU_Q16SAR:
             /* TODO: Implement emulation of Q16SAR instruction. */
             MIPS_INVAL("OPC_MXU_Q16SAR");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_MXU__POOL19:
             decode_opc_mxu__pool19(env, ctx);
@@ -27472,26 +27477,26 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
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
@@ -27570,7 +27575,7 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
 #endif
     default:            /* Invalid */
         MIPS_INVAL("special2_legacy");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -27592,7 +27597,7 @@ static void decode_opc_special3_r6(CPUMIPSState *env, DisasContext *ctx)
     case R6_OPC_PREF:
         if (rt >= 24) {
             /* hint codes 24-31 are reserved and signal RI */
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
         /* Treat as NOP. */
         break;
@@ -27631,7 +27636,7 @@ static void decode_opc_special3_r6(CPUMIPSState *env, DisasContext *ctx)
 #ifndef CONFIG_USER_ONLY
     case OPC_GINV:
         if (unlikely(ctx->gi <= 1)) {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
         check_cp0_enabled(ctx);
         switch ((ctx->opcode >> 6) & 3) {
@@ -27642,7 +27647,7 @@ static void decode_opc_special3_r6(CPUMIPSState *env, DisasContext *ctx)
             gen_helper_0e1i(ginvt, cpu_gpr[rs], extract32(ctx->opcode, 8, 2));
             break;
         default:
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -27683,7 +27688,7 @@ static void decode_opc_special3_r6(CPUMIPSState *env, DisasContext *ctx)
 #endif
     default:            /* Invalid */
         MIPS_INVAL("special3_r6");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -27734,13 +27739,13 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
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
@@ -27756,7 +27761,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK LX");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -27787,7 +27792,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:
             MIPS_INVAL("MASK ABSQ_S.PH");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -27824,7 +27829,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK ADDU.QB");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
 
         }
@@ -27864,7 +27869,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK CMPU.EQ.QB");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -27900,7 +27905,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK DPAW.PH");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -27930,7 +27935,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             }
         default:            /* Invalid */
             MIPS_INVAL("MASK INSV");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -27965,7 +27970,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK EXTR.W");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -28011,7 +28016,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK ABSQ_S.QH");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -28050,7 +28055,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK ADDU.OB");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -28095,7 +28100,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK CMPU_EQ.OB");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -28132,7 +28137,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK EXTR.W");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -28171,7 +28176,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK DPAQ.W.QH");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -28201,7 +28206,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
         }
         default:            /* Invalid */
             MIPS_INVAL("MASK DINSV");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -28211,7 +28216,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
 #endif
     default:            /* Invalid */
         MIPS_INVAL("special3_legacy");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -28249,11 +28254,11 @@ static void decode_mmi0(CPUMIPSState *env, DisasContext *ctx)
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
@@ -28281,11 +28286,11 @@ static void decode_mmi1(CPUMIPSState *env, DisasContext *ctx)
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
@@ -28316,14 +28321,14 @@ static void decode_mmi2(CPUMIPSState *env, DisasContext *ctx)
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
@@ -28344,7 +28349,7 @@ static void decode_mmi3(CPUMIPSState *env, DisasContext *ctx)
     case MMI_OPC_3_PNOR:       /* TODO: MMI_OPC_3_PNOR */
     case MMI_OPC_3_PEXCH:      /* TODO: MMI_OPC_3_PEXCH */
     case MMI_OPC_3_PEXCW:      /* TODO: MMI_OPC_3_PEXCW */
-        generate_exception_end(ctx, EXCP_RI); /* TODO: MMI_OPC_CLASS_MMI3 */
+        gen_reserved_instruction(ctx); /* TODO: MMI_OPC_CLASS_MMI3 */
         break;
     case MMI_OPC_3_PCPYH:
         gen_mmi_pcpyh(ctx);
@@ -28354,7 +28359,7 @@ static void decode_mmi3(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("TX79 MMI class MMI3");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -28408,23 +28413,23 @@ static void decode_mmi(CPUMIPSState *env, DisasContext *ctx)
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
@@ -28632,7 +28637,7 @@ static inline int check_msa_access(DisasContext *ctx)
 {
     if (unlikely((ctx->hflags & MIPS_HFLAG_FPU) &&
                  !(ctx->hflags & MIPS_HFLAG_F64))) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return 0;
     }
 
@@ -28641,7 +28646,7 @@ static inline int check_msa_access(DisasContext *ctx)
             generate_exception_end(ctx, EXCP_MSADIS);
             return 0;
         } else {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             return 0;
         }
     }
@@ -28698,7 +28703,7 @@ static void gen_msa_branch(CPUMIPSState *env, DisasContext *ctx, uint32_t op1)
     check_msa_access(ctx);
 
     if (ctx->hflags & MIPS_HFLAG_BMASK) {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
     switch (op1) {
@@ -28773,7 +28778,7 @@ static void gen_msa_i8(CPUMIPSState *env, DisasContext *ctx)
         {
             uint8_t df = (ctx->opcode >> 24) & 0x3;
             if (df == DF_DOUBLE) {
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
             } else {
                 TCGv_i32 tdf = tcg_const_i32(df);
                 gen_helper_msa_shf_df(cpu_env, tdf, twd, tws, ti8);
@@ -28783,7 +28788,7 @@ static void gen_msa_i8(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -28855,7 +28860,7 @@ static void gen_msa_i5(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -28891,7 +28896,7 @@ static void gen_msa_bit(CPUMIPSState *env, DisasContext *ctx)
         m = dfm & 0x7;
         df = DF_BYTE;
     } else {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 
@@ -28939,7 +28944,7 @@ static void gen_msa_bit(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -29784,7 +29789,7 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
     case OPC_HSUB_S_df:
     case OPC_HSUB_U_df:
         if (df == DF_BYTE) {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         switch (MASK_MSA_3R(ctx->opcode)) {
@@ -29922,7 +29927,7 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
     tcg_temp_free_i32(twd);
@@ -29954,7 +29959,7 @@ static void gen_msa_elm_3e(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -29991,12 +29996,12 @@ static void gen_msa_elm_df(CPUMIPSState *env, DisasContext *ctx, uint32_t df,
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
@@ -30066,7 +30071,7 @@ static void gen_msa_elm_df(CPUMIPSState *env, DisasContext *ctx, uint32_t df,
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
     }
     tcg_temp_free_i32(twd);
     tcg_temp_free_i32(tws);
@@ -30096,7 +30101,7 @@ static void gen_msa_elm(CPUMIPSState *env, DisasContext *ctx)
         gen_msa_elm_3e(env, ctx);
         return;
     } else {
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         return;
     }
 
@@ -30251,7 +30256,7 @@ static void gen_msa_3rf(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -30279,7 +30284,7 @@ static void gen_msa_2r(CPUMIPSState *env, DisasContext *ctx)
 #if !defined(TARGET_MIPS64)
         /* Double format valid only for MIPS64 */
         if (df == DF_DOUBLE) {
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
 #endif
@@ -30335,7 +30340,7 @@ static void gen_msa_2r(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -30450,7 +30455,7 @@ static void gen_msa_vec_v(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -30479,7 +30484,7 @@ static void gen_msa_vec(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -30577,7 +30582,7 @@ static void gen_msa(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:
         MIPS_INVAL("MSA instruction");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 
@@ -30661,7 +30666,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
                     /* OPC_NAL, OPC_BAL */
                     gen_compute_branch(ctx, op1, 4, 0, -1, imm << 2, 4);
                 } else {
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                 }
             } else {
                 gen_compute_branch(ctx, op1, 4, rs, -1, imm << 2, 4);
@@ -30680,7 +30685,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
             break;
         case OPC_SIGRIE:
             check_insn(ctx, ISA_MIPS_R6);
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         case OPC_SYNCI:
             check_insn(ctx, ISA_MIPS_R2);
@@ -30715,7 +30720,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
 #endif
         default:            /* Invalid */
             MIPS_INVAL("regimm");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -30824,7 +30829,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
                     break;
                 default:            /* Invalid */
                     MIPS_INVAL("mfmc0");
-                    generate_exception_end(ctx, EXCP_RI);
+                    gen_reserved_instruction(ctx);
                     break;
                 }
                 tcg_temp_free(t0);
@@ -30841,7 +30846,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:
             MIPS_INVAL("cp0");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -30877,7 +30882,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
     case OPC_BLEZC: /* OPC_BGEZC, OPC_BGEC, OPC_BLEZL */
         if (ctx->insn_flags & ISA_MIPS_R6) {
             if (rt == 0) {
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
             /* OPC_BLEZC, OPC_BGEZC, OPC_BGEC */
@@ -30890,7 +30895,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
     case OPC_BGTZC: /* OPC_BLTZC, OPC_BLTC, OPC_BGTZL */
         if (ctx->insn_flags & ISA_MIPS_R6) {
             if (rt == 0) {
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
             /* OPC_BGTZC, OPC_BLTZC, OPC_BLTC */
@@ -31139,7 +31144,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
             break;
         default:
             MIPS_INVAL("cp1");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             break;
         }
         break;
@@ -31225,7 +31230,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
                 break;
             default:
                 MIPS_INVAL("cp3");
-                generate_exception_end(ctx, EXCP_RI);
+                gen_reserved_instruction(ctx);
                 break;
             }
         } else {
@@ -31290,7 +31295,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_compute_compact_branch(ctx, op, rs, rt, imm << 2);
         } else {
             MIPS_INVAL("major opcode");
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
         }
         break;
 #endif
@@ -31308,7 +31313,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
                 tcg_temp_free(t0);
             }
 #else
-            generate_exception_end(ctx, EXCP_RI);
+            gen_reserved_instruction(ctx);
             MIPS_INVAL("major opcode");
 #endif
         } else {
@@ -31334,7 +31339,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:            /* Invalid */
         MIPS_INVAL("major opcode");
-        generate_exception_end(ctx, EXCP_RI);
+        gen_reserved_instruction(ctx);
         break;
     }
 }
@@ -31439,7 +31444,7 @@ static void mips_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
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



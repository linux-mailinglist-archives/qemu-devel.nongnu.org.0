Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9533E366059
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 21:40:18 +0200 (CEST)
Received: from localhost ([::1]:50456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYwEL-0005K9-Lm
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 15:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYw9W-0002cf-AL
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 15:35:18 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYw9U-00026D-A8
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 15:35:18 -0400
Received: by mail-wm1-x332.google.com with SMTP id y204so19484619wmg.2
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 12:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a/pdWdU2XYITNpm+08Z2lHJVYwHvuC97R2oAUg/6SrQ=;
 b=T7Yd6NFUyki81BkF8wAn3LIu1MkCjNAGPDWak57Xwm15n5kPsezt1F/LxUJ8jWI19t
 6f74Q3x78w/PmMYW+uX3ocKploYJzNYS5spT98x9IJLb6lGXGHb2W0T6UyYW6/j/No9Z
 Jgni6V6tqkfj8LWIuMrTfatAlmDq2NyiSPxl09qEc/cI+9AyMqeckr37RW7XlVWS1Fiv
 IwwrD7Jo8NTOv4zq0is0J292CQyDVXpuU2ztPym3X5pnO69ZChJCqR4rfjd3Gqx/+MPJ
 c3TEO248SFAvaM/zzbevx27ojM9kF42z0L3t1//wv/pFrA/+r4Gb9IDkgQrk/vAtcUrk
 sfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=a/pdWdU2XYITNpm+08Z2lHJVYwHvuC97R2oAUg/6SrQ=;
 b=EGRI21xM5evu0j2snWwmyUkqCpkoxpOJ7zIu0ZkLYoMufP8ecep6xo5kAGIqL8KQ4r
 yANSHtdUcRQFifYQ7XhdBeFevu6aOWnWYh8azvcJX9cedPtltk0vqrH2ORqoyywFEokP
 GofTDAahwGZK4et03EFKxF1c2rrVP8JLEJNwauhCGFJO+L2bEVG0oUddMeC7URHWOF5Z
 o0MQZVXcrAUvCI1ABacOA0PkegsBhT3ZLLXBw0HXEiYec0Qbigl84EkYeIxbfVq4Kz4F
 FqTKIOg3W97njgJPb21EAV9taN40lib66go5HoED/dHMdewi1hy3Y3gy6xFs9pKzmAWC
 vS7Q==
X-Gm-Message-State: AOAM530WdvQnLiom06/3faecMCqGVESsPKJcsL+oCjOsUWdFHM6iHCbr
 UqRtZ9TxqtpEQObxiMfo7v2BO9NbjVDT2Q==
X-Google-Smtp-Source: ABdhPJzHG0vALewa9eJtivHnJtFSPp2HL9rbRgalufWLexigtFPVjH1mhvLhcIAXzTVcc57gFE598g==
X-Received: by 2002:a05:600c:4ecc:: with SMTP id
 g12mr5904135wmq.117.1618947314681; 
 Tue, 20 Apr 2021 12:35:14 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id 2sm4432135wmi.19.2021.04.20.12.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 12:35:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] target/mips: Use check_cp0_enabled() returned value
Date: Tue, 20 Apr 2021 21:34:52 +0200
Message-Id: <20210420193453.1913810-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210420193453.1913810-1-f4bug@amsat.org>
References: <20210420193453.1913810-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If CP0 is disabled, it is pointless to emit more code,
since the 'coprocessor unusable' exception will be raised.
Use the returned value from check_cp0_enabled() to return
early.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 144 +++++++++++++++++++++-------------------
 1 file changed, 76 insertions(+), 68 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index be5382b41f2..dfa26569077 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -9417,7 +9417,9 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
 {
     const char *opn = "ldst";
 
-    check_cp0_enabled(ctx);
+    if (!check_cp0_enabled(ctx)) {
+        return;
+    }
     switch (opc) {
     case OPC_MFC0:
         if (rt == 0) {
@@ -14651,17 +14653,17 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
 #ifndef CONFIG_USER_ONLY
     case MFC0:
     case MFC0 + 32:
-        check_cp0_enabled(ctx);
-        if (rt == 0) {
-            /* Treat as NOP. */
-            break;
+        if (check_cp0_enabled(ctx)) {
+            if (rt == 0) {
+                /* Treat as NOP. */
+                break;
+            }
+            gen_mfc0(ctx, cpu_gpr[rt], rs, (ctx->opcode >> 11) & 0x7);
         }
-        gen_mfc0(ctx, cpu_gpr[rt], rs, (ctx->opcode >> 11) & 0x7);
         break;
     case MTC0:
     case MTC0 + 32:
-        check_cp0_enabled(ctx);
-        {
+        if (check_cp0_enabled(ctx)) {
             TCGv t0 = tcg_temp_new();
 
             gen_load_gpr(t0, rt);
@@ -14809,14 +14811,15 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
         }
         break;
     case 0x05:
+        if (!check_cp0_enabled(ctx)) {
+            break;
+        }
         switch (minor) {
         case RDPGPR:
-            check_cp0_enabled(ctx);
             check_insn(ctx, ISA_MIPS_R2);
             gen_load_srsgpr(rs, rt);
             break;
         case WRPGPR:
-            check_cp0_enabled(ctx);
             check_insn(ctx, ISA_MIPS_R2);
             gen_store_srsgpr(rs, rt);
             break;
@@ -14863,8 +14866,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
     case 0x1d:
         switch (minor) {
         case DI:
-            check_cp0_enabled(ctx);
-            {
+            if (check_cp0_enabled(ctx)) {
                 TCGv t0 = tcg_temp_new();
 
                 save_cpu_state(ctx, 1);
@@ -14879,8 +14881,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
             }
             break;
         case EI:
-            check_cp0_enabled(ctx);
-            {
+            if (check_cp0_enabled(ctx)) {
                 TCGv t0 = tcg_temp_new();
 
                 save_cpu_state(ctx, 1);
@@ -15449,8 +15450,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
         minor = (ctx->opcode >> 12) & 0xf;
         switch (minor) {
         case CACHE:
-            check_cp0_enabled(ctx);
-            if (ctx->hflags & MIPS_HFLAG_ITC_CACHE) {
+            if (check_cp0_enabled(ctx) && ctx->hflags & MIPS_HFLAG_ITC_CACHE) {
                 gen_cache_operation(ctx, rt, rs, imm);
             }
             break;
@@ -16211,7 +16211,9 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
                 gen_reserved_instruction(ctx);
                 break;
             }
-            check_cp0_enabled(ctx);
+            if (!check_cp0_enabled(ctx)) {
+                break;
+            }
 
             minor2 = (ctx->opcode >> 9) & 0x7;
             offset = sextract32(ctx->opcode, 0, 9);
@@ -16250,7 +16252,9 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
                 gen_reserved_instruction(ctx);
                 break;
             }
-            check_cp0_enabled(ctx);
+            if (!check_cp0_enabled(ctx)) {
+                break;
+            }
 
             minor2 = (ctx->opcode >> 9) & 0x7;
             offset = sextract32(ctx->opcode, 0, 9);
@@ -17995,24 +17999,24 @@ static void gen_pool32a0_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
         if (rd == 0) {
             /* P_DVP */
 #ifndef CONFIG_USER_ONLY
-            TCGv t0 = tcg_temp_new();
-            switch (extract32(ctx->opcode, 10, 1)) {
-            case NM_DVP:
-                if (ctx->vp) {
-                    check_cp0_enabled(ctx);
-                    gen_helper_dvp(t0, cpu_env);
-                    gen_store_gpr(t0, rt);
+            if (check_cp0_enabled(ctx)) {
+                TCGv t0 = tcg_temp_new();
+                switch (extract32(ctx->opcode, 10, 1)) {
+                case NM_DVP:
+                    if (ctx->vp) {
+                        gen_helper_dvp(t0, cpu_env);
+                        gen_store_gpr(t0, rt);
+                    }
+                    break;
+                case NM_EVP:
+                    if (ctx->vp) {
+                        gen_helper_evp(t0, cpu_env);
+                        gen_store_gpr(t0, rt);
+                    }
+                    break;
                 }
-                break;
-            case NM_EVP:
-                if (ctx->vp) {
-                    check_cp0_enabled(ctx);
-                    gen_helper_evp(t0, cpu_env);
-                    gen_store_gpr(t0, rt);
-                }
-                break;
+                tcg_temp_free(t0);
             }
-            tcg_temp_free(t0);
 #endif
         } else {
             gen_slt(ctx, OPC_SLTU, rd, rs, rt);
@@ -18067,16 +18071,16 @@ static void gen_pool32a0_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
         break;
 #ifndef CONFIG_USER_ONLY
     case NM_MFC0:
-        check_cp0_enabled(ctx);
-        if (rt == 0) {
-            /* Treat as NOP. */
-            break;
+        if (check_cp0_enabled(ctx)) {
+            if (rt == 0) {
+                /* Treat as NOP. */
+                break;
+            }
+            gen_mfc0(ctx, cpu_gpr[rt], rs, extract32(ctx->opcode, 11, 3));
         }
-        gen_mfc0(ctx, cpu_gpr[rt], rs, extract32(ctx->opcode, 11, 3));
         break;
     case NM_MTC0:
-        check_cp0_enabled(ctx);
-        {
+        if (check_cp0_enabled(ctx)) {
             TCGv t0 = tcg_temp_new();
 
             gen_load_gpr(t0, rt);
@@ -18140,19 +18144,23 @@ static void gen_pool32a0_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
         break;
     case NM_MFTR:
     case NM_MFHTR:
-        check_cp0_enabled(ctx);
-        if (rd == 0) {
-            /* Treat as NOP. */
-            return;
+        if (check_cp0_enabled(ctx)) {
+            if (rd == 0) {
+                /* Treat as NOP. */
+                return;
+            }
+            gen_mftr(env, ctx, rs, rt, extract32(ctx->opcode, 10, 1),
+                     extract32(ctx->opcode, 11, 5),
+                     extract32(ctx->opcode, 3, 1));
         }
-        gen_mftr(env, ctx, rs, rt, extract32(ctx->opcode, 10, 1),
-                 extract32(ctx->opcode, 11, 5), extract32(ctx->opcode, 3, 1));
         break;
     case NM_MTTR:
     case NM_MTHTR:
-        check_cp0_enabled(ctx);
-        gen_mttr(env, ctx, rs, rt, extract32(ctx->opcode, 10, 1),
-                 extract32(ctx->opcode, 11, 5), extract32(ctx->opcode, 3, 1));
+        if (check_cp0_enabled(ctx)) {
+            gen_mttr(env, ctx, rs, rt, extract32(ctx->opcode, 10, 1),
+                     extract32(ctx->opcode, 11, 5),
+                     extract32(ctx->opcode, 3, 1));
+        }
         break;
     case NM_YIELD:
         check_mt(ctx);
@@ -18943,8 +18951,7 @@ static void gen_pool32axf_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
             gen_cp0(env, ctx, OPC_TLBINVF, 0, 0);
             break;
         case NM_DI:
-            check_cp0_enabled(ctx);
-            {
+            if (check_cp0_enabled(ctx)) {
                 TCGv t0 = tcg_temp_new();
 
                 save_cpu_state(ctx, 1);
@@ -18956,8 +18963,7 @@ static void gen_pool32axf_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
             }
             break;
         case NM_EI:
-            check_cp0_enabled(ctx);
-            {
+            if (check_cp0_enabled(ctx)) {
                 TCGv t0 = tcg_temp_new();
 
                 save_cpu_state(ctx, 1);
@@ -20900,15 +20906,17 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                     }
                     break;
                 case NM_CACHE:
-                    check_cp0_enabled(ctx);
-                    if (ctx->hflags & MIPS_HFLAG_ITC_CACHE) {
+                    if (check_cp0_enabled(ctx)
+                            && ctx->hflags & MIPS_HFLAG_ITC_CACHE) {
                         gen_cache_operation(ctx, rt, rs, s);
                     }
                     break;
                 }
                 break;
             case NM_P_LS_E0:
-                check_cp0_enabled(ctx);
+                if (check_cp0_enabled(ctx)) {
+                    break;
+                }
                 switch (extract32(ctx->opcode, 11, 4)) {
                 case NM_LBE:
                     check_eva(ctx);
@@ -23770,8 +23778,7 @@ static void decode_opc_special3_r6(CPUMIPSState *env, DisasContext *ctx)
         /* Treat as NOP. */
         break;
     case R6_OPC_CACHE:
-        check_cp0_enabled(ctx);
-        if (ctx->hflags & MIPS_HFLAG_ITC_CACHE) {
+        if (check_cp0_enabled(ctx) && ctx->hflags & MIPS_HFLAG_ITC_CACHE) {
             gen_cache_operation(ctx, rt, rs, imm);
         }
         break;
@@ -23806,7 +23813,9 @@ static void decode_opc_special3_r6(CPUMIPSState *env, DisasContext *ctx)
         if (unlikely(ctx->gi <= 1)) {
             gen_reserved_instruction(ctx);
         }
-        check_cp0_enabled(ctx);
+        if (!check_cp0_enabled(ctx)) {
+            break;
+        }
         switch ((ctx->opcode >> 6) & 3) {
         case 0:    /* GINVI */
             /* Treat as NOP. */
@@ -24493,6 +24502,9 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
      * EVA is absent.
      */
     if (ctx->eva) {
+        if (!check_cp0_enabled(ctx)) {
+            return;
+        }
         switch (op1) {
         case OPC_LWLE:
         case OPC_LWRE:
@@ -24502,7 +24514,6 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
         case OPC_LHE:
         case OPC_LLE:
         case OPC_LWE:
-            check_cp0_enabled(ctx);
             gen_ld(ctx, op1, rt, rs, imm);
             return;
         case OPC_SWLE:
@@ -24510,22 +24521,18 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
         case OPC_SBE:
         case OPC_SHE:
         case OPC_SWE:
-            check_cp0_enabled(ctx);
             gen_st(ctx, op1, rt, rs, imm);
             return;
         case OPC_SCE:
-            check_cp0_enabled(ctx);
             gen_st_cond(ctx, rt, rs, imm, MO_TESL, true);
             return;
         case OPC_CACHEE:
             check_eva(ctx);
-            check_cp0_enabled(ctx);
             if (ctx->hflags & MIPS_HFLAG_ITC_CACHE) {
                 gen_cache_operation(ctx, rt, rs, imm);
             }
             return;
         case OPC_PREFE:
-            check_cp0_enabled(ctx);
             /* Treat as NOP. */
             return;
         }
@@ -24750,7 +24757,9 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         }
         break;
     case OPC_CP0:
-        check_cp0_enabled(ctx);
+        if (!check_cp0_enabled(ctx)) {
+            break;
+        }
         op1 = MASK_CP0(ctx->opcode);
         switch (op1) {
         case OPC_MFC0:
@@ -24990,9 +24999,8 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         gen_st_cond(ctx, rt, rs, imm, MO_TESL, false);
         break;
     case OPC_CACHE:
-        check_cp0_enabled(ctx);
         check_insn(ctx, ISA_MIPS3 | ISA_MIPS_R1);
-        if (ctx->hflags & MIPS_HFLAG_ITC_CACHE) {
+        if (check_cp0_enabled(ctx) && ctx->hflags & MIPS_HFLAG_ITC_CACHE) {
             gen_cache_operation(ctx, rt, rs, imm);
         }
         /* Treat as NOP. */
-- 
2.26.3



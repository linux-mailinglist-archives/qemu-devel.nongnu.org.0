Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2206B2E6E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:17:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMa6-0003sA-7n; Thu, 09 Mar 2023 15:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa3-0003km-JI
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:39 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa0-0001Wh-Uw
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:39 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so2995400pja.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3rcUV5sbMWZLT+tsgOT5fMjcNEohZNg5muF9sQRshHA=;
 b=tO6FQbtj/CyMdi5EuRO4j4YuVWYbG7EYr+w5qH07YX/6QG04OhFtXhR6aae/mcEHbZ
 cZsIELANjW4SWLvKtbO5bq3J4OZPtdvRg6Tcq9ghH4QRjYfQ0+4VS0E3Psrn2TeNk7UZ
 dVBZtsNed/lt6ygL0FD9Rso7rSINBmq4oGcJZ9J9qM0mocMe8AWW1GW5M0lkiGKsF9qa
 wPA0EbPQ4FBK+KOBgOK39luAe1ZkNQ750P4UnUsEHoFcIXGPVE5N3wQEaRTcvIlKbBHW
 U7t9hBPMobhcNqLpb6S0X9Q14b0rCp+dRNJIbiV3rvFQm5vQEic2exzc6ZP+SoSeYoE0
 ig1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3rcUV5sbMWZLT+tsgOT5fMjcNEohZNg5muF9sQRshHA=;
 b=CYplYVp92lfabb4Ec6LzNllBLnEc+ZtX7o/BZUF1DJ9UaUmHGge1NJdMmip7EicIdB
 SJ1MHB1zJZPVXu5nHEUekeumRA4JHghA7jXKRuHKMHB6113gPD18n5Smn5vVp+mGmZdK
 SDVAmgbdcXRBRbrO/40HNw9OzOpu+N5MS7fe2HyF1Pyw+KfAVWr4aBYTKPkcYKzYatxq
 KtT9NxBCX6Cf8c3fXOFx0thEum92D/KZQmaQCbew2I1VftVQidxg+aB0UuNx2WKy/qwA
 3u8fbp0lm1lzsdEveOxXcYE+K4VQPZEr0mG7Oeq5kIPH3vhJ2SJgr9jZXEFAS/QduIC6
 uZew==
X-Gm-Message-State: AO0yUKUz9H13bJACgiOfT7p+5AYfTUiaHiSFj1rpJSAs0zKdaDmrCMmz
 J4dl6ny9G7bbkgTzOAOmBZNs6F4YUL9W3aXmAXk=
X-Google-Smtp-Source: AK7set9gqpsIWXL4MFPDz93kks7dCpFMiWeaIt08l0K1HFk2NCFtZIHrrUjxFjTwhUI2lFbgm4wZkQ==
X-Received: by 2002:a17:902:ec84:b0:19c:c87b:4740 with SMTP id
 x4-20020a170902ec8400b0019cc87b4740mr26822596plg.34.1678392575618; 
 Thu, 09 Mar 2023 12:09:35 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 49/91] target/mips: Split out gen_lxr
Date: Thu,  9 Mar 2023 12:05:08 -0800
Message-Id: <20230309200550.3878088-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Common subroutine for LDR and LWR.
Use tcg_constant_tl of ~1 instead of tcg_const_tl of 0x..fe.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 116 +++++++++++++-----------------------
 1 file changed, 40 insertions(+), 76 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 05c8d4ce44..7018c427be 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -2021,11 +2021,39 @@ static void gen_lxl(DisasContext *ctx, TCGv reg, TCGv addr,
     tcg_gen_or_tl(reg, t0, t1);
 }
 
+/* LWR or LDR, depending on MemOp. */
+static void gen_lxr(DisasContext *ctx, TCGv reg, TCGv addr,
+                     int mem_idx, MemOp mop)
+{
+    int size = memop_size(mop);
+    int sizem1 = size - 1;
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+
+    /*
+     * Do a byte access to possibly trigger a page
+     * fault with the unaligned address.
+     */
+    tcg_gen_qemu_ld_tl(t1, addr, mem_idx, MO_UB);
+    tcg_gen_andi_tl(t1, addr, sizem1);
+    if (cpu_is_bigendian(ctx)) {
+        tcg_gen_xori_tl(t1, t1, sizem1);
+    }
+    tcg_gen_shli_tl(t1, t1, 3);
+    tcg_gen_andi_tl(t0, addr, ~sizem1);
+    tcg_gen_qemu_ld_tl(t0, t0, mem_idx, mop);
+    tcg_gen_shr_tl(t0, t0, t1);
+    tcg_gen_xori_tl(t1, t1, size * 8 - 1);
+    tcg_gen_shl_tl(t1, tcg_constant_tl(~1), t1);
+    tcg_gen_and_tl(t1, reg, t1);
+    tcg_gen_or_tl(reg, t0, t1);
+}
+
 /* Load */
 static void gen_ld(DisasContext *ctx, uint32_t opc,
                    int rt, int base, int offset)
 {
-    TCGv t0, t1, t2;
+    TCGv t0, t1;
     int mem_idx = ctx->mem_idx;
 
     if (rt == 0 && ctx->insn_flags & (INSN_LOONGSON2E | INSN_LOONGSON2F |
@@ -2066,26 +2094,9 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
         break;
     case OPC_LDR:
         t1 = tcg_temp_new();
-        /*
-         * Do a byte access to possibly trigger a page
-         * fault with the unaligned address.
-         */
-        tcg_gen_qemu_ld_tl(t1, t0, mem_idx, MO_UB);
-        tcg_gen_andi_tl(t1, t0, 7);
-        if (cpu_is_bigendian(ctx)) {
-            tcg_gen_xori_tl(t1, t1, 7);
-        }
-        tcg_gen_shli_tl(t1, t1, 3);
-        tcg_gen_andi_tl(t0, t0, ~7);
-        tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEUQ);
-        tcg_gen_shr_tl(t0, t0, t1);
-        tcg_gen_xori_tl(t1, t1, 63);
-        t2 = tcg_const_tl(0xfffffffffffffffeull);
-        tcg_gen_shl_tl(t2, t2, t1);
         gen_load_gpr(t1, rt);
-        tcg_gen_and_tl(t1, t1, t2);
-        tcg_gen_or_tl(t0, t0, t1);
-        gen_store_gpr(t0, rt);
+        gen_lxr(ctx, t1, t0, mem_idx, MO_TEUQ);
+        gen_store_gpr(t1, rt);
         break;
     case OPC_LDPC:
         t1 = tcg_const_tl(pc_relative_pc(ctx));
@@ -2153,27 +2164,10 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
         /* fall through */
     case OPC_LWR:
         t1 = tcg_temp_new();
-        /*
-         * Do a byte access to possibly trigger a page
-         * fault with the unaligned address.
-         */
-        tcg_gen_qemu_ld_tl(t1, t0, mem_idx, MO_UB);
-        tcg_gen_andi_tl(t1, t0, 3);
-        if (cpu_is_bigendian(ctx)) {
-            tcg_gen_xori_tl(t1, t1, 3);
-        }
-        tcg_gen_shli_tl(t1, t1, 3);
-        tcg_gen_andi_tl(t0, t0, ~3);
-        tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEUL);
-        tcg_gen_shr_tl(t0, t0, t1);
-        tcg_gen_xori_tl(t1, t1, 31);
-        t2 = tcg_const_tl(0xfffffffeull);
-        tcg_gen_shl_tl(t2, t2, t1);
         gen_load_gpr(t1, rt);
-        tcg_gen_and_tl(t1, t1, t2);
-        tcg_gen_or_tl(t0, t0, t1);
-        tcg_gen_ext32s_tl(t0, t0);
-        gen_store_gpr(t0, rt);
+        gen_lxr(ctx, t1, t0, mem_idx, MO_TEUL);
+        tcg_gen_ext32s_tl(t1, t1);
+        gen_store_gpr(t1, rt);
         break;
     case OPC_LLE:
         mem_idx = MIPS_HFLAG_UM;
@@ -4150,7 +4144,7 @@ static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
 static void gen_loongson_lswc2(DisasContext *ctx, int rt,
                                int rs, int rd)
 {
-    TCGv t0, t1, t2;
+    TCGv t0, t1;
     TCGv_i32 fp0;
 #if defined(TARGET_MIPS64)
     int lsq_rt1 = ctx->opcode & 0x1f;
@@ -4225,29 +4219,12 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
         case OPC_GSLWRC1:
             check_cp1_enabled(ctx);
             gen_base_offset_addr(ctx, t0, rs, shf_offset);
-            t1 = tcg_temp_new();
-            tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
-            tcg_gen_andi_tl(t1, t0, 3);
-            if (cpu_is_bigendian(ctx)) {
-                tcg_gen_xori_tl(t1, t1, 3);
-            }
-            tcg_gen_shli_tl(t1, t1, 3);
-            tcg_gen_andi_tl(t0, t0, ~3);
-            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUL);
-            tcg_gen_shr_tl(t0, t0, t1);
-            tcg_gen_xori_tl(t1, t1, 31);
-            t2 = tcg_const_tl(0xfffffffeull);
-            tcg_gen_shl_tl(t2, t2, t1);
             fp0 = tcg_temp_new_i32();
             gen_load_fpr32(ctx, fp0, rt);
+            t1 = tcg_temp_new();
             tcg_gen_ext_i32_tl(t1, fp0);
-            tcg_gen_and_tl(t1, t1, t2);
-            tcg_gen_or_tl(t0, t0, t1);
-#if defined(TARGET_MIPS64)
-            tcg_gen_extrl_i64_i32(fp0, t0);
-#else
-            tcg_gen_ext32s_tl(fp0, t0);
-#endif
+            gen_lxr(ctx, t1, t0, ctx->mem_idx, MO_TEUL);
+            tcg_gen_trunc_tl_i32(fp0, t1);
             gen_store_fpr32(ctx, fp0, rt);
             break;
 #if defined(TARGET_MIPS64)
@@ -4263,22 +4240,9 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             check_cp1_enabled(ctx);
             gen_base_offset_addr(ctx, t0, rs, shf_offset);
             t1 = tcg_temp_new();
-            tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
-            tcg_gen_andi_tl(t1, t0, 7);
-            if (cpu_is_bigendian(ctx)) {
-                tcg_gen_xori_tl(t1, t1, 7);
-            }
-            tcg_gen_shli_tl(t1, t1, 3);
-            tcg_gen_andi_tl(t0, t0, ~7);
-            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUQ);
-            tcg_gen_shr_tl(t0, t0, t1);
-            tcg_gen_xori_tl(t1, t1, 63);
-            t2 = tcg_const_tl(0xfffffffffffffffeull);
-            tcg_gen_shl_tl(t2, t2, t1);
             gen_load_fpr64(ctx, t1, rt);
-            tcg_gen_and_tl(t1, t1, t2);
-            tcg_gen_or_tl(t0, t0, t1);
-            gen_store_fpr64(ctx, t0, rt);
+            gen_lxr(ctx, t1, t0, ctx->mem_idx, MO_TEUQ);
+            gen_store_fpr64(ctx, t1, rt);
             break;
 #endif
         default:
-- 
2.34.1



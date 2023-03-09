Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B646B2E67
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:17:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMa4-0003m8-N0; Thu, 09 Mar 2023 15:09:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa2-0003eF-1B
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:38 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa0-0001Vl-3K
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:37 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 ce8-20020a17090aff0800b0023a61cff2c6so6664798pjb.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d2buIZreNvfduecNTAyby4zP59WrFFVUEUqZFbQKMU4=;
 b=o35xtAmbLf6i2Eq5ctwZEmw2doAXuF9lVK1GjB3UeybmI+tsL8htyaWbhBkf+lb/tc
 mfV/dLnb90owrfqcFqY3rAt8mnJcRbhof7ZCaYatY5roHVcAGH6xByUVbym9C/eLpmEX
 ZHQbfAcCbGK/jgNBeA3nbRnpTYtHJ4Oxxu2aeiNQyB663VoJ8AtIHLJVNwS9MWYEDrXt
 YD0zPuJqLaxxg7DCVR6GwvApQxq6sVj2jsousLAJnhlve3OjtoNr9N31/2KwCsg8phyp
 rcHVpWdxjrE3dmWv9ABC1RmfWU7Xh0DQSq5zntXvYVCYCZKPiK2ocXoeRNBAc4aiMwQb
 kRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d2buIZreNvfduecNTAyby4zP59WrFFVUEUqZFbQKMU4=;
 b=rae0leiL+wOhSimXnH7VwkYC3sxi6Hv+yasCnEgB7a7R1ZUb2DVX4605cp/DFzNwyQ
 XTCLisWaach8fqA01xXEo2iQEGj1c05UrmJUl9B02ZdOY0vfahppkfAB9NolNfdsR4z8
 XCJJ6hGF+etH1CNNKWWd4F6jQie7jDZ9TunbU/MGfb5nkVcnZH7mgf1jpGqW81u02RQK
 c0Uhp3nofrydfaoMCV6sCUs/Cs+3Wk1u71aQOsv7E2mA0iUsoSR+h+4TRLQdsFaWFWdR
 4Tw5eZrVm6Ppj740WLmRVxYa/mz7jKAZEzwerfIUA2oKgWQz3vw6lGKgHYQadQu9sviF
 yr8Q==
X-Gm-Message-State: AO0yUKVMb5piutl9HmvL2wYhzeFesOBzztU2PbiwknoBlGcPa9ChLmiN
 IH6TsWm8o8dv4YFFpPGYIRGwZ4LCbaFkg27mMs0=
X-Google-Smtp-Source: AK7set8gW65Rwqvet+ijXNnJbBVmZiTYCOTmK4BrnVrJE83Ovj3HVvp4rt8tmxX5kY+VG7q2JbZI1g==
X-Received: by 2002:a17:902:ccc1:b0:19e:6989:bcac with SMTP id
 z1-20020a170902ccc100b0019e6989bcacmr25948564ple.15.1678392574873; 
 Thu, 09 Mar 2023 12:09:34 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 48/91] target/mips: Split out gen_lxl
Date: Thu,  9 Mar 2023 12:05:07 -0800
Message-Id: <20230309200550.3878088-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Common subroutine for LDL and LWL.
Use tcg_constant_tl instead of tcg_const_tl and t2.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 106 ++++++++++++------------------------
 1 file changed, 36 insertions(+), 70 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 0fa9634d39..05c8d4ce44 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1995,6 +1995,32 @@ static target_ulong pc_relative_pc(DisasContext *ctx)
     return pc;
 }
 
+/* LWL or LDL, depending on MemOp. */
+static void gen_lxl(DisasContext *ctx, TCGv reg, TCGv addr,
+                     int mem_idx, MemOp mop)
+{
+    int sizem1 = memop_size(mop) - 1;
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+
+    /*
+     * Do a byte access to possibly trigger a page
+     * fault with the unaligned address.
+     */
+    tcg_gen_qemu_ld_tl(t1, addr, mem_idx, MO_UB);
+    tcg_gen_andi_tl(t1, addr, sizem1);
+    if (!cpu_is_bigendian(ctx)) {
+        tcg_gen_xori_tl(t1, t1, sizem1);
+    }
+    tcg_gen_shli_tl(t1, t1, 3);
+    tcg_gen_andi_tl(t0, addr, ~sizem1);
+    tcg_gen_qemu_ld_tl(t0, t0, mem_idx, mop);
+    tcg_gen_shl_tl(t0, t0, t1);
+    tcg_gen_shl_tl(t1, tcg_constant_tl(-1), t1);
+    tcg_gen_andc_tl(t1, reg, t1);
+    tcg_gen_or_tl(reg, t0, t1);
+}
+
 /* Load */
 static void gen_ld(DisasContext *ctx, uint32_t opc,
                    int rt, int base, int offset)
@@ -2034,25 +2060,9 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
         break;
     case OPC_LDL:
         t1 = tcg_temp_new();
-        /*
-         * Do a byte access to possibly trigger a page
-         * fault with the unaligned address.
-         */
-        tcg_gen_qemu_ld_tl(t1, t0, mem_idx, MO_UB);
-        tcg_gen_andi_tl(t1, t0, 7);
-        if (!cpu_is_bigendian(ctx)) {
-            tcg_gen_xori_tl(t1, t1, 7);
-        }
-        tcg_gen_shli_tl(t1, t1, 3);
-        tcg_gen_andi_tl(t0, t0, ~7);
-        tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEUQ);
-        tcg_gen_shl_tl(t0, t0, t1);
-        t2 = tcg_const_tl(-1);
-        tcg_gen_shl_tl(t2, t2, t1);
         gen_load_gpr(t1, rt);
-        tcg_gen_andc_tl(t1, t1, t2);
-        tcg_gen_or_tl(t0, t0, t1);
-        gen_store_gpr(t0, rt);
+        gen_lxl(ctx, t1, t0, mem_idx, MO_TEUQ);
+        gen_store_gpr(t1, rt);
         break;
     case OPC_LDR:
         t1 = tcg_temp_new();
@@ -2133,26 +2143,10 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
         /* fall through */
     case OPC_LWL:
         t1 = tcg_temp_new();
-        /*
-         * Do a byte access to possibly trigger a page
-         * fault with the unaligned address.
-         */
-        tcg_gen_qemu_ld_tl(t1, t0, mem_idx, MO_UB);
-        tcg_gen_andi_tl(t1, t0, 3);
-        if (!cpu_is_bigendian(ctx)) {
-            tcg_gen_xori_tl(t1, t1, 3);
-        }
-        tcg_gen_shli_tl(t1, t1, 3);
-        tcg_gen_andi_tl(t0, t0, ~3);
-        tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEUL);
-        tcg_gen_shl_tl(t0, t0, t1);
-        t2 = tcg_const_tl(-1);
-        tcg_gen_shl_tl(t2, t2, t1);
         gen_load_gpr(t1, rt);
-        tcg_gen_andc_tl(t1, t1, t2);
-        tcg_gen_or_tl(t0, t0, t1);
-        tcg_gen_ext32s_tl(t0, t0);
-        gen_store_gpr(t0, rt);
+        gen_lxl(ctx, t1, t0, mem_idx, MO_TEUL);
+        tcg_gen_ext32s_tl(t1, t1);
+        gen_store_gpr(t1, rt);
         break;
     case OPC_LWRE:
         mem_idx = MIPS_HFLAG_UM;
@@ -4220,28 +4214,12 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
         case OPC_GSLWLC1:
             check_cp1_enabled(ctx);
             gen_base_offset_addr(ctx, t0, rs, shf_offset);
-            t1 = tcg_temp_new();
-            tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
-            tcg_gen_andi_tl(t1, t0, 3);
-            if (!cpu_is_bigendian(ctx)) {
-                tcg_gen_xori_tl(t1, t1, 3);
-            }
-            tcg_gen_shli_tl(t1, t1, 3);
-            tcg_gen_andi_tl(t0, t0, ~3);
-            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUL);
-            tcg_gen_shl_tl(t0, t0, t1);
-            t2 = tcg_const_tl(-1);
-            tcg_gen_shl_tl(t2, t2, t1);
             fp0 = tcg_temp_new_i32();
             gen_load_fpr32(ctx, fp0, rt);
+            t1 = tcg_temp_new();
             tcg_gen_ext_i32_tl(t1, fp0);
-            tcg_gen_andc_tl(t1, t1, t2);
-            tcg_gen_or_tl(t0, t0, t1);
-#if defined(TARGET_MIPS64)
-            tcg_gen_extrl_i64_i32(fp0, t0);
-#else
-            tcg_gen_ext32s_tl(fp0, t0);
-#endif
+            gen_lxl(ctx, t1, t0, ctx->mem_idx, MO_TEUL);
+            tcg_gen_trunc_tl_i32(fp0, t1);
             gen_store_fpr32(ctx, fp0, rt);
             break;
         case OPC_GSLWRC1:
@@ -4277,21 +4255,9 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             check_cp1_enabled(ctx);
             gen_base_offset_addr(ctx, t0, rs, shf_offset);
             t1 = tcg_temp_new();
-            tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
-            tcg_gen_andi_tl(t1, t0, 7);
-            if (!cpu_is_bigendian(ctx)) {
-                tcg_gen_xori_tl(t1, t1, 7);
-            }
-            tcg_gen_shli_tl(t1, t1, 3);
-            tcg_gen_andi_tl(t0, t0, ~7);
-            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUQ);
-            tcg_gen_shl_tl(t0, t0, t1);
-            t2 = tcg_const_tl(-1);
-            tcg_gen_shl_tl(t2, t2, t1);
             gen_load_fpr64(ctx, t1, rt);
-            tcg_gen_andc_tl(t1, t1, t2);
-            tcg_gen_or_tl(t0, t0, t1);
-            gen_store_fpr64(ctx, t0, rt);
+            gen_lxl(ctx, t1, t0, ctx->mem_idx, MO_TEUQ);
+            gen_store_fpr64(ctx, t1, rt);
             break;
         case OPC_GSLDRC1:
             check_cp1_enabled(ctx);
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3BA6AED7A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:04:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbdy-00027A-49; Tue, 07 Mar 2023 13:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdv-0001mh-BM
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:31 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdt-00015f-9D
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:30 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so17349391pjb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DOpemN8SL3iXV33MOdz0Yz/MS9tf3JlAEps9SShQDj0=;
 b=rRcDg/swc3IA/jJJcn4fJkFb/byG/+HXbfwwz12ITVA1CM8u8dql2hpcsf60dNkpo8
 OZ8H6cv6I5tdaK9lRKf0yxTkdXEPShDX6Cgvc4bZATZU4riLbSw2HAsx8sGxF3OufFYN
 06BuvtD8e8lR6kLAxmDvVS4BZRo8zRxFWh6m3q85De8k+EUjCRdGnm08BOhMMHXWRU7u
 FRHb4xVszvpaVGaNMHGwuG+mU1eyczoikZqQETr88fJuW5C7RO2VNMdQajMNsmjhKDKV
 2HJdgqPW+8hBKy1A25Clc+nxST4JtA7iJY6fo4N6XWfqfD+hC/x8TAganUYiWdRJsZFS
 isZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DOpemN8SL3iXV33MOdz0Yz/MS9tf3JlAEps9SShQDj0=;
 b=TJbq2ntFthobmhlehIRdeJbTPfCAuNr6oGlO/oIsIpav1Yv/mcWuQCE7aRqcMTYinX
 jwar264v7vjr10YrHvccHGYwv783GZOv/Ze0BDjr9ySHHp6cfiY+InDgwoYSliNpFvrR
 MPykL/XmJYhiKFDo1HuOkgYHwMeLeImmgiak76bpmJnsdtjxoV94ytFECdQRoFS+A8WY
 icv03Wc31C4N4yvchirf0WzuyNLrtJHdBDxT7XCo6dyAspi9tEVURu6hlTM/H8GPGPQc
 Syg8klMxGWswjCzTy36YzxOFpGJ96F05i6GeuC0llHxN2dvgpTGvWruXk9kapIm+14t2
 3dWA==
X-Gm-Message-State: AO0yUKV/4LsjGDL4rwC30qjhrrO6qYf4qQlMlGOILfbSbjutXtSAiiI7
 F19GPblRUz4e0yRfdbSalXBsjcWQEyjbe7XDilk=
X-Google-Smtp-Source: AK7set9Vx5qalK5Lq78lvmVrkagX7KzAZ4a9fWWE33+doBUMivFjIvPo2w+P/qWoQeFFwkfWyoF7nA==
X-Received: by 2002:a05:6a20:9146:b0:bb:b903:d836 with SMTP id
 x6-20020a056a20914600b000bbb903d836mr17308887pzc.54.1678212147900; 
 Tue, 07 Mar 2023 10:02:27 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 48/67] target/mips: Split out gen_lxl
Date: Tue,  7 Mar 2023 09:58:29 -0800
Message-Id: <20230307175848.2508955-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
index 0f27ca6149..f8ea7a54a3 100644
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



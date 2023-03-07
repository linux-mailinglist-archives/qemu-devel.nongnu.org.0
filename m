Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA296AF0D2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:36:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9j-0003lt-2R; Tue, 07 Mar 2023 13:35:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9g-0003hr-Ps
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:20 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9f-0007nq-5u
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:20 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so17432089pjb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CpYXE3rWCu2KbWEioPzYgbPFHINqSc7H2uYvcHXK0eo=;
 b=NMkgx4Ld0ATd2AqtDTJZgfElu2xPdGuvDFhAwrf+wwzjalfg61x5UGR/NhAPN2cf34
 X4yQ96yITnfbS+F+PWItSgNAM0d1SiooyQx9GyFWK0NkSPrBLnKVg8YCDB0YHvh0JdSQ
 1+hmjoynyYvRssUmnf1UWaigd5D3IkkiGnjdZC7PytBVx5xL3vKgmXVz7OpeqzDWcytC
 BXBze4e2aWlTPKixgPrynS3EqH1sIFJhxP7W6qSDoY/8O283NHPUmxQfUokKnhobpj0Y
 BBp13daASeM9VWERUqf+QDrhlvtIoZ1B9R53TwvZ5hUJ2Qawx20cg9g3k8IOwBu0DVU5
 yrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CpYXE3rWCu2KbWEioPzYgbPFHINqSc7H2uYvcHXK0eo=;
 b=RpF+6B5iXIMRC4G4OUPiB/3H2HESQvvcvph5bozn8r6b/oJBtWf1B23X0t+EutW/PQ
 NUY1WvCobJ4IOjszXFqO9DsTH6dRyrZbRWuTw5FcAxDAeT3I41M7BWE4/CGWCfxr7F6y
 MZy3HGXEcfxgVcN+6FAOxrC8hUKry7OhDA/9BTIfaGZ5ZKLwxmQz7/gesPM5zRyhdhMH
 TNfwSMWPFoWBmqDZDi7UmgGdPM2BitvKv5PoSNEsBmow5FO8u/YMxvKlYkMFjfWNuyeR
 ZCBraCQjrpFa++rcQzjPYcngQ8B5gStYZWztdLhYApYM2YacZ/i+SUDgzF/QTZW3zPUp
 4x2g==
X-Gm-Message-State: AO0yUKXYIDLpMSpu9l0QfWFID7t8aSg59G5c0jbLti1v5GB7e8UJRW4v
 ICUUsg4uHXbYn9lIAVyaYmhuHJ3WxA1P0iSLCfQ=
X-Google-Smtp-Source: AK7set9UE30OKhmoJ9NsF5cKbeXa814TVpW9eWqyV2Zo4cJFiJ/sqJYwmoLJ3yYgn/pzmJkgOi7CEQ==
X-Received: by 2002:a17:90a:4bca:b0:230:a195:b8ac with SMTP id
 u10-20020a17090a4bca00b00230a195b8acmr16147459pjl.7.1678214117905; 
 Tue, 07 Mar 2023 10:35:17 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 17/25] target/ppc: Avoid tcg_const_* in vsx-impl.c.inc
Date: Tue,  7 Mar 2023 10:34:55 -0800
Message-Id: <20230307183503.2512684-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

All remaining uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Cédric Le Goater <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: qemu-ppc@nongnu.org
---
 target/ppc/translate/vsx-impl.c.inc | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 9916784e64..0f5b0056f1 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -154,7 +154,7 @@ static void gen_lxvdsx(DisasContext *ctx)
 static void gen_bswap16x8(TCGv_i64 outh, TCGv_i64 outl,
                           TCGv_i64 inh, TCGv_i64 inl)
 {
-    TCGv_i64 mask = tcg_const_i64(0x00FF00FF00FF00FF);
+    TCGv_i64 mask = tcg_constant_i64(0x00FF00FF00FF00FF);
     TCGv_i64 t0 = tcg_temp_new_i64();
     TCGv_i64 t1 = tcg_temp_new_i64();
 
@@ -825,7 +825,7 @@ static bool trans_XSCVQPDP(DisasContext *ctx, arg_X_tb_rc *a)
     REQUIRE_INSNS_FLAGS2(ctx, ISA300);
     REQUIRE_VSX(ctx);
 
-    ro = tcg_const_i32(a->rc);
+    ro = tcg_constant_i32(a->rc);
 
     xt = gen_avr_ptr(a->rt);
     xb = gen_avr_ptr(a->rb);
@@ -860,7 +860,7 @@ static void gen_##name(DisasContext *ctx)                                     \
         gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
         return;                                                               \
     }                                                                         \
-    opc = tcg_const_i32(ctx->opcode);                                         \
+    opc = tcg_constant_i32(ctx->opcode);                                      \
     gen_helper_##name(cpu_env, opc);                                          \
 }
 
@@ -900,7 +900,7 @@ static void gen_##name(DisasContext *ctx)                                     \
         gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
         return;                                                               \
     }                                                                         \
-    opc = tcg_const_i32(ctx->opcode);                                         \
+    opc = tcg_constant_i32(ctx->opcode);                                      \
     xa = gen_vsr_ptr(xA(ctx->opcode));                                        \
     xb = gen_vsr_ptr(xB(ctx->opcode));                                        \
     gen_helper_##name(cpu_env, opc, xa, xb);                                  \
@@ -915,7 +915,7 @@ static void gen_##name(DisasContext *ctx)                                     \
         gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
         return;                                                               \
     }                                                                         \
-    opc = tcg_const_i32(ctx->opcode);                                         \
+    opc = tcg_constant_i32(ctx->opcode);                                      \
     xb = gen_vsr_ptr(xB(ctx->opcode));                                        \
     gen_helper_##name(cpu_env, opc, xb);                                      \
 }
@@ -929,7 +929,7 @@ static void gen_##name(DisasContext *ctx)                                     \
         gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
         return;                                                               \
     }                                                                         \
-    opc = tcg_const_i32(ctx->opcode);                                         \
+    opc = tcg_constant_i32(ctx->opcode);                                      \
     xt = gen_vsr_ptr(rD(ctx->opcode) + 32);                                   \
     xa = gen_vsr_ptr(rA(ctx->opcode) + 32);                                   \
     xb = gen_vsr_ptr(rB(ctx->opcode) + 32);                                   \
@@ -945,7 +945,7 @@ static void gen_##name(DisasContext *ctx)                                     \
         gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
         return;                                                               \
     }                                                                         \
-    opc = tcg_const_i32(ctx->opcode);                                         \
+    opc = tcg_constant_i32(ctx->opcode);                                      \
     xt = gen_vsr_ptr(rD(ctx->opcode) + 32);                                   \
     xb = gen_vsr_ptr(rB(ctx->opcode) + 32);                                   \
     gen_helper_##name(cpu_env, opc, xt, xb);                                  \
@@ -960,7 +960,7 @@ static void gen_##name(DisasContext *ctx)                                     \
         gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
         return;                                                               \
     }                                                                         \
-    opc = tcg_const_i32(ctx->opcode);                                         \
+    opc = tcg_constant_i32(ctx->opcode);                                      \
     xa = gen_vsr_ptr(rA(ctx->opcode) + 32);                                   \
     xb = gen_vsr_ptr(rB(ctx->opcode) + 32);                                   \
     gen_helper_##name(cpu_env, opc, xa, xb);                                  \
@@ -1994,8 +1994,8 @@ static void gen_xsxsigdp(DisasContext *ctx)
     exp = tcg_temp_new_i64();
     t0 = tcg_temp_new_i64();
     t1 = tcg_temp_new_i64();
-    zr = tcg_const_i64(0);
-    nan = tcg_const_i64(2047);
+    zr = tcg_constant_i64(0);
+    nan = tcg_constant_i64(2047);
 
     get_cpu_vsr(t1, xB(ctx->opcode), true);
     tcg_gen_extract_i64(exp, t1, 52, 11);
@@ -2026,8 +2026,8 @@ static void gen_xsxsigqp(DisasContext *ctx)
     get_cpu_vsr(xbl, rB(ctx->opcode) + 32, false);
     exp = tcg_temp_new_i64();
     t0 = tcg_temp_new_i64();
-    zr = tcg_const_i64(0);
-    nan = tcg_const_i64(32767);
+    zr = tcg_constant_i64(0);
+    nan = tcg_constant_i64(32767);
 
     tcg_gen_extract_i64(exp, xbh, 48, 15);
     tcg_gen_movi_i64(t0, 0x0001000000000000);
@@ -2193,8 +2193,8 @@ static void gen_xvxsigdp(DisasContext *ctx)
     get_cpu_vsr(xbl, xB(ctx->opcode), false);
     exp = tcg_temp_new_i64();
     t0 = tcg_temp_new_i64();
-    zr = tcg_const_i64(0);
-    nan = tcg_const_i64(2047);
+    zr = tcg_constant_i64(0);
+    nan = tcg_constant_i64(2047);
 
     tcg_gen_extract_i64(exp, xbh, 52, 11);
     tcg_gen_movi_i64(t0, 0x0010000000000000);
-- 
2.34.1



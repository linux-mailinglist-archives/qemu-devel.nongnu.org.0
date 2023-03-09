Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 402E76B2E4F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:12:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMa7-0003vM-5O; Thu, 09 Mar 2023 15:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa5-0003rm-DH
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:41 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa3-0001Xo-P8
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:41 -0500
Received: by mail-pl1-x635.google.com with SMTP id a2so3221432plm.4
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HqVYTGWT7jeQfdWYdhIL5u6To2oyL4lphfw9D9/1xXA=;
 b=jS7sGjG/wikPd6QhyPFiupJ/AV2+gNT/N3CUkr/I7SPLXLeleATYYRtcHm6VICO9rL
 hoGTFVa+0pLTxS8bkP21w1NLsftWiB0RqnyjVGKk4PiSZDXTbjI0LpiriPtVbpIRZkkp
 J8F7vBY/1i5v7UuNUPOswt8bAXE81sb1HauipJrUOVwfJ6tiiGxH+zaKkwIatmrsurHB
 h0mUNwCjZGUkQQEaa2MIFcR+pPqM8Th/76IfC0P771MExsBcM+TaBg3CfrC+HG0cBczA
 npPFADlxiUcd6Q8QCz+ppMg2IqhvNOYhzlmAb/y4f/CUw1klsIPfQtIfJt5zES39nbLg
 cBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HqVYTGWT7jeQfdWYdhIL5u6To2oyL4lphfw9D9/1xXA=;
 b=cSh+eFxiwuoqVsyG36KKlKviKoZQkicCefe12L32bh/eRh9cEHuMBa/8Nu0RCapYGG
 93RECumv06Pfs6rqIE0E5a5U+8O3H7mqiwdZHLGkZvPCOw3gNXN86i96E4RYg9GSz4Aq
 xOVyAFC/abF10Q43eX/oqzaZeplWVfrPCUBlgvil/AD71e4p0xLh18BSENUmF4y7ZaYt
 QATK2Y5JhAkQnltqaAacg2bqcWNX8GbhWoF+zWzG5s7YDzJ/YSuFxvE/+IRSHdWWGCv2
 qYw3pr9Ln8GP/1LCBc1PzJa69yahAihL3mL2AglpaVt4ocI02nK5vc8UZ4/ga/UU7KD8
 JJeQ==
X-Gm-Message-State: AO0yUKXMHScbIudl5JU13kmV0vKSwp5VBJnP99tV/Ws1SgfVdZc75FwB
 ZGOYjeKieFTykc9Z7+Yy8bvGOdIFCdxG2+6xupg=
X-Google-Smtp-Source: AK7set++YDRDciA0rBnSzFW5vBNwlid828FU/mq96UNeCHtAVl5Woa9zVGizCr4/Ei3f7DcwX/M/cQ==
X-Received: by 2002:a17:902:864b:b0:19e:7889:f9fb with SMTP id
 y11-20020a170902864b00b0019e7889f9fbmr20557762plt.68.1678392578423; 
 Thu, 09 Mar 2023 12:09:38 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 52/91] target/ppc: Split out gen_vx_vmul10
Date: Thu,  9 Mar 2023 12:05:11 -0800
Message-Id: <20230309200550.3878088-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Move the body out of this large macro.
Use tcg_constant_i64.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate/vmx-impl.c.inc | 95 +++++++++++++++--------------
 1 file changed, 49 insertions(+), 46 deletions(-)

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 05ba9c9492..ee656d6a44 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -171,53 +171,56 @@ static void gen_mtvscr(DisasContext *ctx)
     gen_helper_mtvscr(cpu_env, val);
 }
 
+static void gen_vx_vmul10(DisasContext *ctx, bool add_cin, bool ret_carry)
+{
+    TCGv_i64 t0;
+    TCGv_i64 t1;
+    TCGv_i64 t2;
+    TCGv_i64 avr;
+    TCGv_i64 ten, z;
+
+    if (unlikely(!ctx->altivec_enabled)) {
+        gen_exception(ctx, POWERPC_EXCP_VPU);
+        return;
+    }
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    avr = tcg_temp_new_i64();
+    ten = tcg_constant_i64(10);
+    z = tcg_constant_i64(0);
+
+    if (add_cin) {
+        get_avr64(avr, rA(ctx->opcode), false);
+        tcg_gen_mulu2_i64(t0, t1, avr, ten);
+        get_avr64(avr, rB(ctx->opcode), false);
+        tcg_gen_andi_i64(t2, avr, 0xF);
+        tcg_gen_add2_i64(avr, t2, t0, t1, t2, z);
+        set_avr64(rD(ctx->opcode), avr, false);
+    } else {
+        get_avr64(avr, rA(ctx->opcode), false);
+        tcg_gen_mulu2_i64(avr, t2, avr, ten);
+        set_avr64(rD(ctx->opcode), avr, false);
+    }
+
+    if (ret_carry) {
+        get_avr64(avr, rA(ctx->opcode), true);
+        tcg_gen_mulu2_i64(t0, t1, avr, ten);
+        tcg_gen_add2_i64(t0, avr, t0, t1, t2, z);
+        set_avr64(rD(ctx->opcode), avr, false);
+        set_avr64(rD(ctx->opcode), z, true);
+    } else {
+        get_avr64(avr, rA(ctx->opcode), true);
+        tcg_gen_mul_i64(t0, avr, ten);
+        tcg_gen_add_i64(avr, t0, t2);
+        set_avr64(rD(ctx->opcode), avr, true);
+    }
+}
+
 #define GEN_VX_VMUL10(name, add_cin, ret_carry)                         \
-static void glue(gen_, name)(DisasContext *ctx)                         \
-{                                                                       \
-    TCGv_i64 t0;                                                        \
-    TCGv_i64 t1;                                                        \
-    TCGv_i64 t2;                                                        \
-    TCGv_i64 avr;                                                       \
-    TCGv_i64 ten, z;                                                    \
-                                                                        \
-    if (unlikely(!ctx->altivec_enabled)) {                              \
-        gen_exception(ctx, POWERPC_EXCP_VPU);                           \
-        return;                                                         \
-    }                                                                   \
-                                                                        \
-    t0 = tcg_temp_new_i64();                                            \
-    t1 = tcg_temp_new_i64();                                            \
-    t2 = tcg_temp_new_i64();                                            \
-    avr = tcg_temp_new_i64();                                           \
-    ten = tcg_const_i64(10);                                            \
-    z = tcg_const_i64(0);                                               \
-                                                                        \
-    if (add_cin) {                                                      \
-        get_avr64(avr, rA(ctx->opcode), false);                         \
-        tcg_gen_mulu2_i64(t0, t1, avr, ten);                            \
-        get_avr64(avr, rB(ctx->opcode), false);                         \
-        tcg_gen_andi_i64(t2, avr, 0xF);                                 \
-        tcg_gen_add2_i64(avr, t2, t0, t1, t2, z);                       \
-        set_avr64(rD(ctx->opcode), avr, false);                         \
-    } else {                                                            \
-        get_avr64(avr, rA(ctx->opcode), false);                         \
-        tcg_gen_mulu2_i64(avr, t2, avr, ten);                           \
-        set_avr64(rD(ctx->opcode), avr, false);                         \
-    }                                                                   \
-                                                                        \
-    if (ret_carry) {                                                    \
-        get_avr64(avr, rA(ctx->opcode), true);                          \
-        tcg_gen_mulu2_i64(t0, t1, avr, ten);                            \
-        tcg_gen_add2_i64(t0, avr, t0, t1, t2, z);                       \
-        set_avr64(rD(ctx->opcode), avr, false);                         \
-        set_avr64(rD(ctx->opcode), z, true);                            \
-    } else {                                                            \
-        get_avr64(avr, rA(ctx->opcode), true);                          \
-        tcg_gen_mul_i64(t0, avr, ten);                                  \
-        tcg_gen_add_i64(avr, t0, t2);                                   \
-        set_avr64(rD(ctx->opcode), avr, true);                          \
-    }                                                                   \
-}                                                                       \
+    static void glue(gen_, name)(DisasContext *ctx)                     \
+    { gen_vx_vmul10(ctx, add_cin, ret_carry); }
 
 GEN_VX_VMUL10(vmul10uq, 0, 0);
 GEN_VX_VMUL10(vmul10euq, 1, 0);
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20F66B2E91
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:22:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMeM-0001g6-61; Thu, 09 Mar 2023 15:14:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMdl-0000XZ-89
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:13:31 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMdb-0002Gz-BP
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:13:22 -0500
Received: by mail-pl1-x636.google.com with SMTP id p20so3193036plw.13
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z7YRqprwdTrCNTOAhizW1HEhWHUr/bYS0Cm8rOrDsWg=;
 b=AqvM9HxXdvtNJeY8Yk742Lu0EmfQbVJOiQlfXamEt3Z+HIZrWyGUEJWysL4XH7AelV
 aPk4QmF9DxwInPJm8dEaP/wwdzJk8RZJZJZpIy7GUSIW6ZkQargah7/ZVLsnsrzbibQU
 io1HkQlXMKzuqiwkRZIjYWXfXLuZ7ipHl7AlYgztHSLgAJUCUzz4Tis+9df6+iD1WFFi
 zmZU4lAmjUHoR4Eri6Gs8cRvK8r3+Q9NxoZhxdSBZkrIHZOy3dpCkGRpq7owUDhMNu2x
 FQRkER/yxjPbuUcYlbPlWVcpoaBoVbUwjMKKjd5FSpyyuBXQNkSPeYBdB9FoYKjvcW9p
 LnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z7YRqprwdTrCNTOAhizW1HEhWHUr/bYS0Cm8rOrDsWg=;
 b=3IMTmqMStsYSAnrDmYzalM0f7pGkKHV9Vzj0eMSWiuMUbJBwSgWZGSuu1EipVJ7klB
 5jYEV0sMKZPo+BE7s0kjwS7eMtRhj27n8F3EqEx2mL7iXhopLNaDD+PWkQ3/++Iut8Qe
 Dnvuuiud0+njr4IY9jFIZ+MEOoywd0QKsFuA6Fn6xzQ9697dC7JA4E5VPDwTEepiYgaW
 f2xch2Fip8RhOVL3wAOkVmrNmOK8+z3BzG9k9ycm15zMjVRHjUSuwwLfEp62SuA3pznT
 YSOIED9Tu9xIzTF0z0xBg+cg/S0RXoRXjH2kd5E82HdKQz9ELtad0bZ4VPMksk6Bzv6U
 36eg==
X-Gm-Message-State: AO0yUKW6GGkZXEfJSu8JJ2Hpj3HwKlMTMtlYOSE6xWcqVHXezgexXWEY
 wfCLZOxiKoamJlCNfox6ub9oIEohCqKuS/gSMHA=
X-Google-Smtp-Source: AK7set8D3rDeleFuTiCth3jxqC/jRQ7881mLmJ3bNkPuJ67vvA2g+5jSysabtZpbrYI1TTP5TJfqXQ==
X-Received: by 2002:a05:6a20:258c:b0:cd:11e3:4105 with SMTP id
 k12-20020a056a20258c00b000cd11e34105mr22528513pzd.27.1678392787339; 
 Thu, 09 Mar 2023 12:13:07 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a62a50f000000b005b02ddd852dsm11867744pfm.142.2023.03.09.12.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:13:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL v2 83/91] target/ppc: Avoid tcg_const_* in vsx-impl.c.inc
Date: Thu,  9 Mar 2023 12:05:42 -0800
Message-Id: <20230309200550.3878088-84-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

All remaining uses are strictly read-only.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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



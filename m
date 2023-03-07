Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17456AED78
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:04:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbdt-0001Fi-L9; Tue, 07 Mar 2023 13:02:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdp-0000nS-AV
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:26 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdn-000140-9W
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:24 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so17336148pjg.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212142;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=72Gt8OK2VyLNs6ANnBuBGIXyCtS9CGdXXO6mKP5rivM=;
 b=A0eY3tz5/QPlbt9sO6LxbjqXFyn3nQ7IkoYS7hJZTbKJ5j5lLk4mAv21o1hq/X7+NR
 gL+RpwCUsxXpCzP3moYqD/lZ1ReRVQrh42JqfuHFMxnyz41CtySfQFzxQVoAP9Nu6eZL
 3jyc/WybVdA4VYnB7y+MO0+6CsNCjtCQkS0FjE1CquvF4JdXoTAP2V4ZtK5tEBZ8xoWY
 4Wuxe2ZWbR4RYnf/++Qk1Jn4e1i90bMpREe2hnxZmyx2Y6NN2XM8rgMPRgO/yCbFzlOe
 d06j0H5Z79U6bQH9VfHLqWpJUeaTBmRoCBhBTbIPwEsd38jAgCF56Zw8pA6eR/rQGVb5
 VDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212142;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=72Gt8OK2VyLNs6ANnBuBGIXyCtS9CGdXXO6mKP5rivM=;
 b=M9B4uy0Am/47dOioVhhm8UnW8VaUKMaehMHKHdy5WWgniE3Gm+u7SuTrRe83oEtpkC
 0VGGXyAusg3DHsOnIlenaz4Wy3ZX4YY89cYAgAz6k8g7YBuwi3O6g0zebJlZUTvbNm34
 t+sCPnT2fHvFC6SvwM75DFSeKw55V6xQDi0+Fn3AjzBrmX614fo/sobGemqk9x04/mLn
 jwpBrZvjPpyFr8CbAam/a3kcsiUU+sDnzPS77nPd4SQMwFdVpcoXJQDI8TcxKmvS5khc
 K7HebcdjdVTqJEVQDLWVwmzwTzW8K9zOzVhqdJYVTIItnP00N0gRXKykditXqe/pUPRg
 8mhw==
X-Gm-Message-State: AO0yUKX6YqjCz5lCwHB+A+Kuncm9RF6DGhxTbiwxIgMIZXXujVkHqZh1
 MnLJ/lA+l31uo3NLn5W+yxvugXKJhj1MfQRvBtE=
X-Google-Smtp-Source: AK7set8zJrsA+5xCKMhk2nXcMRxVHGta8c/jG0XPXZgH8Ij3+skyrxmnLJ16MLjQLjNLqS7dFPqITA==
X-Received: by 2002:a05:6a20:b712:b0:cc:a1dd:d0c1 with SMTP id
 fg18-20020a056a20b71200b000cca1ddd0c1mr15370821pzb.50.1678212141969; 
 Tue, 07 Mar 2023 10:02:21 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 40/67] target/avr: Avoid use of tcg_const_i32 throughout
Date: Tue,  7 Mar 2023 09:58:21 -0800
Message-Id: <20230307175848.2508955-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
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

All remaining uses are strictly read-only.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index 190d0c3f97..a6aeae6dfa 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -400,7 +400,7 @@ static bool trans_SUB(DisasContext *ctx, arg_SUB *a)
 static bool trans_SUBI(DisasContext *ctx, arg_SUBI *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv Rr = tcg_const_i32(a->imm);
+    TCGv Rr = tcg_constant_i32(a->imm);
     TCGv R = tcg_temp_new_i32();
 
     tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Imm */
@@ -425,7 +425,7 @@ static bool trans_SBC(DisasContext *ctx, arg_SBC *a)
     TCGv Rd = cpu_r[a->rd];
     TCGv Rr = cpu_r[a->rr];
     TCGv R = tcg_temp_new_i32();
-    TCGv zero = tcg_const_i32(0);
+    TCGv zero = tcg_constant_i32(0);
 
     tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr - Cf */
     tcg_gen_sub_tl(R, R, cpu_Cf);
@@ -453,9 +453,9 @@ static bool trans_SBC(DisasContext *ctx, arg_SBC *a)
 static bool trans_SBCI(DisasContext *ctx, arg_SBCI *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv Rr = tcg_const_i32(a->imm);
+    TCGv Rr = tcg_constant_i32(a->imm);
     TCGv R = tcg_temp_new_i32();
-    TCGv zero = tcg_const_i32(0);
+    TCGv zero = tcg_constant_i32(0);
 
     tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr - Cf */
     tcg_gen_sub_tl(R, R, cpu_Cf);
@@ -637,7 +637,7 @@ static bool trans_COM(DisasContext *ctx, arg_COM *a)
 static bool trans_NEG(DisasContext *ctx, arg_NEG *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv t0 = tcg_const_i32(0);
+    TCGv t0 = tcg_constant_i32(0);
     TCGv R = tcg_temp_new_i32();
 
     tcg_gen_sub_tl(R, t0, Rd); /* R = 0 - Rd */
@@ -930,19 +930,19 @@ static void gen_jmp_z(DisasContext *ctx)
 static void gen_push_ret(DisasContext *ctx, int ret)
 {
     if (avr_feature(ctx->env, AVR_FEATURE_1_BYTE_PC)) {
-        TCGv t0 = tcg_const_i32((ret & 0x0000ff));
+        TCGv t0 = tcg_constant_i32(ret & 0x0000ff);
 
         tcg_gen_qemu_st_tl(t0, cpu_sp, MMU_DATA_IDX, MO_UB);
         tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
     } else if (avr_feature(ctx->env, AVR_FEATURE_2_BYTE_PC)) {
-        TCGv t0 = tcg_const_i32((ret & 0x00ffff));
+        TCGv t0 = tcg_constant_i32(ret & 0x00ffff);
 
         tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
         tcg_gen_qemu_st_tl(t0, cpu_sp, MMU_DATA_IDX, MO_BEUW);
         tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
     } else if (avr_feature(ctx->env, AVR_FEATURE_3_BYTE_PC)) {
-        TCGv lo = tcg_const_i32((ret & 0x0000ff));
-        TCGv hi = tcg_const_i32((ret & 0xffff00) >> 8);
+        TCGv lo = tcg_constant_i32(ret & 0x0000ff);
+        TCGv hi = tcg_constant_i32((ret & 0xffff00) >> 8);
 
         tcg_gen_qemu_st_tl(lo, cpu_sp, MMU_DATA_IDX, MO_UB);
         tcg_gen_subi_tl(cpu_sp, cpu_sp, 2);
@@ -1211,7 +1211,7 @@ static bool trans_CPC(DisasContext *ctx, arg_CPC *a)
     TCGv Rd = cpu_r[a->rd];
     TCGv Rr = cpu_r[a->rr];
     TCGv R = tcg_temp_new_i32();
-    TCGv zero = tcg_const_i32(0);
+    TCGv zero = tcg_constant_i32(0);
 
     tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr - Cf */
     tcg_gen_sub_tl(R, R, cpu_Cf);
@@ -1238,7 +1238,7 @@ static bool trans_CPI(DisasContext *ctx, arg_CPI *a)
 {
     TCGv Rd = cpu_r[a->rd];
     int Imm = a->imm;
-    TCGv Rr = tcg_const_i32(Imm);
+    TCGv Rr = tcg_constant_i32(Imm);
     TCGv R = tcg_temp_new_i32();
 
     tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr */
@@ -2124,7 +2124,7 @@ static bool trans_SPMX(DisasContext *ctx, arg_SPMX *a)
 static bool trans_IN(DisasContext *ctx, arg_IN *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv port = tcg_const_i32(a->imm);
+    TCGv port = tcg_constant_i32(a->imm);
 
     gen_helper_inb(Rd, cpu_env, port);
     return true;
@@ -2137,7 +2137,7 @@ static bool trans_IN(DisasContext *ctx, arg_IN *a)
 static bool trans_OUT(DisasContext *ctx, arg_OUT *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv port = tcg_const_i32(a->imm);
+    TCGv port = tcg_constant_i32(a->imm);
 
     gen_helper_outb(cpu_env, port, Rd);
     return true;
@@ -2405,7 +2405,7 @@ static bool trans_SWAP(DisasContext *ctx, arg_SWAP *a)
 static bool trans_SBI(DisasContext *ctx, arg_SBI *a)
 {
     TCGv data = tcg_temp_new_i32();
-    TCGv port = tcg_const_i32(a->reg);
+    TCGv port = tcg_constant_i32(a->reg);
 
     gen_helper_inb(data, cpu_env, port);
     tcg_gen_ori_tl(data, data, 1 << a->bit);
@@ -2420,7 +2420,7 @@ static bool trans_SBI(DisasContext *ctx, arg_SBI *a)
 static bool trans_CBI(DisasContext *ctx, arg_CBI *a)
 {
     TCGv data = tcg_temp_new_i32();
-    TCGv port = tcg_const_i32(a->reg);
+    TCGv port = tcg_constant_i32(a->reg);
 
     gen_helper_inb(data, cpu_env, port);
     tcg_gen_andi_tl(data, data, ~(1 << a->bit));
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB02A6B2E7F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:21:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMaA-000455-Vt; Thu, 09 Mar 2023 15:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa7-0003wi-O3
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:43 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa6-0001Yo-4l
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:43 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so7393005pjb.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1YHQGX/lZqTZc1F+qrfJD0NpxECIkjQPgh9T1q66oi4=;
 b=XxbbJRvzMZSXDu19FBT2MrDsroP9xm4+voqULAneSgF0ibgZOruAFP74pOMH8lSrUs
 JFcdt1DCkoCwndoJorSgtyHGFlx81sS/S5nJ8sYEdz9b6vw29DQob6wefqU7OPr7Nrzh
 A91f0XJdO6/WdcZkyN6pmyV9pBpLEy2D4A9fDyDDlt9PStiO4hO6SSzRQoKagXDJv7iA
 9gSbVjCnY1QdtGrjn0H3+3i7hcddTXYr6WV6s4Y33JMBc6QN0NGm8MeLZ/y2xR4DSv/3
 zS6rCJK5n50XxCw+wkn587jTOoaRRMixWnuwhRlaMAlUUXwMBkzSJPk8DsnwBc/4GwQ5
 6hZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1YHQGX/lZqTZc1F+qrfJD0NpxECIkjQPgh9T1q66oi4=;
 b=7rFMy/3wG8reAdReWGFe+s6IR/9uPWyRkzVj2t1Btg9dpU89xmTrK/uorVw24iuSd4
 Bb89n1G0g1zh8GrGpCqBFhcV3x5tuI9luzK2uZHO1Tj9TecvAcGdEGAR5eWbBtR7yrL7
 JwTeJVaHIt75FAdOtYgWJ1AnRxvqO4mHz6biQTcAPlVOPSo0zEeZCno4lajbcyaVTZvY
 6mw1gGqZ3gb+TaIPHxNIJDAbr+wKF42PbQqxOqGd+l8mQE9TKN4UYx+j5RIyi5WFlRKF
 CPzd/wCCbpy0G78+QZ6LWF7TCapSC20MQ+ECl4Mo1etSltTHW/JxKzi8rnQh2fEX2fl9
 yLkQ==
X-Gm-Message-State: AO0yUKU2kxWnPdKQWg99toCykJpfUowAShR6i2pNj/A3aAs0Xn0CKBTf
 V0jky8OGxfaBEubGK5MS6lVtN8bHKHwtnf16w7Y=
X-Google-Smtp-Source: AK7set/H4jbEfZYCUEUBZ5BAhVvG2xgGt2mQ1FIqjTJx2fSR+3Y0YsWkstc2qbBbKtphS8mWTTtjnQ==
X-Received: by 2002:a17:902:aa02:b0:19a:839d:b682 with SMTP id
 be2-20020a170902aa0200b0019a839db682mr20825278plb.17.1678392580986; 
 Thu, 09 Mar 2023 12:09:40 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 55/91] target/rx: Use cpu_psw_z as temp in flags computation
Date: Thu,  9 Mar 2023 12:05:14 -0800
Message-Id: <20230309200550.3878088-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Since PSW_Z = PSW_S, we can move that assignment to the end
and use PSW_Z as a temporary while computing PSW_O.
Use tcg_constant_i32 instead of tcg_const_i32.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/translate.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index 998e6e0b7e..c47aa26893 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -967,14 +967,13 @@ static bool trans_NEG_rr(DisasContext *ctx, arg_NEG_rr *a)
 /* ret = arg1 + arg2 + psw_c */
 static void rx_adc(TCGv ret, TCGv arg1, TCGv arg2)
 {
-    TCGv z;
-    z = tcg_const_i32(0);
+    TCGv z = tcg_constant_i32(0);
     tcg_gen_add2_i32(cpu_psw_s, cpu_psw_c, arg1, z, cpu_psw_c, z);
     tcg_gen_add2_i32(cpu_psw_s, cpu_psw_c, cpu_psw_s, cpu_psw_c, arg2, z);
-    tcg_gen_mov_i32(cpu_psw_z, cpu_psw_s);
     tcg_gen_xor_i32(cpu_psw_o, cpu_psw_s, arg1);
-    tcg_gen_xor_i32(z, arg1, arg2);
-    tcg_gen_andc_i32(cpu_psw_o, cpu_psw_o, z);
+    tcg_gen_xor_i32(cpu_psw_z, arg1, arg2);
+    tcg_gen_andc_i32(cpu_psw_o, cpu_psw_o, cpu_psw_z);
+    tcg_gen_mov_i32(cpu_psw_z, cpu_psw_s);
     tcg_gen_mov_i32(ret, cpu_psw_s);
 }
 
@@ -1006,13 +1005,12 @@ static bool trans_ADC_mr(DisasContext *ctx, arg_ADC_mr *a)
 /* ret = arg1 + arg2 */
 static void rx_add(TCGv ret, TCGv arg1, TCGv arg2)
 {
-    TCGv z;
-    z = tcg_const_i32(0);
+    TCGv z = tcg_constant_i32(0);
     tcg_gen_add2_i32(cpu_psw_s, cpu_psw_c, arg1, z, arg2, z);
-    tcg_gen_mov_i32(cpu_psw_z, cpu_psw_s);
     tcg_gen_xor_i32(cpu_psw_o, cpu_psw_s, arg1);
-    tcg_gen_xor_i32(z, arg1, arg2);
-    tcg_gen_andc_i32(cpu_psw_o, cpu_psw_o, z);
+    tcg_gen_xor_i32(cpu_psw_z, arg1, arg2);
+    tcg_gen_andc_i32(cpu_psw_o, cpu_psw_o, cpu_psw_z);
+    tcg_gen_mov_i32(cpu_psw_z, cpu_psw_s);
     tcg_gen_mov_i32(ret, cpu_psw_s);
 }
 
@@ -1042,23 +1040,23 @@ static bool trans_ADD_rrr(DisasContext *ctx, arg_ADD_rrr *a)
 /* ret = arg1 - arg2 */
 static void rx_sub(TCGv ret, TCGv arg1, TCGv arg2)
 {
-    TCGv temp;
     tcg_gen_sub_i32(cpu_psw_s, arg1, arg2);
-    tcg_gen_mov_i32(cpu_psw_z, cpu_psw_s);
     tcg_gen_setcond_i32(TCG_COND_GEU, cpu_psw_c, arg1, arg2);
     tcg_gen_xor_i32(cpu_psw_o, cpu_psw_s, arg1);
-    temp = tcg_temp_new_i32();
-    tcg_gen_xor_i32(temp, arg1, arg2);
-    tcg_gen_and_i32(cpu_psw_o, cpu_psw_o, temp);
+    tcg_gen_xor_i32(cpu_psw_z, arg1, arg2);
+    tcg_gen_and_i32(cpu_psw_o, cpu_psw_o, cpu_psw_z);
+    tcg_gen_mov_i32(cpu_psw_z, cpu_psw_s);
     /* CMP not required return */
     if (ret) {
         tcg_gen_mov_i32(ret, cpu_psw_s);
     }
 }
+
 static void rx_cmp(TCGv dummy, TCGv arg1, TCGv arg2)
 {
     rx_sub(NULL, arg1, arg2);
 }
+
 /* ret = arg1 - arg2 - !psw_c */
 /* -> ret = arg1 + ~arg2 + psw_c */
 static void rx_sbb(TCGv ret, TCGv arg1, TCGv arg2)
-- 
2.34.1



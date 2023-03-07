Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9196AEDA3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:06:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbeA-0003uf-SU; Tue, 07 Mar 2023 13:02:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbe8-0003l9-7i
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:44 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbe5-000196-7c
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:43 -0500
Received: by mail-pl1-x631.google.com with SMTP id p20so14971577plw.13
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bKM0bNi+bGbemfNi13MOZDw6jZ406vYwPMARRJAQjkA=;
 b=nrYl8LsWkiTky6u+zRUsl/ecsezosrSAjAXR4eRTPA4bIJ3zQL9Bc4wLP+0R5sVVpa
 JGHX/tILOVJ7UObN+9GR9inBBHzvgpqkyPDTeVu00GZBw0B770a2NbS9ud74+qpvgYTP
 peaR6JQOUi85Yeykg9wQWEOXP61wxBdrJTJyu/yy7zgMcvyu28BbKlesm+JSECEiNBCD
 lXWPIPUgjPZyW4YD5nq6es+i1sjAxxhnayXgnQ4dM38JHG4bveyh8kDyrJLXHst4zwi4
 0vRR3F+lB9/EcgPj90Js/azQacqaMjys/BM/V/1fkLaQOiGlgMvJdryujC5SjMnGg04H
 RyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bKM0bNi+bGbemfNi13MOZDw6jZ406vYwPMARRJAQjkA=;
 b=6kg5+xouZFd4lkVw7C+OO2zNGJoP6euWok4tGtyjmUSl40YnAAjXW9cPEozA1PbDWO
 Rc5j4uMLaoMZq8pFbWTUYL8mOc2QGarevCXaEnuvcZKMJ9I0KGibCeHdIfi8R0sHW/ZI
 Vnkbgh15wxbTc0/19mdLfkDUye9XZjtThFyHsFbbjAv4imxfA7JuAiVL9iBj3xAw6QQm
 HD2+XnNzxV1q/TjYzPkyJiU3V96B/YtP0F4FMzmbAizMAzdpiB27dVbtjf7/yp6/slQ1
 sAJp7QVbNEeu7zJFCATLe/KEhjVk+bdoPnzvMQtEpjOz0iNyZ3msA3HBdo5zSbFUdLDk
 w3Yg==
X-Gm-Message-State: AO0yUKUmYXO+nK+9z0B3gOsH440lD/pXfRtJYQK8OJOtx8wWWAnvovS2
 /Fnysj3ZR+gc2NOkS0lF1qpBF3vUid1ah0yr98w=
X-Google-Smtp-Source: AK7set9Y5YxEVfpkpTTLmfYnIJKS4o5p682q5LrZYD2OpPDjwR0a+6aTfthqrjSzYG5jwJHv/OOrDA==
X-Received: by 2002:a05:6a20:3d82:b0:cd:1808:87c7 with SMTP id
 s2-20020a056a203d8200b000cd180887c7mr17838200pzi.15.1678212159607; 
 Tue, 07 Mar 2023 10:02:39 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 62/67] target/tricore: Split t_n as constant from temp as
 variable
Date: Tue,  7 Mar 2023 09:58:43 -0800
Message-Id: <20230307175848.2508955-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

As required, allocate temp separately.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 268 +++++++++++++++++++------------------
 1 file changed, 140 insertions(+), 128 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 127f9a989a..194bef27a6 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -595,21 +595,22 @@ static inline void
 gen_madd_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
            TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_extr_i64_i32(temp, temp2, temp64);
@@ -621,21 +622,22 @@ static inline void
 gen_maddsu_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
              TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_extr_i64_i32(temp, temp2, temp64);
@@ -647,22 +649,22 @@ static inline void
 gen_maddsum_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
               TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     TCGv_i64 temp64_2 = tcg_temp_new_i64();
     TCGv_i64 temp64_3 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_concat_i32_i64(temp64_3, r1_low, r1_high);
@@ -682,23 +684,24 @@ static inline void
 gen_madds_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
            TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv temp3 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
 
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_extr_i64_i32(temp, temp2, temp64);
@@ -718,23 +721,24 @@ static inline void
 gen_maddsus_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
               TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv temp3 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
 
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_extr_i64_i32(temp, temp2, temp64);
@@ -752,22 +756,22 @@ static inline void
 gen_maddsums_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
                TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     TCGv_i64 temp64_2 = tcg_temp_new_i64();
 
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_sari_i64(temp64_2, temp64, 32); /* high */
@@ -785,22 +789,22 @@ static inline void
 gen_maddm_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
            TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     TCGv_i64 temp64_2 = tcg_temp_new_i64();
     TCGv_i64 temp64_3 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mulm_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_concat_i32_i64(temp64_2, r1_low, r1_high);
@@ -813,21 +817,21 @@ static inline void
 gen_maddms_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
            TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     TCGv_i64 temp64_2 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mulm_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_concat_i32_i64(temp64_2, r1_low, r1_high);
@@ -839,20 +843,20 @@ static inline void
 gen_maddr64_h(TCGv ret, TCGv r1_low, TCGv r1_high, TCGv r2, TCGv r3, uint32_t n,
               uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     gen_helper_addr_h(ret, cpu_env, temp64, r1_low, r1_high);
@@ -872,21 +876,22 @@ gen_maddr32_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
 static inline void
 gen_maddsur32_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_andi_tl(temp2, r1, 0xffff0000);
@@ -899,20 +904,20 @@ static inline void
 gen_maddr64s_h(TCGv ret, TCGv r1_low, TCGv r1_high, TCGv r2, TCGv r3,
                uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     gen_helper_addr_h_ssov(ret, cpu_env, temp64, r1_low, r1_high);
@@ -932,21 +937,22 @@ gen_maddr32s_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
 static inline void
 gen_maddsur32s_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_andi_tl(temp2, r1, 0xffff0000);
@@ -957,15 +963,15 @@ gen_maddsur32s_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
 static inline void
 gen_maddr_q(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n)
 {
-    TCGv temp = tcg_const_i32(n);
-    gen_helper_maddr_q(ret, cpu_env, r1, r2, r3, temp);
+    TCGv t_n = tcg_constant_i32(n);
+    gen_helper_maddr_q(ret, cpu_env, r1, r2, r3, t_n);
 }
 
 static inline void
 gen_maddrs_q(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n)
 {
-    TCGv temp = tcg_const_i32(n);
-    gen_helper_maddr_q_ssov(ret, cpu_env, r1, r2, r3, temp);
+    TCGv t_n = tcg_constant_i32(n);
+    gen_helper_maddr_q_ssov(ret, cpu_env, r1, r2, r3, t_n);
 }
 
 static inline void
@@ -1176,10 +1182,10 @@ gen_madds64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
              TCGv arg3, uint32_t n)
 {
     TCGv_i64 r1 = tcg_temp_new_i64();
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
 
     tcg_gen_concat_i32_i64(r1, arg1_low, arg1_high);
-    gen_helper_madd64_q_ssov(r1, cpu_env, r1, arg2, arg3, temp);
+    gen_helper_madd64_q_ssov(r1, cpu_env, r1, arg2, arg3, t_n);
     tcg_gen_extr_i64_i32(rl, rh, r1);
 }
 
@@ -1516,21 +1522,22 @@ static inline void
 gen_msub_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
            TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_extr_i64_i32(temp, temp2, temp64);
@@ -1542,23 +1549,24 @@ static inline void
 gen_msubs_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
             TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv temp3 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
 
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_extr_i64_i32(temp, temp2, temp64);
@@ -1576,22 +1584,22 @@ static inline void
 gen_msubm_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
             TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     TCGv_i64 temp64_2 = tcg_temp_new_i64();
     TCGv_i64 temp64_3 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mulm_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_concat_i32_i64(temp64_2, r1_low, r1_high);
@@ -1604,21 +1612,21 @@ static inline void
 gen_msubms_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
              TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     TCGv_i64 temp64_2 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mulm_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_concat_i32_i64(temp64_2, r1_low, r1_high);
@@ -1630,20 +1638,20 @@ static inline void
 gen_msubr64_h(TCGv ret, TCGv r1_low, TCGv r1_high, TCGv r2, TCGv r3, uint32_t n,
               uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     gen_helper_subr_h(ret, cpu_env, temp64, r1_low, r1_high);
@@ -1664,20 +1672,20 @@ static inline void
 gen_msubr64s_h(TCGv ret, TCGv r1_low, TCGv r1_high, TCGv r2, TCGv r3,
                uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     gen_helper_subr_h_ssov(ret, cpu_env, temp64, r1_low, r1_high);
@@ -1912,10 +1920,10 @@ gen_msubs64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
              TCGv arg3, uint32_t n)
 {
     TCGv_i64 r1 = tcg_temp_new_i64();
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
 
     tcg_gen_concat_i32_i64(r1, arg1_low, arg1_high);
-    gen_helper_msub64_q_ssov(r1, cpu_env, r1, arg2, arg3, temp);
+    gen_helper_msub64_q_ssov(r1, cpu_env, r1, arg2, arg3, t_n);
     tcg_gen_extr_i64_i32(rl, rh, r1);
 }
 
@@ -1923,21 +1931,22 @@ static inline void
 gen_msubad_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
              TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_extr_i64_i32(temp, temp2, temp64);
@@ -1949,22 +1958,22 @@ static inline void
 gen_msubadm_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
               TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     TCGv_i64 temp64_2 = tcg_temp_new_i64();
     TCGv_i64 temp64_3 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_concat_i32_i64(temp64_3, r1_low, r1_high);
@@ -1981,21 +1990,22 @@ gen_msubadm_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
 static inline void
 gen_msubadr32_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_andi_tl(temp2, r1, 0xffff0000);
@@ -2007,23 +2017,24 @@ static inline void
 gen_msubads_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
               TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv temp3 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
 
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_extr_i64_i32(temp, temp2, temp64);
@@ -2041,22 +2052,22 @@ static inline void
 gen_msubadms_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
                TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     TCGv_i64 temp64_2 = tcg_temp_new_i64();
 
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_sari_i64(temp64_2, temp64, 32); /* high */
@@ -2072,21 +2083,22 @@ gen_msubadms_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
 static inline void
 gen_msubadr32s_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_andi_tl(temp2, r1, 0xffff0000);
-- 
2.34.1



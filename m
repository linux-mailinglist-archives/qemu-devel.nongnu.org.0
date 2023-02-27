Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186446A3D08
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:29:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWN5-0003KP-WF; Mon, 27 Feb 2023 00:48:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMc-0000MR-KK
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:47:54 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMY-000718-4P
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:47:54 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so5040258pja.5
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rl72DxjHCuAt8m2JA2lIrs6gx/xD/HZtPB0tpD3hLcY=;
 b=oBtLo43qqmUNwIOXRSaS7NJqlCVxM5fCrvorXVyxsTZkmOn4w7SGih4Gxr6E9kd3mD
 ZnXDTTvf+F3KGVdAEZWgtFMZh9G0hPcuZ0xnoKECcHgrEM60rNqe3TYT+FXqzfJOIBrh
 Vmzwxr/RSW9SEeGR96aG3KwuD518lnpLcD46LPdVDHplR+SAL3JOG5iraVbplXMWM1J7
 oxwsAmOkAGu8xBvR2GAKM4rdsvGVRsMetBh9IEuQeLWfDZZq+YgzktY8zDZ8goEMV2Xe
 zNR2o8QK7VMI01D3rj/pI3Fki0vxJxCbZyyh63ZT3eqjg2sJgQwdqPX6T1VWtNVJScVt
 MexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rl72DxjHCuAt8m2JA2lIrs6gx/xD/HZtPB0tpD3hLcY=;
 b=cJ7wDpMeM/037kSgQTWQJysyfSWNhhQuzvK4VQhPRmTxIkA01aQu/W/zBRAtY2GTuG
 inIjGwnSWGUxRqBDjWINKUrehOAhkabnnNaoZC7QZVe968ATDdyizPVZv6F4O7xor9VI
 i+fEYHpWu1UNmsD2zn26HvDWFa0b6n46VhYyGKeTgo5wtblzYbv+GLKEiUI4XkNi2A47
 my5XXiV21560VhcLvR/DdwiaDWOYfKfocx3cowiD5q/qpOQ0RzWcpy1D4vU9riRSuSX5
 6k9/W7oT6OpZvAP0zZf4mf/ONmpxPpwa4lTP+aOIFPjHDPoa1Hh3UlhJHmxpa3qqR04P
 cMCw==
X-Gm-Message-State: AO0yUKV3PwL7ls2IM4bC1o19uyhjLl+x42o8aAatVdXh2C7H/iqZUvF0
 V4RnggTkuFHU1xumRT1wGhfjvhf2c6RY2Fk7C6c=
X-Google-Smtp-Source: AK7set9zytKR5+kCKJCYMHIKy2yFPqVVftnZbkLN3BuP4qsaD307PwXYopPvTWpiixfmfexbOg2urg==
X-Received: by 2002:a17:903:27c8:b0:19c:f232:21ca with SMTP id
 km8-20020a17090327c800b0019cf23221camr5679677plb.3.1677476869212; 
 Sun, 26 Feb 2023 21:47:49 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:47:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 47/70] target/rx: Use cpu_psw_z as temp in flags computation
Date: Sun, 26 Feb 2023 19:42:10 -1000
Message-Id: <20230227054233.390271-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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



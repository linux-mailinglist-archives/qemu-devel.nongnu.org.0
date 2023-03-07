Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C326AED7F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:05:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbdx-0001vq-1I; Tue, 07 Mar 2023 13:02:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdr-0001C9-RX
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:27 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdp-00014U-Oz
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:27 -0500
Received: by mail-pl1-x635.google.com with SMTP id n6so15026828plf.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AhVatxhyEldE+yYtq9OhUIXdN3LtIGdHxXg5mFLB9H0=;
 b=J2w4MD8YL00tLftTYN3ML/dGGwwWqDQn+HPW7E7ZbJjj6Qad52MsTySUyl9pKaWtIn
 xI2lPQZ5Lslww/UG6IWB1PwFIpKQkIUoo1uOkrmYppY9sVx/jl5s24J/Is1mXTDpns0i
 cr5LIhNtBjuzyWPQvJ09cyqwbDhaXZk42nSZYIn0mzyhyKCD1jFWbXRF/z882BTN6/F8
 YKX1IKfdnQ3xbAsoGv0hCx6Y/CvAtijfecuwO7/IqL5V94RzJ25bCpJx2Qo5ynS3lr9e
 oW2yjn8FzJtJHhwHE7C5nEZzlUICxSDxQrSZa9syztzZqX0+kKCtQM0fgjbRlCwRbiIe
 u0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AhVatxhyEldE+yYtq9OhUIXdN3LtIGdHxXg5mFLB9H0=;
 b=PHApYud8YLtg1HT8dUH/L03AR1Bgvbjax6Mq2DcVId1if/fP3LPl1c0somYPH7swu8
 ruhS5PMBX9g1gIcpFiAaGUdOI+3RFUX80OMdii0/JUE0yVFmbzvnosGS+Xp5dq6aF32e
 iJfF0VwGCNFpdDI/rsXdiKSYfnAi0n3Qh5NCu5K1zagi+OILpjomFuFt0fk/PffOGLwo
 hrnQSdnzeCkZqLz7oCZ9z9g0Zn7N4IekAOksPeh2yBawlQ9MtmX/KeY5Fatuj5dBVV6t
 bYY6LhfX/Z8SwFvnEZNj7ysHhWAzOZRlTLPo+5YkoD2qF76MfovqT9yql+3aS6PlnsZx
 9UJQ==
X-Gm-Message-State: AO0yUKXcFPtGEe9AtMlbYoDIs9U15CpyFcR0lHs2QFHDg/k03Hl9BK2w
 4q2h2qdgm0I6sVLpivmmesSnKvoUBmzbU5XVzPg=
X-Google-Smtp-Source: AK7set/v1wV91M/rbWYUP6qHFhTYyBxiIV5XQogMdz1qML9B5B5GaSarugO4VTaBTYYgACleur1k6w==
X-Received: by 2002:a05:6a20:6922:b0:cd:a334:a52b with SMTP id
 q34-20020a056a20692200b000cda334a52bmr12571663pzj.30.1678212144222; 
 Tue, 07 Mar 2023 10:02:24 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 43/67] target/hppa: Avoid use of tcg_const_i32 throughout
Date: Tue,  7 Mar 2023 09:58:24 -0800
Message-Id: <20230307175848.2508955-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
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

All uses were read-write, so replace with a new
allocation and initialization.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/translate.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 3ea50d0cec..6a3154ebc6 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -135,8 +135,6 @@
 #define tcg_gen_extract_reg  tcg_gen_extract_i64
 #define tcg_gen_sextract_reg tcg_gen_sextract_i64
 #define tcg_gen_extract2_reg tcg_gen_extract2_i64
-#define tcg_const_reg        tcg_const_i64
-#define tcg_const_local_reg  tcg_const_local_i64
 #define tcg_constant_reg     tcg_constant_i64
 #define tcg_gen_movcond_reg  tcg_gen_movcond_i64
 #define tcg_gen_add2_reg     tcg_gen_add2_i64
@@ -228,8 +226,6 @@
 #define tcg_gen_extract_reg  tcg_gen_extract_i32
 #define tcg_gen_sextract_reg tcg_gen_sextract_i32
 #define tcg_gen_extract2_reg tcg_gen_extract2_i32
-#define tcg_const_reg        tcg_const_i32
-#define tcg_const_local_reg  tcg_const_local_i32
 #define tcg_constant_reg     tcg_constant_i32
 #define tcg_gen_movcond_reg  tcg_gen_movcond_i32
 #define tcg_gen_add2_reg     tcg_gen_add2_i32
@@ -574,7 +570,9 @@ static TCGv_i32 load_frw_i32(unsigned rt)
 static TCGv_i32 load_frw0_i32(unsigned rt)
 {
     if (rt == 0) {
-        return tcg_const_i32(0);
+        TCGv_i32 ret = tcg_temp_new_i32();
+        tcg_gen_movi_i32(ret, 0);
+        return ret;
     } else {
         return load_frw_i32(rt);
     }
@@ -582,15 +580,15 @@ static TCGv_i32 load_frw0_i32(unsigned rt)
 
 static TCGv_i64 load_frw0_i64(unsigned rt)
 {
+    TCGv_i64 ret = tcg_temp_new_i64();
     if (rt == 0) {
-        return tcg_const_i64(0);
+        tcg_gen_movi_i64(ret, 0);
     } else {
-        TCGv_i64 ret = tcg_temp_new_i64();
         tcg_gen_ld32u_i64(ret, cpu_env,
                           offsetof(CPUHPPAState, fr[rt & 31])
                           + (rt & 32 ? LO_OFS : HI_OFS));
-        return ret;
     }
+    return ret;
 }
 
 static void save_frw_i32(unsigned rt, TCGv_i32 val)
@@ -613,7 +611,9 @@ static TCGv_i64 load_frd(unsigned rt)
 static TCGv_i64 load_frd0(unsigned rt)
 {
     if (rt == 0) {
-        return tcg_const_i64(0);
+        TCGv_i64 ret = tcg_temp_new_i64();
+        tcg_gen_movi_i64(ret, 0);
+        return ret;
     } else {
         return load_frd(rt);
     }
@@ -3330,7 +3330,8 @@ static bool do_depw_sar(DisasContext *ctx, unsigned rt, unsigned c,
     /* Convert big-endian bit numbering in SAR to left-shift.  */
     tcg_gen_xori_reg(shift, cpu_sar, TARGET_REGISTER_BITS - 1);
 
-    mask = tcg_const_reg(msb + (msb - 1));
+    mask = tcg_temp_new();
+    tcg_gen_movi_reg(mask, msb + (msb - 1));
     tcg_gen_and_reg(tmp, val, mask);
     if (rs) {
         tcg_gen_shl_reg(mask, mask, shift);
-- 
2.34.1



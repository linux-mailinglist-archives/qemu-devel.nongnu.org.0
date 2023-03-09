Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68016B2E50
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:12:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMa1-0003XC-P1; Thu, 09 Mar 2023 15:09:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMZx-0003Ft-84
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:33 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMZv-0001V9-I2
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:32 -0500
Received: by mail-pl1-x629.google.com with SMTP id i3so3213342plg.6
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AhVatxhyEldE+yYtq9OhUIXdN3LtIGdHxXg5mFLB9H0=;
 b=yvpync0BOdY6b474bVQSKKzLuW/NLcKAhz9gCr1FWnTqGdofysBuYHBAx4zrfchbPI
 oNA54PEfT+qGV/HaElvcJdlSFtZaNiNNGDivCAsY9oXrZZiRIvwQyj0JbIaxNkGjr9tJ
 goT8aVkhLbPw0BfJFF21F+d8JR4Gse0a8H38ZFNcFRq1h6VSFml63g+VRevRLfOSAP1F
 U6En3uBXJbtfIWPWEynOJfFuAVBpE4cl4t8dY2dbN9RbF6WSuCz8stdyeC9K1weYgcZw
 l49fiQtNiEa0MsD58x7p9U5/DoeevfcRuF2Ode/WVroXEALlRoP/cvuZgLw9qUFu9qBr
 n5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AhVatxhyEldE+yYtq9OhUIXdN3LtIGdHxXg5mFLB9H0=;
 b=2G8KDy0vtR3CIj8sfufrJUgDMdWDW2cL9wf0mUeWcU2w3d9iGDijR7vv8UJAUuyy4T
 B8JizwMwp6hhRjyUob9bxTegNn7tXnM26jXRrYBY8ZZsyf3cdDXdGMXIfQf5mpc1nhah
 ffFBZieyeaFXdC2IvId++1GWqkl+RxvXhDZSujx6Um3vHUNUpnWAVgqZMX53udWijvhe
 2yZ+UrYP5HaQkeLxvgpkpBECuZUu9DJQ2UXQ7GcHExJA8kZ2ZiJU67p+9GfT25+H5gd/
 5Jmvt1Uz3fOPePGkPUdBH6p63B3lI9TtrJUNJeasEk8uN1owO+wG46nsR7KNNxXekBGO
 2shg==
X-Gm-Message-State: AO0yUKVembhNtU6+vbm9UlccEPqFkUsFeMXIqW5gUpqxrSl/YvBsNXs0
 ewJmJAobEaxU/GYC5lFltoQtFIBBa0rdCOjndG8=
X-Google-Smtp-Source: AK7set9SH33risq78fSCIK/I517gwECeLHQmfSbPe0bRVDOsKt+ceHCiJsrLIgSad4+znFsWnbDnaQ==
X-Received: by 2002:a17:903:11c4:b0:19e:f315:98d with SMTP id
 q4-20020a17090311c400b0019ef315098dmr8388644plh.43.1678392570300; 
 Thu, 09 Mar 2023 12:09:30 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 43/91] target/hppa: Avoid use of tcg_const_i32 throughout
Date: Thu,  9 Mar 2023 12:05:02 -0800
Message-Id: <20230309200550.3878088-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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



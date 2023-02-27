Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 554C16A3BFB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:08:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWIn-0005Pb-Rr; Mon, 27 Feb 2023 00:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIg-000525-FA
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:50 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIZ-0005Ai-TO
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:50 -0500
Received: by mail-pf1-x42f.google.com with SMTP id c10so2155588pfv.13
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jyCeX4bwIEzy4e7YtKlgTxEYjmitvX4LaioZWsLyP/4=;
 b=rNZ0GH8aMlSI7aKARZKSb/9/XbQu4UwWzNY6VQUM5Fb8LSaBKB6+kAH5GNH53hPLn7
 nHDB+SLwrkBLuKxOEzK+aVwp9RdXAvQDh7OfnPBxWOMiMvQAfsrvuabzIANAMTzWd+E4
 RlkvKlN9F0ql/zT8Q+Ti1fSZ95s//C73M/GLa1o4Dy08zHBLYINFDaSvPaRVxSY1knhA
 tuZ8BYNqAFEHqBXfoSkc8ko1lg3EYT4E2qlmN7laK12TnGSpRmzs61HAcv8y9gBLSxfa
 h04HLteuy5uMoWTGedFtgiLRk0iCR4s98BmOU1hAckoH3RQVh2ubH/Gr4N8BFZZ1qlXf
 QgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jyCeX4bwIEzy4e7YtKlgTxEYjmitvX4LaioZWsLyP/4=;
 b=mYbaoF5RM8HeErfgs/HaxGMY4MpffkGVK4xOcuRIrvrqYLJTY+w9X/JclkNvnDsPz+
 V4iauBcItFv68zXTpTqHQRWmjB3M6s1TKdA9Npg/9i4oY3JlPfyiI2HmAEcXMOqzuJls
 tB2CW1v9TH+ZvyneRP2uGCoMrmw1rzRVxluxuoBZEHUO4vUvlhsyaiX+H6aenVy1J45g
 NSAi4ULgP35trqWojmYy0AfMCB3G0NHkaQ/F0Rm9Xi6a+WX4loqiYhR4BXRChU/UCtm0
 LxdFOIGThX9Qt2T2MgX46htheAVTfd/obltguoBesHEI/MLVbZZh12I06s0jtsRQgIqt
 CoPA==
X-Gm-Message-State: AO0yUKUJYWLZbgCoAMlElfcZWZ++2+lE9XoutV0bvmXCVL5ULVSGAQna
 7e0hltSmT3jKf/jkV1ZJ6giN01Wie9yZvBOh7oQ=
X-Google-Smtp-Source: AK7set+AGMHBvRaJd10ZN+qRSUq9A0zk/67aECI/xyyGol6VfnrOWvaw4m06tun2OHMVPGxjYJSm8w==
X-Received: by 2002:a05:6a00:f95:b0:5a8:d3d9:e03a with SMTP id
 ct21-20020a056a000f9500b005a8d3d9e03amr7973139pfb.0.1677476620649; 
 Sun, 26 Feb 2023 21:43:40 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 21/70] target/hppa: Avoid use of tcg_const_i32 throughout
Date: Sun, 26 Feb 2023 19:41:44 -1000
Message-Id: <20230227054233.390271-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

All uses were read-write, so replace with a new
allocation and initialization.

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



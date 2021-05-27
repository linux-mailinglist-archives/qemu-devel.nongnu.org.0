Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74453392605
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 06:19:42 +0200 (CEST)
Received: from localhost ([::1]:52676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm7Uj-0003vR-HJ
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 00:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PW-0001ai-HJ
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:20 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:42601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PR-0007E6-Cp
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:17 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 m8-20020a17090a4148b029015fc5d36343so1595975pjg.1
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 21:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MTs4Hq04LmWnritZnQvkJU7gh2wQWfLa5CN1BG09M0w=;
 b=aPvhgy2i5X+y4L2au2xunxfNsrrBAODIwuZNZLRChuWfIo0covg0Uq8uPFSE0bH8sq
 McvOE727RIBf64pcLpBV+ckp7qwedNvOtLV0yEafqLYcQ7xYLZMiaJUmffZV9Ftd1ElT
 K/Hm6ZKGDOdqTWCIJAuZwJzFNYbevRb4kCYce5ZmZu6BCvSovvHJeQHSpfDm3txUIvrJ
 w43RpNIBHEB1AzoPhadE3hpsvgvxUO8twyu0v7/Eil5ltj+H4qHi4dw0ok2HPVUXwIgm
 Jm5u7C9+6kO/ZWPOEuQaff9epCZxZglQRyPyfN2LxpBeqj+d9ZxaXN0UIRgYnBIy/D1b
 tCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MTs4Hq04LmWnritZnQvkJU7gh2wQWfLa5CN1BG09M0w=;
 b=rTwMDiljiGGsP7rBJ4Lj3l1+aftZTOmWrbvfpOrgrLKGPl9oHJAFYxsD5yChACpqv1
 CaYzWkaXpdA4/Sio7PVGl/LS4gldkBeh/XKAkPZ8jX8DvUEIJ7K9aBmXEAqWJV0Sb+pa
 HHqU3ViD+Uuf7h4rznNVsLe5zdrL1AQAkX9fS1u3O9ltPEm/ID98i8ncAJPu11rmEFrQ
 CYQ727HM43bSOZVy2TGhKAgmGQfyLwY8CwLACFUuPsYz/yoByBLAGeODytubpRPe9n8b
 ICWhuckL5wp3/pNlvIngv3p0hRWy+CY3wxN/EDN5X7ehrhFw5Qd/sLRwNIK0RjIibL9R
 lTUQ==
X-Gm-Message-State: AOAM531M7IQaD6/9CTaAMb+xTK9XjmRjX/DGkNkc8gGc527+bN0RyOMS
 pmrg4VpGDXkdfTW/ZFgRAUTA8eean0W4Yg==
X-Google-Smtp-Source: ABdhPJwVZuzqFVKJws0ctlwEcG/C5FgjURlG2FY+mY/Ykd1qryQ4XBVvlFikT7SjqugTKhKxCovwBw==
X-Received: by 2002:a17:90a:e615:: with SMTP id
 j21mr6650666pjy.222.1622088851785; 
 Wed, 26 May 2021 21:14:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id s1sm605959pfc.6.2021.05.26.21.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 21:14:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/11] target/mips: Drop inline markers from msa_helper.c
Date: Wed, 26 May 2021 21:14:03 -0700
Message-Id: <20210527041405.391567-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210527041405.391567-1-richard.henderson@linaro.org>
References: <20210527041405.391567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, mmorrell@tachyum.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some of these functions are quite large.
Let the compiler decide whether to inline.

Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/msa_helper.c | 262 ++++++++++++++++-------------------
 1 file changed, 121 insertions(+), 141 deletions(-)

diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index 51791f946b..2f89abe166 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -68,7 +68,7 @@
  * +---------------+----------------------------------------------------------+
  */
 
-static inline int64_t msa_nlzc_df(uint32_t df, int64_t arg)
+static int64_t msa_nlzc_df(uint32_t df, int64_t arg)
 {
     uint64_t x, y;
     int n, c;
@@ -89,7 +89,7 @@ static inline int64_t msa_nlzc_df(uint32_t df, int64_t arg)
     return n - x;
 }
 
-static inline int64_t msa_nloc_df(uint32_t df, int64_t arg)
+static int64_t msa_nloc_df(uint32_t df, int64_t arg)
 {
     return msa_nlzc_df(df, UNSIGNED((~arg), df));
 }
@@ -210,7 +210,7 @@ void helper_msa_nlzc_d(CPUMIPSState *env, uint32_t wd, uint32_t ws)
     pwd->d[1]  = msa_nlzc_df(DF_DOUBLE, pws->d[1]);
 }
 
-static inline int64_t msa_pcnt_df(uint32_t df, int64_t arg)
+static int64_t msa_pcnt_df(uint32_t df, int64_t arg)
 {
     uint64_t x;
 
@@ -307,8 +307,7 @@ void helper_msa_pcnt_d(CPUMIPSState *env, uint32_t wd, uint32_t ws)
 /* Data format bit position and unsigned values */
 #define BIT_POSITION(x, df) ((uint64_t)(x) % DF_BITS(df))
 
-static inline int64_t msa_binsl_df(uint32_t df,
-                                   int64_t dest, int64_t arg1, int64_t arg2)
+static int64_t msa_binsl_df(uint32_t df, int64_t dest, int64_t arg1, int64_t arg2)
 {
     uint64_t u_arg1 = UNSIGNED(arg1, df);
     uint64_t u_dest = UNSIGNED(dest, df);
@@ -388,8 +387,7 @@ void helper_msa_binsl_d(CPUMIPSState *env,
     pwd->d[1]  = msa_binsl_df(DF_DOUBLE, pwd->d[1],  pws->d[1],  pwt->d[1]);
 }
 
-static inline int64_t msa_binsr_df(uint32_t df,
-                                   int64_t dest, int64_t arg1, int64_t arg2)
+static int64_t msa_binsr_df(uint32_t df, int64_t dest, int64_t arg1, int64_t arg2)
 {
     uint64_t u_arg1 = UNSIGNED(arg1, df);
     uint64_t u_dest = UNSIGNED(dest, df);
@@ -526,7 +524,7 @@ void helper_msa_bsel_v(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
  * +---------------+----------------------------------------------------------+
  */
 
-static inline int64_t msa_bclr_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_bclr_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     int32_t b_arg2 = BIT_POSITION(arg2, df);
     return UNSIGNED(arg1 & (~(1LL << b_arg2)), df);
@@ -594,7 +592,7 @@ void helper_msa_bclr_d(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
     pwd->d[1]  = msa_bclr_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
 }
 
-static inline int64_t msa_bneg_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_bneg_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     int32_t b_arg2 = BIT_POSITION(arg2, df);
     return UNSIGNED(arg1 ^ (1LL << b_arg2), df);
@@ -662,8 +660,7 @@ void helper_msa_bneg_d(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
     pwd->d[1]  = msa_bneg_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
 }
 
-static inline int64_t msa_bset_df(uint32_t df, int64_t arg1,
-        int64_t arg2)
+static int64_t msa_bset_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     int32_t b_arg2 = BIT_POSITION(arg2, df);
     return UNSIGNED(arg1 | (1LL << b_arg2), df);
@@ -809,7 +806,7 @@ void helper_msa_bset_d(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
  */
 
 
-static inline int64_t msa_add_a_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_add_a_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     uint64_t abs_arg1 = arg1 >= 0 ? arg1 : -arg1;
     uint64_t abs_arg2 = arg2 >= 0 ? arg2 : -arg2;
@@ -883,7 +880,7 @@ void helper_msa_add_a_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_adds_a_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_adds_a_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     uint64_t max_int = (uint64_t)DF_MAX_INT(df);
     uint64_t abs_arg1 = arg1 >= 0 ? arg1 : -arg1;
@@ -962,7 +959,7 @@ void helper_msa_adds_a_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_adds_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_adds_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     int64_t max_int = DF_MAX_INT(df);
     int64_t min_int = DF_MIN_INT(df);
@@ -1040,7 +1037,7 @@ void helper_msa_adds_s_d(CPUMIPSState *env,
 }
 
 
-static inline uint64_t msa_adds_u_df(uint32_t df, uint64_t arg1, uint64_t arg2)
+static uint64_t msa_adds_u_df(uint32_t df, uint64_t arg1, uint64_t arg2)
 {
     uint64_t max_uint = DF_MAX_UINT(df);
     uint64_t u_arg1 = UNSIGNED(arg1, df);
@@ -1115,7 +1112,7 @@ void helper_msa_adds_u_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_addv_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_addv_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     return arg1 + arg2;
 }
@@ -1200,7 +1197,7 @@ void helper_msa_addv_d(CPUMIPSState *env,
         ((((uint64_t)(a)) << (64 - DF_BITS(df))) >> (64 - DF_BITS(df) / 2))
 
 
-static inline int64_t msa_hadd_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_hadd_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     return SIGNED_ODD(arg1, df) + SIGNED_EVEN(arg2, df);
 }
@@ -1247,7 +1244,7 @@ void helper_msa_hadd_s_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_hadd_u_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_hadd_u_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     return UNSIGNED_ODD(arg1, df) + UNSIGNED_EVEN(arg2, df);
 }
@@ -1318,7 +1315,7 @@ void helper_msa_hadd_u_d(CPUMIPSState *env,
  * +---------------+----------------------------------------------------------+
  */
 
-static inline int64_t msa_ave_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_ave_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     /* signed shift */
     return (arg1 >> 1) + (arg2 >> 1) + (arg1 & arg2 & 1);
@@ -1390,7 +1387,7 @@ void helper_msa_ave_s_d(CPUMIPSState *env,
     pwd->d[1]  = msa_ave_s_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
 }
 
-static inline uint64_t msa_ave_u_df(uint32_t df, uint64_t arg1, uint64_t arg2)
+static uint64_t msa_ave_u_df(uint32_t df, uint64_t arg1, uint64_t arg2)
 {
     uint64_t u_arg1 = UNSIGNED(arg1, df);
     uint64_t u_arg2 = UNSIGNED(arg2, df);
@@ -1464,7 +1461,7 @@ void helper_msa_ave_u_d(CPUMIPSState *env,
     pwd->d[1]  = msa_ave_u_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
 }
 
-static inline int64_t msa_aver_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_aver_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     /* signed shift */
     return (arg1 >> 1) + (arg2 >> 1) + ((arg1 | arg2) & 1);
@@ -1536,7 +1533,7 @@ void helper_msa_aver_s_d(CPUMIPSState *env,
     pwd->d[1]  = msa_aver_s_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
 }
 
-static inline uint64_t msa_aver_u_df(uint32_t df, uint64_t arg1, uint64_t arg2)
+static uint64_t msa_aver_u_df(uint32_t df, uint64_t arg1, uint64_t arg2)
 {
     uint64_t u_arg1 = UNSIGNED(arg1, df);
     uint64_t u_arg2 = UNSIGNED(arg2, df);
@@ -1639,12 +1636,12 @@ void helper_msa_aver_u_d(CPUMIPSState *env,
  * +---------------+----------------------------------------------------------+
  */
 
-static inline int64_t msa_ceq_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_ceq_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     return arg1 == arg2 ? -1 : 0;
 }
 
-static inline int8_t msa_ceq_b(int8_t arg1, int8_t arg2)
+static int8_t msa_ceq_b(int8_t arg1, int8_t arg2)
 {
     return arg1 == arg2 ? -1 : 0;
 }
@@ -1673,7 +1670,7 @@ void helper_msa_ceq_b(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
     pwd->b[15] = msa_ceq_b(pws->b[15], pwt->b[15]);
 }
 
-static inline int16_t msa_ceq_h(int16_t arg1, int16_t arg2)
+static int16_t msa_ceq_h(int16_t arg1, int16_t arg2)
 {
     return arg1 == arg2 ? -1 : 0;
 }
@@ -1694,7 +1691,7 @@ void helper_msa_ceq_h(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
     pwd->h[7]  = msa_ceq_h(pws->h[7],  pwt->h[7]);
 }
 
-static inline int32_t msa_ceq_w(int32_t arg1, int32_t arg2)
+static int32_t msa_ceq_w(int32_t arg1, int32_t arg2)
 {
     return arg1 == arg2 ? -1 : 0;
 }
@@ -1711,7 +1708,7 @@ void helper_msa_ceq_w(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
     pwd->w[3]  = msa_ceq_w(pws->w[3],  pwt->w[3]);
 }
 
-static inline int64_t msa_ceq_d(int64_t arg1, int64_t arg2)
+static int64_t msa_ceq_d(int64_t arg1, int64_t arg2)
 {
     return arg1 == arg2 ? -1 : 0;
 }
@@ -1726,7 +1723,7 @@ void helper_msa_ceq_d(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
     pwd->d[1]  = msa_ceq_d(pws->d[1],  pwt->d[1]);
 }
 
-static inline int64_t msa_cle_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_cle_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     return arg1 <= arg2 ? -1 : 0;
 }
@@ -1797,7 +1794,7 @@ void helper_msa_cle_s_d(CPUMIPSState *env,
     pwd->d[1]  = msa_cle_s_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
 }
 
-static inline int64_t msa_cle_u_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_cle_u_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     uint64_t u_arg1 = UNSIGNED(arg1, df);
     uint64_t u_arg2 = UNSIGNED(arg2, df);
@@ -1870,12 +1867,12 @@ void helper_msa_cle_u_d(CPUMIPSState *env,
     pwd->d[1]  = msa_cle_u_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
 }
 
-static inline int64_t msa_clt_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_clt_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     return arg1 < arg2 ? -1 : 0;
 }
 
-static inline int8_t msa_clt_s_b(int8_t arg1, int8_t arg2)
+static int8_t msa_clt_s_b(int8_t arg1, int8_t arg2)
 {
     return arg1 < arg2 ? -1 : 0;
 }
@@ -1905,7 +1902,7 @@ void helper_msa_clt_s_b(CPUMIPSState *env,
     pwd->b[15] = msa_clt_s_b(pws->b[15], pwt->b[15]);
 }
 
-static inline int16_t msa_clt_s_h(int16_t arg1, int16_t arg2)
+static int16_t msa_clt_s_h(int16_t arg1, int16_t arg2)
 {
     return arg1 < arg2 ? -1 : 0;
 }
@@ -1927,7 +1924,7 @@ void helper_msa_clt_s_h(CPUMIPSState *env,
     pwd->h[7]  = msa_clt_s_h(pws->h[7],  pwt->h[7]);
 }
 
-static inline int32_t msa_clt_s_w(int32_t arg1, int32_t arg2)
+static int32_t msa_clt_s_w(int32_t arg1, int32_t arg2)
 {
     return arg1 < arg2 ? -1 : 0;
 }
@@ -1945,7 +1942,7 @@ void helper_msa_clt_s_w(CPUMIPSState *env,
     pwd->w[3]  = msa_clt_s_w(pws->w[3],  pwt->w[3]);
 }
 
-static inline int64_t msa_clt_s_d(int64_t arg1, int64_t arg2)
+static int64_t msa_clt_s_d(int64_t arg1, int64_t arg2)
 {
     return arg1 < arg2 ? -1 : 0;
 }
@@ -1961,7 +1958,7 @@ void helper_msa_clt_s_d(CPUMIPSState *env,
     pwd->d[1]  = msa_clt_s_d(pws->d[1],  pwt->d[1]);
 }
 
-static inline int64_t msa_clt_u_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_clt_u_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     uint64_t u_arg1 = UNSIGNED(arg1, df);
     uint64_t u_arg2 = UNSIGNED(arg2, df);
@@ -2052,7 +2049,7 @@ void helper_msa_clt_u_d(CPUMIPSState *env,
  */
 
 
-static inline int64_t msa_div_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_div_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     if (arg1 == DF_MIN_INT(df) && arg2 == -1) {
         return DF_MIN_INT(df);
@@ -2127,7 +2124,7 @@ void helper_msa_div_s_d(CPUMIPSState *env,
     pwd->d[1]  = msa_div_s_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
 }
 
-static inline int64_t msa_div_u_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_div_u_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     uint64_t u_arg1 = UNSIGNED(arg1, df);
     uint64_t u_arg2 = UNSIGNED(arg2, df);
@@ -2240,7 +2237,7 @@ void helper_msa_div_u_d(CPUMIPSState *env,
     } while (0)
 
 
-static inline int64_t msa_dotp_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_dotp_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     int64_t even_arg1;
     int64_t even_arg2;
@@ -2293,7 +2290,7 @@ void helper_msa_dotp_s_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_dotp_u_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_dotp_u_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     int64_t even_arg1;
     int64_t even_arg2;
@@ -2346,8 +2343,8 @@ void helper_msa_dotp_u_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_dpadd_s_df(uint32_t df, int64_t dest, int64_t arg1,
-                                     int64_t arg2)
+static int64_t msa_dpadd_s_df(uint32_t df, int64_t dest, int64_t arg1,
+                              int64_t arg2)
 {
     int64_t even_arg1;
     int64_t even_arg2;
@@ -2400,8 +2397,8 @@ void helper_msa_dpadd_s_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_dpadd_u_df(uint32_t df, int64_t dest, int64_t arg1,
-                                     int64_t arg2)
+static int64_t msa_dpadd_u_df(uint32_t df, int64_t dest, int64_t arg1,
+                              int64_t arg2)
 {
     int64_t even_arg1;
     int64_t even_arg2;
@@ -2454,8 +2451,8 @@ void helper_msa_dpadd_u_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_dpsub_s_df(uint32_t df, int64_t dest, int64_t arg1,
-                                     int64_t arg2)
+static int64_t msa_dpsub_s_df(uint32_t df, int64_t dest, int64_t arg1,
+                              int64_t arg2)
 {
     int64_t even_arg1;
     int64_t even_arg2;
@@ -2508,8 +2505,8 @@ void helper_msa_dpsub_s_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_dpsub_u_df(uint32_t df, int64_t dest, int64_t arg1,
-                                     int64_t arg2)
+static int64_t msa_dpsub_u_df(uint32_t df, int64_t dest, int64_t arg1,
+                              int64_t arg2)
 {
     int64_t even_arg1;
     int64_t even_arg2;
@@ -2594,7 +2591,7 @@ void helper_msa_dpsub_u_d(CPUMIPSState *env,
  * +---------------+----------------------------------------------------------+
  */
 
-static inline int64_t msa_max_a_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_max_a_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     uint64_t abs_arg1 = arg1 >= 0 ? arg1 : -arg1;
     uint64_t abs_arg2 = arg2 >= 0 ? arg2 : -arg2;
@@ -2668,7 +2665,7 @@ void helper_msa_max_a_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_max_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_max_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     return arg1 > arg2 ? arg1 : arg2;
 }
@@ -2740,7 +2737,7 @@ void helper_msa_max_s_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_max_u_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_max_u_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     uint64_t u_arg1 = UNSIGNED(arg1, df);
     uint64_t u_arg2 = UNSIGNED(arg2, df);
@@ -2814,7 +2811,7 @@ void helper_msa_max_u_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_min_a_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_min_a_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     uint64_t abs_arg1 = arg1 >= 0 ? arg1 : -arg1;
     uint64_t abs_arg2 = arg2 >= 0 ? arg2 : -arg2;
@@ -2888,7 +2885,7 @@ void helper_msa_min_a_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_min_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_min_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     return arg1 < arg2 ? arg1 : arg2;
 }
@@ -2960,7 +2957,7 @@ void helper_msa_min_s_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_min_u_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_min_u_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     uint64_t u_arg1 = UNSIGNED(arg1, df);
     uint64_t u_arg2 = UNSIGNED(arg2, df);
@@ -3050,7 +3047,7 @@ void helper_msa_min_u_d(CPUMIPSState *env,
  * +---------------+----------------------------------------------------------+
  */
 
-static inline int64_t msa_mod_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_mod_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     if (arg1 == DF_MIN_INT(df) && arg2 == -1) {
         return 0;
@@ -3124,7 +3121,7 @@ void helper_msa_mod_s_d(CPUMIPSState *env,
     pwd->d[1]  = msa_mod_s_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
 }
 
-static inline int64_t msa_mod_u_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_mod_u_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     uint64_t u_arg1 = UNSIGNED(arg1, df);
     uint64_t u_arg2 = UNSIGNED(arg2, df);
@@ -3218,7 +3215,7 @@ void helper_msa_mod_u_d(CPUMIPSState *env,
  * +---------------+----------------------------------------------------------+
  */
 
-static inline int64_t msa_maddv_df(uint32_t df, int64_t dest, int64_t arg1,
+static int64_t msa_maddv_df(uint32_t df, int64_t dest, int64_t arg1,
                                    int64_t arg2)
 {
     return dest + arg1 * arg2;
@@ -3290,7 +3287,7 @@ void helper_msa_maddv_d(CPUMIPSState *env,
     pwd->d[1]  = msa_maddv_df(DF_DOUBLE, pwd->d[1],  pws->d[1],  pwt->d[1]);
 }
 
-static inline int64_t msa_msubv_df(uint32_t df, int64_t dest, int64_t arg1,
+static int64_t msa_msubv_df(uint32_t df, int64_t dest, int64_t arg1,
                                    int64_t arg2)
 {
     return dest - arg1 * arg2;
@@ -3363,7 +3360,7 @@ void helper_msa_msubv_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_mulv_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_mulv_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     return arg1 * arg2;
 }
@@ -3478,7 +3475,7 @@ void helper_msa_mulv_d(CPUMIPSState *env,
  */
 
 
-static inline int64_t msa_asub_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_asub_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     /* signed compare */
     return (arg1 < arg2) ?
@@ -3552,7 +3549,7 @@ void helper_msa_asub_s_d(CPUMIPSState *env,
 }
 
 
-static inline uint64_t msa_asub_u_df(uint32_t df, uint64_t arg1, uint64_t arg2)
+static uint64_t msa_asub_u_df(uint32_t df, uint64_t arg1, uint64_t arg2)
 {
     uint64_t u_arg1 = UNSIGNED(arg1, df);
     uint64_t u_arg2 = UNSIGNED(arg2, df);
@@ -3628,7 +3625,7 @@ void helper_msa_asub_u_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_hsub_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_hsub_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     return SIGNED_ODD(arg1, df) - SIGNED_EVEN(arg2, df);
 }
@@ -3675,7 +3672,7 @@ void helper_msa_hsub_s_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_hsub_u_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_hsub_u_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     return UNSIGNED_ODD(arg1, df) - UNSIGNED_EVEN(arg2, df);
 }
@@ -3722,7 +3719,7 @@ void helper_msa_hsub_u_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_subs_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_subs_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     int64_t max_int = DF_MAX_INT(df);
     int64_t min_int = DF_MIN_INT(df);
@@ -3800,7 +3797,7 @@ void helper_msa_subs_s_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_subs_u_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_subs_u_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     uint64_t u_arg1 = UNSIGNED(arg1, df);
     uint64_t u_arg2 = UNSIGNED(arg2, df);
@@ -3874,7 +3871,7 @@ void helper_msa_subs_u_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_subsus_u_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_subsus_u_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     uint64_t u_arg1 = UNSIGNED(arg1, df);
     uint64_t max_uint = DF_MAX_UINT(df);
@@ -3958,7 +3955,7 @@ void helper_msa_subsus_u_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_subsuu_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_subsuu_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     uint64_t u_arg1 = UNSIGNED(arg1, df);
     uint64_t u_arg2 = UNSIGNED(arg2, df);
@@ -4042,7 +4039,7 @@ void helper_msa_subsuu_s_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_subv_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_subv_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     return arg1 - arg2;
 }
@@ -4618,7 +4615,7 @@ void helper_msa_xor_v(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
  * +---------------+----------------------------------------------------------+
  */
 
-static inline void msa_move_v(wr_t *pwd, wr_t *pws)
+static void msa_move_v(wr_t *pwd, wr_t *pws)
 {
     pwd->d[0] = pws->d[0];
     pwd->d[1] = pws->d[1];
@@ -4892,7 +4889,7 @@ void helper_msa_pckod_d(CPUMIPSState *env,
  */
 
 
-static inline int64_t msa_sll_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_sll_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     int32_t b_arg2 = BIT_POSITION(arg2, df);
     return arg1 << b_arg2;
@@ -4965,7 +4962,7 @@ void helper_msa_sll_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_sra_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_sra_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     int32_t b_arg2 = BIT_POSITION(arg2, df);
     return arg1 >> b_arg2;
@@ -5038,7 +5035,7 @@ void helper_msa_sra_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_srar_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_srar_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     int32_t b_arg2 = BIT_POSITION(arg2, df);
     if (b_arg2 == 0) {
@@ -5116,7 +5113,7 @@ void helper_msa_srar_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_srl_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_srl_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     uint64_t u_arg1 = UNSIGNED(arg1, df);
     int32_t b_arg2 = BIT_POSITION(arg2, df);
@@ -5190,7 +5187,7 @@ void helper_msa_srl_d(CPUMIPSState *env,
 }
 
 
-static inline int64_t msa_srlr_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_srlr_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     uint64_t u_arg1 = UNSIGNED(arg1, df);
     int32_t b_arg2 = BIT_POSITION(arg2, df);
@@ -5417,14 +5414,14 @@ void helper_msa_ldi_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
     }
 }
 
-static inline int64_t msa_sat_s_df(uint32_t df, int64_t arg, uint32_t m)
+static int64_t msa_sat_s_df(uint32_t df, int64_t arg, uint32_t m)
 {
     return arg < M_MIN_INT(m + 1) ? M_MIN_INT(m + 1) :
                                     arg > M_MAX_INT(m + 1) ? M_MAX_INT(m + 1) :
                                                              arg;
 }
 
-static inline int64_t msa_sat_u_df(uint32_t df, int64_t arg, uint32_t m)
+static int64_t msa_sat_u_df(uint32_t df, int64_t arg, uint32_t m)
 {
     uint64_t u_arg = UNSIGNED(arg, df);
     return  u_arg < M_MAX_UINT(m + 1) ? u_arg :
@@ -5530,8 +5527,7 @@ MSA_TEROP_IMMU_DF(binsri, binsr)
         }                                       \
     } while (0)
 
-static inline void msa_sld_df(uint32_t df, wr_t *pwd,
-                              wr_t *pws, target_ulong rt)
+static void msa_sld_df(uint32_t df, wr_t *pwd, wr_t *pws, target_ulong rt)
 {
     uint32_t n = rt % DF_ELEMENTS(df);
     uint8_t v[64];
@@ -5561,7 +5557,7 @@ static inline void msa_sld_df(uint32_t df, wr_t *pwd,
     }
 }
 
-static inline int64_t msa_mul_q_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_mul_q_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     int64_t q_min = DF_MIN_INT(df);
     int64_t q_max = DF_MAX_INT(df);
@@ -5572,7 +5568,7 @@ static inline int64_t msa_mul_q_df(uint32_t df, int64_t arg1, int64_t arg2)
     return (arg1 * arg2) >> (DF_BITS(df) - 1);
 }
 
-static inline int64_t msa_mulr_q_df(uint32_t df, int64_t arg1, int64_t arg2)
+static int64_t msa_mulr_q_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     int64_t q_min = DF_MIN_INT(df);
     int64_t q_max = DF_MAX_INT(df);
@@ -5649,8 +5645,8 @@ void helper_msa_sld_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
     msa_sld_df(df, pwd, pws, env->active_tc.gpr[rt]);
 }
 
-static inline int64_t msa_madd_q_df(uint32_t df, int64_t dest, int64_t arg1,
-                                    int64_t arg2)
+static int64_t msa_madd_q_df(uint32_t df, int64_t dest, int64_t arg1,
+                             int64_t arg2)
 {
     int64_t q_prod, q_ret;
 
@@ -5663,8 +5659,8 @@ static inline int64_t msa_madd_q_df(uint32_t df, int64_t dest, int64_t arg1,
     return (q_ret < q_min) ? q_min : (q_max < q_ret) ? q_max : q_ret;
 }
 
-static inline int64_t msa_msub_q_df(uint32_t df, int64_t dest, int64_t arg1,
-                                    int64_t arg2)
+static int64_t msa_msub_q_df(uint32_t df, int64_t dest, int64_t arg1,
+                             int64_t arg2)
 {
     int64_t q_prod, q_ret;
 
@@ -5677,8 +5673,8 @@ static inline int64_t msa_msub_q_df(uint32_t df, int64_t dest, int64_t arg1,
     return (q_ret < q_min) ? q_min : (q_max < q_ret) ? q_max : q_ret;
 }
 
-static inline int64_t msa_maddr_q_df(uint32_t df, int64_t dest, int64_t arg1,
-                                     int64_t arg2)
+static int64_t msa_maddr_q_df(uint32_t df, int64_t dest, int64_t arg1,
+                              int64_t arg2)
 {
     int64_t q_prod, q_ret;
 
@@ -5692,8 +5688,8 @@ static inline int64_t msa_maddr_q_df(uint32_t df, int64_t dest, int64_t arg1,
     return (q_ret < q_min) ? q_min : (q_max < q_ret) ? q_max : q_ret;
 }
 
-static inline int64_t msa_msubr_q_df(uint32_t df, int64_t dest, int64_t arg1,
-                                     int64_t arg2)
+static int64_t msa_msubr_q_df(uint32_t df, int64_t dest, int64_t arg1,
+                              int64_t arg2)
 {
     int64_t q_prod, q_ret;
 
@@ -5783,8 +5779,7 @@ MSA_TEROP_DF(maddr_q)
 MSA_TEROP_DF(msubr_q)
 #undef MSA_TEROP_DF
 
-static inline void msa_splat_df(uint32_t df, wr_t *pwd,
-                                wr_t *pws, target_ulong rt)
+static void msa_splat_df(uint32_t df, wr_t *pwd, wr_t *pws, target_ulong rt)
 {
     uint32_t n = rt % DF_ELEMENTS(df);
     uint32_t i;
@@ -6165,12 +6160,12 @@ void helper_msa_fill_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 #define FLOAT_SNAN64(s) (float64_default_nan(s) ^ 0x0008000000000020ULL)
         /* 0x7ff0000000000020 */
 
-static inline void clear_msacsr_cause(CPUMIPSState *env)
+static void clear_msacsr_cause(CPUMIPSState *env)
 {
     SET_FP_CAUSE(env->active_tc.msacsr, 0);
 }
 
-static inline void check_msacsr_cause(CPUMIPSState *env, uintptr_t retaddr)
+static void check_msacsr_cause(CPUMIPSState *env, uintptr_t retaddr)
 {
     if ((GET_FP_CAUSE(env->active_tc.msacsr) &
             (GET_FP_ENABLE(env->active_tc.msacsr) | FP_UNIMPLEMENTED)) == 0) {
@@ -6187,7 +6182,7 @@ static inline void check_msacsr_cause(CPUMIPSState *env, uintptr_t retaddr)
 #define RECIPROCAL_INEXACT 4
 
 
-static inline int ieee_to_mips_xcpt_msa(int ieee_xcpt)
+static int ieee_to_mips_xcpt_msa(int ieee_xcpt)
 {
     int mips_xcpt = 0;
 
@@ -6210,7 +6205,7 @@ static inline int ieee_to_mips_xcpt_msa(int ieee_xcpt)
     return mips_xcpt;
 }
 
-static inline int update_msacsr(CPUMIPSState *env, int action, int denormal)
+static int update_msacsr(CPUMIPSState *env, int action, int denormal)
 {
     int ieee_exception_flags;
     int mips_exception_flags = 0;
@@ -6296,14 +6291,13 @@ static inline int update_msacsr(CPUMIPSState *env, int action, int denormal)
     return mips_exception_flags;
 }
 
-static inline int get_enabled_exceptions(const CPUMIPSState *env, int c)
+static int get_enabled_exceptions(const CPUMIPSState *env, int c)
 {
     int enable = GET_FP_ENABLE(env->active_tc.msacsr) | FP_UNIMPLEMENTED;
     return c & enable;
 }
 
-static inline float16 float16_from_float32(int32_t a, bool ieee,
-                                           float_status *status)
+static float16 float16_from_float32(int32_t a, bool ieee, float_status *status)
 {
       float16 f_val;
 
@@ -6312,7 +6306,7 @@ static inline float16 float16_from_float32(int32_t a, bool ieee,
       return a < 0 ? (f_val | (1 << 15)) : f_val;
 }
 
-static inline float32 float32_from_float64(int64_t a, float_status *status)
+static float32 float32_from_float64(int64_t a, float_status *status)
 {
       float32 f_val;
 
@@ -6321,8 +6315,7 @@ static inline float32 float32_from_float64(int64_t a, float_status *status)
       return a < 0 ? (f_val | (1 << 31)) : f_val;
 }
 
-static inline float32 float32_from_float16(int16_t a, bool ieee,
-                                           float_status *status)
+static float32 float32_from_float16(int16_t a, bool ieee, float_status *status)
 {
       float32 f_val;
 
@@ -6331,7 +6324,7 @@ static inline float32 float32_from_float16(int16_t a, bool ieee,
       return a < 0 ? (f_val | (1 << 31)) : f_val;
 }
 
-static inline float64 float64_from_float32(int32_t a, float_status *status)
+static float64 float64_from_float32(int32_t a, float_status *status)
 {
       float64 f_val;
 
@@ -6340,7 +6333,7 @@ static inline float64 float64_from_float32(int32_t a, float_status *status)
       return a < 0 ? (f_val | (1ULL << 63)) : f_val;
 }
 
-static inline float32 float32_from_q16(int16_t a, float_status *status)
+static float32 float32_from_q16(int16_t a, float_status *status)
 {
     float32 f_val;
 
@@ -6351,7 +6344,7 @@ static inline float32 float32_from_q16(int16_t a, float_status *status)
     return f_val;
 }
 
-static inline float64 float64_from_q32(int32_t a, float_status *status)
+static float64 float64_from_q32(int32_t a, float_status *status)
 {
     float64 f_val;
 
@@ -6362,7 +6355,7 @@ static inline float64 float64_from_q32(int32_t a, float_status *status)
     return f_val;
 }
 
-static inline int16_t float32_to_q16(float32 a, float_status *status)
+static int16_t float32_to_q16(float32 a, float_status *status)
 {
     int32_t q_val;
     int32_t q_min = 0xffff8000;
@@ -6414,7 +6407,7 @@ static inline int16_t float32_to_q16(float32 a, float_status *status)
     return (int16_t)q_val;
 }
 
-static inline int32_t float64_to_q32(float64 a, float_status *status)
+static int32_t float64_to_q32(float64 a, float_status *status)
 {
     int64_t q_val;
     int64_t q_min = 0xffffffff80000000LL;
@@ -6544,9 +6537,8 @@ static inline int32_t float64_to_q32(float64 a, float_status *status)
         }                                                           \
     } while (0)
 
-static inline void compare_af(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
-                              wr_t *pwt, uint32_t df, int quiet,
-                              uintptr_t retaddr)
+static void compare_af(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
+                       wr_t *pwt, uint32_t df, int quiet, uintptr_t retaddr)
 {
     wr_t wx, *pwx = &wx;
     uint32_t i;
@@ -6573,9 +6565,8 @@ static inline void compare_af(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
     msa_move_v(pwd, pwx);
 }
 
-static inline void compare_un(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
-                              wr_t *pwt, uint32_t df, int quiet,
-                              uintptr_t retaddr)
+static void compare_un(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
+                       wr_t *pwt, uint32_t df, int quiet, uintptr_t retaddr)
 {
     wr_t wx, *pwx = &wx;
     uint32_t i;
@@ -6604,9 +6595,8 @@ static inline void compare_un(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
     msa_move_v(pwd, pwx);
 }
 
-static inline void compare_eq(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
-                              wr_t *pwt, uint32_t df, int quiet,
-                              uintptr_t retaddr)
+static void compare_eq(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
+                       wr_t *pwt, uint32_t df, int quiet, uintptr_t retaddr)
 {
     wr_t wx, *pwx = &wx;
     uint32_t i;
@@ -6633,9 +6623,8 @@ static inline void compare_eq(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
     msa_move_v(pwd, pwx);
 }
 
-static inline void compare_ueq(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
-                               wr_t *pwt, uint32_t df, int quiet,
-                               uintptr_t retaddr)
+static void compare_ueq(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
+                        wr_t *pwt, uint32_t df, int quiet, uintptr_t retaddr)
 {
     wr_t wx, *pwx = &wx;
     uint32_t i;
@@ -6662,9 +6651,8 @@ static inline void compare_ueq(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
     msa_move_v(pwd, pwx);
 }
 
-static inline void compare_lt(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
-                              wr_t *pwt, uint32_t df, int quiet,
-                              uintptr_t retaddr)
+static void compare_lt(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
+                       wr_t *pwt, uint32_t df, int quiet, uintptr_t retaddr)
 {
     wr_t wx, *pwx = &wx;
     uint32_t i;
@@ -6691,9 +6679,8 @@ static inline void compare_lt(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
     msa_move_v(pwd, pwx);
 }
 
-static inline void compare_ult(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
-                               wr_t *pwt, uint32_t df, int quiet,
-                               uintptr_t retaddr)
+static void compare_ult(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
+                        wr_t *pwt, uint32_t df, int quiet, uintptr_t retaddr)
 {
     wr_t wx, *pwx = &wx;
     uint32_t i;
@@ -6720,9 +6707,8 @@ static inline void compare_ult(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
     msa_move_v(pwd, pwx);
 }
 
-static inline void compare_le(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
-                              wr_t *pwt, uint32_t df, int quiet,
-                              uintptr_t retaddr)
+static void compare_le(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
+                       wr_t *pwt, uint32_t df, int quiet, uintptr_t retaddr)
 {
     wr_t wx, *pwx = &wx;
     uint32_t i;
@@ -6749,9 +6735,8 @@ static inline void compare_le(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
     msa_move_v(pwd, pwx);
 }
 
-static inline void compare_ule(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
-                               wr_t *pwt, uint32_t df, int quiet,
-                               uintptr_t retaddr)
+static void compare_ule(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
+                        wr_t *pwt, uint32_t df, int quiet, uintptr_t retaddr)
 {
     wr_t wx, *pwx = &wx;
     uint32_t i;
@@ -6778,9 +6763,8 @@ static inline void compare_ule(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
     msa_move_v(pwd, pwx);
 }
 
-static inline void compare_or(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
-                              wr_t *pwt, uint32_t df, int quiet,
-                              uintptr_t retaddr)
+static void compare_or(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
+                       wr_t *pwt, uint32_t df, int quiet, uintptr_t retaddr)
 {
     wr_t wx, *pwx = &wx;
     uint32_t i;
@@ -6807,9 +6791,8 @@ static inline void compare_or(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
     msa_move_v(pwd, pwx);
 }
 
-static inline void compare_une(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
-                               wr_t *pwt, uint32_t df, int quiet,
-                               uintptr_t retaddr)
+static void compare_une(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
+                        wr_t *pwt, uint32_t df, int quiet, uintptr_t retaddr)
 {
     wr_t wx, *pwx = &wx;
     uint32_t i;
@@ -6836,9 +6819,8 @@ static inline void compare_une(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
     msa_move_v(pwd, pwx);
 }
 
-static inline void compare_ne(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
-                              wr_t *pwt, uint32_t df, int quiet,
-                              uintptr_t retaddr)
+static void compare_ne(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
+                       wr_t *pwt, uint32_t df, int quiet, uintptr_t retaddr)
 {
     wr_t wx, *pwx = &wx;
     uint32_t i;
@@ -8395,10 +8377,8 @@ void helper_msa_ld_d(CPUMIPSState *env, uint32_t wd,
 #define MSA_PAGESPAN(x) \
         ((((x) & ~TARGET_PAGE_MASK) + MSA_WRLEN / 8 - 1) >= TARGET_PAGE_SIZE)
 
-static inline void ensure_writable_pages(CPUMIPSState *env,
-                                         target_ulong addr,
-                                         int mmu_idx,
-                                         uintptr_t retaddr)
+static void ensure_writable_pages(CPUMIPSState *env, target_ulong addr,
+                                  int mmu_idx, uintptr_t retaddr)
 {
     /* FIXME: Probe the actual accesses (pass and use a size) */
     if (unlikely(MSA_PAGESPAN(addr))) {
-- 
2.25.1



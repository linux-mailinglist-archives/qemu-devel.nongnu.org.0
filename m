Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7EB56BCDB
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:23:51 +0200 (CEST)
Received: from localhost ([::1]:36672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9ppe-0007uA-17
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piQ-0002Sz-Tt
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:23 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:55830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piP-0002Du-8V
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:22 -0400
Received: by mail-pj1-x102a.google.com with SMTP id w24so18317607pjg.5
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BY/R+8YJ5Dv/43YfnL4nTrVKxj1X4wUM5az+kdRyBN4=;
 b=H3aB0a6KQ/oxNS6+VxJ2W2ligNKt2LX2wkhV2j44tZ098um3bYJgmsSyJGrOnDhFHU
 sLEKp65rzwNc7a+s3SM8F9nsbHtgMJbkqhVPLjRQEF0rrjeKxtXpivB9A0Flchr+r7jX
 YcUaog0zhi3e5JJEJtmEf5aACfmAyZcmCX3DB04ypx6JZVsqkyjBV2nWoHWfhko1t2pe
 L1Xxwtm/wqqrVF/wqDhn+h1KO4+1subSO9QsAO/tS8Lmn57M+IFa7nI77BokOKg02YTX
 7uyBlMf3h/sZ3sdeUzLRNftHBKxIdqmfGEVzo1565qi+ndJJoBB8m0XUo5jnd8pCKYlt
 OtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BY/R+8YJ5Dv/43YfnL4nTrVKxj1X4wUM5az+kdRyBN4=;
 b=0AmlzQ76bV2s+xg9viVhUcJFB9I2h77xVi/QBIHltaa91KfW+hJFUTnz4sm5Ex6z/T
 H0RZgNgxYh7wv4+nF3P9vbQOnCRpePVIX/iAYGMbGfL0Ms1LAAShJ63y5kv5f4BuZ9jg
 HnQwMyza+f45NoTfvqMICFNgE1fws28KnAocM9ySNgmSde5WuV0UEo1Gs8fFtOZXqBL0
 H2Vrovmw3zyEwueWPX3DSQrEA2RID88keycFV0i9yhAesB0oKClctnEAGbG7AFw/Sg8/
 tOxaobfR5CHPPFaNExAEJrix6wHYTcboo8gZk3l+161sOlcPoX0Dcn7/m/RdO2Jsfkt6
 Ob/w==
X-Gm-Message-State: AJIora/FvWyQPWhM58u96+PIvWA6/SHTsU0T381ob503tSxMVDQ9CNEC
 WlwgqNY6EumAcS4E9Bk9sHUTWJ1AoY/QldgC
X-Google-Smtp-Source: AGRyM1tOkKvfCd1k6lruEaFoJGc7edh56YCgSinXOo3k2E/B6aZk2TXQJxIpdMTkwShMxpOIhCfFRA==
X-Received: by 2002:a17:90b:4f81:b0:1ef:acca:2d6b with SMTP id
 qe1-20020a17090b4f8100b001efacca2d6bmr305078pjb.243.1657293379067; 
 Fri, 08 Jul 2022 08:16:19 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 11/45] target/arm: Mark gather/scatter load/store as
 non-streaming
Date: Fri,  8 Jul 2022 20:45:06 +0530
Message-Id: <20220708151540.18136-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode | 9 ---------
 target/arm/translate-sve.c | 6 ++++++
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index fe462d2ccc..1acc3ae080 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,19 +59,10 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    1000 010- -00- ---- 10-- ---- ---- ----   # SVE2 32-bit gather NT load (vector+scalar)
 FAIL    1000 010- -00- ---- 111- ---- ---- ----   # SVE 32-bit gather prefetch (vector+imm)
 FAIL    1000 0100 0-1- ---- 0--- ---- ---- ----   # SVE 32-bit gather prefetch (scalar+vector)
-FAIL    1000 010- -01- ---- 1--- ---- ---- ----   # SVE 32-bit gather load (vector+imm)
-FAIL    1000 0100 0-0- ---- 0--- ---- ---- ----   # SVE 32-bit gather load byte (scalar+vector)
-FAIL    1000 0100 1--- ---- 0--- ---- ---- ----   # SVE 32-bit gather load half (scalar+vector)
-FAIL    1000 0101 0--- ---- 0--- ---- ---- ----   # SVE 32-bit gather load word (scalar+vector)
 FAIL    1010 010- ---- ---- 011- ---- ---- ----   # SVE contiguous FF load (scalar+scalar)
 FAIL    1010 010- ---1 ---- 101- ---- ---- ----   # SVE contiguous NF load (scalar+imm)
 FAIL    1010 010- -01- ---- 000- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+scalar)
 FAIL    1010 010- -010 ---- 001- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+imm)
 FAIL    1100 010- ---- ---- ---- ---- ---- ----   # SVE 64-bit gather load/prefetch
-FAIL    1110 010- -00- ---- 001- ---- ---- ----   # SVE2 64-bit scatter NT store (vector+scalar)
-FAIL    1110 010- -10- ---- 001- ---- ---- ----   # SVE2 32-bit scatter NT store (vector+scalar)
-FAIL    1110 010- ---- ---- 1-0- ---- ---- ----   # SVE scatter store (scalar+32-bit vector)
-FAIL    1110 010- ---- ---- 101- ---- ---- ----   # SVE scatter store (misc)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f8e0716474..b23c6aa0bf 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5669,6 +5669,7 @@ static bool trans_LD1_zprz(DisasContext *s, arg_LD1_zprz *a)
     if (!dc_isar_feature(aa64_sve, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (!sve_access_check(s)) {
         return true;
     }
@@ -5700,6 +5701,7 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
     if (!dc_isar_feature(aa64_sve, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (!sve_access_check(s)) {
         return true;
     }
@@ -5734,6 +5736,7 @@ static bool trans_LDNT1_zprz(DisasContext *s, arg_LD1_zprz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (!sve_access_check(s)) {
         return true;
     }
@@ -5857,6 +5860,7 @@ static bool trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a)
     if (!dc_isar_feature(aa64_sve, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (!sve_access_check(s)) {
         return true;
     }
@@ -5887,6 +5891,7 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
     if (!dc_isar_feature(aa64_sve, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (!sve_access_check(s)) {
         return true;
     }
@@ -5921,6 +5926,7 @@ static bool trans_STNT1_zprz(DisasContext *s, arg_ST1_zprz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (!sve_access_check(s)) {
         return true;
     }
-- 
2.34.1



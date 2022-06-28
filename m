Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A3655BE39
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 06:41:12 +0200 (CEST)
Received: from localhost ([::1]:59602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o632F-0003p0-Ko
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 00:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jW-0001dO-V0
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:51 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:46025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jU-0003hL-NI
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:50 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 184so10986344pga.12
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LkdgUQ+JvOvBJ2qAkFuSD3rXAe1IkZmBYBBm8jukjA4=;
 b=QbggUhIktc0UPG9RF7U2SEGR4WhLywA5SjCbibXV+ZHv2ay0YJEVb06xg7sW0BKFr1
 Bshux9D3k419xa3WJdYsCXkFVxw5/L0Aeuh1lwvd3QC+D40AUIBCEOQSZuiLizuu6j1h
 4YTCDKLMWQVqkX972L4rcT4KJgofLbwZWEE1YHZ/ELBQSBU0Kg8njfMAchkn8qhnMf1H
 PU+WI7Lja9MqjBiYX11J5P5YXrme7KckpILfis/4dx+5wS68LkFlAMSTqtNsNC5e4HAc
 gRmzg414/YlGTIleOkTNbqLu9gIxdcbXgtYe8SsifdC94wWlZ6FS1NF2QT+1CZW57mw6
 HglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LkdgUQ+JvOvBJ2qAkFuSD3rXAe1IkZmBYBBm8jukjA4=;
 b=iu52dLh06nXq/P/fYtRzI23Trhd98uKCUV0LfZp10oLGSjs1X9L5uJI7HipynDal5v
 ZAevlm8hsXiL/RoBkoh9/y2/EkBsAJRo1rBRnKy1VkluZPflxOH/ZVF62BN84sVfwnmH
 CZIWyVqmb4LqN7tddJiU9DkQLNJFhxFaSCJIRuhslDJ34gU8M51LbnW3pHV5D1/fql/m
 KXe/A14LkLXhtFXSb9uVDwetOih1eELxL/sw+HdCnXAdJ38+yPbRery2m0V0Ya+Ra0Iz
 i2Q9YE7m/XsJG4wTT/74ltoxEce43SPMAA7+hobeftaQkPqhETKuDPgniMoEyfjqSWW1
 6OMQ==
X-Gm-Message-State: AJIora8E7gu3o95z9fscKY/ti49hVrtGPRQGtZgsaxaTHhsWTOp0rVyS
 /xzU1yQuuF66VJVwu8bbKZ9zHiR7A/aU1Q==
X-Google-Smtp-Source: AGRyM1s/87mdDczgQatotnePdMd83v7jk6eb95nfNnS8/m6e9WOYr51+yZnSlpuJWQnFHojPUMM9OA==
X-Received: by 2002:a63:2b8c:0:b0:3fe:2062:c14b with SMTP id
 r134-20020a632b8c000000b003fe2062c14bmr15655533pgr.345.1656390107477; 
 Mon, 27 Jun 2022 21:21:47 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:21:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 11/45] target/arm: Mark gather/scatter load/store as
 non-streaming
Date: Tue, 28 Jun 2022 09:50:43 +0530
Message-Id: <20220628042117.368549-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode | 9 ---------
 target/arm/translate-sve.c | 6 ++++++
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 4683850fa5..711636ed30 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -58,19 +58,10 @@ FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography e
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
 FAIL    1010 010- -10- ---- 000- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+scalar)
 FAIL    1010 010- -100 ---- 001- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+imm)
 FAIL    1100 010- ---- ---- ---- ---- ---- ----   # SVE 64-bit gather load/prefetch
-FAIL    1110 010- -00- ---- 001- ---- ---- ----   # SVE2 64-bit scatter NT store (vector+scalar)
-FAIL    1110 010- -10- ---- 001- ---- ---- ----   # SVE2 32-bit scatter NT store (vector+scalar)
-FAIL    1110 010- ---- ---- 1-0- ---- ---- ----   # SVE scatter store (scalar+32-bit vector)
-FAIL    1110 010- ---- ---- 101- ---- ---- ----   # SVE scatter store (misc)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4c28cc9200..a50b2f485b 100644
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



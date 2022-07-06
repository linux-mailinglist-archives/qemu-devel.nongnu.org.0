Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DC6568267
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:04:17 +0200 (CEST)
Received: from localhost ([::1]:44248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o90xE-0006rj-Kl
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90LA-00060d-B3
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:56 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90L1-0000My-4R
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:54 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso9244768pjc.1
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BY/R+8YJ5Dv/43YfnL4nTrVKxj1X4wUM5az+kdRyBN4=;
 b=jtmSVdNxCpfZypHs23Gb8Av1XHSoQYWIGg43qWiEeYEM0OyuTIalh2KSbmoUDeRbyP
 29SmMgvHlyg37C6k84UHlOhR6M8TWqtNg77zDVGuhop4DS0u+kQDSU+h9q3aeylHrsh+
 cAUmd7BixEQXoZYsBWZDMch+b/qUPU2MORAioy8UN+sNDq/qW0FOXTrGiITxQnBLQp2G
 41WFSSybn9rQfDTqB31DVMKT4ZpssuMYJQDHWqSYGpnICKOfZtf9XPZsg6fFSs005eSh
 UD6Z7Byw1IaFxiuVhP0DORbFnLqpw/qYNXLC+eUHkZR+swWNoA/DgRxVvBwrp1qt7SAY
 VIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BY/R+8YJ5Dv/43YfnL4nTrVKxj1X4wUM5az+kdRyBN4=;
 b=fIA0VZ1VVM7VnqZNMiJMwHFTa5MZYaOScNwATNDZR2RMXD2bXz5inMTUu1TnPZCyz2
 s8UoLhBFAeqI9u4VcyOXEV74ti4RSLwacS3vAu4Ahr/fiGXhUpAiVc5/ZyLdrrs3gQuK
 /IvPKTIoko0d5C4MShLpyG5sQoNWSiUXVVG1gUj6MewRQVQqfCqRJlMooqZiN+NYiyfn
 AIrHZLiLylsJ2AmZ4vhBRsxEe3foqrF1XKDnh5YMVGmZA0UWAKe6o1cIpTCL181Fwji/
 /nsdgMEzLr9ozC5qOgSrj8UKs0JVb9HDJl95q3OYiRpa36f5JxPETm+YovlaYCjL7uPq
 Q8pA==
X-Gm-Message-State: AJIora+f4Ke1y8pw8wy2w/GUkjmdB+TGo32FTsunVebnTcE5YGT2T8x4
 1EVAuiCpxECywGRALE90HxZh2AJDaU/GwNPX
X-Google-Smtp-Source: AGRyM1u7pCipzrZV1ssZMHUR8jaz7NvGCjY/tjCWYMr5lZzx80MuCO0r96amaZrhDJirPyx+3KWUkQ==
X-Received: by 2002:a17:90a:3e09:b0:1ef:8399:398b with SMTP id
 j9-20020a17090a3e0900b001ef8399398bmr20508411pjc.39.1657095884685; 
 Wed, 06 Jul 2022 01:24:44 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 11/45] target/arm: Mark gather/scatter load/store as
 non-streaming
Date: Wed,  6 Jul 2022 13:53:37 +0530
Message-Id: <20220706082411.1664825-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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



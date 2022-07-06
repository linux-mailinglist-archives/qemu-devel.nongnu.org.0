Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2996568270
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:08:40 +0200 (CEST)
Received: from localhost ([::1]:53198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o911T-0004g7-VL
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90LA-00060c-BM
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:56 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:42587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90L6-0000PE-PV
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:55 -0400
Received: by mail-pl1-x629.google.com with SMTP id 5so7180343plk.9
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EEUaOkhoazNVf18b04XDY+SiXA3h6+AppArsj54fhkI=;
 b=Dc2Rhn/GE6Cawcsf+Oabi9Dy+4q8QWvqd55zrUXjFp8CB3M3LKh+lhY1mEV/5zXhrU
 MAXAr8bxApdsZn0uGB2P6UhajfNEnqbaBqRAN77BHGtBsMWZ3o0sriA4itnP8vB8GpXb
 lpqp3c0oqWTbsrxzhZH4PKoWSn9LaLatLzpZs9YlZ1hRaKA5tIq3GuApiIqX4HPNxNBG
 RFSN06LsJVrDKqePZR0YhyBj75PSu7aivNul9hd6rcTPKjmfdFbjyJ4euyzlB4nYBfYy
 kNqG/TRxLhgtLg+0ExTfEXj3nr5VVeUIz0OEFWJYF3FnD+Dh2qD50EAW01RsYhzmuY8B
 xEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EEUaOkhoazNVf18b04XDY+SiXA3h6+AppArsj54fhkI=;
 b=i+VAzaIas1RY6j556wzQcH++tHhT/kOSpQxwj1eePSkrybCkYMVREyKAlkqx+m2mOn
 ZXdc17RkdTWW5Yh0RPfV8Z/tTnKHjZsOURCT0FbM9z3SzRWUJA1G3IIPMce+Q/zFm4ez
 jTwwjJjovmipgiIAbXm5DLzakRo88krioi1BQFp5YHAH9vizpJYXu0R3s/ewQquEhiWz
 TOG9ylaUYxm/KR6V+mWEdnAdMTKmXkzNHcEllR4Ulg5eM/UdOGtZk0jd8b4TEHMGBg46
 tXMYy/42N7USQ/acBDgq2hbz87hjiihFCEvo0H7gkeONYnzmKd7eyLDxyUDyfNhHb/w+
 ZHCw==
X-Gm-Message-State: AJIora9necO6LEJir3MeI4EiTSDRkuqBHH/xMMxlv6HPI44utAHx+/ir
 v0d4QD8ufuXvdIAqstIM9KViIof1bY2uk1/o
X-Google-Smtp-Source: AGRyM1sw2MVVnhchUAGTkMJtbT8skWzC6Nmbd63vAbjTgyxzc4T1PIjdNPcRuHY9PesMpndwvkb1fw==
X-Received: by 2002:a17:90a:db96:b0:1ef:8c86:eb09 with SMTP id
 h22-20020a17090adb9600b001ef8c86eb09mr15659132pjv.22.1657095887035; 
 Wed, 06 Jul 2022 01:24:47 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 12/45] target/arm: Mark gather prefetch as non-streaming
Date: Wed,  6 Jul 2022 13:53:38 +0530
Message-Id: <20220706082411.1664825-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Mark these as a non-streaming instructions, which should trap if full
a64 support is not enabled in streaming mode.  In this case, introduce
PRF_ns (prefetch non-streaming) to handle the checks.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode |  3 ---
 target/arm/sve.decode      | 10 +++++-----
 target/arm/translate-sve.c | 11 +++++++++++
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 1acc3ae080..7d4c33fb5b 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,10 +59,7 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    1000 010- -00- ---- 111- ---- ---- ----   # SVE 32-bit gather prefetch (vector+imm)
-FAIL    1000 0100 0-1- ---- 0--- ---- ---- ----   # SVE 32-bit gather prefetch (scalar+vector)
 FAIL    1010 010- ---- ---- 011- ---- ---- ----   # SVE contiguous FF load (scalar+scalar)
 FAIL    1010 010- ---1 ---- 101- ---- ---- ----   # SVE contiguous NF load (scalar+imm)
 FAIL    1010 010- -01- ---- 000- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+scalar)
 FAIL    1010 010- -010 ---- 001- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+imm)
-FAIL    1100 010- ---- ---- ---- ---- ---- ----   # SVE 64-bit gather load/prefetch
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a54feb2f61..908643d7d9 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1183,10 +1183,10 @@ LD1RO_zpri      1010010 .. 01 0.... 001 ... ..... ..... \
                 @rpri_load_msz nreg=0
 
 # SVE 32-bit gather prefetch (scalar plus 32-bit scaled offsets)
-PRF             1000010 00 -1 ----- 0-- --- ----- 0 ----
+PRF_ns          1000010 00 -1 ----- 0-- --- ----- 0 ----
 
 # SVE 32-bit gather prefetch (vector plus immediate)
-PRF             1000010 -- 00 ----- 111 --- ----- 0 ----
+PRF_ns          1000010 -- 00 ----- 111 --- ----- 0 ----
 
 # SVE contiguous prefetch (scalar plus immediate)
 PRF             1000010 11 1- ----- 0-- --- ----- 0 ----
@@ -1223,13 +1223,13 @@ LD1_zpiz        1100010 .. 01 ..... 1.. ... ..... ..... \
                 @rpri_g_load esz=3
 
 # SVE 64-bit gather prefetch (scalar plus 64-bit scaled offsets)
-PRF             1100010 00 11 ----- 1-- --- ----- 0 ----
+PRF_ns          1100010 00 11 ----- 1-- --- ----- 0 ----
 
 # SVE 64-bit gather prefetch (scalar plus unpacked 32-bit scaled offsets)
-PRF             1100010 00 -1 ----- 0-- --- ----- 0 ----
+PRF_ns          1100010 00 -1 ----- 0-- --- ----- 0 ----
 
 # SVE 64-bit gather prefetch (vector plus immediate)
-PRF             1100010 -- 00 ----- 111 --- ----- 0 ----
+PRF_ns          1100010 -- 00 ----- 111 --- ----- 0 ----
 
 ### SVE Memory Store Group
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b23c6aa0bf..bbf3bf2119 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5971,6 +5971,17 @@ static bool trans_PRF_rr(DisasContext *s, arg_PRF_rr *a)
     return true;
 }
 
+static bool trans_PRF_ns(DisasContext *s, arg_PRF_ns *a)
+{
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
+    /* Prefetch is a nop within QEMU.  */
+    s->is_nonstreaming = true;
+    (void)sve_access_check(s);
+    return true;
+}
+
 /*
  * Move Prefix
  *
-- 
2.34.1



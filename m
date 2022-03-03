Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036704CC7DB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:20:02 +0100 (CET)
Received: from localhost ([::1]:54864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsrg-0003LO-6L
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:20:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYZ-00065q-L2
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:17 -0500
Received: from [2607:f8b0:4864:20::633] (port=46935
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYY-0004Ir-3b
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:15 -0500
Received: by mail-pl1-x633.google.com with SMTP id bd1so5843510plb.13
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IQ/0x+8h8rxUUYa6vJrQrqZC0+JwQj34mk+yoHCm+Sg=;
 b=PqVB1xXtzSjinr8sboh10+sg7DoG/bOc3qAsGQsx+271fgI73PyBuEMDYo7yyPlNwS
 L5P/aQump/k6AHVZxjVlxV7KH8jomeSy8bfpWUkLXTgJ1Zz79PbFIEyikqiKmmzv4rbj
 sgrru/KY/d54xvDBx08xfN2HKR9Eun9RLAnheEuinCu/OhgtaUKU3GPXwqpfB4XoiODw
 k/nW4xanS4sQ436x+fSgVEKDsYII2nWWAX6xnroqjmPTy3lE9ISHmVsml1FyGQb6mJ4S
 kU9hm8oqbiDSGvc4dvz8yXe02l44EmnXGWbVyNICh8F8DpQhRH/hBBiyDXTC0DVbysHd
 33og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IQ/0x+8h8rxUUYa6vJrQrqZC0+JwQj34mk+yoHCm+Sg=;
 b=5PEjGcIW5HDAp9d5xZ190La7CpLrFh9q1912/VN9IVRqribt8soIPgfLHrdc4M5IGg
 M6jsv83jkzJ0xPpnWv54g25qpoyq6Vw1rj0c/6DLlvpNz5st3z5utdhLWDv8AdzET9F3
 ZxDORKXoEApOVdvQCkLeuW98LUxmSG8WOodyywP8Td43pLudrjjOO5EK3yC5EOQ4JeKZ
 2P+bVOit6r4Kd4Pzn8iUWsl/JpebCrMCjwdemC+qZMm/zwWwnqR2NLdfp/n1MIGyAevv
 sxNwOzfDNdLoS2C0jz4Tp8ZmitQoJpfyUgoj7rrpwiQ+w/mdXPOaG7qutn4igBrngex6
 5N6Q==
X-Gm-Message-State: AOAM5312U03KQPnzDcoUaCV03xyY70Ey/UlscbnYLQ/IB2mpxP1bjMRP
 XnxbHjWrMDeVcOUKiLYbxpzCBrZLd7xYvA==
X-Google-Smtp-Source: ABdhPJzyk21OKL9kmuQPNgaN29vA5gCtcusLWOpvy3C7SRTQjqs+MTgMJ9WqnDmznmLrM0jxWH6Ebw==
X-Received: by 2002:a17:90a:aa0e:b0:1bc:dbe9:1b20 with SMTP id
 k14-20020a17090aaa0e00b001bcdbe91b20mr7299452pjq.214.1646341212913; 
 Thu, 03 Mar 2022 13:00:12 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.13.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/30] tcg/i386: Expand scalar rotate with avx512 insns
Date: Thu,  3 Mar 2022 10:59:31 -1000
Message-Id: <20220303205944.469445-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Expand 32-bit and 64-bit scalar rotate with VPRO[LR]V;
expand 16-bit scalar rotate with VPSHLDV.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 49 +++++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 1fbb4b0593..edf0d066e7 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -3602,26 +3602,6 @@ static void expand_vec_rotli(TCGType type, unsigned vece,
     tcg_temp_free_vec(t);
 }
 
-static void expand_vec_rotls(TCGType type, unsigned vece,
-                             TCGv_vec v0, TCGv_vec v1, TCGv_i32 lsh)
-{
-    TCGv_i32 rsh;
-    TCGv_vec t;
-
-    tcg_debug_assert(vece != MO_8);
-
-    t = tcg_temp_new_vec(type);
-    rsh = tcg_temp_new_i32();
-
-    tcg_gen_neg_i32(rsh, lsh);
-    tcg_gen_andi_i32(rsh, rsh, (8 << vece) - 1);
-    tcg_gen_shls_vec(vece, t, v1, lsh);
-    tcg_gen_shrs_vec(vece, v0, v1, rsh);
-    tcg_gen_or_vec(vece, v0, v0, t);
-    tcg_temp_free_vec(t);
-    tcg_temp_free_i32(rsh);
-}
-
 static void expand_vec_rotv(TCGType type, unsigned vece, TCGv_vec v0,
                             TCGv_vec v1, TCGv_vec sh, bool right)
 {
@@ -3648,6 +3628,35 @@ static void expand_vec_rotv(TCGType type, unsigned vece, TCGv_vec v0,
     tcg_temp_free_vec(t);
 }
 
+static void expand_vec_rotls(TCGType type, unsigned vece,
+                             TCGv_vec v0, TCGv_vec v1, TCGv_i32 lsh)
+{
+    TCGv_vec t = tcg_temp_new_vec(type);
+
+    tcg_debug_assert(vece != MO_8);
+
+    if (vece >= MO_32 ? have_avx512vl : have_avx512vbmi2) {
+        tcg_gen_dup_i32_vec(vece, t, lsh);
+        if (vece >= MO_32) {
+            tcg_gen_rotlv_vec(vece, v0, v1, t);
+        } else {
+            expand_vec_rotv(type, vece, v0, v1, t, false);
+        }
+    } else {
+        TCGv_i32 rsh = tcg_temp_new_i32();
+
+        tcg_gen_neg_i32(rsh, lsh);
+        tcg_gen_andi_i32(rsh, rsh, (8 << vece) - 1);
+        tcg_gen_shls_vec(vece, t, v1, lsh);
+        tcg_gen_shrs_vec(vece, v0, v1, rsh);
+        tcg_gen_or_vec(vece, v0, v0, t);
+
+        tcg_temp_free_i32(rsh);
+    }
+
+    tcg_temp_free_vec(t);
+}
+
 static void expand_vec_mul(TCGType type, unsigned vece,
                            TCGv_vec v0, TCGv_vec v1, TCGv_vec v2)
 {
-- 
2.25.1



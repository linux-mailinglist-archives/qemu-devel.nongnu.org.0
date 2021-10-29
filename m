Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DED4405C0
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:24:33 +0200 (CEST)
Received: from localhost ([::1]:54376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgbEe-0001jH-Ub
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgb9I-0001ZG-7y; Fri, 29 Oct 2021 19:19:00 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgb9G-0006iz-Ea; Fri, 29 Oct 2021 19:18:59 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i5so11481418wrb.2;
 Fri, 29 Oct 2021 16:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MY9quCqJ/2Bz6tK8Zx9ZzguPdmzXrHRSyEOAkDlUTqE=;
 b=lNarN3wuSC4YDnLa0xvKEKXbmxO4J9zrq2P/0W6YJbryUerWu8qlqhlSGRTFcyP06W
 CFTa4WivDsVZgdaovZoPE5vpYn0KGfszueFmDEk/OX5BKYCy5+LNq2hTCLLcy8gBKW7/
 feSmeASjMW2B+gfhgrNcQAGvaGHRv9gXm0c2pzXzfvGCshrtRM+i8fXGki3709iq79c9
 d69uv6zvGVtFQ2v8Rkdcxs7Wy8eoMqdtna7CIgq0O13CBoTQKlUFkmb5JN4a2c8DNG5a
 lYl5u6l9/SJIA5iHFeNgW79S8mOYxhEpDkLIK44U8KIYPJqUWmcmmdEHQmt2afUmFW4o
 6rbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MY9quCqJ/2Bz6tK8Zx9ZzguPdmzXrHRSyEOAkDlUTqE=;
 b=eYPsnHZ03/UsE5XgTFfPQ1Zwe+cWwSDFVfotqsbxrPBI0KvgMbaP/K2Ve4x8d+DN90
 +V5i21GaOm5jfGsO+fcnM1KtNP+OO2vXWHzxlslnpd4QRmLDf3vXZ5a8SbrZ9efPN08v
 jev6txNZHpTJ3G04OFtiEdn1PpFGKmQ4rJVYmga8SvGeCUvrxS4LHs1Zbb/P7FD+UIEJ
 JstXQlchGLDSZFgcb1Yz34/dMwl16BgJeHwVNJHgTqYvf0F2fJB0Tc45hJZE9XbuuFLx
 zrTcIrKDDnt0215U2PLY7Tikb6lqzG+O9rYbWk/sQnx/BzWNRU8AF5U/mGurMd2Xu1V0
 FQyg==
X-Gm-Message-State: AOAM533kUGNryD+hhBaRaRPDHb03TwI/qsVglBa+wDbJkXqniKXNH5sz
 gNetss3KOZl2WcsRvkWO052Kczx54lM=
X-Google-Smtp-Source: ABdhPJxebAJZSh5pCFFKXlC5/mX/OX+LffRnk4wyXHnV6YlCZS0gKMGb27L8ekma7Wean/5+MznR4g==
X-Received: by 2002:a5d:6e91:: with SMTP id k17mr17735855wrz.260.1635549536702; 
 Fri, 29 Oct 2021 16:18:56 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r11sm6588586wrt.42.2021.10.29.16.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 16:18:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] target/arm: Use tcg_constant_i64() in
 do_sat_addsub_64()
Date: Sat, 30 Oct 2021 01:18:33 +0200
Message-Id: <20211029231834.2476117-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029231834.2476117-1-f4bug@amsat.org>
References: <20211029231834.2476117-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The immediate value used for comparison is constant and
read-only. Move it to the constant pool. This frees a
TCG temporary for unsigned saturation opcodes.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/translate-sve.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index bc91a641711..76b5fe9f313 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1943,20 +1943,20 @@ static void do_sat_addsub_32(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
 static void do_sat_addsub_64(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
 {
     TCGv_i64 t0 = tcg_temp_new_i64();
-    TCGv_i64 t1 = tcg_temp_new_i64();
     TCGv_i64 t2;
 
     if (u) {
         if (d) {
             tcg_gen_sub_i64(t0, reg, val);
-            tcg_gen_movi_i64(t1, 0);
-            tcg_gen_movcond_i64(TCG_COND_LTU, reg, reg, val, t1, t0);
+            t2 = tcg_constant_i64(0);
+            tcg_gen_movcond_i64(TCG_COND_LTU, reg, reg, val, t2, t0);
         } else {
             tcg_gen_add_i64(t0, reg, val);
-            tcg_gen_movi_i64(t1, -1);
-            tcg_gen_movcond_i64(TCG_COND_LTU, reg, t0, reg, t1, t0);
+            t2 = tcg_constant_i64(-1);
+            tcg_gen_movcond_i64(TCG_COND_LTU, reg, t0, reg, t2, t0);
         }
     } else {
+        TCGv_i64 t1 = tcg_temp_new_i64();
         if (d) {
             /* Detect signed overflow for subtraction.  */
             tcg_gen_xor_i64(t0, reg, val);
@@ -1966,7 +1966,7 @@ static void do_sat_addsub_64(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
 
             /* Bound the result.  */
             tcg_gen_movi_i64(reg, INT64_MIN);
-            t2 = tcg_const_i64(0);
+            t2 = tcg_constant_i64(0);
             tcg_gen_movcond_i64(TCG_COND_LT, reg, t0, t2, reg, t1);
         } else {
             /* Detect signed overflow for addition.  */
@@ -1977,13 +1977,12 @@ static void do_sat_addsub_64(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
 
             /* Bound the result.  */
             tcg_gen_movi_i64(t1, INT64_MAX);
-            t2 = tcg_const_i64(0);
+            t2 = tcg_constant_i64(0);
             tcg_gen_movcond_i64(TCG_COND_LT, reg, t0, t2, t1, reg);
         }
-        tcg_temp_free_i64(t2);
+        tcg_temp_free_i64(t1);
     }
     tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
 }
 
 /* Similarly with a vector and a scalar operand.  */
-- 
2.31.1



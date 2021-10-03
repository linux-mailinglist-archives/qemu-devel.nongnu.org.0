Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB9E420208
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 16:22:59 +0200 (CEST)
Received: from localhost ([::1]:44358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX2OI-0008GE-MW
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 10:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2N9-0007Kv-L8
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 10:21:47 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:56221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2N8-0007Gy-63
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 10:21:47 -0400
Received: by mail-wm1-x329.google.com with SMTP id v127so11202245wme.5
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 07:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FGFt3Emm2J4ZJHwqmsZyM0FIoxBakX/wgin/HsQFwEk=;
 b=pzG5bIg5ppHAPdlsW1KGtcoMejjY7BgreT5ELGtYfluW3mNzcnmtQEZF39iMGQAgnj
 hEx/LZFVU6xUtR46vAv9XUtWNTZeW3XnSHu/MgChz1kxwTdSOdzxPsaptpCx4YMgXS3q
 NWdSp4kXB6LjM7hREY82+d9cFeZqj03mUZfPLj3Ul2z2de3Qrg/YCEC0Xol7K+CwL05P
 CVQNzfNqL+CoOnFdGYWVF2A0ZkFEIf8a08fOPkrbGrqWlMJnF/JHofxYVW4kw9lwMPX4
 M+BHoAez0oxSVLyjvsfCYSy7kobSqohZbzXWIKuawE3L6RjPdayayGmSlWV2F09QDnvS
 pipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=FGFt3Emm2J4ZJHwqmsZyM0FIoxBakX/wgin/HsQFwEk=;
 b=3vrtsic1hrwhOIrdv8G841gVEh3FDVff/nFZg/jSe/VOukMg7Z36MyZXNZZssqQhoR
 cXMSAaRfjJU4kRrq7U4X88+a3wUwul/ksytMbmPYQ7hEx55bf2gHgNdKAAnz7VFGPuNF
 4tq8sBI5oWcM7gedJJr8rdYykWr1YXMI5WbpjwmCQyrUvYM2oUqh6rve335Yi2H+Bg0D
 aeyRNsc+ZCy7ETx8WJqO6JILPNIv03Xb77kRCns+JTEEd5CgBpHqhZcLbOF5KUIUk4wt
 HLO13vWqE9XjXFU8eE+Q8nHNhZ+hMAnK2xbxMx5zZVkWucY8P3jINuRCmSb45cnVYE/3
 lHcA==
X-Gm-Message-State: AOAM530xR5/neo3nv/PXVwtODZbcVImeLd1PkKEzTEHZf7Dx5tR7nbkg
 AZl4xfsNZFUUs+12LgR8VEKDeO6Zy3Y=
X-Google-Smtp-Source: ABdhPJyb9xZ6onO7IiktWSeuJsj8/Z4mO92kaOiSjzietBvoAsFChGb1Iie7O+7zdVThMaxloe1cRg==
X-Received: by 2002:a1c:7304:: with SMTP id d4mr14132642wmb.125.1633270904674; 
 Sun, 03 Oct 2021 07:21:44 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 q18sm13700051wmc.7.2021.10.03.07.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 07:21:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/avr: Optimize various functions using extract opcode
Date: Sun,  3 Oct 2021 16:21:42 +0200
Message-Id: <20211003142142.3674844-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Michael Rolnik <mrolnik@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running the scripts/coccinelle/tcg_gen_extract.cocci
Coccinelle semantic patch on target/avr/, we get:

  [DBG] candidate at target/avr/translate.c:228
  [DBG] candidate at target/avr/translate.c:266
  [DBG] candidate at target/avr/translate.c:885
  [DBG] candidate at target/avr/translate.c:924
  [DBG] candidate at target/avr/translate.c:962

Manually inspect and replace combinations of (shri, andi)
opcodes by the extract opcode.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/avr/translate.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index 438e7b13c18..246cbfba1cd 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -225,8 +225,7 @@ static void gen_add_CHf(TCGv R, TCGv Rd, TCGv Rr)
     tcg_gen_or_tl(t1, t1, t3);
 
     tcg_gen_shri_tl(cpu_Cf, t1, 7); /* Cf = t1(7) */
-    tcg_gen_shri_tl(cpu_Hf, t1, 3); /* Hf = t1(3) */
-    tcg_gen_andi_tl(cpu_Hf, cpu_Hf, 1);
+    tcg_gen_extract_tl(cpu_Hf, t1, 3, 1); /* Hf = t1(3) */
 
     tcg_temp_free_i32(t3);
     tcg_temp_free_i32(t2);
@@ -263,8 +262,7 @@ static void gen_sub_CHf(TCGv R, TCGv Rd, TCGv Rr)
     tcg_gen_or_tl(t2, t2, t3); /* t2 = ~Rd & Rr | ~Rd & R | R & Rr */
 
     tcg_gen_shri_tl(cpu_Cf, t2, 7); /* Cf = t2(7) */
-    tcg_gen_shri_tl(cpu_Hf, t2, 3); /* Hf = t2(3) */
-    tcg_gen_andi_tl(cpu_Hf, cpu_Hf, 1);
+    tcg_gen_extract_tl(cpu_Hf, t2, 3, 1); /* Hf = t2(3) */
 
     tcg_temp_free_i32(t3);
     tcg_temp_free_i32(t2);
@@ -882,9 +880,7 @@ static bool trans_FMUL(DisasContext *ctx, arg_FMUL *a)
     /* update output registers */
     tcg_gen_shli_tl(R, R, 1);
     tcg_gen_andi_tl(R0, R, 0xff);
-    tcg_gen_shri_tl(R1, R, 8);
-    tcg_gen_andi_tl(R1, R1, 0xff);
-
+    tcg_gen_extract_tl(R1, R, 8, 8);
 
     tcg_temp_free_i32(R);
 
@@ -921,8 +917,7 @@ static bool trans_FMULS(DisasContext *ctx, arg_FMULS *a)
     /* update output registers */
     tcg_gen_shli_tl(R, R, 1);
     tcg_gen_andi_tl(R0, R, 0xff);
-    tcg_gen_shri_tl(R1, R, 8);
-    tcg_gen_andi_tl(R1, R1, 0xff);
+    tcg_gen_extract_tl(R1, R, 8, 8);
 
     tcg_temp_free_i32(t1);
     tcg_temp_free_i32(t0);
@@ -959,8 +954,7 @@ static bool trans_FMULSU(DisasContext *ctx, arg_FMULSU *a)
     /* update output registers */
     tcg_gen_shli_tl(R, R, 1);
     tcg_gen_andi_tl(R0, R, 0xff);
-    tcg_gen_shri_tl(R1, R, 8);
-    tcg_gen_andi_tl(R1, R1, 0xff);
+    tcg_gen_extract_tl(R1, R, 8, 8);
 
     tcg_temp_free_i32(t0);
     tcg_temp_free_i32(R);
-- 
2.31.1



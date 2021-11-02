Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3A3442C2A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:09:14 +0100 (CET)
Received: from localhost ([::1]:45560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrfF-0003Q0-Ho
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrW5-0007c9-L5
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:59:45 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:45580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrW4-0006sB-83
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:59:45 -0400
Received: by mail-qk1-x732.google.com with SMTP id n15so5700313qkp.12
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 03:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j4r+jFmgKYVYNdmx8Xu4OV+7rTClDutKXjKZGGfWtS4=;
 b=JbLKWpI7lQ6koyQoSFzQMT5yCpPcB2OC46GQooFuveUGjJ3IiC8BWCr53P1vKVNLoh
 OXFmoeGbclMUXKCg3kh8HG5ou8n3E8FsLKaRk9WMfbHYppPVVM2bJ0j2K/bU0gvoTYb5
 rFJUzVA00ySijNs3eZBVIScrulF07BPNYPB4zLe9Pdhr201y34YCHx7RdDy4eWTEFYFJ
 IIXd0Qx9XwVMFKvI3mdLRD4hRPOaPqz8MtzBsPDsB7wB3MtJeMx8EJHpOf7ytQb4T6kG
 5Cy4wtvw65qI8D+kvl2M5r8YaNeHEzEFq/uKni6glAiKDvh52jugunugTgeZnuNO8Kkr
 VX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j4r+jFmgKYVYNdmx8Xu4OV+7rTClDutKXjKZGGfWtS4=;
 b=fYNLocjzDFPmrqDOYd+uz7B0QD6hHu/NuoBqhx9ZY/6DS+2d+3IA7mYjVxE2DuN332
 EnI+GFq+bt0+/cNfTPJHcA+WEn4/SpXg7z0kP+VwvaqBWNMJPUlX3BWL/NKKslrT8xDW
 HVPvMf5zFgpwS0AibC3ZcrELUKH8ACirXEBVfu+6y9HWR33By9pBu3YSAtmFGOt2A3TT
 WNmLwYdIBX/m/7ok55FdHtH4ediI288XBs8+XGuBdsv/k4hbkZ0CrORfd51Vh1yuBBZM
 PMCPbKM4rYeZNjkS8eK0k349MtzYE2LR0W2UJnk4ycYXa6ViX14PFe7jn9w5DES+m+Qf
 Nwdg==
X-Gm-Message-State: AOAM531F24ja7YaSvkyvHB6phVRQ0V3PGqldxcvT16taLycPoLyQqcvk
 gmxu12RJjnwePBp09aJf39y4aO+J72NRcQ==
X-Google-Smtp-Source: ABdhPJxh4eYSZFcShZ0n/cKNc+KRm50ClqvTSI+QS2OpdgxF0LX8ah+pC3ripIt6rjeXgE1sFxrUrQ==
X-Received: by 2002:a05:620a:40d6:: with SMTP id
 g22mr28856807qko.104.1635850782838; 
 Tue, 02 Nov 2021 03:59:42 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z26sm11789510qko.13.2021.11.02.03.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 03:59:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/12] target/arm: Use tcg_constant_i64() in do_sat_addsub_64()
Date: Tue,  2 Nov 2021 06:59:32 -0400
Message-Id: <20211102105934.214596-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102105934.214596-1-richard.henderson@linaro.org>
References: <20211102105934.214596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The immediate value used for comparison is constant and
read-only. Move it to the constant pool. This frees a
TCG temporary for unsigned saturation opcodes.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211029231834.2476117-5-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index bc91a64171..76b5fe9f31 100644
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
2.25.1



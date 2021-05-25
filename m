Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04685390C9A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 01:00:52 +0200 (CEST)
Received: from localhost ([::1]:32826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llg2c-0006hx-Ut
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 19:00:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0R-0002Yd-4U
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:35 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:43808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0D-0004nP-BZ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:34 -0400
Received: by mail-pf1-x434.google.com with SMTP id d78so23904560pfd.10
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 15:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3DHjpex0S8JDOy5JRC2IyqoQUwifwwct+C1bXOYlysc=;
 b=YRqj7oQr976igPnGuc3Oq96xQqHSLzZa2/oZHYTXCS0anSFH0z7AN/LOjxwPK19ax6
 N/xaTsSv1S2oHFUrgOn+t3lrMSk5B0UvJScywI0Vhm3g8ON2aXl3/RIgcZ+rkNSZce5Q
 zQ2fJyw0nZXTmLjpZX0FyL8vuuXFyRb4yZ4rt54OGnt2VTKoWpk8qFDNOcfpUQMd0pev
 WUi2aiERXYHOg9z0wZKV8afF3mgVrHuLdqgrCLo89Gt+apXXOxG9wONfbyAHqdS/+jTb
 d92j+tZ2spNs9uXofUmcmAYh1Jmnh4UFeuo/uTbDk91LUFSoZZIVu/LNActg4cxBtweU
 Qtdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3DHjpex0S8JDOy5JRC2IyqoQUwifwwct+C1bXOYlysc=;
 b=ehbOpSyYMiL6bg4CiEkh5EUIKmVYnzknE5Ooe8aj9vYx+qTDGor6Hx8/ynsiurslYG
 T1mgHa+0LPFXi5Ot8bENPkw488brNtJ5h9piHdJskWen2L1if4iInmtMpUBZZgYkjQH9
 GCU0U7FHJX27Ya0OnRR2k5vL/A9OANOnvn++iIpXxi1J3BqRDg+A9Gh5JLfcGAVotoV9
 bYCdkatj2HiOmVaGDNtyoeBU9RITITVt7mxO9YNwt+5nSIbJ6uN0z7ZGn6gEHZRFvAWN
 fPOGhfx/JDUNUJ690a899bezWWDmnHGtoO7aCkfd4W2yKX9TUJRY1JrvoK1E29LQlAFp
 iBCw==
X-Gm-Message-State: AOAM531rFahjdyISVF6XwxEFfwreJ5xUTT1ipnQdB1fdlJxlz11y2Ts6
 LeV99rsDI12npKfmsyGOBqL2GxjHXIrh2g==
X-Google-Smtp-Source: ABdhPJwLCjQgTBt5cDnXJYZr4qOlEdNIJOJBRzt9S4G23w5klV8OQ/mdN0FCba1Jjq5E0XL9V7jeXw==
X-Received: by 2002:a63:1161:: with SMTP id 33mr21376706pgr.270.1621983499843; 
 Tue, 25 May 2021 15:58:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l6sm1669928pjf.28.2021.05.25.15.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:58:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/12] target/arm: Unify unallocated path in disas_fp_1src
Date: Tue, 25 May 2021 15:58:07 -0700
Message-Id: <20210525225817.400336-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525225817.400336-1-richard.henderson@linaro.org>
References: <20210525225817.400336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ceac0ee2bd..510cb6ca5e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6494,8 +6494,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
     int rd = extract32(insn, 0, 5);
 
     if (mos) {
-        unallocated_encoding(s);
-        return;
+        goto do_unallocated;
     }
 
     switch (opcode) {
@@ -6504,8 +6503,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
         /* FCVT between half, single and double precision */
         int dtype = extract32(opcode, 0, 2);
         if (type == 2 || dtype == type) {
-            unallocated_encoding(s);
-            return;
+            goto do_unallocated;
         }
         if (!fp_access_check(s)) {
             return;
@@ -6517,8 +6515,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
 
     case 0x10 ... 0x13: /* FRINT{32,64}{X,Z} */
         if (type > 1 || !dc_isar_feature(aa64_frint, s)) {
-            unallocated_encoding(s);
-            return;
+            goto do_unallocated;
         }
         /* fall through */
     case 0x0 ... 0x3:
@@ -6540,8 +6537,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
             break;
         case 3:
             if (!dc_isar_feature(aa64_fp16, s)) {
-                unallocated_encoding(s);
-                return;
+                goto do_unallocated;
             }
 
             if (!fp_access_check(s)) {
@@ -6550,11 +6546,12 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
             handle_fp_1src_half(s, opcode, rd, rn);
             break;
         default:
-            unallocated_encoding(s);
+            goto do_unallocated;
         }
         break;
 
     default:
+    do_unallocated:
         unallocated_encoding(s);
         break;
     }
-- 
2.25.1



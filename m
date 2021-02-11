Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD49318C00
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:29:19 +0100 (CET)
Received: from localhost ([::1]:33084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAC22-00018p-I6
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:29:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZH-0008Mu-Q0
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:35 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:32802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZA-00005J-7c
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:35 -0500
Received: by mail-wr1-x42f.google.com with SMTP id 7so4127973wrz.0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=B7Md5FuB4zN4GGBUtZ2CBu4dxFI5W4WDEoeLJYQNPbI=;
 b=Y8CxfNgJ54/1UTffvtn8YVEe/+Hdbo25zGnk6xr+mOgN5BOpftZCBNJRZPNiDAwe0W
 bI9zw2ewcimgnuEluSpqvrzRGFk6IXJVlQ9iYSE2eQ947Gu6Wple7+2HacWdeW13tg0W
 hYS52iEDCJTxU6qVVPrD8fAQGlGZa7XLKct0Q5LFoPo67lr86yi2+n0uKH0Hqh2ROoD4
 imXQAMKgEpMr/7pOuOKuF9f+826ye+jcSBJCXmV9bRIZBRGk3Ed2VOLP0cqcwVQa7Vdw
 brrNUe2L89ziZbW/cCXy0QQTQDBmvd4OryN8fXtUYuE2nYgRcnJIvGQq6QmNzn9XCU1S
 LgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B7Md5FuB4zN4GGBUtZ2CBu4dxFI5W4WDEoeLJYQNPbI=;
 b=JTm6bVMujAYC77BEf3Bj0sJSnesa6apzwh/ygzGfHPT0RSM1m9j0K1sn3kDafDIyud
 dPwJ2VdoSW5p05mdz22KMASNc3/Pzo+hgZq9Sd4I3zV72IogbyBtM28K9bbPsaGXAyj3
 K/cYue/PzreA0vMheF+0OGktfztJ207uV/gEXlj/OQ33RUIX9ny9IeUbXiz2+1fLiYRA
 Cz+2X8l6kNoXkzTA678po+MMkNQgJkR6TP0CxWm+knSM0VdR5zjfyuiIaVdyg4wMIGw6
 omxLsRzN3sqntlH5qjBZykI10WqRjBy8sSyAQawtmmK/3SNvm4OhGsjmAMVMzgFE6uP5
 FD2A==
X-Gm-Message-State: AOAM532wvCBSqaZKrsgBisLAqKs2umwM6wba/JAsqeNVzmEp95O5yhOv
 v8lEuBUiHUdufsY1Q1Oi1wR2R2+R/Ld9Xg==
X-Google-Smtp-Source: ABdhPJzlbQ+TJzrM/h8jI5VxFDs4fKClRqnH6TxLGXH2uTGD+TMcT1ajTyfvlL2xwV591DsEjQUGNQ==
X-Received: by 2002:a05:6000:1201:: with SMTP id
 e1mr5808352wrx.14.1613048365368; 
 Thu, 11 Feb 2021 04:59:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/45] target/arm: Improve gen_top_byte_ignore
Date: Thu, 11 Feb 2021 12:58:45 +0000
Message-Id: <20210211125900.22777-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use simple arithmetic instead of a conditional
move when tbi0 != tbi1.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-22-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1c4b8d02f3b..b23a8975d54 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -183,17 +183,20 @@ static void gen_top_byte_ignore(DisasContext *s, TCGv_i64 dst,
         /* Sign-extend from bit 55.  */
         tcg_gen_sextract_i64(dst, src, 0, 56);
 
-        if (tbi != 3) {
-            TCGv_i64 tcg_zero = tcg_const_i64(0);
-
-            /*
-             * The two TBI bits differ.
-             * If tbi0, then !tbi1: only use the extension if positive.
-             * if !tbi0, then tbi1: only use the extension if negative.
-             */
-            tcg_gen_movcond_i64(tbi == 1 ? TCG_COND_GE : TCG_COND_LT,
-                                dst, dst, tcg_zero, dst, src);
-            tcg_temp_free_i64(tcg_zero);
+        switch (tbi) {
+        case 1:
+            /* tbi0 but !tbi1: only use the extension if positive */
+            tcg_gen_and_i64(dst, dst, src);
+            break;
+        case 2:
+            /* !tbi0 but tbi1: only use the extension if negative */
+            tcg_gen_or_i64(dst, dst, src);
+            break;
+        case 3:
+            /* tbi0 and tbi1: always use the extension */
+            break;
+        default:
+            g_assert_not_reached();
         }
     }
 }
-- 
2.20.1



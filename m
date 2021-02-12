Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEE231A55B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:28:22 +0100 (CET)
Received: from localhost ([::1]:37530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAe73-0008S2-IS
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:28:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVg-00026K-KP
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:44 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:56123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVU-0007qc-DW
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:44 -0500
Received: by mail-pj1-x1033.google.com with SMTP id cv23so128679pjb.5
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N1bmJlvzB/Qn12/EBjVNECOmeXAVaIntK2XEeqhnPCQ=;
 b=bljQLLS4tK+OxO8FsporHitpFGrh0BpHxyrej8ocahcVlG1+iw0pQtz2o8wuuFk9Kx
 OQ8/WIyIPDIri0mr7pvmhEoDifULoSxMwNW5508YED3m7CsvcuhxWI4EJlHmNaoxGYZd
 dMz2969HBYutLHgVBpw5eOZBFV+Xn05Ch+0vp8v4NAlHJ2ancnnPGWGEhv+DG4ZvURoB
 7CYd1/GPLHsplpDfzc+8uXRQr+LiHqHAu5cJCLP2s28r32Et1oEeZJT8TFjHKT+KrcfY
 s+O0uKvmpSNJYB5ArarLGE7JJm70eyH+1tTlISzDGWSEl5j8NLIKwwtfL3aC801X1RMK
 ieOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N1bmJlvzB/Qn12/EBjVNECOmeXAVaIntK2XEeqhnPCQ=;
 b=C0ensBBQ8sU23ZdMGDm+6doaSq9N5uuWtkTBkz1h3/LU6NSFrQ2Jb41Mf8hYQHXU3A
 qXiATyfEuZPlsommBjQ2Vsnqrdxt3O3ii6osqQtSPxND1RU9KbTNVKmKGNrFPFF13u+G
 uxTNcbjSfGnHyyh+x0/5pWxPCouOvO5DQFsKjo5UHUJwS49b6fAOmg8rW9TaLDYwimnp
 TKk0M4s/lxBgRvx3kraU1ytwZuQ989q0kt9jiZo1CAZ0xQVHKZZBxaOQrZpQWXJm8V5P
 NEnjYq23OZ4Jn0NnD/e/V2iRsoY2Z9CKZyqtAXRV8PM2wlRftrTZ0vI0WENBW7ZSDnRu
 mJFw==
X-Gm-Message-State: AOAM533AN10UOElP0f8ZkOR4WODGPCZQRlYcUlYAxk1WCeQ/0cBFPvcA
 Npo+7C5akvcbPvP6jBP9xY7onE0bDzNplw==
X-Google-Smtp-Source: ABdhPJzpbf83TVNHhWUCEK10Of2CiI5t8xb3kDaxZil83o4WGW3SPGVC249iQrEJrWn0Nnls/fd0GQ==
X-Received: by 2002:a17:902:bd44:b029:de:74ae:771e with SMTP id
 b4-20020a170902bd44b02900de74ae771emr3894351plx.73.1613155770997; 
 Fri, 12 Feb 2021 10:49:30 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 21/31] target/arm: Improve gen_top_byte_ignore
Date: Fri, 12 Feb 2021 10:48:52 -0800
Message-Id: <20210212184902.1251044-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use simple arithmetic instead of a conditional
move when tbi0 != tbi1.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1c4b8d02f3..b23a8975d5 100644
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
2.25.1



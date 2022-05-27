Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8BE5367B7
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:53:42 +0200 (CEST)
Received: from localhost ([::1]:36360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nug1l-0007dh-B0
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecN-0003eN-8W
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:24 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:41617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec9-0004Rk-K4
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:22 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso5062948pjg.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EiogioAB3TjwchGB3KXofSrjeGdMHkYpRSGaufEwY50=;
 b=C9AZ/rfBlYqU/9Z+ODxIOi7+DYIuzhTPfEZK3mvTaaxQr1yV2NEP6tJrUmj9zyZvoI
 dulOKLhhyGiTCJqIsQMmg3L6vLvib9Wt3/oY79LUAkRs2H4zZO5FZsqCZaL50CGqL3+k
 tXNmnz5irG+udWX8fCiF2+Fb/IzB84n2v6Jp8+ZADxQFstATUqhP8Ca/HwSDqBlqKFEY
 hZ3tbAXvc8UcBCc4H6WZ5XPgeTfsiBva7ENNAyNCJvEJWrufWuEWgIu08ZqwFjx+qkNy
 9m/XsydvTH3oIcKG6TWudElH1gkVBm8DptSbuoKj3QvkEUtT0eqjdyPViCH0K/hTMkbp
 gCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EiogioAB3TjwchGB3KXofSrjeGdMHkYpRSGaufEwY50=;
 b=CfAhcWvWVAeUsptAHqS3bEM+7Dr3mb6o2g1734NtMQaCI0h4My6bgowLw3dGfpFB4s
 HNTz3L58Qw2DQ/W6tkIJ4QJPQ1sO4iN1CzByM8NUbYFR+g9/1Wp2UW+SEb0AOC3RK7tP
 QfahIpojriJR8L56dJJVEqafzrruv7cuz3RJ+HZL6ATnVM4lax6cWM4Ffm8AeZ/EJhDB
 259dfXV2y8fDNd43uN6r/xE6ApShauOti3YMCWj1jqBXxfjnEGfT2UcX4VofF0lZCM1v
 gB+dt2DGmX+kP4CBXFZk6AtVyMcdBLnwY7wc1xeVXbRXQxMQzfc7gT2X1IelrpWE2Bmu
 1ddw==
X-Gm-Message-State: AOAM532vQfsKE8KwmxXrW/s0x9deOUXSZ+z1gHpvLOOCIQtSoz/sAyHP
 +12IfJLcE5SEJFiryzzGvS+EoEo7K+qx6w==
X-Google-Smtp-Source: ABdhPJw5zpD+LKw6q7Yzq/kJcr2LEOohXaxZNfSmGCi8+QtTOsWPYr+CxzIgBKe9DPOzcx9WAq+JzQ==
X-Received: by 2002:a17:903:240c:b0:153:c452:f282 with SMTP id
 e12-20020a170903240c00b00153c452f282mr42936042plo.88.1653675786241; 
 Fri, 27 May 2022 11:23:06 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 062/114] target/arm: Use TRANS_FEAT for do_clast_general
Date: Fri, 27 May 2022 11:18:15 -0700
Message-Id: <20220527181907.189259-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 21c2bd099d..f5453e99e1 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2575,15 +2575,8 @@ static bool do_clast_general(DisasContext *s, arg_rpr_esz *a, bool before)
     return true;
 }
 
-static bool trans_CLASTA_r(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_clast_general(s, a, false);
-}
-
-static bool trans_CLASTB_r(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_clast_general(s, a, true);
-}
+TRANS_FEAT(CLASTA_r, aa64_sve, do_clast_general, a, false)
+TRANS_FEAT(CLASTB_r, aa64_sve, do_clast_general, a, true)
 
 /* Compute LAST for a scalar.  */
 static TCGv_i64 do_last_scalar(DisasContext *s, int esz,
-- 
2.34.1



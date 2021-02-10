Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB92A315B1C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:29:04 +0100 (CET)
Received: from localhost ([::1]:43116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9dNQ-00031L-0i
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cyd-0003wp-4f
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:28 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:36690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cy5-00086F-4k
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:20 -0500
Received: by mail-pf1-x42a.google.com with SMTP id 18so110386pfz.3
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SkjTW1pp/pIbKp346VjcRf6VolQKu6II4bAjUu2eCt8=;
 b=DUDMR6Wf4tzjUCUjnPQjQzq61YjbfiK9d/FQwbaURuKPv94Ey6zRC9yDQt37w6L51R
 qTGLuVoYvKjUgaBl8i0wlfSY3M40tcHQQCYi1zcOFL6YoD0W7cNdOY31wKJnvIKi/2u+
 xID+QH1s/U9nuUFB0DY80jMWwIET2HL2FGJI7y03BjO0kQHbGQc4+Br9ii+wL1WYEd3E
 ihpdOceV61GQwka1+FQfKuWUfjq/kyXDfWKRUD4LYYhwZPzFMJtNxj837qYeEhT5JD1H
 amkoOKLlDBe6OIzk9ACWtpAX1MT+MfKHWYyns09vcy4SzzFATXgxEQAYBaM1x8t3QA0q
 RsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SkjTW1pp/pIbKp346VjcRf6VolQKu6II4bAjUu2eCt8=;
 b=bVGoDiqdpcGLgQ12Jt2o0u2xB8JK+ZhAmweA/JZpyX8Wn+du/eEFOk8kx8u1sNN+vT
 /VZh/MAGxmorzY+NLzR4sVZG/4H1jkwuU1xPUTaNldxnJeP4znAkUvdS5omHdJg1cGZy
 PpnS/q7TzRituaUiRYYg9GZgPhr+5bSLcQWq6ZOiecW5xUKQI60tTAcxaZsDxA+/pf9Z
 tR4/ahHW+dPi/LY003L7J34mhDuviuVzbcVk7yzGjPlkSdqNdEYG3QAMwOl0NLPE9w9Y
 JEGCuGLajMjHJfL2o4XRSm78CkcW5qq2YDJQmTrS2puLRzwR5kavX/IguHRNdYVgz3AL
 Z0dw==
X-Gm-Message-State: AOAM530VfaF0S78yK4qqrby13c7ZrxUrHWgM0CE0AsNm2KWMzueO3KRK
 +pPYm57/Azrl7mgaCzzWH6i9DxDQC4QSvg==
X-Google-Smtp-Source: ABdhPJwqtaUJO1oROwb1RrpSuLuOSSSyKh+2/48OUDgPXWKUxY/vzeluJ6IeiCjiYNiam5hYgDy9IA==
X-Received: by 2002:a63:f21:: with SMTP id e33mr457435pgl.84.1612915371159;
 Tue, 09 Feb 2021 16:02:51 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 21/31] target/arm: Improve gen_top_byte_ignore
Date: Tue,  9 Feb 2021 16:02:13 -0800
Message-Id: <20210210000223.884088-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
index ffc060e5d7..3ec0dc17d8 100644
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



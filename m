Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F29843BE3B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:57:57 +0200 (CEST)
Received: from localhost ([::1]:49180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfWKK-0001g0-Lq
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVdK-000081-8B
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:13:31 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVdI-000377-S9
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:13:29 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so647018pjb.3
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GboP199OubzTFoUWNJIGCwetPDxwQovjb6ythEGyKNU=;
 b=FIHJvrp3UZ3pQs9mMAP3R2tusKyHxzk5gU0eEvjHd3vJ8/Potayu1LLrRGY2bYt1wy
 Bcpl1mne/IveWNuMcpxMBUjxkT4LrE86W99oHbBOCaNn8h5AhuKibL0I5scKhYb2rPdO
 Z3j6vlm+9t0/7J5vb4kA+NZcK0DQjIfqLd2Hi1BdXTVcqV/UH5joMg9soY6sh3HW2ND2
 TgmJydNG1sHEIlwsCREzWsiXfaPY3ibEBpkFG9XdhnP+CU+6857Jxv9Ycjha3CzGExyN
 zv3eSOHpqtt/DkRZXVoN57Qc7AktFPWA5cHANUzlZG8HW7ZxV1BzjX4HSGv9C5KZtOaf
 mr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GboP199OubzTFoUWNJIGCwetPDxwQovjb6ythEGyKNU=;
 b=nTTRLJtRMZ2A4T/cJaIYfnXbH4xnMjfNC0ktYm85/npP7QQl1tNjNIDSmltv5TQgGd
 ow8T9a0sB9mi/00x+JClGZM+9Wjp1sEHUVyp9hWTpqDYls7380ESVTYTYolvd17CGUXs
 gihQZtkJ+I7zUr+Yl1jKpzsR92c1h9R1lXlHfPAoNRFzeCUxQurUuf21ZZtCjcGtSwFK
 6mPMp5ePZJbVJHaD+Qqbqsqls5+uKnbnfHd4USctYNTHM6jyISAxfU4kEEH9IYWUattn
 lvc0Yi7FRrJD3METE1gPlTfiySfRkd1PCVxiY0Bn0DL2S+AlpbqKyc8mEqivhFzLmx1O
 eN3w==
X-Gm-Message-State: AOAM530p/5/xslVr68Qk/SxYpvVYxskcMdG6yjHdffoEJ9r7ENlUQwDi
 uokT9zC9BDjEehQvsR7dVSgWUfnLR2in1g==
X-Google-Smtp-Source: ABdhPJzJtD9hLwqqgGbr/2xvGIickpkDVyI7q47u1xXCJa3c/U1rbnsBI3xbpRcluF3pOOk9QMYS7Q==
X-Received: by 2002:a17:90b:1811:: with SMTP id
 lw17mr1958869pjb.22.1635290007724; 
 Tue, 26 Oct 2021 16:13:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d6sm24158122pfa.39.2021.10.26.16.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:13:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 46/51] tcg/optimize: Use fold_xx_to_i for rem
Date: Tue, 26 Oct 2021 16:09:38 -0700
Message-Id: <20211026230943.1225890-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recognize the constant function for remainder.

Suggested-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 92684d4b1d..6c6c523a85 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1623,7 +1623,11 @@ static bool fold_qemu_st(OptContext *ctx, TCGOp *op)
 
 static bool fold_remainder(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xx_to_i(ctx, op, 1)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_setcond(OptContext *ctx, TCGOp *op)
-- 
2.25.1



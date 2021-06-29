Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F103B78CA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:41:15 +0200 (CEST)
Received: from localhost ([::1]:58572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJbe-0001Cv-6E
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItT-00008f-7N
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:35 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:33519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItD-0000xi-Ns
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:34 -0400
Received: by mail-pl1-x62d.google.com with SMTP id f11so69800plg.0
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CHsyqcYhDcvH4VyWNUvcKr7ulIJabCuia+q5kv3FL14=;
 b=HrFkohaVYQ29xSYF4JQatHrvGdRzjAQzHsAkiObJMajF0mVSUX3EXDNPDOixiRZK24
 sbz0P00epzQAUPRDnzxlyq/5GFr7zx7TNCYJFoX5ibNRSUjNjTanJFibBy4F1luOLDTI
 nbGNNjLKxVvzMaW0xnXhYt+qdq4KH3SVccv5yn8eZMNJlH+PQVGz1acDXg9a1rT/P5V2
 vfYWvU3Rj4iJELL5ktBsY07ArR1W1gx8Y8NpcafPyFvw6sQvUM18NTnMZEaoxm0aQ5KQ
 ewDKCcP6Z6BcBxtmyNLguPcaRGtGlPSf8IyuSAW1sxqYwOFKgKcTkYGkF5ZGfqJJXj5B
 5Bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CHsyqcYhDcvH4VyWNUvcKr7ulIJabCuia+q5kv3FL14=;
 b=XBypyUM5Bv8g8ADo0bAnR9HH/IvYNL73cwS2C/jP40xcCpbYOCEPm9ejP2jKpoM2xf
 S9vzFYCPYWQ6f0Qg4yyXZyjAkwexg7kvNCDpX8BoZdQqQXSeIBPSGhM1QCIYalNCvMT9
 9VjvhYxSn5+cOhEMRetCiiU/KrAy4bt1n2Tj4MYuTvM0y625CxAZFx9pz2sN63OUEioe
 sKXsly2OzqfTAZgl4lHitskJzycmU/mFLUU/UKwGV/zeRoFQuas6oGwTE/7BXHFn9+DL
 0Tzd6M1PkoqBdyZLQZotVJrWo4fTUDcPqNID6QgSm4b+IcvLNkcH7R+N9XiVDYqPg9Gr
 Cs+w==
X-Gm-Message-State: AOAM530jWx1qika6Z4DYliMW0gJp6S2msUXhFohOCoAi7/t+olJTXtPb
 9uCPl1VBHo/0zKHgktU7kQ5VGZg15iPSAw==
X-Google-Smtp-Source: ABdhPJx4guyZlAQoPlMGzqoVqbmddkGWCSMwVTtbH8P9oGkQT6nbfoevYOt8Ghd3++dA/vLMof37wg==
X-Received: by 2002:a17:902:249:b029:121:b9eb:a513 with SMTP id
 67-20020a1709020249b0290121b9eba513mr29176665plc.6.1624992918425; 
 Tue, 29 Jun 2021 11:55:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/63] tcg/i386: Support bswap flags
Date: Tue, 29 Jun 2021 11:54:28 -0700
Message-Id: <20210629185455.3131172-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Retain the current rorw bswap16 expansion for the zero-in/zero-out case.
Otherwise, perform a wider bswap plus a right-shift or extend.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 34113388ef..98d924b91a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2421,10 +2421,28 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     OP_32_64(bswap16):
-        tcg_out_rolw_8(s, a0);
+        if (a2 & TCG_BSWAP_OS) {
+            /* Output must be sign-extended. */
+            if (rexw) {
+                tcg_out_bswap64(s, a0);
+                tcg_out_shifti(s, SHIFT_SAR + rexw, a0, 48);
+            } else {
+                tcg_out_bswap32(s, a0);
+                tcg_out_shifti(s, SHIFT_SAR, a0, 16);
+            }
+        } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            /* Output must be zero-extended, but input isn't. */
+            tcg_out_bswap32(s, a0);
+            tcg_out_shifti(s, SHIFT_SHR, a0, 16);
+        } else {
+            tcg_out_rolw_8(s, a0);
+        }
         break;
     OP_32_64(bswap32):
         tcg_out_bswap32(s, a0);
+        if (rexw && (a2 & TCG_BSWAP_OS)) {
+            tcg_out_ext32s(s, a0, a0);
+        }
         break;
 
     OP_32_64(neg):
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2006250A47C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:40:44 +0200 (CEST)
Received: from localhost ([::1]:41838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYvD-00069g-74
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZ7-00070Z-R8
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:54 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZ6-0006EE-37
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:53 -0400
Received: by mail-pg1-x532.google.com with SMTP id g9so4887866pgc.10
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cIUkNPf5cnbBkJ8nSnvsEvFiRfBcdC/3/0gMnHNwY2s=;
 b=GupLg6O7dwwVZNl77Q0+aeQ9OiXNeZf9Vjxp1o8S4DxuuzRKX7zdhP8+ibhmLkKsGu
 +dTgfy62xWMpT1YqPQKKImob8HFDHq3skRpuCHFrZUTOMxvslWjZHD32eWAls7w/3guE
 lWfbKg63U5y0A+Gqp47ls2yaYjdcZMcx440qVSf4hyXxYAmDzdCThDsdRPncEmbORaLA
 /aqWt3pvjplEYDZYgsCiQW5jx9EDSJXvRFQ2wqgcjZdBPUt+k4W6RDl5Yh6wG80ytsFp
 LzxJVNY1t47v/s52l7+idT+HQIwBTZLOsUR7CwnKdprLP/NiT5+/++uY02wSVF5jPxMJ
 qi5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cIUkNPf5cnbBkJ8nSnvsEvFiRfBcdC/3/0gMnHNwY2s=;
 b=ISB/5ubHn5kuLpB7ygfuOsrkFT36Ra13eCYP7y95eTXjtKln7MrVg/WXaOcAIIKBUN
 7WNxW5TNkeQ/jVuG3d6Is14X75DmzW3I2cLSvvfUG38DR5dVLCWHmE1U68tITWm6d6Y6
 mN3GW3+ldnyATSrijbRMzxzeUY8nonVhPJPns/CHi7RY+o72UvGieqCssF1iheFgH0c8
 gEX+o6f1pTIr08XK0Fz7EnMd7tPB+gfsHoe+8037KU57y3oE8fGZ4jc4R6yCFOSi1y85
 PtB2wo1DhgizTNF4j/GqXuC++Eu4DIVfnvKMJ1I2cS9Y2TO3jS4sFkjMt0LdkaR6a856
 FBcQ==
X-Gm-Message-State: AOAM532zWfeMGF87pvRiGjztNcwmPKu5bVCKSwGEbyRP8wq9Xas6dL9g
 lLzCJeelThdQW1SQwFsoCT++0njJcHzjhA==
X-Google-Smtp-Source: ABdhPJzLQf44JR3bfo1qrxCEEJk9t3dcgQOVRyx3/KBAwmBKKlEXlJ1oFEWnTbqzOLLXExQjJLbvww==
X-Received: by 2002:a63:e245:0:b0:3a7:dce1:64b1 with SMTP id
 y5-20020a63e245000000b003a7dce164b1mr22448265pgj.67.1650554270808; 
 Thu, 21 Apr 2022 08:17:50 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:17:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 08/64] tests/tcg/nios2: Re-enable linux-user tests
Date: Thu, 21 Apr 2022 08:16:39 -0700
Message-Id: <20220421151735.31996-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that threads and signals have been fixed, re-enable tests.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/nios2/Makefile.target | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 tests/tcg/nios2/Makefile.target

diff --git a/tests/tcg/nios2/Makefile.target b/tests/tcg/nios2/Makefile.target
deleted file mode 100644
index b38e2352b7..0000000000
--- a/tests/tcg/nios2/Makefile.target
+++ /dev/null
@@ -1,11 +0,0 @@
-# nios2 specific test tweaks
-
-# Currently nios2 signal handling is broken
-run-signals: signals
-	$(call skip-test, $<, "BROKEN")
-run-plugin-signals-with-%:
-	$(call skip-test, $<, "BROKEN")
-run-linux-test: linux-test
-	$(call skip-test, $<, "BROKEN")
-run-plugin-linux-test-with-%:
-	$(call skip-test, $<, "BROKEN")
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7E7436D2A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:57:03 +0200 (CEST)
Received: from localhost ([::1]:33784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdg3a-0003Q2-5T
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfJW-00047M-A4
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:09:26 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:46859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfJO-00009M-IO
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:09:26 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so1487794pjb.5
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6WqZ25wFq09ydrDs8rqLqB/wSl97QtTO4lZCT5y2bsY=;
 b=dhVJ/XlcnI3faVwg0Ag3TLDlrxE6mmH5pvPpjfclytL7R6H/ASTcOXRGzx01AmASWH
 ynHgMedpYqnw+x/YJganGNfCPaY1a+iKh3s3eAaaZOYuHiJ9Zj4NQbqWCUEjleOPpN1R
 Q2Dp+TSK6N51k69jS8w4YODAQ8vcM+Dhx5uuc8q8BWn9Z4vQIf8sCPjmX4YYktl6Yoi/
 D0abC5VsU0rTs7RRk5Xf0FTMCks4TS4l0TuHYXopJLh7TAN3CgLLPcOt3TemzeRv0VPM
 xPwCAPS5zSd7KvrvH+BhAp7fu0OGJcjBOyLlJ4pWjC1usKOkQEznjLN8GnixHB51VD95
 +9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6WqZ25wFq09ydrDs8rqLqB/wSl97QtTO4lZCT5y2bsY=;
 b=4nrzFfBCJhGLu3RvtvDw23emjaQUE9c+xaJdSt24CF0bFRQEriFwW05RBwcLUHR2bf
 cetfO/JaSczMTZomgUodXgv15y3R1RMDP6RNfyGs1qckZQT7sFJhlmgjYywFzKmWvnGM
 rZsBtVLRX0yEnmfMN+4d8f/YeReLP0qF9OrxW9gFLgPis53Nx+1xo8kL7ucV80Lv0tyO
 MGTZviP1stcEgqUA0WIZLHJEVTcy/zvwEBVfXY40pPbwrHQ8sgXsZnpsqFOp+h7Gsd/4
 U53IR9J73njFrIVKX66LU4CDsKY7CYVk5WLFh4169y9wRv60wbN/Bo7HonjwcCZ9DQDx
 CxXA==
X-Gm-Message-State: AOAM533FMlYoGjvYH3rPSDDn/3qbtg/qRb3Al1zfyp5TNVgLRGzAOY6X
 RScX2N3F89VhWmBd/Tu378Tw4IsbkMA=
X-Google-Smtp-Source: ABdhPJw2WQgQlFd9m8VO0TZsS847pyF544/w6wftaCSHINN+2G/l+GJWt+uqWwiStfHMQ86tueyEXQ==
X-Received: by 2002:a17:90a:8a8c:: with SMTP id
 x12mr9425661pjn.44.1634850556014; 
 Thu, 21 Oct 2021 14:09:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i5sm6258856pgo.36.2021.10.21.14.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:09:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 46/48] tcg/optimize: Propagate sign info for setcond
Date: Thu, 21 Oct 2021 14:05:37 -0700
Message-Id: <20211021210539.825582-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The result is either 0 or 1, which means that we have
a 2 bit signed result, and thus 62 bits of sign.
For clarity, use the smask_from_zmask function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index d08cf7e4eb..64d3256bbc 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1688,6 +1688,7 @@ static bool fold_setcond(OptContext *ctx, TCGOp *op)
     }
 
     ctx->z_mask = 1;
+    ctx->s_mask = smask_from_zmask(1);
     return false;
 }
 
@@ -1760,6 +1761,7 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *op)
     }
 
     ctx->z_mask = 1;
+    ctx->s_mask = smask_from_zmask(1);
     return false;
 
  do_setcond_const:
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AAE425D12
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:17:15 +0200 (CEST)
Received: from localhost ([::1]:49352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZpK-0004Cz-7t
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZXF-0007Vi-D6
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:58:34 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZXD-0003pu-8I
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:58:33 -0400
Received: by mail-pg1-x533.google.com with SMTP id 133so851085pgb.1
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=b8yIT3KaJZYt5gy5TyzFmTT/EtPGhvDZ/H5CgGbMauM=;
 b=wqJmIrBAe00fNIO30IGVx901g/Ju6u1wjqsWDURYS9GkMDZosjlE3IcD1JaxNbgFzT
 zDNgwKgFCX5APSbCyFV9moPG69I4l/1cee/A1nPxDjgA1EIhlzXCCB+I+RYnfTUVpmPV
 zHpM/VUciZKabVebTsWkcHyKPxZ+volL/1Gt7swlUxDkjDnLDVugD0BugpaX2s8gJOe6
 gES1ON9GsNmviyN/xL5hSHbZOst25PDeUrYBejvYCETxqCCzpmiOWh8nNAw75lUN1Ob7
 8oH9dYQCHD32FzXkXcmIXDFE/QEypruhsBV7CpTL+OM9bdJUrwSu2GdS4OAwI3KlpGZO
 9Lhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b8yIT3KaJZYt5gy5TyzFmTT/EtPGhvDZ/H5CgGbMauM=;
 b=K4MCEVDKi1z6YTEPzOTXr/3LqSyE+bTDivovofVCrjJyXDzfpwvjRRsY3KJRHuKOLT
 9mcCeF2yGQGgudbwR02INTJYxiYuLK9izZIO7Ps9SVAyRUuNLO+qOX6HPZh5flKiFczu
 DlL8wfST+jEXyt/A8OI+xIBzaeVBWSarOns4+rY4l9ji7+ZRLwlhXvLb/5h80WIM760q
 e6k+9iRkvbzDw+Z8pT7nm2LSkOUJ+FJZPwA35LF+b2WydZb5vqldJk3ajbokrVEJqFnw
 baRv3XKO2ntaMaHXHkyJLWJ/G1Qg9X7igVD/UNZctRcNim5SnX116rGGBp/KEelV+5jn
 AJNw==
X-Gm-Message-State: AOAM533L9VLnRRSigrIkDDaAf56Da1mCl41PYuwJ7rzdf3e7P6csADfk
 5J9pvGuLjr26uRe/3I/BTp2S5QaWvwho9A==
X-Google-Smtp-Source: ABdhPJxuMV5JNKvZqOlPsf4bsK00Dig1yX7hHN/G+evaWCrAMcl2qHyW+He9oDfjizN+Pi1k6TF61g==
X-Received: by 2002:a63:230c:: with SMTP id j12mr1246192pgj.1.1633636709406;
 Thu, 07 Oct 2021 12:58:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t2sm8995380pjf.1.2021.10.07.12.58.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:58:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 42/48] tcg/optimize: Add more simplifications for orc
Date: Thu,  7 Oct 2021 12:54:50 -0700
Message-Id: <20211007195456.1168070-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Two simplifications that were missing from before the split
to fold functions, and are now easy to provide.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index ad94f246ff..9c11f83a4a 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1562,6 +1562,8 @@ static bool fold_or(OptContext *ctx, TCGOp *op)
 static bool fold_orc(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_xx_to_i(ctx, op, -1) ||
+        fold_xi_to_x(ctx, op, -1) ||
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
-- 
2.25.1



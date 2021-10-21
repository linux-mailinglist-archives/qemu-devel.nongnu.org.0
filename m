Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 048B2436CF8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:44:36 +0200 (CEST)
Received: from localhost ([::1]:55674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfrX-00056m-0i
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfJM-0003tn-Nk
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:09:16 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfJK-00005i-3A
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:09:16 -0400
Received: by mail-pl1-x633.google.com with SMTP id i1so1260300plr.13
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jhxCxDORBWFlpLFFFW8AXdB1GybQS0psT2aJJV5BQRM=;
 b=N29pthoMXmOqz68v+3SMzBPcn2qtDZXIDUYPEaAu5omWZj2+vQUB1KS/WcXSRyIQAX
 YEpFAjTgTJVduKhS/iCThZ+3568A6rOZ6+ZflAft/nFN2Kp73sR1mX8Iu+0NuqXPxSuN
 TLyOFRvA3vpLvHscRyei/vQy4UtWH2butXRr78vFkUkPUnlZQk28GJIrBzJ2x24EBLpP
 7ZPf/8ut31EeK2UhAhexVV+/whyK/xtqZd6JSAy3Q7kXDl+/+Kr8q4+OpwEjqqOAI1lp
 sJXFWhUzaM48m+c/7HTWxqhQI8BgJyj9WFu3ccO/hvlvJOTnmKiYCKypbmr6o8GnlXn3
 GVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jhxCxDORBWFlpLFFFW8AXdB1GybQS0psT2aJJV5BQRM=;
 b=VwnRsGR5s76KiaH4VyGqy3bFkdvqoTzfsbStpGMLw9H51ofHq1+4qGlE5AjiKS8MfJ
 ldhrmuyAMeX10q2zjlH/i2Xk0tnGciq6DsxaFPQD5H+oPYBvddDG0tZtGAvQV0vE2rBD
 WwiXS11Qz9nD+RpaGjoj7rCPXOOJ7g864CEoDNMA3otl/EE8WMdiG++BtN2OjgcZfSiz
 /GHMDCnfZFqrtfO3rKc5qn+R+ZKAMso03hYj5lYYBXKs+WELXfkgo5yKExMi/RdUn46v
 v1bb0C/4bGK2HR+ddgbwvjmQMkemmTZq/MzHvlyOzfovYj784FSNrCLFhxBwO18hh4uZ
 ZwyA==
X-Gm-Message-State: AOAM531lqKs61dknTYxZRwtJBiqJbz7kVTVSWrcqYKTFksc+2OVWyUqi
 HXEL/jFvY3Ke7dP0i74EdGZ2jm066nI6nA==
X-Google-Smtp-Source: ABdhPJzun9lHFnnYepaXoU5bMAZZxkseG98o3xUZc3jTRkPBdqssj9EMvc/5NLgzbBsIhracXb1nGw==
X-Received: by 2002:a17:902:bb81:b0:12d:a7ec:3d85 with SMTP id
 m1-20020a170902bb8100b0012da7ec3d85mr7544088pls.17.1634850552663; 
 Thu, 21 Oct 2021 14:09:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i5sm6258856pgo.36.2021.10.21.14.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:09:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 42/48] tcg/optimize: Add more simplifications for orc
Date: Thu, 21 Oct 2021 14:05:33 -0700
Message-Id: <20211021210539.825582-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Two simplifications that were missing from before the split
to fold functions, and are now easy to provide.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 92b35a8c3f..dc7744d41a 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1561,6 +1561,8 @@ static bool fold_or(OptContext *ctx, TCGOp *op)
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152B443BE40
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:59:46 +0200 (CEST)
Received: from localhost ([::1]:51454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfWM5-0003D6-7s
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVdJ-00007z-K0
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:13:30 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:33622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVdI-00036x-7q
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:13:29 -0400
Received: by mail-pf1-x433.google.com with SMTP id t184so960704pfd.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cnvEeNPX98sjNFRW8f9jeq34B27koZa1lMjiPIc/x4o=;
 b=g9Hl/aCgvXjcW2VE9D5p6WO8ZpqTpg+rnPe1JZD5kOd5WTHLw2/7+568xAznnvgrZ8
 BqCi6PsKgqOk/R1ZP2+zf6M32ViaABzGiMTz8XMd6l867TmrJwj8KPA0H1gx6kMGWenE
 bMr9Gxn2QfgfLwymmoxilX1hYMO8kahn/qs8cktu5ctaTRWzuZnr0cDt7JY9+eMrK4/R
 TGu3BJDbmfpPyb/Eghn0gLWxjig/lN+rzEyspK4TLBtQkrmGXuJPk/4t6OCubRWjGD8O
 Qr55NOmiY43wGpwpx5YpbBRCVH/TZIIZpkA1bSN40RV+UbDoE0BBKxFmDD+E3+VMYJ+N
 7/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cnvEeNPX98sjNFRW8f9jeq34B27koZa1lMjiPIc/x4o=;
 b=Nelt/8pCGCswOIn1hRGnNA/fflIOIJBFpVSI2BbssHEcaYfC46f1U0YRxlx56kkic8
 2a+E/+QHELHSEpJI2fyp60qdX5dmsI75B9ta/ZXiJVMiaIGYv78qBOLyQ+3BSMJ9pi9v
 alhxH8NVzrTfSelVvQ1OCqYK7PzKBTemOVDG4vFStMYvIW0mTEBLmxKG3Xa2rBoidvxz
 oPW/x6KvflOHSA8b41uFhft1z9H8pl2HeqJI09feQxYPH2cKGZ9P9BU/N5xFKVv0Ah8a
 f+xpN/a7k85I5lAUbnvjWQa4M8cLmyUyl8UagbpZKjRfbPaWdF0PoPDmUXJcoBDZEc0z
 /xPQ==
X-Gm-Message-State: AOAM533g79Ucei39pwAqL5qmO5HfR2QKiL2g+fXzfZIpBK8jH/yVRcMP
 vOfwjkNiZjCD/CKZBbRhG0rRgizsl8rciQ==
X-Google-Smtp-Source: ABdhPJzps0r+1OxN/8I/JBEDC4dUSVcXGp6PDg+lYsu9/zbouPvROM8NRpkqHcrpi2Mp9GzmuzrGLw==
X-Received: by 2002:a63:6f44:: with SMTP id k65mr21427547pgc.440.1635290006825; 
 Tue, 26 Oct 2021 16:13:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d6sm24158122pfa.39.2021.10.26.16.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:13:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 45/51] tcg/optimize: Use fold_xi_to_x for div
Date: Tue, 26 Oct 2021 16:09:37 -0700
Message-Id: <20211026230943.1225890-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

Recognize the identity function for division.

Suggested-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index fe2b1eb18e..92684d4b1d 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1217,7 +1217,11 @@ static bool fold_deposit(OptContext *ctx, TCGOp *op)
 
 static bool fold_divide(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xi_to_x(ctx, op, 1)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_dup(OptContext *ctx, TCGOp *op)
-- 
2.25.1



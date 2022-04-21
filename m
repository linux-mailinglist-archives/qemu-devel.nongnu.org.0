Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9657A50A4C6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:57:27 +0200 (CEST)
Received: from localhost ([::1]:36612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZBO-00027X-NE
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYa2-0000HX-AD
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:51 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:46079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZr-0006PE-Jd
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:40 -0400
Received: by mail-pl1-x632.google.com with SMTP id h12so1498865plf.12
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zc1mqybjsWcyFEwC/S0EjY6YuNy3rNeZ6fKgxDEj7XU=;
 b=DY4WslswatTehUfzCFU4/Xo4POtZ8FzrfjA0axhpS1cJCyTVy/fhxBz3xtvlRIFUvn
 umY3qjAt4hyEsUlprKA8Q/14ZRQo3AmSQCXsyqtJoZ+BiAcIsGlzBxlgAKEmqtmwScUT
 ky22D+z6IVGOJJTrsywdCjIk822GSJPe+c6uD3HdYNRYInTGyfWmm9oogJR+68e4cJQm
 FedS0Qfa66lp1ghN+O0IXT1wEJ0/A97f8TqzGESZ/XUeXFKO//RdT4xziOijOcmhfVxF
 QNr/j4oQXSW2ZfjRS2RqR1K07x6KusH4zymIUfuu6KZmsrX6E7E0wNYC+ZzQqkvc9Gah
 YOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zc1mqybjsWcyFEwC/S0EjY6YuNy3rNeZ6fKgxDEj7XU=;
 b=2obfa9V8jV3oubPhwxaKSWAGRddQQ9GLvsqfWc8HQt5dhRezrvruOy9mATcU9uh1/D
 XJQYZEuPnktsSV68+H9mKYHR0zCyc5oaCPliMe79n7G6onH8m+6Q2RRmWYQniAEX2nQr
 Zlh4tcs2iUu093Hsv5RAkrzIg4JtsT1koZMKWLyZcq37hJxx6xQkkHQ3mSSA7n09y0Ct
 8cQqWQjML4EvTyk/fZr8BEBkL2pOwAWOJacMaJzkR1XmYgj1FFxmCQfUmPh3XVJeWwor
 zzFqSi5lf59s2hL62YNNt4qbTMs6rJsCk9bW4qihnUfPR/o2P/AfRxfqtBlvqI8ZjmZc
 LI+A==
X-Gm-Message-State: AOAM531L2tlipL8wui2I//BYg2OP+EKQvv6mBDucAEILm6ccDCg9RldA
 RMwx3WhX5U1u9tkuNuGb+2BwfV0C0BkGMQ==
X-Google-Smtp-Source: ABdhPJzO4j0J0pRwW4tPgNAJqLHrMpf5UkZAc2rsECYBCdXROaKKOazkzbo1tSShaFUYSem0UyK09A==
X-Received: by 2002:a17:90b:3ecc:b0:1d2:c238:d92e with SMTP id
 rm12-20020a17090b3ecc00b001d2c238d92emr146334pjb.79.1650554318323; 
 Thu, 21 Apr 2022 08:18:38 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:18:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 39/64] target/nios2: Implement CR_STATUS.RSIE
Date: Thu, 21 Apr 2022 08:17:10 -0700
Message-Id: <20220421151735.31996-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Without EIC, this bit is RES1.  So set the bit at reset,
and add it to the readonly fields of CR_STATUS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index a0c3e97d72..7d734280d1 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -54,9 +54,9 @@ static void nios2_cpu_reset(DeviceState *dev)
 
 #if defined(CONFIG_USER_ONLY)
     /* Start in user mode with interrupts enabled. */
-    env->ctrl[CR_STATUS] = CR_STATUS_U | CR_STATUS_PIE;
+    env->ctrl[CR_STATUS] = CR_STATUS_RSIE | CR_STATUS_U | CR_STATUS_PIE;
 #else
-    env->ctrl[CR_STATUS] = 0;
+    env->ctrl[CR_STATUS] = CR_STATUS_RSIE;
 #endif
 }
 
@@ -127,6 +127,7 @@ static void realize_cr_status(CPUState *cs)
     WR_REG(CR_BADADDR);
 
     /* TODO: These control registers are not present with the EIC. */
+    RO_FIELD(CR_STATUS, RSIE);
     WR_REG(CR_IENABLE);
     RO_REG(CR_IPENDING);
 
-- 
2.34.1



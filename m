Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F9A3FD845
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:58:23 +0200 (CEST)
Received: from localhost ([::1]:42678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNwk-0001iF-Em
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcI-00074l-UE
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:14 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:41566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcH-0005no-A1
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:14 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so1215026wmq.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dlNDMB/8L65w3rYQrh4g4+ZBy9+++yz/Uc57+3Riqgs=;
 b=epMPq3ghMGNjs2aUnH1azSrBXvvW4sD27Er7fl+nB8bcKpp20oQ/HlUaVDmRoa7tHw
 KxX0Aa5HtpIfOJjQmrRMiSa/9xoU+ERa4aopIPMBG8jGS2CAIsufSBSljdlBNa8eCniQ
 XlVYoM7ZjFe/ciXHiAwNyEsXPRcE8r8WaiOwnrVWKpukMb8tIFDI7wzXDy6DYQcCbcFp
 3kaJDi0rRrUoWJ/tJbXv9CZrD/UE7EPgExudYUjUgj6aTdjoHP6RAKrDH+yAHqGHme8Q
 F2RtNRXUt1AeK04d8Y95dD+yeOPiOhqq6vwoAUw3jiPSJC+WTcqqHwqOfxrjHHXvIfiK
 AkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dlNDMB/8L65w3rYQrh4g4+ZBy9+++yz/Uc57+3Riqgs=;
 b=Vf+b4Bm0gwTpd6DSDvhe/Y/tujC+txc/RsWEwQcOzQgX+PK7QOcMvrhYcYirGssfiT
 ECPIynWHsi7JKrE/eYNwITb10dkhCiO2KvzYkJBdSXzdfXvTQ7uV+lQj/IO2AryQ+GC8
 JhCGVJU9G84+lT/Hu7ckeFt+pd1qV0iULl3O0wYCF/uTRxJ3J95emXp0qcYOiTJ1jN7C
 MrA+JdcAKxPp0rFs1Jzf0mhTCN1edJxX0mlfpcobX7dqO4CcQIdU0NQZThrvhTR4C/2j
 SXJWudP5FWoOlx1/q+dBnF53P187kiJ403wPDSdxkozExjhyqK+kksQnN9zyljrZ79YF
 yPRw==
X-Gm-Message-State: AOAM530VDMher2qGFB2s6oKmjTQ4TFoB8XgEeKYMVezs0IUSFO6E2jrC
 BOHFtJmgdgSgEAbNlFLp49r+xMS8LlVbLA==
X-Google-Smtp-Source: ABdhPJy8HEDwjK+AOnZCZ7542ATXZD6XXLre9ZXAzUfoFujyFXhywYDa18zJLrwvF7LMg+RSK8HUNQ==
X-Received: by 2002:a1c:4e11:: with SMTP id g17mr9117159wmh.2.1630492631418;
 Wed, 01 Sep 2021 03:37:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/51] target/arm: Enable MVE in Cortex-M55
Date: Wed,  1 Sep 2021 11:36:25 +0100
Message-Id: <20210901103653.13435-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

We now have a complete MVE emulation, so we can enable it in our
Cortex-M55 model by setting the ID registers to match those of a
Cortex-M55 with full MVE support.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu_tcg.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index ed444bf436a..33cc75af57d 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -654,12 +654,9 @@ static void cortex_m55_initfn(Object *obj)
     cpu->revidr = 0;
     cpu->pmsav7_dregion = 16;
     cpu->sau_sregion = 8;
-    /*
-     * These are the MVFR* values for the FPU, no MVE configuration;
-     * we will update them later when we implement MVE
-     */
+    /* These are the MVFR* values for the FPU + full MVE configuration */
     cpu->isar.mvfr0 = 0x10110221;
-    cpu->isar.mvfr1 = 0x12100011;
+    cpu->isar.mvfr1 = 0x12100211;
     cpu->isar.mvfr2 = 0x00000040;
     cpu->isar.id_pfr0 = 0x20000030;
     cpu->isar.id_pfr1 = 0x00000230;
-- 
2.20.1



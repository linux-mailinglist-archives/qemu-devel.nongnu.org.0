Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F673D73CA
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 12:54:27 +0200 (CEST)
Received: from localhost ([::1]:51266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8KjC-0005E0-NL
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 06:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Kd8-0001j0-Nu
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:10 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Kd7-0004tn-19
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:10 -0400
Received: by mail-wr1-x432.google.com with SMTP id e2so14648067wrq.6
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 03:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PBYfSs2ntAIkplw98byjTpcgy6mZ7wjnsExSxgx3ybY=;
 b=Y9qxQLdvGWjQgitPrQZXFIL+jsOaTbRVxAlaIcBM1dBqhxrYNE8XV99+J+nQaMIddj
 gFrm76ddyRrNK9AHhtL3pemDWYuIaeL1W+KSOI5zetiHnSxhHwjgf9OP4rVwfzgso79N
 Q+MIC0jEA2kLpBE2iNfoTglSuMp6j+3+718eZhf/CbKAmqziqL94z0Scrt2yHUGZAF9H
 NY4HsYIKcehVQkuXtEFQt9lmITooWtZKxCtoqrzM3jmHTQXaVBRt4Vowsor+dZ5oi4/n
 qnPq9XwNL0wO/Co7kNsI8AanBtP+0rhyRBuvNo8roIOIScLj6SOpeIyAHEhhc4fUt1Te
 WZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PBYfSs2ntAIkplw98byjTpcgy6mZ7wjnsExSxgx3ybY=;
 b=qfo5XFyTKmbCpdP+vhD2i/m7BwrwK90spHPeE26FHCBdH5XQkXO+wnfNlFpoxaQiZ5
 AVDRW0IpO26+fTHmXV+z7yYBLI9ScHEx7zjBFMy5GMpcsAMPK65M9aKySmIQVMGDMbJf
 d6IMDZG5QXCLVt4qd2shwm5KOPwQsZ52jPJB6c8ku74Vv8sTmonKZnePOCAHWevVzi08
 mtfl2f6231/nkAZrWpTKm1ixt6nPXD2m2LTW+9Et5NJVJLnsxhEj2Kmgd3bRJ9BinCEC
 2WuNvamIq51v6U9Akk2qqfS5FCRFiZirjACTBrjdw6NAx9O2ECww2bJzM272h1BlEFbO
 DVAw==
X-Gm-Message-State: AOAM531dwaBBuk06YYSe8F0Lm7egJd0zp6UlxU5jaN/LFbVarS16PeII
 ci6R/e9K4UtFK5D99043laWPSyaWjuveAg==
X-Google-Smtp-Source: ABdhPJyct+wRzg67FGBiR+2uYSYKAMH9U9B9JzWyQ2dGqLoY4yZZkkcTZw3Tq1VF2PhUUzIegbBD3g==
X-Received: by 2002:a05:6000:227:: with SMTP id
 l7mr12199412wrz.289.1627382887742; 
 Tue, 27 Jul 2021 03:48:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm2413598wmi.33.2021.07.27.03.48.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:48:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/14] hw/intc/armv7m_nvic: ISCR.ISRPENDING is set for
 non-enabled pending interrupts
Date: Tue, 27 Jul 2021 11:47:53 +0100
Message-Id: <20210727104801.29728-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727104801.29728-1-peter.maydell@linaro.org>
References: <20210727104801.29728-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

The ISCR.ISRPENDING bit is set when an external interrupt is pending.
This is true whether that external interrupt is enabled or not.
This means that we can't use 's->vectpending == 0' as a shortcut to
"ISRPENDING is zero", because s->vectpending indicates only the
highest priority pending enabled interrupt.

Remove the incorrect optimization so that if there is no pending
enabled interrupt we fall through to scanning through the whole
interrupt array.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210723162146.5167-5-peter.maydell@linaro.org
---
 hw/intc/armv7m_nvic.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 94fe00235af..2aba2136822 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -127,15 +127,14 @@ static bool nvic_isrpending(NVICState *s)
 {
     int irq;
 
-    /* We can shortcut if the highest priority pending interrupt
-     * happens to be external or if there is nothing pending.
+    /*
+     * We can shortcut if the highest priority pending interrupt
+     * happens to be external; if not we need to check the whole
+     * vectors[] array.
      */
     if (s->vectpending > NVIC_FIRST_IRQ) {
         return true;
     }
-    if (s->vectpending == 0) {
-        return false;
-    }
 
     for (irq = NVIC_FIRST_IRQ; irq < s->num_irq; irq++) {
         if (s->vectors[irq].pending) {
-- 
2.20.1



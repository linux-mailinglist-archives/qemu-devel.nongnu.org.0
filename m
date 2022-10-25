Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED2F60D1D2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:46:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMyr-0006Th-40; Tue, 25 Oct 2022 12:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyg-0006Ck-1f
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:34 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyO-0001dB-RO
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:25 -0400
Received: by mail-wr1-x429.google.com with SMTP id bk15so22061269wrb.13
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gxu0mniabCTeOPg3dGH8ocxPQsfgLf2PZIHByV3HkDY=;
 b=jEBZSTplR+MxR0uq6vfPiEC2Z3YGy0W8YQWv50NrBCs1GdelKLz+2k2xmjoqEamjGG
 R8Qr5YjjfNbUIJtU9bVFmdYD0xA6+TdwDJabeJ5zqlGx/y7qhueTNRkSxI/dxBhj/wr2
 0fKzYK+vQxDV7RpJAHvpFCQ2faT0/bs7BEpEd274M2+BuVhoS6jmTYoI+aVXuKEqQzt0
 z219BJEXK8qJ5bdSOFXbaA1xajA9aEAl1vEP3BL1ShHAxADPDQ6lFfcdrvFGT3HgYXeh
 hbwjOtXef2tEK4MAsoCrI6OtY2Pvw4xu8GnL8BjK5+O/ZBpx5xPYYZBywdPagC7L+H62
 K0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gxu0mniabCTeOPg3dGH8ocxPQsfgLf2PZIHByV3HkDY=;
 b=P+IzX3QgBAhwaUJ8nWDvEfKaLQNziq8Wd/aXPr8kr5u5z+FSQQCgfbi04D88pWuCSp
 GvIyZjR+SrrZHLcxmifU/r1pRm1W4yJ1ejWX1reqAvBBXZJ1pMtEoTz2zq6Yznk7SYXn
 XXh6+7WdLKcCWqBH1DEPcXbgwvwIPK/U2ib7QHbNBCuyB47g6tLAl/haEdoB9JzGvitc
 +krHCVE83Lm5cLbXMToLJQh1YLPjC4LW9W/Ea3mmORJkYrnqKG9xCti6nb75KA9sIs7f
 tt1W3pEOtHHz1E4G8PYZgUHhzjVEajBuo8caEtHM5lkMnrPokoF9p69W1FzhI2365eLn
 hpUQ==
X-Gm-Message-State: ACrzQf0Sc+CEv+nsq3tGZdTeDZKTb/1bcpNvg3Ihj4cNGJLPAzEkdbxa
 LmqMQnQ7kCbX9+z/U6oqDiqb1d37yZYoNw==
X-Google-Smtp-Source: AMsMyM7Q91F2vu9Ud3CX27YdO+l+QOjJny+YKb65By20wp1zZYo3hiqeiv9mNChZ9Rv/lITFuwQrDA==
X-Received: by 2002:a05:6000:16c3:b0:22e:c6fd:2676 with SMTP id
 h3-20020a05600016c300b0022ec6fd2676mr25899358wrf.141.1666716015395; 
 Tue, 25 Oct 2022 09:40:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.40.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:40:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/30] target/arm: Tidy merging of attributes from descriptor
 and table
Date: Tue, 25 Oct 2022 17:39:39 +0100
Message-Id: <20221025163952.4131046-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Replace some gotos with some nested if statements.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20221024051851.3074715-12-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 79a0ef45c79..73b3c37b23f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1322,27 +1322,25 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     page_size = (1ULL << ((stride * (4 - level)) + 3));
     descaddr &= ~(hwaddr)(page_size - 1);
     descaddr |= (address & (page_size - 1));
-    /* Extract attributes from the descriptor */
-    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
 
-    if (regime_is_stage2(mmu_idx)) {
-        /* Stage 2 table descriptors do not include any attribute fields */
-        goto skip_attrs;
-    }
-    /* Merge in attributes from table descriptors */
-    attrs |= nstable << 5; /* NS */
-    if (param.hpd) {
-        /* HPD disables all the table attributes except NSTable.  */
-        goto skip_attrs;
-    }
-    attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
     /*
-     * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
-     * means "force PL1 access only", which means forcing AP[1] to 0.
+     * Extract attributes from the descriptor, and apply table descriptors.
+     * Stage 2 table descriptors do not include any attribute fields.
+     * HPD disables all the table attributes except NSTable.
      */
-    attrs &= ~(extract64(tableattrs, 2, 1) << 6);   /* !APT[0] => AP[1] */
-    attrs |= extract32(tableattrs, 3, 1) << 7;      /* APT[1] => AP[2] */
- skip_attrs:
+    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
+    if (!regime_is_stage2(mmu_idx)) {
+        attrs |= nstable << 5; /* NS */
+        if (!param.hpd) {
+            attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
+            /*
+             * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
+             * means "force PL1 access only", which means forcing AP[1] to 0.
+             */
+            attrs &= ~(extract64(tableattrs, 2, 1) << 6); /* !APT[0] => AP[1] */
+            attrs |= extract32(tableattrs, 3, 1) << 7;    /* APT[1] => AP[2] */
+        }
+    }
 
     /*
      * Here descaddr is the final physical address, and attributes
-- 
2.25.1



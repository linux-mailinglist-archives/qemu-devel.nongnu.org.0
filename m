Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BECC051BD59
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:38:54 +0200 (CEST)
Received: from localhost ([::1]:49014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYsn-0001pj-Qc
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWp-0005Di-3N
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:07 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWn-0003Hd-4F
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:06 -0400
Received: by mail-wm1-x329.google.com with SMTP id q20so2247239wmq.1
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cBRWuGW1oEM07qzwDlQeqzeKAnOLvL3dCwuFE/tT94s=;
 b=RpQT4ZPj3XLPLQnLT5FHpfIFCL6CGVRBLwta0hR8EptMxLzkw1Wrkr1pLcY4O69KOU
 jpdZhJkLPxQXTiQ6uIHQ0dsZAYdCf96/lsUx5zVQE1pmrrUJYFAn7PJkHloUrg2cCNgn
 wtdS8mpxtdruydjRUoxBwlHOrZaB2dX4G2VAkpWluXFSquvlvJyop4kYzOddSGivXcvZ
 65rb2BQQKh0UjOO7jXdEp+rXiqgiHzLlLDy6yZOg6tdjv83H+BPqLFz56MClDJXyoIVH
 v81VgVH1XW012ARh46qyQHX3grI4ud4eEfkRKu6auiJJ7B8LA6JbWcWMR/i/86hBntmq
 Gxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cBRWuGW1oEM07qzwDlQeqzeKAnOLvL3dCwuFE/tT94s=;
 b=u3CILVkDmD0niJk8pwxwK535gckeJC3AURRBzyHV2FiWFTM5vZGKP6Wqb7OCAQl0li
 IkwZ2joy6yfudNd4H+8oxQUxd6ep61tqPGNF0dlxzhHTc3EuCNxyYlOYmaVL88PdGN/x
 iY/LR1RzmCBLslp+NLz3HtKdoGKYrtODjnNlz37eAjSsSlA9UkLOmbQuYEGyFATcHeEU
 fYQOrhjPsTwgAhoVMMSk9lXY/IHnt4E7emsYmHR25fkGXcE63a8iYDbpM4OCGkB/ZwQM
 u0fbSntz06aqsEwFJQmKmS5smtWf6N12zZpq03CeUhWRvlEEbJERBjszQsUTyeq5MGF+
 4j8g==
X-Gm-Message-State: AOAM533uRFZDAzo1D+GOjshK113efmedP7qUHmsWeLNZUw++u1NDJ/nR
 sbcFNDKSNuqPEDcn88k3LoCSVqXEFE61fg==
X-Google-Smtp-Source: ABdhPJy2GsRp7P+ytDA8et1hr84yKg+sQLX4EmkM1/rQnW27xeACfwUlqL+Grma+H+S2bSHHPLoiBQ==
X-Received: by 2002:a05:600c:4e06:b0:394:56be:19c with SMTP id
 b6-20020a05600c4e0600b0039456be019cmr3532434wmq.168.1651741923791; 
 Thu, 05 May 2022 02:12:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.12.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:12:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/23] target/arm: Consolidate cpreg updates in
 add_cpreg_to_hashtable
Date: Thu,  5 May 2022 10:11:39 +0100
Message-Id: <20220505091147.2657652-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Put most of the value writeback to the same place,
and improve the comment that goes with them.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220501055028.646596-15-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cbc873e3e60..8ee96d5c042 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8543,10 +8543,19 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     *r2 = *r;
     r2->name = memcpy(r2 + 1, name, name_len);
 
-    /* Reset the secure state to the specific incoming state.  This is
-     * necessary as the register may have been defined with both states.
+    /*
+     * Update fields to match the instantiation, overwiting wildcards
+     * such as CP_ANY, ARM_CP_STATE_BOTH, or ARM_CP_SECSTATE_BOTH.
      */
+    r2->cp = cp;
+    r2->crm = crm;
+    r2->opc1 = opc1;
+    r2->opc2 = opc2;
+    r2->state = state;
     r2->secure = secstate;
+    if (opaque) {
+        r2->opaque = opaque;
+    }
 
     if (r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1]) {
         /* Register is banked (using both entries in array).
@@ -8587,20 +8596,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
 #endif
         }
     }
-    if (opaque) {
-        r2->opaque = opaque;
-    }
-    /* reginfo passed to helpers is correct for the actual access,
-     * and is never ARM_CP_STATE_BOTH:
-     */
-    r2->state = state;
-    /* Make sure reginfo passed to helpers for wildcarded regs
-     * has the correct crm/opc1/opc2 for this reg, not CP_ANY:
-     */
-    r2->cp = cp;
-    r2->crm = crm;
-    r2->opc1 = opc1;
-    r2->opc2 = opc2;
+
     /* By convention, for wildcarded registers only the first
      * entry is used for migration; the others are marked as
      * ALIAS so we don't try to transfer the register
-- 
2.25.1



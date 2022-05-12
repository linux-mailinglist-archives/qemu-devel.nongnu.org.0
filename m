Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FA5525123
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:20:19 +0200 (CEST)
Received: from localhost ([::1]:58018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npAby-00032p-4z
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWx-000340-T5
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:15:07 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWv-0000Aw-EL
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:15:07 -0400
Received: by mail-wr1-x432.google.com with SMTP id q23so7721094wra.1
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 08:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qE4yOzJamRiNUzm9C/hagb28tJI7r6AdPYfxPud1WCI=;
 b=TCJTjJ+HQk5LulQYxQeZWkRKVgjsIpq9ffhAOI0oEhbj78fv5zbCFWe3erljUhl33x
 SJZIhaAl5LfFfi67T4ahUqGvDVUKDNB7MycwrE8eq8tkBNJAet4V0IJzMF4YKnokZHJc
 56ukUQ+wl+jqrqqsOUDmMQwjxnttwcnq4I1hWI4jj/cZwC2UnvaBJ4W+a/1wr6Fcs2wl
 iQ0Vy8YhIYdvA2WwZKG6tkhpB15u2o04JNyXcKwUNcFBTNitGvHqg6Y/4xfeNc//qc3U
 czI6q2pJQzVFjUMcywC8PTHbb8W2Far2gntY9lW5qhiURI2q2M8i4Rj1yR24wOBbBZlc
 A0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qE4yOzJamRiNUzm9C/hagb28tJI7r6AdPYfxPud1WCI=;
 b=bUsb3gLhGn5xcZrc2qvz8mv7tCzPLGWU4j2Mope6EtN+jRjkytRXK7n2ba8qPTzwdY
 CWcP3Ocyp336PuGP0wvPr/bVLexYGklmhR+sGROt9MoNAwl2czf2Ds04J1ESqdn+I7oM
 ZMIZh7Nuu52dtrHNoRZp0JGGjWrOO+Ll40644foErIzwBvKrhSeYdeI7qw+i4nts7aWn
 Br3XOoDbGnTiYQ1uyoj2Mj1EX2pr1YIC0/xvif9ZPkhlU//jqtG1ODbOV6vK9pIhplQ0
 hfumGUMvMALsYyrwYO9aDmOScxqrdarUwdgkhI0VPxqgdnvjcU/R9xqf3by4A/+O8iSS
 xKZg==
X-Gm-Message-State: AOAM533d8IHv9bABB1TUAoix7H+AzDC9AnzYeAu8zliNZwM/SwE2A+Mx
 IhfMP93NdgFnktYJgJsijXP5aA==
X-Google-Smtp-Source: ABdhPJztSse2/+FIpWow6Tte+PIukrmhBHDJ4u9Wlsya4UnN2cymcEXThRAr1RQcSDR5Xpm8wTNaGg==
X-Received: by 2002:a5d:58e5:0:b0:20a:e022:3f8c with SMTP id
 f5-20020a5d58e5000000b0020ae0223f8cmr100042wrd.667.1652368504702; 
 Thu, 12 May 2022 08:15:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm3048378wmb.42.2022.05.12.08.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 08:15:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 6/6] hw/intc/arm_gicv3: Provide ich_num_aprs()
Date: Thu, 12 May 2022 16:14:57 +0100
Message-Id: <20220512151457.3899052-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512151457.3899052-1-peter.maydell@linaro.org>
References: <20220512151457.3899052-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

We previously open-coded the expression for the number of virtual APR
registers and the assertion that it was not going to cause us to
overflow the cs->ich_apr[] array.  Factor this out into a new
ich_num_aprs() function, for consistency with the icc_num_aprs()
function we just added for the physical APR handling.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506162129.2896966-6-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_cpuif.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 66e06b787c7..8867e2e496f 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -49,6 +49,14 @@ static inline int icv_min_vbpr(GICv3CPUState *cs)
     return 7 - cs->vprebits;
 }
 
+static inline int ich_num_aprs(GICv3CPUState *cs)
+{
+    /* Return the number of virtual APR registers (1, 2, or 4) */
+    int aprmax = 1 << (cs->vprebits - 5);
+    assert(aprmax <= ARRAY_SIZE(cs->ich_apr[0]));
+    return aprmax;
+}
+
 /* Simple accessor functions for LR fields */
 static uint32_t ich_lr_vintid(uint64_t lr)
 {
@@ -145,9 +153,7 @@ static int ich_highest_active_virt_prio(GICv3CPUState *cs)
      * in the ICH Active Priority Registers.
      */
     int i;
-    int aprmax = 1 << (cs->vprebits - 5);
-
-    assert(aprmax <= ARRAY_SIZE(cs->ich_apr[0]));
+    int aprmax = ich_num_aprs(cs);
 
     for (i = 0; i < aprmax; i++) {
         uint32_t apr = cs->ich_apr[GICV3_G0][i] |
@@ -1333,9 +1339,7 @@ static int icv_drop_prio(GICv3CPUState *cs)
      * 32 bits are actually relevant.
      */
     int i;
-    int aprmax = 1 << (cs->vprebits - 5);
-
-    assert(aprmax <= ARRAY_SIZE(cs->ich_apr[0]));
+    int aprmax = ich_num_aprs(cs);
 
     for (i = 0; i < aprmax; i++) {
         uint64_t *papr0 = &cs->ich_apr[GICV3_G0][i];
-- 
2.25.1



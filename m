Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0296D4F989B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:50:51 +0200 (CEST)
Received: from localhost ([::1]:55286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpwn-0001DL-Rr
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPa-0007Je-Ag
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:30 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPX-0002SG-3f
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:29 -0400
Received: by mail-wm1-x330.google.com with SMTP id r7so5581730wmq.2
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mApTko4JykaeGu3JC9+7iWWX8yyHP0SNoqvMYS15NqA=;
 b=cC4yf2QDCw83BaUa+ixNVYmnc161X1S8M54BY70O/CIqTvUwQpNWgqMuw+OpQO3cQY
 /MHmWwgEF29OPEhW7fMQi0vzQA8v3FMvfM+9m1iqbnrSTrhLb9xHY08Dlc+t4KkdadTb
 eE+1eMknjwoFMwnKTdqj2BngQ771FrV6iydo6A6IIncyjHWwh5vTYx6rvttEy/xsOndA
 +R6TLMCJtOnmUaaNHVIosEkRcU7cVQx1P5/rl9si0V7hgdX4d+fVwaeNEwA8h93tYG8E
 DFUHqcXWzsN0FZiFHdv9GZ/h8h0fS9UFVpErcBgqE9iZK5BFzTPPKQDvXx7fiKG7CX0m
 bliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mApTko4JykaeGu3JC9+7iWWX8yyHP0SNoqvMYS15NqA=;
 b=IbkRH1+vPONVkdKtmde5kdma1nNawWCTesvfGRg+u8kGUeBiM3DKBI2ue+kmY9Qb8P
 hMSMQLPeIxJHqiVP05QzZsK4qiOkr+TNNfteySJbxhe4V4IDewkpHghLM2KSJa38CAc2
 lX5yqbLRKKGrXTpKSbV3TEXHj8aamSwOu5GEjfu6G+LHwyKLVjEx4m0Z5HN5aHwXNS+f
 qEK/5flb+4xbK9M9s2E5p+3nLsZWgV/pnAP/143fcgUljAFfQCOU01I/DjZN5afGYLbC
 b5OyM/SYobzpnAUtcsQFrq7HwTmd0YO8i+AlAyfhvTPZXx9bA7RAXapcR5IXq+4GeW8m
 oVGA==
X-Gm-Message-State: AOAM530L5+bcvIlCNcwsu5pGpZ3r4YFxElw5xPR0syqpJfYYXBf0hWXL
 fVT4EbOt5lm8kGZSw0VgneEsEUCsNPjXEQ==
X-Google-Smtp-Source: ABdhPJx/roWEwr48+JqthWL25fUx8+BjYb2n1oW8GzQnEsQBiY/N//6BwQLY4R+mPu1PdLu45zpNwA==
X-Received: by 2002:a05:600c:1548:b0:38e:a8df:eced with SMTP id
 f8-20020a05600c154800b0038ea8dfecedmr2427279wmg.9.1649427385540; 
 Fri, 08 Apr 2022 07:16:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 35/41] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_vinvall()
Date: Fri,  8 Apr 2022 15:15:44 +0100
Message-Id: <20220408141550.1271295-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the gicv3_redist_vinvall() function (previously left as a
stub).  This function handles the work of a VINVALL command: it must
invalidate any cached information associated with a specific vCPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_redist.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 9866dd94c60..a586c9ef498 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -1090,7 +1090,13 @@ void gicv3_redist_mov_vlpi(GICv3CPUState *src, uint64_t src_vptaddr,
 
 void gicv3_redist_vinvall(GICv3CPUState *cs, uint64_t vptaddr)
 {
-    /* The redistributor handling will be added in a subsequent commit */
+    if (!vcpu_resident(cs, vptaddr)) {
+        /* We don't have anything cached if the vCPU isn't resident */
+        return;
+    }
+
+    /* Otherwise, our only cached information is the HPPVLPI info */
+    gicv3_redist_update_vlpi(cs);
 }
 
 void gicv3_redist_inv_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr)
-- 
2.25.1



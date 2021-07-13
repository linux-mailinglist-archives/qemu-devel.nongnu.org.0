Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087FF3C7156
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:40:35 +0200 (CEST)
Received: from localhost ([::1]:56604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3IeI-0003A7-2w
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbR-0008Jj-Uq
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:37 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbN-0003bi-U7
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:37 -0400
Received: by mail-wr1-x42b.google.com with SMTP id f17so30522349wrt.6
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gTQCjbESgq6v50RkvtDQjOcLLtpOe7evSTv/m/L93cE=;
 b=wJakB/KA4AAMG2JcYfFKddaQdZRO/bjaomKY49sXHkpRlm4aN/mqldbPE4SPgP91A2
 TZypm0cBXzeM4q21JGUNyYRWWIANt60LoSnsJvmxSePVPwmVAg518XCP+6eaa0QngKap
 wDhJ3VkP/SwoPyFYXYLTe2Wlg8/EFlBAFEm4Fhpq9XMGFiFo7gNfKZpmMLqtcqjn6yKi
 VQj90AKaycFtnze3rDVXPDUk6e5n5Zwl3+zy3RhyyaoGs2sRT2UUeoa3TgzrdIUHTtZO
 35yV490h80Eh+bSbTwSQraLZLB630zU1FlPVrY8p6MOwJ1Frw6fbWJGMg5TdaMb2AJHx
 qaeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gTQCjbESgq6v50RkvtDQjOcLLtpOe7evSTv/m/L93cE=;
 b=g7NEE73gCfT+WB3mt+DHbQhUxtlX1c+zHn1gMC8ah9tCpT91yC57UONXdrqaoFTXkn
 M1gCTf/inIQpkyF/TxeA6s8s6rGNYcBHLjiBwHfuB3huQZycKPIw1Fabosik77OklTA5
 Res+W78cZiLy6LNzy+ksJQyWHZJsa8sRcAe7xPZbjCvkO2EsWYbDaD1S9rUI9NL8b+jJ
 0jVfOpoSwiYWh3kwsoRCL8nxIMDq9XO5JtdHTPmd4A0RuVQXbTJ2PWM3hT68IR+e3vW3
 glZ8Yt5wQ3GiLPb/v65oaOnmNDuxJgleq6/tszzL21RSVc0nuPMdwkoIbXEley1gSqR/
 7Whw==
X-Gm-Message-State: AOAM532JbsmZ8R+0jgL4TSqwrS4Tf0OhDCtYdM3zP8PfbPjYg21nRXBk
 ZE5/4pgqupyoApJnlE1WhzNM6A==
X-Google-Smtp-Source: ABdhPJwKJk1l8NvIW/ZWNanq7ivJXlU09bIdfhRyevouo6E5awtH3+j8d6ppXkHceUIFeEQ5adG7mg==
X-Received: by 2002:a5d:420b:: with SMTP id n11mr5814193wrq.395.1626183452586; 
 Tue, 13 Jul 2021 06:37:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 04/34] target/arm: Fix signed VADDV
Date: Tue, 13 Jul 2021 14:36:56 +0100
Message-Id: <20210713133726.26842-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

A cut-and-paste error meant we handled signed VADDV like
unsigned VADDV; fix the type used.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mve_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 16a701933b8..99b4801088f 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1182,9 +1182,9 @@ DO_LDAVH(vrmlsldavhxsw, int32_t, int64_t, true, true)
         return ra;                                              \
     }                                                           \
 
-DO_VADDV(vaddvsb, 1, uint8_t)
-DO_VADDV(vaddvsh, 2, uint16_t)
-DO_VADDV(vaddvsw, 4, uint32_t)
+DO_VADDV(vaddvsb, 1, int8_t)
+DO_VADDV(vaddvsh, 2, int16_t)
+DO_VADDV(vaddvsw, 4, int32_t)
 DO_VADDV(vaddvub, 1, uint8_t)
 DO_VADDV(vaddvuh, 2, uint16_t)
 DO_VADDV(vaddvuw, 4, uint32_t)
-- 
2.20.1



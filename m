Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8129560D1E9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:49:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMyG-0005FU-GJ; Tue, 25 Oct 2022 12:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyD-00056N-CJ
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:05 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyA-0001Oi-PK
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:05 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so8672694wmb.3
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HQ5kM2p1/qrerMOx1us9zdpzRSiqNswYiSblD+T/iHk=;
 b=jd+1dMV2tjayVINIiiDqwAO0PuE23M56qrLO5VuEAW/oH41WTb4DpA+zcT2G73aaqw
 AMZQCtRhjB317b1QoWmMWvjCSienAW1sZ3yiuis7xq3Ot1xI8ncvATXDdZmJJbQ6lSId
 n5qsslOITNVpqpchSh91f+1Q7E1LVTms7Vh3CAOQ2XhZWg4YpgIKfm3At8fC4A9BSD1N
 iFwdnImJ5oR1iLbuJv5F8vgw+GVQCZD15q1MVrUNZRxRO+TQk448d01XIyo/RImhTOFf
 9+ZI8a4rVbRWPeNKrmCDDZVwDKZreEL1gZf3RZeIfRIF/MXrLreE2Vqi0uDVK6aAyys/
 5E7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HQ5kM2p1/qrerMOx1us9zdpzRSiqNswYiSblD+T/iHk=;
 b=NNEL2O+dxQxwYf0zWF5nGtBZDzWiQGQmkSmZIwiopSBD0EIY3sYUgyh/JEMxKY+Goc
 mFwlPCPh8z1D8tyIlF42P3iNKBi4CogGAOYe9LqLhDj3z0VMJ19ZibBzQwTERhj6JMYD
 H0LgUj1tOTl9ikOeUkOf1BHxzB3x1agZ6J4g/nqvwgdd2tuldJdi96ZUoIoGDkxDM/il
 3C71zSDRCYHj3KLktV8R9c5eZ97KqcMqYvnkfj+gwh55yrOtrZxmU/LOzOAECnjYhdbG
 yBN3fGkX1hUm8ZhLAvvHdkycZoBOX29ZRToJcj1QkozPzbIEaSTiCdl7UBKe43hDsxG4
 abRA==
X-Gm-Message-State: ACrzQf1S5GUgCQCj5cQ0BxGzqm2oYzgusRt3DSmAM2FjiFGfNC6tD28/
 YRE/8CIw98JefkSWm/71Ci8YslCJdx6XfQ==
X-Google-Smtp-Source: AMsMyM5TEZZYYv6jg1oQRDi/w890l4E6bxk0SZpIRSA/kFIWee6GVMGX9hG9i8I517UpThOqvh/dZg==
X-Received: by 2002:a05:600c:4f04:b0:3c6:fae5:b4d4 with SMTP id
 l4-20020a05600c4f0400b003c6fae5b4d4mr27082575wmq.103.1666716000431; 
 Tue, 25 Oct 2022 09:40:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.39.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:39:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/30] hw/hyperv/hyperv.c: Use device_cold_reset() instead of
 device_legacy_reset()
Date: Tue, 25 Oct 2022 17:39:27 +0100
Message-Id: <20221025163952.4131046-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

The semantic difference between the deprecated device_legacy_reset()
function and the newer device_cold_reset() function is that the new
function resets both the device itself and any qbuses it owns,
whereas the legacy function resets just the device itself and nothing
else.  In hyperv_synic_reset() we reset a SynICState, which has no
qbuses, so for this purpose the two functions behave identically and
we can stop using the deprecated one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Message-id: 20221013171817.1447562-1-peter.maydell@linaro.org
---
 hw/hyperv/hyperv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
index 4a1b59cb9db..57b402b9561 100644
--- a/hw/hyperv/hyperv.c
+++ b/hw/hyperv/hyperv.c
@@ -157,7 +157,7 @@ void hyperv_synic_reset(CPUState *cs)
     SynICState *synic = get_synic(cs);
 
     if (synic) {
-        device_legacy_reset(DEVICE(synic));
+        device_cold_reset(DEVICE(synic));
     }
 }
 
-- 
2.25.1



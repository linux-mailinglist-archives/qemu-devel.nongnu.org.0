Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04CE31FBD6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:18:46 +0100 (CET)
Received: from localhost ([::1]:39998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7YL-0002C8-SS
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73o-0002d6-O4
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:12 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73N-0003c6-2v
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:12 -0500
Received: by mail-wr1-x433.google.com with SMTP id v14so8881656wro.7
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JMvousW6dbRJz+5fKLTeFi4X/6d1tXrTIZkdqfZYup8=;
 b=d5RoKX1duLD8Ut+LGi2k9f1iKuckZckCEppMpZNtf3nSsURo9y6kJEubimv7yL0W8g
 j+PyPZjJyfa4HrRbsa8EulEMadSrFIsCkI0xaYUwhnclgNW/ULQ3I9AvlXrIT8nr21Li
 Xilp9ezX6dCeBi3rbG7lSJrvAslah7l958GF3jkTIkHKsSFXaZNMo9gJO2B3+LuRIfuW
 zCK0IkV0fbhC0p7uu68Kpi3WWq4oDw7uLp9PsjJg2yM5xPxsQSH/Qdr+29i+M9hxsuC4
 l2cNuT8qlRlfLJ/M4SUFWf42geAqMV9zwq+t/fH5IgBX6aQzlF48Fe4wtTea3Bs7TKkM
 l3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JMvousW6dbRJz+5fKLTeFi4X/6d1tXrTIZkdqfZYup8=;
 b=VSOpyBcP8kVVu3g3TN9aAf4YEOCP0bgY6NUg00gVOoh+mMSyGQI+2lrBk34RFmAnZf
 9ygpwTIDMRoJUk29eER+Aw2UsRo3wGbEKLmbWmaeqqZYP/KAWyFAQQ/LZDVU+avvElt0
 E8dR9iizqanDb7RG/qX5LZ9s7yR86vkyy1wKXZoUTaESeKhVz3BotfPf2hXzImhBa+v4
 +9DTvid/woY3vDpbs9xO+T0Rq2TInkuqS9bVKyrPc6RpC87a7pWoAX1E/iCGt0W8dA1A
 uJ5pt38wAKCMTlOGghj6RR0sRXF1C890oaDIj4EEExn3OI5Ax8geNq7LruS+daxC33+l
 fgRQ==
X-Gm-Message-State: AOAM533qGuFhcP82jTIw4V82K1GdSi0DNCzXZShBnpbnSLdv2rQ+3NfU
 GiSt+fbDQdpVGJk64bzmzyFvFDOFiQAWOw==
X-Google-Smtp-Source: ABdhPJzuO4J58hqq/t2b9Uqhn0kSVGjYhuNlmCCB6yPNWxVE2+LmDkYqhS7eWh8W2arUW64sCRjsAg==
X-Received: by 2002:adf:dfd1:: with SMTP id q17mr7519859wrn.273.1613746002694; 
 Fri, 19 Feb 2021 06:46:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 30/44] hw/arm/armsse: Add missing SSE-200 SYS_PPU
Date: Fri, 19 Feb 2021 14:46:03 +0000
Message-Id: <20210219144617.4782-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We forgot to implement a TYPE_UNIMPLEMENTED_DEVICE stub
for the SYS_PPU in the SSE-200, which is at 0x50022000.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h | 2 +-
 hw/arm/armsse.c         | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index eb4e937173f..104ba8d26ec 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -135,7 +135,7 @@ OBJECT_DECLARE_TYPE(ARMSSE, ARMSSEClass,
 
 #define SSE_MAX_CPUS 2
 
-#define NUM_PPUS 7
+#define NUM_PPUS 8
 
 /* Number of CPU IRQs used by the SSE itself */
 #define NUM_SSE_IRQS 32
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index f72d1adafea..f43f0524e28 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -320,6 +320,15 @@ static const ARMSSEDeviceInfo sse200_devices[] = {
         .ppc = NO_PPC,
         .irq = NO_IRQ,
     },
+    {
+        .name = "SYS_PPU",
+        .type = TYPE_UNIMPLEMENTED_DEVICE,
+        .index = 7,
+        .addr = 0x50022000,
+        .size = 0x1000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
     {
         .name = NULL,
     }
-- 
2.20.1



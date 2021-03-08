Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A316833158F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:12:31 +0100 (CET)
Received: from localhost ([::1]:57486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKMo-0007B7-M5
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:12:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJl0-000717-7Y
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:26 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:41893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkk-00076N-Vd
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:25 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso4311912wmi.0
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+fhV/Z5ptsApKdolScZcs3ORCXbuV+IxjGvFxnOW3Zk=;
 b=HUopi/tZBv6DE9rgXkZV9RqyZD5x1Y2qE6WRbdimocukRppSz4LPElZCkE+n64TYlL
 a7qu3IfozBvAc31laA9ZUa1pUek8EdENz8ysAbnNtc8gRk2Km6lib1jjizBgq/iUEyXO
 CCOjIXAU6ezIDMwvyU3MzC/p9SIVwfduPPJ6+N1mMPmNGV2CacPJLiR43QES73RRDgGG
 fOaxv1/B+pGekqMxfx1Tu/gxGciWbAzkzjOex0wTj1e1cf9v58MOeN3dY5mUYYEuhkjz
 1H03arFKbZ+KOS0cjtPEdZFykO2hAfvoKLbiLw3vQZCCD/APwezhd35UH6Srd7sdGHow
 R83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+fhV/Z5ptsApKdolScZcs3ORCXbuV+IxjGvFxnOW3Zk=;
 b=lLRFUCe/idTF8e36jv0/XtMzFhS/6daCwgAAlERpOlCTYYlimRWyVpxM4aU/kCMVsP
 HcW69cI65R9YuTTogjGNE7QB/R3K+iRdEz+vCsnFeFx/Nh/bxBKrkArn/nAdyr7y3RBx
 GR6y5hVDjVb1U4J9AhFDCkcBEIZVbJr6ZBQz1vXq3dxY0YLXKadLaE/D/7ELxh2+tt9S
 yx6FcnLqpLRlhxt6AZ4H836Rmn7pNWwQXxSg448n4BcsRxYiLdgcRl9SHR7ttpYpAIVi
 vljgVCARrAw1jLPyrxW1Y/u3LrzjmwgAdKGyW4zhorHAgaw6p92cd93GEX/aXuRmd9FR
 h/rg==
X-Gm-Message-State: AOAM531nEtQfIU8xV1zBfsRCen+2xOV1j0aW21aeSkndxDfvYA/YgQtA
 fyFXvS2q56pAOkGrAVXd3EW0L2ut1se6JA==
X-Google-Smtp-Source: ABdhPJyHIBpCYCDSZpb3wWGp8qINha7eb089qJcjrxEbz2JQgp8RDWibrsbyXBWvEfRKnurRQHMTfw==
X-Received: by 2002:a1c:7ec4:: with SMTP id z187mr11771200wmc.3.1615224789043; 
 Mon, 08 Mar 2021 09:33:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/54] hw/arm/armsse: Add missing SSE-200 SYS_PPU
Date: Mon,  8 Mar 2021 17:32:20 +0000
Message-Id: <20210308173244.20710-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

We forgot to implement a TYPE_UNIMPLEMENTED_DEVICE stub
for the SYS_PPU in the SSE-200, which is at 0x50022000.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-31-peter.maydell@linaro.org
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



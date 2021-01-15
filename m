Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E243B2F8666
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 21:14:39 +0100 (CET)
Received: from localhost ([::1]:52438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0VUS-0007L3-Bq
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 15:14:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VSA-0005lE-3K
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:14 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VS7-0008Ew-Nh
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:13 -0500
Received: by mail-wm1-x333.google.com with SMTP id o10so2524421wmc.1
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 12:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xwzt0q6nnq+N4lhh6i4hCtl/N6d0A+34im5bSdbG69I=;
 b=Qez+C0zHEeGOBi8vwZ/oz53i/I5vQx7mpGFVS0xsetFfONwny9wdDmFgCvK61ceNeI
 3/Zlhl2xOHpktzSr0pjuYM0a18TSfLzGeynEPKWdVkaPinmMAF7O75qXbe+QzBj2SdrB
 GvOSorWkbpKrxB98Nz/YZDhJKbuaxBc7D3+wQ+rVuSnHRrCrgBhtqJFkXRcc8v1FzoNo
 O2SBkQ1zH6gFzO4C1ZiYrX/hgohx4IeMrPoG6EhGF+uVnvDtJRsoDto1XjYzaONGGtHT
 o/EsJFkPargPwiBs5qmEpGmDjLrGPj54dHZeMaFZ3TVjcICeFUxY9raTu9BzatxqdiU3
 WuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xwzt0q6nnq+N4lhh6i4hCtl/N6d0A+34im5bSdbG69I=;
 b=bOVtclQzwcyKbaLynlWEBiBeIwA1Bt7tnGJFe+ytoyC9m7dKWvWBS0pFbEzGX3XptO
 WsVnQSmgo5W37Kr5zgXuvZdqivfEZYOlGIG0ByeqhdkXQQyUDDKNBShfXQs0xGcr9qfw
 Cf+H8wipPy+0q+K9kqzqOPLOTh1lqfpvfk/E9wwt4UkwtvxH2mJh7vR3Rc+irVlOuxQk
 FDcT3ZHDOyWtOB1AxzWz3SCQMd4e1GJq7hCB0bqDjBH8qtnH3nd5uVgeudaAQNtaJ/uu
 zEnDVFGdcXxj1qQDf6j5YEFxEb5w4XuUkqSDKa1DxViU/ITdoxC/MUIv7nGJ/HhqtF3t
 l1/Q==
X-Gm-Message-State: AOAM532EKV/kGQGE7sedTphxjOknVevX5BSUaXvWSthn/0l/QMLtKqnH
 VJfyKoHJQ9azk6oRQzAOaOXgBczMIIjw5g==
X-Google-Smtp-Source: ABdhPJyweR3NgTDjs4Dyk0jUqjLo/Bx1QQRFzM/NJYrMIlLR2DjMaaAr4sT6VKhZsc4WtEuMgCCGPQ==
X-Received: by 2002:a1c:3c04:: with SMTP id j4mr10370886wma.147.1610741530164; 
 Fri, 15 Jan 2021 12:12:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b3sm10353807wrn.70.2021.01.15.12.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 12:12:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/11] hw/m68k/next-cube: Make next_irq() function static
Date: Fri, 15 Jan 2021 20:11:56 +0000
Message-Id: <20210115201206.17347-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115201206.17347-1-peter.maydell@linaro.org>
References: <20210115201206.17347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next_irq() function is global, but isn't actually used anywhere
outside next-cube.c. Make it static.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/m68k/next-cube.h | 2 --
 hw/m68k/next-cube.c         | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/hw/m68k/next-cube.h b/include/hw/m68k/next-cube.h
index a3be2b32abb..5a56c354b8e 100644
--- a/include/hw/m68k/next-cube.h
+++ b/include/hw/m68k/next-cube.h
@@ -42,6 +42,4 @@ enum next_irqs {
     NEXT_SND_I
 };
 
-void next_irq(void *opaque, int number, int level);
-
 #endif /* NEXT_CUBE_H */
diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index 37bc35dfa43..f622d6589c8 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -724,7 +724,7 @@ static const MemoryRegionOps dma_ops = {
  * TODO: set the shift numbers as values in the enum, so the first switch
  * will not be needed
  */
-void next_irq(void *opaque, int number, int level)
+static void next_irq(void *opaque, int number, int level)
 {
     M68kCPU *cpu = opaque;
     int shift = 0;
-- 
2.20.1



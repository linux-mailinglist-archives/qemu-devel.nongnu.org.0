Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED2465F246
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:09:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTMc-0001Cs-UD; Thu, 05 Jan 2023 11:45:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTMJ-0000ql-Us
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:52 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTMH-0007Tr-O4
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:51 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso1781172wmp.3
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=U/noDqf89C9CE4dX2bLJg9toJeQoQFfDbIKZFjOUmRk=;
 b=cQspyqTg9+5Gy5xoOBRy4F4PPYqREgACYNyCW6DV8vDkYc8y9m6FiAFqaVN4JdMZs4
 TE9SybAWg3T5x/i8/8p78YY1zZoEVeqsmfYLL7WqDhxR+23hUfPQQ4Bc2bFTcITOWpx9
 pBBkELAx2Je9LxAcmuXej86BaTXY/gHY6EA0DjoPDCxLg3hbDmLuLwX4uMsgTNuvN4oO
 ZDYHedyvC4FCSGHKJfEOg759qQ7umAvITCwtyriq5/TqRhGFN5XRlfYJxFpDp/BncLUo
 7hMgDqAB9e91QcKPFgKWRbwgY3gmuvWLg/xrUdQONTP2TmqKY83oJ7qjfx9xu04MHMpG
 ucFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U/noDqf89C9CE4dX2bLJg9toJeQoQFfDbIKZFjOUmRk=;
 b=bWinC4S03egB7dvSL5J65pzDdcRuRdLjvXdFLesTDSeBDrw2DGoAkWnpaQgBd1da09
 5Bbfz3zV5vvE0clhtoem6Dxx3bYA3O7g+nx/id/IK8n4FttFdREWG1t3l/G6JusDiDJB
 gAlXAYpkEUX2XPfrQRkbHrOgKYeLK2OHOIM+woncMiM7OV20VS4Cup35SIBCPGfWHIfU
 HukR4mg+byH1SqZvg6hV6SHZA7c1yWADhL1Qx9Heyc82GTd+C+e2K/Yuj/2uflthPCWe
 4LwRO2wlhdYd9R7pfB5ivenXWtS6J/vJFI2ualt/fGIRXTadEFVbIWg4v2dF/1U6viM2
 wZxA==
X-Gm-Message-State: AFqh2kqKse+XCMvtol0IPsIfmfdD9PhzMOAL6p94mI7nP0g3gSX6lBDL
 xYA1Wi9TwXgGO6TZWi67wWylM8x9p5wG+zLk
X-Google-Smtp-Source: AMrXdXscVtjk4hAw35RjcwhzD08a1osP2J51OqSn88BxzjK3XPi60TfzxRypAeaxjctKrqcICThvjA==
X-Received: by 2002:a05:600c:2247:b0:3d3:4b1a:6ff9 with SMTP id
 a7-20020a05600c224700b003d34b1a6ff9mr37348699wmm.26.1672937086730; 
 Thu, 05 Jan 2023 08:44:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/34] i.MX7D: Connect IRQs to GPIO devices.
Date: Thu,  5 Jan 2023 16:44:16 +0000
Message-Id: <20230105164417.3994639-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jean-Christophe Dubois <jcd@tribudubois.net>

IRQs were not associated to the various GPIO devices inside i.MX7D.
This patch brings the i.MX7D on par with i.MX6.

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
Message-id: 20221226101418.415170-1-jcd@tribudubois.net
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/fsl-imx7.h | 15 +++++++++++++++
 hw/arm/fsl-imx7.c         | 31 ++++++++++++++++++++++++++++++-
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 50f19d8db04..4e5e0718648 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -240,6 +240,21 @@ enum FslIMX7IRQs {
     FSL_IMX7_GPT3_IRQ     = 53,
     FSL_IMX7_GPT4_IRQ     = 52,
 
+    FSL_IMX7_GPIO1_LOW_IRQ  = 64,
+    FSL_IMX7_GPIO1_HIGH_IRQ = 65,
+    FSL_IMX7_GPIO2_LOW_IRQ  = 66,
+    FSL_IMX7_GPIO2_HIGH_IRQ = 67,
+    FSL_IMX7_GPIO3_LOW_IRQ  = 68,
+    FSL_IMX7_GPIO3_HIGH_IRQ = 69,
+    FSL_IMX7_GPIO4_LOW_IRQ  = 70,
+    FSL_IMX7_GPIO4_HIGH_IRQ = 71,
+    FSL_IMX7_GPIO5_LOW_IRQ  = 72,
+    FSL_IMX7_GPIO5_HIGH_IRQ = 73,
+    FSL_IMX7_GPIO6_LOW_IRQ  = 74,
+    FSL_IMX7_GPIO6_HIGH_IRQ = 75,
+    FSL_IMX7_GPIO7_LOW_IRQ  = 76,
+    FSL_IMX7_GPIO7_HIGH_IRQ = 77,
+
     FSL_IMX7_WDOG1_IRQ    = 78,
     FSL_IMX7_WDOG2_IRQ    = 79,
     FSL_IMX7_WDOG3_IRQ    = 10,
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 146bb559bbc..afc74807990 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -245,8 +245,37 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
             FSL_IMX7_GPIO7_ADDR,
         };
 
+        static const int FSL_IMX7_GPIOn_LOW_IRQ[FSL_IMX7_NUM_GPIOS] = {
+            FSL_IMX7_GPIO1_LOW_IRQ,
+            FSL_IMX7_GPIO2_LOW_IRQ,
+            FSL_IMX7_GPIO3_LOW_IRQ,
+            FSL_IMX7_GPIO4_LOW_IRQ,
+            FSL_IMX7_GPIO5_LOW_IRQ,
+            FSL_IMX7_GPIO6_LOW_IRQ,
+            FSL_IMX7_GPIO7_LOW_IRQ,
+        };
+
+        static const int FSL_IMX7_GPIOn_HIGH_IRQ[FSL_IMX7_NUM_GPIOS] = {
+            FSL_IMX7_GPIO1_HIGH_IRQ,
+            FSL_IMX7_GPIO2_HIGH_IRQ,
+            FSL_IMX7_GPIO3_HIGH_IRQ,
+            FSL_IMX7_GPIO4_HIGH_IRQ,
+            FSL_IMX7_GPIO5_HIGH_IRQ,
+            FSL_IMX7_GPIO6_HIGH_IRQ,
+            FSL_IMX7_GPIO7_HIGH_IRQ,
+        };
+
         sysbus_realize(SYS_BUS_DEVICE(&s->gpio[i]), &error_abort);
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio[i]), 0, FSL_IMX7_GPIOn_ADDR[i]);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio[i]), 0,
+                        FSL_IMX7_GPIOn_ADDR[i]);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio[i]), 0,
+                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                            FSL_IMX7_GPIOn_LOW_IRQ[i]));
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio[i]), 1,
+                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                            FSL_IMX7_GPIOn_HIGH_IRQ[i]));
     }
 
     /*
-- 
2.25.1



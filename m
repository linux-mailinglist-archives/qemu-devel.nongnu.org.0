Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC51C65F2B6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:31:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTNl-0001wf-Kg; Thu, 05 Jan 2023 11:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTMI-0000m9-0B
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:50 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTMD-0007T2-Tq
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:49 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso1787162wmq.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WdsQkzgPH1wTahyKLQ7ZmQKEPjf3NSnJoH3HoNNy3yI=;
 b=X6wgz+5PwOZZOdDqD0dokqIsnOAe+JlN75+szGkbO2yzXSBlMujbXS/reBh6/Kt3Hb
 DyeclxgD3oxKcPcU71NtsBiQQPBdjYLUvyaY9gsZm97OAj1vNVIeUEjV/lXTA5ngxvQ1
 umtwlrGDvOo9QxbCJqujTOIEvhBydGooiu6tGFop9qeP5dcDVRdbEVaRBY2mzFkF688P
 osFjG+SXUqLFd6nX7eKdI+j7+/7FEXnWrTXVLArVXhO9+3nwZ+L+PruAf+ubLdlgXXsq
 hmssuBDrhYqEAB+US33/FwC3sP0x5T0dBzBKMFFiIGqnz9/7MI17CCE0T8pZjKREpiiN
 TcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WdsQkzgPH1wTahyKLQ7ZmQKEPjf3NSnJoH3HoNNy3yI=;
 b=vjn+INA6TLNc1hYZstwhCCbvwc9dzBl19sG8BwQXRBGm4pHEPCmrmcgKdIrNPyEQT3
 yydWP6glLqM3c3NFI1ALPHskxDTO9C5SHBcVhQV0ftm8ZhjwbYafQ5o3roLfUAS5kt4e
 UOE+BUepF8sKe68ejzeWOMk2ZxiTSQRTUuZojtiaH/geyVgE8cqSm/VT5jhJ7DX5kkOM
 qCDBkavi+ceqPjcqWvG2oORvwk/ygWXxcDlZyiFffJ/TC05JkqP4RCV9OmVWEM8iNKfF
 VR06RWbM8QAKA3+RajBou+v+GC4E5OHWyhE9VTrbpBtaQN7M1cGTVLuNEPJpDIiycxzJ
 Fa8Q==
X-Gm-Message-State: AFqh2kotW0gqm3q7aCKzoiHCnJ6iFu75mXbkZt/EUhrNEgnZguRb4EzM
 45q3l7BHjI3thFQ4kz4P5BF+0TYHR6XfsuKN
X-Google-Smtp-Source: AMrXdXtw8k6gZ7VUmVZhTVbj6zIPdax9X74G4hI67xuETI+uYmHc097rFtb0jlaIeJrwgV6On0r8OQ==
X-Received: by 2002:a7b:cd0d:0:b0:3d3:5c7d:a5f5 with SMTP id
 f13-20020a7bcd0d000000b003d35c7da5f5mr36658213wmj.16.1672937084211; 
 Thu, 05 Jan 2023 08:44:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/34] i.MX7D: Connect GPT timers to IRQ
Date: Thu,  5 Jan 2023 16:44:13 +0000
Message-Id: <20230105164417.3994639-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

So far the GPT timers were unable to raise IRQs to the processor.

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/fsl-imx7.h |  5 +++++
 hw/arm/fsl-imx7.c         | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 1c5fa6fd676..50f19d8db04 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -235,6 +235,11 @@ enum FslIMX7IRQs {
     FSL_IMX7_USB2_IRQ     = 42,
     FSL_IMX7_USB3_IRQ     = 40,
 
+    FSL_IMX7_GPT1_IRQ     = 55,
+    FSL_IMX7_GPT2_IRQ     = 54,
+    FSL_IMX7_GPT3_IRQ     = 53,
+    FSL_IMX7_GPT4_IRQ     = 52,
+
     FSL_IMX7_WDOG1_IRQ    = 78,
     FSL_IMX7_WDOG2_IRQ    = 79,
     FSL_IMX7_WDOG3_IRQ    = 10,
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index cc6fdb9373f..146bb559bbc 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -219,9 +219,19 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
             FSL_IMX7_GPT4_ADDR,
         };
 
+        static const int FSL_IMX7_GPTn_IRQ[FSL_IMX7_NUM_GPTS] = {
+            FSL_IMX7_GPT1_IRQ,
+            FSL_IMX7_GPT2_IRQ,
+            FSL_IMX7_GPT3_IRQ,
+            FSL_IMX7_GPT4_IRQ,
+        };
+
         s->gpt[i].ccm = IMX_CCM(&s->ccm);
         sysbus_realize(SYS_BUS_DEVICE(&s->gpt[i]), &error_abort);
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpt[i]), 0, FSL_IMX7_GPTn_ADDR[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpt[i]), 0,
+                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                            FSL_IMX7_GPTn_IRQ[i]));
     }
 
     for (i = 0; i < FSL_IMX7_NUM_GPIOS; i++) {
-- 
2.25.1



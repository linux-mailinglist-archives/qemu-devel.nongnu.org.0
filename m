Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8883466289B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:32:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEskC-0001Ti-Ll; Mon, 09 Jan 2023 09:03:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEsk9-0001Sd-DW
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:03:17 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEsk7-0006Mw-OM
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:03:17 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso6840797wms.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 06:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vc7oXCtsr3pijTnNXlGB2vSCQsuIsAnHG1xgG7SBnTk=;
 b=t9NaCskv6wFywzyEZtQ0FyfV6dwqBWDdvmC3/s21Lsm7zi5mx4X8VbnQthKeH+dROk
 AHsw941MU+9huLHVHbyiw7O56BzTwRXWZnjcnF1eFsqfyUzk0Tzcc2JxrSs5MTjveuxm
 2asE4dLF+d5Q3+4l2C98GiIYZ+wD5pYH+jn9QPp/Oykubp6KIDAJpm051nJuaCg7CKys
 dEFhMPsvxK1o7JpOgqRI+RwCAggrtTHpKq1a48aWpxAs3nPxeofWDU2N+2XQmKa8pVYc
 Giv2bIegAOzz1qcMogKES42+7ZQREmAv1mbrO9MyOcd/IWjBgLnvUYsImCFnsV3vbTEh
 hIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vc7oXCtsr3pijTnNXlGB2vSCQsuIsAnHG1xgG7SBnTk=;
 b=qHDgNkj18MQ0S1QX3Zu8exxnwUrtKs/KYMB6Zicognw4R+QY09IXiPpIIJgL71wEAB
 5qOTKWJUbPQLYG8ZFfwitfKskkKynPUCy0+E9QF4GbEAeSjwENaOcVjWpJgISjfIWjfl
 EE3uGDzDsVA88DLnXAvIuaE6/kG/78b4jovCttSjuGiss+pRs5ppqLxHLGJ5AIhJl3zu
 msjFU/ODMaWpYzqAFw5Ll/utVXteCNb08oGfM4eoZnxT6Aum5b4aSCZGm4oQJ1z22kY5
 wnYjB0pJh5aBb4SoO/T7q3MUpCm1lLYTOTowh1ift3YKwz4K3Kmnx8YNogm3nybraJQU
 aibA==
X-Gm-Message-State: AFqh2kpq2ySJ6i48okdfp4jJ0ZjQ4UJAyABmBkbrHKcmh3X5Gbkw9gFW
 msIlsivDcwOMgM4BAyxxpqj/BieXdCJRWe+j
X-Google-Smtp-Source: AMrXdXuaN6t6xmcUSLjWcFeCFEEzFbTqLJa1iy4sFKQkaH7DA8caFRRdqqn6+LL4LmSb6Ym98DFZng==
X-Received: by 2002:a05:600c:15c3:b0:3d1:c8e4:48d7 with SMTP id
 v3-20020a05600c15c300b003d1c8e448d7mr56219326wmf.40.1673272993818; 
 Mon, 09 Jan 2023 06:03:13 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y15-20020adffa4f000000b002bbec19c8acsm3360723wrr.64.2023.01.09.06.03.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:03:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 01/14] hw/arm/pxa: Avoid forward-declaring PXA2xxI2CState
Date: Mon,  9 Jan 2023 15:02:53 +0100
Message-Id: <20230109140306.23161-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
References: <20230109140306.23161-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

To avoid forward-declaring PXA2xxI2CState, declare
PXA2XX_I2C before its use in pxa2xx_i2c_init() prototype.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/pxa.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index 1095504b86..cdbff85afe 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -119,14 +119,14 @@ void pxa27x_register_keypad(PXA2xxKeyPadState *kp,
                             const struct keymap *map, int size);
 
 /* pxa2xx.c */
-typedef struct PXA2xxI2CState PXA2xxI2CState;
+#define TYPE_PXA2XX_I2C "pxa2xx_i2c"
+OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxI2CState, PXA2XX_I2C)
+
 PXA2xxI2CState *pxa2xx_i2c_init(hwaddr base,
                 qemu_irq irq, uint32_t page_size);
 I2CBus *pxa2xx_i2c_bus(PXA2xxI2CState *s);
 
-#define TYPE_PXA2XX_I2C "pxa2xx_i2c"
 typedef struct PXA2xxI2SState PXA2xxI2SState;
-OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxI2CState, PXA2XX_I2C)
 
 #define TYPE_PXA2XX_FIR "pxa2xx-fir"
 OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxFIrState, PXA2XX_FIR)
-- 
2.38.1



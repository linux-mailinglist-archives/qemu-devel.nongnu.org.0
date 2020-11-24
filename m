Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED5E2C2224
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 10:54:40 +0100 (CET)
Received: from localhost ([::1]:59662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khV1z-000492-JW
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 04:54:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khUxM-0007QL-SI; Tue, 24 Nov 2020 04:49:52 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khUxL-0006Po-45; Tue, 24 Nov 2020 04:49:52 -0500
Received: by mail-wm1-x32c.google.com with SMTP id s13so2176223wmh.4;
 Tue, 24 Nov 2020 01:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2fdT5nSgJj6P22RjOGpymEVG7wA8ueQZ3y7adF/mr7A=;
 b=E9Uefg39cmAPFf7QKShS91lgKQoeTqGMGm5QOJwHgkKjDKXD+M62fer5hPbHg5hyGq
 mmir6S1KQr5JguByQTtKxYBTvumaVoGlkLyIYsnisp1dG+DV7v6FnF9DSqCQi23PE/rs
 sK8V10t4H9WxDPZ943VbmXeBelejOUC5z0SP/SdY2KfWyXpecnkk7gNI3hJ9yUQan35f
 vRzGaMpZt15X0j6QPtWNibb5Mfm6Z73eB/TaUGTLmGQxI+JLiPmq+4adfF1bh3udCYxi
 Osk7KsEH9DznRHP4HJvjMfJbntpcsYcTT81KKDRK+7+udMl47x9DvZNhp7zLunO6n1Mu
 n3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2fdT5nSgJj6P22RjOGpymEVG7wA8ueQZ3y7adF/mr7A=;
 b=GGAnrRJWGq9Hq8oq+wdEDobWMW3hoMRYEoafU+Op5fK6R015oAHTvDyfaxO5k774sR
 PxSoOOHpbY3YKcA1f6IDfLzRb9Sh0Y5mdwskNeBR1yHycMZ7FKbur3Dok7qfM1/a+dew
 HVzcyZ5CERLB105idwxDgL/r3MF8rzTp8KHR4uULKJtDhCinzzeAQEYw3j6LegQI4gbu
 wk4cydMjcQtrdOcKyeCNt5kPaSQg9IrGEoQT9kvFcjPsYGEeozp9pOWzj+g5b8+F/WIQ
 Is73T0Fk3d0EpZy4+9PanYuEz1a6WSofYZOG1JRkAvZ5R1YC1rLwqLA5Ry0X7MkVYZfc
 AkSQ==
X-Gm-Message-State: AOAM5308bqeqCs7AWbcENXpu9+H5hWt7qJ7hTRXKPCJD9kxSnC8o//qR
 uNZ4TvgJCOhCXw7JZMs6Jj/VT1WPLd4=
X-Google-Smtp-Source: ABdhPJwUNgD+gzGd97T2fSsGiXnfjDdy1XOrf94pC2Eg14ZCVTUGqQZOSxBERHi+xgbI11PbNlbj/w==
X-Received: by 2002:a7b:cd99:: with SMTP id y25mr3447646wmj.128.1606211388683; 
 Tue, 24 Nov 2020 01:49:48 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id x4sm9715261wrv.81.2020.11.24.01.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 01:49:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2? 1/4] hw/arm/fsl-imx: Add SD bus QOM alias on the SoC
Date: Tue, 24 Nov 2020 10:49:38 +0100
Message-Id: <20201124094941.485767-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201124094941.485767-1-f4bug@amsat.org>
References: <20201124094941.485767-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 David Aghaian <David.Aghaian@panasonic.aero>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to select a particular SD bus from the command
line, add a QOM alias on the SoC (using an unique name).

Buglink: https://bugs.launchpad.net/qemu/+bug/1895895
Reported-by: David Aghaian <David.Aghaian@panasonic.aero>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/fsl-imx25.c | 6 ++++++
 hw/arm/fsl-imx6.c  | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 08a98f828fc..6e66ae742af 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -239,6 +239,7 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
             { FSL_IMX25_ESDHC1_ADDR, FSL_IMX25_ESDHC1_IRQ },
             { FSL_IMX25_ESDHC2_ADDR, FSL_IMX25_ESDHC2_IRQ },
         };
+        g_autofree char *bus_name = NULL;
 
         object_property_set_uint(OBJECT(&s->esdhc[i]), "sd-spec-version", 2,
                                  &error_abort);
@@ -253,6 +254,11 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->esdhc[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->avic),
                                             esdhc_table[i].irq));
+
+        /* Alias controller SD bus to the SoC itself */
+        bus_name = g_strdup_printf("sd-bus%d", i);
+        object_property_add_alias(OBJECT(s), bus_name,
+                                  OBJECT(&s->esdhc[i]), "sd-bus");
     }
 
     /* USB */
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 00dafe3f62d..144bcdcaf6c 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -314,6 +314,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
             { FSL_IMX6_uSDHC3_ADDR, FSL_IMX6_uSDHC3_IRQ },
             { FSL_IMX6_uSDHC4_ADDR, FSL_IMX6_uSDHC4_IRQ },
         };
+        g_autofree char *bus_name = NULL;
 
         /* UHS-I SDIO3.0 SDR104 1.8V ADMA */
         object_property_set_uint(OBJECT(&s->esdhc[i]), "sd-spec-version", 3,
@@ -329,6 +330,11 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->esdhc[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->a9mpcore),
                                             esdhc_table[i].irq));
+
+        /* Alias controller SD bus to the SoC itself */
+        bus_name = g_strdup_printf("sd-bus%d", i);
+        object_property_add_alias(OBJECT(s), bus_name,
+                                  OBJECT(&s->esdhc[i]), "sd-bus");
     }
 
     /* USB */
-- 
2.26.2



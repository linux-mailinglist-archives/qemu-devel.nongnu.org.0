Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E699A6597C6
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 12:37:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBDft-0006S1-OJ; Fri, 30 Dec 2022 06:35:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDfq-0006RT-Mf
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 06:35:42 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDfo-0003pj-Nx
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 06:35:42 -0500
Received: by mail-wm1-x336.google.com with SMTP id m3so6119156wmq.0
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 03:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Plah9DX/B8cMIAreIJs9xue2YE22a54QEeEtYXjwY1s=;
 b=HY9kUyV1pQ9F9J3Uv7zWdXf6mRyiWSjyvT3VCUueQZ7Ne24g2rPBX+DUSY+NE7IZhX
 cssekRoG1M+sllF4CEO5XLE6ruvzthR2ejzkZ0Aq/OnpfFIi4vjZTIKoW8jDdhjaE4H0
 9xugYNXbqdP4BQ2iggAzF9F+3ISLiyPWfeBIioNaDjfMu4/OFc8QhrZWvXSCvGnxuj3J
 I1SBMKFO3pWMWQ3U/4tfIWZY9PPXaZAz4jriiUfPFFfr3yXuJUzwVw4N35G1u5CYBCP8
 F2KvFsN2eN30zD/rwMHFrWMitcFGv2UutJIq6EcKRv1aCOcuH7yNp5n3hukihoklpTGk
 pTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Plah9DX/B8cMIAreIJs9xue2YE22a54QEeEtYXjwY1s=;
 b=beIpbeCbwM6X+XdW0b+DgBdPCSllB/KBxjCMMACq40hnVehoqPtoTLQetQdsrGxywJ
 mz6rqhTwXa3au+j4Fc3wZobXQSUYbv0lJIXUJtvbwQa/ilTWkXlLJFmTXNAk2gKTYPxW
 5u0VQp6DCV7CYMkPOXrP7lqUMrkOsQf3h/NoPVqiHtJm+2N7vDm3xWciyjzWjiIrKvKN
 UMdpbxTDw7iDu9QvE46MMPwfGR44Iao+txjXAcJIm1FzDu/B0YFArZ/U4ZiQnwrlRwr6
 urhfNa5RYlio7xK84DioiY5C39W+mzf3tuv1uV8Rn7SVAdHzDiJZSCBSdcNaNdEEXZ0+
 dfuw==
X-Gm-Message-State: AFqh2kryUw/gnm+Qk/qbppIwf+gXikQ+hoP5DKnUB6E0WzkkcYYV6jAD
 daBUWVj7KhuUUYQfbTCTjyDh0XLdHXlmHqg5
X-Google-Smtp-Source: AMrXdXsMCw93tZ8ef2Y1+iX5w+5lX6NXezTa6PqoK/4ruHBPhTXeWKwIXNhyrAmyPyhX391Gqji/IA==
X-Received: by 2002:a7b:c7ca:0:b0:3d3:4cbf:3a51 with SMTP id
 z10-20020a7bc7ca000000b003d34cbf3a51mr22154088wmk.14.1672400139802; 
 Fri, 30 Dec 2022 03:35:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a7bca41000000b003d1de805de5sm27350750wml.16.2022.12.30.03.35.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 30 Dec 2022 03:35:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Peter Delevoryas <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v2 06/11] hw/arm/aspeed_ast10x0: Add various unimplemented
 peripherals
Date: Fri, 30 Dec 2022 12:34:59 +0100
Message-Id: <20221230113504.37032-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230113504.37032-1-philmd@linaro.org>
References: <20221230113504.37032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

Based on booting Zephyr demo from [1] running QEMU with
'-d unimp' and checking missing devices in [2].

[1] https://github.com/AspeedTech-BMC/zephyr/releases/tag/v00.01.07
[2] https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed_ast10x0.c     | 35 +++++++++++++++++++++++++++++++++++
 include/hw/arm/aspeed_soc.h | 11 +++++++++++
 2 files changed, 46 insertions(+)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 3500294df7..d7dbc1a801 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -28,10 +28,15 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
     [ASPEED_DEV_FMC]       = 0x7E620000,
     [ASPEED_DEV_SPI1]      = 0x7E630000,
     [ASPEED_DEV_SPI2]      = 0x7E640000,
+    [ASPEED_DEV_UDC]       = 0x7E6A2000,
     [ASPEED_DEV_SCU]       = 0x7E6E2000,
+    [ASPEED_DEV_JTAG0]     = 0x7E6E4000,
+    [ASPEED_DEV_JTAG1]     = 0x7E6E4100,
     [ASPEED_DEV_ADC]       = 0x7E6E9000,
+    [ASPEED_DEV_ESPI]      = 0x7E6EE000,
     [ASPEED_DEV_SBC]       = 0x7E6F2000,
     [ASPEED_DEV_GPIO]      = 0x7E780000,
+    [ASPEED_DEV_SGPIOM]    = 0x7E780500,
     [ASPEED_DEV_TIMER1]    = 0x7E782000,
     [ASPEED_DEV_UART1]     = 0x7E783000,
     [ASPEED_DEV_UART2]     = 0x7E78D000,
@@ -79,12 +84,17 @@ static const int aspeed_soc_ast1030_irqmap[] = {
     [ASPEED_DEV_LPC]       = 35,
     [ASPEED_DEV_PECI]      = 38,
     [ASPEED_DEV_FMC]       = 39,
+    [ASPEED_DEV_ESPI]      = 42,
     [ASPEED_DEV_PWM]       = 44,
     [ASPEED_DEV_ADC]       = 46,
     [ASPEED_DEV_SPI1]      = 65,
     [ASPEED_DEV_SPI2]      = 66,
     [ASPEED_DEV_I2C]       = 110, /* 110 ~ 123 */
     [ASPEED_DEV_KCS]       = 138, /* 138 -> 142 */
+    [ASPEED_DEV_UDC]       = 9,
+    [ASPEED_DEV_SGPIOM]    = 51,
+    [ASPEED_DEV_JTAG0]     = 27,
+    [ASPEED_DEV_JTAG1]     = 53,
 };
 
 static qemu_irq aspeed_soc_ast1030_get_irq(AspeedSoCState *s, int dev)
@@ -155,6 +165,15 @@ static void aspeed_soc_ast1030_init(Object *obj)
     object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
     object_initialize_child(obj, "sbc-unimplemented", &s->sbc_unimplemented,
                             TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "pwm", &s->pwm, TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "espi", &s->espi, TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "udc", &s->udc, TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "sgpiom", &s->sgpiom,
+                            TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "jtag[0]", &s->jtag[0],
+                            TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "jtag[1]", &s->jtag[1],
+                            TYPE_UNIMPLEMENTED_DEVICE);
 }
 
 static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
@@ -337,6 +356,22 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
                     sc->memmap[ASPEED_DEV_GPIO]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
+
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->pwm), "aspeed.pwm",
+                                  sc->memmap[ASPEED_DEV_PWM], 0x100);
+
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->espi), "aspeed.espi",
+                                  sc->memmap[ASPEED_DEV_ESPI], 0x800);
+
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->udc), "aspeed.udc",
+                                  sc->memmap[ASPEED_DEV_UDC], 0x1000);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->sgpiom), "aspeed.sgpiom",
+                                  sc->memmap[ASPEED_DEV_SGPIOM], 0x100);
+
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->jtag[0]), "aspeed.jtag",
+                                  sc->memmap[ASPEED_DEV_JTAG0], 0x20);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->jtag[1]), "aspeed.jtag",
+                                  sc->memmap[ASPEED_DEV_JTAG1], 0x20);
 }
 
 static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 8389200b2d..9a5e3c0bac 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -44,6 +44,7 @@
 #define ASPEED_CPUS_NUM  2
 #define ASPEED_MACS_NUM  4
 #define ASPEED_UARTS_NUM 13
+#define ASPEED_JTAG_NUM  2
 
 struct AspeedSoCState {
     /*< private >*/
@@ -87,6 +88,11 @@ struct AspeedSoCState {
     UnimplementedDeviceState video;
     UnimplementedDeviceState emmc_boot_controller;
     UnimplementedDeviceState dpmcu;
+    UnimplementedDeviceState pwm;
+    UnimplementedDeviceState espi;
+    UnimplementedDeviceState udc;
+    UnimplementedDeviceState sgpiom;
+    UnimplementedDeviceState jtag[ASPEED_JTAG_NUM];
 };
 
 #define TYPE_ASPEED_SOC "aspeed-soc"
@@ -174,6 +180,11 @@ enum {
     ASPEED_DEV_DPMCU,
     ASPEED_DEV_DP,
     ASPEED_DEV_I3C,
+    ASPEED_DEV_ESPI,
+    ASPEED_DEV_UDC,
+    ASPEED_DEV_SGPIOM,
+    ASPEED_DEV_JTAG0,
+    ASPEED_DEV_JTAG1,
 };
 
 qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
-- 
2.38.1



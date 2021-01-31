Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8C4309D4F
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 16:18:28 +0100 (CET)
Received: from localhost ([::1]:37294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6EUd-0006FG-Um
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 10:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6EQk-0002xq-SF; Sun, 31 Jan 2021 10:14:26 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:35717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6EQj-0006mv-7l; Sun, 31 Jan 2021 10:14:26 -0500
Received: by mail-wm1-x32b.google.com with SMTP id e15so11033207wme.0;
 Sun, 31 Jan 2021 07:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r+g1tP1DkDesVdYhAnUOBWvR86/+XyTKbQQZsxh+ijo=;
 b=hSIFqsW4F8vJBfeIY+WbylKHqyBILO/QWN+oHD5gx2tRowQtjti8gFbzGRtW2PQzKu
 mHCciR6q/vLXCBJXLPTrg+JYVpTT8H5PRUXZp8S0hRmhRjztg6u2ohFMhv1uyQQmgxZn
 7Ek+MdiIv/p3yf2VYrTzBWk38OKpGo5mHwvTMvcOnthRdZzodkHWp+7PtS3fO8vNQkEh
 eUzGHNUh5ddXDvUq3I+vzabRFbPyeeNWPhhqLOmQfdNAxZxZaocC8U7TjTHalL6ZaCn+
 xV1YNZ6QujS4GoCxx5h8GTHWhllqLFlrYKVn835J0+vY/sOfc4MsScjA9EotivNG9NlN
 xAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=r+g1tP1DkDesVdYhAnUOBWvR86/+XyTKbQQZsxh+ijo=;
 b=clBWSr2z/5vLgurb63OwdrbZu79y7UdiOKnV/6sjNlaB5K+PzpjFhknX6W5KMtJm97
 k1Bg/s50HsHzhxSTN9sjdGosVjx5ntneOaqBoaHuS14kqY8wYB50XmvIF6SjbxYBXUgP
 N0lRcNXZopScW7JGZXXT3V98n3kOG8p3c9ZwNh1fGbkpBFZuTZe74nxlGF2x/k7Vde5O
 qFZ/zLkzp3hiOKJi602nGUbXxf4m4eMmLUAQ0ts7qNWyiv+jfMlB6yMiZWG/sL+HGU08
 rGFK3IZTWijSdQBcNTUSYlxQMKfrokWJkhJhHGjc48LrzE9POLGls9BipXUmhrrtEGj1
 b+dw==
X-Gm-Message-State: AOAM531G/8dvwIAK5i6Npohi1z2jnIJ2iJqzHD2AaYqB2ViBQ7vV2hus
 NgInxEeK1wNpyv55AjvYhd/4izS4iLE=
X-Google-Smtp-Source: ABdhPJxidqpTr3QzQlIyLmEZ1bbwOq7P/2eRvmnG+JeWWBFUdRv1yZstRnQY9MvACPPC5SLu2g+j9w==
X-Received: by 2002:a05:600c:210b:: with SMTP id
 u11mr11676843wml.16.1612106062785; 
 Sun, 31 Jan 2021 07:14:22 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id s4sm18304850wme.38.2021.01.31.07.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 07:14:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/2] hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to TCG
Date: Sun, 31 Jan 2021 16:14:10 +0100
Message-Id: <20210131151410.318649-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131151410.318649-1-f4bug@amsat.org>
References: <20210131151410.318649-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM requires the target cpu to be at least ARMv8 architecture
(support on ARMv7 has been dropped in commit 82bf7ae84ce:
"target/arm: Remove KVM support for 32-bit Arm hosts").

From the various SoC used by the Raspberry Pi machines, only
the BCM2837 is an ARMv8 (Cortex-A53).

Restrict the BCM2835 (ARM1176) and BCM2836 (Cortex-A7) to TCG.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2836.c | 6 ++++++
 hw/arm/raspi.c   | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index fd16ed87c40..3051764f2dc 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -89,6 +89,7 @@ static bool bcm283x_common_realize(DeviceState *dev, Error **errp)
     return true;
 }
 
+#ifdef CONFIG_TCG
 static void bcm2835_realize(DeviceState *dev, Error **errp)
 {
     BCM283XState *s = BCM283X(dev);
@@ -107,6 +108,7 @@ static void bcm2835_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
             qdev_get_gpio_in(DEVICE(&s->cpu[0].core), ARM_CPU_FIQ));
 }
+#endif /* CONFIG_TCG */
 
 static void bcm2836_realize(DeviceState *dev, Error **errp)
 {
@@ -178,6 +180,7 @@ static void bcm283x_class_init(ObjectClass *oc, void *data)
     dc->user_creatable = false;
 }
 
+#ifdef CONFIG_TCG
 static void bcm2835_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -201,6 +204,7 @@ static void bcm2836_class_init(ObjectClass *oc, void *data)
     bc->clusterid = 0xf;
     dc->realize = bcm2836_realize;
 };
+#endif /* CONFIG_TCG */
 
 #ifdef TARGET_AARCH64
 static void bcm2837_class_init(ObjectClass *oc, void *data)
@@ -227,6 +231,7 @@ static const TypeInfo bcm283x_types[] = {
         .class_init     = bcm283x_class_init,
         .abstract       = true,
     },
+#ifdef CONFIG_TCG
     {
         .name           = TYPE_BCM2835,
         .parent         = TYPE_BCM283X,
@@ -236,6 +241,7 @@ static const TypeInfo bcm283x_types[] = {
         .parent         = TYPE_BCM283X,
         .class_init     = bcm2836_class_init,
     },
+#endif /* CONFIG_TCG */
 #ifdef TARGET_AARCH64
     {
         .name           = TYPE_BCM2837,
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index dce966a4dd8..cfa15504d9c 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -319,6 +319,7 @@ static void raspi_machine_class_common_init(MachineClass *mc,
     mc->default_ram_id = "ram";
 };
 
+#ifdef CONFIG_TCG
 static void raspi0_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -346,6 +347,7 @@ static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
     rmc->board_rev = 0xa21041;
     raspi_machine_class_common_init(mc, rmc->board_rev);
 };
+#endif /* CONFIG_TCG */
 
 #ifdef TARGET_AARCH64
 static void raspi3ap_machine_class_init(ObjectClass *oc, void *data)
@@ -376,6 +378,7 @@ static const TypeInfo raspi_machine_types[] = {
         .class_size     = sizeof(RaspiMachineClass),
         .abstract       = true,
     },
+#ifdef CONFIG_TCG
     {
         .name           = MACHINE_TYPE_NAME("raspi0"),
         .parent         = TYPE_RASPI_MACHINE,
@@ -389,6 +392,7 @@ static const TypeInfo raspi_machine_types[] = {
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi2b_machine_class_init,
     },
+#endif /* CONFIG_TCG */
 #ifdef TARGET_AARCH64
     {
         .name           = MACHINE_TYPE_NAME("raspi3ap"),
-- 
2.26.2



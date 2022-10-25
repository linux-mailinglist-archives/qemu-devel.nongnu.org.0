Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 092BA60D22C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 19:00:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onN99-0002Do-Fr; Tue, 25 Oct 2022 12:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1onN95-000260-Ua; Tue, 25 Oct 2022 12:51:19 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1onN93-0003mR-Pc; Tue, 25 Oct 2022 12:51:19 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 101-20020a9d0bee000000b00661b54d945fso8071556oth.13; 
 Tue, 25 Oct 2022 09:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=LOdwzSim6tf4VC7w0ynAot7e+idqrKLNtjhmbjk4iLk=;
 b=np0kyH/H7KaqzJrNlkSN8t6Ut7QTshVwcDaabPf1lEaSqTKhwhqH5Jp6/pulHVZc8/
 GCQiJVTs7saC9kdQ8+CPHw6ggsO4eGlcgEl5l9gMLcVnkGdQlvqMTWkxCQodApD+QHBS
 J76HDmCYBalB41Aiie2/EXloaUd13xswflsHgTkdEvLdA3RBpCGhS5OeYxqzIkWyLIou
 WAx9TbQob541s059JxBG17QxJNpgB2JD7PyDULs017qelIDBWQirPhDdE9ObPL+KtMj7
 Szk0wMKZogYCS/6xx6lDd+D4Xs6vfEElzw/W67nPIQfRhXmjDMIToDc0RWdZT7XxF6Ew
 PGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LOdwzSim6tf4VC7w0ynAot7e+idqrKLNtjhmbjk4iLk=;
 b=swXVfasWDW+7dQ23ZAqNtPS8ulceEpeyXZuMS6i3f3r/ve/k7Ti3nAZIA6CgreSF1K
 +MgboptI/11QsO/1tm3USkmFExmf9bAQmaH2TpqplHKP1/exOr+6RqumybkaUe3awfto
 0Zl0tXBW2zBcrgKu2cuzAUk4WnuauVNnqmcctb61IO/2igcFy28x2lnEd2ST6Ds7lWhu
 MXNdh4pPbngkS0rcRWTJtSiTt81VazyVOpogNGBycFOw00bzHMCobv4Wq1tnoDJ3bD8W
 nWJixlmJT/wW/XJzaLVT9fslRJsJ4EbjDl3AYRK/lwlkA3+aewBVMJpVEHEqTDMY405q
 3KJg==
X-Gm-Message-State: ACrzQf1z2950ns3z+stl68Sn2JcapsH83RUu/8Szun6fQsMP6QORlUzw
 W8NZ/IzRr+8G/asAkZiO+h4=
X-Google-Smtp-Source: AMsMyM4ay0KMaFPHoDnkvGqqLFG3qQg9OpfSPlLr9e25yXA7z1lGJ63mSG/rkcCADATZM7ft2cffbA==
X-Received: by 2002:a9d:669:0:b0:643:6fb3:420 with SMTP id
 96-20020a9d0669000000b006436fb30420mr20021734otn.327.1666716673442; 
 Tue, 25 Oct 2022 09:51:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 i23-20020a9d4a97000000b00661a30ea0d4sm1229067otf.2.2022.10.25.09.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:51:12 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] aspeed: Add Supermicro X11 SPI machine type
Date: Tue, 25 Oct 2022 09:51:09 -0700
Message-Id: <20221025165109.1226001-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.36.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

supermicrox11-bmc is configured with ast2400-a1 SoC. This does not match
the Supermicro documentation for X11 BMCs, and it does not match the
devicetree file in the Linux kernel.

As it turns out, some Supermicro X11 motherboards use AST2400 SoCs,
while others use AST2500.

Introduce new machine type supermicrox11-spi-bmc with AST2500 SoC
to match the devicetree description in the Linux kernel. Hardware
configuration details for this machine type are guesswork and taken
from defaults as well as from the Linux kernel devicetree file.

The new machine type was tested with aspeed-bmc-supermicro-x11spi.dts
from the Linux kernel and with Linux versions 6.0.3 and 6.1-rc2.
Linux booted successfully from initrd and from both SPI interfaces.
Ethernet interfaces were confirmed to be operational.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/aspeed.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c282ead38f..56d007de5a 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -71,6 +71,16 @@ struct AspeedMachineState {
         SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       \
         SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
 
+/* TODO: Find the actual hardware value */
+#define SUPERMICROX11_SPI_BMC_HW_STRAP1 (                               \
+        AST2500_HW_STRAP1_DEFAULTS |                                    \
+        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     \
+        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        \
+        SCU_AST2500_HW_STRAP_UART_DEBUG |                               \
+        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              \
+        SCU_HW_STRAP_SPI_WIDTH |                                        \
+        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_M_S_EN))
+
 /* AST2500 evb hardware value: 0xF100C2E6 */
 #define AST2500_EVB_HW_STRAP1 ((                                        \
         AST2500_HW_STRAP1_DEFAULTS |                                    \
@@ -1172,6 +1182,25 @@ static void aspeed_machine_supermicrox11_bmc_class_init(ObjectClass *oc,
     mc->default_ram_size = 256 * MiB;
 }
 
+static void aspeed_machine_supermicrox11_spi_bmc_class_init(ObjectClass *oc,
+                                                            void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Supermicro X11 SPI BMC (ARM1176)";
+    amc->soc_name  = "ast2500-a1";
+    amc->hw_strap1 = SUPERMICROX11_SPI_BMC_HW_STRAP1;
+    amc->fmc_model = "mx25l25635e";
+    amc->spi_model = "mx25l25635e";
+    amc->num_cs    = 1;
+    amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON;
+    amc->i2c_init  = palmetto_bmc_i2c_init;
+    mc->default_ram_size = 512 * MiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
+}
+
 static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1546,6 +1575,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("supermicrox11-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_supermicrox11_bmc_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("supermicrox11-spi-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_supermicrox11_spi_bmc_class_init,
     }, {
         .name          = MACHINE_TYPE_NAME("ast2500-evb"),
         .parent        = TYPE_ASPEED_MACHINE,
-- 
2.36.2



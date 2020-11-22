Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D4A2BC52C
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 11:53:41 +0100 (CET)
Received: from localhost ([::1]:48580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgn00-0008DC-7t
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 05:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangzhiqiang.bj@bytedance.com>)
 id 1kgmyA-0007BZ-6n
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 05:51:46 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:35970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wangzhiqiang.bj@bytedance.com>)
 id 1kgmy6-0003Mk-FB
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 05:51:44 -0500
Received: by mail-pl1-x62d.google.com with SMTP id k7so7374732plk.3
 for <qemu-devel@nongnu.org>; Sun, 22 Nov 2020 02:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HsP3luyV43O1uAiPnp+pvJTLDkBud9/bEEVvoT8WPn8=;
 b=rtqLiCdnBLvEZ6b9KBvGNy5XxMwFGXUS8OFxVQL2ropcvCSVICfk92rgtfOaMd6Nxl
 9UGIuP/GyfjEBhXvxCTKBfIot97lqiyY5wJwXjWYvJ2WjDoNT8qukVIVsRnd7Vcry7U3
 Md3nDNL3QCxvUDzz1o8qWZkRkBLisM4zDvKvatSMLferw3/Y1xV04z965qkXsqJEVDUD
 AYGjRrEqfHAkGGtVsGRQ543Eqzm1FyQA0WyZDkZg3Sa1YDt6bQKHXWAxgoFG9PbPTDWe
 XFm0zaSoVr9+aU68bNRZ1aav+Yqz1gKIV0eJzkBFdavUKdI7y9Lrz+wsj/vahNJFKfNC
 Tgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HsP3luyV43O1uAiPnp+pvJTLDkBud9/bEEVvoT8WPn8=;
 b=RCgPBDdgZS1ELN2tAM9CEPe5nKm7Y6DT+eMaM+jjYVYBlgOznARyOL689eU3dkEjUm
 jBvQNrU/eW08fLm8L5clIBpGs8ixqe8caiAGXnbeYGbrXXdbDxVYzg14SVisN8jghtw6
 +hogPNUhZFCh34h9ybwjp4N4HnHF1WFoB8l/KDNfgGsaJNznniMlVqzbLRglBj4daI5B
 JzCam+dDT29gbA/gaC2bLg1HVdMP5gB1aGUSYwvYzyekfgqXSyk2pHpLxm0t06bNFc87
 GVWOuTN/5lTmycqsOBEvQc4Jdqh/02dwYMSFZNOUcErTaHahHP8/N7prJ5NWq1ySJBMp
 82Iw==
X-Gm-Message-State: AOAM530stek9/wDnX7+8bi+QS+9raoHPJKJOQ1gbVsBR6ts2f0YZtJOe
 MNmb16dCVCCM2ouBAzW3Sm4K9Q==
X-Google-Smtp-Source: ABdhPJwxRtlb60yaVlVwp7hcbWrRsBC8hZRxORzPuGX57prSqbSiyR+torJ7UwViaC+lY91aiYJkFg==
X-Received: by 2002:a17:902:56d:b029:d7:c927:2e51 with SMTP id
 100-20020a170902056db02900d7c9272e51mr20595936plf.27.1606042301062; 
 Sun, 22 Nov 2020 02:51:41 -0800 (PST)
Received: from localhost ([61.120.150.74])
 by smtp.gmail.com with ESMTPSA id 145sm7961018pga.11.2020.11.22.02.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2020 02:51:40 -0800 (PST)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: clg@kaod.org, xuxiaohan@bytedance.com, yulei.sh@bytedance.com,
 joel@jms.id.au, f4bug@amsat.org
Subject: [PATCH v4 2/2] aspeed: Add support for the g220a-bmc board
Date: Sun, 22 Nov 2020 18:51:34 +0800
Message-Id: <20201122105134.671-2-wangzhiqiang.bj@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201122105134.671-1-wangzhiqiang.bj@bytedance.com>
References: <20201122105134.671-1-wangzhiqiang.bj@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=wangzhiqiang.bj@bytedance.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

G220A is a 2 socket x86 motherboard supported by OpenBMC.
Strapping configuration was obtained from hardware.

Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
v4:
  - No changes
v3:
  - No changes
v2:
  - No changes
---
 hw/arm/aspeed.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 0ef3f6b412..aee00ba8d6 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -121,6 +121,20 @@ struct AspeedMachineState {
         SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              \
         SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
 
+#define G220A_BMC_HW_STRAP1 (                                      \
+        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     \
+        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        \
+        SCU_AST2500_HW_STRAP_UART_DEBUG |                               \
+        SCU_AST2500_HW_STRAP_RESERVED28 |                               \
+        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              \
+        SCU_HW_STRAP_2ND_BOOT_WDT |                                     \
+        SCU_HW_STRAP_VGA_CLASS_CODE |                                   \
+        SCU_HW_STRAP_LPC_RESET_PIN |                                    \
+        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER) |                \
+        SCU_AST2500_HW_STRAP_SET_AXI_AHB_RATIO(AXI_AHB_RATIO_2_1) |     \
+        SCU_HW_STRAP_VGA_SIZE_SET(VGA_64M_DRAM) |                       \
+        SCU_AST2500_HW_STRAP_RESERVED1)
+
 /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) */
 #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
 
@@ -579,6 +593,30 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
     /* Bus 11: TODO ucd90160@64 */
 }
 
+static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+    DeviceState *dev;
+
+    dev = DEVICE(i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3),
+                                         "emc1413", 0x4c));
+    object_property_set_int(OBJECT(dev), "temperature0", 31000, &error_abort);
+    object_property_set_int(OBJECT(dev), "temperature1", 28000, &error_abort);
+    object_property_set_int(OBJECT(dev), "temperature2", 20000, &error_abort);
+
+    dev = DEVICE(i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 12),
+                                         "emc1413", 0x4c));
+    object_property_set_int(OBJECT(dev), "temperature0", 31000, &error_abort);
+    object_property_set_int(OBJECT(dev), "temperature1", 28000, &error_abort);
+    object_property_set_int(OBJECT(dev), "temperature2", 20000, &error_abort);
+
+    dev = DEVICE(i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 13),
+                                         "emc1413", 0x4c));
+    object_property_set_int(OBJECT(dev), "temperature0", 31000, &error_abort);
+    object_property_set_int(OBJECT(dev), "temperature1", 28000, &error_abort);
+    object_property_set_int(OBJECT(dev), "temperature2", 20000, &error_abort);
+}
+
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
 {
     return ASPEED_MACHINE(obj)->mmio_exec;
@@ -818,6 +856,24 @@ static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
 
+static void aspeed_machine_g220a_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Bytedance G220A BMC (ARM1176)";
+    amc->soc_name  = "ast2500-a1";
+    amc->hw_strap1 = G220A_BMC_HW_STRAP1;
+    amc->fmc_model = "n25q512a";
+    amc->spi_model = "mx25l25635e";
+    amc->num_cs    = 2;
+    amc->macs_mask  = ASPEED_MAC1_ON | ASPEED_MAC2_ON;
+    amc->i2c_init  = g220a_bmc_i2c_init;
+    mc->default_ram_size = 1024 * MiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
+};
+
 static const TypeInfo aspeed_machine_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -855,6 +911,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("tacoma-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_tacoma_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("g220a-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_g220a_class_init,
     }, {
         .name          = TYPE_ASPEED_MACHINE,
         .parent        = TYPE_MACHINE,
-- 
2.25.1



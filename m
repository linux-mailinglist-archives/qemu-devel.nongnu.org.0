Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 724935473F7
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:52:18 +0200 (CEST)
Received: from localhost ([::1]:41760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzyj3-0001av-GF
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzySk-0004tx-3f
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:26 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzySd-0006V7-F9
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:24 -0400
Received: by mail-wr1-x42b.google.com with SMTP id x17so1483414wrg.6
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H9T0seqiej5ts9q+/AfTue9nmgfex5iUAMExD5ya6fo=;
 b=eibuUvIzvJ0EBEcyP4Jq38RRWsKtwiWktk2KQ6ET/dTACNVSyYQRTt0bIE1Y3jlVjS
 H3/7Ty3nes1d+mGx7Mimop5nkEgMopAARSSYrxUDi4Fn6uu7L/6881t0t5wYdZI+hIOp
 H4YG0FOlf95ah+MCto+wJl09f0Xzht6V0aFUI3si1gG2OKR33U88t5MImk+AkpkUfqWL
 Mj9yHxowUJYylCCJPYcYFo+ahPAQ/XcR2uBMtLOfyP3q9WUDrx4YDvFz5e2KicsD/MoA
 FNWyrpCXFuzJ1YSVI67GUvFhAh2HCicKnGJ5zD84N7K4VjHdS3DVyX5uC94rYmFIMUcp
 qvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H9T0seqiej5ts9q+/AfTue9nmgfex5iUAMExD5ya6fo=;
 b=IhvMPGO7CTlHh4iKj67ZFLXFAbONyKepl6xr/IJYZkKUhI+oM5y9e900C5r8vyKVBQ
 6mf9y7WBK7MJ24TsEeRwbrMuWobAv18WbaWre+7Re0vlI/dibwonaRi3Mg40WkYEujH0
 i6UmIL+Ffz5VvbXZ+OJ8Y0owChdxdzyOLUL7m6Q4y0mShjm6z0Eq+EPVB4uRXx1X/X86
 nR5o3SJb2lKlmQiuVhARibtR6vHgi6ZeACggexZ2LbJZ770yYP74udlevsktubc1mkIT
 qpImYYOenXTEwktP6uRJNCFjSMjr/JjjuvhWYgu5+QWV0F/G49drEAlZWQzisXltXBir
 6oIg==
X-Gm-Message-State: AOAM531UAN8N0YEyJIMVur3Ea5GTlzkD7KCH/8vV/a/P3itPfrzstul8
 XVnj+hY/meoMtAJ3vIxZsbjyeruiA6s=
X-Google-Smtp-Source: ABdhPJyg7D/pLvt9s46ZARaN36DpWzMbKJVxY64MUjYbZciM4KDlgGnXtPal5gyhhuiKzkqo4pnLng==
X-Received: by 2002:adf:a55a:0:b0:219:e574:2ae9 with SMTP id
 j26-20020adfa55a000000b00219e5742ae9mr8364868wrb.158.1654943713385; 
 Sat, 11 Jun 2022 03:35:13 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 g7-20020a5d4887000000b002184a3a3641sm2087030wrq.100.2022.06.11.03.35.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:35:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PULL 23/49] hw/acpi/piix4: use qdev gpio to wire up smi_irq
Date: Sat, 11 Jun 2022 12:32:46 +0200
Message-Id: <20220611103312.67773-24-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Initialize the SMI IRQ in piix4_pm_init().

The smi_irq can now be wired up directly using a qdev gpio instead
of having to set the IRQ externally in piix4_pm_initfn().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220528091934.15520-10-mark.cave-ayland@ilande.co.uk>
[PMD: Partially squash 20220528091934.15520-8-mark.cave-ayland@ilande.co.uk]
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/piix4.c               | 4 ++--
 hw/i386/pc_piix.c             | 3 ++-
 hw/isa/piix4.c                | 2 +-
 include/hw/southbridge/piix.h | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index fe5ec0a723..32033bc9d7 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -502,10 +502,11 @@ static void piix4_pm_init(Object *obj)
     PIIX4PMState *s = PIIX4_PM(obj);
 
     qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
+    qdev_init_gpio_out_named(DEVICE(obj), &s->smi_irq, "smi-irq", 1);
 }
 
 PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                              qemu_irq smi_irq, bool smm_enabled)
+                              bool smm_enabled)
 {
     PCIDevice *pci_dev;
     DeviceState *dev;
@@ -517,7 +518,6 @@ PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
     qdev_prop_set_bit(dev, "smm-enabled", smm_enabled);
 
     s = PIIX4_PM(dev);
-    s->smi_irq = smi_irq;
 
     pci_realize_and_unref(pci_dev, bus, &error_fatal);
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 27acba4146..89c4f07c9f 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -283,9 +283,10 @@ static void pc_init1(MachineState *machine,
         PIIX4PMState *piix4_pm;
 
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
-        piix4_pm = piix4_pm_initfn(pci_bus, piix3_devfn + 3, 0xb100, smi_irq,
+        piix4_pm = piix4_pm_initfn(pci_bus, piix3_devfn + 3, 0xb100,
                                    x86_machine_is_smm_enabled(x86ms));
         qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
+        qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
         /* TODO: Populate SPD eeprom data.  */
         smbus_eeprom_init(pcms->smbus, 8, NULL, 0);
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 0b6ea22143..775e15eb20 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -311,7 +311,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 
     pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
     if (smbus) {
-        pms = piix4_pm_initfn(pci_bus, devfn + 3, 0x1100, NULL, 0);
+        pms = piix4_pm_initfn(pci_bus, devfn + 3, 0x1100, 0);
         qdev_connect_gpio_out(DEVICE(pms), 0,
                               qdev_get_gpio_in_named(dev, "isa", 9));
         *smbus = I2C_BUS(qdev_get_child_bus(DEVICE(pms), "i2c"));
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 105d158f78..b69e0dfb04 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -17,7 +17,7 @@
 #include "hw/acpi/piix4.h"
 
 PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                              qemu_irq smi_irq, bool smm_enabled);
+                              bool smm_enabled);
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
-- 
2.36.1



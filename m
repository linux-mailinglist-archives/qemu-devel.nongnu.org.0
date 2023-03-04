Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6A86AA94F
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 12:42:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYQGK-0003Yv-6e; Sat, 04 Mar 2023 06:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYQG8-0003Tz-Q5; Sat, 04 Mar 2023 06:41:05 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYQG6-0008U5-VW; Sat, 04 Mar 2023 06:41:04 -0500
Received: by mail-ed1-x532.google.com with SMTP id i34so20189555eda.7;
 Sat, 04 Mar 2023 03:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677930061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bdYaBxCISe0pefR1i+qWPkcMEXBRaMVRlBH94wLysTs=;
 b=my4c3hrZP6CfRndcV2FuY/3sZURSrgfAZ7yneeMLc/QUL3fZuz6tgsrc4w2Av3SRk5
 67B0d/yOYJOzoBPvhn46LmB0qg9OOTDo7i3NeMOn+pKFkPu1BnAaqOKXsxKxk2VLwC4Q
 NuYsIgrYP7XPN92OxCrDYXB3X3w/R5V9FaUcIiMQiVInfitCe6urwY1QJ7uVTFNETVm+
 s2KhTbXgA1UdBqF1/mWXh9bxEAwalnQrOKLiQ0NafrPPElr6S1VBG/sP/kxQApU1FF3W
 31U6WUlru9qw1Akr0AXZ/rE7uD5LQ6HBSN17i6Rl4y7mBl/x8e8uabE2UIZxRs+IDAR7
 U1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677930061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bdYaBxCISe0pefR1i+qWPkcMEXBRaMVRlBH94wLysTs=;
 b=Of9YKsq7bqRxjdI3HUm4ZVZ2xmhhysp20EShnvcDRFck/y8ejRwWC5r2Q/3+dHV5er
 E9jej2QIioduJ8Tgif5SQ88CZ/RvwqGvThWPZRnZve3ZY92ddtC78sbbVnd5sHtXyX60
 cx8Qdvi/P3+RzRU9UA2yuW5nNOySG605YH+yeCb2epSqAgVC0ktVadg+fOTvvHZcH/bA
 T3jbs8PX/WAWfct5uaLfbNGXApze1vKWD+9vK6EwWxEYnqxd8pKQq3oFaHKYXBhixgNv
 ZiJg2gSSW8s12L7XlxRzHo6uVIggaCz99ZGpAqUWm5tykIpeoICDXGKQ6UvkuBNfckNZ
 FZOA==
X-Gm-Message-State: AO0yUKX41mTPB8PXPXHdctKvgLu4mPGr3O5rhOv+0aH4frIm96ueskVA
 jPXfxZaNq23VuDcB6iBFXnK3e34llgo=
X-Google-Smtp-Source: AK7set9LmuZsf96RMiFQcTbFuKJsiHKPQYuHCeUCI9ii3Tptg5r24rognBVcU5X5BJclqy7dfdtcUA==
X-Received: by 2002:a17:906:2f0c:b0:878:61d8:d7c2 with SMTP id
 v12-20020a1709062f0c00b0087861d8d7c2mr4572956eji.39.1677930060991; 
 Sat, 04 Mar 2023 03:41:00 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-004-175.77.183.pool.telefonica.de. [77.183.4.175])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a17090686c600b008c44438734csm1993248ejy.113.2023.03.04.03.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 03:41:00 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 4/5] hw/pci/pci: Remove multifunction parameter from
 pci_create_simple_multifunction()
Date: Sat,  4 Mar 2023 12:40:42 +0100
Message-Id: <20230304114043.121024-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230304114043.121024-1-shentey@gmail.com>
References: <20230304114043.121024-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

There is also pci_create_simple() which creates non-multifunction PCI
devices. Accordingly the parameter is always set to true when a multi
function PCI device is to be created.

The reason for the parameter's existence seems to be that it is used in the
internal PCI code as well which is the only location where it gets set to
false. This one usage can be replaced by trivial code.

Remove this redundant, error-prone parameter.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/pci/pci.h | 1 -
 hw/i386/pc_piix.c    | 2 +-
 hw/i386/pc_q35.c     | 4 ++--
 hw/mips/boston.c     | 3 +--
 hw/mips/malta.c      | 2 +-
 hw/pci/pci.c         | 7 ++++---
 6 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index d5a40cd058..830407a5b9 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -578,7 +578,6 @@ PCIDevice *pci_new(int devfn, const char *name);
 bool pci_realize_and_unref(PCIDevice *dev, PCIBus *bus, Error **errp);
 
 PCIDevice *pci_create_simple_multifunction(PCIBus *bus, int devfn,
-                                           bool multifunction,
                                            const char *name);
 PCIDevice *pci_create_simple(PCIBus *bus, int devfn, const char *name);
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 2f16011bab..0cd430ccc5 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -235,7 +235,7 @@ static void pc_init1(MachineState *machine,
                                        : pc_pci_slot_get_pirq);
         pcms->bus = pci_bus;
 
-        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+        pci_dev = pci_create_simple_multifunction(pci_bus, -1, type);
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 797ba347fd..65a862b66d 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -299,7 +299,7 @@ static void pc_q35_init(MachineState *machine)
         ahci = pci_create_simple_multifunction(host_bus,
                                                PCI_DEVFN(ICH9_SATA1_DEV,
                                                          ICH9_SATA1_FUNC),
-                                               true, "ich9-ahci");
+                                               "ich9-ahci");
         idebus[0] = qdev_get_child_bus(&ahci->qdev, "ide.0");
         idebus[1] = qdev_get_child_bus(&ahci->qdev, "ide.1");
         g_assert(MAX_SATA_PORTS == ahci_get_num_ports(ahci));
@@ -321,7 +321,7 @@ static void pc_q35_init(MachineState *machine)
         smb = pci_create_simple_multifunction(host_bus,
                                               PCI_DEVFN(ICH9_SMB_DEV,
                                                         ICH9_SMB_FUNC),
-                                              true, TYPE_ICH9_SMB_DEVICE);
+                                              TYPE_ICH9_SMB_DEVICE);
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(smb), "i2c"));
 
         smbus_eeprom_init(pcms->smbus, 8, NULL, 0);
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index a9d87f3437..2539606549 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -770,8 +770,7 @@ static void boston_mach_init(MachineState *machine)
                              boston_lcd_event, NULL, s, NULL, true);
 
     ahci = pci_create_simple_multifunction(&PCI_BRIDGE(&pcie2->root)->sec_bus,
-                                           PCI_DEVFN(0, 0),
-                                           true, TYPE_ICH9_AHCI);
+                                           PCI_DEVFN(0, 0), TYPE_ICH9_AHCI);
     g_assert(ARRAY_SIZE(hd) == ahci_get_num_ports(ahci));
     ide_drive_get(hd, ahci_get_num_ports(ahci));
     ahci_ide_create_devs(ahci, hd);
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index ec172b111a..d4c79d263d 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1254,7 +1254,7 @@ void mips_malta_init(MachineState *machine)
     pci_bus_map_irqs(pci_bus, malta_pci_slot_get_pirq);
 
     /* Southbridge */
-    piix4 = pci_create_simple_multifunction(pci_bus, PIIX4_PCI_DEVFN, true,
+    piix4 = pci_create_simple_multifunction(pci_bus, PIIX4_PCI_DEVFN,
                                             TYPE_PIIX4_PCI_DEVICE);
     isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix4), "isa.0"));
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 034fe49e9a..c2e14f000e 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2111,17 +2111,18 @@ bool pci_realize_and_unref(PCIDevice *dev, PCIBus *bus, Error **errp)
 }
 
 PCIDevice *pci_create_simple_multifunction(PCIBus *bus, int devfn,
-                                           bool multifunction,
                                            const char *name)
 {
-    PCIDevice *dev = pci_new_multifunction(devfn, multifunction, name);
+    PCIDevice *dev = pci_new_multifunction(devfn, true, name);
     pci_realize_and_unref(dev, bus, &error_fatal);
     return dev;
 }
 
 PCIDevice *pci_create_simple(PCIBus *bus, int devfn, const char *name)
 {
-    return pci_create_simple_multifunction(bus, devfn, false, name);
+    PCIDevice *dev = pci_new(devfn, name);
+    pci_realize_and_unref(dev, bus, &error_fatal);
+    return dev;
 }
 
 static uint8_t pci_find_space(PCIDevice *pdev, uint8_t size)
-- 
2.39.2



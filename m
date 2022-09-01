Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0385A9DC6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 19:09:32 +0200 (CEST)
Received: from localhost ([::1]:50964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnh5-0001w5-Bs
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 13:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2k-0002Wl-4d
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:51 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:45620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2R-0001Uy-AG
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:49 -0400
Received: by mail-ej1-x634.google.com with SMTP id lx1so35791396ejb.12
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Yh2USEEnad76TBj5zc5QGVJL5QL0B0Mdkz8uHmgdtFk=;
 b=hyQzIStNPc7EwjhpkbH1EK8imenfPUCMUEO3ZTppZzQDUafLOuZRI/ZwAaJD4ubxnA
 A8ozRAM6+uI2hzbKYyh+kOyFNHWV4ELtQnO35wMVh2ZUhVCIvo4sjOzgAR3Aqj49lPHi
 JYrzsWRLa0BGvOB17HNyIWa8XaNSgwfo5glj5RP84G+1cfuVSDo3/K21fZ4HBwVyuJ9k
 yYAFXVbkyaP+vOgZOchONP3LTgU98KDO39KkyWk4OKm6EfCftthv90aw/AtNf1zktmR0
 u377VoW+DsdjlFNEwrKMBuSNdi/fkOkElXKhkGW5SHiFn+06EjMObGtUaqP4JE8tIcN0
 CtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Yh2USEEnad76TBj5zc5QGVJL5QL0B0Mdkz8uHmgdtFk=;
 b=zakPg4Z1hXu/e6AFR8Oj6Uwi7zfjI3JRiyQVPTJZvbZOf+e8Hzr+5NPG1g9XDRn1Q0
 du/NGnYgnyykWbeH3W8ohw7PXdw5ldrmmMdum3umYe+mCs4WD9kjjhISVy5B+JlsRWQ9
 zl95us6xqoGkGqKndLsAN+ZmmQZ58TskcNL07IQMaGppaP/HI+5ok0vUi5F20N7/Z1A7
 n/bMBPFBuH+bLrK6FWpuC3R8aVae16Ji4WLqn7gbeQh8s8/1kqm0+VYAEp6u8qMjU6n5
 WnLZozFUjIS7RiuzD935F9uIhDtxiTNsN4sINydq8qBRPgDvc+fhDILSNExPgvVQE6k+
 kL8A==
X-Gm-Message-State: ACgBeo1lF6PuRN0iFg52R8rg4S+YQ6r1gK2WetYy0KPG4GD+v558Q+VC
 EYXKb7J4bR6utx+38Ap2rM1gkqWEnBM=
X-Google-Smtp-Source: AA6agR5fBZCHMuwu5OqpxCF4Sqdgsu3f3F3OdKyz65el4YismVqM6R7bjkOkZLlyHrIFVx3AjXg4AQ==
X-Received: by 2002:a17:906:847c:b0:73f:d7cf:bf2d with SMTP id
 hx28-20020a170906847c00b0073fd7cfbf2dmr20587110ejc.327.1662049649545; 
 Thu, 01 Sep 2022 09:27:29 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:29 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 38/42] hw/isa/piix: Consolidate IRQ triggering
Date: Thu,  1 Sep 2022 18:26:09 +0200
Message-Id: <20220901162613.6939-39-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Speeds up PIIX4 which resolves an old TODO.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix.c | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 1d516de5cc..e413d7e792 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -83,27 +83,6 @@ static void piix_set_irq(void *opaque, int pirq, int level)
     piix_set_irq_level(piix, pirq, level);
 }
 
-static void piix4_set_irq(void *opaque, int irq_num, int level)
-{
-    int i, pic_irq, pic_level;
-    PIIXState *s = opaque;
-    PCIBus *bus = pci_get_bus(&s->dev);
-
-    /* now we change the pic irq level according to the piix irq mappings */
-    /* XXX: optimize */
-    pic_irq = s->dev.config[PIIX_PIRQCA + irq_num];
-    if (pic_irq < ISA_NUM_IRQS) {
-        /* The pic level is the logical OR of all the PCI irqs mapped to it. */
-        pic_level = 0;
-        for (i = 0; i < PIIX_NUM_PIRQS; i++) {
-            if (pic_irq == s->dev.config[PIIX_PIRQCA + i]) {
-                pic_level |= pci_bus_get_irq_level(bus, i);
-            }
-        }
-        qemu_set_irq(s->pic.in_irqs[pic_irq], pic_level);
-    }
-}
-
 /*
  * Return the global irq number corresponding to a given device irq
  * pin. We could also use the bus number to have a more precise mapping.
@@ -275,7 +254,7 @@ static int piix4_post_load(void *opaque, int version_id)
         s->rcr = 0;
     }
 
-    return 0;
+    return piix3_post_load(opaque, version_id);
 }
 
 static int piix3_pre_save(void *opaque)
@@ -585,7 +564,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     /* RTC */
     s->rtc.irq = qdev_get_gpio_in(DEVICE(&s->pic), s->rtc.isairq);
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, piix4_pci_slot_get_pirq, s,
+    pci_bus_irqs(pci_bus, piix_set_irq, piix4_pci_slot_get_pirq, s,
                  PIIX_NUM_PIRQS);
 }
 
@@ -603,6 +582,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
+    k->config_write = piix_write_config;
     k->realize = piix4_realize;
     k->vendor_id = PCI_VENDOR_ID_INTEL;
     k->device_id = PCI_DEVICE_ID_INTEL_82371AB_0;
-- 
2.37.3



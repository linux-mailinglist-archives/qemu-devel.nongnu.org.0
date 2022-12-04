Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD285641F29
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:13:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uLd-0002Kc-7W; Sun, 04 Dec 2022 14:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLV-0002Hk-FN; Sun, 04 Dec 2022 14:08:13 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLT-0001gV-N9; Sun, 04 Dec 2022 14:08:13 -0500
Received: by mail-ej1-x62d.google.com with SMTP id vp12so23072386ejc.8;
 Sun, 04 Dec 2022 11:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7NivgS1KO7sUwU/2krq9nI7J+Chmc9A73/Pj8jwDcRA=;
 b=ID4rOcPXjprMrPXvKqoxD280h70qeNdsRMbQEEqESs/plq2Sp6bJ5eYopjnubUwkMz
 6UH9T3JV4SKy2djpeUpUGGn9Lm0UYeAu1pnXwS74QsTvQZ8Od0id4Q9TSS8hXVp/IO0g
 SsMqpGYWGDLkhC+hSqaqrLHPoXEKPLyBYGrEVkHIbdzD80iJSWbwZFakz585PC9riP2Y
 3eYct0U6Y8EE8KDll6R6FAMtOLbVM7Fk3qgdnCt7LA+RVGxTCdHTca0bqZyz1qenAi5s
 A3AGmgF53ZZIxOkI8lEe/Cwe53rhe0jfT1Ocx4DSP/cvRADWmvLpLulMjYADAbcBpzpK
 Eh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7NivgS1KO7sUwU/2krq9nI7J+Chmc9A73/Pj8jwDcRA=;
 b=qqoPjcQMQwyPJIqBKk/mx1LBODFLe79idUmj7vXK8yvh2A8Ys6GLhe3zkPOCegPDTn
 MML9lMeVDf9jQPexa+wLdw0oSe1YgN3uq9VsyOR19xOc0krXP2JZMH6nID8QUztKnlok
 II1DHVEBgStgBB7xfULU54T53AEcV15ZTUBQRLxYXiQILJahJPSGRyZ5KbpR6945YGJ2
 YBJtfl3Ty2ew+jG9CnkPDSfuSQ5Zo6bOR8XSE1fSTKcZStIEJr0Dnu554qxsG6uUa3kq
 3MgFYvWQX5eZHnr7/tk99Go6/0NeAaagZ3OU1Pu35OdknIdSmY65bRWNvWbzS3HnUTtS
 d4fA==
X-Gm-Message-State: ANoB5plgjdFdgmYNDWEWxG6nDTu3XJx91hNZKvnItqCPwoO5FZC6hBYE
 BwqVZbOMprXE2BrQknUFj8tUeReoz60=
X-Google-Smtp-Source: AA0mqf4Bd/EsweCjn0WQumsDedsai1sKW808pdJFBiCX/Vh4naTbSbc/jMYdm6lp1aJA7AQqF1K4zA==
X-Received: by 2002:a17:907:8c83:b0:7bf:4ac7:56e4 with SMTP id
 td3-20020a1709078c8300b007bf4ac756e4mr8636466ejc.39.1670180890382; 
 Sun, 04 Dec 2022 11:08:10 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:08:10 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 30/32] hw/isa/piix: Consolidate IRQ triggering
Date: Sun,  4 Dec 2022 20:05:51 +0100
Message-Id: <20221204190553.3274-31-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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

Speeds up PIIX4 which resolves an old TODO.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221022150508.26830-41-shentey@gmail.com>
---
 hw/isa/piix.c | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 3d1659e5fd..d05f1aa4ff 100644
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
@@ -592,7 +571,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     /* RTC */
     s->rtc.irq = qdev_get_gpio_in(DEVICE(&s->pic), s->rtc.isairq);
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, piix4_pci_slot_get_pirq, s,
+    pci_bus_irqs(pci_bus, piix_set_irq, piix4_pci_slot_get_pirq, s,
                  PIIX_NUM_PIRQS);
 }
 
@@ -610,6 +589,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
+    k->config_write = piix_write_config;
     k->realize = piix4_realize;
     k->vendor_id = PCI_VENDOR_ID_INTEL;
     k->device_id = PCI_DEVICE_ID_INTEL_82371AB_0;
-- 
2.38.1



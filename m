Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA2F6AA953
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 12:42:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYQGG-0003VX-Bn; Sat, 04 Mar 2023 06:41:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYQG5-0003TH-OG; Sat, 04 Mar 2023 06:41:01 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYQG3-0008St-Vz; Sat, 04 Mar 2023 06:41:01 -0500
Received: by mail-ed1-x52a.google.com with SMTP id o12so20144429edb.9;
 Sat, 04 Mar 2023 03:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677930057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=auw8G+UNlizKXHkb7A+0ZKw2fJCrhI3+d5OFW1QmeMc=;
 b=EOqxc6X6YRqXhiRUSG1ZmYqkMoJ2wI5THCAoB32ZIDDW0ZoL8ljBWiNknsDV+OUAkE
 rBm5BL7D04LY4Ay12gscJtwQcn4uDHyocjStHPY2zqe5WEG7nrLFTVBnZzRNbe6a2Vh3
 iuT8jfxM1XBvpHeKd+c+GhvjocB3e/qhMHXGsVikQBA622gsa+ixqY6CTDFnYzHSP622
 i+CmAi57eggGa+RlLYDSlvbECv1XaVoRSGpo8aNfKqTvg5kNzg4K+Dq0Uu5QTscMWoKu
 /DkJrhZOmA/s2EZLjCule6OcCPyEG/FN6y3BkxVWPdCOLNjqsYjjA+hbzZKgdt0E667E
 ZJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677930057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=auw8G+UNlizKXHkb7A+0ZKw2fJCrhI3+d5OFW1QmeMc=;
 b=xrqArD1OKD7vNVNaPiwpq/nT+fhC1NF8RsPYFeFvoPjJyAZWhTswF5HLuYRqypU6hK
 6WUnv5kGBAPfzqK/3OLGdW3bpOqGErxDwH6pjk+43rHSo8us8wWwx3ANlKjx6TLoo9rn
 z+Ga/+KmpFnoZigLoHpMExP7RATF8xxnmW1m+CcBg4VMyfwFf7k1IYALb6S1pHM/02ek
 NbWcsQ4eZXiWeh2rSRgj9qg5BQ4c3eyUt7//0bFgjm3DVI90sWv/auBDwEiNamo2bU6y
 9w7tX2/MeOtX6jU8fBK0OyAIfsJv+Cqat0ELYTS5cYbl8yYTWNkMrgh9gBNb2l9epoDJ
 TxLw==
X-Gm-Message-State: AO0yUKUo6efnqGNHbPT+Pf5o+2LkfQFl/eyu1lrSKnhMtEqhSc0KU3NU
 Gpm+4fpI5B4Kac7oLXCfdt4uUwxrGX8=
X-Google-Smtp-Source: AK7set9O3s38jTClmVaiSPY7awBwg4IbqQ40dkAg4YAe6G79BruDJrkqLtSngvF7x9z2HIsUqSM2Fg==
X-Received: by 2002:a17:907:c783:b0:87d:f29:3a16 with SMTP id
 tz3-20020a170907c78300b0087d0f293a16mr4998405ejc.34.1677930057246; 
 Sat, 04 Mar 2023 03:40:57 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-004-175.77.183.pool.telefonica.de. [77.183.4.175])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a17090686c600b008c44438734csm1993248ejy.113.2023.03.04.03.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 03:40:56 -0800 (PST)
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
Subject: [PATCH 1/5] hw/isa/vt82c686: Fix wiring of PIC -> CPU interrupt
Date: Sat,  4 Mar 2023 12:40:39 +0100
Message-Id: <20230304114043.121024-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230304114043.121024-1-shentey@gmail.com>
References: <20230304114043.121024-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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

Commit bb98e0f59cde ("hw/isa/vt82c686: Remove intermediate IRQ forwarder")
passes s->cpu_intr to i8259_init() in via_isa_realize() directly. However,
s->cpu_intr isn't initialized yet since that happens after the south
bridge's pci_realize_and_unref() in board code. Fix this by initializing s-
>cpu_intr before realizing the south bridge.

Fixes: bb98e0f59cde ("hw/isa/vt82c686: Remove intermediate IRQ forwarder")
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c   |  3 ++-
 hw/mips/fuloong2e.c |  9 +++++----
 hw/ppc/pegasos2.c   | 10 ++++++----
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index f4c40965cd..8900d87f59 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -578,6 +578,8 @@ static void via_isa_init(Object *obj)
     object_initialize_child(obj, "uhci2", &s->uhci[1], TYPE_VT82C686B_USB_UHCI);
     object_initialize_child(obj, "ac97", &s->ac97, TYPE_VIA_AC97);
     object_initialize_child(obj, "mc97", &s->mc97, TYPE_VIA_MC97);
+
+    qdev_init_gpio_out(DEVICE(obj), &s->cpu_intr, 1);
 }
 
 static const TypeInfo via_isa_info = {
@@ -606,7 +608,6 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     ISABus *isa_bus;
     int i;
 
-    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
     isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
                           errp);
 
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index cfc8ca6ae4..30944f8fe7 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -295,14 +295,15 @@ static void mips_fuloong2e_init(MachineState *machine)
     pci_bus = bonito_init((qemu_irq *)&(env->irq[2]));
 
     /* South bridge -> IP5 */
-    pci_dev = pci_create_simple_multifunction(pci_bus,
-                                              PCI_DEVFN(FULOONG2E_VIA_SLOT, 0),
-                                              true, TYPE_VT82C686B_ISA);
+    pci_dev = pci_new_multifunction(PCI_DEVFN(FULOONG2E_VIA_SLOT, 0), true,
+                                    TYPE_VT82C686B_ISA);
+    qdev_connect_gpio_out(DEVICE(pci_dev), 0, env->irq[5]);
+    pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
+
     object_property_add_alias(OBJECT(machine), "rtc-time",
                               object_resolve_path_component(OBJECT(pci_dev),
                                                             "rtc"),
                               "date");
-    qdev_connect_gpio_out(DEVICE(pci_dev), 0, env->irq[5]);
 
     dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "ide"));
     pci_ide_create_devs(PCI_DEVICE(dev));
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 7cc375df05..b0ada9c963 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -159,13 +159,15 @@ static void pegasos2_init(MachineState *machine)
     pci_bus = mv64361_get_pci_bus(pm->mv, 1);
 
     /* VIA VT8231 South Bridge (multifunction PCI device) */
-    via = OBJECT(pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0),
-                                                 true, TYPE_VT8231_ISA));
+    via = OBJECT(pci_new_multifunction(PCI_DEVFN(12, 0), true,
+                                       TYPE_VT8231_ISA));
+    qdev_connect_gpio_out(DEVICE(via), 0,
+                          qdev_get_gpio_in_named(pm->mv, "gpp", 31));
+    pci_realize_and_unref(PCI_DEVICE(via), pci_bus, &error_fatal);
+
     object_property_add_alias(OBJECT(machine), "rtc-time",
                               object_resolve_path_component(via, "rtc"),
                               "date");
-    qdev_connect_gpio_out(DEVICE(via), 0,
-                          qdev_get_gpio_in_named(pm->mv, "gpp", 31));
 
     dev = PCI_DEVICE(object_resolve_path_component(via, "ide"));
     pci_ide_create_devs(dev);
-- 
2.39.2



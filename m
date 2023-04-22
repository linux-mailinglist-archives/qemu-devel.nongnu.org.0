Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EBA6EB9DC
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 17:09:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqEq9-0001yW-Hv; Sat, 22 Apr 2023 11:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEq7-0001xd-Fi; Sat, 22 Apr 2023 11:07:51 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEq3-0005CJ-S1; Sat, 22 Apr 2023 11:07:50 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-94f910ea993so382824366b.3; 
 Sat, 22 Apr 2023 08:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682176065; x=1684768065;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oSyaRKarDKKAE3S+Y3WYtZewUlhiFyd+2Up5yo8qnR0=;
 b=ZHcqzCllE+1G0mmDIuAKcdPSJBj3rbZ9+5RY8vvkpwX6txaikNkJ7bC64vY7TKXzjt
 1ZbCqCAg7efn3PXF8QDG4bflHAI5OEuK3AZBUWgq0A8b3ZF5erQ4Jj+fPKXxmh3FVNE5
 65JTsW2MRBpRrhn+Ely61dxMa9nd5/AXZrR95bTZf3WbSjN39Nr8Fo5FlLVBi3A79Gyu
 B90mDNrQAMzZN1wD88Is7BiANoluD9zgJUSqy0x5yAb1seQS0V8v73K/r9tDGwnDq6HS
 Iwknvxl6JG/QWUEoikCEaUBDO4JuIeNCRmwY6Tq+P9UEr76WUVKjv+Lp3SOtTmP260BG
 TD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682176065; x=1684768065;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oSyaRKarDKKAE3S+Y3WYtZewUlhiFyd+2Up5yo8qnR0=;
 b=IHefO7dGKRWfL2SHvJ2wqqurxdzLcxpx8HX2Lod8vcL8ci021ra/1V0EnKmcTL9FXN
 jIHdfRwX57vr7U8WlZ85E/ut5fcxh787qJ++Z0vu6+3JJ6CspJEkQf3C1PnNPgC2vUVr
 DJlvmey58ui+m670TSx4YeeHa98zFgsEgYrKJ3ip3kLH9e1zqWTu6jYOJ1TyIwpHhEkM
 axEsvcU7QoEwtiv9nqa/PMpC+ba7EyC7pcNg9ikyw/fTnqHtfhmcDRHAFFtiABus7uu+
 eirm1J8ZeKqgJXs5MbXi5c7by7wUqvFeZI/+W4wFztyZciETnORUf1LoJNOmP98Cq5Qp
 mnNg==
X-Gm-Message-State: AAQBX9d3BRX+NYBhc7PdSm4iaCb+bLlELwkCtiZbyTpPZ2YGTNCE5zz9
 2FeLNHCZvt8v36RsD3h5CdbDzpy+WDE=
X-Google-Smtp-Source: AKy350b1WW+qHr8c6PZ8N9w+2MfT8uVqrkgCo3awRAAhudOI3xgDirL4SAsRRDVFhI2HWUsFDmSQdA==
X-Received: by 2002:a17:906:dc8b:b0:953:8322:a99f with SMTP id
 cs11-20020a170906dc8b00b009538322a99fmr7410806ejc.0.1682176065590; 
 Sat, 22 Apr 2023 08:07:45 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-191-017-015.77.191.pool.telefonica.de. [77.191.17.15])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a170906844700b0094f7b713e40sm3300108ejy.126.2023.04.22.08.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 08:07:45 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 09/13] hw/ide/piix: Disuse isa_get_irq()
Date: Sat, 22 Apr 2023 17:07:24 +0200
Message-Id: <20230422150728.176512-10-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230422150728.176512-1-shentey@gmail.com>
References: <20230422150728.176512-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

isa_get_irq() asks for an ISADevice which piix-ide doesn't provide.
Passing a NULL pointer works but causes the isabus global to be used
then. By fishing out TYPE_ISA_BUS from the QOM tree it is possible to
achieve the same as using isa_get_irq().

This is an alternative solution to commit 9405d87be25d 'hw/ide: Fix
crash when plugging a piix3-ide device into the x-remote machine' which
allows for cleaning up the ISA API while keeping PIIX IDE functions
user-createable.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/piix.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 6942b484f9..a3a15dc7db 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -104,7 +104,8 @@ static void piix_ide_reset(DeviceState *dev)
     pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
 }
 
-static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
+static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, ISABus *isa_bus,
+                              Error **errp)
 {
     static const struct {
         int iobase;
@@ -124,7 +125,8 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
                          object_get_typename(OBJECT(d)), i);
         return false;
     }
-    ide_bus_init_output_irq(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
+    ide_bus_init_output_irq(&d->bus[i],
+                            isa_bus_get_irq(isa_bus, port_info[i].isairq));
 
     bmdma_init(&d->bus[i], &d->bmdma[i], d);
     ide_bus_register_restart_cb(&d->bus[i]);
@@ -136,14 +138,29 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 {
     PCIIDEState *d = PCI_IDE(dev);
     uint8_t *pci_conf = dev->config;
+    ISABus *isa_bus;
+    bool ambiguous;
 
     pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
 
     bmdma_init_ops(d, &piix_bmdma_ops);
     pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_ops);
 
+    isa_bus = ISA_BUS(object_resolve_path_type("", TYPE_ISA_BUS, &ambiguous));
+    if (ambiguous) {
+        error_setg(errp,
+                   "More than one ISA bus found while %s supports only one",
+                   object_get_typename(OBJECT(d)));
+        return;
+    }
+    if (!isa_bus) {
+        error_setg(errp, "No ISA bus found while %s requires one",
+                   object_get_typename(OBJECT(d)));
+        return;
+    }
+
     for (unsigned i = 0; i < 2; i++) {
-        if (!pci_piix_init_bus(d, i, errp)) {
+        if (!pci_piix_init_bus(d, i, isa_bus, errp)) {
             return;
         }
     }
-- 
2.40.0



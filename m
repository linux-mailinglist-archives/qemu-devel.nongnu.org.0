Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C790859CBD6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:59:48 +0200 (CEST)
Received: from localhost ([::1]:57430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQGOZ-0007dY-Uq
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQGAA-0003zP-Qz; Mon, 22 Aug 2022 18:44:54 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQGA8-0007yv-Py; Mon, 22 Aug 2022 18:44:54 -0400
Received: by mail-ej1-x634.google.com with SMTP id u15so15401217ejt.6;
 Mon, 22 Aug 2022 15:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=fGOM0Xm04ckp9MC5UXHn04xykoRQdp6Tte8ORS+7Hbs=;
 b=eZ4J6T9D3YH9BIN8VEqCAEwuUx4hYehIMDEk5HhJYjw4vV/ecbSeSOOedSHaXqy7k/
 9fxkG4byw8C2JdEyKF6uMRlavVuBNrUrritmeV2FSXRdAIx5v+2Q18DICSoED3Y4zBP2
 N4Een61bIcULOqECuXLvALX8milzGzWQIoDC3eZ7kvhUJa7YgBTu8L4rJDN5yGPj7e7i
 hdNhB9eEqLHteNbtrvx9VLd4QepaDvAmz+YHAGIhEumW3BWX0QXzIfJ9jU89IIoIFLKG
 30wKKeLdAlnfPSQAwH6B56BPjOwVsC1eNZamahsRS3uVwd3vMt+W+PDlksOSltFXMJGR
 PufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=fGOM0Xm04ckp9MC5UXHn04xykoRQdp6Tte8ORS+7Hbs=;
 b=N/hJJVlMddl67BZapYnFbOiyoxYCae8IeWJTCbuNcw+ju2pPBXWzbS+a7kr/S7xl7D
 mQI4Vau7BTMd+6heYpiik0qSz/eS1+UlzkSKU/huY9kzSZK9Ny+rLucjZU+MSPBs0Cmn
 7WL94Imh6ibQqRHSYSnAg4C/Og3+seZgC0v0N3IWf+MWJVgnXRRO8wjFnwy7oINRdEoz
 tC0uwJAdhpal/Wy2v/9GAy6SJHrgPpTS8ekv7D0h47Z74YNdiEnTkn/YSiQCNFT2yx2s
 gXrFHsLlRsOz/brXrXYAyDBXPpKloG/ANO+6Al57vwXEPIhpK4hBTSIhwfS3R02tgpRe
 3rYw==
X-Gm-Message-State: ACgBeo2WNivyclP8ZcSS5T86nMmI4hGZBQU1ocGnw3h/hsGNNRi/x26w
 LWcK1tXJdGODfbQNzdg2EVGCGj2IgLs=
X-Google-Smtp-Source: AA6agR4aUk5gdr6puV461k9Nj3QB9ZuUvWPXNq8RS7EK8mhoX0MDT9qCni5RLa37wTogYMEVIIaP3g==
X-Received: by 2002:a17:907:2bc8:b0:73d:6de9:6fd3 with SMTP id
 gv8-20020a1709072bc800b0073d6de96fd3mr6997604ejc.752.1661208290891; 
 Mon, 22 Aug 2022 15:44:50 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-070-107.77.183.pool.telefonica.de. [77.183.70.107])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a170906768400b0073d7b876621sm2455758ejm.205.2022.08.22.15.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 15:44:50 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 6/9] hw/isa/vt82c686: QOM'ify pm creation
Date: Tue, 23 Aug 2022 00:43:52 +0200
Message-Id: <20220822224355.11753-7-shentey@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220822224355.11753-1-shentey@gmail.com>
References: <20220822224355.11753-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c   | 9 +++++++++
 hw/mips/fuloong2e.c | 2 +-
 hw/ppc/pegasos2.c   | 2 +-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index c2f2e0039a..b964d1a760 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -548,6 +548,7 @@ struct ViaISAState {
     ViaSuperIOState via_sio;
     PCIIDEState ide;
     UHCIState uhci[2];
+    ViaPMState pm;
 };
 
 static const VMStateDescription vmstate_via = {
@@ -637,6 +638,12 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
             return;
         }
     }
+
+    /* Function 4: Power Management */
+    qdev_prop_set_int32(DEVICE(&s->pm), "addr", d->devfn + 4);
+    if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
+        return;
+    }
 }
 
 /* TYPE_VT82C686B_ISA */
@@ -679,6 +686,7 @@ static void vt82c686b_init(Object *obj)
     ViaISAState *s = VIA_ISA(obj);
 
     object_initialize_child(obj, "sio", &s->via_sio, TYPE_VT82C686B_SUPERIO);
+    object_initialize_child(obj, "pm", &s->pm, TYPE_VT82C686B_PM);
 }
 
 static void vt82c686b_class_init(ObjectClass *klass, void *data)
@@ -742,6 +750,7 @@ static void vt8231_init(Object *obj)
     ViaISAState *s = VIA_ISA(obj);
 
     object_initialize_child(obj, "sio", &s->via_sio, TYPE_VT8231_SUPERIO);
+    object_initialize_child(obj, "pm", &s->pm, TYPE_VT8231_PM);
 }
 
 static void vt8231_class_init(ObjectClass *klass, void *data)
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index c375107c53..f05474348f 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -205,7 +205,7 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
                                           TYPE_VT82C686B_ISA);
     qdev_connect_gpio_out(DEVICE(dev), 0, intc);
 
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
+    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(dev), "pm"));
     *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
 
     /* Audio support */
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index a1b851638a..4e29e42fba 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -166,7 +166,7 @@ static void pegasos2_init(MachineState *machine)
                           qdev_get_gpio_in_named(pm->mv, "gpp", 31));
 
     /* VT8231 function 4: Power Management Controller */
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 4), TYPE_VT8231_PM);
+    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(dev), "pm"));
     i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
     spd_data = spd_data_generate(DDR, machine->ram_size);
     smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
-- 
2.37.2



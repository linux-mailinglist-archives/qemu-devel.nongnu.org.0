Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A836AA952
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 12:42:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYQGN-0003ai-OJ; Sat, 04 Mar 2023 06:41:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYQGA-0003Uo-Gv; Sat, 04 Mar 2023 06:41:06 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYQG8-0008UV-7N; Sat, 04 Mar 2023 06:41:05 -0500
Received: by mail-ed1-x533.google.com with SMTP id o15so20037724edr.13;
 Sat, 04 Mar 2023 03:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677930062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x436vop8YejkrA2/Ijav3pM+igC8BPCpLg4ZKo7COug=;
 b=eS+c3+lR7hDCN0jR4bnvAWXCkn3gMTasgeZR4HRtflxq5KeLIHy0BhGq/i1e6Nop0E
 wvZmRrLcyp2BSkmV/F95BPSB9yRw/BQF9WqeEOnu36ZsJ+CwdUonHdPHv6LEHDQtLvFM
 KfpkLsofyBC278okqKWH8tE6Xn1e+oohZxF8S2W93auoI7IGJsAWy+UeoH/P+XMovf75
 +qbvoivbhjIBIY2lFTuKgbGHJGqW0nA6EW44Lt3SAmp37U90bGcy5La+T6HZ0U2FICs5
 Q9t4tcBUXXM33HdGWU7rchbF1b8I/EHbAWujn07PAznYHScpETnUWuZkZrgfqx/eS15Z
 fNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677930062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x436vop8YejkrA2/Ijav3pM+igC8BPCpLg4ZKo7COug=;
 b=zt5HF6A5IJuMdO4MGNfYx/YyX/wdgH3iDqaOyEZbxcxId0mf0eBGB+wopSYMDM/ShZ
 b4kdoA1mT2etO1i0kAoLsaIH0MNGWqiJjW+B0/rhnyXxVtLLNQWjniST5kOY7+rnEv5T
 ifUG9IYtywj236TPXYd3E5ee+wsk2EmIhn7tnOn1WxQ4WnzFsRpeYl97UtEuBbpNwH/D
 lmx97d5InucmwAp/h7Bs6xHxGnltZOXA6ep3u2cFVvEPk9kbEXI58sOfsAwp+TaPX/xK
 PCqQFJ0j+VL3dUcWoeBuXkrZjgz/YEPupgQO2z9BrX7aVY9k4WttOqxwqJsqPun6+Z7q
 Jj1g==
X-Gm-Message-State: AO0yUKX1Rd3YFqz5QOtftu5XEl2E0e7KozksmB/dw8NkZZziItU9X558
 50dwuxPJU2Q5nErtqXVoKBNLJD8FQFU=
X-Google-Smtp-Source: AK7set9V9qy0j8kS7Do47W2iu3A5rTbt5/NzsJfRKupUxtjSHYjYJestwe7K01SWMUz71BldKz1+YQ==
X-Received: by 2002:a17:907:7fab:b0:8b2:8876:6a3c with SMTP id
 qk43-20020a1709077fab00b008b288766a3cmr6125476ejc.29.1677930062170; 
 Sat, 04 Mar 2023 03:41:02 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-004-175.77.183.pool.telefonica.de. [77.183.4.175])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a17090686c600b008c44438734csm1993248ejy.113.2023.03.04.03.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 03:41:01 -0800 (PST)
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
Subject: [PATCH 5/5] hw/pci/pci: Remove multifunction parameter from
 pci_new_multifunction()
Date: Sat,  4 Mar 2023 12:40:43 +0100
Message-Id: <20230304114043.121024-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230304114043.121024-1-shentey@gmail.com>
References: <20230304114043.121024-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
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

There is also pci_new() which creates non-multifunction PCI devices.
Accordingly the parameter is always set to true when a multi function PCI
device is to be created.

The reason for the parameter's existence seems to be that it is used in the
internal PCI code as well which is the only location where it gets set to
false. This one usage can be resolved by factoring out an internal helper
function.

Remove this redundant, error-prone parameter.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/pci/pci.h |  3 +--
 hw/i386/pc_q35.c     |  6 +++---
 hw/mips/fuloong2e.c  |  2 +-
 hw/pci-host/sabre.c  |  6 ++----
 hw/pci/pci.c         | 13 +++++++++----
 hw/ppc/pegasos2.c    |  3 +--
 hw/sparc64/sun4u.c   |  5 ++---
 7 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 830407a5b9..cbf3ebea4e 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -572,8 +572,7 @@ pci_set_quad_by_mask(uint8_t *config, uint64_t mask, uint64_t reg)
     pci_set_quad(config, (~mask & val) | (mask & rval));
 }
 
-PCIDevice *pci_new_multifunction(int devfn, bool multifunction,
-                                    const char *name);
+PCIDevice *pci_new_multifunction(int devfn, const char *name);
 PCIDevice *pci_new(int devfn, const char *name);
 bool pci_realize_and_unref(PCIDevice *dev, PCIBus *bus, Error **errp);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 65a862b66d..b41fc2b879 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -99,12 +99,12 @@ static int ehci_create_ich9_with_companions(PCIBus *bus, int slot)
         return -1;
     }
 
-    ehci = pci_new_multifunction(PCI_DEVFN(slot, 7), true, name);
+    ehci = pci_new_multifunction(PCI_DEVFN(slot, 7), name);
     pci_realize_and_unref(ehci, bus, &error_fatal);
     usbbus = QLIST_FIRST(&ehci->qdev.child_bus);
 
     for (i = 0; i < 3; i++) {
-        uhci = pci_new_multifunction(PCI_DEVFN(slot, comp[i].func), true,
+        uhci = pci_new_multifunction(PCI_DEVFN(slot, comp[i].func),
                                      comp[i].name);
         qdev_prop_set_string(&uhci->qdev, "masterbus", usbbus->name);
         qdev_prop_set_uint32(&uhci->qdev, "firstport", comp[i].port);
@@ -236,7 +236,7 @@ static void pc_q35_init(MachineState *machine)
     phb = PCI_HOST_BRIDGE(q35_host);
     host_bus = phb->bus;
     /* create ISA bus */
-    lpc = pci_new_multifunction(PCI_DEVFN(ICH9_LPC_DEV, ICH9_LPC_FUNC), true,
+    lpc = pci_new_multifunction(PCI_DEVFN(ICH9_LPC_DEV, ICH9_LPC_FUNC),
                                 TYPE_ICH9_LPC_DEVICE);
     qdev_prop_set_bit(DEVICE(lpc), "smm-enabled",
                       x86_machine_is_smm_enabled(x86ms));
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 30944f8fe7..0d4a45bd4f 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -295,7 +295,7 @@ static void mips_fuloong2e_init(MachineState *machine)
     pci_bus = bonito_init((qemu_irq *)&(env->irq[2]));
 
     /* South bridge -> IP5 */
-    pci_dev = pci_new_multifunction(PCI_DEVFN(FULOONG2E_VIA_SLOT, 0), true,
+    pci_dev = pci_new_multifunction(PCI_DEVFN(FULOONG2E_VIA_SLOT, 0),
                                     TYPE_VT82C686B_ISA);
     qdev_connect_gpio_out(DEVICE(pci_dev), 0, env->irq[5]);
     pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
diff --git a/hw/pci-host/sabre.c b/hw/pci-host/sabre.c
index 949ecc21f2..dcb2e230b6 100644
--- a/hw/pci-host/sabre.c
+++ b/hw/pci-host/sabre.c
@@ -387,14 +387,12 @@ static void sabre_realize(DeviceState *dev, Error **errp)
     pci_setup_iommu(phb->bus, sabre_pci_dma_iommu, s->iommu);
 
     /* APB secondary busses */
-    pci_dev = pci_new_multifunction(PCI_DEVFN(1, 0), true,
-                                    TYPE_SIMBA_PCI_BRIDGE);
+    pci_dev = pci_new_multifunction(PCI_DEVFN(1, 0), TYPE_SIMBA_PCI_BRIDGE);
     s->bridgeB = PCI_BRIDGE(pci_dev);
     pci_bridge_map_irq(s->bridgeB, "pciB", pci_simbaB_map_irq);
     pci_realize_and_unref(pci_dev, phb->bus, &error_fatal);
 
-    pci_dev = pci_new_multifunction(PCI_DEVFN(1, 1), true,
-                                    TYPE_SIMBA_PCI_BRIDGE);
+    pci_dev = pci_new_multifunction(PCI_DEVFN(1, 1), TYPE_SIMBA_PCI_BRIDGE);
     s->bridgeA = PCI_BRIDGE(pci_dev);
     pci_bridge_map_irq(s->bridgeA, "pciA", pci_simbaA_map_irq);
     pci_realize_and_unref(pci_dev, phb->bus, &error_fatal);
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index c2e14f000e..09907c966e 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2089,8 +2089,8 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
     pci_dev->msi_trigger = pci_msi_trigger;
 }
 
-PCIDevice *pci_new_multifunction(int devfn, bool multifunction,
-                                 const char *name)
+static PCIDevice *pci_new_internal(int devfn, bool multifunction,
+                                   const char *name)
 {
     DeviceState *dev;
 
@@ -2100,9 +2100,14 @@ PCIDevice *pci_new_multifunction(int devfn, bool multifunction,
     return PCI_DEVICE(dev);
 }
 
+PCIDevice *pci_new_multifunction(int devfn, const char *name)
+{
+    return pci_new_internal(devfn, true, name);
+}
+
 PCIDevice *pci_new(int devfn, const char *name)
 {
-    return pci_new_multifunction(devfn, false, name);
+    return pci_new_internal(devfn, false, name);
 }
 
 bool pci_realize_and_unref(PCIDevice *dev, PCIBus *bus, Error **errp)
@@ -2113,7 +2118,7 @@ bool pci_realize_and_unref(PCIDevice *dev, PCIBus *bus, Error **errp)
 PCIDevice *pci_create_simple_multifunction(PCIBus *bus, int devfn,
                                            const char *name)
 {
-    PCIDevice *dev = pci_new_multifunction(devfn, true, name);
+    PCIDevice *dev = pci_new_multifunction(devfn, name);
     pci_realize_and_unref(dev, bus, &error_fatal);
     return dev;
 }
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index b0ada9c963..b8c8a60804 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -159,8 +159,7 @@ static void pegasos2_init(MachineState *machine)
     pci_bus = mv64361_get_pci_bus(pm->mv, 1);
 
     /* VIA VT8231 South Bridge (multifunction PCI device) */
-    via = OBJECT(pci_new_multifunction(PCI_DEVFN(12, 0), true,
-                                       TYPE_VT8231_ISA));
+    via = OBJECT(pci_new_multifunction(PCI_DEVFN(12, 0), TYPE_VT8231_ISA));
     qdev_connect_gpio_out(DEVICE(via), 0,
                           qdev_get_gpio_in_named(pm->mv, "gpp", 31));
     pci_realize_and_unref(PCI_DEVICE(via), pci_bus, &error_fatal);
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index a25e951f9d..b5d5a82c50 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -612,7 +612,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     pci_busA->slot_reserved_mask = 0xfffffff1;
     pci_busB->slot_reserved_mask = 0xfffffff0;
 
-    ebus = pci_new_multifunction(PCI_DEVFN(1, 0), true, TYPE_EBUS);
+    ebus = pci_new_multifunction(PCI_DEVFN(1, 0), TYPE_EBUS);
     qdev_prop_set_uint64(DEVICE(ebus), "console-serial-base",
                          hwdef->console_serial_base);
     pci_realize_and_unref(ebus, pci_busA, &error_fatal);
@@ -648,8 +648,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
 
         if (!nd->model || strcmp(nd->model, "sunhme") == 0) {
             if (!onboard_nic) {
-                pci_dev = pci_new_multifunction(PCI_DEVFN(1, 1),
-                                                   true, "sunhme");
+                pci_dev = pci_new_multifunction(PCI_DEVFN(1, 1), "sunhme");
                 bus = pci_busA;
                 memcpy(&macaddr, &nd->macaddr.a, sizeof(MACAddr));
                 onboard_nic = true;
-- 
2.39.2



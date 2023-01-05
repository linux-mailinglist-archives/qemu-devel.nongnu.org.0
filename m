Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D23165F064
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 16:47:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDSQc-0002r7-MC; Thu, 05 Jan 2023 10:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pDSQb-0002qM-8u
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 10:45:13 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pDSQZ-0003eQ-3o
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 10:45:13 -0500
Received: by mail-ed1-x52a.google.com with SMTP id i15so53404706edf.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 07:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9at6yMfSF3yhy1XwRFnCUsppDrrfcpjNVZibx0hMuR0=;
 b=mhej6bA1Tv3dBLbT3/MotdmkoanPGI9G2E7aJUnE13a3wYG9gHMZBJ31p5Lf8sEa9q
 A6l2nJ/LwCxaXEpsABFkpWUaxu7LCy9xrrX+r0qOiZbXS7BRU/OxMnNr6M/FKIEHEfmG
 qV++oRXKFwt8Vnq6D7Ns8JkBhNLYKqLHfdBMPQD1cp9Ud8Q8nj+cV/WcCnxmIM4ZkYX9
 J6bFmdOTOKzD/qYO06t0lWVZnUH6qapkOz8AQ1zKCQMg+ux4EyeJITz0mJnrDJP6emkH
 6K/url7d9+1hka4SFmxrxTQiBQVWbbfsasyVqreu22976hI+XJ3VTQeersPJnP35qfZg
 J4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9at6yMfSF3yhy1XwRFnCUsppDrrfcpjNVZibx0hMuR0=;
 b=V9D84C42/qr0LesFX1BAjMf0uU6vsibEUTk6GHL/iex3EiCD3GX/R+vO+s27vh9m3M
 hUzgp6j5dMXHUJYdI0d5itGlzIq2Zbr+rR2AKeAhcd2eUMTI402JBxaNovIK/69AFqiZ
 EKjlRpxXMNJlK6XUuiZ3WDF/5+IFkTHBrAxE/AoodTNloQpkrmWdvJC+RvuyDN7HmHJS
 MuTpwbz6cs66zFoKZPrmOmpHfeU2KJAX7CAogbriMJA8KfmZBDU116BUhpfxLd8h0BRt
 Rx7RB5WsqqDjgsFZC+GD76RS0l3BahFN78ZQSuc9+2aU7QiBfJJvW2JJWqZupT8Cn+PM
 QMzA==
X-Gm-Message-State: AFqh2krGqO9RSmuGxacGmHIhULx/5ddYgWVGdSClMxk9MolWULxMxk5u
 DX4Ap9qwypfoGVxT9OvhzOTFn3lH1B7odg==
X-Google-Smtp-Source: AMrXdXuov+hcmVdMCuKQEmKd7CpU+cbKm0i1MEUcG6fUt5qCRPbUcSHI/BLAhc9nB5H708JwGqDJxg==
X-Received: by 2002:aa7:d1d8:0:b0:467:692e:8148 with SMTP id
 g24-20020aa7d1d8000000b00467692e8148mr43633427edp.41.1672933509628; 
 Thu, 05 Jan 2023 07:45:09 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 dk28-20020a0564021d9c00b004856bba2c8bsm12371004edb.47.2023.01.05.07.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 07:45:09 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 2/2] hw/pci-host/bonito: Map PCI IRQs in board code
Date: Thu,  5 Jan 2023 16:44:40 +0100
Message-Id: <20230105154440.259361-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105154440.259361-1-shentey@gmail.com>
References: <20230105154440.259361-1-shentey@gmail.com>
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

PCI IRQ mapping is board specific, as could be seen by
pci_bonito_map_irq(). So move it to board code and rename it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/pci-host/bonito.h |  2 ++
 hw/mips/fuloong2e.c          | 22 ++++++++++++++++++++++
 hw/pci-host/bonito.c         | 24 ------------------------
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/include/hw/pci-host/bonito.h b/include/hw/pci-host/bonito.h
index b8ecf7870a..5ed0b48d51 100644
--- a/include/hw/pci-host/bonito.h
+++ b/include/hw/pci-host/bonito.h
@@ -12,6 +12,8 @@
 
 #include "qom/object.h"
 
+#define BONITO_IRQ_BASE 32
+
 #define TYPE_BONITO_PCI_HOST_BRIDGE "Bonito-pcihost"
 OBJECT_DECLARE_SIMPLE_TYPE(BonitoState, BONITO_PCI_HOST_BRIDGE)
 
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index f41e19dc3f..7ac5940741 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -200,6 +200,27 @@ static void main_cpu_reset(void *opaque)
     }
 }
 
+/* Map the original irq (0~3) to bonito irq (16~47, but 16~31 are unused) */
+static int pci_fuloong2e_map_irq(PCIDevice *pci_dev, int irq_num)
+{
+    int slot;
+
+    slot = PCI_SLOT(pci_dev->devfn);
+
+    switch (slot) {
+    case 5:   /* FULOONG2E_VIA_SLOT, SouthBridge, IDE, USB, ACPI, AC97, MC97 */
+        return irq_num % 4 + BONITO_IRQ_BASE;
+    case 6:   /* FULOONG2E_ATI_SLOT, VGA */
+        return 4 + BONITO_IRQ_BASE;
+    case 7:   /* FULOONG2E_RTL_SLOT, RTL8139 */
+        return 5 + BONITO_IRQ_BASE;
+    case 8 ... 12: /* PCI slot 1 to 4 */
+        return (slot - 8 + irq_num) + 6 + BONITO_IRQ_BASE;
+    default:  /* Unknown device, don't do any translation */
+        return irq_num;
+    }
+}
+
 /* Network support */
 static void network_init(PCIBus *pci_bus)
 {
@@ -297,6 +318,7 @@ static void mips_fuloong2e_init(MachineState *machine)
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, env->irq[2]);
     pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci"));
+    pci_bus_map_irqs(pci_bus, pci_fuloong2e_map_irq);
 
     /* South bridge -> IP5 */
     pci_dev = pci_create_simple_multifunction(pci_bus,
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 0ec437a623..ad1ca7e454 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -548,8 +548,6 @@ static const MemoryRegionOps bonito_spciconf_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-#define BONITO_IRQ_BASE 32
-
 static void pci_bonito_set_irq(void *opaque, int irq_num, int level)
 {
     BonitoState *s = opaque;
@@ -567,27 +565,6 @@ static void pci_bonito_set_irq(void *opaque, int irq_num, int level)
     }
 }
 
-/* map the original irq (0~3) to bonito irq (16~47, but 16~31 are unused) */
-static int pci_bonito_map_irq(PCIDevice *pci_dev, int irq_num)
-{
-    int slot;
-
-    slot = PCI_SLOT(pci_dev->devfn);
-
-    switch (slot) {
-    case 5:   /* FULOONG2E_VIA_SLOT, SouthBridge, IDE, USB, ACPI, AC97, MC97 */
-        return irq_num % 4 + BONITO_IRQ_BASE;
-    case 6:   /* FULOONG2E_ATI_SLOT, VGA */
-        return 4 + BONITO_IRQ_BASE;
-    case 7:   /* FULOONG2E_RTL_SLOT, RTL8139 */
-        return 5 + BONITO_IRQ_BASE;
-    case 8 ... 12: /* PCI slot 1 to 4 */
-        return (slot - 8 + irq_num) + 6 + BONITO_IRQ_BASE;
-    default:  /* Unknown device, don't do any translation */
-        return irq_num;
-    }
-}
-
 static void bonito_reset_hold(Object *obj)
 {
     PCIBonitoState *s = PCI_BONITO(obj);
@@ -635,7 +612,6 @@ static void bonito_host_realize(DeviceState *dev, Error **errp)
     phb->bus = pci_root_bus_new(dev, "pci", &bs->pci_mem, get_system_io(),
                                 PCI_DEVFN(5, 0), TYPE_PCI_BUS);
     pci_bus_irqs(phb->bus, pci_bonito_set_irq, dev, 32);
-    pci_bus_map_irqs(phb->bus, pci_bonito_map_irq);
 
     for (size_t i = 0; i < 3; i++) {
         char *name = g_strdup_printf("pci.lomem%zu", i);
-- 
2.39.0



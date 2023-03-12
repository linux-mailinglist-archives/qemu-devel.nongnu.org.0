Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6123E6B65CC
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 13:04:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbKPZ-0003Op-0m; Sun, 12 Mar 2023 08:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pbKPS-0003Mh-Nt
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 08:02:42 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pbKPP-0000J7-MV
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 08:02:42 -0400
Received: by mail-ed1-x529.google.com with SMTP id k10so38029268edk.13
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 05:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678622556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XntQLcfKBZ4bUALJ2KcKbFlzPaRdUkUn5f75iO8ImkQ=;
 b=IA1JYJLJIDXDZUXlU+gf06wttIV49eC8CDEPbQoPMi6TiveH2bC5JG+Q6UJenXeBlH
 OuqyVa2LJ8fbgwsD618aaUbMFhMSMFgpv6Yk3wUdJ3Iuz+vHUAPFqvXiz6XO3inbN+e3
 PdiHw6HTaXQDTKmin5QqC1M1AX4HbZjPhrO2xmpgVPMNrsZNKuLaD8594qaIknpFQc/0
 0r9ocRPyNvM+Cj15SU5hmeBYKtZ5MR/vsaLSsR3edIKqT2DjowYwrk0jq/5Ae26kjVPk
 0V1izQDgiS7e3CT/UILMHQt9YLh+blcAvCXAcQb+d3iI4mZ1DJ1K9EfHARqbPOml5JjV
 rvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678622556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XntQLcfKBZ4bUALJ2KcKbFlzPaRdUkUn5f75iO8ImkQ=;
 b=wpb5bVuEeFI80ZX5M5OuozgWREx1/85fFlM2e0ZWeqqB+9ka2J94UtYCeUedlikhnr
 HFqV7ceTvrivx7sqsKxi7xvCn/bzsyOm+z4k6NDIivRFx1OCZ1Ku/6XHC58aaSMT6V/J
 CIDFienJvwSxvSeBEN4MUu7wNPXl0kO9ulJCU+scrs43Dz8hgrBP5zQYWhANamxOHwAu
 0vIiGp3CIQ5rRtTG76LB2+nIr27NJaI2bjrS5XyKoBNkqoSBE12bNove/pjRYpcKPI8W
 bxNnpr1t7dSZuR6qjFBMlpm6SxBTZL3rZT22PhLUyIKTxKKhSGSiop8iC7L2FyNFlbmN
 C8cQ==
X-Gm-Message-State: AO0yUKWL8hb6UyEXqKL1f1oaiXLoUF/DKGaroG1nkeX3JQlCDTiSPPpK
 /LKhbNtO9gF1LmC/2T35c36Ax20YZA8=
X-Google-Smtp-Source: AK7set+m7cWOv1RHybMAfOCzPRvQaV62dLX58iGhA9SZT8R7OwbyLmc241NiKS/XtNsdB4vzT9A0oA==
X-Received: by 2002:a05:6402:1256:b0:4fb:1fa8:da25 with SMTP id
 l22-20020a056402125600b004fb1fa8da25mr2725543edw.36.1678622556599; 
 Sun, 12 Mar 2023 05:02:36 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-022-093.78.54.pool.telefonica.de. [78.54.22.93])
 by smtp.gmail.com with ESMTPSA id
 xj9-20020a170906db0900b009231714b3d4sm1293745ejb.151.2023.03.12.05.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 05:02:36 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 3/6] hw/isa/piix3: Wire up Xen PCI IRQ handling outside of
 PIIX3
Date: Sun, 12 Mar 2023 13:02:18 +0100
Message-Id: <20230312120221.99183-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312120221.99183-1-shentey@gmail.com>
References: <20230312120221.99183-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
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

xen_intx_set_irq() doesn't depend on PIIX3State. In order to resolve
TYPE_PIIX3_XEN_DEVICE and in order to make Xen agnostic about the
precise south bridge being used, set up Xen's PCI IRQ handling of PIIX3
in the board.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc_piix.c | 13 +++++++++++++
 hw/isa/piix3.c    | 24 +-----------------------
 2 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 30eedd62a3..99232701b1 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -69,6 +69,7 @@
 #include "kvm/kvm-cpu.h"
 
 #define MAX_IDE_BUS 2
+#define XEN_IOAPIC_NUM_PIRQS 128ULL
 
 #ifdef CONFIG_IDE_ISA
 static const int ide_iobase[MAX_IDE_BUS] = { 0x1f0, 0x170 };
@@ -236,6 +237,18 @@ static void pc_init1(MachineState *machine,
         pcms->bus = pci_bus;
 
         pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+
+        if (xen_enabled()) {
+            /*
+             * Xen supports additional interrupt routes from the PCI devices to
+             * the IOAPIC: the four pins of each PCI device on the bus are also
+             * connected to the IOAPIC directly.
+             * These additional routes can be discovered through ACPI.
+             */
+            pci_bus_irqs(pci_bus, xen_intx_set_irq, pci_dev,
+                         XEN_IOAPIC_NUM_PIRQS);
+        }
+
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index a86cd23ef4..7a31caf2b6 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -34,8 +34,6 @@
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_aml_interface.h"
 
-#define XEN_IOAPIC_NUM_PIRQS    128ULL
-
 static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
 {
     qemu_set_irq(piix3->pic[pic_irq],
@@ -388,32 +386,12 @@ static const TypeInfo piix3_info = {
     .class_init    = piix3_class_init,
 };
 
-static void piix3_xen_realize(PCIDevice *dev, Error **errp)
-{
-    ERRP_GUARD();
-    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
-    PCIBus *pci_bus = pci_get_bus(dev);
-
-    piix3_realize(dev, errp);
-    if (*errp) {
-        return;
-    }
-
-    /*
-     * Xen supports additional interrupt routes from the PCI devices to
-     * the IOAPIC: the four pins of each PCI device on the bus are also
-     * connected to the IOAPIC directly.
-     * These additional routes can be discovered through ACPI.
-     */
-    pci_bus_irqs(pci_bus, xen_intx_set_irq, piix3, XEN_IOAPIC_NUM_PIRQS);
-}
-
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     k->config_write = piix3_write_config_xen;
-    k->realize = piix3_xen_realize;
+    k->realize = piix3_realize;
 }
 
 static const TypeInfo piix3_xen_info = {
-- 
2.39.2



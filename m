Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE2265B76B
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 22:37:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCSTD-0008GX-Dc; Mon, 02 Jan 2023 16:35:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCSTA-0008Fn-RG
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 16:35:44 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCST9-0005As-79
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 16:35:44 -0500
Received: by mail-ej1-x62d.google.com with SMTP id x22so69224741ejs.11
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 13:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D3N14otcWIL0n4lyXnEKPR8qnN0/LRmM4qVkpIj4xR0=;
 b=o/cROMVNdjgczrnzaHlIWJEYXmIcrhVEkY1chtTByVFgw8LTNs+VtgtFtEZgCY5yoO
 nzOSynWwIDOUxRcnk9SUCJGzI20lfjgufMnCsY3qKkrbVKMBuWhX5TfEhfasZkfISq3w
 UUBnbDggVxAN214v2MFTNHh1dDpNtR39S8/3tlxvw36a2E8mKGLvwXUdhgefdiWugr2Q
 /JRT9RMXrxyUOTVNhO906P9DpV3HnLmQXEbcusyKm+dfxznocAkcd176q8u6n1jPlKMw
 RuGYas0dxRTf9TF7zr00vUMGJtTGMRb1AQ7dyW7UTX3Cu2OxXUh1shUHoWE61xetRae1
 jQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D3N14otcWIL0n4lyXnEKPR8qnN0/LRmM4qVkpIj4xR0=;
 b=BVWbtdJwEWeLqv/8GGboOoAryQvqAbBt/HfsFJGOpyalx7OBsSo5ue0zwsu+dJ/1ob
 BXyPo4Ty/Pmj3nloKldgesroVTLJNWUXh3YFNIrbyfFq5GLHS+ohfsBX5QOtiKjSsX2r
 ej+lqth5CPtMPgHFodSmN2pUPUNmP5GvJF0VlKkzk7JtBNfMGR0oLIpxqIVHTyH95xzz
 BDIaEjqQ+eIxGbixGFDauJ7UjQMkvdDD6GdH1NlE/J2kytZL+t/n4E2HOdSsc/0N0lxv
 ppXf4vgF8kTHDqvwgaQjWt5Rwannu3stG6iTP8ujZKNYuEjW7WUca2HaRZtRFwRsMeF9
 pAjw==
X-Gm-Message-State: AFqh2kp40vnLsEOmpUK7r2sxfb1j0aMHo9ZJXnYeFs5e2ntyNlpIhUW6
 pKrfVRosndSAKUZaey/hhwjBeDYvC8A=
X-Google-Smtp-Source: AMrXdXsbnk+1fmyTa+aN0jvfrb8pZSWUpibMyiM6zr4b2AEMWkyILO87oUs0wXcIHRi65FlXo993VQ==
X-Received: by 2002:a17:906:2349:b0:837:3ddb:7e97 with SMTP id
 m9-20020a170906234900b008373ddb7e97mr43321304eja.61.1672695341405; 
 Mon, 02 Jan 2023 13:35:41 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a17090631cb00b0084c465709b7sm10583826ejf.74.2023.01.02.13.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 13:35:41 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 3/6] hw/isa/piix: Wire up Xen PCI IRQ handling outside of PIIX3
Date: Mon,  2 Jan 2023 22:35:01 +0100
Message-Id: <20230102213504.14646-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102213504.14646-1-shentey@gmail.com>
References: <20230102213504.14646-1-shentey@gmail.com>
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

xen_intx_set_irq() doesn't depend on PIIX state. In order to resolve
TYPE_PIIX3_XEN_DEVICE and in order to make Xen agnostic about the
precise south bridge being used, set up Xen's PCI IRQ handling of PIIX3
in the board.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c | 12 ++++++++++++
 hw/isa/piix.c     | 24 +-----------------------
 2 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index aacdb72b7c..c02f68010d 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -67,6 +67,7 @@
 #include "kvm/kvm-cpu.h"
 
 #define MAX_IDE_BUS 2
+#define XEN_PIIX_NUM_PIRQS 128ULL
 
 #ifdef CONFIG_IDE_ISA
 static const int ide_iobase[MAX_IDE_BUS] = { 0x1f0, 0x170 };
@@ -246,6 +247,17 @@ static void pc_init1(MachineState *machine,
                                  &error_abort);
         pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
 
+        if (xen_enabled()) {
+            /*
+             * Xen supports additional interrupt routes from the PCI devices to
+             * the IOAPIC: the four pins of each PCI device on the bus are also
+             * connected to the IOAPIC directly.
+             * These additional routes can be discovered through ACPI.
+             */
+            pci_bus_irqs(pci_bus, xen_intx_set_irq, pci_dev,
+                         XEN_PIIX_NUM_PIRQS);
+        }
+
         dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "pic"));
         for (i = 0; i < ISA_NUM_IRQS; i++) {
             qdev_connect_gpio_out(dev, i, x86ms->gsi[i]);
diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index a1281c2d77..ac04781f46 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -38,8 +38,6 @@
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_aml_interface.h"
 
-#define XEN_PIIX_NUM_PIRQS      128ULL
-
 static void piix_set_irq_pic(PIIXState *piix, int pic_irq)
 {
     qemu_set_irq(piix->pic.in_irqs[pic_irq],
@@ -487,33 +485,13 @@ static const TypeInfo piix3_info = {
     .class_init    = piix3_class_init,
 };
 
-static void piix3_xen_realize(PCIDevice *dev, Error **errp)
-{
-    ERRP_GUARD();
-    PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
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
-    pci_bus_irqs(pci_bus, xen_intx_set_irq, piix3, XEN_PIIX_NUM_PIRQS);
-}
-
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     k->config_write = piix3_write_config_xen;
-    k->realize = piix3_xen_realize;
+    k->realize = piix3_realize;
     /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
     k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
     dc->vmsd = &vmstate_piix3;
-- 
2.39.0



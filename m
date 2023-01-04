Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7349365D67B
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 15:47:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD51V-0005Gx-8w; Wed, 04 Jan 2023 09:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pD51F-0005F8-0r
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:45:30 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pD51D-0002po-Aa
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:45:28 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bn26so13737728wrb.0
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 06:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jWsSUpGWnwKoxzlBa2RTErBbFhPwkbaywyVJwsOJ9Nk=;
 b=YlPrLritShhHTaeSGbLlb++n9XqS9VBhEgsy2PwwgydtFFm8UrBGDJ7iUMy8EaMHeH
 9SBO1n2DyEa7U5jCTGTOQDdlOVkvnVOt1hp8JY3uNc4BSSwglDnmGx2Ero35GpcLb5UZ
 lxDNlGzSW/OY/+wh4qjm3mF5gciV5251nu62u5qkggcU3PaBu3OtH7lvV3LzAIHUHPpY
 i/fR6+7MuwJBxH89wLn/4BkSrlZxnPIIZCNrMfecj4xhrjBhXyY2bE6HPVdgtcf6jPaJ
 iN/TGG+HuHA766ERLaC5giouVQ+KfyHIHRbdPCXS9JqqjfVfCA6wQA2G70I6E8iUvn/6
 2/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jWsSUpGWnwKoxzlBa2RTErBbFhPwkbaywyVJwsOJ9Nk=;
 b=RKaQBbXyspreX0bdd+pzGLJ55dXm37MYcZOw1p5f1AxGUrguvMI5/v4ZXECeu+6vCQ
 SyU+5I511F9GR53VPkt0PwUKD96kg4t5GgMHy8CHYzc/QRXXs/mSmaU+Mf6Tw20b75Ga
 2PQvSrj6qJyKFaB/s0Wq9WsyJbGWM6Z/I7p+rNP267QGvpzVAfJLcG/vNqq5yrGx+ElS
 9C0IVeYxA+BLG8B+hdY6lUWS/w1fscht2Hkbc/M/T8XsYpSj5py4yfNm9B1i+7XDP5qd
 TXnvcM8gNRYqnJ+2D46UglA0ZVbhyaGDRV65Rem6+vx+VloQBTfwhLO+WNE+ACXBiDrQ
 K6ww==
X-Gm-Message-State: AFqh2kqfiNmfARaGNBDpZprJnlxYlo26/145buUEe/uWd3to7b5zJ9+4
 ErZBh7UGDgnCoI6dnmvRLGdL1G2kVgQ2RA==
X-Google-Smtp-Source: AMrXdXtdVz6/t/nUcG3XroMW/zOMXTIelUM5J1RHwOTKB+xhi7kJEMzBdrFkmDsmcHHUWZlTsIodDw==
X-Received: by 2002:adf:f4c5:0:b0:291:3f93:b7d1 with SMTP id
 h5-20020adff4c5000000b002913f93b7d1mr11327512wrp.64.1672843525599; 
 Wed, 04 Jan 2023 06:45:25 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a5d594a000000b0028663fc8f4csm21168241wri.30.2023.01.04.06.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 06:45:25 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 3/6] hw/isa/piix: Wire up Xen PCI IRQ handling outside of
 PIIX3
Date: Wed,  4 Jan 2023 15:44:34 +0100
Message-Id: <20230104144437.27479-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104144437.27479-1-shentey@gmail.com>
References: <20230104144437.27479-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42f.google.com
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
index aacdb72b7c..792dcd3ce8 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -67,6 +67,7 @@
 #include "kvm/kvm-cpu.h"
 
 #define MAX_IDE_BUS 2
+#define XEN_IOAPIC_NUM_PIRQS 128ULL
 
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
+                         XEN_IOAPIC_NUM_PIRQS);
+        }
+
         dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "pic"));
         for (i = 0; i < ISA_NUM_IRQS; i++) {
             qdev_connect_gpio_out(dev, i, x86ms->gsi[i]);
diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 25707479eb..ac04781f46 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -38,8 +38,6 @@
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_aml_interface.h"
 
-#define XEN_IOAPIC_NUM_PIRQS    128ULL
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
-    pci_bus_irqs(pci_bus, xen_intx_set_irq, piix3, XEN_IOAPIC_NUM_PIRQS);
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



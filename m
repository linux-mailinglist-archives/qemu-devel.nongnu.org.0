Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B22D573153
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 10:40:57 +0200 (CEST)
Received: from localhost ([::1]:33592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBXvU-0006Om-CL
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 04:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZg-0005fI-AC
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:26 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:42773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZb-0004p4-I9
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:23 -0400
Received: by mail-ej1-x629.google.com with SMTP id sz17so18503110ejc.9
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 01:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2NPGt8xuA6Yqy8KYQ1uKmkHyOmvds1RCbXYW0GOsMr0=;
 b=BbyOhkofjIyw4tzwz5l6Q3QU5oBYFLujKqpzTOae2rnANG95fkvWmGGsNhw9exGY72
 YcFLAr3lcaUQ9YIqeTvZUleMTX5oEtStmc2WrDYXNbg/xIAw/Ezokn9s0CJLhcqUkcI8
 WKseubNxRXRWPhfR5/5So4y9v0b8+V9IMK7CJW8tARFRzaZJjLK9oOnVklFzjzlOgOKn
 Tj6qDJSbdQ/5UqaYqqaldAaC3hdI3pdiZXAjozhTge/0lGV4dEF5MM2uKdWP0enXGsiW
 a0nfDElljNgjG9QpuLFGiZjRW3d6cI65LVl49NsCpzlFJ4y2+yZiXEsVjM0iFP+xyBL6
 RcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2NPGt8xuA6Yqy8KYQ1uKmkHyOmvds1RCbXYW0GOsMr0=;
 b=gxJYelVAqkj3d17Ulo4tsSgU0QHu3FECjAGR/f1EP4kijOqbjqBnouCyjmUDLAbbHu
 TQGBSSP1BViZepYXrTAu/3RpDk60z+RM4NBJeWYxZyZ0Nsc4kecrsX8duF21xUyK22Wv
 tqOMwkMNf+1BmDzyCAXaN2k2+DUeSr8CLj3nLfA78QVQJLti5dYqJodg7J5t7/8+6Upq
 424KwFhH8AjVOwJH4XQgg02oteuyjWDNcpsiJ66Igv3oTzXcMPgH5b8uWnjGw2iNwRx9
 wFMqPJNUNT9MNLX9VZF2R3vG6e5bGyHTc7zLgmrQHTSTVi4W8wRoy/xD6qlGpVL3vhl+
 CWGw==
X-Gm-Message-State: AJIora/4WegtvdptYcDJVDpI4bZCTfq48T1ZRYU23hSeNzmM5QLP5oIX
 Fc7PIUtyg/dcNDSgu8fihIduDB4pS40=
X-Google-Smtp-Source: AGRyM1sualXPIZC+hGZzpCwfIZlUnNx91rCHSoNv3uxGsy90PO0Ok8QxrqDuJa1K825xLvqJ9zSknw==
X-Received: by 2002:a17:907:3f84:b0:724:2ec:b474 with SMTP id
 hr4-20020a1709073f8400b0072402ecb474mr2297621ejc.644.1657700297769; 
 Wed, 13 Jul 2022 01:18:17 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-210-047.77.183.pool.telefonica.de. [77.183.210.47])
 by smtp.gmail.com with ESMTPSA id
 w13-20020aa7dccd000000b00435a62d35b5sm7483431edu.45.2022.07.13.01.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 01:18:17 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 08/11] hw/isa/piix3: QOM'ify ISA PIC creation
Date: Wed, 13 Jul 2022 10:17:32 +0200
Message-Id: <20220713081735.112016-9-shentey@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220713081735.112016-1-shentey@gmail.com>
References: <20220713081735.112016-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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

Use the newly introduced i8259 proxy "isa-pic" which allows for wiring
up devices in the southbridge where the virtualization technology used
(KVM, TCG, Xen) is not yet known.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c             | 15 +++++++++------
 hw/isa/piix3.c                | 10 +++++++++-
 include/hw/southbridge/piix.h |  4 ++--
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 0f6cdc5bc4..4ce215a212 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -198,10 +198,11 @@ static void pc_init1(MachineState *machine,
     gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
 
     if (pcmc->pci_enabled) {
-        PIIX3State *piix3;
+        DeviceState *dev;
         PCIDevice *pci_dev;
         const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
                                          : TYPE_PIIX3_DEVICE;
+        int i;
 
         pci_bus = i440fx_init(host_type,
                               pci_type,
@@ -221,10 +222,12 @@ static void pc_init1(MachineState *machine,
                                  x86_machine_is_smm_enabled(x86ms),
                                  &error_abort);
         pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
-        piix3 = PIIX3_PCI_DEVICE(pci_dev);
-        piix3->pic = x86ms->gsi;
-        piix3_devfn = piix3->dev.devfn;
-        isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
+        dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "pic"));
+        for (i = 0; i < ISA_NUM_IRQS; ++i) {
+            qdev_connect_gpio_out(dev, i, x86ms->gsi[i]);
+        }
+        piix3_devfn = pci_dev->devfn;
+        isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(pci_dev), "isa.0"));
         rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
                                                              "rtc"));
         piix4_pm = object_resolve_path_component(OBJECT(pci_dev), "pm");
@@ -233,6 +236,7 @@ static void pc_init1(MachineState *machine,
         piix4_pm = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
                               &error_abort);
+        isa_bus_irqs(isa_bus, x86ms->gsi);
 
         rtc_state = isa_new(TYPE_MC146818_RTC);
         qdev_prop_set_int32(DEVICE(rtc_state), "base_year", 2000);
@@ -241,7 +245,6 @@ static void pc_init1(MachineState *machine,
         i8257_dma_init(isa_bus, 0);
         pcms->hpet_enabled = false;
     }
-    isa_bus_irqs(isa_bus, x86ms->gsi);
 
     if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
         pc_i8259_create(isa_bus, gsi_state->i8259_irq);
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index afd36178dd..7bf3488f76 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -41,7 +41,7 @@
 
 static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
 {
-    qemu_set_irq(piix3->pic[pic_irq],
+    qemu_set_irq(piix3->pic.in_irqs[pic_irq],
                  !!(piix3->pic_levels &
                     (((1ULL << PIIX_NUM_PIRQS) - 1) <<
                      (pic_irq * PIIX_NUM_PIRQS))));
@@ -306,6 +306,13 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
+    /* PIC */
+    if (!qdev_realize(DEVICE(&d->pic), BUS(isa_bus), errp)) {
+        return;
+    }
+
+    isa_bus_irqs(isa_bus, d->pic.in_irqs);
+
     memory_region_init_io(&d->rcr_mem, OBJECT(dev), &rcr_ops, d,
                           "piix3-reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
@@ -359,6 +366,7 @@ static void pci_piix3_init(Object *obj)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(obj);
 
+    object_initialize_child(obj, "pic", &d->pic, TYPE_ISA_PIC);
     object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "uhci", &d->uhci, "piix3-usb-uhci");
 
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 15b05cfc93..cfe155ce07 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -15,6 +15,7 @@
 #include "hw/pci/pci.h"
 #include "qom/object.h"
 #include "hw/acpi/piix4.h"
+#include "hw/intc/i8259.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/usb/hcd-uhci.h"
 
@@ -50,11 +51,10 @@ struct PIIXState {
 #endif
     uint64_t pic_levels;
 
-    qemu_irq *pic;
-
     /* This member isn't used. Just for save/load compatibility */
     int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
 
+    ISAPICState pic;
     RTCState rtc;
     UHCIState uhci;
     PIIX4PMState pm;
-- 
2.37.1



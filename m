Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E382E694E19
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:33:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcfg-000871-8y; Mon, 13 Feb 2023 12:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfY-00083g-VB
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:13 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfW-0005Na-6u
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:11 -0500
Received: by mail-ej1-x62b.google.com with SMTP id jg8so33735246ejc.6
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LUO1RVxI9YOpR9tc8Hfr8OfiAA+aO4xFIe2WjYm2GSQ=;
 b=k+udukDwlvk+u3HjkuQqdgYg5t1HrGjbWI4PQumwt2fxL7zT9k7yl3jmSXk09oM0g/
 cOJXstqCWeTf504mZa1kr099WRdED43rvYA3xaECRrO/7fIBtMhchpj8BuzfbXS+snCL
 qMjLog4ALkMwJmaRDuya5IJ+phKfVeVmI7IGASSYwQoSmok7PpZBBEYoFc5Z4fc8Z78V
 loB4C0G4y8AwLYZdn8VJB3g8j1T9CJqPMEeQ50Xo2LPWY2k4AbxNDtVS+sxvbZXtUWE+
 d6oVsfcEs8UZzE9WNCqnszQ+0C7VGtMuD/3+FZw9c0bdi8+ga/gWTlfAciDQoHSy15zj
 G6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LUO1RVxI9YOpR9tc8Hfr8OfiAA+aO4xFIe2WjYm2GSQ=;
 b=QJ9rjgZ0z64rg93TGnYj2ZF1VcMmhlDcyrn1F5YOlzw6jPIqg1QkiSZbyAfxwRDqZ7
 jzEqNjS37Q6jvsneSH/gl+W92hFVRwoS0EgJILn4jyYb3iktZgtg/+a6FnyWT5Rd19Fc
 ExXEJuGyuwb7Z8GlxzF+CDUkq5ZjFXy652R8lDhIRtzptmx76KalAtQoi4gJ23bRKFsY
 TM2vvntcreuv8AteyXjtpXzeEjM8MOIS9MOasx8s85R9B/GgqJFH9sDR2gAeMqIzyHsQ
 87hpF62xHAslX0i24gm64oSKS/is6QcLv1BvSpA/eN9whEAqsC2DI1+jmxJdAt8gCjya
 V/xA==
X-Gm-Message-State: AO0yUKWxQYIBgQ2IUVzoFbSQn6kjbtlvYJtvLooJpEC3Ufc5m/rMIj63
 I9XFIuKmQD8iaNsmsdaAmZwphZTqO3Q=
X-Google-Smtp-Source: AK7set+EGaCeqf8htnJSWAJKWuQo6wKncAI73RTtut48Jmk6JVfNKvG/n0m5bw+Q3gXlwOMubR8vow==
X-Received: by 2002:a17:907:7292:b0:8ae:b008:9b5a with SMTP id
 dt18-20020a170907729200b008aeb0089b5amr24836080ejc.69.1676309461713; 
 Mon, 13 Feb 2023 09:31:01 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170906684b00b008aea5e0938esm6988699ejs.183.2023.02.13.09.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 09:31:01 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 02/12] hw/isa/lpc_ich9: Unexport PIRQ functions
Date: Mon, 13 Feb 2023 18:30:23 +0100
Message-Id: <20230213173033.98762-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213173033.98762-1-shentey@gmail.com>
References: <20230213173033.98762-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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

No need to rely on the board to wire up the ICH9 PCI IRQs. All functions
access private state of the LPC device which suggests that it should
wire up the IRQs.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/i386/ich9.h |  3 ---
 hw/i386/pc_q35.c       |  3 ---
 hw/isa/lpc_ich9.c      | 11 ++++++++---
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 36e0ccd16a..921e4c7ef6 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -9,9 +9,6 @@
 #include "hw/acpi/ich9.h"
 #include "qom/object.h"
 
-void ich9_lpc_set_irq(void *opaque, int irq_num, int level);
-int ich9_lpc_map_irq(PCIDevice *pci_dev, int intx);
-PCIINTxRoute ich9_route_intx_pin_to_irq(void *opaque, int pirq_pin);
 void ich9_lpc_pm_init(PCIDevice *pci_lpc, bool smm_enabled);
 I2CBus *ich9_smb_init(PCIBus *bus, int devfn, uint32_t smb_io_base);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index a5ffb77ed8..8fac0e57bc 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -271,9 +271,6 @@ static void pc_q35_init(MachineState *machine)
     for (i = 0; i < GSI_NUM_PINS; i++) {
         qdev_connect_gpio_out_named(lpc_dev, ICH9_GPIO_GSI, i, x86ms->gsi[i]);
     }
-    pci_bus_irqs(host_bus, ich9_lpc_set_irq, ich9_lpc, ICH9_LPC_NB_PIRQS);
-    pci_bus_map_irqs(host_bus, ich9_lpc_map_irq);
-    pci_bus_set_route_irq_fn(host_bus, ich9_route_intx_pin_to_irq);
     isa_bus = ich9_lpc->isa_bus;
 
     if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 1fba3c210c..54a8839cd2 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -259,7 +259,7 @@ static void ich9_lpc_update_apic(ICH9LPCState *lpc, int gsi)
     qemu_set_irq(lpc->gsi[gsi], level);
 }
 
-void ich9_lpc_set_irq(void *opaque, int pirq, int level)
+static void ich9_lpc_set_irq(void *opaque, int pirq, int level)
 {
     ICH9LPCState *lpc = opaque;
     int pic_irq, pic_dis;
@@ -275,7 +275,7 @@ void ich9_lpc_set_irq(void *opaque, int pirq, int level)
 /* return the pirq number (PIRQ[A-H]:0-7) corresponding to
  * a given device irq pin.
  */
-int ich9_lpc_map_irq(PCIDevice *pci_dev, int intx)
+static int ich9_lpc_map_irq(PCIDevice *pci_dev, int intx)
 {
     BusState *bus = qdev_get_parent_bus(&pci_dev->qdev);
     PCIBus *pci_bus = PCI_BUS(bus);
@@ -286,7 +286,7 @@ int ich9_lpc_map_irq(PCIDevice *pci_dev, int intx)
     return lpc->irr[PCI_SLOT(pci_dev->devfn)][intx];
 }
 
-PCIINTxRoute ich9_route_intx_pin_to_irq(void *opaque, int pirq_pin)
+static PCIINTxRoute ich9_route_intx_pin_to_irq(void *opaque, int pirq_pin)
 {
     ICH9LPCState *lpc = opaque;
     PCIINTxRoute route;
@@ -680,6 +680,7 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
 {
     ICH9LPCState *lpc = ICH9_LPC_DEVICE(d);
     DeviceState *dev = DEVICE(d);
+    PCIBus *pci_bus = pci_get_bus(d);
     ISABus *isa_bus;
 
     if ((lpc->smi_host_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT)) &&
@@ -728,6 +729,10 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
     isa_bus_irqs(isa_bus, lpc->gsi);
 
     i8257_dma_init(isa_bus, 0);
+
+    pci_bus_irqs(pci_bus, ich9_lpc_set_irq, d, ICH9_LPC_NB_PIRQS);
+    pci_bus_map_irqs(pci_bus, ich9_lpc_map_irq);
+    pci_bus_set_route_irq_fn(pci_bus, ich9_route_intx_pin_to_irq);
 }
 
 static bool ich9_rst_cnt_needed(void *opaque)
-- 
2.39.1



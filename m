Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8535682BF3
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:55:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpDB-0006eL-UZ; Tue, 31 Jan 2023 06:54:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpD8-0006SG-QI; Tue, 31 Jan 2023 06:54:02 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpD7-0002N0-3w; Tue, 31 Jan 2023 06:54:02 -0500
Received: by mail-ed1-x531.google.com with SMTP id x7so10898906edr.0;
 Tue, 31 Jan 2023 03:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bR11ilDZxRVhc8S1OrHlRFd0u3m3X/MLZG9Khl8VZ48=;
 b=XR9uRYBkQFset9dXTdmlev+sqxSZC25VcdSn9O8m0AQU0vvpm6Fzuv/tBgz/vXDv5n
 jel7KLFXZxwxCMTbkoc2mpuyQW/MWhJX0KA+PmsywtoirlbC7FgRK8D8qP4ilw24DqVu
 sRbCYxNMRcPKCtKULSLE7vghn2mpkloCE9ZnG+sPBtqzUscayVoh0HcJa15KXztMXz6s
 YLdI+SOiEK1d9eMte5ZNzqvvamQB0qQALd9i6uTPcgjay8VvWlDMnlGpSb61suRGbFHP
 qn0m5MYSQk1ABw4giB/pvmoAP90muzWK1Bul60tAZnUZyG2tDQFV145/5hOn3dElX7Qi
 7Esg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bR11ilDZxRVhc8S1OrHlRFd0u3m3X/MLZG9Khl8VZ48=;
 b=UbIjk+RwRpvqxmEcxW+h3nNscwDGRLCuR+qlFAo55hgw2AlR+Dk27M52CCLmqCRqra
 t4tjIuUuea5iSBXMRB8xTMRQXH/KHcbj6GA7EJTgCG/RksQiWw8OHe8cuZ/2t+4gHhlf
 ud+DARU8yee8FE1Nx5gowifVZQHZuaTL5DW51EZLw4/97eKtPwVIXSP6rQJ6DoQEIoCa
 rgm2jL36R1pvEqYFEnl9CHnTi+5vr7wf2vVqkjAIL6t902+SCKWikrvcER30ZTL/Og32
 q8nfDdM98G1xfIN/PzDFC0rILqdyLZwhaZQTpfF28rG41W66ooEdtLHe9F8NI/UqijH5
 NmFg==
X-Gm-Message-State: AFqh2krf1e79vM98/Z2m6AAbNg757G9xrz775FNb/aKoxjBgcxnrXlzx
 vgfMvhJSpkt0dr5BcjqzmQQVIomWxdc=
X-Google-Smtp-Source: AMrXdXtLs/Z3DRGCYEc9WNPy0POlL61UXsTiTtKPaZvMZDOwV18fe8xnHfHrKrMdFn84d7pXZ2YYFg==
X-Received: by 2002:aa7:de95:0:b0:49d:be2b:b9b1 with SMTP id
 j21-20020aa7de95000000b0049dbe2bb9b1mr54137552edv.36.1675166039266; 
 Tue, 31 Jan 2023 03:53:59 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-082-236.77.13.pool.telefonica.de. [77.13.82.236])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056402100a00b00483dd234ac6sm8178318edu.96.2023.01.31.03.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:53:58 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 09/20] hw/isa/lpc_ich9: Unexport PIRQ functions
Date: Tue, 31 Jan 2023 12:53:15 +0100
Message-Id: <20230131115326.12454-10-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131115326.12454-1-shentey@gmail.com>
References: <20230131115326.12454-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
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
index 50fa5aa9bc..83e4fb7868 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -267,9 +267,6 @@ static void pc_q35_init(MachineState *machine)
     for (i = 0; i < GSI_NUM_PINS; i++) {
         qdev_connect_gpio_out_named(lpc_dev, ICH9_GPIO_GSI, i, x86ms->gsi[i]);
     }
-    pci_bus_irqs(host_bus, ich9_lpc_set_irq, ich9_lpc, ICH9_LPC_NB_PIRQS);
-    pci_bus_map_irqs(host_bus, ich9_lpc_map_irq);
-    pci_bus_set_route_irq_fn(host_bus, ich9_route_intx_pin_to_irq);
     isa_bus = ich9_lpc->isa_bus;
 
     if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 8d541e2b54..b444faacd2 100644
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



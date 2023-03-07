Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 589036AFAB8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:49:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh2w-0004CC-7D; Tue, 07 Mar 2023 18:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh2u-000466-B7
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:48:40 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh2s-0002tK-8s
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:48:40 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso179195wmq.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678232916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gpJPCmXwquoCWBgXDDE3NqTOd956WcpGbyNKVzShIlk=;
 b=IEw6CyOer/a0+9gM4WU+FY3dy/0K8DLtHAQHaqrrD4lTo/aNpwCYPfFo9OBZgkU6Zy
 n2u9DENkELJhO2khxWMUpUb/nn427floF08/vaDEDSwtLHwTMJ06/ysWYPIJbvMSlool
 T0hBZU3yZV9qbYj2FwcvWnVWJrqVVX/qtibau3tdIy3RyKmkwwANTbTQ/7rDJyq8xqaP
 i98CtuFcXo4LkwpGP4VsU+czxoLCiibUtYN7VPEtqqA6aGrkvh0uOXunZz8Tdhk95Ytt
 FMDKsvXoI5qOdNXAsa2u9SF8bSfLDbAh98X+GNSCaLcploNG4BvYp5dhZWfAbPRV7AuW
 HeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678232916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gpJPCmXwquoCWBgXDDE3NqTOd956WcpGbyNKVzShIlk=;
 b=4hEpudjEX0VK/hvRC96mqImHKyBXJmmG4gkaoyZb3xNNZ82D2/tmH9FDiWSj6ElPDP
 IK53taUTb/3pu3OdNN9RSdXP70pJZsp12XmOSOZ0G8pOCsYGIXN9latgLR28lGGbIYVf
 3MUHEzj5bkLpwU+ZNbL2gjQuAyVJRErYiDbH+e6GwUXnwHSFwZR3chKvd1RBNfVJ0Nk7
 cE5TplgDXzJ+sImoojRv8p7lFczWiduvMzlqXto+FLsa2MJlfxiAU4Anssq4RBCXUe3l
 68dvNxcOpzgFb9NYxXnFNKwhLC14M8RTdzP6SiVVIZ2pdqd4rG0bBsqeHAxPg3NKGAIM
 jymw==
X-Gm-Message-State: AO0yUKXm479V+ZvYpWh327dY8gzLWX8Dfh9tD6sEX1voWJD1TjKRlZtu
 58ElCuHho3hcPNeokE5K37xCXi/zroNuN1oxUrE=
X-Google-Smtp-Source: AK7set8LM5/qxpwQjBUUR+G6Miz25iRI9cqbKg1MX3T+c0nHug202Qbl3P3/5yX1ar09h6sC4dc4zQ==
X-Received: by 2002:a05:600c:5127:b0:3ea:dbdd:66df with SMTP id
 o39-20020a05600c512700b003eadbdd66dfmr13985794wms.2.1678232916367; 
 Tue, 07 Mar 2023 15:48:36 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 v12-20020a05600c12cc00b003de2fc8214esm13810478wmd.20.2023.03.07.15.48.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 15:48:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Rene Engel <ReneEngel80@emailn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 14/20] hw/ppc/pegasos2: Fix PCI interrupt routing
Date: Wed,  8 Mar 2023 00:47:05 +0100
Message-Id: <20230307234711.55375-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230307234711.55375-1-philmd@linaro.org>
References: <20230307234711.55375-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: BALATON Zoltan <balaton@eik.bme.hu>

According to the PegasosII schematics the PCI interrupt lines are
connected to both the gpp pins of the Mv64361 north bridge and the
PINT pins of the VT8231 south bridge so guests can get interrupts from
either of these. So far we only had the MV64361 connections which
worked for on board devices but for additional PCI devices (such as
network or sound card added with -device) guest OSes expect interrupt
from the ISA IRQ 9 where the firmware routes these PCI interrupts in
VT8231 ISA bridge. After the previous patches we can now model this
and also remove the board specific connection from mv64361. Also
configure routing of these lines when using Virtual Open Firmware to
match board firmware for guests that expect this.

This fixes PCI interrupts on pegasos2 under Linux, MorphOS and AmigaOS.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Tested-by: Rene Engel <ReneEngel80@emailn.de>
Message-Id: <520ff9e6eeef600ee14a4116c0c7b11940cc499c.1678188711.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/mv64361.c |  4 ----
 hw/ppc/pegasos2.c     | 26 +++++++++++++++++++++++++-
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
index 298564f1f5..19e8031a3f 100644
--- a/hw/pci-host/mv64361.c
+++ b/hw/pci-host/mv64361.c
@@ -873,10 +873,6 @@ static void mv64361_realize(DeviceState *dev, Error **errp)
     }
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cpu_irq);
     qdev_init_gpio_in_named(dev, mv64361_gpp_irq, "gpp", 32);
-    /* FIXME: PCI IRQ connections may be board specific */
-    for (i = 0; i < PCI_NUM_PINS; i++) {
-        s->pci[1].irq[i] = qdev_get_gpio_in_named(dev, "gpp", 12 + i);
-    }
 }
 
 static void mv64361_reset(DeviceState *dev)
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 7cc375df05..f1650be5ee 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -73,6 +73,8 @@ struct Pegasos2MachineState {
     MachineState parent_obj;
     PowerPCCPU *cpu;
     DeviceState *mv;
+    qemu_irq mv_pirq[PCI_NUM_PINS];
+    qemu_irq via_pirq[PCI_NUM_PINS];
     Vof *vof;
     void *fdt_blob;
     uint64_t kernel_addr;
@@ -95,6 +97,15 @@ static void pegasos2_cpu_reset(void *opaque)
     }
 }
 
+static void pegasos2_pci_irq(void *opaque, int n, int level)
+{
+    Pegasos2MachineState *pm = opaque;
+
+    /* PCI interrupt lines are connected to both MV64361 and VT8231 */
+    qemu_set_irq(pm->mv_pirq[n], level);
+    qemu_set_irq(pm->via_pirq[n], level);
+}
+
 static void pegasos2_init(MachineState *machine)
 {
     Pegasos2MachineState *pm = PEGASOS2_MACHINE(machine);
@@ -106,7 +117,7 @@ static void pegasos2_init(MachineState *machine)
     I2CBus *i2c_bus;
     const char *fwname = machine->firmware ?: PROM_FILENAME;
     char *filename;
-    int sz;
+    int i, sz;
     uint8_t *spd_data;
 
     /* init CPU */
@@ -156,11 +167,18 @@ static void pegasos2_init(MachineState *machine)
     /* Marvell Discovery II system controller */
     pm->mv = DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
                           qdev_get_gpio_in(DEVICE(pm->cpu), PPC6xx_INPUT_INT)));
+    for (i = 0; i < PCI_NUM_PINS; i++) {
+        pm->mv_pirq[i] = qdev_get_gpio_in_named(pm->mv, "gpp", 12 + i);
+    }
     pci_bus = mv64361_get_pci_bus(pm->mv, 1);
+    pci_bus_irqs(pci_bus, pegasos2_pci_irq, pm, PCI_NUM_PINS);
 
     /* VIA VT8231 South Bridge (multifunction PCI device) */
     via = OBJECT(pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0),
                                                  true, TYPE_VT8231_ISA));
+    for (i = 0; i < PCI_NUM_PINS; i++) {
+        pm->via_pirq[i] = qdev_get_gpio_in_named(DEVICE(via), "pirq", i);
+    }
     object_property_add_alias(OBJECT(machine), "rtc-time",
                               object_resolve_path_component(via, "rtc"),
                               "date");
@@ -267,6 +285,12 @@ static void pegasos2_machine_reset(MachineState *machine, ShutdownCause reason)
                               PCI_INTERRUPT_LINE, 2, 0x9);
     pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
                               0x50, 1, 0x2);
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
+                              0x55, 1, 0x90);
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
+                              0x56, 1, 0x99);
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
+                              0x57, 1, 0x90);
 
     pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 1) << 8) |
                               PCI_INTERRUPT_LINE, 2, 0x109);
-- 
2.38.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBD76A4304
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:37:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdeX-0005ES-Q6; Mon, 27 Feb 2023 08:34:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWddv-0004za-Hz; Mon, 27 Feb 2023 08:34:24 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWddq-0007fe-VM; Mon, 27 Feb 2023 08:34:13 -0500
Received: by mail-ed1-x52a.google.com with SMTP id cy6so25876462edb.5;
 Mon, 27 Feb 2023 05:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7h7DFpIyPYWA8e6aIzCKHW2L9bDyUG+cLQqGnLqsunY=;
 b=A47rFavkzxsiirFam0FsfIsTzgFHtdx17KQVO1AV2ZQgeggRW8UT1AGHyCEMGIiXLv
 YShmPGd/51O0L7YAheLHIEFNQRbUS8TceVC5QpGaRDPaex+B346XPMyMzBCWfUhRMM1S
 q2dl4kGVEUiiSz5Fc2Iac8lQQh8yeDc5pR+2vHeNLhsvEE/AQq7y21zcQ/r9UnI08vt+
 dYjBFVWgGNTGnFRyU2Q2PVmCLk8YozDU6rOKb4/9xtb01Y2P17CVblFkuZZqWSLDRT7G
 cXaFvcrE7h3RFqSDY+7rZoOGF9RjdtIKCppT8Fi1IT6McRAvgjlUZV+Qw0ZWNTQEcsjt
 4/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7h7DFpIyPYWA8e6aIzCKHW2L9bDyUG+cLQqGnLqsunY=;
 b=UTUrutgU6usdHFEhitmRRnZ1mAzuL7QGsvii1VMdAMOdzYsoMwMLlhgZhUlWsLgH+a
 T8QTSKawZW1L5AymNKvfFeBJlGbIn54WVJYnpKrCHROY2cEMTnRyMSlEf4tg2CuKIQbk
 CfC5vCTWEX0D/RzEevkaaItvBwDyI3Vws2Ye+7W3YRO8NPqIGljaf3j+qbJzytFB3POP
 ajCT/YPiQP0oK9BjNGi2foVYmk9DfI9Bve408WUvQbcEMc0/JyNmY2xi/CxNKx9x6FZL
 2WnHTuQMYZbC1WyHZSmLew18vZXjkF6/X9qncH2Ycn9jNpTmY0UXev9GjWgz4ZamKn2X
 awUw==
X-Gm-Message-State: AO0yUKU+e2Z0j/atXaVGXrjT1UD+OuKbyjBxe64aBGx/u9GD2Sqp+bQE
 VBSUELSXyFr67R2avEvy6yIfJcYtBCM=
X-Google-Smtp-Source: AK7set+HuFmyqvy4jQnTC/ASxe1f7iGINGEP3cFXSgZ16L64Ej/7UjcQ4qxGrgOHObabVFkSfiSmIA==
X-Received: by 2002:a17:907:c293:b0:88d:79df:7cfc with SMTP id
 tk19-20020a170907c29300b0088d79df7cfcmr31561825ejc.62.1677504841915; 
 Mon, 27 Feb 2023 05:34:01 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-154-008.78.55.pool.telefonica.de. [78.55.154.8])
 by smtp.gmail.com with ESMTPSA id
 gx16-20020a1709068a5000b008b69aa62efcsm3253603ejc.62.2023.02.27.05.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 05:34:01 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Huacai Chen <chenhuacai@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rene Engel <ReneEngel80@emailn.de>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v4 5/7] hw/ppc/pegasos2: Fix PCI interrupt routing
Date: Mon, 27 Feb 2023 14:33:23 +0100
Message-Id: <20230227133325.22023-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227133325.22023-1-shentey@gmail.com>
References: <20230227133325.22023-1-shentey@gmail.com>
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
Tested-by: Rene Engel <ReneEngel80@emailn.de>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <eca1ecce0b814ece8d285cb869ff839130a37b70.1677445307.git.balaton@eik.bme.hu>
---
 hw/pci-host/mv64361.c |  4 ----
 hw/ppc/pegasos2.c     | 20 +++++++++++++++++++-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
index f43f33fbd9..3d9132f989 100644
--- a/hw/pci-host/mv64361.c
+++ b/hw/pci-host/mv64361.c
@@ -874,10 +874,6 @@ static void mv64361_realize(DeviceState *dev, Error **errp)
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
index 41688699eb..4e1476673b 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -74,6 +74,8 @@ struct Pegasos2MachineState {
     MachineState parent_obj;
     PowerPCCPU *cpu;
     DeviceState *mv;
+    qemu_irq mv_pirq[PCI_NUM_PINS];
+    qemu_irq via_pirq[PCI_NUM_PINS];
     Vof *vof;
     void *fdt_blob;
     uint64_t kernel_addr;
@@ -96,6 +98,15 @@ static void pegasos2_cpu_reset(void *opaque)
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
@@ -107,7 +118,7 @@ static void pegasos2_init(MachineState *machine)
     I2CBus *i2c_bus;
     const char *fwname = machine->firmware ?: PROM_FILENAME;
     char *filename;
-    int sz;
+    int i, sz;
     uint8_t *spd_data;
 
     /* init CPU */
@@ -157,11 +168,18 @@ static void pegasos2_init(MachineState *machine)
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
-- 
2.39.2



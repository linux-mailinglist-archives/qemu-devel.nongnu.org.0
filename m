Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2FE6A34D0
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:52:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPs8-0002EB-6H; Sun, 26 Feb 2023 17:52:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWPs4-0002Dp-4e; Sun, 26 Feb 2023 17:51:56 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWPs1-00028G-Vi; Sun, 26 Feb 2023 17:51:55 -0500
Received: by mail-ed1-x532.google.com with SMTP id i34so18714910eda.7;
 Sun, 26 Feb 2023 14:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=edg0VYwiFrbtOtCbQI9EwzQQrTlYnAaD8Fdd7zkh8Jo=;
 b=KHh6y4i8qufY/XQwrmWJj3ekgSMfoK6f1NFOAW4t7OEPzuxIU9KbRliowj/qRR49vp
 8H2M4Y50PsLET4s3WlocG6NlXdYLJ1N0eLogDB0Y3M3gOLgjAoFw/RjeVXJ32H/XfZeW
 Zw3kPvenzl1kKayYxjapt9K0Z7n6Oxdlnr3BI09e0o5yZtBj3H392kpXDccZ3bk33so2
 h0hTB7WB+zDCI6I480helKkh6m91lVlg4/59eiTAfuV+8SENjhPt1wqGbAGx3Jew1dW5
 eqR4iL7EPe1W7uHImDYAurLdfnk0TtH52rCvgSmwZpzOI2Z9JVeJRBdrnWI9uYf8gQzc
 4WXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=edg0VYwiFrbtOtCbQI9EwzQQrTlYnAaD8Fdd7zkh8Jo=;
 b=bj+ywwq1dfSsqUZwB6l0l7caxiuXEtfw16s4spSgsVrd/mJExJp0Pikj1GhJYIDRlc
 RuAV/8TuY6zPColkhKukOYFjxlpc+B2sLZzAA0GZXRQTcsZRRL/EvwZKLafqCFCXvkLM
 rx5mPeAsqn/pKSxHXHBQ3XJK2ro2PNaPRghS8AepCrULeUVAw6kcZrp2yrsFbcgsdacm
 SksREcQ/CVU5ofzR6xTjoXnnGVSnC7dOot7Dllkqv9xzoJ74ON075L3dJ1ixaWr/eRac
 gto9ri8ds4vuLrAXdq1JiA0H1cNgmFeWL0sz+Q1F8BWNRJu9K1tlRO0+9WF611FjZfDK
 cIrw==
X-Gm-Message-State: AO0yUKXEINmj3gjL4sQJA0ITp8zgD5DNNUXEJPRTcvPDm9e8wUy2a3s5
 t3SWwvm1RrJ+labM96Prawg=
X-Google-Smtp-Source: AK7set+jP7q6Z6c546qfJsjLAmCSkCkVlNLL9tLdks1wlEcyp/649yqaHsb7v2o2TifoHh0So23AYg==
X-Received: by 2002:aa7:d88c:0:b0:4aa:a4e8:8d5a with SMTP id
 u12-20020aa7d88c000000b004aaa4e88d5amr21479472edq.33.1677451911051; 
 Sun, 26 Feb 2023 14:51:51 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-013-188-032.77.13.pool.telefonica.de.
 [77.13.188.32]) by smtp.gmail.com with ESMTPSA id
 w6-20020a50d786000000b004af7267a0a8sm2403914edi.72.2023.02.26.14.51.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 14:51:50 -0800 (PST)
Date: Sun, 26 Feb 2023 22:51:45 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
CC: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 vr_qemu@t-online.de, ReneEngel80@emailn.de
Subject: Re: [PATCH v3 5/8] hw/ppc/pegasos2: Fix PCI interrupt routing
In-Reply-To: <eca1ecce0b814ece8d285cb869ff839130a37b70.1677445307.git.balaton@eik.bme.hu>
References: <cover.1677445307.git.balaton@eik.bme.hu>
 <eca1ecce0b814ece8d285cb869ff839130a37b70.1677445307.git.balaton@eik.bme.hu>
Message-ID: <4D66E3E5-E870-43AD-A702-3285850C59B3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
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



Am 16=2E Februar 2023 20:27:32 UTC schrieb BALATON Zoltan <balaton@eik=2Eb=
me=2Ehu>:
>According to the PegasosII schematics the PCI interrupt lines are
>connected to both the gpp pins of the Mv64361 north bridge and the
>PINT pins of the VT8231 south bridge so guests can get interrupts from
>either of these=2E So far we only had the MV64361 connections which
>worked for on board devices but for additional PCI devices (such as
>network or sound card added with -device) guest OSes expect interrupt
>from the ISA IRQ 9 where the firmware routes these PCI interrupts in
>VT8231 ISA bridge=2E After the previous patches we can now model this
>and also remove the board specific connection from mv64361=2E Also
>configure routing of these lines when using Virtual Open Firmware to
>match board firmware for guests that expect this=2E
>
>This fixes PCI interrupts on pegasos2 under Linux, MorphOS and AmigaOS=2E
>
>Signed-off-by: BALATON Zoltan <balaton@eik=2Ebme=2Ehu>
>Tested-by: Rene Engel <ReneEngel80@emailn=2Ede>
>Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail=2Ecom>
>---
> hw/pci-host/mv64361=2Ec |  4 ----
> hw/ppc/pegasos2=2Ec     | 26 +++++++++++++++++++++++++-
> 2 files changed, 25 insertions(+), 5 deletions(-)
>
>diff --git a/hw/pci-host/mv64361=2Ec b/hw/pci-host/mv64361=2Ec
>index f43f33fbd9=2E=2E3d9132f989 100644
>--- a/hw/pci-host/mv64361=2Ec
>+++ b/hw/pci-host/mv64361=2Ec
>@@ -874,10 +874,6 @@ static void mv64361_realize(DeviceState *dev, Error =
**errp)
>     }
>     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cpu_irq);
>     qdev_init_gpio_in_named(dev, mv64361_gpp_irq, "gpp", 32);
>-    /* FIXME: PCI IRQ connections may be board specific */
>-    for (i =3D 0; i < PCI_NUM_PINS; i++) {
>-        s->pci[1]=2Eirq[i] =3D qdev_get_gpio_in_named(dev, "gpp", 12 + i=
);
>-    }
> }
>=20
> static void mv64361_reset(DeviceState *dev)
>diff --git a/hw/ppc/pegasos2=2Ec b/hw/ppc/pegasos2=2Ec
>index a9563f4fb2=2E=2E4e1476673b 100644
>--- a/hw/ppc/pegasos2=2Ec
>+++ b/hw/ppc/pegasos2=2Ec
>@@ -74,6 +74,8 @@ struct Pegasos2MachineState {
>     MachineState parent_obj;
>     PowerPCCPU *cpu;
>     DeviceState *mv;
>+    qemu_irq mv_pirq[PCI_NUM_PINS];
>+    qemu_irq via_pirq[PCI_NUM_PINS];
>     Vof *vof;
>     void *fdt_blob;
>     uint64_t kernel_addr;
>@@ -96,6 +98,15 @@ static void pegasos2_cpu_reset(void *opaque)
>     }
> }
>=20
>+static void pegasos2_pci_irq(void *opaque, int n, int level)
>+{
>+    Pegasos2MachineState *pm =3D opaque;
>+
>+    /* PCI interrupt lines are connected to both MV64361 and VT8231 */
>+    qemu_set_irq(pm->mv_pirq[n], level);
>+    qemu_set_irq(pm->via_pirq[n], level);
>+}
>+
> static void pegasos2_init(MachineState *machine)
> {
>     Pegasos2MachineState *pm =3D PEGASOS2_MACHINE(machine);
>@@ -107,7 +118,7 @@ static void pegasos2_init(MachineState *machine)
>     I2CBus *i2c_bus;
>     const char *fwname =3D machine->firmware ?: PROM_FILENAME;
>     char *filename;
>-    int sz;
>+    int i, sz;
>     uint8_t *spd_data;
>=20
>     /* init CPU */
>@@ -157,11 +168,18 @@ static void pegasos2_init(MachineState *machine)
>     /* Marvell Discovery II system controller */
>     pm->mv =3D DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
>                           qdev_get_gpio_in(DEVICE(pm->cpu), PPC6xx_INPUT=
_INT)));
>+    for (i =3D 0; i < PCI_NUM_PINS; i++) {
>+        pm->mv_pirq[i] =3D qdev_get_gpio_in_named(pm->mv, "gpp", 12 + i)=
;
>+    }
>     pci_bus =3D mv64361_get_pci_bus(pm->mv, 1);
>+    pci_bus_irqs(pci_bus, pegasos2_pci_irq, pm, PCI_NUM_PINS);
>=20
>     /* VIA VT8231 South Bridge (multifunction PCI device) */
>     via =3D OBJECT(pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12=
, 0),
>                                                  true, TYPE_VT8231_ISA))=
;
>+    for (i =3D 0; i < PCI_NUM_PINS; i++) {
>+        pm->via_pirq[i] =3D qdev_get_gpio_in_named(DEVICE(via), "pirq", =
i);
>+    }
>     object_property_add_alias(OBJECT(machine), "rtc-time",
>                               object_resolve_path_component(via, "rtc"),
>                               "date");
>@@ -268,6 +286,12 @@ static void pegasos2_machine_reset(MachineState *mac=
hine, ShutdownCause reason)
>                               PCI_INTERRUPT_LINE, 2, 0x9);
>     pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
>                               0x50, 1, 0x2);
>+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
>+                              0x55, 1, 0x90);
>+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
>+                              0x56, 1, 0x99);
>+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
>+                              0x57, 1, 0x90);

Let's not mix aspects (implement VT82XX PCI IRQ routing) with Pegasos2 asp=
ects=2E IOW let's keep these additions in a separate patch to make things c=
learer=2E

>=20
>     pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 1) << 8) |
>                               PCI_INTERRUPT_LINE, 2, 0x109);


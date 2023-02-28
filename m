Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7746E6A61E0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:56:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7x5-0001YD-GK; Tue, 28 Feb 2023 16:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pX7x1-0001XY-VT
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:55:59 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pX7x0-000499-2o
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:55:59 -0500
Received: by mail-ed1-x52a.google.com with SMTP id s26so45926074edw.11
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 13:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677621356;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KqKlmyi9GPLjYjiMm0UnRmGd4vDV64prmDkgCjyXYgk=;
 b=EsXR1PGDmOn59W+5YJmauE49GZ4POeRT6pf9WrmnbpWfgTAAVUlalcUdtseWE7FKfi
 Zs/n83rO1KQVJNr/oj8T2TrM2t7+1a3X4zTsr3aNenvpmpgjdJyW+ZlB5PgLDRSLz9jY
 RyV8r3i78BfWNgNPNhyu+NtL2cLO7Lqp2ZRKItBXfeiTlsNkVZxOkgFi0PVOoEiFdecW
 eoSVvLJkoutEgLAT1Ctm6I+cyfZ9uR2pj1Pzj/CTscDrOprkSAr8OqVNA2fTvcEtSLlf
 1VzYcxCR1nGtHeeLvn2FFJJPZcSmPRtDFlX1E7infi3/QtgzUxkRBMdqZFXaFdiYwnOY
 XFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677621356;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KqKlmyi9GPLjYjiMm0UnRmGd4vDV64prmDkgCjyXYgk=;
 b=zbWdhZDrPAgZ0XGu4NkjvC5DbfIKkbY+8oZfiObAm/qmX4qUmn8SB9ZwRcb6hD0wPc
 8tsH/Qzd+HuHO3xuqN43VjntoErVGmUBQ43rRmSPeVEx9O6ISm8b/DhAcp8rfXkSdH7B
 XqN95OrAyLTuSQ+88Qi4eQLouLxP7NYW43rmkb5li6gC7GQdcI284TrF5GIgwIspb0Rb
 f/wjILE5evXu+LGQQ4Wmg9fpccW3cULWiQCiW3wM4acBSTHmREY0Q4Uh5lAYeHCShldO
 rc7R8kKYULvfY0W8ljJmbf1IaCGPWRsQorWu6QRB755nvkKib7/qB0jzZAmmjQ1Wpp8d
 z9bg==
X-Gm-Message-State: AO0yUKVuDtiKhEXhqh9jFyS7yclsYHdD0+gJN10cJTwICaAPxsXumhrK
 I2Zau0PB4uPA1HhfVOgSTTQC5QtlUro=
X-Google-Smtp-Source: AK7set9hVmTw7jgWVjMSbnZuPp/rdlfSo3jLWy9C6KcdP9kSXk29pQOut8MYQ2NqpvSNmqZHAGwRDw==
X-Received: by 2002:a17:907:c619:b0:888:33a:e359 with SMTP id
 ud25-20020a170907c61900b00888033ae359mr4122545ejc.38.1677621355881; 
 Tue, 28 Feb 2023 13:55:55 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-013-091-172.77.13.pool.telefonica.de.
 [77.13.91.172]) by smtp.gmail.com with ESMTPSA id
 fp2-20020a1709069e0200b008ee5356801dsm4970303ejc.187.2023.02.28.13.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 13:55:55 -0800 (PST)
Date: Tue, 28 Feb 2023 21:55:44 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 3/4] hw/isa/piix: Unify QOM type name of PIIX ISA function
In-Reply-To: <20230210165754.34342-4-philmd@linaro.org>
References: <20230210165754.34342-1-philmd@linaro.org>
 <20230210165754.34342-4-philmd@linaro.org>
Message-ID: <30EE17DE-67F6-4D3C-BA82-EA3A1D256E95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



Am 10=2E Februar 2023 16:57:53 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>Mechanical change doing:
>
>  $ sed -i -e 's/PIIX4_PCI_DEVICE/PIIX4_ISA/g' $(git grep -l PIIX4_PCI_DE=
VICE)
>  $ sed -i -e 's/PIIX3_XEN_DEVICE/PIIX3_ISA_XEN/g' $(git grep -l PIIX3_XE=
N_DEVICE)
>  $ sed -i -e 's/PIIX3_DEVICE/PIIX3_ISA/g' $(git grep -l PIIX3_DEVICE)
>  $ sed -i -e 's/PIIX3_PCI_DEVICE/PIIX_ISA/g' $(git grep -l PIIX3_PCI_DEV=
ICE)
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> hw/i386/pc_piix=2Ec             |  5 ++---
> hw/isa/piix3=2Ec                | 20 ++++++++++----------
> hw/isa/piix4=2Ec                | 10 +++++-----
> hw/mips/malta=2Ec               |  2 +-
> include/hw/southbridge/piix=2Eh | 10 +++++-----
> 5 files changed, 23 insertions(+), 24 deletions(-)
>
>diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>index 7c48ba30e0=2E=2Eafef5ed115 100644
>--- a/hw/i386/pc_piix=2Ec
>+++ b/hw/i386/pc_piix=2Ec
>@@ -220,8 +220,7 @@ static void pc_init1(MachineState *machine,
>     if (pcmc->pci_enabled) {
>         PIIX3State *piix3;
>         PCIDevice *pci_dev;
>-        const char *type =3D xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
>-                                         : TYPE_PIIX3_DEVICE;
>+        const char *type =3D xen_enabled() ? TYPE_PIIX3_ISA_XEN : TYPE_P=
IIX3_ISA;
>=20
>         pci_bus =3D i440fx_init(pci_type,
>                               i440fx_host,
>@@ -235,7 +234,7 @@ static void pc_init1(MachineState *machine,
>         pcms->bus =3D pci_bus;
>=20
>         pci_dev =3D pci_create_simple_multifunction(pci_bus, -1, true, t=
ype);
>-        piix3 =3D PIIX3_PCI_DEVICE(pci_dev);
>+        piix3 =3D PIIX3_ISA(pci_dev);
>         piix3->pic =3D x86ms->gsi;
>         piix3_devfn =3D piix3->dev=2Edevfn;
>         isa_bus =3D ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa=2E0")=
);
>diff --git a/hw/isa/piix3=2Ec b/hw/isa/piix3=2Ec
>index 0ee94a2313=2E=2E38e0c269ae 100644
>--- a/hw/isa/piix3=2Ec
>+++ b/hw/isa/piix3=2Ec
>@@ -112,7 +112,7 @@ static void piix3_write_config(PCIDevice *dev,
> {
>     pci_default_write_config(dev, address, val, len);
>     if (ranges_overlap(address, len, PIIX_PIRQCA, 4)) {
>-        PIIX3State *piix3 =3D PIIX3_PCI_DEVICE(dev);
>+        PIIX3State *piix3 =3D PIIX3_ISA(dev);
>         int pic_irq;
>=20
>         pci_bus_fire_intx_routing_notifier(pci_get_bus(&piix3->dev));
>@@ -145,7 +145,7 @@ static void piix3_write_config_xen(PCIDevice *dev,
>=20
> static void piix3_reset(DeviceState *dev)
> {
>-    PIIX3State *d =3D PIIX3_PCI_DEVICE(dev);
>+    PIIX3State *d =3D PIIX3_ISA(dev);
>     uint8_t *pci_conf =3D d->dev=2Econfig;
>=20
>     pci_conf[0x04] =3D 0x07; /* master, memory and I/O */
>@@ -286,7 +286,7 @@ static const MemoryRegionOps rcr_ops =3D {
>=20
> static void pci_piix3_realize(PCIDevice *dev, Error **errp)
> {
>-    PIIX3State *d =3D PIIX3_PCI_DEVICE(dev);
>+    PIIX3State *d =3D PIIX3_ISA(dev);
>     ISABus *isa_bus;
>=20
>     isa_bus =3D isa_bus_new(DEVICE(d), pci_address_space(dev),
>@@ -349,7 +349,7 @@ static void pci_piix3_class_init(ObjectClass *klass, =
void *data)
> static void piix3_realize(PCIDevice *dev, Error **errp)
> {
>     ERRP_GUARD();
>-    PIIX3State *piix3 =3D PIIX3_PCI_DEVICE(dev);
>+    PIIX3State *piix3 =3D PIIX3_ISA(dev);
>     PCIBus *pci_bus =3D pci_get_bus(dev);
>=20
>     pci_piix3_realize(dev, errp);
>@@ -372,7 +372,7 @@ static void piix3_class_init(ObjectClass *klass, void=
 *data)
> static void piix3_xen_realize(PCIDevice *dev, Error **errp)
> {
>     ERRP_GUARD();
>-    PIIX3State *piix3 =3D PIIX3_PCI_DEVICE(dev);
>+    PIIX3State *piix3 =3D PIIX3_ISA(dev);
>     PCIBus *pci_bus =3D pci_get_bus(dev);
>=20
>     pci_piix3_realize(dev, errp);
>@@ -399,7 +399,7 @@ static void piix3_xen_class_init(ObjectClass *klass, =
void *data)
>=20
> static const TypeInfo piix_isa_types[] =3D {
>     {
>-        =2Ename           =3D TYPE_PIIX3_PCI_DEVICE,
>+        =2Ename           =3D TYPE_PIIX_ISA,
>         =2Eparent         =3D TYPE_PCI_DEVICE,
>         =2Einstance_size  =3D sizeof(PIIX3State),
>         =2Eclass_init     =3D pci_piix3_class_init,
>@@ -410,12 +410,12 @@ static const TypeInfo piix_isa_types[] =3D {
>             { },
>         },
>     }, {
>-        =2Ename           =3D TYPE_PIIX3_DEVICE,
>-        =2Eparent         =3D TYPE_PIIX3_PCI_DEVICE,
>+        =2Ename           =3D TYPE_PIIX3_ISA,
>+        =2Eparent         =3D TYPE_PIIX_ISA,
>         =2Eclass_init     =3D piix3_class_init,
>     }, {
>-        =2Ename           =3D TYPE_PIIX3_XEN_DEVICE,
>-        =2Eparent         =3D TYPE_PIIX3_PCI_DEVICE,
>+        =2Ename           =3D TYPE_PIIX3_ISA_XEN,
>+        =2Eparent         =3D TYPE_PIIX_ISA,
>         =2Eclass_init     =3D piix3_xen_class_init,
>     }
> };
>diff --git a/hw/isa/piix4=2Ec b/hw/isa/piix4=2Ec
>index ef24826993=2E=2E8c51b523e5 100644
>--- a/hw/isa/piix4=2Ec
>+++ b/hw/isa/piix4=2Ec
>@@ -56,7 +56,7 @@ struct PIIX4State {
>     uint8_t rcr;
> };
>=20
>-OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
>+OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_ISA)
>=20
> static void piix4_set_irq(void *opaque, int irq_num, int level)
> {
>@@ -81,7 +81,7 @@ static void piix4_set_irq(void *opaque, int irq_num, in=
t level)
>=20
> static void piix4_isa_reset(DeviceState *dev)
> {
>-    PIIX4State *d =3D PIIX4_PCI_DEVICE(dev);
>+    PIIX4State *d =3D PIIX4_ISA(dev);

PIIX4State holds the state of the whole south bridge and not just the ISA =
function=2E I therefore tend to find PIIX4_ISA() slightly misleading=2E=2E=
=2E

The same will apply to PIIX3 once it got modernized like PIIX4 got already=
=2E

Best regards,
Bernhard

>     uint8_t *pci_conf =3D d->dev=2Econfig;
>=20
>     pci_conf[0x04] =3D 0x07; // master, memory and I/O
>@@ -186,7 +186,7 @@ static const MemoryRegionOps piix4_rcr_ops =3D {
>=20
> static void piix4_realize(PCIDevice *dev, Error **errp)
> {
>-    PIIX4State *s =3D PIIX4_PCI_DEVICE(dev);
>+    PIIX4State *s =3D PIIX4_ISA(dev);
>     PCIBus *pci_bus =3D pci_get_bus(dev);
>     ISABus *isa_bus;
>     qemu_irq *i8259_out_irq;
>@@ -251,7 +251,7 @@ static void piix4_realize(PCIDevice *dev, Error **err=
p)
>=20
> static void piix4_init(Object *obj)
> {
>-    PIIX4State *s =3D PIIX4_PCI_DEVICE(obj);
>+    PIIX4State *s =3D PIIX4_ISA(obj);
>=20
>     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
>     object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
>@@ -283,7 +283,7 @@ static void piix4_class_init(ObjectClass *klass, void=
 *data)
> }
>=20
> static const TypeInfo piix4_info =3D {
>-    =2Ename          =3D TYPE_PIIX4_PCI_DEVICE,
>+    =2Ename          =3D TYPE_PIIX4_ISA,
>     =2Eparent        =3D TYPE_PCI_DEVICE,
>     =2Einstance_size =3D sizeof(PIIX4State),
>     =2Einstance_init =3D piix4_init,
>diff --git a/hw/mips/malta=2Ec b/hw/mips/malta=2Ec
>index ec172b111a=2E=2E5aefeba581 100644
>--- a/hw/mips/malta=2Ec
>+++ b/hw/mips/malta=2Ec
>@@ -1255,7 +1255,7 @@ void mips_malta_init(MachineState *machine)
>=20
>     /* Southbridge */
>     piix4 =3D pci_create_simple_multifunction(pci_bus, PIIX4_PCI_DEVFN, =
true,
>-                                            TYPE_PIIX4_PCI_DEVICE);
>+                                            TYPE_PIIX4_ISA);
>     isa_bus =3D ISA_BUS(qdev_get_child_bus(DEVICE(piix4), "isa=2E0"));
>=20
>     dev =3D DEVICE(object_resolve_path_component(OBJECT(piix4), "ide"));
>diff --git a/include/hw/southbridge/piix=2Eh b/include/hw/southbridge/pii=
x=2Eh
>index a58bf13a41=2E=2E71a82ef266 100644
>--- a/include/hw/southbridge/piix=2Eh
>+++ b/include/hw/southbridge/piix=2Eh
>@@ -58,11 +58,11 @@ struct PIIX3State {
>     MemoryRegion rcr_mem;
> };
>=20
>-#define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
>-#define TYPE_PIIX3_DEVICE "PIIX3"
>-#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
>-#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>+#define TYPE_PIIX_ISA       "pci-piix3"
>+#define TYPE_PIIX3_ISA      "PIIX3"
>+#define TYPE_PIIX3_ISA_XEN  "PIIX3-xen"
>+#define TYPE_PIIX4_ISA      "piix4-isa"
>=20
>-OBJECT_DECLARE_SIMPLE_TYPE(PIIX3State, PIIX3_PCI_DEVICE)
>+OBJECT_DECLARE_SIMPLE_TYPE(PIIX3State, PIIX3_ISA)
>=20
> #endif


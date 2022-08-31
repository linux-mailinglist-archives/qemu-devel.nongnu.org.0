Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ECA5A7EBA
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:28:33 +0200 (CEST)
Received: from localhost ([::1]:35000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTNlh-00075T-1N
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oTNh2-00027T-11; Wed, 31 Aug 2022 09:23:48 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:16839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oTNgy-0006iV-Nu; Wed, 31 Aug 2022 09:23:42 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 233697470B9;
 Wed, 31 Aug 2022 15:23:38 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D96CE746FDE; Wed, 31 Aug 2022 15:23:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D7EC8746E07;
 Wed, 31 Aug 2022 15:23:37 +0200 (CEST)
Date: Wed, 31 Aug 2022 15:23:37 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Huacai Chen <chenhuacai@kernel.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v3 06/10] hw/isa/vt82c686: Instantiate USB functions in
 host device
In-Reply-To: <20220831095914.2041-7-shentey@gmail.com>
Message-ID: <331bbd5a-aeaa-d5c0-cf8f-cde5b22d8a3@eik.bme.hu>
References: <20220831095914.2041-1-shentey@gmail.com>
 <20220831095914.2041-7-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 31 Aug 2022, Bernhard Beschow wrote:
> The USB functions can be enabled/disabled through the ISA function. Also
> its interrupt routing can be influenced there.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> hw/isa/vt82c686.c   | 12 ++++++++++++
> hw/mips/fuloong2e.c |  3 ---
> hw/ppc/pegasos2.c   |  4 ----
> 3 files changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 9d946cea54..66a4b9c230 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -23,6 +23,7 @@
> #include "hw/intc/i8259.h"
> #include "hw/irq.h"
> #include "hw/dma/i8257.h"
> +#include "hw/usb/hcd-uhci.h"
> #include "hw/timer/i8254.h"
> #include "hw/rtc/mc146818rtc.h"
> #include "migration/vmstate.h"
> @@ -546,6 +547,7 @@ struct ViaISAState {
>     qemu_irq *isa_irqs;
>     ViaSuperIOState via_sio;
>     PCIIDEState ide;
> +    UHCIState uhci[2];
> };
>
> static const VMStateDescription vmstate_via = {
> @@ -563,6 +565,8 @@ static void via_isa_init(Object *obj)
>     ViaISAState *s = VIA_ISA(obj);
>
>     object_initialize_child(obj, "ide", &s->ide, "via-ide");
> +    object_initialize_child(obj, "uhci1", &s->uhci[0], "vt82c686b-usb-uhci");
> +    object_initialize_child(obj, "uhci2", &s->uhci[1], "vt82c686b-usb-uhci");

Sorry for not saying this yesterday, this can also be done separately so 
no need for another version of this series if not needed for another 
reason but could we add a define for vt82c686b-usb-uhci in 
include/hw/isa/vt82c686.h and use that here and in 
hw/usb/vt82c686-uhci-pci.c ?

Regards,
BALATON Zoltan

> }
>
> static const TypeInfo via_isa_info = {
> @@ -629,6 +633,14 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>     if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
>         return;
>     }
> +
> +    /* Functions 2-3: USB Ports */
> +    for (i = 0; i < ARRAY_SIZE(s->uhci); i++) {
> +        qdev_prop_set_int32(DEVICE(&s->uhci[i]), "addr", d->devfn + 2 + i);
> +        if (!qdev_realize(DEVICE(&s->uhci[i]), BUS(pci_bus), errp)) {
> +            return;
> +        }
> +    }
> }
>
> /* TYPE_VT82C686B_ISA */
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 32605901e7..dc92223b76 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -208,9 +208,6 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
>     pci_ide_create_devs(dev);
>
> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), "vt82c686b-usb-uhci");
> -
>     dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
>     *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
>
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 8bc528a560..85cca6f7a6 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -168,10 +168,6 @@ static void pegasos2_init(MachineState *machine)
>     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
>     pci_ide_create_devs(dev);
>
> -    /* VT8231 function 2-3: USB Ports */
> -    pci_create_simple(pci_bus, PCI_DEVFN(12, 2), "vt82c686b-usb-uhci");
> -    pci_create_simple(pci_bus, PCI_DEVFN(12, 3), "vt82c686b-usb-uhci");
> -
>     /* VT8231 function 4: Power Management Controller */
>     dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 4), TYPE_VT8231_PM);
>     i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
>


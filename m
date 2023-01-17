Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B332566E850
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 22:21:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHtMt-0001mb-VY; Tue, 17 Jan 2023 16:19:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pHtMr-0001mO-6H; Tue, 17 Jan 2023 16:19:41 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pHtMo-00007i-Re; Tue, 17 Jan 2023 16:19:40 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6A79F7462DB;
 Tue, 17 Jan 2023 22:17:11 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2DBB27457E7; Tue, 17 Jan 2023 22:17:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2C13E7456E3;
 Tue, 17 Jan 2023 22:17:11 +0100 (CET)
Date: Tue, 17 Jan 2023 22:17:11 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH 2/2] hw/ppc/pegasos2: Extract via_vt8231_create()
 helper
In-Reply-To: <20230117201640.88365-3-philmd@linaro.org>
Message-ID: <187a86f4-64fc-3ba1-1a20-a19c33aa82f9@eik.bme.hu>
References: <20230117201640.88365-1-philmd@linaro.org>
 <20230117201640.88365-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-1286013133-1673990011=:93923"
Content-ID: <5c757bd9-2ddc-e976-473d-1de400821309@eik.bme.hu>
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1286013133-1673990011=:93923
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <e6c6076e-c8d5-2e87-0efb-dcc744e49ca1@eik.bme.hu>

On Tue, 17 Jan 2023, Philippe Mathieu-Daudé wrote:
> Simplify a bit pegasos2_init() by extracting the VIA southbridge
> creation code into a new via_vt8231_create() helper.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> hw/ppc/pegasos2.c | 33 +++++++++++++++++++++------------
> 1 file changed, 21 insertions(+), 12 deletions(-)
>
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index ac69aee099..445cb5ef31 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -96,6 +96,25 @@ static void pegasos2_cpu_reset(void *opaque)
>     }
> }
>
> +static PCIDevice *via_vt8231_create(MachineState *machine, PCIBus *pci_bus)
> +{
> +    Pegasos2MachineState *pm = PEGASOS2_MACHINE(machine);
> +    PCIDevice *dev, *via;
> +
> +    via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0),
> +                                          true, TYPE_VT8231_ISA);
> +    object_property_add_alias(OBJECT(machine), "rtc-time",
> +                              object_resolve_path_component(OBJECT(via), "rtc"),
> +                              "date");
> +    qdev_connect_gpio_out(DEVICE(via), 0,
> +                          qdev_get_gpio_in_named(pm->mv, "gpp", 31));
> +
> +    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
> +    pci_ide_create_devs(dev);
> +
> +    return via;
> +}
> +
> static I2CBus *via_i2c_bus(PCIDevice *via)
> {
>     PCIDevice *dev;
> @@ -110,7 +129,7 @@ static void pegasos2_init(MachineState *machine)
>     CPUPPCState *env;
>     MemoryRegion *rom = g_new(MemoryRegion, 1);
>     PCIBus *pci_bus;
> -    PCIDevice *dev, *via;
> +    PCIDevice *via;
>     const char *fwname = machine->firmware ?: PROM_FILENAME;
>     char *filename;
>     int sz;
> @@ -166,17 +185,7 @@ static void pegasos2_init(MachineState *machine)
>     pci_bus = mv64361_get_pci_bus(pm->mv, 1);
>
>     /* VIA VT8231 South Bridge (multifunction PCI device) */
> -    via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
> -                                          TYPE_VT8231_ISA);
> -    object_property_add_alias(OBJECT(machine), "rtc-time",
> -                              object_resolve_path_component(OBJECT(via),
> -                                                            "rtc"),

Is this series to help any later patches or is it proposed on its own? In 
the latter case I don't see how this would improve it much. The only 
useful change in the series is removing the unnecessary line break before 
"rtc"); here, otherwise moving patts of this init routine to separate 
functions does not make it simpler just makes you jump around instead of 
being able to read it linearly. So if this makes it possible for later 
patches to move some of it elsewhere then OK otherwise I'd say I'm OK with 
how it is now, it's just the normal unreadable QOM stuff you see 
everywhere after removing legacy init functions.

Regards,
BALATON Zoltan

> -                              "date");
> -    qdev_connect_gpio_out(DEVICE(via), 0,
> -                          qdev_get_gpio_in_named(pm->mv, "gpp", 31));
> -
> -    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
> -    pci_ide_create_devs(dev);
> +    via = via_vt8231_create(machine, pci_bus);
>
>     spd_data = spd_data_generate(DDR, machine->ram_size);
>     smbus_eeprom_init_one(via_i2c_bus(via), 0x57, spd_data);
>
--3866299591-1286013133-1673990011=:93923--


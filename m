Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAF43A97C6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 12:39:22 +0200 (CEST)
Received: from localhost ([::1]:33730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltSx7-0002Og-L9
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 06:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ltSwB-00010p-T5; Wed, 16 Jun 2021 06:38:24 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:29498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ltSw9-0006TC-8m; Wed, 16 Jun 2021 06:38:23 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5E42774570B;
 Wed, 16 Jun 2021 12:38:19 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 311E87456E3; Wed, 16 Jun 2021 12:38:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2F50E7456B4;
 Wed, 16 Jun 2021 12:38:19 +0200 (CEST)
Date: Wed, 16 Jun 2021 12:38:19 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [RFC PATCH 4/5] ppc/pegasos2: Use Virtual Open Firmware as
 firmware replacement
In-Reply-To: <e8ecfff0-424f-7548-113f-56cd0377731e@ozlabs.ru>
Message-ID: <e2b2eca6-49fc-c529-b441-a429e27c72ac@eik.bme.hu>
References: <cover.1622994395.git.balaton@eik.bme.hu>
 <53e3f069ab536bc2d0c6b3e39418bc85357631ad.1622994395.git.balaton@eik.bme.hu>
 <55582a05-160a-ac1d-75ac-7e636fa2fd7d@ozlabs.ru>
 <2bd3b42-6556-e47c-c590-bb52e22b2577@eik.bme.hu>
 <e8ecfff0-424f-7548-113f-56cd0377731e@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1696452828-1623839899=:81030"
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1696452828-1623839899=:81030
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 16 Jun 2021, Alexey Kardashevskiy wrote:
> On 6/15/21 19:44, BALATON Zoltan wrote:
>> On Tue, 15 Jun 2021, Alexey Kardashevskiy wrote:
>>> On 6/7/21 01:46, BALATON Zoltan wrote:
>>>> The pegasos2 board comes with an Open Firmware compliant ROM based on
>>>> SmartFirmware but it has some changes that are not open source
>>>> therefore the ROM binary cannot be included in QEMU. Guests running on
>>>> the board however depend on services provided by the firmware. The
>>>> Virtual Open Firmware recently added to QEMU imlements a minimal set
>>>> of these services to allow some guests to boot without the original
>>>> firmware. This patch adds VOF as the default firmware for pegasos2
>>>> which allows booting Linux and MorphOS via -kernel option while a ROM
>>>> image can still be used with -bios for guests that don't run with VOF.
>>>> 
>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>> ---
>>>>   hw/ppc/Kconfig    |   1 +
>>>>   hw/ppc/pegasos2.c | 622 +++++++++++++++++++++++++++++++++++++++++++++-
>>>>   2 files changed, 621 insertions(+), 2 deletions(-)
>>>> 
>>>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>>>> index b895720b28..0eb48128fe 100644
>>>> --- a/hw/ppc/Kconfig
>>>> +++ b/hw/ppc/Kconfig
>>>> @@ -75,6 +75,7 @@ config PEGASOS2
>>>>       select VT82C686
>>>>       select IDE_VIA
>>>>       select SMBUS_EEPROM
>>>> +    select VOF
>>>>   # This should come with VT82C686
>>>>       select ACPI_X86
>>>>   diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
>>>> index 07971175c9..91e5fa8fbe 100644
>>>> --- a/hw/ppc/pegasos2.c
>>>> +++ b/hw/ppc/pegasos2.c
>> [...]
>>>> +static void add_pci_device(PCIBus *bus, PCIDevice *d, void *opaque)
>>>> +{
>>>> +    FDTInfo *fi = opaque;
>>>> +    GString *node = g_string_new(NULL);
>>>> +    uint32_t cells[(PCI_NUM_REGIONS + 1) * 5];
>>>> +    int i, j;
>>>> +    const char *name = NULL;
>>>> +    g_autofree const gchar *pn = g_strdup_printf("pci%x,%x",
>>>> + pci_get_word(&d->config[PCI_VENDOR_ID]),
>>>> + pci_get_word(&d->config[PCI_DEVICE_ID]));
>>>> +
>>>> +    for (i = 0; device_map[i].id; i++) {
>>>> +        if (!strcmp(pn, device_map[i].id)) {
>>>> +            name = device_map[i].name;
>>>> +            break;
>>>> +        }
>>>> +    }
>>>> +    g_string_printf(node, "%s/%s@%x", fi->path, (name ?: pn),
>>>> +                    PCI_SLOT(d->devfn));
>>>> +    if (PCI_FUNC(d->devfn)) {
>>>> +        g_string_append_printf(node, ",%x", PCI_FUNC(d->devfn));
>>>> +    }
>>>> +
>>>> +    qemu_fdt_add_subnode(fi->fdt, node->str);
>>>> +    if (device_map[i].dtf) {
>>>> +        FDTInfo cfi = { fi->fdt, node->str };
>>>> +        device_map[i].dtf(bus, d, &cfi);
>>>> +    }
>>>> +    cells[0] = cpu_to_be32(d->devfn << 8);
>>>> +    cells[1] = 0;
>>>> +    cells[2] = 0;
>>>> +    cells[3] = 0;
>>>> +    cells[4] = 0;
>>>> +    j = 5;
>>>> +    for (i = 0; i < PCI_NUM_REGIONS; i++) {
>>>> +        if (!d->io_regions[i].size) {
>>>> +            continue;
>>>> +        }
>>>> +        cells[j] = cpu_to_be32(d->devfn << 8 | (PCI_BASE_ADDRESS_0 + i * 
>>>> 4));
>>>> +        if (d->io_regions[i].type & PCI_BASE_ADDRESS_SPACE_IO) {
>>>> +            cells[j] |= cpu_to_be32(1 << 24);
>>>> +        } else {
>>>> +            cells[j] |= cpu_to_be32(2 << 24);
>>>> +            if (d->io_regions[i].type & PCI_BASE_ADDRESS_MEM_PREFETCH) {
>>>> +                cells[j] |= cpu_to_be32(4 << 28);
>>>> +            }
>>>> +        }
>>>> +        cells[j + 1] = 0;
>>>> +        cells[j + 2] = 0;
>>>> +        cells[j + 3] = cpu_to_be32(d->io_regions[i].size >> 32);
>>>> +        cells[j + 4] = cpu_to_be32(d->io_regions[i].size);
>>>> +        j += 5;
>>>> +    }
>>> 
>>> 
>>> btw I was wondering if Linux on pegasos2 could assign resources when 
>>> /chosen/linux,pci-probe-only is in the FDT, could not it? Or the serial 
>>> device does not probe and Linux does not boot?
>> 
>> Linux probes PCI devices by itself but MorphOS relies on the device tree 
>> entries so I need at least the reg properties for that then it will map the 
>> BARs but I think it won't scan the bus otherwise. You still seem to add PCI 
>> devices in spapr too, at least I think I've got the idea for this function 
>> above from there.
>
>
> Linux does not scan, this is why we are adding devices in the FDT for pseries 
> (and likely so should you) but Linux does reassign resources if something is 
> wrong.
>
> Does MorphOS boot with this patchset? If it does not, and Linux reassigns 
> resources, we are probably better off with a minimalist approach and skip 
> resource assignment.

MorphOS and Linux boot with this and I don't understand what you mean by 
resource assingment. I'm not setting BARs just adding info about them in 
the reg property but the address is 0, it's still the guest OS (Linux or 
MorphOS) that maps these where it wants. (The board firmware does map some 
devices such as USB or IDE it uses itself but fortunately no guest depends 
on that and they enable devices if they aren't yet enabled.)

Regards,
BALATON Zoltan
--3866299591-1696452828-1623839899=:81030--


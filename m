Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1243D6F04D2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 13:16:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1przav-00019E-GQ; Thu, 27 Apr 2023 07:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1przat-00018g-Mx; Thu, 27 Apr 2023 07:15:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1przar-0000Pf-Il; Thu, 27 Apr 2023 07:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uvNC9+KaK2jDTbU2g85QaZvCwdDjl3iVauq3Z4U+tf0=; b=jzkMKorkHKkXpF2L4h/ngdoSp/
 1GCInUOYLRvsc7zZIN2KTa+FgFjshf08wki+dejNSFyab9aTkXsdBzyL4qg+lzVJzZgne3HQ5Npv6
 VwVmobdlQYHuFre8zjMqe2LakTzUi0d8Xcg+8NoY2HLS0LWeV680eHuS8wTroa/ozXNnvcQLxTi9r
 IXcbjrRceSDlWZjpXM2E+8QysE267PUjDCT038R4/qkSLDWoM4RvRALdNhkj7WgVVWd7zAB+nHlwU
 vN8tAQSfbyj86Z3eQ2Wi9GPf/9gQKDk7BdHW7p2aMu3NZFPVb2FX4xo5PNTZaD8RjhpOeYx0BFmyq
 qXj0gC/ePIyuzW+K2iHkxjfMEteTbLc+Nku+6cj9vt/HRE4O5jCIGXi5Ql4uVWaZDS88wJAnEv/eY
 M0NmKOBFr1bwDye6Wcdv7/blWr5kigVksmxTKRn1p5goHPLcebIH3nhYNt6/ciH5luW4Tyv8+lYKl
 NID+c72HJSyYP6ukw2FS/UChzhhQu/ZrSIcP5jNWavvdax2Oq5+RuBltyfy0DzVlnnpD/ZXKGs3Sh
 +HuAXHwVahP5qlrq/UX0xETVL1dswZkRO8RSpMvEjvgh3ujHKKAXdPG8fLqqAVAdu+wyiD/SB0Wib
 v2ZSBM7Mx6TNySEu5lxE+ZJRMhznYDm8+RRhXfrP0=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1przZp-000374-IV; Thu, 27 Apr 2023 12:14:21 +0100
Message-ID: <adf8695c-3369-e646-000a-5ef15a9112ac@ilande.co.uk>
Date: Thu, 27 Apr 2023 12:15:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-12-shentey@gmail.com>
 <b4b8c651-3874-a919-1221-d09b3842e3c8@ilande.co.uk>
 <2BE97CCD-7EB4-4F02-B504-194C7B40A900@gmail.com>
 <df0667fa-ce41-65c0-46e3-1fa1b7ebe8fe@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <df0667fa-ce41-65c0-46e3-1fa1b7ebe8fe@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 11/13] hw/ide/sii3112: Reuse PCIIDEState::{cmd,data}_ops
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/04/2023 00:24, BALATON Zoltan wrote:

> On Wed, 26 Apr 2023, Bernhard Beschow wrote:
>> Am 26. April 2023 11:41:54 UTC schrieb Mark Cave-Ayland 
>> <mark.cave-ayland@ilande.co.uk>:
>>> On 22/04/2023 16:07, Bernhard Beschow wrote:
>>>
>>>> Allows to unexport pci_ide_{cmd,data}_le_ops and models TYPE_SII3112_PCI as a
>>>> standard-compliant PCI IDE device.
>>>>
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>> ---
>>>>   include/hw/ide/pci.h |  2 --
>>>>   hw/ide/pci.c         |  4 ++--
>>>>   hw/ide/sii3112.c     | 50 ++++++++++++++++----------------------------
>>>>   3 files changed, 20 insertions(+), 36 deletions(-)
>>>>
>>>> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
>>>> index 5025df5b82..dbb4b13161 100644
>>>> --- a/include/hw/ide/pci.h
>>>> +++ b/include/hw/ide/pci.h
>>>> @@ -62,6 +62,4 @@ void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
>>>>   extern MemoryRegionOps bmdma_addr_ioport_ops;
>>>>   void pci_ide_create_devs(PCIDevice *dev);
>>>>   -extern const MemoryRegionOps pci_ide_cmd_le_ops;
>>>> -extern const MemoryRegionOps pci_ide_data_le_ops;
>>>>   #endif
>>>> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
>>>> index b2fcc00a64..97ccc75aa6 100644
>>>> --- a/hw/ide/pci.c
>>>> +++ b/hw/ide/pci.c
>>>> @@ -60,7 +60,7 @@ static void pci_ide_ctrl_write(void *opaque, hwaddr addr,
>>>>       ide_ctrl_write(bus, addr + 2, data);
>>>>   }
>>>>   -const MemoryRegionOps pci_ide_cmd_le_ops = {
>>>> +static const MemoryRegionOps pci_ide_cmd_le_ops = {
>>>>       .read = pci_ide_status_read,
>>>>       .write = pci_ide_ctrl_write,
>>>>       .endianness = DEVICE_LITTLE_ENDIAN,
>>>> @@ -98,7 +98,7 @@ static void pci_ide_data_write(void *opaque, hwaddr addr,
>>>>       }
>>>>   }
>>>>   -const MemoryRegionOps pci_ide_data_le_ops = {
>>>> +static const MemoryRegionOps pci_ide_data_le_ops = {
>>>>       .read = pci_ide_data_read,
>>>>       .write = pci_ide_data_write,
>>>>       .endianness = DEVICE_LITTLE_ENDIAN,
>>>> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
>>>> index 0af897a9ef..9cf920369f 100644
>>>> --- a/hw/ide/sii3112.c
>>>> +++ b/hw/ide/sii3112.c
>>>> @@ -88,21 +88,9 @@ static uint64_t sii3112_reg_read(void *opaque, hwaddr addr,
>>>>           val |= (d->regs[1].confstat & (1UL << 11) ? (1 << 4) : 0);
>>>>           val |= (uint32_t)d->i.bmdma[1].status << 16;
>>>>           break;
>>>> -    case 0x80 ... 0x87:
>>>> -        val = pci_ide_data_le_ops.read(&d->i.bus[0], addr - 0x80, size);
>>>> -        break;
>>>> -    case 0x8a:
>>>> -        val = pci_ide_cmd_le_ops.read(&d->i.bus[0], 2, size);
>>>> -        break;
>>>>       case 0xa0:
>>>>           val = d->regs[0].confstat;
>>>>           break;
>>>> -    case 0xc0 ... 0xc7:
>>>> -        val = pci_ide_data_le_ops.read(&d->i.bus[1], addr - 0xc0, size);
>>>> -        break;
>>>> -    case 0xca:
>>>> -        val = pci_ide_cmd_le_ops.read(&d->i.bus[1], 2, size);
>>>> -        break;
>>>>       case 0xe0:
>>>>           val = d->regs[1].confstat;
>>>>           break;
>>>> @@ -171,18 +159,6 @@ static void sii3112_reg_write(void *opaque, hwaddr addr,
>>>>       case 0x0c ... 0x0f:
>>>>           bmdma_addr_ioport_ops.write(&d->i.bmdma[1], addr - 12, val, size);
>>>>           break;
>>>> -    case 0x80 ... 0x87:
>>>> -        pci_ide_data_le_ops.write(&d->i.bus[0], addr - 0x80, val, size);
>>>> -        break;
>>>> -    case 0x8a:
>>>> -        pci_ide_cmd_le_ops.write(&d->i.bus[0], 2, val, size);
>>>> -        break;
>>>> -    case 0xc0 ... 0xc7:
>>>> -        pci_ide_data_le_ops.write(&d->i.bus[1], addr - 0xc0, val, size);
>>>> -        break;
>>>> -    case 0xca:
>>>> -        pci_ide_cmd_le_ops.write(&d->i.bus[1], 2, val, size);
>>>> -        break;
>>>>       case 0x100:
>>>>           d->regs[0].scontrol = val & 0xfff;
>>>>           if (val & 1) {
>>>> @@ -259,6 +235,11 @@ static void sii3112_pci_realize(PCIDevice *dev, Error **errp)
>>>>       pci_config_set_interrupt_pin(dev->config, 1);
>>>>       pci_set_byte(dev->config + PCI_CACHE_LINE_SIZE, 8);
>>>>   +    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->data_ops[0]);
>>>> +    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &s->cmd_ops[0]);
>>>> +    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &s->data_ops[1]);
>>>> +    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &s->cmd_ops[1]);
>>>> +
>>>>       /* BAR5 is in PCI memory space */
>>>>       memory_region_init_io(&d->mmio, OBJECT(d), &sii3112_reg_ops, d,
>>>>                            "sii3112.bar5", 0x200);
>>>> @@ -266,17 +247,22 @@ static void sii3112_pci_realize(PCIDevice *dev, Error **errp)
>>>>         /* BAR0-BAR4 are PCI I/O space aliases into BAR5 */
>>>>       mr = g_new(MemoryRegion, 1);
>>>> -    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar0", &d->mmio, 0x80, 8);
>>>> -    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, mr);
>>>> +    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar0", &s->data_ops[0], 0,
>>>> +                             memory_region_size(&s->data_ops[0]));
>>>> +    memory_region_add_subregion_overlap(&d->mmio, 0x80, mr, 1);
>>>>       mr = g_new(MemoryRegion, 1);
>>>> -    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar1", &d->mmio, 0x88, 4);
>>>> -    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, mr);
>>>> +    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar1", &s->cmd_ops[0], 0,
>>>> +                             memory_region_size(&s->cmd_ops[0]));
>>>> +    memory_region_add_subregion_overlap(&d->mmio, 0x88, mr, 1);
>>>>       mr = g_new(MemoryRegion, 1);
>>>> -    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar2", &d->mmio, 0xc0, 8);
>>>> -    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, mr);
>>>> +    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar2", &s->data_ops[1], 0,
>>>> +                             memory_region_size(&s->data_ops[1]));
>>>> +    memory_region_add_subregion_overlap(&d->mmio, 0xc0, mr, 1);
>>>>       mr = g_new(MemoryRegion, 1);
>>>> -    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar3", &d->mmio, 0xc8, 4);
>>>> -    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, mr);
>>>> +    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar3", &s->cmd_ops[1], 0,
>>>> +                             memory_region_size(&s->cmd_ops[1]));
>>>> +    memory_region_add_subregion_overlap(&d->mmio, 0xc8, mr, 1);
>>>> +
>>>>       mr = g_new(MemoryRegion, 1);
>>>>       memory_region_init_alias(mr, OBJECT(d), "sii3112.bar4", &d->mmio, 0, 16);
>>>>       pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, mr);
>>>
>>> So if I read this right, this is now switching the aliases over on BAR5 to allow 
>>> re-use of the common IDE/BMDMA BARs in PCIIDEState? If that's correct then I think 
>>> the commit message needs a bit more detail, otherwise:
>>
>> That's correct. Besides improving the commit message I'll additonally split this 
>> patch into two to show what's going on.
>>
>> Furthermore, I'd init the memory regions in sii3112's init method rather than in 
>> realize(). This will be more consistent with the other PCI IDE device models and 
>> with the other memory regions.
> 
> Why is an init method meeded? If it's not needed why add it? Just keep it simple. My 
> view on these methods is that usually only a realize method is needed which is the 
> normal constructor of the object, but sometimes we need some properties or something 
> else to be available that can configure the object before realising which is when an 
> init method is needed. Sometimes QEMU creates an object then destroys it without 
> realising (I think e.g. when using help to query device properties) so then memory 
> regions would be created and destroyed pointlessly. So unless there's a good reason 
> to have an init method I'd leave this device without one to keep it simple. That 
> other devices have an init method does not explain why this one should have one. 
> Maybe those devices need it for some properties or they are just old code and not 
> properly QOM'ified.

 From memory one of the QOM developer guides recommends that all initialisation 
should be placed in .instance_init, except for objects that depend on properties 
which are set after .instance_init but before .realize().

Certainly there is some flexibility around this for legacy code, however quite a few 
reviewers have picked up on previous series I have posted when I have forgotten to 
move something from .realize() to .instance_init() when allowed after refactoring.


ATB,

Mark.


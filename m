Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC75D2E870C
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 12:28:02 +0100 (CET)
Received: from localhost ([::1]:58358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvf4j-000105-R1
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 06:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kvezM-0003dM-Qy; Sat, 02 Jan 2021 06:22:28 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:41238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kvezK-0002Oe-IB; Sat, 02 Jan 2021 06:22:28 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6BEE37470FA;
 Sat,  2 Jan 2021 12:22:24 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 283527470DD; Sat,  2 Jan 2021 12:22:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 25FC774645F;
 Sat,  2 Jan 2021 12:22:24 +0100 (CET)
Date: Sat, 2 Jan 2021 12:22:24 +0100 (CET)
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 3/5] hw/pci-host/bonito: Remap PCI "lo" regions when
 PCIMAP reg is modified
In-Reply-To: <2da14074-a4ef-e90c-ea42-74d48ca06afd@amsat.org>
Message-ID: <293aa484-89c8-acc2-b9a3-37f17a506a2d@eik.bme.hu>
References: <20210101231215.1870611-1-f4bug@amsat.org>
 <20210101231215.1870611-4-f4bug@amsat.org>
 <CAFEAcA_Hi+4BAPL+0BhDgbsXtzDQjiCs0SAs44mKgUbcSE+XCg@mail.gmail.com>
 <2da14074-a4ef-e90c-ea42-74d48ca06afd@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-319679829-1609586544=:72202"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Qemu-block <qemu-block@nongnu.org>, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-319679829-1609586544=:72202
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 2 Jan 2021, Philippe Mathieu-Daudé wrote:
> On 1/2/21 12:19 AM, Peter Maydell wrote:
>> On Fri, 1 Jan 2021 at 23:12, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>> Per the datasheet (Chapter 5.7.1. "PCI address regions"),
>>> the PCIMAP register:
>>>
>>>   Map the 64Mbyte regions marked "PCI_Lo" in the CPU's memory map,
>>>   each of which can be assigned to any 64 Mbyte-aligned region of
>>>   PCI memory. The address appearing on the PCI bus consists of the
>>>   low 26 bits of the CPU physical address, with the high 6 bits
>>>   coming from the appropriate base6 field. Each of the three regions
>>>   is an independent window onto PCI memory, and can be positioned on
>>>   any 64Mbyte boundary in PCI space.
>>>
>>> Remap the 3 regions on reset and when PCIMAP is updated.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  hw/pci-host/bonito.c | 49 ++++++++++++++++++++++++++++++++------------
>>>  1 file changed, 36 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
>>> index a99eced0657..c58eeaf504c 100644
>>> --- a/hw/pci-host/bonito.c
>>> +++ b/hw/pci-host/bonito.c
>>> @@ -137,6 +137,10 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
>>>
>>>  /* 4. PCI address map control */
>>>  #define BONITO_PCIMAP           (0x10 >> 2)      /* 0x110 */
>>> +FIELD(PCIMAP, LO0,               0, 6)
>>> +FIELD(PCIMAP, LO1,               6, 6)
>>> +FIELD(PCIMAP, LO2,              12, 6)
>>> +FIELD(PCIMAP, 2G,               18, 1)
>>>  #define BONITO_PCIMEMBASECFG    (0x14 >> 2)      /* 0x114 */
>>>  #define BONITO_PCIMAP_CFG       (0x18 >> 2)      /* 0x118 */
>>>
>>> @@ -237,6 +241,7 @@ struct BonitoState {
>>>      qemu_irq *pic;
>>>      PCIBonitoState *pci_dev;
>>>      MemoryRegion pci_mem;
>>> +    MemoryRegion pcimem_lo_alias[3];
>>>  };
>>>
>>>  #define TYPE_BONITO_PCI_HOST_BRIDGE "Bonito-pcihost"
>>> @@ -245,6 +250,31 @@ OBJECT_DECLARE_SIMPLE_TYPE(BonitoState, BONITO_PCI_HOST_BRIDGE)
>>>  #define TYPE_PCI_BONITO "Bonito"
>>>  OBJECT_DECLARE_SIMPLE_TYPE(PCIBonitoState, PCI_BONITO)
>>>
>>> +static void bonito_remap(PCIBonitoState *s)
>>> +{
>>> +    static const char *const region_name[3] = {
>>> +        "pci.lomem0", "pci.lomem1", "pci.lomem2"
>>> +    };
>>> +    BonitoState *bs = BONITO_PCI_HOST_BRIDGE(s->pcihost);
>>> +
>>> +    for (size_t i = 0; i < 3; i++) {
>>> +        uint32_t offset = extract32(s->regs[BONITO_PCIMAP], 6 * i, 6) << 26;
>>> +
>>> +        if (memory_region_is_mapped(&bs->pcimem_lo_alias[i])) {
>>> +            memory_region_del_subregion(get_system_memory(),
>>> +                                        &bs->pcimem_lo_alias[i]);
>>> +            object_unparent(OBJECT(&bs->pcimem_lo_alias[i]));
>>> +        }
>>> +
>>> +        memory_region_init_alias(&bs->pcimem_lo_alias[i], OBJECT(s),
>>> +                                 region_name[i], &bs->pci_mem,
>>> +                                 offset, 64 * MiB);
>>> +        memory_region_add_subregion(get_system_memory(),
>>> +                                    BONITO_PCILO_BASE + i * 64 * MiB,
>>> +                                    &bs->pcimem_lo_alias[i]);
>>> +    }
>>
>> Rather than delete-and-reinit-and-add, it's probably better to
>> just create the subregions once at device startup, and then use
>> memory_region_set_enabled() and memory_region_set_address()
>> to manipulate whether the subregion is visible and what address
>> in the system memory it is mapped at.
>
> Great! Thanks Peter :) TIL these functions.
> From what I understand from memory_region_readd_subregion (called
> from memory_region_set_address) using memory_region_set_enabled()
> directly is enough.

I have similar code in the series I've just posted where I'm mapping 
regions of serial devices. I did consider using set_enabled and 
set_address but ended up with removing and adding regions because I'm not 
sure what happens if guest tries to move one region over another like 
having one region at a default location while guest tries to map the other 
one there (the pegasos2 maps serial at 0x2f8 which is normally COM2 on a 
PC). This should not happen in theory but when removing disabled regions 
it cannot happen so that looks safer therefore I chose to do that. Not 
sure if this could be a problem here just shared my thughts about this.

Regards,
BALATON Zoltan
--3866299591-319679829-1609586544=:72202--


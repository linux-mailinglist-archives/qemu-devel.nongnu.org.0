Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2459A6EBEA5
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 12:43:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqXAu-0001O4-8L; Sun, 23 Apr 2023 06:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pqXAs-0001NY-9M; Sun, 23 Apr 2023 06:42:30 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pqXAp-00080i-Co; Sun, 23 Apr 2023 06:42:29 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6AD70746392;
 Sun, 23 Apr 2023 12:40:50 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1DF1E74634B; Sun, 23 Apr 2023 12:40:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1AAD9746377;
 Sun, 23 Apr 2023 12:40:50 +0200 (CEST)
Date: Sun, 23 Apr 2023 12:40:50 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, John Snow <jsnow@redhat.com>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 13/13] hw/ide: Extract bmdma_clear_status()
In-Reply-To: <D1082CEC-16C3-4A31-88DB-3F48BEAFB928@gmail.com>
Message-ID: <05de58ba-e27f-c5d1-9f70-e9704f782e20@eik.bme.hu>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-14-shentey@gmail.com>
 <d603fd42-6aba-99be-c24d-d04fc36abacb@eik.bme.hu>
 <D1082CEC-16C3-4A31-88DB-3F48BEAFB928@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 23 Apr 2023, Bernhard Beschow wrote:
> Am 22. April 2023 21:26:00 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>> On Sat, 22 Apr 2023, Bernhard Beschow wrote:
>>> Extract bmdma_clear_status() mirroring bmdma_cmd_writeb().
>>
>> Is adding a trace point useful? This is called from places that already have traces so I don't think we need another separate trace point here.
>
> Adding a trace point was my original motivation to have this function. Then I realized that extracting the code in a dedicated function is a merit in itself. The trace point is a leftover, so I'll remove it.
>
>> Also the names don't match but maybe rename function to bmdma_update_status instead as it is more what it does.
>
> The status attribute models a w1c-style register. Writing to it can only 
> clear bits, hence the name. Indeed I originally named the function 
> bmdma_update_status() but thought it was too vague. I'm open to 
> suggestions though.

The function seems to clear bits 1-2 but set bits 5-6 so it it has some 
write 1 to clear and some read write bits. Therefore naming the function 
clear when it can also set bits is not quite right so I think update is 
better.

Regards,
BALATON Zoltan

>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> ---
>>> include/hw/ide/pci.h |  1 +
>>> hw/ide/cmd646.c      |  2 +-
>>> hw/ide/pci.c         |  7 +++++++
>>> hw/ide/piix.c        |  2 +-
>>> hw/ide/sii3112.c     | 12 +++++-------
>>> hw/ide/via.c         |  2 +-
>>> hw/ide/trace-events  |  1 +
>>> 7 files changed, 17 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
>>> index 81e0370202..6a286ad307 100644
>>> --- a/include/hw/ide/pci.h
>>> +++ b/include/hw/ide/pci.h
>>> @@ -59,6 +59,7 @@ struct PCIIDEState {
>>> void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
>>> void bmdma_init_ops(PCIIDEState *d, const MemoryRegionOps *bmdma_ops);
>>> void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
>>> +void bmdma_clear_status(BMDMAState *bm, uint32_t val);
>>> void pci_ide_create_devs(PCIDevice *dev);
>>>
>>> #endif
>>> diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
>>> index b9d005a357..973c3ff0dc 100644
>>> --- a/hw/ide/cmd646.c
>>> +++ b/hw/ide/cmd646.c
>>> @@ -144,7 +144,7 @@ static void bmdma_write(void *opaque, hwaddr addr,
>>>         cmd646_update_irq(pci_dev);
>>>         break;
>>>     case 2:
>>> -        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 0x06);
>>> +        bmdma_clear_status(bm, val);
>>>         break;
>>>     case 3:
>>>         if (bm == &bm->pci_dev->bmdma[0]) {
>>> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
>>> index 3539b162b7..4aa06be7c6 100644
>>> --- a/hw/ide/pci.c
>>> +++ b/hw/ide/pci.c
>>> @@ -318,6 +318,13 @@ void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val)
>>>     bm->cmd = val & 0x09;
>>> }
>>>
>>> +void bmdma_clear_status(BMDMAState *bm, uint32_t val)
>>> +{
>>> +    trace_bmdma_update_status(val);
>>> +
>>> +    bm->status = (val & 0x60) | (bm->status & BM_STATUS_DMAING) | (bm->status & ~val & 0x06);
>>> +}
>>> +
>>> static uint64_t bmdma_addr_read(void *opaque, hwaddr addr,
>>>                                 unsigned width)
>>> {
>>> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
>>> index 406a67fa0f..9eab615e35 100644
>>> --- a/hw/ide/piix.c
>>> +++ b/hw/ide/piix.c
>>> @@ -76,7 +76,7 @@ static void bmdma_write(void *opaque, hwaddr addr,
>>>         bmdma_cmd_writeb(bm, val);
>>>         break;
>>>     case 2:
>>> -        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 0x06);
>>> +        bmdma_clear_status(bm, val);
>>>         break;
>>>     }
>>> }
>>> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
>>> index 373c0dd1ee..1180ff55e7 100644
>>> --- a/hw/ide/sii3112.c
>>> +++ b/hw/ide/sii3112.c
>>> @@ -66,7 +66,7 @@ static void sii3112_bmdma_write(void *opaque, hwaddr addr,
>>>                                 uint64_t val, unsigned int size)
>>> {
>>>     BMDMAState *bm = opaque;
>>> -    SiI3112PCIState *d = SII3112_PCI(bm->pci_dev);
>>> +    SiI3112PCIState *s = SII3112_PCI(bm->pci_dev);
>>>     int i = (bm == &bm->pci_dev->bmdma[0]) ? 0 : 1;
>>>
>>>     trace_sii3112_bmdma_write(size, addr, val);
>>> @@ -75,10 +75,10 @@ static void sii3112_bmdma_write(void *opaque, hwaddr addr,
>>>         bmdma_cmd_writeb(bm, val);
>>>         break;
>>>     case 0x01:
>>> -        d->regs[i].swdata = val & 0x3f;
>>> +        s->regs[i].swdata = val & 0x3f;
>>>         break;
>>>     case 0x02:
>>> -        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 6);
>>> +        bmdma_clear_status(bm, val);
>>>         break;
>>>     default:
>>>         break;
>>> @@ -160,8 +160,7 @@ static void sii3112_reg_write(void *opaque, hwaddr addr,
>>>         d->regs[0].swdata = val & 0x3f;
>>>         break;
>>>     case 0x12:
>>> -        d->i.bmdma[0].status = (val & 0x60) | (d->i.bmdma[0].status & 1) |
>>> -                               (d->i.bmdma[0].status & ~val & 6);
>>> +        bmdma_clear_status(&d->i.bmdma[0], val);
>>>         break;
>>>     case 0x18:
>>>         bmdma_cmd_writeb(&d->i.bmdma[1], val);
>>> @@ -170,8 +169,7 @@ static void sii3112_reg_write(void *opaque, hwaddr addr,
>>>         d->regs[1].swdata = val & 0x3f;
>>>         break;
>>>     case 0x1a:
>>> -        d->i.bmdma[1].status = (val & 0x60) | (d->i.bmdma[1].status & 1) |
>>> -                               (d->i.bmdma[1].status & ~val & 6);
>>> +        bmdma_clear_status(&d->i.bmdma[1], val);
>>>         break;
>>>     case 0x100:
>>>         d->regs[0].scontrol = val & 0xfff;
>>> diff --git a/hw/ide/via.c b/hw/ide/via.c
>>> index 35dd97e49b..afb97f302a 100644
>>> --- a/hw/ide/via.c
>>> +++ b/hw/ide/via.c
>>> @@ -75,7 +75,7 @@ static void bmdma_write(void *opaque, hwaddr addr,
>>>         bmdma_cmd_writeb(bm, val);
>>>         break;
>>>     case 2:
>>> -        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 0x06);
>>> +        bmdma_clear_status(bm, val);
>>>         break;
>>>     default:;
>>>     }
>>> diff --git a/hw/ide/trace-events b/hw/ide/trace-events
>>> index a479525e38..d219c64b61 100644
>>> --- a/hw/ide/trace-events
>>> +++ b/hw/ide/trace-events
>>> @@ -30,6 +30,7 @@ bmdma_write_cmd646(uint64_t addr, uint64_t val) "bmdma: writeb 0x%"PRIx64" : 0x%
>>> # pci.c
>>> bmdma_reset(void) ""
>>> bmdma_cmd_writeb(uint32_t val) "val: 0x%08x"
>>> +bmdma_update_status(uint32_t val) "val: 0x%08x"
>>> bmdma_addr_read(uint64_t data) "data: 0x%016"PRIx64
>>> bmdma_addr_write(uint64_t data) "data: 0x%016"PRIx64
>>>
>>>
>
>


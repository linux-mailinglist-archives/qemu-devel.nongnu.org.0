Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DD64313D7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:52:36 +0200 (CEST)
Received: from localhost ([::1]:59628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcPJr-0001kJ-JJ
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mcPIX-0000RW-WF
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:51:14 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:59407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mcPIW-0001Wn-Ab
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:51:13 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 286A27463B7;
 Mon, 18 Oct 2021 11:51:10 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F1FD2746399; Mon, 18 Oct 2021 11:51:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F06E07462D3;
 Mon, 18 Oct 2021 11:51:09 +0200 (CEST)
Date: Mon, 18 Oct 2021 11:51:09 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] via-ide: Avoid expensive operations in irq handler
In-Reply-To: <549ece11-990f-a19b-5dfe-508e315a6163@amsat.org>
Message-ID: <a36736da-32a0-84fe-f33-32b2f31126bf@eik.bme.hu>
References: <20211018014059.13E65746353@zero.eik.bme.hu>
 <549ece11-990f-a19b-5dfe-508e315a6163@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1240045516-1634550669=:44799"
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
Cc: Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1240045516-1634550669=:44799
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 18 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/18/21 03:36, BALATON Zoltan wrote:
>> Cache the pointer to PCI function 0 (ISA bridge, that this IDE device
>> has to use for IRQs) in the PCIIDEState and pass that as the opaque
>> data for the interrupt handler to eliminate both the need to look up
>> function 0 at every interrupt and also a QOM type cast of the opaque
>> pointer as that's also expensive (mainly due to qom-debug being
>> enabled by default).
>>
>> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/ide/via.c         | 11 ++++++-----
>>  include/hw/ide/pci.h |  1 +
>>  2 files changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/ide/via.c b/hw/ide/via.c
>> index 82def819c4..30566bc409 100644
>> --- a/hw/ide/via.c
>> +++ b/hw/ide/via.c
>> @@ -104,15 +104,15 @@ static void bmdma_setup_bar(PCIIDEState *d)
>>
>>  static void via_ide_set_irq(void *opaque, int n, int level)
>>  {
>> -    PCIDevice *d = PCI_DEVICE(opaque);
>> +    PCIIDEState *d = opaque;
>>
>>      if (level) {
>> -        d->config[0x70 + n * 8] |= 0x80;
>> +        d->parent_obj.config[0x70 + n * 8] |= 0x80;
>>      } else {
>> -        d->config[0x70 + n * 8] &= ~0x80;
>> +        d->parent_obj.config[0x70 + n * 8] &= ~0x80;
>>      }
>
> Better not to access parent_obj, so I'd rather keep the previous
> code as it. The rest is OK, thanks. If you don't want to respin
> I can fix and take via mips-next.

Why not? If it's OK to access other fields why not parent_obj? That avoids 
the QOM cast PCI_DEVICE(opaque) or PCI_DEVICE(d) after this patch. We know 
it's a PCIIDEState and has PCIDevice parent_obj field because we set the 
opaque pointer when adding this callback so I think this works and is the 
less expensive way. But feel free to change it any way you like and use it 
that way. I'd keep it as it is.

Reagards,
BALATON Zoltan

>> -    via_isa_set_irq(pci_get_function_0(d), 14 + n, level);
>> +    via_isa_set_irq(d->func0, 14 + n, level);
>>  }
>>
>>  static void via_ide_reset(DeviceState *dev)
>> @@ -188,7 +188,8 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
>>      bmdma_setup_bar(d);
>>      pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>>
>> -    qdev_init_gpio_in(ds, via_ide_set_irq, 2);
>> +    d->func0 = pci_get_function_0(dev);
>> +    qdev_init_gpio_in_named_with_opaque(ds, via_ide_set_irq, d, NULL, 2);
>>      for (i = 0; i < 2; i++) {
>>          ide_bus_init(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
>>          ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
>> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
>> index d8384e1c42..89d14abf95 100644
>> --- a/include/hw/ide/pci.h
>> +++ b/include/hw/ide/pci.h
>> @@ -50,6 +50,7 @@ struct PCIIDEState {
>>      IDEBus bus[2];
>>      BMDMAState bmdma[2];
>>      uint32_t secondary; /* used only for cmd646 */
>> +    PCIDevice *func0; /* used only by IDE functions of superio chips */
>>      MemoryRegion bmdma_bar;
>>      MemoryRegion cmd_bar[2];
>>      MemoryRegion data_bar[2];
>>
>
>
--3866299591-1240045516-1634550669=:44799--


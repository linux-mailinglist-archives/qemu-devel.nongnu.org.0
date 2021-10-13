Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C2742C4C5
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 17:27:12 +0200 (CEST)
Received: from localhost ([::1]:52100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mag9v-00063l-QX
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 11:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mag93-0005Of-2i
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 11:26:17 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:20770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mag8z-0007rq-VH
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 11:26:16 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D39EE748F5B;
 Wed, 13 Oct 2021 17:26:10 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A68A4748F58; Wed, 13 Oct 2021 17:26:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A4D287475FA;
 Wed, 13 Oct 2021 17:26:10 +0200 (CEST)
Date: Wed, 13 Oct 2021 17:26:10 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
In-Reply-To: <189eeccd-36fd-d033-7900-30e89fc662df@amsat.org>
Message-ID: <4f23dbf5-7240-e4f-def1-7f2887f5d566@eik.bme.hu>
References: <20211013121929.9E835746333@zero.eik.bme.hu>
 <189eeccd-36fd-d033-7900-30e89fc662df@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1152967575-1634138770=:22725"
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1152967575-1634138770=:22725
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 13 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/13/21 14:13, BALATON Zoltan wrote:
>> This device is part of a superio/ISA bridge chip and IRQs from it are
>> routed to an ISA interrupt set by the Interrupt Line PCI config
>> register. Change uhci_update_irq() to allow this and implement it in
>> vt82c686-uhci-pci.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>> v3: Do it more differently using qemu_irq instead as suggested by Gerd
>> v2: Do it differently to confine isa reference to vt82c686-uhci-pci as
>> hcd-uhci is also used on machines that don't have isa. Left Jiaxun's
>> R-b there as he checked it's the same for VT82C686B and gave R-b for
>> the 82c686b case which still holds but speak up if you tink otherwise.
>>
>>  hw/usb/hcd-uhci.c          | 11 +++++------
>>  hw/usb/hcd-uhci.h          |  2 +-
>>  hw/usb/vt82c686-uhci-pci.c | 12 ++++++++++++
>>  3 files changed, 18 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
>> index 0cb02a6432..7201cd0ae7 100644
>> --- a/hw/usb/hcd-uhci.c
>> +++ b/hw/usb/hcd-uhci.c
>> @@ -31,6 +31,7 @@
>>  #include "hw/usb/uhci-regs.h"
>>  #include "migration/vmstate.h"
>>  #include "hw/pci/pci.h"
>> +#include "hw/irq.h"
>>  #include "hw/qdev-properties.h"
>>  #include "qapi/error.h"
>>  #include "qemu/timer.h"
>> @@ -290,7 +291,7 @@ static UHCIAsync *uhci_async_find_td(UHCIState *s, uint32_t td_addr)
>>
>>  static void uhci_update_irq(UHCIState *s)
>>  {
>> -    int level;
>> +    int level = 0;
>>      if (((s->status2 & 1) && (s->intr & (1 << 2))) ||
>>          ((s->status2 & 2) && (s->intr & (1 << 3))) ||
>>          ((s->status & UHCI_STS_USBERR) && (s->intr & (1 << 0))) ||
>> @@ -298,10 +299,8 @@ static void uhci_update_irq(UHCIState *s)
>>          (s->status & UHCI_STS_HSERR) ||
>>          (s->status & UHCI_STS_HCPERR)) {
>>          level = 1;
>> -    } else {
>> -        level = 0;
>>      }
>> -    pci_set_irq(&s->dev, level);
>> +    qemu_set_irq(s->irq, level);
>>  }
>
> ^ OK.
>
>>  static void uhci_reset(DeviceState *dev)
>> @@ -1170,9 +1169,9 @@ void usb_uhci_common_realize(PCIDevice *dev, Error **errp)
>>
>>      pci_conf[PCI_CLASS_PROG] = 0x00;
>>      /* TODO: reset value should be 0. */
>> -    pci_conf[USB_SBRN] = USB_RELEASE_1; // release number
>> -
>> +    pci_conf[USB_SBRN] = USB_RELEASE_1; /* release number */
>>      pci_config_set_interrupt_pin(pci_conf, u->info.irq_pin + 1);
>> +    s->irq = pci_allocate_irq(dev);
>>
>>      if (s->masterbus) {
>>          USBPort *ports[NB_PORTS];
>
> usb_uhci_common_realize() should be refactored making it PCI-agnostic.
>
>> diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
>> index e61d8fcb19..1f8ee04186 100644
>> --- a/hw/usb/hcd-uhci.h
>> +++ b/hw/usb/hcd-uhci.h
>> @@ -60,7 +60,7 @@ typedef struct UHCIState {
>>      uint32_t frame_bandwidth;
>>      bool completions_only;
>>      UHCIPort ports[NB_PORTS];
>> -
>> +    qemu_irq irq;
>>      /* Interrupts that should be raised at the end of the current frame.  */
>>      uint32_t pending_int_mask;
>
> OK.
>
>> diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
>> index b109c21603..e70e739409 100644
>> --- a/hw/usb/vt82c686-uhci-pci.c
>> +++ b/hw/usb/vt82c686-uhci-pci.c
>> @@ -1,6 +1,16 @@
>>  #include "qemu/osdep.h"
>> +#include "hw/irq.h"
>>  #include "hcd-uhci.h"
>>
>> +static void uhci_isa_set_irq(void *opaque, int irq_num, int level)
>> +{
>> +    UHCIState *s = opaque;
>> +    uint8_t irq = pci_get_byte(s->dev.config + PCI_INTERRUPT_LINE);
>> +    if (irq > 0 && irq < 15) {
>> +        qemu_set_irq(isa_get_irq(NULL, irq), level);
>> +    }
>> +}
>
> OK.
>
>>  static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
>>  {
>>      UHCIState *s = UHCI(dev);
>> @@ -14,6 +24,8 @@ static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
>>      pci_set_long(pci_conf + 0xc0, 0x00002000);
>>
>>      usb_uhci_common_realize(dev, errp);
>> +    object_unref(s->irq);
>> +    s->irq = qemu_allocate_irq(uhci_isa_set_irq, s, 0);
>
> This can be avoided by refactoring usb_uhci_common_realize(),
> uhci_pci_type_info and uhci_data_class_init().
>
> Current TYPE_UHCI becomes TYPE_PCI_UHCI.
>
> Not sure why UHCI has been implemented that way, we already
> have USB_OHCI_PCI / USB_EHCI_PCI / USB_XHCI_PCI.

The reason for that may be that those have sysbus versions and pci 
versions and maybe there was no need for a sysbus UHCI version as all of 
those we emulate are PCI? I think those were probably also like UHCI 
before but when a sysbus version was needed they were split.

Regards,
BALATON Zoltan
--3866299591-1152967575-1634138770=:22725--


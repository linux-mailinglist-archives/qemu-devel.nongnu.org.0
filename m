Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1345C2E6A95
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 21:24:27 +0100 (CET)
Received: from localhost ([::1]:56514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktz45-0000ZN-Ha
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 15:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktz3I-00009R-SK
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 15:23:37 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:55196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktz3F-0006ot-4s
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 15:23:36 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 39EC774646C;
 Mon, 28 Dec 2020 21:23:27 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 012B574645F; Mon, 28 Dec 2020 21:23:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F332874645B;
 Mon, 28 Dec 2020 21:23:26 +0100 (CET)
Date: Mon, 28 Dec 2020 21:23:26 +0100 (CET)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 1/2] ide: Make room for flags in PCIIDEState and add
 one for legacy mode
In-Reply-To: <080a04e0-e162-e80a-db6a-53bf4b43c9cb@ilande.co.uk>
Message-ID: <f4f962b7-dfd5-3b38-3d4b-72f3fb7b2aa7@eik.bme.hu>
References: <cover.1609107222.git.balaton@eik.bme.hu>
 <19d68b4da7fc8dbffe3308c661143584ac830f29.1609107222.git.balaton@eik.bme.hu>
 <080a04e0-e162-e80a-db6a-53bf4b43c9cb@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1644249207-1609187006=:86464"
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org, f4bug@amsat.org,
 John Snow <jsnow@redhat.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1644249207-1609187006=:86464
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 28 Dec 2020, Mark Cave-Ayland wrote:
> On 27/12/2020 22:13, BALATON Zoltan wrote:
>
>> We'll need a flag for implementing some device specific behaviour in
>> via-ide but we already have a currently CMD646 specific field that can
>> be repurposed for this and leave room for further flags if needed in
>> the future. This patch changes the "secondary" field to "flags" and
>> change CMD646 and its users accordingly and define a new flag for
>> forcing legacy mode that will be used by via-ide for now.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>> Tested-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> v2: Fixed typo in commit message
>>
>>   hw/ide/cmd646.c      | 4 ++--
>>   hw/sparc64/sun4u.c   | 2 +-
>>   include/hw/ide/pci.h | 7 ++++++-
>>   3 files changed, 9 insertions(+), 4 deletions(-)
>> 
>> diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
>> index c254631485..7a96016116 100644
>> --- a/hw/ide/cmd646.c
>> +++ b/hw/ide/cmd646.c
>> @@ -256,7 +256,7 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, 
>> Error **errp)
>>       pci_conf[PCI_CLASS_PROG] = 0x8f;
>>         pci_conf[CNTRL] = CNTRL_EN_CH0; // enable IDE0
>
> Doesn't the existing comment above cause checkpatch to fail?

It didn't (nether when I ran it nor in patchew) but I can fix it if I send 
a new version.

Regards,
BALATON Zoltan

>> -    if (d->secondary) {
>> +    if (d->flags & BIT(PCI_IDE_SECONDARY)) {
>>           /* XXX: if not enabled, really disable the seconday IDE 
>> controller */
>>           pci_conf[CNTRL] |= CNTRL_EN_CH1; /* enable IDE1 */
>>       }
>> @@ -314,7 +314,7 @@ static void pci_cmd646_ide_exitfn(PCIDevice *dev)
>>   }
>>     static Property cmd646_ide_properties[] = {
>> -    DEFINE_PROP_UINT32("secondary", PCIIDEState, secondary, 0),
>> +    DEFINE_PROP_BIT("secondary", PCIIDEState, flags, PCI_IDE_SECONDARY, 
>> false),
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>>   diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
>> index 0fa13a7330..c46baa9f48 100644
>> --- a/hw/sparc64/sun4u.c
>> +++ b/hw/sparc64/sun4u.c
>> @@ -674,7 +674,7 @@ static void sun4uv_init(MemoryRegion 
>> *address_space_mem,
>>       }
>>         pci_dev = pci_new(PCI_DEVFN(3, 0), "cmd646-ide");
>> -    qdev_prop_set_uint32(&pci_dev->qdev, "secondary", 1);
>> +    qdev_prop_set_bit(&pci_dev->qdev, "secondary", true);
>>       pci_realize_and_unref(pci_dev, pci_busA, &error_fatal);
>>       pci_ide_create_devs(pci_dev);
>>   diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
>> index d8384e1c42..75d1a32f6d 100644
>> --- a/include/hw/ide/pci.h
>> +++ b/include/hw/ide/pci.h
>> @@ -42,6 +42,11 @@ typedef struct BMDMAState {
>>   #define TYPE_PCI_IDE "pci-ide"
>>   OBJECT_DECLARE_SIMPLE_TYPE(PCIIDEState, PCI_IDE)
>>   +enum {
>> +    PCI_IDE_SECONDARY, /* used only for cmd646 */
>> +    PCI_IDE_LEGACY_MODE
>> +};
>> +
>>   struct PCIIDEState {
>>       /*< private >*/
>>       PCIDevice parent_obj;
>> @@ -49,7 +54,7 @@ struct PCIIDEState {
>>         IDEBus bus[2];
>>       BMDMAState bmdma[2];
>> -    uint32_t secondary; /* used only for cmd646 */
>> +    uint32_t flags;
>>       MemoryRegion bmdma_bar;
>>       MemoryRegion cmd_bar[2];
>>       MemoryRegion data_bar[2];
>
> Other than that I think this looks okay.
>
>
> ATB,
>
> Mark.
>
>
--3866299591-1644249207-1609187006=:86464--


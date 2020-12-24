Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D0E2E2582
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 09:41:49 +0100 (CET)
Received: from localhost ([::1]:56792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksMBw-0001YD-97
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 03:41:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ksMAX-000147-Nb
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 03:40:21 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:22827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ksMAV-0007uk-8W
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 03:40:21 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0C76A746552;
 Thu, 24 Dec 2020 09:40:18 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CA5C574646C; Thu, 24 Dec 2020 09:40:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C86D4746383;
 Thu, 24 Dec 2020 09:40:17 +0100 (CET)
Date: Thu, 24 Dec 2020 09:40:17 +0100 (CET)
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v3 3/8] hw/pci-host/bonito: Fixup IRQ mapping
In-Reply-To: <4cd6779b-427d-4acc-cc8d-eb54106c1cfc@eik.bme.hu>
Message-ID: <9df942e7-c5f-74b1-6384-1d7f80602a1@eik.bme.hu>
References: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
 <20201224031750.52146-4-jiaxun.yang@flygoat.com>
 <4cd6779b-427d-4acc-cc8d-eb54106c1cfc@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Thu, 24 Dec 2020, BALATON Zoltan via wrote:
> On Thu, 24 Dec 2020, Jiaxun Yang wrote:
>> Accroading to arch/mips/pci/fixup-fuloong2e.c in kernel,
>
> Typo: According
>
> How come, you say you can boot to Debian installer but don't need any IDE 
> changes when the kernel you submitted as test was shown not working with 
> current IDE emulation? Which installer do you use and what kernel does that 
> have? (The references to the installer and PMON are now missing in your cover 
> letter.)

Got the reference from v2 cover letter and it's a netboot kernel with an 
initrd so maybe you did boot into that but did not yet test with CD image 
or HDD so did not get to the IDE problem yet.

Regards,
BALATON Zoltan

>> despites south bridge IRQs needs special care, all other
>> IRQ pins are mapped by 'LOONGSON_IRQ_BASE + 25 + pin'.
>> 
>> As south bridge IRQs are all handled by ISA bus, we can
>> make a simple direct mapping.
>> 
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>> v3: Define BONITO_PCI_IRQ_BASE for readability (f4bug)
>> ---
>> hw/pci-host/bonito.c | 30 +++++++-----------------------
>> 1 file changed, 7 insertions(+), 23 deletions(-)
>> 
>> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
>> index a99eced065..3fad470fc6 100644
>> --- a/hw/pci-host/bonito.c
>> +++ b/hw/pci-host/bonito.c
>> @@ -62,6 +62,9 @@
>> #define DPRINTF(fmt, ...)
>> #endif
>> 
>> +/* PCI slots IRQ pins start position */
>> +#define BONITO_PCI_IRQ_BASE         25
>> +
>> /* from linux soure code. include/asm-mips/mips-boards/bonito64.h*/
>> #define BONITO_BOOT_BASE        0x1fc00000
>> #define BONITO_BOOT_SIZE        0x00100000
>> @@ -546,19 +549,16 @@ static const MemoryRegionOps bonito_spciconf_ops = {
>>     .endianness = DEVICE_NATIVE_ENDIAN,
>> };
>> 
>> -#define BONITO_IRQ_BASE 32
>> -
>> static void pci_bonito_set_irq(void *opaque, int irq_num, int level)
>> {
>>     BonitoState *s = opaque;
>>     qemu_irq *pic = s->pic;
>>     PCIBonitoState *bonito_state = s->pci_dev;
>> -    int internal_irq = irq_num - BONITO_IRQ_BASE;
>> 
>> -    if (bonito_state->regs[BONITO_INTEDGE] & (1 << internal_irq)) {
>> +    if (bonito_state->regs[BONITO_INTEDGE] & (1 << irq_num)) {
>>         qemu_irq_pulse(*pic);
>>     } else {   /* level triggered */
>> -        if (bonito_state->regs[BONITO_INTPOL] & (1 << internal_irq)) {
>> +        if (bonito_state->regs[BONITO_INTPOL] & (1 << irq_num)) {
>>             qemu_irq_raise(*pic);
>>         } else {
>>             qemu_irq_lower(*pic);
>> @@ -566,25 +566,9 @@ static void pci_bonito_set_irq(void *opaque, int 
>> irq_num, int level)
>>     }
>> }
>> 
>> -/* map the original irq (0~3) to bonito irq (16~47, but 16~31 are unused) 
>> */
>> -static int pci_bonito_map_irq(PCIDevice *pci_dev, int irq_num)
>> +static int pci_bonito_map_irq(PCIDevice *pci_dev, int pin)
>> {
>> -    int slot;
>> -
>> -    slot = (pci_dev->devfn >> 3);
>> -
>> -    switch (slot) {
>> -    case 5:   /* FULOONG2E_VIA_SLOT, SouthBridge, IDE, USB, ACPI, AC97, 
>> MC97 */
>> -        return irq_num % 4 + BONITO_IRQ_BASE;
>> -    case 6:   /* FULOONG2E_ATI_SLOT, VGA */
>> -        return 4 + BONITO_IRQ_BASE;
>> -    case 7:   /* FULOONG2E_RTL_SLOT, RTL8139 */
>> -        return 5 + BONITO_IRQ_BASE;
>> -    case 8 ... 12: /* PCI slot 1 to 4 */
>> -        return (slot - 8 + irq_num) + 6 + BONITO_IRQ_BASE;
>> -    default:  /* Unknown device, don't do any translation */
>> -        return irq_num;
>> -    }
>> +    return BONITO_PCI_IRQ_BASE + pin;
>> }
>> 
>> static void bonito_reset(void *opaque)
>> 
>
>


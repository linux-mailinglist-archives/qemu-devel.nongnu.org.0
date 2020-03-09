Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1E117EA8C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 21:55:50 +0100 (CET)
Received: from localhost ([::1]:49668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBPRF-0000XS-RP
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 16:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37018)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jBPQ3-0007yL-P0
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 16:54:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jBPQ2-00017F-OK
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 16:54:35 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:36369)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jBPPy-00012J-Fh; Mon, 09 Mar 2020 16:54:30 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 79160747DFE;
 Mon,  9 Mar 2020 21:54:27 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 575F4747DFD; Mon,  9 Mar 2020 21:54:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 55932747DFA;
 Mon,  9 Mar 2020 21:54:27 +0100 (CET)
Date: Mon, 9 Mar 2020 21:54:27 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 2/3] pci: Honour wmask when resetting PCI_INTERRUPT_LINE
In-Reply-To: <20200309163632-mutt-send-email-mst@kernel.org>
Message-ID: <alpine.BSF.2.22.395.2003092151340.94024@zero.eik.bme.hu>
References: <cover.1583781493.git.balaton@eik.bme.hu>
 <857e327a240f2175fe5105f0ebdfe1357fef32c7.1583781494.git.balaton@eik.bme.hu>
 <20200309163632-mutt-send-email-mst@kernel.org>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
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
Cc: qemu-block@nongnu.org, philmd@redhat.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>, John Snow <jsnow@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Mar 2020, Michael S. Tsirkin wrote:
> On Mon, Mar 09, 2020 at 08:18:13PM +0100, BALATON Zoltan wrote:
>> The pci_do_device_reset() function (called from pci_device_reset)
>> clears the PCI_INTERRUPT_LINE config reg of devices on the bus but did
>> this without taking wmask into account. We'll have a device model now
>> that needs to set a constant value for this reg and this patch allows
>> to do that without additional workaround in device emulation to
>> reverse the effect of this PCI bus reset function.
>>
>> Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/pci/pci.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index e1ed6677e1..d07e4ed9de 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -302,8 +302,10 @@ static void pci_do_device_reset(PCIDevice *dev)
>>      pci_word_test_and_clear_mask(dev->config + PCI_STATUS,
>>                                   pci_get_word(dev->wmask + PCI_STATUS) |
>>                                   pci_get_word(dev->w1cmask + PCI_STATUS));
>> +    pci_word_test_and_clear_mask(dev->config + PCI_INTERRUPT_LINE,
>> +                              pci_get_word(dev->wmask + PCI_INTERRUPT_LINE) |
>> +                              pci_get_word(dev->w1cmask + PCI_INTERRUPT_LINE));
>
> PCI spec says:
>
> Interrupt Line
> The Interrupt Line register is an eight-bit register used to communicate interrupt line routing
> information.
>
> I don't see how it makes sense to access it as a word.

Patch actually comes from Mark, I don't know. Should we change it to 
pci_byte_test_and_clear_mask or what's the appropriate way here?

>
>>      dev->config[PCI_CACHE_LINE_SIZE] = 0x0;
>> -    dev->config[PCI_INTERRUPT_LINE] = 0x0;
>>      for (r = 0; r < PCI_NUM_REGIONS; ++r) {
>>          PCIIORegion *region = &dev->io_regions[r];
>>          if (!region->size) {
>
> Please add comments here explaining that some devices
> make PCI_INTERRUPT_LINE read-only.

Something like the commit message would be appropriate?

Regards,
BALATON Zoltan


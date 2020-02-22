Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED991691B4
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Feb 2020 21:06:48 +0100 (CET)
Received: from localhost ([::1]:45676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5b31-00039B-PK
	for lists+qemu-devel@lfdr.de; Sat, 22 Feb 2020 15:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59311)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@jedlik.phy.bme.hu>) id 1j5b29-0002iv-Jx
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 15:05:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@jedlik.phy.bme.hu>) id 1j5b28-0001wB-Cb
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 15:05:53 -0500
Received: from jedlik.phy.bme.hu ([152.66.102.83]:38048)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1j5b28-0001v0-6C
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 15:05:52 -0500
Received: by jedlik.phy.bme.hu (Postfix, from userid 1000)
 id 556ACA00E6; Sat, 22 Feb 2020 21:05:49 +0100 (CET)
Date: Sat, 22 Feb 2020 21:05:49 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH] hw/ide: Remove status register read side effect
In-Reply-To: <alpine.LMD.2.03.2002222042370.1577@eik.bme.hu>
Message-ID: <alpine.LMD.2.03.2002222101580.1577@eik.bme.hu>
References: <20200221065015.337915-1-jasper.lowell@bt.com>
 <f432a118-f6be-d6ff-fe37-35b6244f3b97@ilande.co.uk>
 <alpine.LMD.2.03.2002222042370.1577@eik.bme.hu>
User-Agent: Alpine 2.03 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 152.66.102.83
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, jasper.lowell@bt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 22 Feb 2020, BALATON Zoltan wrote:
> On Sat, 22 Feb 2020, Mark Cave-Ayland wrote:
>> On 21/02/2020 06:50, jasper.lowell@bt.com wrote:
>>> The Linux libATA API documentation mentions that on some hardware,
>>> reading the status register has the side effect of clearing the
>>> interrupt condition. When emulating the generic Sun4u machine running
>>> Solaris 10, the Solaris 10 CMD646 driver exits fatally because of this
>>> emulated side effect. This side effect is likely to not exist on real
>>> CMD646 hardware.
>>> 
>>> Signed-off-by: Jasper Lowell <jasper.lowell@bt.com>
>>> ---
>>>  hw/ide/core.c | 1 -
>>>  1 file changed, 1 deletion(-)
>>> 
>>> diff --git a/hw/ide/core.c b/hw/ide/core.c
>>> index 80000eb766..82fd0632ac 100644
>>> --- a/hw/ide/core.c
>>> +++ b/hw/ide/core.c
>>> @@ -2210,7 +2210,6 @@ uint32_t ide_ioport_read(void *opaque, uint32_t 
>>> addr)
>>>          } else {
>>>              ret = s->status;
>>>          }
>>> -        qemu_irq_lower(bus->irq);
>>>          break;
>>>      }
>> 
>> I don't think that this is correct: from memory when I last looked at this, 
>> there
>> were 2 IDE status registers: the one from the original specification which 
>> clears the
>> IRQ upon read, and another one in subsequent revisions which allows you to 
>> read the
>> value without clearing any pending IRQ. My guess would be that changing 
>> this would
>> not only cause QEMU to deviate from the specification, but causes problems 
>> in other OSs.
>
> You're right, legacy ide has two status registers as described here:
>
> ftp://ftp.seagate.com/pub/acrobat/reference/111-1c.pdf
>
> Now question is which of these the above is emulating? Looks like CMD646

We have both ide_status_read() which does not clear irq and 
ide_ioport_read() which does. pci_ide_cmd_read() which PCI ide should use 
calls ide_status_read() so I wonder why did reading status cleared irq on 
CMD646? So maybe it's cleared from somewhere else and above change should 
not be needed.

Regards,
BALATON Zoltan


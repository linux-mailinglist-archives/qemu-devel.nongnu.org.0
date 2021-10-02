Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3B941FE1E
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 22:54:09 +0200 (CEST)
Received: from localhost ([::1]:40826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWm1I-0001Qw-JW
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 16:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWlzm-00005d-83
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 16:52:34 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:41434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWlzZ-00071W-La
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 16:52:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B84C9746398;
 Sat,  2 Oct 2021 22:52:17 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 882507462D3; Sat,  2 Oct 2021 22:52:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 861397457EE;
 Sat,  2 Oct 2021 22:52:17 +0200 (CEST)
Date: Sat, 2 Oct 2021 22:52:17 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 0/4] Misc OHCI patches
In-Reply-To: <0abb3f2-2267-662c-b13e-3c8248f441dc@eik.bme.hu>
Message-ID: <3085da30-802f-e85e-1f7-924cc234c68@eik.bme.hu>
References: <cover.1633122670.git.balaton@eik.bme.hu>
 <0abb3f2-2267-662c-b13e-3c8248f441dc@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 10%
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 2 Oct 2021, BALATON Zoltan wrote:
> Interestingly on pegasos2 which has UHCI instead of OHCI MorphOS does not 
> even correctly detect the emulated usb-audio device and trying to get info 
> makes it freeze so looks like the UHCI model may also have some problems of 
> its own.

So it's not the UHCI model but a problem with IRQ routing with vt8231. 
I've noticed that it sends USB requests to the usb-audio device but the 
replies come back very slowly. This lead me to think the interrupts may 
not be handled correctly. What happens is that vt82c686-uhci-pci that 
models the USB function of the VT82xx super-southbridge chips is 
implemented as a PCIDevice (it's a subclass of TYPE_UHCI) and hcd-uhci is 
using pci_set_irq() to comminicate interrupts which will generate PCI 
interrupts. But the docs of both VT82c686b and vt8231 say that the 
interrupt line PCI config register (0x3c) of most sub functions of this 
chip selects which ISA IRQ that function is routed to. (This is also 
mentioned at https://wiki.osdev.org/PCI so probably this is generally true 
for such multifunction bridge chips while other PCI cards plugged in the 
PCI bus provided by these bridge chips use normal PCI interrupts.) On the 
other hand some of these functions may also exist as separate PCI cards 
where using the PCI interrupt is correct. If for testing I change 
uhci_update_irq() to set the appropriate ISA IRQ instead of pci_set_irq() 
then it works on pegasos2 and gets the same result as with mac99 and 
sam460ex but I wonder what would be a good way to model this? (Especially 
because in case of usb-uhci we can't cahnge it easily as that's also used 
by other devices.)

This is similar problem we've seen with the via-ide device (although 
that's a bit more complex due to that also disregards the PCI config 
register despite what the docs say and always uses ISA IRQ 14+15). We have 
that call qemu_set_irq(isa_get_irq()) now as it's only used as part of the 
VT82xx chips. We'll have the same problem when implementing via-audio so 
eventually we should come up with a solution for this.

What I can think of is maybe have these devices somehow detect if they are 
a standalone PCI device or a sub function of a bridge chip and use either 
pci_set_irq or isa_get_irq() accordingly which could work but if anybody 
has a better idea (that does not involve rewriting and QOM'ifying the 
whole ISA mess because I won't have time for that) please share.

Regards,
BALATON Zoltan


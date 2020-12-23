Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 347D12E1AC9
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 11:18:43 +0100 (CET)
Received: from localhost ([::1]:48104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks1E9-0008SW-OA
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 05:18:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ks1DE-00081y-1P
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 05:17:44 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43096
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ks1DB-0000rD-QF
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 05:17:43 -0500
Received: from host86-184-125-210.range86-184.btcentralplus.com
 ([86.184.125.210] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ks1D0-0007wu-U9; Wed, 23 Dec 2020 10:17:37 +0000
To: Guenter Roeck <linux@roeck-us.net>, QEMU Developers <qemu-devel@nongnu.org>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <5ef852ee-8a53-df9d-82f4-33a68c05f53a@ilande.co.uk>
 <5849da05-a063-cd56-7709-c4760c8aa71f@roeck-us.net>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <25ff573c-9b27-31c1-5aef-7cee3495d61e@ilande.co.uk>
Date: Wed, 23 Dec 2020 10:17:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <5849da05-a063-cd56-7709-c4760c8aa71f@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.184.125.210
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: Problems with irq mapping in qemu v5.2
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.521,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/12/2020 21:23, Guenter Roeck wrote:

>>> ppc4xx_pci_map_irq() is definitely buggy. I just don't know what the
>>> correct mapping should be. slot  & 3, maybe ?
>>
>> Yeah that doesn't look right. Certainly both the Mac PPC machines use ((pci_dev->devfn >> 3)) & 3) plus the interrupt pin so I think you're right that this is missing an & 3 here. Does adding this allow your image to boot?
>>
> 
> Actually, it does not help. This does:
> 
> @@ -247,7 +247,7 @@ static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, int irq_num)
> 
>       trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);
> 
> -    return slot - 1;
> +    return slot ? slot - 1 : slot;
>   }
> 
> but I have no idea why.

That's interesting. I had a look at bamboo.dts in Linux and the interrupt-map 
property suggests there are 4 fixed PCI slots available 1 to 4, so it shouldn't be 
possible for slot 0 to generate an IRQ as nothing can be plugged there.

Can you share your reproducer? Feel free to send me links off-list if you prefer.

>>> I don't really have a good solution for pci_bonito_map_irq(). It may not
>>> matter much - I have not been able to boot fuloong_2e since qemu v4.0,
>>> and afaics that is the only platform using it. Maybe it is just completely
>>> broken ?
>>
>> It looks like you want this patchset posted last week: https://patchew.org/QEMU/20201216022513.89451-1-jiaxun.yang@flygoat.com/ (specifically: https://patchew.org/QEMU/20201216022513.89451-1-jiaxun.yang@flygoat.com/20201216022513.89451-4-jiaxun.yang@flygoat.com/). Zoltan was working on the VIA southbridge wiring at the start of the year and provided me a test case that would boot Linux on the fulong2e machine, so at that point in time it wasn't completely broken.
>>
> Those patches don't help for my tests. Problem is that I try to boot from ide drive.
> 
> qemu-system-mips64el -M fulong2e \
>      -kernel vmlinux -no-reboot -m 256 -snapshot \
>      -drive file=rootfs.mipsel.ext3,format=raw,if=ide \
>      -vga none -nographic \
>      --append "root=/dev/sda console=ttyS0"
>      -serial stdio -monitor none
> 
> This works just fine with qemu v3.1. With qemu v5.2 (after applying the
> fuloong patch series), I get:
> 
> VFS: Cannot open root device "sda" or unknown-block(0,0): error -6
> 
> This used to work up to qemu v3.1. Since qemu v4.0, there has been a variety
> of failures. Common denominator is that the ide drive is no longer recognized,
> presumably due to related changes in the via and/or pci code between v3.1
> and v4.0.
> 
> Difference in log messages:
> 
> v3.1:
> 
> pci 0000:00:05.1: [Firmware Bug]: reg 0x10: invalid BAR (can't size)
> pci 0000:00:05.1: [Firmware Bug]: reg 0x14: invalid BAR (can't size)
> pci 0000:00:05.1: [Firmware Bug]: reg 0x18: invalid BAR (can't size)
> pci 0000:00:05.1: reg 0x1c: [mem 0x100000370-0x10000037f 64bit]
> ...
> pata_via 0000:00:05.1: BMDMA: BAR4 is zero, falling back to PIO
> ata1: PATA max PIO4 cmd 0x1f0 ctl 0x3f6 irq 14
> ata2: PATA max PIO4 cmd 0x170 ctl 0x376 irq 15
> ata1.00: ATA-7: QEMU HARDDISK, 2.5+, max UDMA/100
> ...
> 
> ----
> 
> v5.2:
> 
> pci 0000:00:05.1: reg 0x10: [io  0x0000-0x0007]
> pci 0000:00:05.1: reg 0x14: [io  0x0000-0x0003]
> pci 0000:00:05.1: reg 0x18: [io  0x0000-0x0007]
> pci 0000:00:05.1: reg 0x1c: [io  0x0000-0x0003]
> pci 0000:00:05.1: reg 0x20: [io  0x0000-0x000f]
> pci 0000:00:05.1: BAR 4: assigned [io  0x4440-0x444f]
> ...
> ata1: PATA max UDMA/100 cmd 0x1f0 ctl 0x3f6 bmdma 0x4440 irq 14
> ata2: PATA max UDMA/100 cmd 0x170 ctl 0x376 bmdma 0x4448 irq 15
> [and nothing else]

Again, can you share the files that you are using here? I think it's worth adding 
Jiaxun Yang to this thread since the original cover letter at 
https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg04293.html states that this 
latest series allows the Debian installer to boot.


ATB,

Mark.


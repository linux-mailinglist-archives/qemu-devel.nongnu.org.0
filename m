Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A3C2E236C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 02:35:33 +0100 (CET)
Received: from localhost ([::1]:44466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksFXQ-0007ve-Bu
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 20:35:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ksFWD-0007Bl-31
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 20:34:21 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:45822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ksFW8-0002Vs-Fl
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 20:34:16 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 64EEA746553;
 Thu, 24 Dec 2020 02:34:09 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F2075746552; Thu, 24 Dec 2020 02:34:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EFE86746383;
 Thu, 24 Dec 2020 02:34:07 +0100 (CET)
Date: Thu, 24 Dec 2020 02:34:07 +0100 (CET)
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Problems with irq mapping in qemu v5.2
In-Reply-To: <8a3b2030-8ee6-fd56-6bfa-206457db84f@eik.bme.hu>
Message-ID: <165973a-135e-3072-ee2c-afda64844770@eik.bme.hu>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <e90b9df0-5173-6e2b-3572-4f21ac318231@amsat.org>
 <2c478b3e-5098-1887-73b3-90f91a808ad8@ilande.co.uk>
 <1d33fa46-2079-ad40-d579-6e827543de50@roeck-us.net>
 <f04ae64-fa4a-2e21-1468-cf37315ec9b2@eik.bme.hu>
 <c64fe3a4-cd9c-b455-53ce-c53fb6cf0632@roeck-us.net>
 <8a3b2030-8ee6-fd56-6bfa-206457db84f@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, chenhuacai@kernel.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Thu, 24 Dec 2020, BALATON Zoltan wrote:
> On Wed, 23 Dec 2020, Guenter Roeck wrote:
>> v3.1:
>> 
>> pci 0000:00:05.1: [Firmware Bug]: reg 0x10: invalid BAR (can't size)
>> pci 0000:00:05.1: [Firmware Bug]: reg 0x14: invalid BAR (can't size)
>> pci 0000:00:05.1: [Firmware Bug]: reg 0x18: invalid BAR (can't size)
>> pci 0000:00:05.1: reg 0x1c: [mem 0x100000370-0x10000037f 64bit]
>> ...
>> pata_via 0000:00:05.1: BMDMA: BAR4 is zero, falling back to PIO
>> ata1: PATA max PIO4 cmd 0x1f0 ctl 0x3f6 irq 14
>> ata2: PATA max PIO4 cmd 0x170 ctl 0x376 irq 15
>> ata1.00: ATA-7: QEMU HARDDISK, 2.5+, max UDMA/100
>> ...
>
> This is the previous state only emulating legacy mode and since none of the 
> native mode BARs are there Linux fails to enable native mode and falls back 
> to legacy so it ends up working but probably not how this should work on real 
> machine.
>
>> ----
>> 
>> v5.2:
>> 
>> pci 0000:00:05.1: reg 0x10: [io  0x0000-0x0007]
>> pci 0000:00:05.1: reg 0x14: [io  0x0000-0x0003]
>> pci 0000:00:05.1: reg 0x18: [io  0x0000-0x0007]
>> pci 0000:00:05.1: reg 0x1c: [io  0x0000-0x0003]
>> pci 0000:00:05.1: reg 0x20: [io  0x0000-0x000f]
>> pci 0000:00:05.1: BAR 4: assigned [io  0x4440-0x444f]
>> ...
>> ata1: PATA max UDMA/100 cmd 0x1f0 ctl 0x3f6 bmdma 0x4440 irq 14
>> ata2: PATA max UDMA/100 cmd 0x170 ctl 0x376 bmdma 0x4448 irq 15
>> [and nothing else]
>
> Now we emulate native mode and Linux seems to program the BARs (although I'm 
> not sure all these should be starting at 0) but then still tries to access 
> the device in legacy mode as shown by ports and IRQs.
>
> If someone has logs from original machine it would be interesting to see how 
> IDE ports are detected there. I'll try with the kernel from debian and see 
> what that does but maybe it tries to use legacy mode too then it won't work.
>
> With the original image I used for testing described here:
> https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg04086.html
> I now get:
>
> $ qemu-system-mips64el -M fuloong2e -serial stdio -net none -vga none -kernel 
> gentoo-loongson-2.6.22.6-20070902 -cdrom debian-8.11.0-mipsel-netinst.iso

> scsi0 : pata_via
> scsi1 : pata_via
> ata1: PATA max UDMA/100 cmd 0xffffffffbfd001f0 ctl 0xffffffffbfd003f6 bmdma 0xffffffffbfd04040 irq 14
> ata2: PATA max UDMA/100 cmd 0xffffffffbfd00170 ctl 0xffffffffbfd00376 bmdma 0xffffffffbfd04048 irq 15

> 2. The Linux driver you use wants to use legacy mode of the IDE that we don't 
> emulate. The linux/arch/mips/pci/fixup-fuloong2e.c does mention legacy mode 
> but I think I've found previously that if we hard code native mode, Linux 
> would detect it and use it anyway. I think this worked with my original 
> series but may have been broken during the rework. I'd have to dig up those

Here's my original series from March 10:
http://patchwork.ozlabs.org/project/qemu-devel/list/?series=163521
this applies on a checkout from that time such as 7f368aed672117
and with that it works with the gentoo kernel above:

Linux version 2.6.22.6-mipsgit-20070902-lm2e-liveusb (stuartl@zhenghe) (gcc version 4.1.2 (Gentoo 4.1.2 p1.0.1)) #5 Fri Jan 25 11:19:12 EST 2008
[...]
SCSI subsystem initialized
via686b fix: ISA bridge
via686b fix: ISA bridge done
via686b fix: IDE
via686b fix: IDE done
PCI quirk: region eee0-eeef claimed by vt82c686 SMB
ac97 interrupt = 9
[...]
scsi0 : pata_via
scsi1 : pata_via
ata1: PATA max UDMA/100 cmd 0xffffffffbfd04050 ctl 0xffffffffbfd04062 bmdma 0xffffffffbfd04040 irq 14
ata2: PATA max UDMA/100 cmd 0xffffffffbfd04058 ctl 0xffffffffbfd04066 bmdma 0xffffffffbfd04048 irq 14
ata2.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100
ata2.00: limited to UDMA/33 due to 40-wire cable
ata2.00: configured for UDMA/33
scsi 1:0:0:0: CD-ROM            QEMU     QEMU DVD-ROM     2.5+ PQ: 0 ANSI: 5

Note that both channels using irq 14 which means fully native mode but 
that would not work for pegasos2 where we need half-native mode (PCI BARs 
with IRQ 14/15) hence we need the property and flag to enable that mode 
for pegasos2. Without that flag we now only really emulate half-native 
mode which is fine for pegasos2 but seems Linux on fuloong2e does not like 
that. The gentoo kernel seems to like either legacy or full native mode, 
however with the debian kernel from Philippe even full native mode fails:

[    0.000000] Linux version 3.16.0-6-loongson-2e (debian-kernel@lists.debian.org) (gcc version 4.8.4 (Debian 4.8.4-1) ) #1 Debian 3.16.56-1+deb8u1 (2018-05-08)
[...]
[    0.196000] SCSI subsystem initialized
[    0.200000] PCI host bridge to bus 0000:00
[    0.200000] pci_bus 0000:00: root bus resource [mem 0x14000000-0x1c000000]
[    0.200000] pci_bus 0000:00: root bus resource [io  0x4000-0xffff]
[    0.200000] pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]
[    0.208000] via686b fix: ISA bridge
[    0.208000] via686b fix: ISA bridge done
[    0.208000] via686b fix: IDE
[    0.208000] via686b fix: IDE done
[    0.208000] pci 0000:00:05.4: quirk: [io  0xeee0-0xeeef] claimed by vt82c686 SMB
[    0.212000] pci 0000:00:05.2: BAR 4: assigned [io  0x4000-0x401f]
[    0.216000] pci 0000:00:05.3: BAR 4: assigned [io  0x4020-0x403f]
[    0.216000] pci 0000:00:05.1: BAR 4: assigned [io  0x4040-0x404f]
[    0.216000] pci 0000:00:05.1: BAR 0: assigned [io  0x4050-0x4057]
[    0.216000] pci 0000:00:05.1: BAR 2: assigned [io  0x4058-0x405f]
[    0.216000] pci 0000:00:05.1: BAR 1: assigned [io  0x4060-0x4063]
[    0.216000] pci 0000:00:05.1: BAR 3: assigned [io  0x4064-0x4067]
[    0.224000] Switched to clocksource MIPS
[...]
[    0.404000] scsi0 : pata_via
[    0.404000] scsi1 : pata_via
[    0.404000] ata1: PATA max UDMA/100 cmd 0x4050 ctl 0x4060 bmdma 0x4040
[    0.404000] ata2: PATA max UDMA/100 cmd 0x4058 ctl 0x4064 bmdma 0x4048
[...]
[    0.728000] ata2.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100
[    0.728000] ata2.00: limited to UDMA/33 due to 40-wire cable
[    0.732000] ata2.00: configured for UDMA/33
[    1.356000] input: ImExPS/2 Generic Explorer Mouse as /devices/platform/i8042/serio1/input/input2
[    5.732000] ata2.00: qc timeout (cmd 0xa0)
[    5.732000] ata2.00: TEST_UNIT_READY failed (err_mask=0x4)
[    5.888000] ata2.00: configured for UDMA/33
[   10.888000] ata2.00: qc timeout (cmd 0xa0)
[   10.888000] ata2.00: TEST_UNIT_READY failed (err_mask=0x4)
[   10.888000] ata2.00: limiting speed to UDMA/33:PIO3
[   11.044000] ata2.00: configured for UDMA/33
[   16.044000] ata2.00: qc timeout (cmd 0xa0)
[   16.044000] ata2.00: TEST_UNIT_READY failed (err_mask=0x4)
[   16.044000] ata2.00: disabled
[   16.044000] ata2: soft resetting link
[   16.200000] ata2: EH complete

It does not say which interrupts are used so can't tell if it's trying 
native or legacy mode but I think it may want to use legacy mode (based on 
the comment in the fixup-fulong2 function) but then I'm not sure why it 
sets up BMDMA and PCI BARs which is an indication of using native mode. 
Something seems to be mixed up here. The comment in the qtest this kernel 
comes from says it's trusted because it comes from Debian. Well, I'd only 
trust it if it was confirmed to run on real hardware but unfortunately we 
don't have that confirmation for any of these kernels so we really don't 
know what we're doing here. I think we need a known working, tested on 
real machine kernel so we know that our test case is correct in the first 
place. Does anybody have access to real hardware to test?

Now I remember that the issue here was basically the following:

- The chip can be used in 3 modes on different boards:
1. legacy ports and IRQ 14/15
2. native mode in which it behaves as a PCI IDE controller with BARs and 
IRQ set via a register
3. but on some machines like pegasos2 there's half-native or non-100% 
native mode as Linux calls it which is like native but IRQs hard wired to 
ISA 14/15 regardless of the register that select IRQ line in native mode.

- Guest OSes on these machines have all kinds of fixups and assumptions on 
how the chip works on that machine and so only work if we emulate that 
closely enough because they don't read config bits of the device just 
program them or expect some specific behaviour.

- It's not easy to fully emulate all this in QEMU given the current low 
level IDE emulation, in particular changing between legacy and IDE modes 
is not supported by low level functions and so instead of risking breaking 
low level IDE code used by almost all machines I've opted to try only 
partially implement it so guests would run. (Besides it's not enough to 
switch between legacy and native modes but also need the 3rd mode.) This 
seemed to work for the test cases we had but now we have Linux kernels 
that have different assumptions so now we have a conflict: fuloong2e 
needing legacy mode and pegasos2 needing half-native mode.

To resolve this conflict I'd like to know if the assumption of needing 
legacy mode on fuloong is valid or could it be lifted in Linux so it works 
with half-native or native mode as that would avoid the need to emulate 
legacy mode as well in QEMU. (Although I'm not sure about that, maybe on 
real hardware legacy mode is used as some of these VIA chips had known 
problems with DMA so to avoid that it's not used but those problems don't 
affect QEMU. But this is not confirmed either so only guessing here.)

If we need legacy mode then we may be able to emulate that by setting BARs 
to legacy ports ignoring what values are written to them if legacy mode 
config is set (which may be what the real chip does) and we already have 
IRQs hard wired to legacy values so that would give us legacy and 
half-native mode which is enough for both fuloong2e and pegasos2 but I'm 
not sure how can we fix BARs in QEMU because that's also handled by 
generic PCI code which I also don't want to break.

Regards,
BALATON Zoltan


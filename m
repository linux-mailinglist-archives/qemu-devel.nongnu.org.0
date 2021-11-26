Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A882345F020
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 15:48:35 +0100 (CET)
Received: from localhost ([::1]:42476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqcWg-0007H3-BF
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 09:48:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mqcVC-0006AF-Pv; Fri, 26 Nov 2021 09:47:04 -0500
Received: from [2001:738:2001:2001::2001] (port=53274 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mqcV7-0005mg-Fn; Fri, 26 Nov 2021 09:47:01 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4F2D8756025;
 Fri, 26 Nov 2021 15:46:50 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0F84A748F5A; Fri, 26 Nov 2021 15:46:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0D465748F54;
 Fri, 26 Nov 2021 15:46:50 +0100 (CET)
Date: Fri, 26 Nov 2021 15:46:50 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB support in the
 G4 family
In-Reply-To: <87fsrjqe8t.fsf@linux.ibm.com>
Message-ID: <775ec48-ffab-122f-57b6-fa2e89801164@eik.bme.hu>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
 <87pmqpqknn.fsf@linux.ibm.com>
 <48c4262-ff7d-2897-9764-cadd98683e97@eik.bme.hu>
 <87fsrjqe8t.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 clg@kaod.org, openbios@openbios.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Nov 2021, Fabiano Rosas wrote:
> BALATON Zoltan <balaton@eik.bme.hu> writes:
>
>> On Wed, 24 Nov 2021, Fabiano Rosas wrote:
>>> Fabiano Rosas <farosas@linux.ibm.com> writes:
>>>
>>>> Hi all,
>>>>
>>>> We have this bug in QEMU which indicates that we haven't been able to
>>>> run openbios on a 7450 cpu for quite a long time:
>>>>
>>>> https://gitlab.com/qemu-project/qemu/-/issues/86
>>>>
>>>> OK:
>>>>   $ ./qemu-system-ppc -serial mon:stdio -nographic -cpu 7410
>>>>
>>>> >> =============================================================
>>>> >> OpenBIOS 1.1 [Nov 1 2021 20:36]
>>>>   ...
>>>>
>>>> NOK:
>>>>   $ ./qemu-system-ppc -serial mon:stdio -nographic -cpu 7450 -d int
>>
>> This CPU appears in PowerMac G4 so maybe better use -machine mac99,via=pmu
>> with it as it's strange to put it in a g3beige but that may not matter for
>> reproducing the problem.
>>
>> As for guests, those running on the said PowerMac G4 should have support
>> for these CPUs so maybe you can try some Mac OS X versions (or maybe
>> MorphOS but that is not the best for debugging as there's no source
>> available nor any help from its owners but just to see if it boots it may
>> be sufficient, it should work on real PowerMac G4). According to
>> <https://en.wikipedia.org/wiki/PowerPC_G4#PowerPC_7450> this CPU was used
>> in <https://en.wikipedia.org/wiki/Power_Mac_G4#Digital_Audio/Quicksilver>
>> and it runs up to Mac OS 10.4.11. (Although OpenBIOS sets the device tree
>> according to a PowerMac3,1 so not sure it's entirely correct for the
>> PowerMac3,5 that has a 7450 CPU and if it matters for Mac OS X.)
>>
>> I asked about this before but got no reply back then:
>> https://lists.nongnu.org/archive/html/qemu-ppc/2020-03/msg00292.html
>>
>> This was because pegasos2 should have 7447 but it did not work so
>> currently I've set it to 7400 which also works. The original board
>> firmware had some problem detecting it but I think that only results in
>> wrong CPU speed shown which is only a cosmetic problem, otherwise it seems
>> to work. Since pegasos2 does not use OpenBIOS but either VOF or the
>> board's original firmware it may be an alternative way to test at least
>> 7447 which the firmware and guests running on that board should work with.
>> At least Debian 8.11 powerpc version had support for pegasos2 and should
>> boot, I'm not sure newer versions still work. More info on pegasos2 can be
>> found at:
>> http://zero.eik.bme.hu/~balaton/qemu/amiga/#morphos
>> and
>> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2
>>
>> I don't remember what problem I had with 7447 but if it does not work with
>> pegasos2 then maybe there's some other problem with it too. I think it was
>> maybe related to TLBs but I don't know and had no time to try again so I
>> could be entirely wrong about this.
>
> So yesterday I tested these:
>
> * all with my patched OpenBIOS
> ** all of them work fine with the 7400 CPU
>
> - macos9 w/ -M mac99 and -cpu 7450
>
> OS starts and then freezes. Upon further inspection I see that it has
> the 0x1000, 0x1100 and 0x1200 vectors implemented, but not the 7450
> ones. It implements the 6xx SW TLB handler, i.e. it accesses SPR 976
> instead of 980.
>
> - macosx10 w/ -M mac99 and -cpu 7450
>
> Shows the apple logo and then spins. Looking at the asm I don't see
> anything resembling the 7450 software TLB code. I'm calling it unsupported.
>
> - debian 10 w/ -M mac99 and -cpu 7450

Bevare that -M mac99 is not matching the device tree as it has ADB instead 
of USB but claims to be PowerMac3,1 nevertheless. This is a silly default 
preserved for compatibility with some older OS X versions but to avoid 
problems it's better to always use -M mac99,via=pmu which is the closest 
to a real PowerMac3,1. There is some info on this and which option to use 
with which version at 
https://www.emaculation.com/doku.php/ppc-osx-on-qemu-for-osx

> Boots linux and then spins. It has the vectors implemented, but it also
> uses different SPRs. The data misses come via 976, which is different
> from 7450, which uses only 980 (tlbmiss) for instruction and data.
>
> - morphos w/ -M pegasos2 and -cpu 7447|7450
>
> Hangs. It also has a different software TLB model implemented:
> Trying to read invalid spr 978 (0x3d2) at 00001100
> Trying to read invalid spr 977 (0x3d1) at 0000110c
> Trying to read invalid spr 979 (0x3d3) at 0000115c
> Trying to read invalid spr 976 (0x3d0) at 00001188
>
> So my initial impression that no OS supports the 7450 software TLB seems
> to match these findings and what people have said elsewhere in the
> thread.

I'm getting this with MorphOS on pegasos2:

$ qemu-system-ppc -M pegasos2 -device ati-vga,romfile="" -kernel boot.img 
-cdrom morphos-3.15.iso -serial stdio -d unimp,guest_errors,int 2>&1 | 
grep --line-buffered -v '^Invalid read\|^hypercall\|^syscall\|^Raise exception.*0000000[48a]'

Memory used before SYS_Init: 9MB
i8259: level sensitive irq not supported
i8259: level sensitive irq not supported


unsupported keyboard cmd=0xaf
PCI ATA/ATAPI Driver@2: PIO Mode 4
PCI ATA/ATAPI Driver@2: UDMA Mode 5
ide.device@2: QEMU     QEMU DVD-ROM     <CDROM>

and it boots with the default 7400 CPU but with -cpu 7447 I get:

Memory used before SYS_Init: 9MB
i8259: level sensitive irq not supported
i8259: level sensitive irq not supported
Raise exception at 00051500 => 0000004f (00)
Trying to read invalid spr 978 (0x3d2) at 00001100
Trying to read invalid spr 977 (0x3d1) at 0000110c
Trying to read invalid spr 979 (0x3d3) at 0000115c
Trying to read invalid spr 976 (0x3d0) at 00001188


------------------------------------------------------------------------------
ExceptionThread: Exception Thread 0xbc8030 <System Init>
ExceptionThread: Type 0x3 <Data Access>
ExceptionThread: Illegal Data Access at 0x40000000 DSISR 0x40000000 <Read Access to a not existing Page>
PC(SRR0) 0x00051500 MSR(SRR1) 0x0000b030
  CR 00000884 XER 20000000 LR 0002166c CTR 0001a880
General Register Dump:
GPR[0] 00021000 40000000 0000b030 0200b030 008a1c9c 1fc59000 00000000 00000000
GPR[8] 00be8718 00000000 00000000 00053e3c 0200b030 0d0d0d0d 0e0e0e0e 0f0f0f0f
GPR[16] 10101010 11111111 12121212 13131313 14141414 15151515 16161616 00000002
GPR[24] 0081c1d0 00000000 10020010 00000000 10000013 00000004 00030000 00000001
FPSCR 00000000
FPECR 00000000
FPR[0] 0x0000000020000002 0x0000000000000000 0x0000000000000000 0x0000000000000000
FPR[4] 0x0000000000000000 0x0000000000000000 0x0000000000000000 0x0000000000000000
FPR[8] 0x0000000000000000 0x0000000000000000 0x0000000000000000 0x0000000000000000
FPR[12] 0x0000000000000000 0x0000000000000000 0x0000000000000000 0x0000000000000000
FPR[16] 0x0000000000000000 0x0000000000000000 0x0000000000000000 0x0000000000000000
FPR[20] 0x0000000000000000 0x0000000000000000 0x0000000000000000 0x0000000000000000
FPR[24] 0x0000000000000000 0x0000000000000000 0x0000000000000000 0x0000000000000000
FPR[28] 0x0000000000000000 0x0000000000000000 0x0000000000000000 0x0000000000000000
Special Register Dump:
   IABR 00000000  DABR 00000000
   PCM1 00000000  PMC2 00000000 PMC3 00000000 PMC4 00000000
OS Register Dump:
  SysCall_SRR0 00053e3c SysCall_SRR1 0200b030 SysCall_GPR2 008a17b0 SysCall_LR 0d0d0d0d SysCall_CR 00052624
  SRR0[] 00000000 00000000 00000000 00000000
------------------------------------------------------------------------------

StackFrame History:
Stack 0x40000000 StackEnd 0xbc7030 LR 0x2166c

Exception 4f seems to be POWERPC_EXCP_DLTLB which does not seem to happen 
with 7400 CPU, neither the SPR reads so there is some difference with 7447 
but not sure what do these mean, I don't know much about these CPUs and 
did not read the docs. There is some debug code that can be enabled with 
DEBUG_SOFTWARE_TLB in target/ppc/excp_helper.c to get more info but I 
haven't tried that, looks like MorphOS is not expecting these so normally 
would not use it.

The pegasos2 firmware seems to work but detects the CPU differently. With 
7400:

SmartFirmware:
cpu0: PowerPC,G4 CPUClock 599 Mhz BUSClock 133 Mhz (Version 0x000C,0x0209)

The 600 Mhz CPU clock is wrong but since the only two CPUs available were 
a 600 MHz G3 or a 1GHz 7447 it probably thinks anything not the 7447 or 
newer is a G3 that was running at 600 MHz. But with the 7447 it's also 
wrong:

cpu0: PowerPC,74x7 CPUClock 1533 Mhz BUSClock 133 Mhz (Version 0x8002,0x0101)

which should be 1 GHz (or 999 MHz), maybe the clock multiplier is not set 
correctly but not sure where it gets that from. Otherwise the firmware 
seems to work with 7447 CPU as well and get the same exception as above 
when tring boot MorphOS.

Regards,
BALATON Zoltan


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0602D894C
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 19:34:41 +0100 (CET)
Received: from localhost ([::1]:52948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko9j6-0002vS-BM
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 13:34:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ko9V8-0001sk-5K; Sat, 12 Dec 2020 13:20:14 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:20844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ko9V4-0002Ui-10; Sat, 12 Dec 2020 13:20:13 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 612F874646C;
 Sat, 12 Dec 2020 18:43:02 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 272A974645F; Sat, 12 Dec 2020 18:43:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 25473746383;
 Sat, 12 Dec 2020 18:43:02 +0100 (CET)
Date: Sat, 12 Dec 2020 18:43:02 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/8] hw/ppc: Convert UIC device to QOM
In-Reply-To: <20201212001537.24520-1-peter.maydell@linaro.org>
Message-ID: <ce63518c-7389-b6f0-c615-886d461fe99@eik.bme.hu>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Sat, 12 Dec 2020, Peter Maydell wrote:
> This patchseries converts the PPC UIC "Universal Interrupt
> Controller" to a QOM device.  My main reason for doing it is that

Thanks for doing this clean up.

> this fixes a couple of long-standing trivial Coverity issues -- the
> current ppcuic_init() function allocates an array of qemu_irqs which
> the callers then leak.  (The leak is trivial because it happens once
> when QEMU starts.)
>
> The patchseries converts the UIC to a QOM device but initially leaves
> the old ppcuic_init() creation function with its old API intact.  It
> then goes through converting the various boards that were using
> ppcuic_init() to instead directly create the UIC using the usual qdev
> APIs, so that it can delete the ppcuic_init() function entirely.
>
> The patchset includes one patch which deletes 350 lines of dead code
> -- the ppc405cr_init() function seems to have never been used since
> it was added in 2007, so rather than converting this user of
> ppcuic_init() it seemed more sensible to delete it.
>
> I have tested with 'make check' and 'make check-acceptance' but I
> don't think the latter really exercises the affected boards, which
> are:
>
> bamboo
> ref405ep
> sam460ex
> taihu
> virtex-ml507

Thanks to Thomas, commit 99b336cdd90 added check for sam460ex but that 
only checks it the firmware runs.

> I found instructions on how to boot an AROS image on sam460ex, so I
> have tested that: it works as well after this series as it did before
> (gets to "Libs/workbench.library" and stops); it does seem to

That seems to be a problem with AROS that nobody noticed yet. I've 
reported it to them but there seems to be nobody maintaining the PPC 
version, AROS is mostly focused on m86k, ARM and x86. On PPC AmigaOS and 
MorphOS seem to be more popular. I have an AROS test image I've build back 
in 2018 that still works, I'll send it off-list.

> successfully do things like scanning the USB bus and responding to
> keyboard input at the boot menu, which suggests that IRQs must be
> working.

Interestingly the firmware does not use irqs at all, it just polls for 
them it seems. AROS and AmigaOS does seem to break though. With AROS I get 
this exception after your series but it's not very helpful:

[KRN] Exception 0 handler. Context @ ff7ffb28, SysBase @ 00a60410, KernelBase @ 01000154
[KRN] SRR0=ff9e3d78, SRR1=0002f000 DEAR=00000000 ESR=00000000
[KRN] CTR=ff9e48dc LR=ff9e2db4 XER=20000000 CCR=40000848
[KRN] DAR=00000000 DSISR=00000000
[KRN] GPR00=00000006 GPR01=01075d10 GPR02=00a60410 GPR03=00000000
[KRN] GPR04=00000001 GPR05=00000001 GPR06=010538b4 GPR07=ff9e48dc
[KRN] GPR08=01000000 GPR09=00000054 GPR10=ef000000 GPR11=00000001
[KRN] GPR12=40000844 GPR13=00000000 GPR14=00000000 GPR15=00000000
[KRN] GPR16=00000000 GPR17=00000000 GPR18=00000000 GPR19=00000000
[KRN] GPR20=00000000 GPR21=00000000 GPR22=00000000 GPR23=0106bde0
[KRN] GPR24=00031000 GPR25=010596e0 GPR26=01058980 GPR27=ff7f0000
[KRN] GPR28=010596b8 GPR29=0105a0a8 GPR30=01053770 GPR31=01076564
[KRN] Instruction dump:
[KRN] ff9e3d78: 80010064 82e1003c 83010040 7c0803a6
[KRN] ff9e3d88: 83210044 83410048 8361004c 83810050
[KRN] Stackdump:
[KRN] 01075d10: 01075d70 010596e0 09021900 010103c0
[KRN] 01075d20: 00090400 00010900 00040705 81030800
[KRN] 01075d30: 01075d50 ff7f0000 0000ffff 0105a0d8
[KRN] 01075d40: 01075d60 ff9ea1cc 000000ff 0106bde0
[KRN] 01075d50: 00031000 010596e0 01058980 ff7f0000
[KRN] 01075d60: 010596b8 0105a0a8 01053770 0105a0d8
[KRN] 01075d70: 01075d80 ff9e2db4 01059448 ff7f7858
[KRN] 01075d80: 01075e30 ff9e9418 80004722 01075dfc
[KRN] 01075d90: 80004721 01075df8 80004725 01075df4
[KRN] 01075da0: 80004723 01075dec 80004724 01075de8
[KRN] 01075db0: 80004726 01075df0 80004731 01075de4
[KRN] 01075dc0: 80004732 01075de0 00000000 00000000
[KRN] 01075dd0: 00000000 00000000 00000000 00000000
[KRN] 01075de0: 00000001 00000220 00000003 00000001
[KRN] 01075df0: ff9e8568 ff9e8530 ff9e8520 01076738
[KRN] 01075e00: 00000000 00000000 00000000 00000000
[KRN] Backtrace:  Devs/USBHardware/pciusb.device cmdControlXFerRootHub+0xd8
[KRN] LR=ff9e2db4 Devs/USBHardware/pciusb.device pciusb_5_devBeginIO+0x148
[KRN]    ff9e2db4 Devs/USBHardware/pciusb.device pciusb_5_devBeginIO+0x148
[KRN]    ff9e9418 Libs/poseidon.library pDeviceTask+0x5c8
[KRN]    ff845edc boot/sam440/kernel Exec_2_close+0x18
SAD(-1,-1)>

AmigaOS also fails to boot but could not get useful logs from it yet so 
not sure what could be broken.

Regards,
BALATON Zoltan

> Side note: the 'irq_inputs' hacks in the PPC CPU I think would really
> benefit from conversion to being qdev gpio inputs now that CPUs are
> real devices. There are also a lot of non-QOM devices in this
> ppc4xx code if anybody is interested in working on more QOM
> conversions for these boards.
>
> thanks
> -- PMM
>
> Peter Maydell (8):
>  hw/ppc/ppc4xx_devs: Make code style fixes to UIC code
>  ppc: Convert PPC UIC to a QOM device
>  hw/ppc/virtex_ml507: Drop use of ppcuic_init()
>  hw/ppc/ppc440_bamboo: Drop use of ppcuic_init()
>  hw/ppc/sam460ex: Drop use of ppcuic_init()
>  hw/ppc: Delete unused ppc405cr_init() code
>  hw/ppc/ppc405_uc: Drop use of ppcuic_init()
>  hw/ppc: Remove unused ppcuic_init()
>
> hw/ppc/ppc405.h           |   8 +-
> include/hw/intc/ppc-uic.h |  80 ++++++++
> include/hw/ppc/ppc4xx.h   |   9 -
> hw/intc/ppc-uic.c         | 321 +++++++++++++++++++++++++++++
> hw/ppc/ppc405_boards.c    |   8 +-
> hw/ppc/ppc405_uc.c        | 415 ++++----------------------------------
> hw/ppc/ppc440_bamboo.c    |  38 +++-
> hw/ppc/ppc4xx_devs.c      | 246 +---------------------
> hw/ppc/sam460ex.c         |  70 +++++--
> hw/ppc/virtex_ml507.c     |  21 +-
> MAINTAINERS               |   2 +
> hw/intc/Kconfig           |   3 +
> hw/intc/meson.build       |   1 +
> hw/ppc/Kconfig            |   1 +
> 14 files changed, 555 insertions(+), 668 deletions(-)
> create mode 100644 include/hw/intc/ppc-uic.h
> create mode 100644 hw/intc/ppc-uic.c
>
>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DA64A408A
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 11:56:07 +0100 (CET)
Received: from localhost ([::1]:37200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEULu-0006RZ-LC
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 05:56:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andre.przywara@arm.com>)
 id 1nEUIp-0004sn-MW; Mon, 31 Jan 2022 05:52:55 -0500
Received: from foss.arm.com ([217.140.110.172]:38598)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andre.przywara@arm.com>)
 id 1nEUIl-0002fj-Iv; Mon, 31 Jan 2022 05:52:54 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99BD8D6E;
 Mon, 31 Jan 2022 02:52:42 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED4D33F774;
 Mon, 31 Jan 2022 02:52:39 -0800 (PST)
Date: Mon, 31 Jan 2022 10:52:37 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: Re: [PATCH 05/16] hw/arm: allwinner: Don't enable PSCI conduit when
 booting guest in EL3
Message-ID: <20220131105237.61439421@donnerap.cambridge.arm.com>
In-Reply-To: <CAPan3WrPgyTqzgcP5Bc6zdvmqrQ7mN3xjowzo+Qo-UHH5miH0g@mail.gmail.com>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-6-peter.maydell@linaro.org>
 <CAPan3WrPgyTqzgcP5Bc6zdvmqrQ7mN3xjowzo+Qo-UHH5miH0g@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=andre.przywara@arm.com; helo=foss.arm.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Samuel Holland <samuel@sholland.org>, Alexander Graf <agraf@csgraf.de>,
 Rob Herring <robh@kernel.org>, Beniamino Galvani <b.galvani@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 30 Jan 2022 23:35:37 +0100
Niek Linnenbank <nieklinnenbank@gmail.com> wrote:

Hi,

(CC:ing Samuel for his intimate Allwinner BootROM knowledge)

> Hi Peter,
> 
> 
> 
> On Thu, Jan 27, 2022 at 4:46 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> 
> > Change the allwinner-h3 based board to use the new boot.c
> > functionality to allow us to enable psci-conduit only if the guest is
> > being booted in EL1 or EL2, so that if the user runs guest EL3
> > firmware code our PSCI emulation doesn't get in its way.
> >
> > To do this we stop setting the psci-conduit property on the CPU
> > objects in the SoC code, and instead set the psci_conduit field in
> > the arm_boot_info struct to tell the common boot loader code that
> > we'd like PSCI if the guest is starting at an EL that it makes sense
> > with.
> >
> > This affects the orangepi-pc board.
> >
> > This commit leaves the secondary CPUs in the powered-down state if
> > the guest is booting at EL3, which is the same behaviour as before
> > this commit.  The secondaries can no longer be started by that EL3
> > code making a PSCI call but can still be started via the CPU
> > Configuration Module registers (which we model in
> > hw/misc/allwinner-cpucfg.c).
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >  
> 
> While testing your patches on the orangepi-pc machine, I've found that two
> acceptance tests BootLinuxConsole.test_arm_orangepi_bionic_20_08 and
> BootLinuxConsole.test_arm_orangepi_uboot_netbsd9 of the orangepi-pc board
> are no longer passing on current master:
> 
>   ARMBIAN_ARTIFACTS_CACHED=yes AVOCADO_ALLOW_LARGE_STORAGE=yes avocado
> --show=app,console run -t machine:orangepi-pc
> tests/avocado/boot_linux_console.py
>   ...
>  (4/5)
> tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08:
> -console: U-Boot SPL 2020.04-armbian (Sep 02 2020 - 10:16:13 +0200)
> \console: DRAM:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout
> reached\nOriginal status: ERROR\n{'name':
> '4-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08',
> 'logdi>  
>  (5/5)
> tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9:
> /console: U-Boot SPL 2020.01+dfsg-1 (Jan 08 2020 - 08:19:44 +0000)
> console: DRAM:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout
> reached\nOriginal status: ERROR\n{'name':
> '5-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9',
> 'logd>  
> RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 2 |
> CANCEL 0
> JOB TIME   : 221.25 s
> 
> Bisecting the error I was able to trace it back to commit 5ead62185d
> ("memory: Make memory_region_is_mapped() succeed when mapped via an alias").
> I'll try to find the original thread and respond to that with this
> information.
> 
> However, with commit 5ead62185d reverted, all tested passed fine:
> 
> ARMBIAN_ARTIFACTS_CACHED=yes AVOCADO_ALLOW_LARGE_STORAGE=yes avocado
> --show=app,console run -t machine:orangepi-pc
> tests/avocado/boot_linux_console.py
> ...
> PASS (16.48 s)
> RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |
> CANCEL 0
> JOB TIME   : 116.63 s
> 
> So for the orangepi-pc and allwinner-h3:
> 
> Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> 
> 
> > ---
> > If anybody knows for definite that the secondaries should be
> > powered-down at startup for guest firmware, we can delete the TODO.
> >  
> 
> Looking at the Allwinner H3 datasheet in 4.4.3.7 page 146, it says that
> for the CPU1 Status Register the default value indicates at least that its
> not in a
> wait for interrupt standby mode. And if I look in U-Boot's
> arm/arm/cpu/armv7/sunxi/psci.c code
> in the psci_cpu_on implementation, there is an explicit 'power on' part
> there, suggesting the secondary CPUs
> are by default off. So while I don't have any hard proof, these findings
> suggest we are modeling the correct behavior
> with secondary CPUs by default off.

So when it comes to firmware, indeed the secondaries seem to be off when
the first user provided code (boot0/SPL) is entered. However there is an
MPIDR read in the BROM, with the corresponding "branch if not primary
core". I think this is because the BROM is mapped at the reset vector, so
upon SMP firmware releasing the reset line it always starts in ROM, then
gets diverted to the actual entry point.
Maybe Samuel can confirm that the secondary cores are power gated when the
SoCs comes out of reset?

Cheers,
Andre

> > The allwinner-cpucfg.c code makes the reset value for the
> > REG_CPU*_RST_CTRL registers "CPUX_RESET_RELEASED", which might
> > suggest otherwise, but that could easily just be a QEMU error.
> > ---
> >  hw/arm/allwinner-h3.c | 9 ++++-----
> >  hw/arm/orangepi.c     | 1 +
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> > index f9b7ed18711..f54aff6d2d2 100644
> > --- a/hw/arm/allwinner-h3.c
> > +++ b/hw/arm/allwinner-h3.c
> > @@ -235,11 +235,10 @@ static void allwinner_h3_realize(DeviceState *dev,
> > Error **errp)
> >      /* CPUs */
> >      for (i = 0; i < AW_H3_NUM_CPUS; i++) {
> >
> > -        /* Provide Power State Coordination Interface */
> > -        qdev_prop_set_int32(DEVICE(&s->cpus[i]), "psci-conduit",
> > -                            QEMU_PSCI_CONDUIT_SMC);
> > -
> > -        /* Disable secondary CPUs */
> > +        /*
> > +         * Disable secondary CPUs. TODO: check whether this is what
> > +         * guest EL3 firmware would really expect.
> > +         */
> >          qdev_prop_set_bit(DEVICE(&s->cpus[i]), "start-powered-off",
> >                            i > 0);
> >
> > diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
> > index e7963822367..68fe9182414 100644
> > --- a/hw/arm/orangepi.c
> > +++ b/hw/arm/orangepi.c
> > @@ -105,6 +105,7 @@ static void orangepi_init(MachineState *machine)
> >      }
> >      orangepi_binfo.loader_start = h3->memmap[AW_H3_DEV_SDRAM];
> >      orangepi_binfo.ram_size = machine->ram_size;
> > +    orangepi_binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
> >      arm_load_kernel(ARM_CPU(first_cpu), machine, &orangepi_binfo);
> >  }
> >
> > --
> > 2.25.1
> >
> >  
> 



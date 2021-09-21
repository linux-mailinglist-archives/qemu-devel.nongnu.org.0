Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C121413683
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 17:50:04 +0200 (CEST)
Received: from localhost ([::1]:59130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSi1y-00029R-MJ
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 11:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mSi0z-0001Ti-FB
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 11:49:02 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:24063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mSi0v-00071m-MZ
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 11:49:00 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7D5C4748F4C;
 Tue, 21 Sep 2021 17:48:52 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E8C94746353; Tue, 21 Sep 2021 17:48:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E67517457EE;
 Tue, 21 Sep 2021 17:48:51 +0200 (CEST)
Date: Tue, 21 Sep 2021 17:48:51 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: ensuring a machine's buses have unique names
In-Reply-To: <CAFEAcA_ExFiv3AurBAtTan10yuXRnsHMQS0yHa-vJpwB9u4HoA@mail.gmail.com>
Message-ID: <71bb7b84-28a3-dd4b-d375-4b2494832655@eik.bme.hu>
References: <CAFEAcA8Q2XEANtKfk_Ak2GgeM8b_=kf_qduLztCuL=E_k36FWg@mail.gmail.com>
 <87czq0l2mn.fsf@dusky.pond.sub.org>
 <CAFEAcA-1cGjt54XDEmKiDctySW4zdQptoc2taGp0XxMOtKvGCw@mail.gmail.com>
 <87mtoe4g40.fsf@dusky.pond.sub.org>
 <CAFEAcA_ExFiv3AurBAtTan10yuXRnsHMQS0yHa-vJpwB9u4HoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
Cc: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Sep 2021, Peter Maydell wrote:
> On Wed, 15 Sept 2021 at 05:28, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>> I'm not sure how best to sort this tangle out. We could:
>>>  * make controller devices pass in NULL as bus name; this
>>>    means that some bus names will change, which is an annoying
>>>    breakage but for these minor bus types we can probably
>>>    get away with it. This brings these buses into line with
>>>    how we've been handling uniqueness for ide and scsi.
>>
>> To gauge the breakage, we need a list of the affected bus names.
>
> Looking through, there are a few single-use or special
> purpose buses I'm going to ignore for now (eg vmbus, or
> the s390 ones). The four big bus types where controllers
> often specify a bus name and override the 'autogenerate
> unique name' handling are pci, ssi, sd, and i2c. (pci mostly
> gets away with it I expect by machines only having one pci
> bus.) Of those, I've gone through i2c. These are all the
> places where we create a specifically-named i2c bus (via
> i2c_init_bus()), together with the affected boards:
>
>   hw/arm/pxa2xx.c
>    - the PXA SoC code creates both the intended-for-use
>      i2c buses (which get auto-names) and also several i2c
>      buses intended for internal board-code use only which
>      are all given the same name "dummy".
>      Boards: connex, verdex, tosa, mainstone, akita, spitz,
>      borzoi, terrier, z2
>   hw/arm/stellaris.c
>    - The i2c controller names its bus "i2c". There is only one i2c
>      controller on these boards, so no name conflicts.
>      Boards: lm3s811evb, lm3s6965evb
>   hw/display/ati.c
>    - The ATI VGA device has an on-board i2c controller which it
>      connects the DDC that holds the EDID information. The bus is
>      always named "ati-vga.ddc", so if you have multiple of this
>      PCI device in the system the buses have the same names.
>   hw/display/sm501.c
>    - Same as ATI, but the bus name is "sm501.i2c"
>   hw/i2c/aspeed_i2c.c
>    - This I2C controller has either 14 or 16 (!) different i2c
>      buses, and it assigns them names "aspeed.i2c.N" for N = 0,1,2,...
>      The board code mostly seems to use these to wire up various
>      on-board i2c devices.
>      Boards: palmetto-bmc, supermicrox11-bmc, ast2500-evb, romulus-bmc,
>      swift-bmc, sonorapass-bmc, witherspoon-bmc, ast2600-evb,
>      tacoma-bmc, g220a-bmc, quanta-q71l-bmc, rainier-bmc
>   hw/i2c/bitbang_i2c.c
>    - the "GPIO to I2C bridge" device always names its bus "i2c".
>      Used only on musicpal, which only creates one of these buses.
>      Boards: musicpal
>   hw/i2c/exynos4210_i2c.c
>    - This i2c controller always names its bus "i2c". There are 9
>      of these controllers on the board, so they all have clashing
>      names.
>      Boards: nuri, smdkc210
>   hw/i2c/i2c_mux_pca954x.c
>    - This is an i2c multiplexer. All the child buses are named
>      "i2c-bus". The multiplexer is used by the aspeed and npcm7xx
>      boards. (There's a programmable way to get at individual
>      downstream i2c buses despite the name clash; none of the boards
>      using this multiplexer actually connect any devices downstream of
>      it yet.)
>      Boards: palmetto-bmc, supermicrox11-bmc, ast2500-evb, romulus-bmc,
>      swift-bmc, sonorapass-bmc, witherspoon-bmc, ast2600-evb,
>      tacoma-bmc, g220a-bmc, quanta-q71l-bmc, rainier-bmc,
>      npcm750-evb, quanta-gsj, quanta-gbs-bmc, kudo-bmc
>   hw/i2c/mpc_i2c.c
>    - This controller always names its bus "i2c". There is only one
>      of these controllers in the machine.
>      Boards: ppce500, mpc8544ds
>   hw/i2c/npcm7xx_smbus.c
>    - This controller always names its bus "i2c-bus". There are multiple
>      controllers on the boards. The name also clashes with the one used
>      by the pca954x muxes on these boards (see above).
>      Boards: npcm750-evb, quanta-gsj, quanta-gbs-bmc, kudo-bmc
>   hw/i2c/pm_smbus.c
>    - This is the PC SMBUS implementation (it is not a QOM device...)
>      The bus is always called "i2c".
>      Boards: haven't worked through; at least all the x86 PC-like
>      boards, I guess
>   hw/i2c/ppc4xx_i2c.c
>    - This controller always names its bus "i2c". The taihu and
>      ref405ep have only one controller, but sam460ex has two which
>      will have non-unique names.
>      Boards: taihu, ref405ep, sam460ex
>   hw/i2c/versatile_i2c.c
>    - This controller always names its bus "i2c". The MPS boards all
>      have multiples of this controller with clashing names; the others
>      have only one controller.
>      Boards: mps2-an385, mps2-an386, mps2-an500, mps2-an511,
>      mps2-an505, mps2-an521, mps3-an524, mps3-an547,
>      realview-eb, realview-eb-mpcore, realview-pb-a8, realview-pbx-a9,
>      versatileab, versatilepb, vexpress-a9, vexpress-a15
>
> In a lot of these cases I suspect the i2c controllers are
> provided either to allow connection of various internal-to-the-board
> devices, or simply so that guest OS bootup code that initializes
> the i2c controller doesn't fall over. However since there's
> nothing stopping users from creating i2c devices themselves
> on the commandline, some people might be doing that.
>
> In some of these cases (eg the i2c bus on the ATI VGA driver)
> I suspect the desired behaviour is "unique bus name based on
> a standard template, eg 'ati-vga.ddc.0/1/...'. It sounds like
> we can't do that, though. (Also they probably don't want to
> permit users to command-line plug i2c devices into it...)

To me it looks like device code can't really set a globally unique name on 
creating the bus without getting some help from upper levels. So maybe 
naming busses should be done by qdev (or whatever is handling this) 
instead of passing the name as an argument to qbus_create or only use that 
name as a unique component within the device and append it to a unique 
name for the device. Thus we would get names like sys.pci-0.ati-vga-0.ddc 
or so but not sure we want that as it's hard to use on command line. 
Alternatively we can accept non unique names but use another unique 
property such as device id to identify devices which could be generated as 
an integer incremented after every device add or some hash which would 
result in shorter unique ids. Such id is already used by -drive and -net 
options where used supplies a unique id and then can use that to reference 
the created object by that id in other options. This could be extended to 
devices and buses if it had a unique id, then it's not a problem to have 
non-unique names.

Regards,
BALATON Zoltan


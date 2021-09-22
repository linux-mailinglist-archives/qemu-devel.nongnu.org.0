Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62F8414243
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 09:05:12 +0200 (CEST)
Received: from localhost ([::1]:41910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSwJb-0004XT-OW
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 03:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSwGw-0001hf-T9
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 03:02:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSwGs-0006lB-QU
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 03:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632294141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LU9zmxlbFeEtQu3VyS8G8VOAuU7ggKycToCRWJUwbEk=;
 b=cQUAvtTHouPXB8cqY52z/EAl8oK9+3kgvit/DlyveIqIC5Z20DQuDji/Qb8qQ/2GbyM5zW
 2LIHYjOdOzkDUBNi1MviIe7awnYRX+1XUjnL2iWbYrpYIwNEG+XBcbvi5lFm+GlvVNd94a
 5RpcCWqDpC+n+gU2WEjmRXPiWtxNL6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-fhqW5uVSO-6AQHO2mQvuiw-1; Wed, 22 Sep 2021 03:02:20 -0400
X-MC-Unique: fhqW5uVSO-6AQHO2mQvuiw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B250A8145F0;
 Wed, 22 Sep 2021 07:02:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42F4F5D9F4;
 Wed, 22 Sep 2021 07:02:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D4F8F113865F; Wed, 22 Sep 2021 09:02:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: ensuring a machine's buses have unique names
References: <CAFEAcA8Q2XEANtKfk_Ak2GgeM8b_=kf_qduLztCuL=E_k36FWg@mail.gmail.com>
 <87czq0l2mn.fsf@dusky.pond.sub.org>
 <CAFEAcA-1cGjt54XDEmKiDctySW4zdQptoc2taGp0XxMOtKvGCw@mail.gmail.com>
 <87mtoe4g40.fsf@dusky.pond.sub.org>
 <CAFEAcA_ExFiv3AurBAtTan10yuXRnsHMQS0yHa-vJpwB9u4HoA@mail.gmail.com>
Date: Wed, 22 Sep 2021 09:02:16 +0200
In-Reply-To: <CAFEAcA_ExFiv3AurBAtTan10yuXRnsHMQS0yHa-vJpwB9u4HoA@mail.gmail.com>
 (Peter Maydell's message of "Tue, 21 Sep 2021 14:20:57 +0100")
Message-ID: <878rzprt3b.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 15 Sept 2021 at 05:28, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> > I'm not sure how best to sort this tangle out. We could:
>> >  * make controller devices pass in NULL as bus name; this
>> >    means that some bus names will change, which is an annoying
>> >    breakage but for these minor bus types we can probably
>> >    get away with it. This brings these buses into line with
>> >    how we've been handling uniqueness for ide and scsi.
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
>    hw/arm/pxa2xx.c
>     - the PXA SoC code creates both the intended-for-use
>       i2c buses (which get auto-names) and also several i2c
>       buses intended for internal board-code use only which
>       are all given the same name "dummy".
>       Boards: connex, verdex, tosa, mainstone, akita, spitz,
>       borzoi, terrier, z2
>    hw/arm/stellaris.c
>     - The i2c controller names its bus "i2c". There is only one i2c
>       controller on these boards, so no name conflicts.
>       Boards: lm3s811evb, lm3s6965evb
>    hw/display/ati.c
>     - The ATI VGA device has an on-board i2c controller which it
>       connects the DDC that holds the EDID information. The bus is
>       always named "ati-vga.ddc", so if you have multiple of this
>       PCI device in the system the buses have the same names.
>    hw/display/sm501.c
>     - Same as ATI, but the bus name is "sm501.i2c"
>    hw/i2c/aspeed_i2c.c
>     - This I2C controller has either 14 or 16 (!) different i2c
>       buses, and it assigns them names "aspeed.i2c.N" for N = 0,1,2,...
>       The board code mostly seems to use these to wire up various
>       on-board i2c devices.
>       Boards: palmetto-bmc, supermicrox11-bmc, ast2500-evb, romulus-bmc,
>       swift-bmc, sonorapass-bmc, witherspoon-bmc, ast2600-evb,
>       tacoma-bmc, g220a-bmc, quanta-q71l-bmc, rainier-bmc
>    hw/i2c/bitbang_i2c.c
>     - the "GPIO to I2C bridge" device always names its bus "i2c".
>       Used only on musicpal, which only creates one of these buses.
>       Boards: musicpal
>    hw/i2c/exynos4210_i2c.c
>     - This i2c controller always names its bus "i2c". There are 9
>       of these controllers on the board, so they all have clashing
>       names.
>       Boards: nuri, smdkc210
>    hw/i2c/i2c_mux_pca954x.c
>     - This is an i2c multiplexer. All the child buses are named
>       "i2c-bus". The multiplexer is used by the aspeed and npcm7xx
>       boards. (There's a programmable way to get at individual
>       downstream i2c buses despite the name clash; none of the boards
>       using this multiplexer actually connect any devices downstream of
>       it yet.)
>       Boards: palmetto-bmc, supermicrox11-bmc, ast2500-evb, romulus-bmc,
>       swift-bmc, sonorapass-bmc, witherspoon-bmc, ast2600-evb,
>       tacoma-bmc, g220a-bmc, quanta-q71l-bmc, rainier-bmc,
>       npcm750-evb, quanta-gsj, quanta-gbs-bmc, kudo-bmc
>    hw/i2c/mpc_i2c.c
>     - This controller always names its bus "i2c". There is only one
>       of these controllers in the machine.
>       Boards: ppce500, mpc8544ds
>    hw/i2c/npcm7xx_smbus.c
>     - This controller always names its bus "i2c-bus". There are multiple
>       controllers on the boards. The name also clashes with the one used
>       by the pca954x muxes on these boards (see above).
>       Boards: npcm750-evb, quanta-gsj, quanta-gbs-bmc, kudo-bmc
>    hw/i2c/pm_smbus.c
>     - This is the PC SMBUS implementation (it is not a QOM device...)
>       The bus is always called "i2c".
>       Boards: haven't worked through; at least all the x86 PC-like
>       boards, I guess
>    hw/i2c/ppc4xx_i2c.c
>     - This controller always names its bus "i2c". The taihu and
>       ref405ep have only one controller, but sam460ex has two which
>       will have non-unique names.
>       Boards: taihu, ref405ep, sam460ex
>    hw/i2c/versatile_i2c.c
>     - This controller always names its bus "i2c". The MPS boards all
>       have multiples of this controller with clashing names; the others
>       have only one controller.
>       Boards: mps2-an385, mps2-an386, mps2-an500, mps2-an511,
>       mps2-an505, mps2-an521, mps3-an524, mps3-an547,
>       realview-eb, realview-eb-mpcore, realview-pb-a8, realview-pbx-a9,
>       versatileab, versatilepb, vexpress-a9, vexpress-a15
>
> In a lot of these cases I suspect the i2c controllers are
> provided either to allow connection of various internal-to-the-board
> devices, or simply so that guest OS bootup code that initializes
> the i2c controller doesn't fall over. However since there's
> nothing stopping users from creating i2c devices themselves
> on the commandline, some people might be doing that.

What are the devices they could add?  Anything they could *reasonably*
want to add?  Breaking "unreasonable" uses could be defendable.

The only spot where we set ->bus_type = TYPE_I2C_BUS is
i2c_slave_class_init().  Therefore, only the concrete subtypes of
TYPE_I2C_SLAVE can go on an i2c bus, which makes sense.  These are:

    TYPE_ADM1272            "adm1272"
    TYPE_AER915             "aer915"
    TYPE_AT24C_EE           "at24c-eeprom"
    TYPE_DS1338             "ds1338"
                            "emc1413"
                            "emc1414"
    TYPE_I2CDDC             "i2c-ddc"
    TYPE_LM8323             "lm8323"
    TYPE_M41T80             "m41t80"
    TYPE_MAX34451           "max34451"
    TYPE_MAX7310            "max7310"
    TYPE_PCA9546            "pca9546"
    TYPE_PCA9548            "pca9548"
    TYPE_PCA9552            "pca9552"
    TYPE_PXA2XX_I2C_SLAVE   "pxa2xx-i2c-slave"
    TYPE_SII9022            "sii9022"
    TYPE_SMBUS_DEVICE       "smbus-device"
    TYPE_SMBUS_EEPROM       "smbus-eeprom"
    TYPE_SMBUS_IPMI         "smbus-ipmi"
    TYPE_SSD0303            "ssd0303"
    TYPE_TMP105             "tmp105"
                            "tmp421"
                            "tmp422"
                            "tmp423"
    TYPE_TOSA_DAC           "tosa_dac"
    TYPE_TWL92230           "twl92230"
    TYPE_WM8750             "wm8750"

Grep hits in:

    hw/arm/aspeed.c
    hw/arm/musicpal.c
    hw/arm/npcm7xx_boards.c
    hw/arm/nseries.c
    hw/arm/pxa2xx.c
    hw/arm/realview.c
    hw/arm/spitz.c
    hw/arm/stellaris.c
    hw/arm/tosa.c
    hw/arm/versatilepb.c
    hw/arm/vexpress.c
    hw/arm/z2.c
    hw/audio/marvell_88w8618.c
    hw/audio/wm8750.c
    hw/display/ati.c
    hw/display/i2c-ddc.c
    hw/display/sii9022.c
    hw/display/sm501.c
    hw/display/ssd0303.c
    hw/display/xlnx_dp.c
    hw/gpio/max7310.c
    hw/i2c/i2c_mux_pca954x.c
    hw/i2c/pmbus_device.c
    hw/i2c/smbus_eeprom.c
    hw/i2c/smbus_slave.c
    hw/input/lm832x.c
    hw/ipmi/smbus_ipmi.c
    hw/misc/pca9552.c
    hw/nvram/eeprom_at24c.c
    hw/ppc/e500.c
    hw/ppc/sam460ex.c
    hw/rtc/ds1338.c
    hw/rtc/m41t80.c
    hw/rtc/twl92230.c
    hw/sensor/adm1272.c
    hw/sensor/emc141x.c
    hw/sensor/max34451.c
    hw/sensor/tmp105.c
    hw/sensor/tmp421.c
    include/hw/audio/wm8750.h
    include/hw/display/i2c-ddc.h
    include/hw/i2c/i2c_mux_pca954x.h
    include/hw/i2c/smbus_slave.h
    include/hw/input/lm832x.h
    include/hw/misc/pca9552.h
    include/hw/sensor/tmp105.h
    tests/qtest/adm1272-test.c
    tests/qtest/ds1338-test.c
    tests/qtest/emc141x-test.c
    tests/qtest/max34451-test.c
    tests/qtest/pca9552-test.c
    tests/qtest/tmp105-test.c

>
> In some of these cases (eg the i2c bus on the ATI VGA driver)
> I suspect the desired behaviour is "unique bus name based on
> a standard template, eg 'ati-vga.ddc.0/1/...'. It sounds like
> we can't do that, though.

We could add yet another case to qbus_init(): if name is non-null, and
bus->parent has a flag set, we use

    "%s.%d", name, bus->parent->num_child_bus.

"Could" doesn not imply "should".

>                           (Also they probably don't want to
> permit users to command-line plug i2c devices into it...)

Then they should massage the bus so it doesn't accept additional
devices.  Didn't you post a patch related to this recently?



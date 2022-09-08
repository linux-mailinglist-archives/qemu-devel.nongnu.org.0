Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A10665B1A02
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 12:31:50 +0200 (CEST)
Received: from localhost ([::1]:57974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWEp3-0001iN-SP
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 06:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oWEfh-0001z7-2E; Thu, 08 Sep 2022 06:22:09 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:41857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oWEfb-0001i4-Qd; Thu, 08 Sep 2022 06:22:07 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 744AC74633F;
 Thu,  8 Sep 2022 12:22:00 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 321EA7461AE; Thu,  8 Sep 2022 12:22:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 30845745702;
 Thu,  8 Sep 2022 12:22:00 +0200 (CEST)
Date: Thu, 8 Sep 2022 12:22:00 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 00/13] Instantiate VT82xx functions in host device
In-Reply-To: <6B91888F-40E0-4E92-B49D-BA0A7E784183@gmail.com>
Message-ID: <128199e8-cd65-79d4-2ad-83224b9dfdc5@eik.bme.hu>
References: <20220901114127.53914-1-shentey@gmail.com>
 <6B91888F-40E0-4E92-B49D-BA0A7E784183@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Sep 2022, Bernhard Beschow wrote:
> Am 1. September 2022 11:41:14 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>> v5:
>>
>> * Add patch "Inline vt82c686b_southbridge_init() and remove it" (Zoltan)
>>
>> * Use machine parameter when creating rtc-time alias (Zoltan)
>>
>>
>>
>> Testing done: Same as in v3.
>>
>>
>>
>> v4:
>>
>> * Fix in comment: AC97 Modem -> MC97 Modem (Zoltan)
>>
>> * Introduce TYPE_VT82C686B_USB_UHCI define (Zoltan)
>>
>> * Introduce TYPE_VIA_IDE define (for consistency)
>>
>>
>>
>> v3:
>>
>> * Replace pre increment by post increment in for loop (Zoltan)
>>
>> * Move class defines close to where the class is defined (Zoltan)
>>
>>
>>
>> Testing done:
>>
>> * `make check-avocado`
>>
>>  Passes for boot_linux_console.py for mips64el_fuloong2e
>>
>> * `qemu-system-ppc -machine pegasos2 -rtc base=localtime -device ati-vga,guest_hwcursor=true,romfile="" -cdrom morphos-3.17.iso -kernel morphos-3.17/boot.img`
>>
>>  Boots successfully and it is possible to open games and tools.
>>
>>
>>
>> v2:
>>
>> * Keep the call to pci_ide_create_devs() in board code for consistency (Zoltan)
>>
>> * Create rtc-time alias in board rather than in south bridge code
>>
>> * Remove stale comments about PCI functions (Zoltan)
>>
>>
>>
>> v1:
>>
>> This series instantiates all PCI functions of the VT82xx south bridges in the south bridges themselves.
>>
>> For the IDE function this is especially important since its interrupt routing is configured in the
>>
>> ISA function, hence doesn't make sense to instantiate it as a "Frankenstein" device. The interrupt
>>
>> routing is currently hardcoded and changing that is currently not in the scope of this series.
>>
>>
>>
>> Testing done:
>>
>> * `qemu-system-ppc -machine pegasos2 -rtc base=localtime -device ati-vga,guest_hwcursor=true,romfile="" -cdrom morphos-3.17.iso -kernel morphos-3.17/boot.img`
>>
>>  Boots successfully and it is possible to open games and tools.
>>
>>
>>
>> * I was unable to test the fuloong2e board even before this series since it seems to be unfinished [1].
>>
>>  A buildroot-baked kernel [2] booted but doesn't find its root partition, though the issues could be in the buildroot receipt I created.
>>
>>
>>
>> [1] https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2
>>
>> [2] https://github.com/shentok/buildroot/commits/fuloong2e
>>
>
> Ping
>
> Zoltan, would you mind giving your Reviewed-by for 'hw/mips/fuloong2e: 
> Inline vt82c686b_southbridge_init() and remove it' explicitly? Perhaps I 
> was too eager to omit it since I didn't want to put words in your mouth.

You said in your follow up message that all except this patch has my R-b 
which is correct. This one already has Suggested-by from me so I agree 
with it with or without an explicit Reviewed-by.

> What else is missing? Who would do the pull request?

It was Philippe before who merged these maybe needs his attention or give 
some Ack to go via smoe other tree? My mails don't seem to reach him 
though due to bouncing as spam so not sure he sees this.

Regards,
BALATON Zoltan

> Thanks,
> Bernhard
>>
>>
>> Bernhard Beschow (13):
>>
>>  hw/isa/vt82c686: Resolve chip-specific realize methods
>>
>>  hw/isa/vt82c686: Resolve unneeded attribute
>>
>>  hw/isa/vt82c686: Prefer pci_address_space() over get_system_memory()
>>
>>  hw/isa/vt82c686: Reuse errp
>>
>>  hw/isa/vt82c686: Introduce TYPE_VIA_IDE define
>>
>>  hw/isa/vt82c686: Instantiate IDE function in host device
>>
>>  hw/isa/vt82c686: Introduce TYPE_VT82C686B_USB_UHCI define
>>
>>  hw/isa/vt82c686: Instantiate USB functions in host device
>>
>>  hw/isa/vt82c686: Instantiate PM function in host device
>>
>>  hw/isa/vt82c686: Instantiate AC97 and MC97 functions in host device
>>
>>  hw/mips/fuloong2e: Inline vt82c686b_southbridge_init() and remove it
>>
>>  hw/isa/vt82c686: Embed RTCState in host device
>>
>>  hw/isa/vt82c686: Create rtc-time alias in boards instead
>>
>>
>>
>> configs/devices/mips64el-softmmu/default.mak |   1 -
>>
>> hw/ide/via.c                                 |   2 +-
>>
>> hw/isa/Kconfig                               |   1 +
>>
>> hw/isa/vt82c686.c                            | 120 +++++++++++++++----
>>
>> hw/mips/fuloong2e.c                          |  39 +++---
>>
>> hw/ppc/Kconfig                               |   1 -
>>
>> hw/ppc/pegasos2.c                            |  25 ++--
>>
>> hw/usb/vt82c686-uhci-pci.c                   |   4 +-
>>
>> include/hw/isa/vt82c686.h                    |   4 +-
>>
>> 9 files changed, 126 insertions(+), 71 deletions(-)
>>
>>
>>
>> -- >
>> 2.37.3
>>
>>
>>
>
>
>


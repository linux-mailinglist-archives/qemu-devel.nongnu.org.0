Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512EC346D42
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:36:16 +0100 (CET)
Received: from localhost ([::1]:48136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpdH-0004A0-AW
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lOpb6-0001vU-4E
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:34:00 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:12294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lOpb2-0002Si-IM
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:33:59 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1D2457462D6;
 Tue, 23 Mar 2021 23:33:54 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E38AE74581E; Tue, 23 Mar 2021 23:33:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E1F037456E3;
 Tue, 23 Mar 2021 23:33:53 +0100 (CET)
Date: Tue, 23 Mar 2021 23:33:53 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 1/3] vt82c686.c: don't raise SCI when PCI_INTERRUPT_PIN
 isn't setup
In-Reply-To: <3a91db07-a452-43a7-0156-a3720ad9e209@amsat.org>
Message-ID: <35d4cca5-9bd4-e181-1676-24c359ab3a3c@eik.bme.hu>
References: <cover.1616519655.git.isaku.yamahata@intel.com>
 <00c07067c1c8700bea48407cbec6d854e87de742.1616519655.git.isaku.yamahata@intel.com>
 <3a91db07-a452-43a7-0156-a3720ad9e209@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-70328805-1616538833=:35282"
X-Spam-Probability: 9%
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>, peter.maydell@linaro.org,
 Peter Maydell <Peter.maydel@linaro.org>, mst@redhat.com,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 imammedo@redhat.com, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-70328805-1616538833=:35282
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 23 Mar 2021, Philippe Mathieu-Daudé wrote:
> Hi Isaku,
>
> On 3/23/21 6:24 PM, Isaku Yamahata wrote:
>> Without this patch, the following patch will triger clan runtime
>> sanitizer warnings as follows. This patch proactively works around it.
>> I let v582c686.c maintainer address a correct fix as I'm not sure
>> about fuloong2e device model.
>>
>>> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
>>> QTEST_QEMU_IMG=./qemu-img
>>> G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
>>> QTEST_QEMU_BINARY=./qemu-system-mips64el tests/qtest/qom-test --tap -k
>>> PASS 1 qtest-mips64el/qom-test /mips64el/qom/loongson3-virt
>>> PASS 2 qtest-mips64el/qom-test /mips64el/qom/none
>>> PASS 3 qtest-mips64el/qom-test /mips64el/qom/magnum
>>> PASS 4 qtest-mips64el/qom-test /mips64el/qom/mipssim
>>> PASS 5 qtest-mips64el/qom-test /mips64el/qom/malta
>>> ../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
>>> PASS 6 qtest-mips64el/qom-test /mips64el/qom/fuloong2e
>>> PASS 7 qtest-mips64el/qom-test /mips64el/qom/boston
>>> PASS 8 qtest-mips64el/qom-test /mips64el/qom/pica61
>>>
>>> and similarly for eg
>>>
>>> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
>>> QTEST_QEMU_IMG=./qemu-img
>>> G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
>>> QTEST_QEMU_BINARY=./qemu-system-mips64el tests/qtest/endianness-test
>>> --tap -k
>>> ../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
>>> PASS 1 qtest-mips64el/endianness-test /mips64el/endianness/fuloong2e
>>> ../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
>>> PASS 2 qtest-mips64el/endianness-test /mips64el/endianness/split/fuloong2e
>>> ../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
>>> PASS 3 qtest-mips64el/endianness-test /mips64el/endianness/combine/fuloong2e
>>
>> Cc: Huacai Chen <chenhuacai@kernel.org>
>> Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
>> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Reported-by: Peter Maydell <Peter.maydel@linaro.org>
>> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
>> ---
>>  hw/isa/vt82c686.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>> index 05d084f698..f0fb309f12 100644
>> --- a/hw/isa/vt82c686.c
>> +++ b/hw/isa/vt82c686.c
>> @@ -144,7 +144,18 @@ static void pm_update_sci(ViaPMState *s)
>>                     ACPI_BITMASK_POWER_BUTTON_ENABLE |
>>                     ACPI_BITMASK_GLOBAL_LOCK_ENABLE |
>>                     ACPI_BITMASK_TIMER_ENABLE)) != 0);
>> -    pci_set_irq(&s->dev, sci_level);
>> +    if (pci_get_byte(s->dev.config + PCI_INTERRUPT_PIN)) {
>> +        /*
>> +         * FIXME:
>> +         * Fix device model that realizes this PM device and remove
>> +         * this work around.
>> +         * The device model should wire SCI and setup
>> +         * PCI_INTERRUPT_PIN properly.
>> +         * If PIN# = 0(interrupt pin isn't used), don't raise SCI as
>> +         * work around.
>> +         */
>> +        pci_set_irq(&s->dev, sci_level);
>
> I'll defer this to Zoltan.

I don't know anything about this, this was there well before I've touched 
this device model:

https://git.qemu.org/?p=qemu.git;a=blame;f=hw/isa/vt82c686.c;hb=8063396bf3459a810d24e3efd6110b8480f0de5b

> Personally I wouldn't care about SCI_EN on the vt82c686, as
> it is not used by x86 machines (IOW, I'd not modify via_pm_reset
> and KISS).

I'm not sure but maybe then you could also just remove the PM parts from 
the device model as it probably does not work correctly anyway at the 
moment as it may not be correctly wired up to config registers. I'm not 
sure if it's needed by any guests but it was there for some reason and 
maybe better to fix it if possible than dropping it. As a workaround I'm 
OK with the proposed patch, I don't think it would break anything but 
haven't tested it.

Regards,
BALATON Zoltan

>> +    }
>>      /* schedule a timer interruption if needed */
>>      acpi_pm_tmr_update(&s->ar, (s->ar.pm1.evt.en & ACPI_BITMASK_TIMER_ENABLE) &&
>>                         !(pmsts & ACPI_BITMASK_TIMER_STATUS));
>>
>
>
--3866299591-70328805-1616538833=:35282--


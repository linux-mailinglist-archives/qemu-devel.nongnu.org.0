Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0150130C01
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 03:11:49 +0100 (CET)
Received: from localhost ([::1]:47176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioHrw-0002V2-O9
	for lists+qemu-devel@lfdr.de; Sun, 05 Jan 2020 21:11:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43778)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1ioHqv-0001ux-FM
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 21:10:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1ioHqu-0008CJ-2c
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 21:10:45 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2285 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1ioHqq-0007zr-T7; Sun, 05 Jan 2020 21:10:41 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 41DC94A0B0DEFCBBC6AC;
 Mon,  6 Jan 2020 10:10:34 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Mon, 6 Jan 2020
 10:10:25 +0800
Subject: Re: [PATCH 2/2] arm/virt/acpi: remove _ADR from devices identified by
 _HID
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-3-guoheyi@huawei.com>
 <20200105072504-mutt-send-email-mst@kernel.org>
 <20200105074308-mutt-send-email-mst@kernel.org>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <ede9a938-32a3-70e0-d884-325505afb345@huawei.com>
Date: Mon, 6 Jan 2020 10:10:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200105074308-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
X-Originating-IP: [10.133.216.73]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


=E5=9C=A8 2020/1/5 20:53, Michael S. Tsirkin =E5=86=99=E9=81=93:
> On Sun, Jan 05, 2020 at 07:34:01AM -0500, Michael S. Tsirkin wrote:
>> On Thu, Dec 19, 2019 at 02:47:59PM +0800, Heyi Guo wrote:
>>> According to ACPI spec, _ADR should be used for device which is on a
>>> bus that has a standard enumeration algorithm. It does not make sense
>>> to have a _ADR object for devices which already have _HID and will be
>>> enumerated by OSPM.
>>>
>>> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
>> Are you sure? I would think this depends on the ID and the device
>> really. E.g. PCI devices all are expected to have _ADR and some of the=
m
>> have a _HID.
>
> To clarify I am not commenting on patches.
> The spec says this:
> 	6.1.5 _HID (Hardware ID)
>
> 	This object is used to supply OSPM with the device=E2=80=99s PNP ID or=
 ACPI ID. 1
>
> 	When describing a platform, use of any _HID objects is optional. Howev=
er, a _HID object must be
>
> 	used to describe any device that will be enumerated by OSPM. OSPM only=
 enumerates a device
>
> 	when no bus enumerator can detect the device ID. For example, devices =
on an ISA bus are
>
> 	enumerated by OSPM. Use the _ADR object to describe devices enumerated=
 by bus enumerators
>
> 	other than OSPM.
>
>
> Note: "detect the device ID" not "enumerate the device" which I think
> means there's a driver matching this vendor/device ID.
>
> So it seems fine to have _ADR so device is enumerated, and still have
> _HID e.g. so ACPI driver can be loaded as fallback if there's
> no bus driver.
>
>
> Note I am not saying the patch itself is not correct.
> Maybe these devices are not on any standard bus and that
> is why they should not have _ADR? I have not looked.
>
> I am just saying that spec does not seem to imply _HID and _ADR
> can't coexist.

That's true; I did't find such statement either. Maybe what we can say=20
is that the _ADR is senseless here.

Thanks,

Heyi

>
>
>> CC Corey who added a device with both HID and ADR to x86 recenly.
>>
>> Apropos Corey, why was HID APP0005 chosen?
>>
>>> ---
>>> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>>> Cc: Igor Mammedov <imammedo@redhat.com>
>>> Cc: qemu-arm@nongnu.org
>>> Cc: qemu-devel@nongnu.org
>>> ---
>>>   hw/arm/virt-acpi-build.c          |   8 --------
>>>   tests/data/acpi/virt/DSDT         | Bin 18449 -> 18426 bytes
>>>   tests/data/acpi/virt/DSDT.memhp   | Bin 19786 -> 19763 bytes
>>>   tests/data/acpi/virt/DSDT.numamem | Bin 18449 -> 18426 bytes
>>>   4 files changed, 8 deletions(-)
>>>
>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>> index 9f4c7d1889..be752c0ad8 100644
>>> --- a/hw/arm/virt-acpi-build.c
>>> +++ b/hw/arm/virt-acpi-build.c
>>> @@ -78,11 +78,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const M=
emMapEntry *uart_memmap,
>>>                                AML_EXCLUSIVE, &uart_irq, 1));
>>>       aml_append(dev, aml_name_decl("_CRS", crs));
>>>  =20
>>> -    /* The _ADR entry is used to link this device to the UART descri=
bed
>>> -     * in the SPCR table, i.e. SPCR.base_address.address =3D=3D _ADR=
.
>>> -     */
>>> -    aml_append(dev, aml_name_decl("_ADR", aml_int(uart_memmap->base)=
));
>>> -
>>>       aml_append(scope, dev);
>>>   }
>>>  =20
>>> @@ -170,7 +165,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const M=
emMapEntry *memmap,
>>>       aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
>>>       aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
>>>       aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
>>> -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>>>       aml_append(dev, aml_name_decl("_UID", aml_string("PCI0")));
>>>       aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Devic=
e")));
>>>       aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
>>> @@ -334,7 +328,6 @@ static void acpi_dsdt_add_gpio(Aml *scope, const =
MemMapEntry *gpio_memmap,
>>>   {
>>>       Aml *dev =3D aml_device("GPO0");
>>>       aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
>>> -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>>>       aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>>>  =20
>>>       Aml *crs =3D aml_resource_template();
>>> @@ -364,7 +357,6 @@ static void acpi_dsdt_add_power_button(Aml *scope=
)
>>>   {
>>>       Aml *dev =3D aml_device(ACPI_POWER_BUTTON_DEVICE);
>>>       aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
>>> -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>>>       aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>>>       aml_append(scope, dev);
>>>   }
>>> diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
>>
>> Please do not include binary changes in acpi patches.
>>
>> See comment at the top of tests/bios-tables-test.c for documentation
>> on how to update these.
>>
>> --=20
>> MST
>
> .



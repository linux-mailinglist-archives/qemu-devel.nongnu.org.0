Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E123B33E2
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 18:24:01 +0200 (CEST)
Received: from localhost ([::1]:41012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwS92-0004p1-2P
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 12:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lwS7g-00049g-AH
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 12:22:36 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:27865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lwS7X-0003uN-6I
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 12:22:35 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 99F9174570E;
 Thu, 24 Jun 2021 18:22:19 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1D43074570B; Thu, 24 Jun 2021 18:22:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1AECF7456E3;
 Thu, 24 Jun 2021 18:22:19 +0200 (CEST)
Date: Thu, 24 Jun 2021 18:22:19 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PULL 30/43] vt82c686: Fix SMBus IO base and configuration
 registers
In-Reply-To: <0c52a343-ed4c-92fa-fac0-0f32f37b0df2@amsat.org>
Message-ID: <c130da74-ef2b-bff2-f539-b1df87e06b66@eik.bme.hu>
References: <20210221143432.2468220-1-f4bug@amsat.org>
 <20210221143432.2468220-31-f4bug@amsat.org>
 <0c52a343-ed4c-92fa-fac0-0f32f37b0df2@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-737719759-1624551535=:31091"
Content-ID: <42d63053-548b-1484-6588-749048668581@eik.bme.hu>
X-Spam-Probability: 9%
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-737719759-1624551535=:31091
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <17659f7-d06f-b4e3-a983-28e35ca3347@eik.bme.hu>

On Thu, 24 Jun 2021, Philippe Mathieu-Daud� wrote:
> Hi Zoltan,
>
> On 2/21/21 3:34 PM, Philippe Mathieu-Daud� wrote:
>> From: BALATON Zoltan <balaton@eik.bme.hu>
>>
>> The base address of the SMBus io ports and its enabled status is set
>> by registers in the PCI config space but this was not correctly
>> emulated. Instead the SMBus registers were mapped on realize to the
>> base address set by a property to the address expected by fuloong2e
>> firmware.
>>
>> Fix the base and config register handling to more closely model
>> hardware which allows to remove the property and allows the guest to
>> control this mapping. Do all this in reset instead of realize so it's
>> correctly updated on reset.
>
> This commit broken running PMON on Fuloong2E:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg752605.html
> console: PMON2000 MIPS Initializing. Standby...
> console: ERRORPC=00000000 CONFIG=00030932
> console: PRID=00006302
> console: DIMM read
> console: 000000ff
> console: 000000ff
> console: 000000ff
> console: 000000ff
> console: 000000ff
> console: 000000ff
> console: 000000ff
> console: 000000ff
> console: 000000ff
> console: 000000ff
> ...
>
> From here the console loops displaying this value...
>
> Expected:
>
> console: PMON2000 MIPS Initializing. Standby...
> console: ERRORPC=00000000 CONFIG=00030932
> console: PRID=00006302
> console: DIMM read
> console: 00000080
> console: read memory type
> console: read number of rows
> ...

Hello,

Are you sure it's this patch and not some i2c changes? It seems to try to 
read the SPD EEPROM over I2C at this point at address 0x80 but seems to 
get an I2C error instead. I don't know what could break that in this patch 
but haven't looked at it in detail yet. Maybe you could compare info mtree 
between working and non working cases to check that SMBUS is at the same 
address as this patch should allow the guest to enable the PM memory 
region and set it's base. I think I tested it with PMON and it used to 
work that time but maybe some last minute changes broke it.

Regards,
BALATON Zoltan

>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Message-Id: <f2ca2ad5f08ba8cee07afd9d67b4e75cda21db09.1610223397.git.balaton@eik.bme.hu>
>> Signed-off-by: Philippe Mathieu-Daud� <f4bug@amsat.org>
>> ---
>>  hw/isa/vt82c686.c   | 49 +++++++++++++++++++++++++++++++++------------
>>  hw/mips/fuloong2e.c |  4 +---
>>  2 files changed, 37 insertions(+), 16 deletions(-)
>>
>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>> index fe8961b0573..9c4d1530225 100644
>> --- a/hw/isa/vt82c686.c
>> +++ b/hw/isa/vt82c686.c
>> @@ -22,6 +22,7 @@
>>  #include "hw/i2c/pm_smbus.h"
>>  #include "qapi/error.h"
>>  #include "qemu/module.h"
>> +#include "qemu/range.h"
>>  #include "qemu/timer.h"
>>  #include "exec/address-spaces.h"
>>  #include "trace.h"
>> @@ -34,7 +35,6 @@ struct VT686PMState {
>>      ACPIREGS ar;
>>      APMState apm;
>>      PMSMBus smb;
>> -    uint32_t smb_io_base;
>>  };
>>
>>  static void pm_io_space_update(VT686PMState *s)
>> @@ -50,11 +50,22 @@ static void pm_io_space_update(VT686PMState *s)
>>      memory_region_transaction_commit();
>>  }
>>
>> +static void smb_io_space_update(VT686PMState *s)
>> +{
>> +    uint32_t smbase = pci_get_long(s->dev.config + 0x90) & 0xfff0UL;
>> +
>> +    memory_region_transaction_begin();
>> +    memory_region_set_address(&s->smb.io, smbase);
>> +    memory_region_set_enabled(&s->smb.io, s->dev.config[0xd2] & BIT(0));
>> +    memory_region_transaction_commit();
>> +}
>> +
>>  static int vmstate_acpi_post_load(void *opaque, int version_id)
>>  {
>>      VT686PMState *s = opaque;
>>
>>      pm_io_space_update(s);
>> +    smb_io_space_update(s);
>>      return 0;
>>  }
>>
>> @@ -77,8 +88,18 @@ static const VMStateDescription vmstate_acpi = {
>>
>>  static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len)
>>  {
>> +    VT686PMState *s = VT82C686B_PM(d);
>> +
>>      trace_via_pm_write(addr, val, len);
>>      pci_default_write_config(d, addr, val, len);
>> +    if (ranges_overlap(addr, len, 0x90, 4)) {
>> +        uint32_t v = pci_get_long(s->dev.config + 0x90);
>> +        pci_set_long(s->dev.config + 0x90, (v & 0xfff0UL) | 1);
>> +    }
>> +    if (range_covers_byte(addr, len, 0xd2)) {
>> +        s->dev.config[0xd2] &= 0xf;
>> +        smb_io_space_update(s);
>> +    }
>>  }
>>
>>  static void pm_update_sci(VT686PMState *s)
>> @@ -103,6 +124,17 @@ static void pm_tmr_timer(ACPIREGS *ar)
>>      pm_update_sci(s);
>>  }
>>
>> +static void vt82c686b_pm_reset(DeviceState *d)
>> +{
>> +    VT686PMState *s = VT82C686B_PM(d);
>> +
>> +    /* SMBus IO base */
>> +    pci_set_long(s->dev.config + 0x90, 1);
>> +    s->dev.config[0xd2] = 0;
>> +
>> +    smb_io_space_update(s);
>> +}
>> +
>>  static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
>>  {
>>      VT686PMState *s = VT82C686B_PM(dev);
>> @@ -116,13 +148,9 @@ static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
>>      /* 0x48-0x4B is Power Management I/O Base */
>>      pci_set_long(pci_conf + 0x48, 0x00000001);
>>
>> -    /* SMB ports:0xeee0~0xeeef */
>> -    s->smb_io_base = ((s->smb_io_base & 0xfff0) + 0x0);
>> -    pci_conf[0x90] = s->smb_io_base | 1;
>> -    pci_conf[0x91] = s->smb_io_base >> 8;
>> -    pci_conf[0xd2] = 0x90;
>>      pm_smbus_init(DEVICE(s), &s->smb, false);
>> -    memory_region_add_subregion(get_system_io(), s->smb_io_base, &s->smb.io);
>> +    memory_region_add_subregion(pci_address_space_io(dev), 0, &s->smb.io);
>> +    memory_region_set_enabled(&s->smb.io, false);
>>
>>      apm_init(dev, &s->apm, NULL, s);
>>
>> @@ -135,11 +163,6 @@ static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
>>      acpi_pm1_cnt_init(&s->ar, &s->io, false, false, 2);
>>  }
>>
>> -static Property via_pm_properties[] = {
>> -    DEFINE_PROP_UINT32("smb_io_base", VT686PMState, smb_io_base, 0),
>> -    DEFINE_PROP_END_OF_LIST(),
>> -};
>> -
>>  static void via_pm_class_init(ObjectClass *klass, void *data)
>>  {
>>      DeviceClass *dc = DEVICE_CLASS(klass);
>> @@ -151,10 +174,10 @@ static void via_pm_class_init(ObjectClass *klass, void *data)
>>      k->device_id = PCI_DEVICE_ID_VIA_ACPI;
>>      k->class_id = PCI_CLASS_BRIDGE_OTHER;
>>      k->revision = 0x40;
>> +    dc->reset = vt82c686b_pm_reset;
>>      dc->desc = "PM";
>>      dc->vmsd = &vmstate_acpi;
>>      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>> -    device_class_set_props(dc, via_pm_properties);
>>  }
>>
>>  static const TypeInfo via_pm_info = {
>> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
>> index 1f3680fda3e..94f4718147f 100644
>> --- a/hw/mips/fuloong2e.c
>> +++ b/hw/mips/fuloong2e.c
>> @@ -230,9 +230,7 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>>      pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
>>      pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), "vt82c686b-usb-uhci");
>>
>> -    dev = pci_new(PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
>> -    qdev_prop_set_uint32(DEVICE(dev), "smb_io_base", 0xeee1);
>> -    pci_realize_and_unref(dev, pci_bus, &error_fatal);
>> +    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
>>      *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
>>
>>      /* Audio support */
>>
>
>
--3866299591-737719759-1624551535=:31091--


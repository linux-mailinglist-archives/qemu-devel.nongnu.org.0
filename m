Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA16F2F3C50
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 23:27:31 +0100 (CET)
Received: from localhost ([::1]:56810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzS8Q-00026W-Is
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 17:27:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kzS6z-0001eG-JY
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 17:26:01 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:50354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kzS6v-0003m1-Co
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 17:26:00 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1CC70746552;
 Tue, 12 Jan 2021 23:25:54 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D624174645F; Tue, 12 Jan 2021 23:25:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D464E74645B;
 Tue, 12 Jan 2021 23:25:53 +0100 (CET)
Date: Tue, 12 Jan 2021 23:25:53 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 03/13] vt82c686: Fix SMBus IO base and configuration
 registers
In-Reply-To: <f01fb9b0-133f-325d-9d34-e97af14e3c4d@flygoat.com>
Message-ID: <998ba27e-5d97-1456-a9ef-37e73ed4dc9a@eik.bme.hu>
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <f2ca2ad5f08ba8cee07afd9d67b4e75cda21db09.1610223397.git.balaton@eik.bme.hu>
 <f01fb9b0-133f-325d-9d34-e97af14e3c4d@flygoat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-664848641-1610490353=:84542"
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-664848641-1610490353=:84542
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 12 Jan 2021, Jiaxun Yang wrote:
> 在 2021/1/10 上午4:16, BALATON Zoltan 写道:
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
> Hi,
>
> Thanks for your patch!
>
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/isa/vt82c686.c   | 49 +++++++++++++++++++++++++++++++++------------
>>   hw/mips/fuloong2e.c |  4 +---
>>   2 files changed, 37 insertions(+), 16 deletions(-)
>> 
>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>> index fe8961b057..9c4d153022 100644
>> --- a/hw/isa/vt82c686.c
>> +++ b/hw/isa/vt82c686.c
>> @@ -22,6 +22,7 @@
>>   #include "hw/i2c/pm_smbus.h"
>>   #include "qapi/error.h"
>>   #include "qemu/module.h"
>> +#include "qemu/range.h"
>>   #include "qemu/timer.h"
>>   #include "exec/address-spaces.h"
>>   #include "trace.h"
>> @@ -34,7 +35,6 @@ struct VT686PMState {
>>       ACPIREGS ar;
>>       APMState apm;
>>       PMSMBus smb;
>> -    uint32_t smb_io_base;
>>   };
>>     static void pm_io_space_update(VT686PMState *s)
>> @@ -50,11 +50,22 @@ static void pm_io_space_update(VT686PMState *s)
>>       memory_region_transaction_commit();
>>   }
>>   +static void smb_io_space_update(VT686PMState *s)
>> +{
>> +    uint32_t smbase = pci_get_long(s->dev.config + 0x90) & 0xfff0UL;
>> +
>> +    memory_region_transaction_begin();
>> +    memory_region_set_address(&s->smb.io, smbase);
>> +    memory_region_set_enabled(&s->smb.io, s->dev.config[0xd2] & BIT(0));
>> +    memory_region_transaction_commit();
>> +}
>> +
>>   static int vmstate_acpi_post_load(void *opaque, int version_id)
>>   {
>>       VT686PMState *s = opaque;
>>         pm_io_space_update(s);
>> +    smb_io_space_update(s);
>>       return 0;
>>   }
>>   @@ -77,8 +88,18 @@ static const VMStateDescription vmstate_acpi = {
>>     static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t val, 
>> int len)
>>   {
>> +    VT686PMState *s = VT82C686B_PM(d);
>> +
>>       trace_via_pm_write(addr, val, len);
>>       pci_default_write_config(d, addr, val, len);
>> +    if (ranges_overlap(addr, len, 0x90, 4)) {
>> +        uint32_t v = pci_get_long(s->dev.config + 0x90);
>> +        pci_set_long(s->dev.config + 0x90, (v & 0xfff0UL) | 1);
>
> What does this "or 1" do?
> The datasheet I found only mentioned the default value of BASE is 0000 0001
> but didn't say anything about it's function :-/

It says that in the summary table but later in data sheet there's also 
detailed description of registers for each part where it says:

Offset 93-90 – SMBus I/O Base ... RW
3-0 Fixed ... always reads 0001b

The above mask and | 1 ensures this. I don't know why lowest bit is always 
1 but that seems to be the case for all such regs. Maybe internally these 
are implemented like PCI BARs where lowest bit means IO space.

>> +    }
>> +    if (range_covers_byte(addr, len, 0xd2)) {
>> +        s->dev.config[0xd2] &= 0xf;
>> +        smb_io_space_update(s);
>> +    }
>>   }
>>     static void pm_update_sci(VT686PMState *s)
>> @@ -103,6 +124,17 @@ static void pm_tmr_timer(ACPIREGS *ar)
>>       pm_update_sci(s);
>>   }
>>   +static void vt82c686b_pm_reset(DeviceState *d)
>> +{
>> +    VT686PMState *s = VT82C686B_PM(d);
>> +
>> +    /* SMBus IO base */
>> +    pci_set_long(s->dev.config + 0x90, 1);
>
> Theoretically this kind of magic number should be avoided but
> as the rest of the file was written in such style it seems fine for me.

I could add defines for register offsets but did not think that would make 
it much more readable to have random names instead of random numbers. 
Likely you'll have to consult the data sheet to find out their meaning 
anyway.

Regards,
BALATON Zoltan
--3866299591-664848641-1610490353=:84542--


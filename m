Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A380569E0E1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 13:56:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUSBl-0003X1-TZ; Tue, 21 Feb 2023 07:56:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUSBh-0003WW-Rp
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:56:06 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUSBf-00012I-5y
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:56:05 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7CF3F746FCF;
 Tue, 21 Feb 2023 13:56:00 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 02408746F32; Tue, 21 Feb 2023 13:56:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F415A7462DB;
 Tue, 21 Feb 2023 13:55:59 +0100 (CET)
Date: Tue, 21 Feb 2023 13:55:59 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Paolo Bonzini <pbonzini@redhat.com>
cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
In-Reply-To: <c2bdd618-5077-3b3f-12d0-974cf9757692@eik.bme.hu>
Message-ID: <04f178bb-2407-232f-e843-386bf04b3024@eik.bme.hu>
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
 <b0787bca-8321-059e-d360-1e0a0af31228@redhat.com>
 <a7992420-e2e3-7859-b2de-f9aa88c94945@redhat.com>
 <d03380e9-b6a2-5998-cc72-6443cfdc46b5@eik.bme.hu>
 <d9fcba9d-c2c6-5be3-ce5f-baf5a116bbc4@eik.bme.hu>
 <20220119041842-mutt-send-email-mst@kernel.org>
 <20220222094021-mutt-send-email-mst@kernel.org>
 <f9f183c4-b0b8-22c6-57f9-1b6b20e8e5a5@eik.bme.hu>
 <20230220172659-mutt-send-email-mst@kernel.org>
 <f4e755b6-051e-103f-b8bc-2765d277633f@eik.bme.hu>
 <e3a19d91-b9ef-9352-8f60-35432fdf5d1e@redhat.com>
 <c2bdd618-5077-3b3f-12d0-974cf9757692@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 21 Feb 2023, BALATON Zoltan wrote:
> On Tue, 21 Feb 2023, Paolo Bonzini wrote:
>> On 2/21/23 00:25, BALATON Zoltan wrote:
>>>> I think fundamentally you need to check for the condition
>>>> Size < mr->ops->impl.min_access_size in memory_region_dispatch_write
>>>> and then make a read, combine the result with
>>>> the value and make a write.
>>> 
>>> I neither know that part nor feel confident enough breaking such low level 
>>> stuff so I think setting the affected regions NATIVE_ENDIAN for now until 
>>> somebody takes care of this is safer and not likely to break anyting (or 
>>> if it does, much less widely and I'm more likely to be able to fix that 
>>> than your proposed changes). So I'd rather let you do that but I'd like 
>>> this fixed one way or another at last.
>> 
>> Sorry about not replying.
>> 
>> The case of impl.min_access_size < valid.min_access_size is not
>> supported in the memory core.  Until that is done, the correct fix is to
>> fix acpi_pm_evt_ops to have impl.min_access_size == 1, something like
>> this:
>> 
>> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
>> index 6da275c599c6..96eb88fa7e27 100644
>> --- a/hw/acpi/core.c
>> +++ b/hw/acpi/core.c
>> @@ -429,20 +429,35 @@ void acpi_pm1_evt_reset(ACPIREGS *ar)
>> static uint64_t acpi_pm_evt_read(void *opaque, hwaddr addr, unsigned width)
>> {
>>     ACPIREGS *ar = opaque;
>> +    uint16_t val;
>>     switch (addr) {
>>     case 0:
>> -        return acpi_pm1_evt_get_sts(ar);
>> +        val = acpi_pm1_evt_get_sts(ar);
>>     case 2:
>> -        return ar->pm1.evt.en;
>> +        val = ar->pm1.evt.en;
>
> Some break; statements are missing here and above. This patch does not apply, 
> I had to apply it by hand to test it but it does not work. I don't have time 
> now to debug this. My patch works and don't see what else could it break. We 
> already have some devices set to native endian because of this so that could 
> be a usable workaround for now until you can fix it in memory layer.
>
> You can reproduce this with the MorphOS demo iso on pegasos2 with the 
> original board firmware thath isn't free but availeble in an updater here:
> http://web.archive.org/web/20071021223056/http://www.bplan-gmbh.de/up050404/up050404
> and the script to get the rom image from it is here:
> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2/attach/extract_rom_from_updater
> the MorphOS iso is here:
> https://www.morphos-team.net/morphos-3.17.iso
>
> Then you can run it as:
>
> qemu-system-ppc -M pegasos2 -bios pegasos2.rom -device ati-vga,romfile=""
>  -serial stdio -cdrom morphos-3.17.iso
>
> at the firmware ok prompt type 'boot cd boot.img' then click OK button for 
> keyboard/language and once it booted press right mouse button on the top menu

To get that menu with Shut Down, first Quit the installer then again right 
click or click on background first to get the menu of the Ambient desktop. 
I also see an error from the firmware at the beginning:
Initializing KBD...00000012    FAILED.
when it's broken and it says Done without the hex number when it works. 
(Two other FAILED messages about clock chip is normal as we don't emulate 
that but all others should be green.)

> bar and select Shutdown from the Ambient (first) menu. Click twice on Shutwon 
> button which should exit QEMU but does reboot instead without a fix. Can you 
> please come up with a working fix if my patch is not acceptable.
>
> Thank you,
> BALATON Zoltan
>
>>     default:
>>         return 0;
>>     }
>> +
>> +    if (width == 1) {
>> +        int bitofs = (addr & 1) * 8;
>> +        val >>= bitofs;
>> +    }
>> +    return val;
>> }
>>  static void acpi_pm_evt_write(void *opaque, hwaddr addr, uint64_t val,
>>                               unsigned width)
>> {
>>     ACPIREGS *ar = opaque;
>> +    if (width == 1) {
>> +        int bitofs = (addr & 1) * 8;
>> +        uint16_t old_val = acpi_pm_evt_read(ar, addr, val & ~1);
>> +        uint16_t mask = 0xFF << bitofs;
>> +        val = (old_val & ~mask) | (val << bitofs);
>> +        addr &= ~1;
>> +    }
>> +
>>     switch (addr) {
>>     case 0:
>>         acpi_pm1_evt_write_sts(ar, val);
>> @@ -458,7 +473,7 @@ static void acpi_pm_evt_write(void *opaque, hwaddr 
>> addr, uint64_t val,
>> static const MemoryRegionOps acpi_pm_evt_ops = {
>>     .read = acpi_pm_evt_read,
>>     .write = acpi_pm_evt_write,
>> -    .impl.min_access_size = 2,
>> +    .impl.min_access_size = 1,
>>     .valid.min_access_size = 1,
>>     .valid.max_access_size = 2,
>>     .endianness = DEVICE_LITTLE_ENDIAN,
>> 
>> 
>> This assumes that the bus is little-endian, i.e. reading the byte at PM_EVT 
>> returns
>> bits 0..7 and reading the byte at PM_EVT+1 returns bits 8..15.
>> 
>> If this is incorrect, endianness needs to be changed as well.
>> 
>> Paolo
>> 
>> 
>


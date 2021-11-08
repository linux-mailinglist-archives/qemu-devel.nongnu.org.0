Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF95F44981A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 16:24:01 +0100 (CET)
Received: from localhost ([::1]:47976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk6V6-0005dm-LA
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 10:24:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mk6TY-0003wp-3J
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:22:24 -0500
Received: from [2001:738:2001:2001::2001] (port=57757 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mk6TU-0006TR-Ch
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:22:23 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8855F7475FA;
 Mon,  8 Nov 2021 16:22:17 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 658737463B7; Mon,  8 Nov 2021 16:22:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 644247462D3;
 Mon,  8 Nov 2021 16:22:17 +0100 (CET)
Date: Mon, 8 Nov 2021 16:22:17 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
In-Reply-To: <20211108083200-mutt-send-email-mst@kernel.org>
Message-ID: <d8ea41b-bae1-616f-b348-30eb2b9b72e5@eik.bme.hu>
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
 <20211108083200-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Nov 2021, Michael S. Tsirkin wrote:
> On Mon, Nov 08, 2021 at 02:05:42PM +0100, BALATON Zoltan wrote:
>> When using ACPI on big endian machine (such as ppc/pegasos2 which has
>> a VT8231 south bridge with ACPI) writes to ACPI registers come out
>> byte swapped. This may be caused by a bug in memory subsystem but
>> until that is fixed setting the ACPI memory regions to native endian
>> makes it usable for big endian machines. This fixes ACPI shutdown with
>> pegasos2 when using the board firmware for now.
>> This could be reverted when the memory layer is fixed.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>
>
> Paolo, could you weight in on whether we can fix it properly
> in the memory core? I suspect it's not a good idea to switch
> to native without adding a bunch of byteswaps all
> over the place ...

In fact I think switching to native is less likely to break anything else 
than fixing it in the memory core because AFAIK NATIVE_ENDIAN means no 
byte swap at all while LITTLE_ENDIAN means byte swap if vcpu is big endian 
so this would only change the pegasos2 case as other ACPI users are little 
endian machines where this change has no effect. You may want to consider 
this when trying a last minute fix but I'm OK with whatever solution that 
fixes the original problem.

Regards,
BALATON Zoltan

>> ---
>>  hw/acpi/core.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
>> index 1e004d0078..543e4a7875 100644
>> --- a/hw/acpi/core.c
>> +++ b/hw/acpi/core.c
>> @@ -461,7 +461,7 @@ static const MemoryRegionOps acpi_pm_evt_ops = {
>>      .impl.min_access_size = 2,
>>      .valid.min_access_size = 1,
>>      .valid.max_access_size = 2,
>> -    .endianness = DEVICE_LITTLE_ENDIAN,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>>  };
>>
>>  void acpi_pm1_evt_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
>> @@ -531,7 +531,7 @@ static const MemoryRegionOps acpi_pm_tmr_ops = {
>>      .impl.min_access_size = 4,
>>      .valid.min_access_size = 1,
>>      .valid.max_access_size = 4,
>> -    .endianness = DEVICE_LITTLE_ENDIAN,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>>  };
>>
>>  void acpi_pm_tmr_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
>> @@ -608,7 +608,7 @@ static const MemoryRegionOps acpi_pm_cnt_ops = {
>>      .impl.min_access_size = 2,
>>      .valid.min_access_size = 1,
>>      .valid.max_access_size = 2,
>> -    .endianness = DEVICE_LITTLE_ENDIAN,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>>  };
>>
>>  void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
>> --
>> 2.30.2
>
>


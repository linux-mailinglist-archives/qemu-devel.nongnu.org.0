Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D22B443055
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:24:43 +0100 (CET)
Received: from localhost ([::1]:60068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuiQ-0004sf-IL
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mhuP7-0000mM-F5
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:04:51 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:50832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mhuP1-0002kw-Dc
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:04:43 -0400
Received: from [IPV6:2a01:cb16:2036:6b82:ab3b:b2e8:37cb:ab58]
 (pop.92-184-102-40.mobile.abo.orange.fr [92.184.102.40])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 639E820780;
 Tue,  2 Nov 2021 14:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1635861874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FvuEyZu9fJT8Q2muqZeylFlm/x8KroGmwPb3UnHtOFQ=;
 b=kJg56vYEpENY78GUBje2PgIDWme7hfr7av9F/ze1ayZY5elbgnCcf0Ea1erNn/ZUJHeSP9
 dirxEtP606po+DV6S4lXfegzvd19Of+abZwqdIeHFyX9Nygz9Igc7CYh7uUeaARRYAJkSa
 TljJfIE2JNEZxA40jjvjw6oqBlGFqvM=
Message-ID: <090eac13-0b75-8b7f-d90c-8d1bcd8981a5@greensocs.com>
Date: Tue, 2 Nov 2021 15:04:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2] generic-loader: check that binary file target location
 exists
Content-Language: en-US-large
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211026140311.158151-1-damien.hedde@greensocs.com>
 <CAFEAcA_SbBqvPdEsqCVoKGOqwL_a26xn0b6nuniqOA3+Fi3Ezg@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <CAFEAcA_SbBqvPdEsqCVoKGOqwL_a26xn0b6nuniqOA3+Fi3Ezg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/1/21 11:53, Peter Maydell wrote:
> On Tue, 26 Oct 2021 at 15:11, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>> When loading a binary file, we only check if it is smaller than the
>> ram_size. It does not really check if the file will be loaded at an
>> existing location (if there is nothing at the target address, it will
>> "fail" silently later). It prevents loading a binary blob bigger than
>> ram_size too even if the target location is big enough.
>>
>> Replace this check by looking for the target memory region size and
>> prevent loading a bigger file than the available space.
>>
>> Get rid of "hw/boards.h" include, since we needed it only to access
>> `current_machine`.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>>
>> Hi,
>>
>> This is an updated version implementing what we discussed in v1.
>>
>> This can be tested easily, eg, using opentitan machine which has a 64K ram
>> located at 0x10000000.
>>
>> the following works (we a blob corresponding to the whole ram)
>> | $ dd bs=1K count=64 if=/dev/zero of=blob.bin
>> | $ qemu-system-riscv32 -display none -M opentitan -device loader,addr=0x10000000,file=blob.bin
>>
>> but this command fails because we load a blob which is too big
>> | $ dd bs=1K count=64 if=/dev/zero of=blob.bin
>> | $ qemu-system-riscv32 -display none -M opentitan -device loader,addr=0x10001000,file=blob.bin
>> | qemu-system-riscv32: -device loader,addr=0x10001000,file=blob.bin: Cannot load specified image blob.bin
>>
>> and this command fails too (we load a blob at an unmapped location)
>> | $ dd bs=1K count=64 if=/dev/zero of=blob.bin
>> | $ qemu-system-riscv32 -display none -M opentitan -device loader,addr=0x0,file=blob.bin
>> | qemu-system-riscv32: -device loader,addr=0x0,file=blob.bin: Address 0x0 does not exists
>>
>> Thanks,
>> Damien
>>
>> v2:
>>   + instead of disabling the ram_size check, look for the target
>>
>> v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg01077.html
>>
>> See also the original discussion about generic-loader:
>> https://lists.gnu.org/archive/html/qemu-devel/2016-02/msg04668.html
>> https://lists.gnu.org/archive/html/qemu-devel/2016-02/msg04681.html
>> ---
>>   hw/core/generic-loader.c | 20 +++++++++++++++++---
>>   1 file changed, 17 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
>> index d14f932eea..88d3f9fd56 100644
>> --- a/hw/core/generic-loader.c
>> +++ b/hw/core/generic-loader.c
>> @@ -34,7 +34,6 @@
>>   #include "hw/core/cpu.h"
>>   #include "sysemu/dma.h"
>>   #include "sysemu/reset.h"
>> -#include "hw/boards.h"
>>   #include "hw/loader.h"
>>   #include "hw/qdev-properties.h"
>>   #include "qapi/error.h"
>> @@ -153,8 +152,23 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
>>           }
>>
>>           if (size < 0 || s->force_raw) {
>> -            /* Default to the maximum size being the machine's ram size */
>> -            size = load_image_targphys_as(s->file, s->addr, current_machine->ram_size, as);
>> +            MemoryRegion *root = as ? as->root : get_system_memory();
>> +            MemoryRegionSection mrs;
>> +            uint64_t avail = 0;
>> +
>> +            mrs = memory_region_find(root, s->addr, 1);
>> +
>> +            if (mrs.mr) {
>> +                avail = int128_get64(mrs.mr->size) - mrs.offset_within_region;
>> +                memory_region_unref(mrs.mr);
>> +            } else {
>> +                error_setg(errp, "Address 0x%" PRIx64 " does not exists",
>> +                           s->addr);
>> +                return;
>> +            }
> 
> Won't this break the case of loading a file that spans two
> consecutive-but-different memory regions ?

yes. I did not thought about that.

>                                            I think if we want
> to catch "we tried to load something to an address not backed
> by something" we should do that by making load_image_targetphys_as()
> correctly handle errors from the memory accesses it makes and
> propagate an error-return to the caller.
>

The problem is that load_image_targetphys_as() just uses rom_load_...(). 
And these macros/functions only put some "rom to load" objects in a list 
without doing any real accesses.

The list is checked after against overlapping between "rom to load" objects.
But the real writing is done during reset, and any bad access is 
silently ignored.

In consequence:
+ it is possible for the memory structure to be populated (or even 
changed) between rom_load..() calls and real writing.
+ we ignore missing parts

I do not know if we make an actual use of these "features".

I'm not sure what will be the best course of action here in order to do 
the checks in rom_load_...().

Thanks,
Damien


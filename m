Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5D53BB842
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 09:53:31 +0200 (CEST)
Received: from localhost ([::1]:38064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0JQ2-0005GQ-Cx
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 03:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0JOs-0004a6-NE
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 03:52:18 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42306
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0JOp-0003ap-Eb
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 03:52:18 -0400
Received: from host86-179-59-238.range86-179.btcentralplus.com
 ([86.179.59.238] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0JOT-0009Im-5T; Mon, 05 Jul 2021 08:51:57 +0100
To: Finn Thain <fthain@linux-m68k.org>
References: <20210704152739.18213-1-mark.cave-ayland@ilande.co.uk>
 <4f4d1643-85f7-fbbc-3a22-fff086362c32@linux-m68k.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <cf9f6c26-473a-20ed-bf0d-bac63114c60f@ilande.co.uk>
Date: Mon, 5 Jul 2021 08:52:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4f4d1643-85f7-fbbc-3a22-fff086362c32@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.59.238
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3] dp8393x: don't force 32-bit register access
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: laurent@vivier.eu, jasowang@redhat.com, f4bug@amsat.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/2021 02:44, Finn Thain wrote:

> On Sun, 4 Jul 2021, Mark Cave-Ayland wrote:
> 
>> Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" assumed that all accesses
>> to the registers were 32-bit
> 
> As I said, that assumption was not made there.
> 
> If commit 3fe9a838ec is deficient it is probably because I am unaware of
> the ability of the QEMU memory API to accomplish the desired result.
> 
> That's not to say that the API can't do it, just that I don't know enough
> about the API.
> 
>> but this is actually not the case. The access size is determined by the
>> CPU instruction used and not the number of physical address lines.
>>
> 
> Again, that is an over-simplification. To explain: in Apple hardware at
> least, the access size that the SONIC chip sees is a consequence of bus
> sizing logic that is not part of the CPU and is not part of the SONIC chip
> either.
> 
> AIUI, this logic is what Philippe alluded to when he said about this
> patch, "This sounds to me like the 'QEMU doesn't model busses so we end
> using kludge to hide bugs' pattern".

Sure I understand this, and some of the interesting logic Apple has for decoding 
memory accesses. However the MacOS toolbox ROM works fine with this change combining 
the 2 separate accesses, and it is the jazzsonic driver accesses which are failing 
and need to be understood.

>> The big_endian workaround applied to the register read/writes was actually caused
>> by forcing the access size to 32-bit when the guest OS was using a 16-bit access.
>> Since the registers are 16-bit then we can simply set .impl.min_access and
>> .impl.max_accessto 2 and then the memory API will automatically do the right thing
>> for both 16-bit accesses used by Linux and 32-bit accesses used by the MacOS toolbox
>> ROM.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Fixes: 3fe9a838ec ("dp8393x: Always use 32-bit accesses")
> 
> There is a 'fixes' tag here but it's unclear what bug is being fixed. I
> think this commit log entry would be more helpful if it mentioned the bug
> that was observed.
> 
>> ---
>>   hw/net/dp8393x.c | 9 ++++-----
>>   1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
>> index 11810c9b60..d16ade2b19 100644
>> --- a/hw/net/dp8393x.c
>> +++ b/hw/net/dp8393x.c
>> @@ -602,15 +602,14 @@ static uint64_t dp8393x_read(void *opaque, hwaddr addr, unsigned int size)
>>   
>>       trace_dp8393x_read(reg, reg_names[reg], val, size);
>>   
>> -    return s->big_endian ? val << 16 : val;
>> +    return val;
>>   }
>>   
>> -static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
>> +static void dp8393x_write(void *opaque, hwaddr addr, uint64_t val,
>>                             unsigned int size)
>>   {
>>       dp8393xState *s = opaque;
>>       int reg = addr >> s->it_shift;
>> -    uint32_t val = s->big_endian ? data >> 16 : data;
>>   
>>       trace_dp8393x_write(reg, reg_names[reg], val, size);
>>   
>> @@ -694,8 +693,8 @@ static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
>>   static const MemoryRegionOps dp8393x_ops = {
>>       .read = dp8393x_read,
>>       .write = dp8393x_write,
>> -    .impl.min_access_size = 4,
>> -    .impl.max_access_size = 4,
>> +    .impl.min_access_size = 2,
>> +    .impl.max_access_size = 2,
>>       .endianness = DEVICE_NATIVE_ENDIAN,
>>   };
>>   
>>
> 
> Again, this patch breaks my Linux/mipsel guest. Perhaps you did not
> receive my message about that regression? It did make it into the list
> archives...
> https://lore.kernel.org/qemu-devel/20210703141947.352295-1-f4bug@amsat.org/T/#m8ef6d91fd8e38b01e375083058902342970b8833

I did see this, but as per my follow up message I wanted to make sure that everyone 
was using the same patches first as you needed a combination of an in-flight PR plus 
the correct versions of all the patches from over the weekend.

Looking at the jazzsonic code I see the SONIC_READ() macro at 
https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/natsemi/jazzsonic.c#L56 
is using a pointer to an unsigned int. Is an unsigned int 4 bytes on mips64el? If so 
the proposed change would return 2 registers in the same 4-byte result which is what 
is likely to be confusing the driver.

I think the problem is because of the interaction of .impl.max_access_size = 2 and 
the it_shift property specifying a stride of 4 bytes: when the 4 byte access is split 
into 2 x 2 byte accesses then for a read reg = addr >> s->it_shift causes the second 
access to be a duplicate of the first rather than containing zeros.

Again if you can provide a link to your existing vmlinux and busybox rootfs then I 
should be able to get to the bottom of this fairly quickly.


ATB,

Mark.


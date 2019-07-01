Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1375D185DB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 09:16:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49549 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOdIX-0004L4-9G
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 03:16:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhengxiang9@huawei.com>) id 1hOdHF-0003wR-71
	for qemu-devel@nongnu.org; Thu, 09 May 2019 03:15:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhengxiang9@huawei.com>) id 1hOdHD-000696-Vm
	for qemu-devel@nongnu.org; Thu, 09 May 2019 03:15:37 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:60916 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
	id 1hOdH8-0005tg-Ku; Thu, 09 May 2019 03:15:32 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 68786D0EF132576A9E3C;
	Thu,  9 May 2019 15:15:16 +0800 (CST)
Received: from [127.0.0.1] (10.177.29.32) by DGGEMS404-HUB.china.huawei.com
	(10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Thu, 9 May 2019
	15:15:09 +0800
To: Markus Armbruster <armbru@redhat.com>, Laszlo Ersek <lersek@redhat.com>
References: <20190505070059.4664-1-zhengxiang9@huawei.com>
	<87a7fyb0v7.fsf@dusky.pond.sub.org>
	<72adbed8-f650-42df-98d5-e98154baec08@redhat.com>
	<87h8a513sl.fsf@dusky.pond.sub.org>
From: Xiang Zheng <zhengxiang9@huawei.com>
Message-ID: <fb04cdb2-910d-58be-fb21-db7050cdc669@huawei.com>
Date: Thu, 9 May 2019 15:14:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101
	Thunderbird/64.0
MIME-Version: 1.0
In-Reply-To: <87h8a513sl.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.29.32]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: Re: [Qemu-devel] [PATCH] pflash: Only read non-zero parts of
 backend image
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-block@nongnu.org,
	ard.biesheuvel@linaro.org, qemu-devel@nongnu.org,
	mreitz@redhat.com, stefanha@redhat.com, guoheyi@huawei.com,
	wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2019/5/8 21:20, Markus Armbruster wrote:
> Laszlo Ersek <lersek@redhat.com> writes:
> 
>> Hi Markus,
>>
>> On 05/07/19 20:01, Markus Armbruster wrote:
>>> The subject is slightly misleading.  Holes read as zero.  So do
>>> non-holes full of zeroes.  The patch avoids reading the former, but
>>> still reads the latter.
>>>
>>> Xiang Zheng <zhengxiang9@huawei.com> writes:
>>>
>>>> Currently we fill the memory space with two 64MB NOR images when
>>>> using persistent UEFI variables on virt board. Actually we only use
>>>> a very small(non-zero) part of the memory while the rest significant
>>>> large(zero) part of memory is wasted.
>>>
>>> Neglects to mention that the "virt board" is ARM.
>>>
>>>> So this patch checks the block status and only writes the non-zero part
>>>> into memory. This requires pflash devices to use sparse files for
>>>> backends.
>>>
>>> I started to draft an improved commit message, but then I realized this
>>> patch can't work.
>>>
>>> The pflash_cfi01 device allocates its device memory like this:
>>>
>>>     memory_region_init_rom_device(
>>>         &pfl->mem, OBJECT(dev),
>>>         &pflash_cfi01_ops,
>>>         pfl,
>>>         pfl->name, total_len, &local_err);
>>>
>>> pflash_cfi02 is similar.
>>>
>>> memory_region_init_rom_device() calls
>>> memory_region_init_rom_device_nomigrate() calls qemu_ram_alloc() calls
>>> qemu_ram_alloc_internal() calls g_malloc0().  Thus, all the device
>>> memory gets written to even with this patch.
>>
>> As far as I can see, qemu_ram_alloc_internal() calls g_malloc0() only to
>> allocate the the new RAMBlock object called "new_block". The actual
>> guest RAM allocation occurs inside ram_block_add(), which is also called
>> by qemu_ram_alloc_internal().
> 
> You're right.  I should've read more attentively.
> 
>> One frame outwards the stack, qemu_ram_alloc() passes NULL to
>> qemu_ram_alloc_internal(), for the 4th ("host") parameter. Therefore, in
>> qemu_ram_alloc_internal(), we set "new_block->host" to NULL as well.
>>
>> Then in ram_block_add(), we take the (!new_block->host) branch, and call
>> phys_mem_alloc().
>>
>> Unfortunately, "phys_mem_alloc" is a function pointer, set with
>> phys_mem_set_alloc(). The phys_mem_set_alloc() function is called from
>> "target/s390x/kvm.c" (setting the function pointer to
>> legacy_s390_alloc()), so it doesn't apply in this case. Therefore we end
>> up calling the default qemu_anon_ram_alloc() function, through the
>> funcptr. (I think anyway.)
>>
>> And qemu_anon_ram_alloc() boils down to mmap() + MAP_ANONYMOUS, in
>> qemu_ram_mmap(). (Even on PPC64 hosts, because qemu_anon_ram_alloc()
>> passes (-1) for "fd".)
>>
>> I may have missed something, of course -- I obviously didn't test it,
>> just speculated from the source.
> 
> Thanks for your sleuthing!
> 
>>> I'm afraid you neglected to test.
> 
> Accusation actually unsupported.  I apologize, and replace it by a
> question: have you observed the improvement you're trying to achieve,
> and if yes, how?
> 

Yes, we need to create sparse files as the backing images for pflash device.
To create sparse files like:

   dd of="QEMU_EFI-pflash.raw" if="/dev/zero" bs=1M seek=64 count=0
   dd of="QEMU_EFI-pflash.raw" if="QEMU_EFI.fd" conv=notrunc

   dd of="empty_VARS.fd" if="/dev/zero" bs=1M seek=64 count=0

Start a VM with below commandline:

    -drive file=/usr/share/edk2/aarch64/QEMU_EFI-pflash.raw,if=pflash,format=raw,unit=0,readonly=on\
    -drive file=/usr/share/edk2/aarch64/empty_VARS.fd,if=pflash,format=raw,unit=1 \

Then observe the memory usage of the qemu process (THP is on).

1) Without this patch:
# cat /proc/`pidof qemu-system-aarch64`/smaps | grep AnonHugePages: | grep -v ' 0 kB'
AnonHugePages:    706560 kB
AnonHugePages:      2048 kB
AnonHugePages:     65536 kB    // pflash memory device
AnonHugePages:     65536 kB    // pflash memory device
AnonHugePages:      2048 kB

# ps aux | grep qemu-system-aarch64
RSS: 879684

2) After applying this patch:
# cat /proc/`pidof qemu-system-aarch64`/smaps | grep AnonHugePages: | grep -v ' 0 kB'
AnonHugePages:    700416 kB
AnonHugePages:      2048 kB
AnonHugePages:      2048 kB    // pflash memory device
AnonHugePages:      2048 kB    // pflash memory device
AnonHugePages:      2048 kB

# ps aux | grep qemu-system-aarch64
RSS: 744380

Obviously, there are at least 100MiB memory saved for each guest.

-- 

Thanks,
Xiang




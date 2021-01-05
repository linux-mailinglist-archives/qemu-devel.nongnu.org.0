Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 975A52EAB5D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 14:04:15 +0100 (CET)
Received: from localhost ([::1]:35252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwm0U-00075F-89
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 08:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kwlzU-0006cg-I6
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 08:03:13 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56396
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kwlzP-0001Q2-KB
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 08:03:12 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kwlzO-0008Is-Pe; Tue, 05 Jan 2021 13:03:11 +0000
To: Bug 1906905 <1906905@bugs.launchpad.net>, qemu-devel@nongnu.org
References: <160714087524.10652.4920404623701840898.malonedeb@soybean.canonical.com>
 <20201205150903.3062711-1-f4bug@amsat.org>
 <b3ecd3ef-fe83-12a8-d59d-ec68c2351b9c@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <3318e970-e4cf-235a-1118-831c14b4709d@ilande.co.uk>
Date: Tue, 5 Jan 2021 13:02:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <b3ecd3ef-fe83-12a8-d59d-ec68c2351b9c@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [Bug 1906905] Re: [PATCH] hw/timer/slavio_timer: Allow 64-bit
 accesses
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/01/2021 11:06, Philippe Mathieu-Daudé wrote:

> ping?
> 
> On 12/5/20 4:09 PM, Philippe Mathieu-Daudé wrote:
>> Per the "NCR89C105 Chip Specification" referenced in the header:
>>
>>                    Chip-level Address Map
>>
>>    ------------------------------------------------------------------
>>    | 1D0 0000 ->   | Counter/Timers                        | W,D    |
>>    |   1DF FFFF    |                                       |        |
>>    ...
>>
>>    The address map indicated the allowed accesses at each address.
>>    [...] W indicates a word access, and D indicates a double-word
>>    access.
>>
>> The SLAVIO timer controller is implemented expecting 32-bit accesses.
>> Commit a3d12d073e1 restricted the memory accesses to 32-bit, while
>> the device allows 64-bit accesses.
>>
>> This was not an issue until commit 5d971f9e67 which reverted
>> ("memory: accept mismatching sizes in memory_region_access_valid").
>>
>> Fix by renaming .valid MemoryRegionOps as .impl, and add the valid
>> access range (W -> 4, D -> 8).
>>
>> Since commit 21786c7e598 ("memory: Log invalid memory accesses")
>> this class of bug can be quickly debugged displaying 'guest_errors'
>> accesses, as:
>>
>>    $ qemu-system-sparc -M SS-20 -m 256 -bios ss20_v2.25_rom -serial stdio -d guest_errors
>>
>>    Power-ON Reset
>>    Invalid access at addr 0x0, size 8, region 'timer-1', reason: invalid size (min:4 max:4)
>>
>>    $ qemu-system-sparc -M SS-20 -m 256 -bios ss20_v2.25_rom -monitor stdio -S
>>    (qemu) info mtree
>>    address-space: memory
>>      0000000000000000-ffffffffffffffff (prio 0, i/o): system
>>        ...
>>        0000000ff1300000-0000000ff130000f (prio 0, i/o): timer-1
>>               ^^^^^^^^^                                 ^^^^^^^
>>                     \ memory region base address and name /
>>
>>    (qemu) info qtree
>>    bus: main-system-bus
>>      dev: slavio_timer, id ""              <-- device type name
>>        gpio-out "sysbus-irq" 17
>>        num_cpus = 1 (0x1)
>>        mmio 0000000ff1310000/0000000000000014
>>        mmio 0000000ff1300000/0000000000000010 <--- base address
>>        mmio 0000000ff1301000/0000000000000010
>>        mmio 0000000ff1302000/0000000000000010
>>        ...
>>
>> Reported-by: Yap KV <yapkv@yahoo.com>
>> Buglink: https://bugs.launchpad.net/bugs/1906905
>> Fixes: a3d12d073e1 ("slavio_timer: convert to memory API")
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Cc: Benoit Canet <benoit.canet@gmail.com>
>> Cc: <1906905@bugs.launchpad.net>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/timer/slavio_timer.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
>> index 5b2d20cb6a5..03e33fc5926 100644
>> --- a/hw/timer/slavio_timer.c
>> +++ b/hw/timer/slavio_timer.c
>> @@ -331,6 +331,10 @@ static const MemoryRegionOps slavio_timer_mem_ops = {
>>       .write = slavio_timer_mem_writel,
>>       .endianness = DEVICE_NATIVE_ENDIAN,
>>       .valid = {
>> +        .min_access_size = 4,
>> +        .max_access_size = 8,
>> +    },
>> +    .impl = {
>>           .min_access_size = 4,
>>           .max_access_size = 4,
>>       },

Looks like I did queue this to my local qemu-sparc branch, but was waiting to see if 
there was feedback on the other outstanding SPARC patches before sending a PR. The 
patches are all fairly minor, however I would prefer an Ack for the outstanding LEON 
patchset first. I'll go chase that one up now.


ATB,

Mark.


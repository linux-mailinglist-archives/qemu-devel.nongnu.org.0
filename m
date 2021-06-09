Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB0F3A1236
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 13:18:39 +0200 (CEST)
Received: from localhost ([::1]:46034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqwEI-0000qI-HT
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 07:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lqwDB-0008SD-Ae
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 07:17:29 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35108
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lqwD5-0002cn-MY
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 07:17:29 -0400
Received: from host109-155-147-70.range109-155.btcentralplus.com
 ([109.155.147.70] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lqwCr-0005b0-IS; Wed, 09 Jun 2021 12:17:13 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20210609093528.9616-1-mark.cave-ayland@ilande.co.uk>
 <f5a00786-36ad-0346-942c-a6cfe1a7d0eb@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <5055ad59-3e50-8690-fd5b-aa6b6e7388bc@ilande.co.uk>
Date: Wed, 9 Jun 2021 12:17:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f5a00786-36ad-0346-942c-a6cfe1a7d0eb@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.155.147.70
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH] cputlb: implement load_helper_unaligned() for
 unaligned loads
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/2021 11:28, Philippe Mathieu-Daudé wrote:

> On 6/9/21 11:35 AM, Mark Cave-Ayland wrote:
>> [RFC because this is currently only lightly tested and there have been some
>> discussions about whether this should be handled elsewhere in the memory API]
>>
>> If an unaligned load is required then the load is split into 2 separate accesses
>> and combined together within load_helper(). This does not work correctly with
>> MMIO accesses because the original access size is used for both individual
>> accesses causing the little and big endian combine to return the wrong result.
>>
>> There is already a similar solution in place for store_helper() where an unaligned
>> access is handled by a separate store_helper_unaligned() function which instead
>> of using the original access size, uses a single-byte access size to shift and
>> combine the result correctly regardless of the orignal access size or endian.
>>
>> Implement a similar load_helper_unaligned() function which uses the same approach
>> for unaligned loads to return the correct result according to the original test
>> case.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/360
>> ---
>>   accel/tcg/cputlb.c | 99 ++++++++++++++++++++++++++++++++++++++--------
>>   1 file changed, 82 insertions(+), 17 deletions(-)
>>
>> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>> index f24348e979..1845929e99 100644
>> --- a/accel/tcg/cputlb.c
>> +++ b/accel/tcg/cputlb.c
>> @@ -1851,6 +1851,85 @@ load_memop(const void *haddr, MemOp op)
>>       }
>>   }
>>   
>> +static uint64_t __attribute__((noinline))
>> +load_helper_unaligned(CPUArchState *env, target_ulong addr, uintptr_t retaddr,
>> +                      size_t size, uintptr_t mmu_idx, bool code_read,
>> +                      bool big_endian)
>> +{
> ...
> 
>> +}
>> +
>>   static inline uint64_t QEMU_ALWAYS_INLINE
>>   load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
>>               uintptr_t retaddr, MemOp op, bool code_read,
>> @@ -1893,7 +1972,7 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
>>           CPUIOTLBEntry *iotlbentry;
>>           bool need_swap;
>>   
>> -        /* For anything that is unaligned, recurse through full_load.  */
>> +        /* For anything that is unaligned, recurse through byte loads.  */
>>           if ((addr & (size - 1)) != 0) {
>>               goto do_unaligned_access;
>>           }
>> @@ -1932,23 +2011,9 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
>>       if (size > 1
>>           && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
>>                       >= TARGET_PAGE_SIZE)) {
> 
> It would be easier to review extracting load_helper_unaligned() first.

Do you mean into a separate function? Since the function is recursive then I think 
you'd end up having to copy everything apart from the change that does all the work, 
which is the for() loop iterating over the full access a byte at a time. For the sake 
of the extra few lines I'm not sure it makes sense?

The equivalent commit for store_helper() is 6b8b622e87e "cputlb: Make store_helper 
less fragile to compiler optimizations" but that misses that its version of the 
unaligned access code which splits everything into single byte accesses was already 
present.

I'm also interested to know if the full_load parameter is still required for 
load_helper() - given that it is an RFC patch I've left it there for now, but it's 
likely this will need some thought too.


ATB,

Mark.


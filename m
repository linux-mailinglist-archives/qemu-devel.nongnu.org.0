Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5776A153235
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 14:48:24 +0100 (CET)
Received: from localhost ([::1]:47336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izL2V-0002it-E2
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 08:48:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48216)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuzenghui@huawei.com>) id 1izL1l-0002Hu-OV
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 08:47:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuzenghui@huawei.com>) id 1izL1k-0005bE-AD
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 08:47:37 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:45860 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yuzenghui@huawei.com>)
 id 1izL1Z-0005Ee-K3
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 08:47:26 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 626C7A696142E15EB358;
 Wed,  5 Feb 2020 21:47:16 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Wed, 5 Feb 2020
 21:47:08 +0800
Subject: Re: [PATCH] memory: Use QEMU_ALWAYS_INLINE to silence compile-time
 warning
To: Richard Henderson <richard.henderson@linaro.org>, <pbonzini@redhat.com>,
 <tony.nguyen@bt.com>
References: <20200205081703.631-1-yuzenghui@huawei.com>
 <9fe8ac60-52ec-6828-5ee3-5cd1141a8376@linaro.org>
 <d4c5fcd1-480e-d763-4a23-a4b145ace793@linaro.org>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <4921c341-0af5-013e-0bc2-7f3a1295a03f@huawei.com>
Date: Wed, 5 Feb 2020 21:47:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <d4c5fcd1-480e-d763-4a23-a4b145ace793@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: wanghaibin.wang@huawei.com, qemu-devel@nongnu.org,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 2020/2/5 18:31, Richard Henderson wrote:
> On 2/5/20 10:01 AM, Richard Henderson wrote:
>> On 2/5/20 8:17 AM, Zenghui Yu wrote:
>>> Our robot reported the following compile-time warning while compiling
>>> Qemu with -fno-inline cflags:
>>
>> Why are you doing this?

I'm not sure why it was added in the building test. As you said,
there's just a arbitrary combination of compile flags.

>>
>>>
>>> In function 'load_memop',
>>>      inlined from 'load_helper' at /qemu/accel/tcg/cputlb.c:1578:20,
>>>      inlined from 'full_ldub_mmu' at /qemu/accel/tcg/cputlb.c:1624:12:
>>> /qemu/accel/tcg/cputlb.c:1502:9: error: call to 'qemu_build_not_reached' declared with attribute error: code path is reachable
>>>           qemu_build_not_reached();
>>>           ^~~~~~~~~~~~~~~~~~~~~~~~
>>>      [...]
>>
>> Of course, the assert is compiled out when optimization is off, which is the
>> only time we expect inlining to be off.
>>
>> The patch isn't wrong, exactly, but I question whether we want to support
>> completely arbitrary combinations of compile flags.

It doesn't hurt to do the right thing, and you already have the
good approach :)

> 
> To follow up: if you *really* need to support -fno-inline, then perhaps the
> correct patch is to change
> 
> - #ifdef __OPTIMIZE__
> + #if defined(__OPTIMIZE__) && !defined(__NO_INLINE__)
>    extern void QEMU_NORETURN QEMU_ERROR("code path is reachable")
>        qemu_build_not_reached(void);
>    #else
>    #define qemu_build_not_reached()  g_assert_not_reached()
>    #endif
> 
> within include/qemu/compiler.h.

Thanks for this. I've tested it with -fno-inlie and it indeed works.
I will send it as v2.


Thanks,
Zenghui



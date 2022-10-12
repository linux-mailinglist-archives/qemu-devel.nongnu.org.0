Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560DE5FC080
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 08:18:22 +0200 (CEST)
Received: from localhost ([::1]:49262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiV4O-0007Ms-T7
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 02:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oiUrI-00072R-AE; Wed, 12 Oct 2022 02:04:51 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:34840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oiUr5-0007NK-2U; Wed, 12 Oct 2022 02:04:37 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VS-WcGO_1665554666; 
Received: from 30.221.98.87(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VS-WcGO_1665554666) by smtp.aliyun-inc.com;
 Wed, 12 Oct 2022 14:04:27 +0800
Message-ID: <582d408f-fe54-8954-854d-d3d46d2247d6@linux.alibaba.com>
Date: Wed, 12 Oct 2022 14:04:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] target/riscv: pmp: Fixup TLB size calculation
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, bmeng.cn@gmail.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, richard.henderson@linaro.org
References: <20221012011449.506928-1-alistair.francis@opensource.wdc.com>
 <8ac0e17f-b902-6553-acdb-6ec0c4bfafab@linux.alibaba.com>
 <CAKmqyKOCXPCK7U5ro09X4sw68YeEbprUH193VZL-traezH+nBg@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <CAKmqyKOCXPCK7U5ro09X4sw68YeEbprUH193VZL-traezH+nBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.131;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-131.freemail.mail.aliyun.com
X-Spam_score_int: -127
X-Spam_score: -12.8
X-Spam_bar: ------------
X-Spam_report: (-12.8 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/10/12 11:09, Alistair Francis wrote:
> On Wed, Oct 12, 2022 at 12:50 PM LIU Zhiwei
> <zhiwei_liu@linux.alibaba.com> wrote:
>> Reviewed-by: LIU Zhiwei<zhiwei_liu@linux.alibaba.com>
> Thanks!
>
>> By the way, we missed one related patch that once had been picked to riscv-next patch.
>>
>> The patch v3:
>> https://lore.kernel.org/all/ceeb4037-6d17-0a09-f35a-eaf3280339bb@c-sky.com/T/#m183e4430bda408bc3a2b2751aa94eff7fc02e23c
> So this was applied but caused boot failures so it was dropped from my
> RISC-V tree
>
>> The patch v4:
>> https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg02854.html
> I think I misunderstood this comment [1] as applying to v4 and it
> never got applied.
>
> Do you mind resending the patch?

Sure. I have  rebased it to your patch and sent it to the mail list.

Thanks,
Zhiwei

>
> 1: https://lore.kernel.org/all/ceeb4037-6d17-0a09-f35a-eaf3280339bb@c-sky.com/T/#m5e958d702d9905169a941f2ae59fdf7ac4a02383
>
> Alistair
>
>> I think the patch v4 should be taken at the same time with this patch.
>>
>> Thanks,
>> Zhiwei
>>
>> On 2022/10/12 9:14, Alistair Francis wrote:
>>> From: Alistair Francis <alistair.francis@wdc.com>
>>>
>>> Since commit 4047368938f6 "accel/tcg: Introduce tlb_set_page_full" we
>>> have been seeing this assert
>>>
>>>       ../accel/tcg/cputlb.c:1294: tlb_set_page_with_attrs: Assertion `is_power_of_2(size)' failed.
>>>
>>> When running Tock on the OpenTitan machine.
>>>
>>> The issue is that pmp_get_tlb_size() would return a TLB size that wasn't
>>> a power of 2. The size was also smaller then TARGET_PAGE_SIZE.
>>>
>>> This patch ensures that any TLB size less then TARGET_PAGE_SIZE is
>>> rounded down to 1 to ensure it's a valid size.
>>>
>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>> ---
>>> This is based on advice from Richard:
>>> https://patchwork.kernel.org/project/qemu-devel/patch/20221004141051.110653-9-richard.henderson@linaro.org/#25043166
>>>
>>>    target/riscv/pmp.c | 12 ++++++++++++
>>>    1 file changed, 12 insertions(+)
>>>
>>> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
>>> index ea2b67d947..2b43e399b8 100644
>>> --- a/target/riscv/pmp.c
>>> +++ b/target/riscv/pmp.c
>>> @@ -628,6 +628,18 @@ bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
>>>        }
>>>
>>>        if (*tlb_size != 0) {
>>> +        /*
>>> +         * At this point we have a tlb_size that is the smallest possible size
>>> +         * That fits within a TARGET_PAGE_SIZE and the PMP region.
>>> +         *
>>> +         * If the size is less then TARGET_PAGE_SIZE we drop the size to 1.
>>> +         * This means the result isn't cached in the TLB and is only used for
>>> +         * a single translation.
>>> +         */
>>> +        if (*tlb_size < TARGET_PAGE_SIZE) {
>>> +            *tlb_size = 1;
>>> +        }
>>> +
>>>            return true;
>>>        }
>>>


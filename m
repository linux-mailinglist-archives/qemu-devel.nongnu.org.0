Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F62060749D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:03:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olosc-0003mO-Fb
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:03:56 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloKl-0000aZ-TQ
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oloKW-0007ut-C6
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:28:40 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oloKE-0005bJ-SP
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:28:39 -0400
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8BxfdowZlJjeGMBAA--.6478S3;
 Fri, 21 Oct 2022 17:28:16 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxHuIuZlJjBqUCAA--.10832S3; 
 Fri, 21 Oct 2022 17:28:14 +0800 (CST)
Subject: Re: [PATCH v8 2/2] hw/intc: Fix LoongArch extioi coreisr accessing
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 f4bug@amsat.org
References: <20221021015307.2570844-1-yangxiaojuan@loongson.cn>
 <20221021015307.2570844-3-yangxiaojuan@loongson.cn>
 <9e356cfc-5532-2ef5-8356-fdde1033d398@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <62be3d21-3122-d5f4-4a39-c63330fb57c0@loongson.cn>
Date: Fri, 21 Oct 2022 17:28:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9e356cfc-5532-2ef5-8356-fdde1033d398@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8BxHuIuZlJjBqUCAA--.10832S3
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxZr48GFy7Xw1UCF1xWw4xXrb_yoW5KFWrpr
 48Gry5KryUJr4fJr4UJ3WUJry5Xw1UXw17Xr1FqFy8Ar4DJr1jgr10qryvgFyUXw48Ar1U
 tr17Jr17ZF1UtwUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j1YL9UUUUU=
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


在 2022/10/21 下午5:11, Philippe Mathieu-Daudé 写道:
> On 21/10/22 03:53, Xiaojuan Yang wrote:
>> 1. When cpu read or write extioi COREISR reg, it should access
>> the reg belonged to itself, so the cpu index of 's->coreisr'
>> is current cpu number. Using MemTxAttrs' requester_id to get
>> the cpu index.
>> 2. it need not to mask 0x1f when calculate the coreisr array index.
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> ---
>>   hw/intc/loongarch_extioi.c      | 10 ++++++----
>>   target/loongarch/iocsr_helper.c | 19 +++++++++++--------
>>   2 files changed, 17 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
>> index 72f4b0cde5..4b8ec3f28a 100644
>> --- a/hw/intc/loongarch_extioi.c
>> +++ b/hw/intc/loongarch_extioi.c
>> @@ -93,8 +93,9 @@ static MemTxResult extioi_readw(void *opaque, 
>> hwaddr addr, uint64_t *data,
>>           *data = s->bounce[index];
>>           break;
>>       case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
>> -        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
>> -        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
>> +        index = (offset - EXTIOI_COREISR_START) >> 2;
>> +        /* using attrs to get current cpu index */
>> +        cpu = attrs.requester_id;
>>           *data = s->coreisr[cpu][index];
>>           break;
>>       case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
>> @@ -185,8 +186,9 @@ static MemTxResult extioi_writew(void *opaque, 
>> hwaddr addr,
>>           s->bounce[index] = val;
>>           break;
>>       case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
>> -        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
>> -        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
>> +        index = (offset - EXTIOI_COREISR_START) >> 2;
>> +        /* using attrs to get current cpu index */
>> +        cpu = attrs.requester_id;
>>           old_data = s->coreisr[cpu][index];
>>           s->coreisr[cpu][index] = old_data & ~val;
>>           /* write 1 to clear interrrupt */
>> diff --git a/target/loongarch/iocsr_helper.c 
>> b/target/loongarch/iocsr_helper.c
>> index 0e9c537dc7..505853e17b 100644
>> --- a/target/loongarch/iocsr_helper.c
>> +++ b/target/loongarch/iocsr_helper.c
>> @@ -14,54 +14,57 @@
>>   #include "exec/cpu_ldst.h"
>>   #include "tcg/tcg-ldst.h"
>>   +#define GET_MEMTXATTRS(cas) \
>> +        ((MemTxAttrs){.requester_id = env_cpu(cas)->cpu_index})
>
> The suggestion from v7 is incomplete, I apologize for missing it.
>
> #define GET_MEMTXATTRS(cas) ((MemTxAttrs) {\
>                                .requester_type = MTRT_CPU,\
>                                .requester_id = env_cpu(cas)->cpu_index,\
>                             })
>
> Also see from v6, add in the read/write handlers:
>
>             assert(attrs.requester_type == MTRT_CPU);
>
> https://lore.kernel.org/qemu-devel/f7c4f7ca-cbf9-87d6-4d8c-5957c36ae23c@linaro.org/ 
>
>
hi,
we do not based on the 'MemTxAttrs requester_type patch' so far, and 
when that
patch merged we will apply it quickly.

Thanks.
Xiaojuan.



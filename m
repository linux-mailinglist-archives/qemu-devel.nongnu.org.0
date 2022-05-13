Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AEC525DC9
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 10:48:35 +0200 (CEST)
Received: from localhost ([::1]:53254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npQyQ-0006je-S0
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 04:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1npQrk-000116-UH
 for qemu-devel@nongnu.org; Fri, 13 May 2022 04:41:41 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35488 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1npQrh-0003fo-2M
 for qemu-devel@nongnu.org; Fri, 13 May 2022 04:41:40 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxOti4GX5iwRUUAA--.11704S3; 
 Fri, 13 May 2022 16:41:28 +0800 (CST)
Subject: Re: [PATCH v3 34/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
To: maobibo <maobibo@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-35-yangxiaojuan@loongson.cn>
 <c6b58ba0-38c4-6542-86d1-eb1f14a12121@linaro.org>
 <707db6c2-49f2-2ca2-7025-0cf401f11c60@loongson.cn>
 <e514e333-b458-517f-66f7-f3fd0a0c5bad@linaro.org>
 <b0fd3277-8abd-b6fc-bf1f-a083a3b04337@loongson.cn>
 <1c64c465-542e-d04e-4e50-ce2836453e67@linaro.org>
 <0fef5bfe-651c-c98f-c13e-60377a8c43d7@loongson.cn>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <396cd6d7-df7b-2d9d-17cf-8c4999a2efea@loongson.cn>
Date: Fri, 13 May 2022 16:41:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0fef5bfe-651c-c98f-c13e-60377a8c43d7@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9AxOti4GX5iwRUUAA--.11704S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ur13ArWkJr4UGFWfGrW7Jwb_yoW8tw47pr
 W8Cas09r4DK3y09rnFqw1jyr9Fyry5Jay3uw1kXa45Arn0gryjgr4IgFWUWF1rGrWft34U
 XF4Fvw1xuas0v3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
 026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
 JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
 vEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2
 jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
 ZFpf9x0JUZa9-UUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 2022/5/12 上午9:58, maobibo wrote:
>
> 在 2022/5/11 22:14, Richard Henderson 写道:
>> On 5/11/22 02:54, yangxiaojuan wrote:
>>> On 2022/5/10 上午1:56, Richard Henderson wrote:
>>>>>>> +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
>>>>>>> +        index = (offset - EXTIOI_IPMAP_START) >> 2;
>>>>>>> +        s->ipmap[index] = val;
>>>>>>> +        break;
>>>>>> Do you need to recompute the entire interrupt map when ipmap changes?
>>>>>>
>>>>> Sorry, could you explain it in more detail? i can not understand the meanning of 'the entire interrupt map'?
>>>> I mean, ipmap[*] and coremap[*] controls how isr[*] maps to the various cpus, as coreisr[*].  If either ipmap or coremap changes, do you need to re-compute coreisr[*] from the input isr[*]?
>>> I think the interrupt has been handled by the core before set coremap or ipmap, and coreisr[*] also has been set and cleard by original core.
>>> So,  the new mapped core need not  to update the coreisr[*].
>>
>> Why do you believe that the core to which the interrupt is directed has interrupts enabled?  Why do you believe the core to which the interrupt is directed is the one that is changing the interrupt mapping?
I think there is no interrupt enable registers of percpu in extioi 
device. So, i think we need not to consider the core to which the 
interrupt is directed if has interrupts enabled.
If the core to which the interrupt is directed is diffrent from the core 
that is changing the mapping, Should we copy the status value of 
coreisr[old_core][irq_num] to coreisr[new_core][irq_num]?
Ip mapping could not affect coreisr[cpu][irq_num], Should we still need 
to update the interrupt?

Thanks.
xiaojuan
> By my understanding, irq bit of coreisr will be set even if the interrupt is disabled on the core, interrupt has been posted to core already, only that it is not serviced by the core. After irq affinity is changed, new interrupt may arrived to new core, one interrupt will be serviced by old core and new core at the same time. However it is the problem of guest kernel, guest kernel system should disable the irq and wait until irq finishes to be serviced on the old core when irq affinity is changing.
>
>> I think your assumption is not correct.
>>
>>
>> r~



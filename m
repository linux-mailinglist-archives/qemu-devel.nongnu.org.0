Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C147524241
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 03:59:06 +0200 (CEST)
Received: from localhost ([::1]:36536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noy6a-0005n3-KL
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 21:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1noy5l-000567-Ce
 for qemu-devel@nongnu.org; Wed, 11 May 2022 21:58:13 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56338 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1noy5i-0008DN-Tl
 for qemu-devel@nongnu.org; Wed, 11 May 2022 21:58:13 -0400
Received: from [10.20.42.170] (unknown [10.20.42.170])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxENuoaXxigyASAA--.3659S3;
 Thu, 12 May 2022 09:58:01 +0800 (CST)
Message-ID: <0fef5bfe-651c-c98f-c13e-60377a8c43d7@loongson.cn>
Date: Thu, 12 May 2022 09:58:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 34/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-35-yangxiaojuan@loongson.cn>
 <c6b58ba0-38c4-6542-86d1-eb1f14a12121@linaro.org>
 <707db6c2-49f2-2ca2-7025-0cf401f11c60@loongson.cn>
 <e514e333-b458-517f-66f7-f3fd0a0c5bad@linaro.org>
 <b0fd3277-8abd-b6fc-bf1f-a083a3b04337@loongson.cn>
 <1c64c465-542e-d04e-4e50-ce2836453e67@linaro.org>
From: maobibo <maobibo@loongson.cn>
In-Reply-To: <1c64c465-542e-d04e-4e50-ce2836453e67@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxENuoaXxigyASAA--.3659S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AF17ZFyfXFWftw4Dtry8Grg_yoW8AF1Upr
 W8Cas0gr4DK34rKrnFqw1Iyr9Fy34rJay3uw1kXa45ArnIvr12gr12gFZ0gryrGrWIgw1U
 XF4Fvw1xua4qy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
 zVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
 1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
 14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
 IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvE
 x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
 UI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=loongson.cn
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



在 2022/5/11 22:14, Richard Henderson 写道:
> On 5/11/22 02:54, yangxiaojuan wrote:
>>
>> On 2022/5/10 上午1:56, Richard Henderson wrote:
>>>
>>>>>> +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
>>>>>> +        index = (offset - EXTIOI_IPMAP_START) >> 2;
>>>>>> +        s->ipmap[index] = val;
>>>>>> +        break;
>>>>>
>>>>> Do you need to recompute the entire interrupt map when ipmap changes?
>>>>>
>>>> Sorry, could you explain it in more detail? i can not understand the meanning of 'the entire interrupt map'?
>>>
>>> I mean, ipmap[*] and coremap[*] controls how isr[*] maps to the various cpus, as coreisr[*].  If either ipmap or coremap changes, do you need to re-compute coreisr[*] from the input isr[*]? 
>>
>> I think the interrupt has been handled by the core before set coremap or ipmap, and coreisr[*] also has been set and cleard by original core.
>> So,  the new mapped core need not  to update the coreisr[*].
> 
> 
> Why do you believe that the core to which the interrupt is directed has interrupts enabled?  Why do you believe the core to which the interrupt is directed is the one that is changing the interrupt mapping?
By my understanding, irq bit of coreisr will be set even if the interrupt is disabled on the core, interrupt has been posted to core already, only that it is not serviced by the core. After irq affinity is changed, new interrupt may arrived to new core, one interrupt will be serviced by old core and new core at the same time. However it is the problem of guest kernel, guest kernel system should disable the irq and wait until irq finishes to be serviced on the old core when irq affinity is changing.

> 
> I think your assumption is not correct.
> 
> 
> r~



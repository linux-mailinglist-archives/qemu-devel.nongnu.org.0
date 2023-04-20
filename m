Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDC36E9235
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 13:13:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppSE6-0007UB-93; Thu, 20 Apr 2023 07:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaotianrui@loongson.cn>)
 id 1ppSDv-0007Tw-4t
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 07:13:12 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhaotianrui@loongson.cn>) id 1ppSDr-0001Il-Pc
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 07:13:10 -0400
Received: from loongson.cn (unknown [10.20.42.120])
 by gateway (Coremail) with SMTP id _____8BxYU8+HkFkuHsfAA--.49496S3;
 Thu, 20 Apr 2023 19:13:03 +0800 (CST)
Received: from [10.20.42.120] (unknown [10.20.42.120])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxfbM9HkFkXQ0xAA--.909S3; 
 Thu, 20 Apr 2023 19:13:01 +0800 (CST)
Subject: Re: [PATCH RFC v1 09/10] target/loongarch: Add kvm-stub.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, gaosong@loongson.cn
References: <20230420093606.3366969-1-zhaotianrui@loongson.cn>
 <20230420093606.3366969-10-zhaotianrui@loongson.cn>
 <a315b56d-a331-5e85-ff55-4dca96088bb9@linaro.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, maobibo@loongson.cn
From: Tianrui Zhao <zhaotianrui@loongson.cn>
Message-ID: <e1869f8c-0aaa-1125-31b3-21fe43009fb3@loongson.cn>
Date: Thu, 20 Apr 2023 19:13:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <a315b56d-a331-5e85-ff55-4dca96088bb9@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxfbM9HkFkXQ0xAA--.909S3
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7urWxKF4kCw47XFyrJw48Xrb_yoW8ur45pF
 Z7uFs8Kr4xJrZrJ3WrZ3y5XF1DZrWSgr12va4aq34xCr4UXr18Xryvg39xWFW5C348Gr10
 vryFkw1YqF18J37anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bDAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AF
 wI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
 Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
 14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
 AE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
 c4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOeOJUUUUU=
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=zhaotianrui@loongson.cn; helo=loongson.cn
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.597,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



在 2023年04月20日 18:04, Philippe Mathieu-Daudé 写道:
> On 20/4/23 11:36, Tianrui Zhao wrote:
>> Add kvm-stub.c for loongarch, there are two stub functions:
>> kvm_loongarch_reset_vcpu and kvm_loongarch_set_interrupt.
>>
>> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
>> ---
>>   target/loongarch/kvm-stub.c      | 17 +++++++++++++++++
>>   target/loongarch/kvm_loongarch.h |  1 +
>>   2 files changed, 18 insertions(+)
>>   create mode 100644 target/loongarch/kvm-stub.c
>>
>> diff --git a/target/loongarch/kvm-stub.c b/target/loongarch/kvm-stub.c
>> new file mode 100644
>> index 0000000000..e28827ee07
>> --- /dev/null
>> +++ b/target/loongarch/kvm-stub.c
>> @@ -0,0 +1,17 @@
>> +/*
>> + * QEMU KVM LoongArch specific function stubs
>> + *
>> + * Copyright (c) 2023 Loongson Technology Corporation Limited
>> + */
>> +#include "qemu/osdep.h"
>> +#include "cpu.h"
>> +
>> +void kvm_loongarch_reset_vcpu(LoongArchCPU *cpu)
>
> Where is kvm_loongarch_reset_vcpu() called?
Thanks and nowhere called this function, I will remove it.

Thanks
Tianrui Zhao
>
>> +{
>> +    abort();
>> +}
>> +
>> +void kvm_loongarch_set_interrupt(LoongArchCPU *cpu, int irq, int level)
>> +{
>> +    abort();
>
> Please use g_assert_not_reached() which display more useful informations.
Thanks, I will use the g_assert_not_reached() to replace it.

Thanks
Tianrui Zhao
>
>> +}
>
> Add this stub in the previous patch "Implement set vcpu intr for kvm".
Thanks, I will move this stub function into previous patch "Implement 
set vcpu intr for kvm".

Thanks
Tianrui Zhao
>
>> diff --git a/target/loongarch/kvm_loongarch.h 
>> b/target/loongarch/kvm_loongarch.h
>> index cdef980eec..c03f4bef0f 100644
>> --- a/target/loongarch/kvm_loongarch.h
>> +++ b/target/loongarch/kvm_loongarch.h
>> @@ -8,6 +8,7 @@
>>   #ifndef QEMU_KVM_LOONGARCH_H
>>   #define QEMU_KVM_LOONGARCH_H
>>   +void kvm_loongarch_reset_vcpu(LoongArchCPU *cpu);
>>   int  kvm_loongarch_set_interrupt(LoongArchCPU *cpu, int irq, int 
>> level);
>>     #endif



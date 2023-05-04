Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787AF6F6314
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 05:00:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puPCA-0006cM-FF; Wed, 03 May 2023 22:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaotianrui@loongson.cn>)
 id 1puPC6-0006cE-PA
 for qemu-devel@nongnu.org; Wed, 03 May 2023 22:59:46 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhaotianrui@loongson.cn>) id 1puPC4-0007pk-5P
 for qemu-devel@nongnu.org; Wed, 03 May 2023 22:59:46 -0400
Received: from loongson.cn (unknown [10.20.42.120])
 by gateway (Coremail) with SMTP id _____8BxKuqbH1NkGmMEAA--.7165S3;
 Thu, 04 May 2023 10:59:40 +0800 (CST)
Received: from [10.20.42.120] (unknown [10.20.42.120])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxMMiYH1Nk6ShJAA--.4539S3; 
 Thu, 04 May 2023 10:59:36 +0800 (CST)
Subject: Re: [PATCH RFC v2 4/9] target/loongarch: Implement kvm get/set
 registers
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230427072645.3368102-1-zhaotianrui@loongson.cn>
 <20230427072645.3368102-5-zhaotianrui@loongson.cn>
 <f56a6f93-c3ae-5d61-f6ab-bb1eee265197@linaro.org>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 gaosong@loongson.cn, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, maobibo@loongson.cn, philmd@linaro.org,
 peter.maydell@linaro.org
From: Tianrui Zhao <zhaotianrui@loongson.cn>
Message-ID: <3be995d8-e6e3-431f-e047-6bb42887d643@loongson.cn>
Date: Thu, 4 May 2023 10:59:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <f56a6f93-c3ae-5d61-f6ab-bb1eee265197@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxMMiYH1Nk6ShJAA--.4539S3
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Kr43ZFW5Zr4kAw1DGryUWrg_yoW8tr15pF
 ykCF45Kr4xX39rCan3Xw1UXas8X3yxGr4DZa4ftw4SyF4YyrykJrykK39IkF17Ca4xGF10
 vFyYkF18Wa10yFDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 baAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 kF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
 MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
 AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
 80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
 43ZEXa7IU8fOz7UUUUU==
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=zhaotianrui@loongson.cn; helo=loongson.cn
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.28,
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



在 2023年05月02日 19:24, Richard Henderson 写道:
> On 4/27/23 08:26, Tianrui Zhao wrote:
>> Implement kvm_arch_get/set_registers interfaces, many regs
>> can be get/set in the function, such as core regs, csr regs,
>> fpu regs, mp state, etc.
>>
>> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
>> ---
>>   meson.build                   |   1 +
>>   target/loongarch/kvm.c        | 356 +++++++++++++++++++++++++++++++++-
>>   target/loongarch/trace-events |  11 ++
>>   target/loongarch/trace.h      |   1 +
>>   4 files changed, 367 insertions(+), 2 deletions(-)
>>   create mode 100644 target/loongarch/trace-events
>>   create mode 100644 target/loongarch/trace.h
>>
>> diff --git a/meson.build b/meson.build
>> index 29f8644d6d..b1b29299da 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -3039,6 +3039,7 @@ if have_system or have_user
>>       'target/s390x',
>>       'target/s390x/kvm',
>>       'target/sparc',
>> +    'target/loongarch',
>>     ]
>
> Sort before mips to keep alphabetic ordering.
Thanks, I will move it to the suitable place.

Thanks
Tianrui Zhao
>
>> +static int kvm_loongarch_get_regs_core(CPUState *cs)
>> +{
>> +    int ret = 0;
>> +    int i;
>> +    struct kvm_regs regs;
>> +    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
>> +    CPULoongArchState *env = &cpu->env;
>> +
>> +    /* Get the current register set as KVM seems it */
>> +    ret = kvm_vcpu_ioctl(cs, KVM_GET_REGS, &regs);
>> +    if (ret < 0) {
>> +        trace_kvm_failed_get_regs_core(strerror(errno));
>> +        return ret;
>> +    }
>> +
>> +    for (i = 0; i < 32; i++) {
>> +        env->gpr[i] = regs.gpr[i];
>
> For i = 1; register 0 is 0...
Thanks,  I will fix it.

Thanks
Tianrui Zhao
>
>> +static inline int kvm_larch_getq(CPUState *cs, uint64_t reg_id,
>> +                                 uint64_t *addr)
>> +{
>> +    struct kvm_one_reg csrreg = {
>> +        .id = reg_id,
>> +        .addr = (uintptr_t)addr
>> +    };
>> +
>> +    return kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &csrreg);
>> +}
>
> Drop inline marker and let the compiler choose.
Thanks , I will drop the inline statement.

Thanks
Tianrui Zhao
>
>> +static inline int kvm_larch_putq(CPUState *cs, uint64_t reg_id,
>> +                                 uint64_t *addr)
>
> Likewise.
>
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~



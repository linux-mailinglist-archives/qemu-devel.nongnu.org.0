Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DEF6E91DF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 13:07:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppS7g-0002ij-0E; Thu, 20 Apr 2023 07:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaotianrui@loongson.cn>)
 id 1ppS7c-0002iY-B7
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 07:06:40 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhaotianrui@loongson.cn>) id 1ppS7Z-0007NU-Qk
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 07:06:39 -0400
Received: from loongson.cn (unknown [10.20.42.120])
 by gateway (Coremail) with SMTP id _____8Axkk63HEFkYHsfAA--.48826S3;
 Thu, 20 Apr 2023 19:06:31 +0800 (CST)
Received: from [10.20.42.120] (unknown [10.20.42.120])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Axy7K2HEFkGQsxAA--.908S3; 
 Thu, 20 Apr 2023 19:06:31 +0800 (CST)
Subject: Re: [PATCH RFC v1 07/10] target/loongarch: Implement
 kvm_arch_handle_exit
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, gaosong@loongson.cn
References: <20230420093606.3366969-1-zhaotianrui@loongson.cn>
 <20230420093606.3366969-8-zhaotianrui@loongson.cn>
 <bbc4bf1b-9855-db6f-05d4-aa3baac96ee2@linaro.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, maobibo@loongson.cn
From: Tianrui Zhao <zhaotianrui@loongson.cn>
Message-ID: <5c97bd6b-1796-e069-3d8f-4c5a659cad17@loongson.cn>
Date: Thu, 20 Apr 2023 19:06:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <bbc4bf1b-9855-db6f-05d4-aa3baac96ee2@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Axy7K2HEFkGQsxAA--.908S3
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7urWxKFy8AF1rZw47WryDWrg_yoW8Aw4xpa
 ykAF45KrWIg39rt3ZxX3Waq3W3ZrWrGr47Xa47tFya9ws8Zr95CFykKwnIgFWYyryxGa10
 vF10yFnFgF1YyrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E
 0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzV
 Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S
 6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82
 IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
 0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
 IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF
 0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8HSoJUUUUU==
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



在 2023年04月20日 18:00, Philippe Mathieu-Daudé 写道:
> On 20/4/23 11:36, Tianrui Zhao wrote:
>> Implement kvm_arch_handle_exit for loongarch. In this
>> function, the KVM_EXIT_LOONGARCH_IOCSR is handled,
>> we read or write the iocsr address space by the addr,
>> length and is_write argument in kvm_run.
>>
>> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
>> ---
>>   target/loongarch/kvm.c | 24 +++++++++++++++++++++++-
>>   1 file changed, 23 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/loongarch/kvm.c b/target/loongarch/kvm.c
>> index f8772bbb27..4ce343d276 100644
>> --- a/target/loongarch/kvm.c
>> +++ b/target/loongarch/kvm.c
>> @@ -499,7 +499,29 @@ bool kvm_arch_cpu_check_are_resettable(void)
>>     int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>>   {
>> -    return 0;
>> +    int ret = 0;
>> +    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
>> +    CPULoongArchState *env = &cpu->env;
>> +    MemTxAttrs attrs = {};
>> +
>> +    attrs.requester_id = env_cpu(env)->cpu_index;
>> +
>> +    DPRINTF("%s\n", __func__);
>
> Please use trace events instead of DPRINTF(), as we are trying to remove
> these.
Thanks, I will replace it with trace events.

Thanks
Tianrui Zhao
>
>> +    switch (run->exit_reason) {
>> +    case KVM_EXIT_LOONGARCH_IOCSR:
>> +        address_space_rw(&env->address_space_iocsr,
>> +                         run->iocsr_io.phys_addr,
>> +                         attrs,
>> +                         run->iocsr_io.data,
>> +                         run->iocsr_io.len,
>> +                         run->iocsr_io.is_write);
>> +        break;
>> +    default:
>> +        ret = -1;
>> +        fprintf(stderr, "KVM: unknown exit reason %d\n", 
>> run->exit_reason);
>
> Would warn_report() be more appropriate here?
Thanks, I will use warn_report() here.

Thanks
Tianrui Zhao
>
>> +        break;
>> +    }
>> +    return ret;
>>   }
>>     void kvm_arch_accel_class_init(ObjectClass *oc)



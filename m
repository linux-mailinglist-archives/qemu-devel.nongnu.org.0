Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 861046E761B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 11:20:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp3yu-0001eC-Cc; Wed, 19 Apr 2023 05:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaotianrui@loongson.cn>)
 id 1pp3yn-0001V5-Oe
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 05:19:58 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhaotianrui@loongson.cn>) id 1pp3yh-0005Lr-UP
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 05:19:55 -0400
Received: from loongson.cn (unknown [10.20.42.120])
 by gateway (Coremail) with SMTP id _____8Cxjdoysj9k_t4eAA--.36858S3;
 Wed, 19 Apr 2023 17:19:46 +0800 (CST)
Received: from [10.20.42.120] (unknown [10.20.42.120])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxHuQxsj9kVNsuAA--.24894S3; 
 Wed, 19 Apr 2023 17:19:45 +0800 (CST)
Subject: Re: [PATCH] target/loongarch: Add CSR_CPUID reg in cpu_env
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230418122045.2808212-1-zhaotianrui@loongson.cn>
 <4656ba70-7ad0-a01f-2bd9-e4623ee5355e@loongson.cn>
 <a6f44b8e-59fc-f187-8ea4-1041548f0ebf@loongson.cn>
Cc: richard.henderson@linaro.org, maobibo@loongson.cn, f4bug@amsat.org,
 philmd@linaro.org
From: Tianrui Zhao <zhaotianrui@loongson.cn>
Message-ID: <39c95a6a-0fc2-f5de-20f4-5b10e745207f@loongson.cn>
Date: Wed, 19 Apr 2023 17:19:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <a6f44b8e-59fc-f187-8ea4-1041548f0ebf@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxHuQxsj9kVNsuAA--.24894S3
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAFWkKw1xuFWxAFy7GF4rZrb_yoW5ZFy5pr
 n7CFWqkr4UtFWkA34xZ3Z0g3WDXw17Kw4Iva15GFyvvF4UWr1kXFW0kwnF9FyDAw45ArW0
 vF1Yyr15XF4fZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
 0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
 AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1l
 Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
 MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I
 8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2ID7UUUUU
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



在 2023年04月18日 20:45, Tianrui Zhao 写道:
>
>
> 在 2023年04月18日 20:40, Song Gao 写道:
>> Hi,  Tianrui
>>
>> 在 2023/4/18 下午8:20, Tianrui Zhao 写道:
>>> Add CSR_CPUID register in cpu_env to save the cpu_index
>>> value.
>> Why do we need to do this?
>>
>> For tcg mode, it is enough to use cpu_index. You need to explain the 
>> reason.
>>
>> Thank.
>> Song Gao
> We prepare to add kvm for loongarch, so we want to add CSR_CPUID reg 
> for get/put_registers ioctl.
>
> Thanks
> Tianrui Zhao
We want to use the CSR_CPUID in get/put_register kvm ioctl, like this:
kvm_loongarch_put_csr(cpustate *cs)
{
KVM_PUT_ONEREG(cs,  &env->CSR_CRMD); //put CSR_CRMD val into kvm
KVM_PUT_ONEREG(cs,  &env->CSR_PRMD); // put CSR_PRMD val into kvm
...
KVM_PUT_ONEREG(cs,  &env->CSR_CPUID); // put CSR_CPUID val into kvm
...
}

And use the CSR_CPUID reg could keep the consistent format with other 
regs in the put_registers function.

Thanks
Tianrui Zhao
>
>>> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
>>> ---
>>>   target/loongarch/cpu.c                             | 1 +
>>>   target/loongarch/cpu.h                             | 1 +
>>>   target/loongarch/insn_trans/trans_privileged.c.inc | 8 +-------
>>>   3 files changed, 3 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
>>> index 97e6579f6a..bee5949ed2 100644
>>> --- a/target/loongarch/cpu.c
>>> +++ b/target/loongarch/cpu.c
>>> @@ -486,6 +486,7 @@ static void loongarch_cpu_reset_hold(Object *obj)
>>>         env->CSR_ESTAT = env->CSR_ESTAT & (~MAKE_64BIT_MASK(0, 2));
>>>       env->CSR_RVACFG = FIELD_DP64(env->CSR_RVACFG, CSR_RVACFG, 
>>> RBITS, 0);
>>> +    env->CSR_CPUID = cs->cpu_index;
>>>       env->CSR_TCFG = FIELD_DP64(env->CSR_TCFG, CSR_TCFG, EN, 0);
>>>       env->CSR_LLBCTL = FIELD_DP64(env->CSR_LLBCTL, CSR_LLBCTL, KLO, 
>>> 0);
>>>       env->CSR_TLBRERA = FIELD_DP64(env->CSR_TLBRERA, CSR_TLBRERA, 
>>> ISTLBR, 0);
>>> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
>>> index e11c875188..1d9a4009b9 100644
>>> --- a/target/loongarch/cpu.h
>>> +++ b/target/loongarch/cpu.h
>>> @@ -288,6 +288,7 @@ typedef struct CPUArchState {
>>>       uint64_t CSR_PWCH;
>>>       uint64_t CSR_STLBPS;
>>>       uint64_t CSR_RVACFG;
>>> +    uint64_t CSR_CPUID;
>>>       uint64_t CSR_PRCFG1;
>>>       uint64_t CSR_PRCFG2;
>>>       uint64_t CSR_PRCFG3;
>>> diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc 
>>> b/target/loongarch/insn_trans/trans_privileged.c.inc
>>> index 5a04352b01..d1d98c6e9e 100644
>>> --- a/target/loongarch/insn_trans/trans_privileged.c.inc
>>> +++ b/target/loongarch/insn_trans/trans_privileged.c.inc
>>> @@ -99,13 +99,7 @@ static const CSRInfo csr_info[] = {
>>>       CSR_OFF(PWCH),
>>>       CSR_OFF(STLBPS),
>>>       CSR_OFF(RVACFG),
>>> -    [LOONGARCH_CSR_CPUID] = {
>>> -        .offset = (int)offsetof(CPUState, cpu_index)
>>> -                  - (int)offsetof(LoongArchCPU, env),
>>> -        .flags = CSRFL_READONLY,
>>> -        .readfn = NULL,
>>> -        .writefn = NULL
>>> -    },
>>> +    CSR_OFF_FLAGS(CPUID, CSRFL_READONLY),
>>>       CSR_OFF_FLAGS(PRCFG1, CSRFL_READONLY),
>>>       CSR_OFF_FLAGS(PRCFG2, CSRFL_READONLY),
>>>       CSR_OFF_FLAGS(PRCFG3, CSRFL_READONLY),
>



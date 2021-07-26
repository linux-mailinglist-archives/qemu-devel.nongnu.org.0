Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E925E3D5678
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 11:27:52 +0200 (CEST)
Received: from localhost ([::1]:54152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7wts-0002T3-10
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 05:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m7wri-00011u-RI
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 05:25:38 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42302 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m7wrg-0000ri-38
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 05:25:38 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_0GKf_5gnQEkAA--.45136S3; 
 Mon, 26 Jul 2021 17:25:31 +0800 (CST)
Subject: Re: [PATCH v2 05/22] target/loongarch: Add memory management support
To: Richard Henderson <richard.henderson@linaro.org>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-6-git-send-email-gaosong@loongson.cn>
 <5f95af00-67d6-ae9d-580c-57d957f94376@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <c5fab9c5-6ec3-0541-00a8-fad39829b359@loongson.cn>
Date: Mon, 26 Jul 2021 17:25:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <5f95af00-67d6-ae9d-580c-57d957f94376@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_0GKf_5gnQEkAA--.45136S3
X-Coremail-Antispam: 1UD129KBjvJXoW3WFy7Ar1fXry5tFWDKFyrXrb_yoWxJFW3pr
 1kArWUJrWUJrn5Jr1UJw15JFy5Zr4UG3WDt3WxXF1jyr47Xr1jgr4UXryqgF1UJw48Jr1U
 Zr1UZrnruF17JrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBS1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
 z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzx
 vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 GVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCYjI0SjxkI
 62AI1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6c
 x26ryrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
 3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
 AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
 cVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
 Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUF9a9DUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.091,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, qemu-devel@nongnu.org,
 maobibo@loongson.cn, laurent@vivier.eu, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Richard.

On 07/23/2021 06:48 AM, Richard Henderson wrote:
> On 7/20/21 11:53 PM, Song Gao wrote:
>> This patch introduces one memory-management-related functions
>> - loongarch_cpu_tlb_fill()
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   target/loongarch/cpu.c        |   1 +
>>   target/loongarch/cpu.h        |   9 ++++
>>   target/loongarch/tlb_helper.c | 103 ++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 113 insertions(+)
>>   create mode 100644 target/loongarch/tlb_helper.c
>>
>> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
>> index 8eaa778..6269dd9 100644
>> --- a/target/loongarch/cpu.c
>> +++ b/target/loongarch/cpu.c
>> @@ -269,6 +269,7 @@ static struct TCGCPUOps loongarch_tcg_ops = {
>>       .initialize = loongarch_tcg_init,
>>       .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
>>       .cpu_exec_interrupt = loongarch_cpu_exec_interrupt,
>> +    .tlb_fill = loongarch_cpu_tlb_fill,
>>   };
>>   #endif /* CONFIG_TCG */
>>   diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
>> index 1db8bb5..5c06122 100644
>> --- a/target/loongarch/cpu.h
>> +++ b/target/loongarch/cpu.h
>> @@ -287,4 +287,13 @@ static inline void compute_hflags(CPULoongArchState *env)
>>     const char *loongarch_exception_name(int32_t exception);
>>   +/* tlb_helper.c */
>> +bool loongarch_cpu_tlb_fill(CPUState *cs,
>> +                            vaddr address,
>> +                            int size,
>> +                            MMUAccessType access_type,
>> +                            int mmu_idx,
>> +                            bool probe,
>> +                            uintptr_t retaddr);
>> +
>>   #endif /* LOONGARCH_CPU_H */
>> diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
>> new file mode 100644
>> index 0000000..b59a995
>> --- /dev/null
>> +++ b/target/loongarch/tlb_helper.c
>> @@ -0,0 +1,103 @@
>> +/*
>> + * LoongArch tlb emulation helpers for qemu.
>> + *
>> + * Copyright (c) 2021 Loongson Technology Corporation Limited
>> + *
>> + * SPDX-License-Identifier: LGPL-2.1+
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "cpu.h"
>> +#include "cpu-csr.h"
>> +#include "exec/helper-proto.h"
>> +#include "exec/exec-all.h"
>> +#include "exec/cpu_ldst.h"
>> +#include "exec/log.h"
>> +
>> +enum {
>> +    TLBRET_PE = -7,
>> +    TLBRET_XI = -6,
>> +    TLBRET_RI = -5,
>> +    TLBRET_DIRTY = -4,
>> +    TLBRET_INVALID = -3,
>> +    TLBRET_NOMATCH = -2,
>> +    TLBRET_BADADDR = -1,
>> +    TLBRET_MATCH = 0
>> +};
>> +
>> +static void raise_mmu_exception(CPULoongArchState *env, target_ulong address,
>> +                                MMUAccessType access_type, int tlb_error)
>> +{
>> +    CPUState *cs = env_cpu(env);
>> +    int exception = 0, error_code = 0;
>> +
>> +    if (access_type == MMU_INST_FETCH) {
>> +        error_code |= INST_INAVAIL;
>> +    }
>> +
>> +    switch (tlb_error) {
>> +    default:
>> +    case TLBRET_BADADDR:
>> +        exception = EXCP_ADE;
>> +        break;
>> +    case TLBRET_NOMATCH:
>> +        /* No TLB match for a mapped address */
>> +        if (access_type == MMU_DATA_STORE) {
>> +            exception = EXCP_TLBS;
>> +        } else {
>> +            exception = EXCP_TLBL;
>> +        }
>> +        error_code |= TLB_NOMATCH;
>> +        break;
>> +    case TLBRET_INVALID:
>> +        /* TLB match with no valid bit */
>> +        if (access_type == MMU_DATA_STORE) {
>> +            exception = EXCP_TLBS;
>> +        } else {
>> +            exception = EXCP_TLBL;
>> +        }
>> +        break;
>> +    case TLBRET_DIRTY:
>> +        exception = EXCP_TLBM;
>> +        break;
>> +    case TLBRET_XI:
>> +        /* Execute-Inhibit Exception */
>> +        exception = EXCP_TLBXI;
>> +        break;
>> +    case TLBRET_RI:
>> +        /* Read-Inhibit Exception */
>> +        exception = EXCP_TLBRI;
>> +        break;
>> +    case TLBRET_PE:
>> +        /* Privileged Exception */
>> +        exception = EXCP_TLBPE;
>> +        break;
>> +    }
>> +
>> +    if (tlb_error == TLBRET_NOMATCH) {
>> +        env->CSR_TLBRBADV = address;
>> +        env->CSR_TLBREHI = address & (TARGET_PAGE_MASK << 1);
>> +        cs->exception_index = exception;
>> +        env->error_code = error_code;
>> +        return;
>> +    }
>> +
>> +    /* Raise exception */
>> +    env->CSR_BADV = address;
>> +    cs->exception_index = exception;
>> +    env->error_code = error_code;
>> +    env->CSR_TLBEHI = address & (TARGET_PAGE_MASK << 1);
>> +}
>> +
>> +bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>> +                       MMUAccessType access_type, int mmu_idx,
>> +                       bool probe, uintptr_t retaddr)
>> +{
>> +    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
>> +    CPULoongArchState *env = &cpu->env;
>> +    int ret = TLBRET_BADADDR;
>> +
>> +    /* data access */
>> +    raise_mmu_exception(env, address, access_type, ret);
>> +    do_raise_exception_err(env, cs->exception_index, env->error_code, retaddr);
>> +}
> 
> Again, almost all of this does not apply for user-only.
> 
> r~
> 
>>

OK， I‘ll remove it .

Thanks
Song Gao.



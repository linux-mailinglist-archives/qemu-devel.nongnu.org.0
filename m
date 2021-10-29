Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8079A43F7A2
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:03:45 +0200 (CEST)
Received: from localhost ([::1]:48278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgLvU-00059J-40
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mgLtg-0004QV-3P
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:01:52 -0400
Received: from mail.loongson.cn ([114.242.206.163]:37854 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mgLtY-0007mJ-Hl
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:01:51 -0400
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxZeVGnHthfe8hAA--.60074S3; 
 Fri, 29 Oct 2021 15:01:26 +0800 (CST)
Subject: Re: [PATCH 08/31] target/loongarch: Add tlb instruction support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
 <1634628917-10031-9-git-send-email-yangxiaojuan@loongson.cn>
 <e2b3f726-aa78-3be8-d85f-18f3bf98e7a3@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <caaeaa89-2ea3-8093-e7c4-c96ad86adf36@loongson.cn>
Date: Fri, 29 Oct 2021 15:01:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <e2b3f726-aa78-3be8-d85f-18f3bf98e7a3@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxZeVGnHthfe8hAA--.60074S3
X-Coremail-Antispam: 1UD129KBjvJXoW3JFyDCry7Kr15Cr4DXw4fZrb_yoW7uF17pF
 W7CryUKF4UGFZrA3s7tayY9FnxJr48Ka4Fvayfta4Fkw45ZF97Zr18K3yakF4UA34F9r4j
 vF42yFyUWF18XFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUP214x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 F7xvrVAajcxG14v26r1j6r4UMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxV
 W8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI2
 0VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4
 AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
 wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc4
 0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
 xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr
 0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjtf
 HUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.847,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, mark.cave-ayland@ilande.co.uk, laurent@vivier.eu,
 peterx@redhat.com, f4bug@amsat.org, alistair.francis@wdc.com,
 maobibo@loongson.cn, gaosong@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Richard:

On 10/20/2021 12:19 PM, Richard Henderson wrote:
> On 10/19/21 12:34 AM, Xiaojuan Yang wrote:
>> This includes:
>> - TLBSRCH
>> - TLBRD
>> - TLBWR
>> - TLBFILL
>> - TLBCLR
>> - TLBFLUSH
>> - INVTLB
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   target/loongarch/cpu.c                   |  19 +
>>   target/loongarch/helper.h                |   8 +
>>   target/loongarch/insn_trans/trans_core.c |  54 +++
>>   target/loongarch/insns.decode            |  14 +
>>   target/loongarch/internals.h             |  18 +
>>   target/loongarch/tlb_helper.c            | 468 +++++++++++++++++++++++
>>   6 files changed, 581 insertions(+)
>>
>> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
>> index f145afb603..afd186abac 100644
>> --- a/target/loongarch/cpu.c
>> +++ b/target/loongarch/cpu.c
>> @@ -118,6 +118,7 @@ static void set_loongarch_cpucfg(CPULoongArchState *env)
>>   static void set_loongarch_csr(CPULoongArchState *env)
>>   {
>>       uint64_t t;
>> +    CPUState *cs = env_cpu(env);
>>         t = FIELD_DP64(0, CSR_PRCFG1, SAVE_NUM, 8);
>>       t = FIELD_DP64(t, CSR_PRCFG1, TIMER_BITS, 0x2f);
>> @@ -145,6 +146,9 @@ static void set_loongarch_csr(CPULoongArchState *env)
>>       env->CSR_RVACFG = 0x0;
>>       env->CSR_ASID = 0xa0000;
>>       env->CSR_ERA = env->pc;
>> +    env->CSR_CPUID = (cs->cpu_index & 0x1ff);
> 
> Any reason to have a copy of cpu_index, as opposed to just using that field?  CSR_CPUID is read-only after all.
> 
Yes, we need this value, the uefi code read this CPUID when Start slave cores.

>> +    env->CSR_EENTRY |= (uint64_t)0x80000000;
>> +    env->CSR_TLBRENTRY |= (uint64_t)0x80000000;
> 
> Are there really a defined reset values?  The documentation doesn't say.  It would appear that the kernel must set these before enabling interrupts or turning on paging.
> 
OK, it can be removed.

>> +#ifndef CONFIG_USER_ONLY
>> +    qemu_fprintf(f, "EUEN            0x%lx\n", env->CSR_EUEN);
>> +    qemu_fprintf(f, "ESTAT           0x%lx\n", env->CSR_ESTAT);
>> +    qemu_fprintf(f, "ERA             0x%lx\n", env->CSR_ERA);
>> +    qemu_fprintf(f, "CRMD            0x%lx\n", env->CSR_CRMD);
>> +    qemu_fprintf(f, "PRMD            0x%lx\n", env->CSR_PRMD);
>> +    qemu_fprintf(f, "BadVAddr        0x%lx\n", env->CSR_BADV);
>> +    qemu_fprintf(f, "TLB refill ERA  0x%lx\n", env->CSR_TLBRERA);
>> +    qemu_fprintf(f, "TLB refill BadV 0x%lx\n", env->CSR_TLBRBADV);
>> +    qemu_fprintf(f, "EENTRY            0x%lx\n", env->CSR_EENTRY);
>> +    qemu_fprintf(f, "BadInstr        0x%lx\n", env->CSR_BADI);
>> +    qemu_fprintf(f, "PRCFG1    0x%lx\nPRCFG2     0x%lx\nPRCFG3     0x%lx\n",
>> +                 env->CSR_PRCFG1, env->CSR_PRCFG3, env->CSR_PRCFG3);
>> +#endif
> 
> This probably belongs to a different patch?
> 
>> @@ -165,4 +172,51 @@ static bool trans_iocsrwr_d(DisasContext *ctx, arg_iocsrwr_d *a)
>>       gen_helper_iocsr_write(cpu_env, addr, val, tcg_constant_i32(oi));
>>       return true;
>>   }
>> +
>> +static bool trans_tlbsrch(DisasContext *ctx, arg_tlbsrch *a)
>> +{
>> +    gen_helper_tlbsrch(cpu_env);
>> +    return true;
>> +}
> 
> Missing priv check, all functions.
> 
>> +static bool trans_invtlb(DisasContext *ctx, arg_invtlb *a)
>> +{
>> +    TCGv addr = gpr_src(ctx, a->addr, EXT_NONE);
>> +    TCGv info = gpr_src(ctx, a->info, EXT_NONE);
>> +    TCGv op = tcg_constant_tl(a->invop);
>> +
>> +    gen_helper_invtlb(cpu_env, addr, info, op);
>> +    return true;
>> +}
> 
> Decode op here -- there are only 7 defined opcodes.
> 
> Note that you'll need to end the TB after most TLB instructions, since the translation of PC could change between one insn and the next.
> 
> 
>> +&fmt_invtlb         addr info invop
>> +@fmt_invtlb          ...... ...... ..... ..... ..... .....    &fmt_invtlb         %addr %info %invop
> 
> Why are you using the names addr and info instead of rk and rj?
> 
>> diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
>> index 1251e7f21c..916c675680 100644
>> --- a/target/loongarch/internals.h
>> +++ b/target/loongarch/internals.h
>> @@ -76,6 +76,14 @@ struct CPULoongArchTLBContext {
>>       int (*map_address)(struct CPULoongArchState *env, hwaddr *physical,
>>                          int *prot, target_ulong address,
>>                          MMUAccessType access_type);
>> +    void (*helper_tlbwr)(struct CPULoongArchState *env);
>> +    void (*helper_tlbfill)(struct CPULoongArchState *env);
>> +    void (*helper_tlbsrch)(struct CPULoongArchState *env);
>> +    void (*helper_tlbrd)(struct CPULoongArchState *env);
>> +    void (*helper_tlbclr)(struct CPULoongArchState *env);
>> +    void (*helper_tlbflush)(struct CPULoongArchState *env);
>> +    void (*helper_invtlb)(struct CPULoongArchState *env, target_ulong addr,
>> +                          target_ulong info, int op);
> 
> Again, function pointers are premature.
> 
>> +static uint64_t ls3a5k_pagesize_to_mask(int pagesize)
>> +{
>> +    /* 4KB - 1GB */
>> +    if (pagesize < 12 && pagesize > 30) {
>> +        qemu_log_mask(CPU_LOG_MMU, "unsupported page size %d\n", pagesize);
>> +        exit(-1);
> 
> Do not call exit.  Make up something sensible that won't crash qemu.
> 
>> +/* return random value in [low, high] */
>> +static uint32_t cpu_loongarch_get_random_ls3a5k_tlb(uint32_t low, uint32_t high)
>> +{
>> +    static uint32_t seed = 5;
>> +    static uint32_t prev_idx;
> 
> No static variables like this, as they cannot be migrated, and are a race condition between multiple cpus.  That said...
> 
>> +    uint32_t idx;
>> +    uint32_t nb_rand_tlb = high - low + 1;
>> +
>> +    do {
>> +        seed = 1103515245 * seed + 12345;
>> +        idx = (seed >> 16) % nb_rand_tlb + low;
>> +    } while (idx == prev_idx);
> 
> ... we have defined interfaces for getting random numbers.
> 
>
Do you mean the qemu_guest_getrandom function? It gets random values that do not limit the range.
But I need a random in a fixed range, I cannot find the  Similar interface. Thanks. 

 
> r~



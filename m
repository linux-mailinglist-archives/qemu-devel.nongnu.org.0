Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A7C4542F7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 09:50:39 +0100 (CET)
Received: from localhost ([::1]:49194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnGeL-0002VR-Uc
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 03:50:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mnGcx-00013j-Qp
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:49:13 -0500
Received: from mail.loongson.cn ([114.242.206.163]:36698 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mnGcr-0005BJ-PM
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:49:11 -0500
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxWLLDwZRhVNMAAA--.2665S3;
 Wed, 17 Nov 2021 16:48:04 +0800 (CST)
Subject: Re: [RFC PATCH v2 08/30] target/loongarch: Add LoongArch CSR/IOCSR
 instruction
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-9-git-send-email-yangxiaojuan@loongson.cn>
 <f8e9fc82-ee40-fd40-3a8c-733c315b726e@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <19a13ffb-aca5-2459-4e3f-a6774415d819@loongson.cn>
Date: Wed, 17 Nov 2021 16:48:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <f8e9fc82-ee40-fd40-3a8c-733c315b726e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxWLLDwZRhVNMAAA--.2665S3
X-Coremail-Antispam: 1UD129KBjvJXoW3GF47WF17Xw18Jw47Jw4UXFb_yoW7tw1xpF
 WjkFy7tr4UtrWDuwnrXas8Ar15Jw1xGa4rAw40yFy2kas8Zr93GayUuw43KFy5Crna9r43
 ZF1Yva4xu3WUXaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9K14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 64x0Y40En7xvr7AKxVWUJVW8JwAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI
 0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8v
 x2IErcIFxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
 x2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU173vUUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.009,
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Richard:

On 11/12/2021 01:43 AM, Richard Henderson wrote:
> On 11/11/21 2:35 AM, Xiaojuan Yang wrote:
>> This includes:
>> - CSRRD
>> - CSRWR
>> - CSRXCHG
>> - IOCSR{RD/WR}.{B/H/W/D}
> 
> I think IOCSR should be in a separate patch.
> It's completely unrelated to the other CSRs.
> 
>> +target_ulong helper_csr_rdq(CPULoongArchState *env, uint64_t csr)
>> +{
>> +    int64_t v;
>> +
>> +    switch (csr) {
>> +    case LOONGARCH_CSR_PGD:
>> +        if (env->CSR_TLBRERA & 0x1) {
>> +            v = env->CSR_TLBRBADV;
>> +        } else {
>> +            v = env->CSR_BADV;
>> +        }
>> +
>> +        if ((v >> 63) & 0x1) {
>> +            v = env->CSR_PGDH;
>> +        } else {
>> +            v = env->CSR_PGDL;
>> +        }
>> +        v = v & TARGET_PHYS_MASK;
> 
> This csr is defined to be GRLEN bits; I this mask looks wrong.
> 
>> +    default:
>> +        assert(0);
> 
> g_assert_not_reached.
> 
>> +    switch (csr) {
>> +    case LOONGARCH_CSR_ASID:
>> +        old_v = env->CSR_ASID;
>> +        env->CSR_ASID = val;
> 
> Mask the write to the field; you don't want to corrupt ASIDBITS, or the other read-only bits.

Ok, all above have been modified.

> 
>> +    case LOONGARCH_CSR_TCFG:
>> +        old_v = env->CSR_TCFG;
>> +        cpu_loongarch_store_stable_timer_config(env, val);
>> +        break;
>> +    case LOONGARCH_CSR_TINTCLR:
>> +        old_v = 0;
>> +        qemu_irq_lower(env->irq[IRQ_TIMER]);
> 
> The interrupt is not documented to clear on any write; only writes of 1 to bit 0.

I think the manual has mentioned at 7.6.5 which says when 1 is written to this bit, the clock interrupt 
flag is cleared.

> 
>> +    default:
>> +        assert(0);
> 
> g_assert_not_reached.
> 
>> +    }
>> +
>> +    return old_v;
>> +}
>> +
>> +target_ulong helper_csr_xchgq(CPULoongArchState *env, target_ulong val,
>> +                              target_ulong mask, uint64_t csr)
>> +{
>> +    target_ulong tmp;
>> +    target_ulong v = val & mask;
> 
> I think it would be less confusing to name the input parameter new_val, and the local temporary old_val.
> 
>> +#define CASE_CSR_XCHGQ(csr)                                 \
>> +    case LOONGARCH_CSR_ ## csr:                             \
>> +    {                                                       \
>> +        val = env->CSR_ ## csr;                             \
>> +        env->CSR_ ## csr = (env->CSR_ ## csr) & (~mask);    \
>> +        env->CSR_ ## csr = (env->CSR_ ## csr) | v;          \
> 
>   old_val = env->CSR_##csr;
>   env->CSR_##csr = (old_val & ~mask) | (new_val & mask);
> 
> 
>> +    switch (csr) {
>> +    CASE_CSR_XCHGQ(CRMD)
> 
> I wonder if all of this would be better with a table of offsets, which could be shared with the translator.
> 
> #define CSR_OFF(X)  [LOONGARCH_CSR_##X] = offsetof(CPUArchState, CSR_##X)
> 
> static const int csr_offsets[] = {
>     CSR_OFF(CRMD),
>     ...
> };
> 
> int cpu_csr_offset(unsigned csr_num)
> {
>     if (csr_num < ARRAY_SIZE(csr_offsets)) {
>         return csr_offsets[csr_num];
>     }
>     return 0;
> }
> 
> Which reduces this function to
> 
>     unsigned csr_offset = cpu_csr_offset(csr_num);
>     if (csr_offset == 0) {
>         /* CSR is undefined: read as 0, write ignored. */
>         return 0;
>     }
> 
>     uint64_t *csr = (void *)env + csr_offset;
>     uint64_t old_val = *csr;
> 
>     new_val = (new_val & mask) | (old_val & ~mask);
> 
>     *csr = (old_val & ~mask) | (new_val & mask);
> 
>     if (csr_num == LOONGARCH_CSR_TCFG) {
>         cpu_loongarch_store_stable_timer_config(env, new_val);
>     } else {
>         *csr = new_val;
>     }
>     return old_val;
> 
>> +uint64_t helper_iocsr_read(CPULoongArchState *env, target_ulong r_addr,
>> +                           uint32_t size)
>> +{
>> +    LoongArchMachineState *lams = LOONGARCH_MACHINE(qdev_get_machine());
>> +    int cpuid = env_cpu(env)->cpu_index;
>> +
>> +    if (((r_addr & 0xff00) == 0x1000) || ((r_addr & 0xff00) == 0x1800)) {
>> +        r_addr = r_addr + ((target_ulong)(cpuid & 0x3) << 8);
>> +    }
> 
> This looks to be something that should be controlled by the address space assigned to each cpu.
> 
>   But it's hard to tell.
> 
> Where is the documentation for this?  I didn't immediately find it in 3A5000 Technical Reference Manual, Chapter 10.

Yes, most iocsr instructions introduced on 3A5000 Technical Reference Manual, Chapter 10. 
Table 10-2, 10-3, 10-4, 10-5 and 11-10 lists per core iocsr

> 
>> +void helper_iocsr_write(CPULoongArchState *env, target_ulong w_addr,
>> +                        target_ulong val, uint32_t size)
>> +{
>> +    LoongArchMachineState *lams = LOONGARCH_MACHINE(qdev_get_machine());
>> +    int cpuid = env_cpu(env)->cpu_index;
>> +    int mask, i;
>> +
>> +    /*
>> +     * For IPI send, Mail send, ANY send adjust addr and val
>> +     * according to their real meaning
>> +     */
>> +    if (w_addr == 0x1040) { /* IPI send */
>> +        cpuid = (val >> 16) & 0x3ff;
>> +        val = 1UL << (val & 0x1f);
>> +        w_addr = 0x1008;
> 
> I don't see any interrupts actually being raised?

I define the memory region ops at the IPI interrupt controller, the ipi write here will lead to the ops and raise the 
interrupt at the read/write function. I don't know if this is appropriate, but most of the iocsr read/write are closely
related to interrupt controller.

> 
>> +static bool trans_csrrd(DisasContext *ctx, arg_csrrd *a)
>> +{
>> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
>> +
>> +    gen_helper_check_plv(cpu_env);
> 
> You don't need an external call.  PLV should be part of TB_FLAGS, so you can check this during translation.
> 
>> +    case LOONGARCH_CSR_TVAL:
>> +        gen_helper_csr_rdq(dest, cpu_env, tcg_constant_i64(a->csr));
>> +        break;
>> +    default:
>> +        assert(0);
> 
> The assert was definitely wrong, as it allows incorrect programs to crash qemu.  In addition, unknown csr read as 0.
> 
>> +    CASE_CSR_WRQ(MISC)
> 
> You don't actually support any of the MISC bits yet.
> You should make this register read-only until you do.
> 
> How many more registers are read-only, or have read-only fields that you are not checking?
>
Yes, I will check all of them.

Futher, Can you help review the remaining patches? since the board and machine code needs rewrite. A new version 
is need. The remaining patches are:

 0011-target-loongarch-Add-LoongArch-interrupt-and-excepti.patch
 0012-target-loongarch-Add-timer-related-instructions-supp.patch
 0013-target-loongarch-Add-gdb-support.patch
 0014-target-loongarch-Implement-privilege-instructions-di.patch

 Thank you for all your work.

Xiaojuan
 
> 
> r~



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B9643F730
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 08:31:51 +0200 (CEST)
Received: from localhost ([::1]:52198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgLQc-0003WY-Ah
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 02:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mgLLU-0001H3-0R
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 02:26:32 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56156 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mgLLR-0004ev-2G
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 02:26:31 -0400
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP2v7k3thNuohAA--.51603S3; 
 Fri, 29 Oct 2021 14:26:04 +0800 (CST)
Subject: Re: [PATCH 07/31] target/loongarch: Add loongarch csr/iocsr
 instruction support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
 <1634628917-10031-8-git-send-email-yangxiaojuan@loongson.cn>
 <cb33aeb0-3a82-1300-cbbc-3e260cee8a5f@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <75e6250e-6cb5-6557-b9dd-ea3fdb0436e2@loongson.cn>
Date: Fri, 29 Oct 2021 14:26:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <cb33aeb0-3a82-1300-cbbc-3e260cee8a5f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxP2v7k3thNuohAA--.51603S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCF4Utr4Dur4xXw15CFyUJrb_yoWrtFW5pF
 18Cr4UCr40qF1DZ342qws8Cr1rZw4S9a4jk3yrAwsIyrsrZFn7ArW8Cw43GFWUCrn5Zr4j
 yay5Z3s29a98taDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUP214x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
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

On 10/20/2021 09:36 AM, Richard Henderson wrote:
> On 10/19/21 12:34 AM, Xiaojuan Yang wrote:
>> +target_ulong helper_csr_rdq(CPULoongArchState *env, uint64_t csr)
>> +{
>> +    int64_t v;
>> +
>> +#define CASE_CSR_RDQ(csr)            \
>> +    case LOONGARCH_CSR_ ## csr:      \
>> +    {                                \
>> +        v = env->CSR_ ## csr;        \
>> +        break;                       \
>> +    };                               \
> 
> There's absolutely no reason to call a helper function for a simple load.
> 
>> +    case LOONGARCH_CSR_PGD:
>> +
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
>> +        break;
> 
> This is the only one that requires a helper on read.
> 
>> +    if (csr == LOONGARCH_CSR_ASID) {
>> +        if (old_v != val) {
>> +            tlb_flush(env_cpu(env));
>> +        }
>> +    }
> 
> And this is the only one that requires a helper on write.
> 
>> +    case LOONGARCH_CSR_ESTAT:
>> +        qatomic_and(&env->CSR_ESTAT, ~mask);
> 
> Why do you believe this requires an atomic update?
> What is going to race with the update to a cpu private value?
> 
>> +static bool trans_csrrd(DisasContext *ctx, unsigned rd, unsigned csr)
>> +{
>> +    TCGv dest = gpr_dst(ctx, rd, EXT_NONE);
>> +    gen_helper_csr_rdq(dest, cpu_env, tcg_constant_i64(csr));
>> +    return true;
>> +}
>> +
>> +static bool trans_csrwr(DisasContext *ctx, unsigned rd, unsigned csr)
>> +{
>> +    TCGv dest = gpr_dst(ctx, rd, EXT_NONE);
>> +    TCGv src1 = gpr_src(ctx, rd, EXT_NONE);
>> +
>> +    switch (csr) {
>> +    case LOONGARCH_CSR_CRMD:
>> +        tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
>> +        gen_helper_csr_wrq(dest, cpu_env, src1, tcg_constant_i64(LOONGARCH_CSR_CRMD));
>> +        tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
>> +        ctx->base.is_jmp = DISAS_EXIT;
>> +        break;
>> +    case LOONGARCH_CSR_EUEN:
>> +        gen_helper_csr_wrq(dest, cpu_env, src1, tcg_constant_i64(LOONGARCH_CSR_EUEN));
>> +        /* Stop translation */
>> +        tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
>> +        ctx->base.is_jmp = DISAS_EXIT;
>> +        break;
>> +    default:
>> +        gen_helper_csr_wrq(dest, cpu_env, src1, tcg_constant_i64(csr));
>> +        break;
>> +    }
>> +    return true;
>> +}
>> +
>> +static bool trans_csrxchg(DisasContext *ctx, arg_csrxchg *a)
>> +{
>> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
>> +    TCGv src1 = gpr_src(ctx, a->rd, EXT_NONE);
>> +    TCGv src2 = gpr_src(ctx, a->rj, EXT_NONE);
>> +
>> +    if (a->rj == 0) {
>> +        return trans_csrrd(ctx, a->rd, a->csr);
>> +    } else if (a->rj == 1) {
>> +        return trans_csrwr(ctx, a->rd, a->csr);
>> +    }
> 
> These should have been decoded separately; see below.
> 
> You're missing the check for priv 0 here and in all other functions.
> 
>> +
>> +    if (a->rd == 0) {
>> +        gen_helper_csr_xchgq_r0(cpu_env, src2, tcg_constant_i64(a->csr));
>> +    } else {
>> +        gen_helper_csr_xchgq(dest, cpu_env, src1, src2, tcg_constant_i64(a->csr));
>> +    }
> 
> Why do you believe r0 to require a special case?
>
 
OK, I have modified  all above.

>> +static bool trans_iocsrrd_b(DisasContext *ctx, arg_iocsrrd_b *a)
>> +{
>> +    TCGv tmp = tcg_temp_new();
>> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
>> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
>> +
>> +    gen_helper_iocsr_read(tmp, cpu_env, src1);
>> +    tcg_gen_qemu_ld_tl(dest, tmp, ctx->mem_idx, MO_SB);
> 
> This is wrong.  From the manual:
> 
>   All IOCSR registers use independent addressing space
> 
> therefore you cannot simply read from a modified address, you must use a completely different address space.
> 
> There are a couple of different solutions that are possible.
> 
> (1) Use helper functions calling address_space_ld/st*.
> 
> (2) Use a separate mmu_idx, which uses its own address space.
>     This requires bouncing through MemTxAttrs, since
>     cpu_asidx_from_attrs only take attrs and not mmu_idx.
> 
> The second one is may be overkill, unless there will be any cachable memory in iospace.  I would expect most of it to be device memory.
> 
(1) For the iocsr registers, most of them act on the interrupt controller, the read and write will go to interrupt's mmio read/write.
So I modified the addr to their mmio range. The ext interrupt controller use the sysbus's function to handle the interrupt cascade and
sysbus_mmio_map to map the address which use the system memory region. So if I use a different address space, I realize a different 
sysbus_mmio_map function use a different address space, is it feasible ?

(2)Can you help me review the remaining patches? Thanks.

>> +csrxchg          0000 0100 .............. ..... .....     @fmt_rdrjcsr
> 
> {
>   csrrd             0000 0100 .............. 00000 .....     @fmt_rdcsr
>   csrwr             0000 0100 .............. 00001 .....     @fmt_rdcsr
>   csrxchg           0000 0100 .............. ..... .....     @fmt_rdrjcsr
> }
> 
> 
> r~



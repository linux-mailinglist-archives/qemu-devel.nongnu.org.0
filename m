Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA90454125
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 07:46:45 +0100 (CET)
Received: from localhost ([::1]:36884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnEiR-0003lP-4R
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 01:46:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mnEbB-0001FN-Md
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 01:39:16 -0500
Received: from mail.loongson.cn ([114.242.206.163]:60538 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mnEZi-00029f-G2
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 01:39:13 -0500
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxaLIjo5RhC8oAAA--.2508S3;
 Wed, 17 Nov 2021 14:37:24 +0800 (CST)
Subject: Re: [RFC PATCH v2 07/30] target/loongarch: Add MMU support for
 LoongArch CPU.
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-8-git-send-email-yangxiaojuan@loongson.cn>
 <d7ad6fa5-8a9d-15e2-8dcb-7499309c7681@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <4c351642-a783-84e0-5b08-6b8ee164b501@loongson.cn>
Date: Wed, 17 Nov 2021 14:37:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <d7ad6fa5-8a9d-15e2-8dcb-7499309c7681@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxaLIjo5RhC8oAAA--.2508S3
X-Coremail-Antispam: 1UD129KBjvJXoW3uw4kCw48AF4kZr18Xr1rXrb_yoWkZFyDpF
 9rCF1jkFW8tFWfCr4Sq398Cr4DXw40ka1kWa13KF1Fkrs3Zwn3ZFWv9ry3CryxArs8Aa17
 ZF4UAFyUWF13JFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9C14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 F7xvrVAajcxG14v26r1j6r4UMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxV
 W8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI2
 0VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
 C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
 wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
 vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v2
 0xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
 v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUsJ5rUUUUU=
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

On 11/11/2021 11:53 PM, Richard Henderson wrote:
> On 11/11/21 2:35 AM, Xiaojuan Yang wrote:
>> This patch introduces basic TLB interfaces.
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   target/loongarch/cpu-param.h  |   3 +
>>   target/loongarch/cpu.c        |  36 ++++
>>   target/loongarch/cpu.h        |  57 ++++++
>>   target/loongarch/internals.h  |   7 +
>>   target/loongarch/machine.c    |  56 ++++++
>>   target/loongarch/meson.build  |   1 +
>>   target/loongarch/tlb_helper.c | 339 ++++++++++++++++++++++++++++++++++
>>   7 files changed, 499 insertions(+)
>>   create mode 100644 target/loongarch/tlb_helper.c
>>
>> diff --git a/target/loongarch/cpu-param.h b/target/loongarch/cpu-param.h
>> index 9a769b67e0..5a2147fb90 100644
>> --- a/target/loongarch/cpu-param.h
>> +++ b/target/loongarch/cpu-param.h
>> @@ -12,6 +12,9 @@
>>   #define TARGET_PHYS_ADDR_SPACE_BITS 48
>>   #define TARGET_VIRT_ADDR_SPACE_BITS 48
>>   +#define TARGET_PHYS_MASK ((1UL << TARGET_PHYS_ADDR_SPACE_BITS) - 1)
>> +#define TARGET_VIRT_MASK ((1UL << TARGET_VIRT_ADDR_SPACE_BITS) - 1)
> 
> As before, unsigned long is wrong; use MAKE_64BIT_MASK.
> 
> These do not belong in cpu-param.h anyway; probably only tlb_helper.c needs them.
> 
>> +#ifndef CONFIG_USER_ONLY
>> +    qemu_fprintf(f, "EUEN            0x%lx\n", env->CSR_EUEN);
>> +    qemu_fprintf(f, "ESTAT           0x%lx\n", env->CSR_ESTAT);
>> +    qemu_fprintf(f, "ERA             0x%lx\n", env->CSR_ERA);
>> +    qemu_fprintf(f, "CRMD            0x%lx\n", env->CSR_CRMD);
>> +    qemu_fprintf(f, "PRMD            0x%lx\n", env->CSR_PRMD);
>> +    qemu_fprintf(f, "BadVAddr        0x%lx\n", env->CSR_BADV);
>> +    qemu_fprintf(f, "TLB refill ERA  0x%lx\n", env->CSR_TLBRERA);
>> +    qemu_fprintf(f, "TLB refill BadV 0x%lx\n", env->CSR_TLBRBADV);
>> +    qemu_fprintf(f, "EENTRY          0x%lx\n", env->CSR_EENTRY);
>> +    qemu_fprintf(f, "BadInstr        0x%lx\n", env->CSR_BADI);
>> +    qemu_fprintf(f, "PRCFG1    0x%lx\nPRCFG2     0x%lx\nPRCFG3     0x%lx\n",
>> +                 env->CSR_PRCFG1, env->CSR_PRCFG3, env->CSR_PRCFG3);
> 
> %lx is wrong; use PRIx64.
> 
>> +#define LOONGARCH_TLB_MAX      2112 /* 2048 STLB + 64 MTLB */
> 
> Better to write (2048 + 64).
> 
>> +FIELD(TLB_MISC, E, 0, 1)
>> +FIELD(TLB_MISC, ASID, 1, 10)
>> +FIELD(TLB_MISC, G, 11, 1)
>> +FIELD(TLB_MISC, PS, 12, 6)
>> +FIELD(TLB_MISC, VPPN, 18, 35)
>> +
>> +/* Corresponding to CSR_TLBELO0/1 */
>> +FIELD(ENTRY0, V, 0, 1)
>> +FIELD(ENTRY0, D, 1, 1)
>> +FIELD(ENTRY0, NR, 2, 1)
>> +FIELD(ENTRY0, NX, 3, 1)
>> +FIELD(ENTRY0, MAT, 4, 2)
>> +FIELD(ENTRY0, PLV, 6, 2)
>> +FIELD(ENTRY0, RPLV, 8, 1)
>> +FIELD(ENTRY0, PPN, 9, 36)
>> +
>> +FIELD(ENTRY1, V, 0, 1)
>> +FIELD(ENTRY1, D, 1, 1)
>> +FIELD(ENTRY1, NR, 2, 1)
>> +FIELD(ENTRY1, NX, 3, 1)
>> +FIELD(ENTRY1, MAT, 4, 2)
>> +FIELD(ENTRY1, PLV, 6, 2)
>> +FIELD(ENTRY1, RPLV, 8, 1)
>> +FIELD(ENTRY1, PPN, 9, 36)
> 
> Why are you duplicating the CSR_TLBELO* fields?
> 
>> +const VMStateInfo vmstate_info_tlb = {
>> +    .name = "tlb_entry",
>> +    .get  = get_tlb,
>> +    .put  = put_tlb,
>> +};
> 
> Better to use .fields.
> 
>> +#define VMSTATE_TLB_ARRAY_V(_f, _s, _n, _v)                     \
>> +    VMSTATE_ARRAY(_f, _s, _n, _v, vmstate_info_tlb, loongarch_tlb)
>> +
>> +#define VMSTATE_TLB_ARRAY(_f, _s, _n)                           \
>> +    VMSTATE_TLB_ARRAY_V(_f, _s, _n, 0)
> 
> Don't need these.
> 
>> +
>> +const VMStateDescription vmstate_tlb = {
>> +    .name = "cpu/tlb",
>> +    .version_id = 0,
>> +    .minimum_version_id = 0,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_TLB_ARRAY(env.tlb, LoongArchCPU, LOONGARCH_TLB_MAX),
> 
> VMSTATE_STRUCT_ARRAY.
> 
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>>     /* LoongArch CPU state */
>>   @@ -22,6 +70,10 @@ const VMStateDescription vmstate_loongarch_cpu = {
>>           VMSTATE_UINT64_ARRAY(env.fpr, LoongArchCPU, 32),
>>           VMSTATE_UINT32(env.fcsr0, LoongArchCPU),
>>   +        /* TLB */
>> +        VMSTATE_UINT32(env.stlb_size, LoongArchCPU),
>> +        VMSTATE_UINT32(env.mtlb_size, LoongArchCPU),
> 
> Might as well keep these in vmstate_tlb.

All of the vmstate has been modified.

>> +/* TLB address map */
>> +static int loongarch_map_tlb_entry(CPULoongArchState *env, hwaddr *physical,
>> +                                   int *prot, target_ulong address,
>> +                                   int access_type, loongarch_tlb *tlb)
>> +{
>> +    uint64_t plv = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV);
> 
> Incorrect.  PLV associated with mmu_idx, so you need to use that.
> 
>> +    uint8_t tlb_ps, n, tlb_v0, tlb_v1, tlb_d0, tlb_d1;
>> +    uint8_t tlb_nx0, tlb_nx1, tlb_nr0, tlb_nr1;
>> +    uint64_t tlb_ppn0, tlb_ppn1;
>> +    uint8_t tlb_rplv0, tlb_rplv1, tlb_plv0, tlb_plv1;
>> +
>> +    tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
>> +    n = (address >> tlb_ps) & 0x1;/* Odd or even */
> 
> Surely you need to pass in tlb_ps, since it's not present in the STLB entries.
> 
>> +
>> +    tlb_v0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, V);
>> +    tlb_d0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, D);
>> +    tlb_plv0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, PLV);
>> +    tlb_ppn0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, PPN);
>> +    tlb_nx0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, NX);
>> +    tlb_nr0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, NR);
>> +    tlb_rplv0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, RPLV);
>> +
>> +    tlb_v1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, V);
>> +    tlb_d1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, D);
>> +    tlb_plv1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, PLV);
>> +    tlb_ppn1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, PPN);
>> +    tlb_nx1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, NX);
>> +    tlb_nr1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, NR);
>> +    tlb_rplv1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, RPLV);
> 
> Better to check N first.
> 
>     entry = n ? tlb->tlb_entry1 : tlb->tlb_entry0;
>     v = FIELD_EX64(entry, TLBENTRY, V);
> 
> etc.

oh, yes , it is Much simpler when check N first. Your advice is always so appropriate. Thanks

> 
>> +        *physical = (tlb_ppn1 << 12) | (address & ((1 << tlb_ps) - 1));
> 
> TARGET_PAGE_SIZE.

Maybe TARGET_PAGE_SIZE is not fit for a huge page. MAKE_64BIT_MASK(0, tlb_ps) is ok?

> 
>> +/* LoongArch 3A5000 -style MMU emulation */
> 
> There's no mention of 3A5000 in "LoongArch Reference Manual", which defines this.  I think you've copied this from MIPS, which talks about r4k here.
> 
>> +static int loongarch_map_address(CPULoongArchState *env, hwaddr *physical,
>> +                                 int *prot,
>> +                                 target_ulong address,
>> +                                 MMUAccessType access_type)
>> +{
>> +    loongarch_tlb *tlb;
>> +    uint16_t csr_asid, tlb_asid, stlb_idx;
>> +    uint8_t tlb_e, stlb_ps, tlb_ps, tlb_g;
>> +    int i, stlb_size, mtlb_size;
>> +    uint64_t vpn, tlb_vppn;   /* Address to map */
>> +
>> +    stlb_size = env->stlb_size;
>> +    mtlb_size = env->mtlb_size;
>> +    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
>> +
>> +    /* Search MTLB */
>> +    for (i = stlb_size; i < stlb_size + mtlb_size; ++i) {
> 
> Bit of a shame to have a linear search.  I guess it's ok for a start, but you'll find that this function is critical to the emulation speed of qemu, so you should think about other ways to organize the data.

The stlb search by the set, the mtlb uses the linear search, I have no other idea, do you have some advice? 

> 
>> +        tlb = &env->tlb[i];
>> +        tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
>> +        tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
>> +
>> +        vpn = (address & TARGET_VIRT_MASK) >> (tlb_ps + 1);
> 
> Why +1?

One tlb entry holds a adjacent odd/even pair, the vpn is the content of the virtual page number divided by 2.
So the compare vpn is bit[47:15] for 16KB page. while the vppn field in tlb entry contains bit[47:13], so need adjust.

> 
>> +        tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
>> +        tlb_e = FIELD_EX64(tlb->tlb_misc, TLB_MISC, E);
>> +        tlb_g = FIELD_EX64(tlb->tlb_misc, TLB_MISC, G);
>> +
>> +        if ((tlb_g == 1 || tlb_asid == csr_asid) &&
>> +            (vpn == (tlb_vppn >> (tlb_ps + 1 - 13))) && tlb_e) {
> 
> Surely extract and test the enable bit E before anything else, just to speed up the lookup.
> 
> The -13 is a bit of a magic number.  Surely TARGET_PAGE_BITS + 1.

OK, I will use the R_TLB_MISC_VPPN_SHIFT replace the magic 13.

> 
>> +static int get_physical_address(CPULoongArchState *env, hwaddr *physical,
>> +                                int *prot, target_ulong real_address,
>> +                                MMUAccessType access_type, int mmu_idx)
>> +{
>> +    int user_mode = mmu_idx == LOONGARCH_HFLAG_UM;
>> +    int kernel_mode = !user_mode;
> 
> Incorrect.  PLV == mmu_idx, as defined by cpu_mmu_index.
> 
>> +    unsigned plv, base_c, base_v, tmp;
>> +    uint64_t pg = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PG);
>> +
>> +    /* Effective address */
>> +    target_ulong address = real_address;
>> +
>> +    /* Check PG */
>> +    if (!pg) {
>> +        /* DA mode */
>> +        *physical = address & TARGET_PHYS_MASK;
>> +        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>> +        return TLBRET_MATCH;
>> +    }
> 
> You need to define a fifth mmu_index for paging disabled, because the software tlb handler runs in this mode.  If you don't define that, you'll have to flush the softmmu tlb every time you have a tlb miss.
> 
>> +    plv = kernel_mode | (user_mode << 3);
> 
> plv_mask = 1 << plv;
> 
>> +    base_v = address >> CSR_DMW_BASE_SH;
>> +    /* Check direct map window 0 */
>> +    base_c = env->CSR_DMWIN0 >> CSR_DMW_BASE_SH;
>> +    if ((plv & env->CSR_DMWIN0) && (base_c == base_v)) {
>> +        *physical = dmwin_va2pa(address);
>> +        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>> +        return TLBRET_MATCH;
>> +    }
>> +    /* Check direct map window 1 */
>> +    base_c = env->CSR_DMWIN1 >> CSR_DMW_BASE_SH;
>> +    if ((plv & env->CSR_DMWIN1) && (base_c == base_v)) {
>> +        *physical = dmwin_va2pa(address);
>> +        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>> +        return TLBRET_MATCH;
>> +    }
> 
> There are more than 2 of these, which is why I suggested putting them in an array, so that you can loop.  Maybe pull this out to a separate function, like the tlb lookup?
> 
>> +    /* Check valid extension */
>> +    tmp = address >> (TARGET_VIRT_ADDR_SPACE_BITS - 1);
>> +    if (!(tmp == 0 || tmp == 0x1ffff)) {
> 
> Better to cast to int64_t first, so that this becomes 0 or -1, without knowing that 64 - TARGET_VIRT_ADDR_SPACE_BITS - 1 -> 0x1ffff.
> 
>> +void loongarch_mmu_init(CPULoongArchState *env)
>> +{
>> +    /* Number of MTLB */
>> +    env->mtlb_size = 64;
>> +
>> +    /* Number of STLB */
>> +    env->stlb_size = 2048;
>> +
>> +    /* For 16KB, ps = 14, compare the bit [47:15] */
>> +    for (int i = 0; i < LOONGARCH_TLB_MAX; i++) {
>> +        env->tlb[i].tlb_misc = FIELD_DP64(env->tlb[i].tlb_misc, TLB_MISC, E, 0);
>> +    }
> 
> Just memset the whole thing?

yes, the tlb is empty at the start.

> 
>> +bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>> +                            MMUAccessType access_type, int mmu_idx,
>> +                            bool probe, uintptr_t retaddr)
>> +{
>> +    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
>> +    CPULoongArchState *env = &cpu->env;
>> +    hwaddr physical;
>> +    int prot;
>> +    int ret = TLBRET_BADADDR;
>> +
>> +    /* Data access */
>> +    /* XXX: put correct access by using cpu_restore_state() correctly */
>> +    ret = get_physical_address(env, &physical, &prot, address,
>> +                               access_type, mmu_idx);
>> +    switch (ret) {
>> +    case TLBRET_MATCH:
>> +        qemu_log_mask(CPU_LOG_MMU,
>> +                      "%s address=%" VADDR_PRIx " physical " TARGET_FMT_plx
>> +                      " prot %d\n", __func__, address, physical, prot);
>> +        break;
>> +    default:
>> +        qemu_log_mask(CPU_LOG_MMU,
>> +                      "%s address=%" VADDR_PRIx " ret %d\n", __func__, address,
>> +                      ret);
>> +        break;
>> +    }
>> +    if (ret == TLBRET_MATCH) {
>> +        tlb_set_page(cs, address & TARGET_PAGE_MASK,
>> +                     physical & TARGET_PAGE_MASK, prot,
>> +                     mmu_idx, TARGET_PAGE_SIZE);
>> +        return true;
> 
> Merge the above switch into this?
> 
>> +    }
>> +    if (probe) {
>> +        return false;
>> +    } else {
>> +        raise_mmu_exception(env, address, access_type, ret);
>> +        do_raise_exception(env, cs->exception_index, retaddr);
>> +    }
>> +}
>>
> 
> 
> r~



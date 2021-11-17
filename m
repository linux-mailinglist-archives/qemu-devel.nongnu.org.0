Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFDB4541DC
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 08:31:16 +0100 (CET)
Received: from localhost ([::1]:48208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnFPX-0007dk-1T
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 02:31:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mnFNd-0006wC-Oe
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 02:29:17 -0500
Received: from mail.loongson.cn ([114.242.206.163]:44612 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mnFNa-00012G-9z
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 02:29:17 -0500
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx77M+r5RhM80AAA--.4604S3;
 Wed, 17 Nov 2021 15:29:02 +0800 (CST)
Subject: Re: [RFC PATCH v2 09/30] target/loongarch: Add TLB instruction support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-10-git-send-email-yangxiaojuan@loongson.cn>
 <f1059243-06e9-d9d8-673a-55fc6e31b5cc@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <a268c269-7a3d-b8c6-5e69-786fbd238b05@loongson.cn>
Date: Wed, 17 Nov 2021 15:29:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <f1059243-06e9-d9d8-673a-55fc6e31b5cc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dx77M+r5RhM80AAA--.4604S3
X-Coremail-Antispam: 1UD129KBjvJXoWxtFW8Kr13Cw1Dtr4xWFyxGrg_yoWfKFW5pF
 Z8K3yqyFy7KFZYyF13Jws0kr1DXw10yan7twsrWFyFyrs7Zwn5XFWv9ryIkFyIyrn8AF4U
 AF1YyryUWF13JFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9C14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VAC
 jcxG62k0Y48FwI0_Jr0_Gr1lYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r
 4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I
 648v4I1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
 8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
 xVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
 AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8I
 cIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
 v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUFjgxUUUUU=
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

On 11/12/2021 02:14 AM, Richard Henderson wrote:
> On 11/11/21 2:35 AM, Xiaojuan Yang wrote:
>> +static bool trans_tlbwr(DisasContext *ctx, arg_tlbwr *a)
>> +{
>> +    gen_helper_check_plv(cpu_env);
>> +    gen_helper_tlbwr(cpu_env);
>> +    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
>> +    ctx->base.is_jmp = DISAS_EXIT;
>> +    return true;
>> +}
> 
> I think you can skip the EXIT if paging is disabled, which it usually will be in the software tlb handler.  You'd be able to tell with the mmu_idx being the one you use for paging disabled.

The paging disabled only enabled at the bios startup, we can get the phys address directly, tlbwr instruction will not be used when paging enabled.

> 
>> +static void loongarch_invalidate_tlb_entry(CPULoongArchState *env,
>> +                                           loongarch_tlb *tlb)
>> +{
>> +    CPUState *cs = env_cpu(env);
>> +    target_ulong addr, end, mask;
>> +    int tlb_v0, tlb_v1;
>> +    uint64_t tlb_vppn;
>> +    uint8_t tlb_ps;
>> +
>> +    tlb_v0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, V);
>> +    tlb_v1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, V);
>> +    tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
>> +    tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
>> +    mask = (1 << (1 + tlb_ps)) - 1;
> 
> MAKE_64BIT_MASK.
> 
>> +
>> +    if (tlb_v0) {
>> +        addr = tlb_vppn & ~mask;    /* xxx...xxx[0]000..0000 */
>> +        end = addr | (mask >> 1);   /* xxx...xxx[0]111..1111 */
>> +        while (addr < end) {
>> +            tlb_flush_page(cs, addr);
>> +            addr += TARGET_PAGE_SIZE;
> 
> tlb_flush_range_by_mmuidx.
> 
>> +    tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, VPPN, csr_vppn);
>> +    tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 1);
>> +    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
>> +    tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, ASID, csr_asid);
>> +
>> +    csr_g = FIELD_EX64(env->CSR_TLBELO0, CSR_TLBELO0, G) &
>> +             FIELD_EX64(env->CSR_TLBELO1, CSR_TLBELO1, G);
>> +    tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, G, csr_g);
>> +
>> +    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, V,
>> +                                 FIELD_EX64(lo0, CSR_TLBELO0, V));/* [0] */
>> +    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, D,
>> +                                 FIELD_EX64(lo0, CSR_TLBELO0, D));/* [1] */
>> +    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, PLV,
>> +                                 FIELD_EX64(lo0, CSR_TLBELO0, PLV));/* [3:2] */
>> +    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, MAT,
>> +                                 FIELD_EX64(lo0, CSR_TLBELO0, MAT));/* [5:4] */
>> +    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, PPN,
>> +                                 FIELD_EX64(lo0, CSR_TLBELO0, PPN));/* [47:12] */
>> +    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, NR,
>> +                                 FIELD_EX64(lo0, CSR_TLBELO0, NR));/* [61] */
>> +    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, NX,
>> +                                 FIELD_EX64(lo0, CSR_TLBELO0, NX));/* [62] */
>> +    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, RPLV,
>> +                                 FIELD_EX64(lo0, CSR_TLBELO0, RPLV));/* [63] */
>> +
>> +    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, V,
>> +                                 FIELD_EX64(lo1, CSR_TLBELO1, V));/* [0] */
>> +    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, D,
>> +                                 FIELD_EX64(lo1, CSR_TLBELO1, D));/* [1] */
>> +    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, PLV,
>> +                                 FIELD_EX64(lo1, CSR_TLBELO1, PLV));/* [3:2] */
>> +    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, MAT,
>> +                                 FIELD_EX64(lo1, CSR_TLBELO1, MAT));/* [5:4] */
>> +    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, PPN,
>> +                                 FIELD_EX64(lo1, CSR_TLBELO1, PPN));/* [47:12] */
>> +    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, NR,
>> +                                 FIELD_EX64(lo1, CSR_TLBELO1, NR));/* [61] */
>> +    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, NX,
>> +                                 FIELD_EX64(lo1, CSR_TLBELO1, NX));/* [62] */
>> +    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, RPLV,
>> +                                 FIELD_EX64(lo1, CSR_TLBELO1, RPLV));/* [63] */
> 
> The point of making the two values have the same field layout is so that you can just assign the whole value across, not extract and re-deposit each field.

Yes, it is much simpler when use the same field layout.

> 
>> +void helper_tlbsrch(CPULoongArchState *env)
>> +{
>> +    loongarch_tlb *tlb;
>> +    uint64_t vpn, tlb_vppn;
>> +    uint16_t csr_asid, tlb_asid, tlb_ps, tlb_e, tlb_g;
>> +
>> +    int stlb_size = env->stlb_size;
>> +    int mtlb_size = env->mtlb_size;
>> +    int i;
>> +    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
>> +
>> +    /* Search MTLB + STLB */
>> +    for (i = 0; i < stlb_size + mtlb_size; ++i) {
>> +        tlb = &env->tlb[i];
>> +        vpn = FIELD_EX64(env->CSR_TLBEHI, CSR_TLBEHI, VPPN);
>> +        tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
>> +        tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
>> +        tlb_e = FIELD_EX64(tlb->tlb_misc, TLB_MISC, E);
>> +        tlb_g = FIELD_EX64(tlb->tlb_misc, TLB_MISC, G);
>> +        tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
>> +
>> +        if ((tlb_g == 1 || tlb_asid == csr_asid) &&
>> +            (vpn >> (tlb_ps + 1 - 13) == tlb_vppn >> (tlb_ps + 1 - 13)) && tlb_e) {
>> +            env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX,
>> +                                         INDEX, (i & 0xfff));
>> +            env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX,
>> +                                         PS, (tlb_ps & 0x3f));
>> +            return;
>> +        }
>> +    }
>> +
>> +    env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX, NE, 1);
>> +}
> 
> Surely this should share code with loongarch_map_address.
> 
>> +
>> +void helper_tlbrd(CPULoongArchState *env)
>> +{
>> +    loongarch_tlb *tlb;
>> +    int idx;
>> +    uint16_t csr_asid, tlb_asid;
>> +    uint8_t tlb_ps, tlb_e, tlb_v0, tlb_v1, tlb_d0, tlb_d1;
>> +    uint8_t tlb_plv0, tlb_plv1, tlb_mat0, tlb_mat1, tlb_g;
>> +    uint64_t tlb_ppn0, tlb_ppn1;
>> +    uint8_t tlb_nr0, tlb_nr1, tlb_nx0, tlb_nx1, tlb_rplv0, tlb_rplv1;
>> +
>> +    idx = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX);
>> +    tlb = &env->tlb[idx];
>> +
>> +    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
>> +    tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
>> +    tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
>> +    tlb_e = FIELD_EX64(tlb->tlb_misc, TLB_MISC, E);
>> +    tlb_g = FIELD_EX64(tlb->tlb_misc, TLB_MISC, G);
>> +
>> +    tlb_v0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, V);
>> +    tlb_d0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, D);
>> +    tlb_plv0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, PLV);
>> +    tlb_mat0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, MAT);
>> +    tlb_ppn0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, PPN);
>> +    tlb_nr0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, NR);
>> +    tlb_nx0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, NX);
>> +    tlb_rplv0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, RPLV);
>> +
>> +    tlb_v1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, V);
>> +    tlb_d1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, D);
>> +    tlb_plv1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, PLV);
>> +    tlb_mat1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, MAT);
>> +    tlb_ppn1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, PPN);
>> +    tlb_nr1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, NR);
>> +    tlb_nx1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, NX);
>> +    tlb_rplv1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, RPLV);
>> +
>> +    if (csr_asid != tlb_asid) {
>> +        cpu_loongarch_tlb_flush(env);
> 
> Why?  Surely the index selected should not have matched on the previous search?

yes, I will modify.

> 
>> +    } else {
>> +        /* Valid TLB entry */
>> +        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX,
>> +                                     INDEX, (idx & 0xfff));
>> +        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX,
>> +                                     PS, (tlb_ps & 0x3f));
>> +
>> +        env->CSR_TLBEHI = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN) << 13;
>> +
>> +        env->CSR_TLBELO0 = FIELD_DP64(0, CSR_TLBELO0, V, tlb_v0);
>> +        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, D, tlb_d0);
>> +        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, PLV, tlb_plv0);
>> +        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, MAT, tlb_mat0);
>> +        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, G, tlb_g);
>> +        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, PPN, tlb_ppn0);
>> +        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, NR, tlb_nr0);
>> +        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, NX, tlb_nx0);
>> +        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, RPLV, tlb_rplv0);
>> +
>> +        env->CSR_TLBELO1 = FIELD_DP64(0, CSR_TLBELO1, V, tlb_v1);
>> +        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, D, tlb_d1);
>> +        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, PLV, tlb_plv1);
>> +        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, MAT, tlb_mat1);
>> +        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, G, tlb_g);
>> +        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, PPN, tlb_ppn1);
>> +        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, NR, tlb_nr1);
>> +        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, NX, tlb_nx1);
>> +        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, RPLV, 
> 
> Again, these should easily copy across.
> 
>> +    env->CSR_ASID  = FIELD_DP64(env->CSR_ASID, CSR_ASID, ASID, tlb_asid);
> 
> The documentation for TLBRD does not mention modifications to the current ASID.
> 
>> +    default:
>> +        do_raise_exception(env, EXCP_INE, GETPC());
> 
> You can detect this during translation, and dispatch to the appropriate invtlb sub-function.
> 
oh, sorry, I don't quiet understand this. detect during the translation sees more complicated.

Xiaojuan,
Thanks
> 
> r~



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A245F35EA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 20:54:33 +0200 (CEST)
Received: from localhost ([::1]:47324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofQaG-0001o6-5M
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 14:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1ofQFF-0007HR-E7; Mon, 03 Oct 2022 14:32:49 -0400
Received: from [200.168.210.66] (port=21064 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1ofQFD-0003Op-5p; Mon, 03 Oct 2022 14:32:49 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 3 Oct 2022 15:32:39 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 515C78002C5;
 Mon,  3 Oct 2022 15:32:39 -0300 (-03)
Message-ID: <2ae7b41c-0a1a-dc2a-d7cf-bb14096f524f@eldorado.org.br>
Date: Mon, 3 Oct 2022 15:32:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: Re: [PATCH v3] tcg/ppc: Optimize 26-bit jumps
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: npiggin@gmail.com, richard.henderson@linaro.org
References: <20220919175614.32879-1-leandro.lupori@eldorado.org.br>
Content-Language: en-US
In-Reply-To: <20220919175614.32879-1-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 03 Oct 2022 18:32:39.0643 (UTC)
 FILETIME=[846E9AB0:01D8D756]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.467,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/19/22 14:56, Leandro Lupori wrote:
> PowerPC64 processors handle direct branches better than indirect
> ones, resulting in less stalled cycles and branch misses.
> 
> However, PPC's tb_target_set_jmp_target() was only using direct
> branches for 16-bit jumps, while PowerPC64's unconditional branch
> instructions are able to handle displacements of up to 26 bits.
> To take advantage of this, now jumps whose displacements fit in
> between 17 and 26 bits are also converted to direct branches.
> 
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
> v3:
>    - make goto tb code 16-byte aligned
>    - code cleanup
> 

Ping?

Does v3 look good now?

Regards,
Leandro

> v2: use stq to replace all instructions atomically
> 
>   tcg/ppc/tcg-target.c.inc | 105 +++++++++++++++++++++++++++------------
>   1 file changed, 74 insertions(+), 31 deletions(-)
> 
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 1cbd047ab3..0cde11c3de 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -1847,44 +1847,87 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
>       tcg_out32(s, insn);
>   }
>   
> -void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
> -                              uintptr_t jmp_rw, uintptr_t addr)
> +static inline uint64_t make_pair(tcg_insn_unit i1, tcg_insn_unit i2)
>   {
> -    if (TCG_TARGET_REG_BITS == 64) {
> -        tcg_insn_unit i1, i2;
> -        intptr_t tb_diff = addr - tc_ptr;
> -        intptr_t br_diff = addr - (jmp_rx + 4);
> -        uint64_t pair;
> -
> -        /* This does not exercise the range of the branch, but we do
> -           still need to be able to load the new value of TCG_REG_TB.
> -           But this does still happen quite often.  */
> -        if (tb_diff == (int16_t)tb_diff) {
> -            i1 = ADDI | TAI(TCG_REG_TB, TCG_REG_TB, tb_diff);
> -            i2 = B | (br_diff & 0x3fffffc);
> -        } else {
> -            intptr_t lo = (int16_t)tb_diff;
> -            intptr_t hi = (int32_t)(tb_diff - lo);
> -            assert(tb_diff == hi + lo);
> -            i1 = ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, hi >> 16);
> -            i2 = ADDI | TAI(TCG_REG_TB, TCG_REG_TB, lo);
> -        }
> -#if HOST_BIG_ENDIAN
> -        pair = (uint64_t)i1 << 32 | i2;
> +    if (HOST_BIG_ENDIAN) {
> +        return (uint64_t)i1 << 32 | i2;
> +    }
> +    return (uint64_t)i2 << 32 | i1;
> +}
> +
> +static inline void ppc64_replace2(uintptr_t rx, uintptr_t rw,
> +    tcg_insn_unit i0, tcg_insn_unit i1)
> +{
> +#if TCG_TARGET_REG_BITS == 64
> +    qatomic_set((uint64_t *)rw, make_pair(i0, i1));
> +    flush_idcache_range(rx, rw, 8);
>   #else
> -        pair = (uint64_t)i2 << 32 | i1;
> +    qemu_build_not_reached();
>   #endif
> +}
>   
> -        /* As per the enclosing if, this is ppc64.  Avoid the _Static_assert
> -           within qatomic_set that would fail to build a ppc32 host.  */
> -        qatomic_set__nocheck((uint64_t *)jmp_rw, pair);
> -        flush_idcache_range(jmp_rx, jmp_rw, 8);
> -    } else {
> +static inline void ppc64_replace4(uintptr_t rx, uintptr_t rw,
> +    tcg_insn_unit i0, tcg_insn_unit i1, tcg_insn_unit i2, tcg_insn_unit i3)
> +{
> +    uint64_t p[2];
> +
> +    p[!HOST_BIG_ENDIAN] = make_pair(i0, i1);
> +    p[HOST_BIG_ENDIAN] = make_pair(i2, i3);
> +
> +    asm("mr  %%r6, %1\n\t"
> +        "mr  %%r7, %2\n\t"
> +        "stq %%r6, %0"
> +        : "=Q"(*(__int128 *)rw) : "r"(p[0]), "r"(p[1]) : "r6", "r7");
> +    flush_idcache_range(rx, rw, 16);
> +}
> +
> +void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
> +                              uintptr_t jmp_rw, uintptr_t addr)
> +{
> +    tcg_insn_unit i0, i1, i2, i3;
> +    intptr_t tb_diff = addr - tc_ptr;
> +    intptr_t br_diff = addr - (jmp_rx + 4);
> +    intptr_t lo, hi;
> +
> +    if (TCG_TARGET_REG_BITS == 32) {
>           intptr_t diff = addr - jmp_rx;
>           tcg_debug_assert(in_range_b(diff));
>           qatomic_set((uint32_t *)jmp_rw, B | (diff & 0x3fffffc));
>           flush_idcache_range(jmp_rx, jmp_rw, 4);
> +        return;
> +    }
> +
> +    /*
> +     * This does not exercise the range of the branch, but we do
> +     * still need to be able to load the new value of TCG_REG_TB.
> +     * But this does still happen quite often.
> +     */
> +    if (tb_diff == (int16_t)tb_diff) {
> +        i0 = ADDI | TAI(TCG_REG_TB, TCG_REG_TB, tb_diff);
> +        i1 = B | (br_diff & 0x3fffffc);
> +        ppc64_replace2(jmp_rx, jmp_rw, i0, i1);
> +        return;
> +    }
> +
> +    lo = (int16_t)tb_diff;
> +    hi = (int32_t)(tb_diff - lo);
> +    assert(tb_diff == hi + lo);
> +    i0 = ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, hi >> 16);
> +    i1 = ADDI | TAI(TCG_REG_TB, TCG_REG_TB, lo);
> +    if (!have_isa_2_07) {
> +        ppc64_replace2(jmp_rx, jmp_rw, i0, i1);
> +        return;
> +    }
> +
> +    br_diff -= 4;
> +    if (in_range_b(br_diff)) {
> +        i2 = B | (br_diff & 0x3fffffc);
> +        i3 = NOP;
> +    } else {
> +        i2 = MTSPR | RS(TCG_REG_TB) | CTR;
> +        i3 = BCCTR | BO_ALWAYS;
>       }
> +    ppc64_replace4(jmp_rx, jmp_rw, i0, i1, i2, i3);
>   }
>   
>   static void tcg_out_call_int(TCGContext *s, int lk,
> @@ -2574,8 +2617,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>           if (s->tb_jmp_insn_offset) {
>               /* Direct jump. */
>               if (TCG_TARGET_REG_BITS == 64) {
> -                /* Ensure the next insns are 8-byte aligned. */
> -                if ((uintptr_t)s->code_ptr & 7) {
> +                /* Ensure the next insns are 16-byte aligned. */
> +                while ((uintptr_t)s->code_ptr & 15) {
>                       tcg_out32(s, NOP);
>                   }
>                   s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);



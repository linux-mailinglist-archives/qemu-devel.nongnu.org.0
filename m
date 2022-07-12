Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483A8572124
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 18:41:37 +0200 (CEST)
Received: from localhost ([::1]:44976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBIx5-0004jo-QM
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 12:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1oBIuB-0002Of-SN; Tue, 12 Jul 2022 12:38:35 -0400
Received: from [200.168.210.66] (port=62578 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1oBIuA-0000JF-CV; Tue, 12 Jul 2022 12:38:35 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 12 Jul 2022 13:38:28 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 61BC8800146;
 Tue, 12 Jul 2022 13:38:28 -0300 (-03)
Message-ID: <b17754f8-e041-619d-0a4d-2c1dbce45681@eldorado.org.br>
Date: Tue, 12 Jul 2022 13:38:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 3/3] target/ppc: Check page dir/table base alignment
Content-Language: en-US
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org
References: <20220628133959.15131-1-leandro.lupori@eldorado.org.br>
 <20220628133959.15131-4-leandro.lupori@eldorado.org.br>
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
In-Reply-To: <20220628133959.15131-4-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 12 Jul 2022 16:38:28.0781 (UTC)
 FILETIME=[D0B6C5D0:01D8960D]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 6/28/22 10:39, Leandro Lupori wrote:
> According to PowerISA 3.1B, Book III 6.7.6 programming note, the
> page directory base addresses are expected to be aligned to their
> size. Real hardware seems to rely on that and will access the
> wrong address if they are misaligned. This results in a
> translation failure even if the page tables seem to be properly
> populated.
> 
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
>   target/ppc/mmu-radix64.c | 28 ++++++++++++++++++++++++----
>   1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index 705bff76be..00f2e9fa2e 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -265,7 +265,7 @@ static int ppc_radix64_next_level(AddressSpace *as, vaddr eaddr,
>                                     uint64_t *pte_addr, uint64_t *nls,
>                                     int *psize, uint64_t *pte, int *fault_cause)
>   {
> -    uint64_t index, pde;
> +    uint64_t index, mask, nlb, pde;
>   
>       /* Read page <directory/table> entry from guest address space */
>       pde = ldq_phys(as, *pte_addr);
> @@ -280,7 +280,17 @@ static int ppc_radix64_next_level(AddressSpace *as, vaddr eaddr,
>           *nls = pde & R_PDE_NLS;
>           index = eaddr >> (*psize - *nls);       /* Shift */
>           index &= ((1UL << *nls) - 1);           /* Mask */
> -        *pte_addr = (pde & R_PDE_NLB) + (index * sizeof(pde));
> +        nlb = pde & R_PDE_NLB;
> +        mask = MAKE_64BIT_MASK(0, *nls + 3);
> +
> +        if (nlb & mask) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: misaligned page dir/table base: 0x"TARGET_FMT_lx
> +                " page dir size: 0x"TARGET_FMT_lx"\n",
> +                __func__, nlb, mask + 1);
> +            nlb &= ~mask;
> +        }
> +        *pte_addr = nlb + index * sizeof(pde);
>       }
>       return 0;
>   }
> @@ -294,8 +304,18 @@ static int ppc_radix64_walk_tree(AddressSpace *as, vaddr eaddr,
>       int level = 0;
>   
>       index = eaddr >> (*psize - nls);    /* Shift */
> -    index &= ((1UL << nls) - 1);       /* Mask */
> -    *pte_addr = base_addr + (index * sizeof(pde));
> +    index &= ((1UL << nls) - 1);        /* Mask */
> +    mask = MAKE_64BIT_MASK(0, nls + 3);
> +
> +    if (base_addr & mask) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "%s: misaligned page dir base: 0x"TARGET_FMT_lx
> +            " page dir size: 0x"TARGET_FMT_lx"\n",
> +            __func__, base_addr, mask + 1);
> +        base_addr &= ~mask;
> +    }
> +    *pte_addr = base_addr + index * sizeof(pde);
> +
>       do {
>           int ret;
>   

Is the v3 of this patch ok, now that cpu behavior on misaligned page 
dir/table base is also being emulated?

Thanks,
Leandro


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B12553073
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 13:07:53 +0200 (CEST)
Received: from localhost ([::1]:57220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3bjc-0001O2-Uq
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 07:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o3bhP-0007ek-UW
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 07:05:36 -0400
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:60493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o3bhN-0003W0-DW
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 07:05:35 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.235])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 6237621D99;
 Tue, 21 Jun 2022 11:05:23 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 21 Jun
 2022 13:05:22 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00346fa7e42-6a7e-466e-987f-d4d8db1ca5a9,
 968046EEA762EFF7637E46B232C9329570CD0A04) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5c93bc68-be10-5d47-717f-91964e00e251@kaod.org>
Date: Tue, 21 Jun 2022 13:05:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/3] ppc: Check partition and process table alignment
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, <qemu-devel@nongnu.org>, 
 <qemu-ppc@nongnu.org>
CC: <danielhb413@gmail.com>, <david@gibson.dropbear.id.au>, <groug@kaod.org>
References: <20220620202704.78978-1-leandro.lupori@eldorado.org.br>
 <20220620202704.78978-2-leandro.lupori@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220620202704.78978-2-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b8437f77-70c1-495e-aae0-0ebacb86d7b7
X-Ovh-Tracer-Id: 11957901439202134822
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeffedgfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/20/22 22:27, Leandro Lupori wrote:
> Check if partition and process tables are properly aligned, in
> their size, according to PowerISA 3.1B, Book III 6.7.6 programming
> note. Hardware and KVM also raise an exception in these cases.
> 
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
>   hw/ppc/spapr.c             |  5 +++++
>   hw/ppc/spapr_hcall.c       |  9 +++++++++
>   target/ppc/mmu-book3s-v3.c |  5 +++++
>   target/ppc/mmu-radix64.c   | 17 +++++++++++++----
>   4 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index fd4942e881..4b1f346087 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1329,6 +1329,11 @@ static bool spapr_get_pate(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu,
>           patb = spapr->nested_ptcr & PTCR_PATB;
>           pats = spapr->nested_ptcr & PTCR_PATS;
>   
> +        /* Check if partition table is properly aligned */
> +        if (patb & MAKE_64BIT_MASK(0, pats + 12)) {
> +            return false;
> +        }
> +
>           /* Calculate number of entries */
>           pats = 1ull << (pats + 12 - 4);
>           if (pats <= lpid) {
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index d761a7d0c3..2a73ba8a1d 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -920,6 +920,7 @@ static target_ulong h_register_process_table(PowerPCCPU *cpu,
>       target_ulong page_size = args[2];
>       target_ulong table_size = args[3];
>       target_ulong update_lpcr = 0;
> +    target_ulong table_byte_size;
>       uint64_t cproc;
>   
>       if (flags & ~FLAGS_MASK) { /* Check no reserved bits are set */
> @@ -927,6 +928,14 @@ static target_ulong h_register_process_table(PowerPCCPU *cpu,
>       }
>       if (flags & FLAG_MODIFY) {
>           if (flags & FLAG_REGISTER) {
> +            /* Check process table alignment */
> +            table_byte_size = 1ULL << (table_size + 12);
> +            if (proc_tbl & (table_byte_size - 1)) {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                    "%s: process table not properly aligned: "
> +                    "proc_tbl 0x%lx proc_tbl_size 0x%lx\n",
> +                    __func__, proc_tbl, table_byte_size);
> +            }
I think you might need to use some define for the format. Looks good
otherwise.

Thanks,

C.


>               if (flags & FLAG_RADIX) { /* Register new RADIX process table */
>                   if (proc_tbl & 0xfff || proc_tbl >> 60) {
>                       return H_P2;
> diff --git a/target/ppc/mmu-book3s-v3.c b/target/ppc/mmu-book3s-v3.c
> index f4985bae78..c8f69b3df9 100644
> --- a/target/ppc/mmu-book3s-v3.c
> +++ b/target/ppc/mmu-book3s-v3.c
> @@ -28,6 +28,11 @@ bool ppc64_v3_get_pate(PowerPCCPU *cpu, target_ulong lpid, ppc_v3_pate_t *entry)
>       uint64_t patb = cpu->env.spr[SPR_PTCR] & PTCR_PATB;
>       uint64_t pats = cpu->env.spr[SPR_PTCR] & PTCR_PATS;
>   
> +    /* Check if partition table is properly aligned */
> +    if (patb & MAKE_64BIT_MASK(0, pats + 12)) {
> +        return false;
> +    }
> +
>       /* Calculate number of entries */
>       pats = 1ull << (pats + 12 - 4);
>       if (pats <= lpid) {
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index 21ac958e48..9a8a2e2875 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -383,7 +383,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
>   {
>       CPUState *cs = CPU(cpu);
>       CPUPPCState *env = &cpu->env;
> -    uint64_t offset, size, prtbe_addr, prtbe0, base_addr, nls, index, pte;
> +    uint64_t offset, size, prtb, prtbe_addr, prtbe0, base_addr, nls, index, pte;
>       int fault_cause = 0, h_page_size, h_prot;
>       hwaddr h_raddr, pte_addr;
>       int ret;
> @@ -393,9 +393,18 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
>                     __func__, access_str(access_type),
>                     eaddr, mmu_idx, pid);
>   
> +    prtb = (pate.dw1 & PATE1_R_PRTB);
> +    size = 1ULL << ((pate.dw1 & PATE1_R_PRTS) + 12);
> +    if (prtb & (size - 1)) {
> +        /* Process Table not properly aligned */
> +        if (guest_visible) {
> +            ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_R_BADCONFIG);
> +        }
> +        return 1;
> +    }
> +
>       /* Index Process Table by PID to Find Corresponding Process Table Entry */
>       offset = pid * sizeof(struct prtb_entry);
> -    size = 1ULL << ((pate.dw1 & PATE1_R_PRTS) + 12);
>       if (offset >= size) {
>           /* offset exceeds size of the process table */
>           if (guest_visible) {
> @@ -403,7 +412,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
>           }
>           return 1;
>       }
> -    prtbe_addr = (pate.dw1 & PATE1_R_PRTB) + offset;
> +    prtbe_addr = prtb + offset;
>   
>       if (vhyp_flat_addressing(cpu)) {
>           prtbe0 = ldq_phys(cs->as, prtbe_addr);
> @@ -568,7 +577,7 @@ static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, vaddr eaddr,
>           return false;
>       }
>   
> -    /* Get Process Table */
> +    /* Get Partition Table */
>       if (cpu->vhyp) {
>           PPCVirtualHypervisorClass *vhc;
>           vhc = PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);



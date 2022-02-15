Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7234B68E4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 11:11:42 +0100 (CET)
Received: from localhost ([::1]:35870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuo9-0004BT-Tx
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 05:11:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nJuf7-0007FG-Lb
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 05:02:21 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:48837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nJuej-0004aj-OD
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 05:01:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.173])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 22D03DFF0403;
 Tue, 15 Feb 2022 11:01:55 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 11:01:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004ad930e13-4a03-459c-a89d-6e0b42ec1237,
 9E61FECBC99B7F84222AE0DB6991604CA8A139D0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <56392cde-b5f6-2e47-7980-ec2385e4c280@kaod.org>
Date: Tue, 15 Feb 2022 11:01:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 4/9] target/ppc: add vhyp addressing mode helper for radix
 MMU
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, <qemu-ppc@nongnu.org>
References: <20220215031642.1691873-1-npiggin@gmail.com>
 <20220215031642.1691873-5-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220215031642.1691873-5-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 69f87a9c-9859-4bf9-9ed3-0567b5dbce2c
X-Ovh-Tracer-Id: 8796093025944439776
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeggddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehfrghrohhsrghssehlihhnuhigrdhisghmrdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/22 04:16, Nicholas Piggin wrote:
> The radix on vhyp MMU uses a single-level radix table walk, with the
> partition scope mapping provided by the flat QEMU machine memory.
> 
> A subsequent change will use the two-level radix walk on vhyp in some
> situations, so provide a helper which can abstract that logic.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   target/ppc/mmu-radix64.c | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index df2fec80ce..5535f0fe20 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -354,6 +354,17 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
>       return 0;
>   }
>   
> +/*
> + * The spapr vhc has a flat partition scope provided by qemu memory.
> + */
> +static bool vhyp_flat_addressing(PowerPCCPU *cpu)
> +{
> +    if (cpu->vhyp) {
> +        return true;
> +    }
> +    return false;
> +}
> +
>   static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
>                                               MMUAccessType access_type,
>                                               vaddr eaddr, uint64_t pid,
> @@ -385,7 +396,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
>       }
>       prtbe_addr = (pate.dw1 & PATE1_R_PRTB) + offset;
>   
> -    if (cpu->vhyp) {
> +    if (vhyp_flat_addressing(cpu)) {
>           prtbe0 = ldq_phys(cs->as, prtbe_addr);
>       } else {
>           /*
> @@ -411,7 +422,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
>       *g_page_size = PRTBE_R_GET_RTS(prtbe0);
>       base_addr = prtbe0 & PRTBE_R_RPDB;
>       nls = prtbe0 & PRTBE_R_RPDS;
> -    if (msr_hv || cpu->vhyp) {
> +    if (msr_hv || vhyp_flat_addressing(cpu)) {
>           /*
>            * Can treat process table addresses as real addresses
>            */
> @@ -515,7 +526,7 @@ static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, vaddr eaddr,
>       relocation = !mmuidx_real(mmu_idx);
>   
>       /* HV or virtual hypervisor Real Mode Access */
> -    if (!relocation && (mmuidx_hv(mmu_idx) || cpu->vhyp)) {
> +    if (!relocation && (mmuidx_hv(mmu_idx) || vhyp_flat_addressing(cpu))) {
>           /* In real mode top 4 effective addr bits (mostly) ignored */
>           *raddr = eaddr & 0x0FFFFFFFFFFFFFFFULL;
>   
> @@ -592,7 +603,7 @@ static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, vaddr eaddr,
>           g_raddr = eaddr & R_EADDR_MASK;
>       }
>   
> -    if (cpu->vhyp) {
> +    if (vhyp_flat_addressing(cpu)) {
>           *raddr = g_raddr;
>       } else {
>           /*
> 



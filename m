Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0574B68D5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 11:08:53 +0100 (CET)
Received: from localhost ([::1]:56756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJulQ-0007vd-Ka
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 05:08:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nJugZ-0001Y0-GM
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 05:03:52 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:53431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nJugX-0004na-4n
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 05:03:51 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 074EBDFF08A9;
 Tue, 15 Feb 2022 11:03:47 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 11:03:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0032142d5f9-5ce7-458c-b4f6-1084bce6169c,
 9E61FECBC99B7F84222AE0DB6991604CA8A139D0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <756e5841-8248-196d-9a9a-4d8cb2148a03@kaod.org>
Date: Tue, 15 Feb 2022 11:03:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 5/9] target/ppc: make vhyp get_pate method take lpid and
 return success
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, <qemu-ppc@nongnu.org>
References: <20220215031642.1691873-1-npiggin@gmail.com>
 <20220215031642.1691873-6-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220215031642.1691873-6-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0cdb2f91-ba74-4dcf-b8f4-c800bcab5dae
X-Ovh-Tracer-Id: 8827618223443446752
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeggddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhgrrhhoshgrsheslhhinhhugidrihgsmhdrtghomh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> In prepartion for implementing a full partition table option for
> vhyp, update the get_pate method to take an lpid and return a
> success/fail indicator.
> 
> The spapr implementation currently just asserts lpid is always 0
> and always return success.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



> ---
>   hw/ppc/spapr.c           | 7 ++++++-
>   target/ppc/cpu.h         | 3 ++-
>   target/ppc/mmu-radix64.c | 7 ++++++-
>   3 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 15a02d3e78..1892a29e2d 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1309,13 +1309,18 @@ void spapr_set_all_lpcrs(target_ulong value, target_ulong mask)
>       }
>   }
>   
> -static void spapr_get_pate(PPCVirtualHypervisor *vhyp, ppc_v3_pate_t *entry)
> +static bool spapr_get_pate(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu,
> +                           target_ulong lpid, ppc_v3_pate_t *entry)
>   {
>       SpaprMachineState *spapr = SPAPR_MACHINE(vhyp);
>   
> +    assert(lpid == 0);
> +
>       /* Copy PATE1:GR into PATE0:HR */
>       entry->dw0 = spapr->patb_entry & PATE0_HR;
>       entry->dw1 = spapr->patb_entry;
> +
> +    return true;
>   }
>   
>   #define HPTE(_table, _i)   (void *)(((uint64_t *)(_table)) + ((_i) * 2))
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 555c6b9245..c79ae74f10 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1320,7 +1320,8 @@ struct PPCVirtualHypervisorClass {
>                           hwaddr ptex, int n);
>       void (*hpte_set_c)(PPCVirtualHypervisor *vhyp, hwaddr ptex, uint64_t pte1);
>       void (*hpte_set_r)(PPCVirtualHypervisor *vhyp, hwaddr ptex, uint64_t pte1);
> -    void (*get_pate)(PPCVirtualHypervisor *vhyp, ppc_v3_pate_t *entry);
> +    bool (*get_pate)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu,
> +                     target_ulong lpid, ppc_v3_pate_t *entry);
>       target_ulong (*encode_hpt_for_kvm_pr)(PPCVirtualHypervisor *vhyp);
>       void (*cpu_exec_enter)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
>       void (*cpu_exec_exit)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index 5535f0fe20..3b6d75a292 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -563,7 +563,12 @@ static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, vaddr eaddr,
>       if (cpu->vhyp) {
>           PPCVirtualHypervisorClass *vhc;
>           vhc = PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
> -        vhc->get_pate(cpu->vhyp, &pate);
> +        if (!vhc->get_pate(cpu->vhyp, cpu, lpid, &pate)) {
> +            if (guest_visible) {
> +                ppc_radix64_raise_hsi(cpu, access_type, eaddr, eaddr, DSISR_R_BADCONFIG);
> +            }
> +            return false;
> +        }
>       } else {
>           if (!ppc64_v3_get_pate(cpu, lpid, &pate)) {
>               if (guest_visible) {
> 



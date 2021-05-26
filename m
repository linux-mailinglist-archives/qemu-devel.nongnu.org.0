Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09F7391BD9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 17:25:30 +0200 (CEST)
Received: from localhost ([::1]:47600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llvPW-0005tk-0F
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 11:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1llvOb-00052f-GA
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:24:33 -0400
Received: from 5.mo51.mail-out.ovh.net ([188.165.49.213]:53546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1llvOY-0006e8-KF
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:24:33 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.177])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 3A7E42A47DE;
 Wed, 26 May 2021 17:24:27 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Wed, 26 May
 2021 17:24:27 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00266e15ca6-94af-487d-b17c-120fbd7485bd,
 F9DA3623319ED0F0AA7DDB86DED9F5F6BB22336A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH v1 2/3] spapr: Set LPCR to current AIL mode when starting
 a new CPU
To: Nicholas Piggin <npiggin@gmail.com>, <qemu-ppc@nongnu.org>
References: <20210526091626.3388262-1-npiggin@gmail.com>
 <20210526091626.3388262-3-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <472ba73d-f909-93d1-0700-5a7bfc449997@kaod.org>
Date: Wed, 26 May 2021 17:24:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210526091626.3388262-3-npiggin@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ec91b801-c17b-4f97-a947-8860a1bf3a0c
X-Ovh-Tracer-Id: 7506093205757660128
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdekfedgkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepnhhpihhgghhinhesghhmrghilhdrtghomh
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 11:16 AM, Nicholas Piggin wrote:
> TCG does not keep track of AIL mode in a central place, it's based on
> the current LPCR[AIL] bits. Synchronize the new CPU's LPCR to the
> current LPCR in rtas_start_cpu(), similarly to the way the ILE bit is
> synchronized.
> 
> Open-code the ILE setting as well now that the caller's LPCR is
> available directly, there is no need for the indirection.

That's two patches in one but no big deal.

> 
> Without this, under both TCG and KVM, adding a POWER8/9/10 class CPU
> with a new core ID after a modern Linux has booted results in the new
> CPU's LPCR missing the LPCR[AIL]=0b11 setting that the other CPUs have.
> This can cause crashes and unexpected behaviour.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

C.

> ---
>  hw/ppc/spapr_rtas.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 63d96955c0..b476382ae6 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -132,8 +132,8 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, SpaprMachineState *spapr,
>      target_ulong id, start, r3;
>      PowerPCCPU *newcpu;
>      CPUPPCState *env;
> -    PowerPCCPUClass *pcc;
>      target_ulong lpcr;
> +    target_ulong caller_lpcr;
>  
>      if (nargs != 3 || nret != 1) {
>          rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);
> @@ -152,7 +152,6 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, SpaprMachineState *spapr,
>      }
>  
>      env = &newcpu->env;
> -    pcc = POWERPC_CPU_GET_CLASS(newcpu);
>  
>      if (!CPU(newcpu)->halted) {
>          rtas_st(rets, 0, RTAS_OUT_HW_ERROR);
> @@ -164,10 +163,15 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, SpaprMachineState *spapr,
>      env->msr = (1ULL << MSR_SF) | (1ULL << MSR_ME);
>      hreg_compute_hflags(env);
>  
> +    caller_lpcr = callcpu->env.spr[SPR_LPCR];
>      lpcr = env->spr[SPR_LPCR];
> -    if (!pcc->interrupts_big_endian(callcpu)) {
> -        lpcr |= LPCR_ILE;
> -    }
> +
> +    /* Set ILE the same way */
> +    lpcr = (lpcr & ~LPCR_ILE) | (caller_lpcr & LPCR_ILE);
> +
> +    /* Set AIL the same way */
> +    lpcr = (lpcr & ~LPCR_AIL) | (caller_lpcr & LPCR_AIL);
> +
>      if (env->mmu_model == POWERPC_MMU_3_00) {
>          /*
>           * New cpus are expected to start in the same radix/hash mode
> 



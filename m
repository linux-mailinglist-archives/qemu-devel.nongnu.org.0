Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D4049B3DC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 13:23:11 +0100 (CET)
Received: from localhost ([::1]:54472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCKqs-0007Xu-9p
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 07:23:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCKgA-0005sT-1H
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 07:12:06 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:48241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCKfp-00028p-PN
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 07:12:02 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.6])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D18FD22071;
 Tue, 25 Jan 2022 12:11:40 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 25 Jan
 2022 13:11:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0014c3a6cba-8823-441e-8e9a-84fbcf3d8b98,
 81DEFC5675B4A2B0B4575F732D37872089199EF9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f395f172-f13e-94d2-5931-bbf84721b73d@kaod.org>
Date: Tue, 25 Jan 2022 13:11:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 4/5] target/ppc: books: External interrupt cleanup
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220124184605.999353-1-farosas@linux.ibm.com>
 <20220124184605.999353-5-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220124184605.999353-5-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 04527476-3764-4f48-9a9c-2d45ec4948ea
X-Ovh-Tracer-Id: 16788293514345941923
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgdefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomh
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/24/22 19:46, Fabiano Rosas wrote:
> Since this is now BookS only, we can simplify the code a bit and check
> has_hv_mode instead of enumerating the exception models. LPES0 does
> not make sense if there is no MSR_HV.
> 
> Note that QEMU does not support HV mode on 970 and POWER5+ so we don't
> set MSR_HV in msr_mask.

HV mode is not supported on POWER7 also.

> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Anyhow,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   target/ppc/excp_helper.c | 30 +++++++-----------------------
>   1 file changed, 7 insertions(+), 23 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index e5f09e1984..67faec3775 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -644,39 +644,23 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>       {
>           bool lpes0;
>   
> -        cs = CPU(cpu);
> -
>           /*
> -         * Exception targeting modifiers
> -         *
> -         * LPES0 is supported on POWER7/8/9
> -         * LPES1 is not supported (old iSeries mode)
> -         *
> -         * On anything else, we behave as if LPES0 is 1
> -         * (externals don't alter MSR:HV)
> +         * LPES0 is only taken into consideration if we support HV
> +         * mode for this CPU.
>            */
> -#if defined(TARGET_PPC64)
> -        if (excp_model == POWERPC_EXCP_POWER7 ||
> -            excp_model == POWERPC_EXCP_POWER8 ||
> -            excp_model == POWERPC_EXCP_POWER9 ||
> -            excp_model == POWERPC_EXCP_POWER10) {
> -            lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
> -        } else
> -#endif /* defined(TARGET_PPC64) */
> -        {
> -            lpes0 = true;
> +        if (!env->has_hv_mode) {
> +            break;
>           }
>   
> +        lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
> +
>           if (!lpes0) {
>               new_msr |= (target_ulong)MSR_HVB;
>               new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
>               srr0 = SPR_HSRR0;
>               srr1 = SPR_HSRR1;
>           }
> -        if (env->mpic_proxy) {
> -            /* IACK the IRQ on delivery */
> -            env->spr[SPR_BOOKE_EPR] = ldl_phys(cs->as, env->mpic_iack);
> -        }
> +
>           break;
>       }
>       case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
> 



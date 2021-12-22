Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBA547CD9D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 08:39:58 +0100 (CET)
Received: from localhost ([::1]:59318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzwE9-0008Sj-U9
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 02:39:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mzvQS-0002hy-6G
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 01:48:36 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:55467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mzvQQ-0006Ic-CR
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 01:48:35 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.68])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C87D5214E6;
 Wed, 22 Dec 2021 06:48:27 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 07:48:27 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002ed3cd0ea-be21-4cd6-89fc-48148dcc36e5,
 22B606D71DB07679CF58DDA73D3573C2F131FB73) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <64060077-d577-6fe1-e942-c99a39509884@kaod.org>
Date: Wed, 22 Dec 2021 07:48:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC v2 03/12] target/ppc: powerpc_excp: Move system call
 vectored code together
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
 <20211220181903.3456898-4-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211220181903.3456898-4-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 16cfa9eb-13aa-4718-92df-48df23231df2
X-Ovh-Tracer-Id: 14572241020601404198
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddthedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepnhhpihhgghhinhesghhmrghilhdrtghomh
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.694,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding Nicholas.

On 12/20/21 19:18, Fabiano Rosas wrote:
> Now that 'vector' is known before calling the interrupt-specific setup
> code, we can move all of the scv setup into one place.
> 
> No functional change intended.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.
     

> ---
>   target/ppc/excp_helper.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 14fd0213a0..7bdc1e8410 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -549,6 +549,11 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>           env->nip += 4;
>           new_msr |= env->msr & ((target_ulong)1 << MSR_EE);
>           new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
> +
> +        vector += lev * 0x20;
> +
> +        env->lr = env->nip;
> +        env->ctr = msr;
>           break;
>       case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
>       case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable          */
> @@ -862,14 +867,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>   
>           /* Save MSR */
>           env->spr[srr1] = msr;
> -
> -#if defined(TARGET_PPC64)
> -    } else {
> -        vector += lev * 0x20;
> -
> -        env->lr = env->nip;
> -        env->ctr = msr;
> -#endif
>       }
>   
>       /* This can update new_msr and vector if AIL applies */
> 



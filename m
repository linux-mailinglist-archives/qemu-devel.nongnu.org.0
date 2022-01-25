Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C19549B2C9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 12:18:14 +0100 (CET)
Received: from localhost ([::1]:44052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJq1-0001We-K7
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 06:18:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCJmC-0006Tk-4V
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:14:16 -0500
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:41129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCJm8-0007Pk-Fx
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:14:15 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.240])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 8B6DB21015;
 Tue, 25 Jan 2022 11:14:08 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 25 Jan
 2022 12:14:07 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006480be186-772f-44d0-adc8-367c46db1b7a,
 81DEFC5675B4A2B0B4575F732D37872089199EF9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b51d7529-8cf2-3cd8-2689-d60cc2c22aab@kaod.org>
Date: Tue, 25 Jan 2022 12:14:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] target/ppc/mmu_common: Fix SRR1/MSR error code on Book-E
Content-Language: en-US
To: Vitaly Cheptsov <cheptsov@ispras.ru>, <qemu-devel@nongnu.org>
References: <20220121093107.15478-1-cheptsov@ispras.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220121093107.15478-1-cheptsov@ispras.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c82a2fb7-0613-4219-b91c-e26fbd417b08
X-Ovh-Tracer-Id: 15816641895350766441
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: qemu-stable@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/22 10:31, Vitaly Cheptsov wrote:
> Book-E architecture does not set the error code in 31:27 bits
> of SRR1, but instead uses these bits for custom fields such
> as GS (Guest Supervisor).
> 
> Wrongly setting these fields will result in QEMU crashes
> when attempting to execute not executable code due to the attempts
> to use Guest Supervisor mode.
> 
> Cc: "Cédric Le Goater" <clg@kaod.org>
> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: qemu-ppc@nongnu.org
> Cc: qemu-devel@nongnu.org
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   target/ppc/mmu_common.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
> index 91270c1f17..6512ee031c 100644
> --- a/target/ppc/mmu_common.c
> +++ b/target/ppc/mmu_common.c
> @@ -1367,22 +1367,34 @@ static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr eaddr,
>               case -2:
>                   /* Access rights violation */
>                   cs->exception_index = POWERPC_EXCP_ISI;
> -                env->error_code = 0x08000000;
> +                if ((env->mmu_model == POWERPC_MMU_BOOKE) ||
> +                    (env->mmu_model == POWERPC_MMU_BOOKE206)) {
> +                    env->error_code = 0;
> +                } else {
> +                    env->error_code = 0x08000000;
> +                }
>                   break;
>               case -3:
>                   /* No execute protection violation */
>                   if ((env->mmu_model == POWERPC_MMU_BOOKE) ||
>                       (env->mmu_model == POWERPC_MMU_BOOKE206)) {
>                       env->spr[SPR_BOOKE_ESR] = 0x00000000;
> +                    env->error_code = 0;
> +                } else {
> +                    env->error_code = 0x10000000;
>                   }
>                   cs->exception_index = POWERPC_EXCP_ISI;
> -                env->error_code = 0x10000000;
>                   break;
>               case -4:
>                   /* Direct store exception */
>                   /* No code fetch is allowed in direct-store areas */
>                   cs->exception_index = POWERPC_EXCP_ISI;
> -                env->error_code = 0x10000000;
> +                if ((env->mmu_model == POWERPC_MMU_BOOKE) ||
> +                    (env->mmu_model == POWERPC_MMU_BOOKE206)) {
> +                    env->error_code = 0;
> +                } else {
> +                    env->error_code = 0x10000000;
> +                }
>                   break;
>               }
>           } else {
> 



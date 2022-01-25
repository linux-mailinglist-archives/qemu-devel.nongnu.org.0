Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BC249B3F0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 13:28:32 +0100 (CET)
Received: from localhost ([::1]:59340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCKw3-0002bC-9M
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 07:28:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCKgb-00063k-Tg
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 07:12:39 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:38579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCKgY-0002AP-8o
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 07:12:31 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.177])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 377AE22064;
 Tue, 25 Jan 2022 12:12:07 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 25 Jan
 2022 13:12:06 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0013bf0c745-07b4-48dd-b580-2af31eec6438,
 B12793B896D1C92594B08C8AD2B724DCB3CD44CA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <30facc0c-a9c9-04b7-c220-d3755f87e176@kaod.org>
Date: Tue, 25 Jan 2022 13:11:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 5/5] target/ppc: books: Program exception cleanup
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220124184605.999353-1-farosas@linux.ibm.com>
 <20220124184605.999353-6-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220124184605.999353-6-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a65fd486-59ac-4df8-a2ad-416d9ef967b0
X-Ovh-Tracer-Id: 16795893337106385827
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgdefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomh
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/24/22 19:46, Fabiano Rosas wrote:
> Remove setting of BookE registers.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   target/ppc/excp_helper.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 67faec3775..d1cce76e75 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -688,20 +688,16 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>                * precise in the MSR.
>                */
>               msr |= 0x00100000;
> -            env->spr[SPR_BOOKE_ESR] = ESR_FP;
>               break;
>           case POWERPC_EXCP_INVAL:
>               trace_ppc_excp_inval(env->nip);
>               msr |= 0x00080000;
> -            env->spr[SPR_BOOKE_ESR] = ESR_PIL;
>               break;
>           case POWERPC_EXCP_PRIV:
>               msr |= 0x00040000;
> -            env->spr[SPR_BOOKE_ESR] = ESR_PPR;
>               break;
>           case POWERPC_EXCP_TRAP:
>               msr |= 0x00020000;
> -            env->spr[SPR_BOOKE_ESR] = ESR_PTR;
>               break;
>           default:
>               /* Should never occur */
> 



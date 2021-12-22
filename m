Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7F247CD8A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 08:29:37 +0100 (CET)
Received: from localhost ([::1]:48124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzw47-0000PY-Vu
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 02:29:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mzvQT-0002j8-I4
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 01:48:39 -0500
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:36743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mzvQQ-0006Io-Ct
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 01:48:37 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.97])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id EEB8E214C9;
 Wed, 22 Dec 2021 06:48:28 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 07:48:25 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0017e4b0bd5-bafc-464f-a858-d596db03e572,
 F3A2961E859DEC74025AEDD5EF8A0801F50DF014) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7ca73e67-6578-29ca-c2a2-6ac2e294b04c@kaod.org>
Date: Wed, 22 Dec 2021 07:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC v2 02/12] target/ppc: powerpc_excp: Set vector earlier
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
 <20211220181903.3456898-3-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211220181903.3456898-3-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 15b6803b-c224-46b7-9e99-a9353758f03d
X-Ovh-Tracer-Id: 14572522495770725158
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddthedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepnhhpihhgghhinhesghhmrghilhdrtghomh
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.694,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding Nicholas.

On 12/20/21 19:18, Fabiano Rosas wrote:
> None of the interrupt setup code touches 'vector', so we can move it
> earlier in the function. This will allow us to later move the System
> Call Vectored setup that is on the top level into the
> POWERPC_EXCP_SYSCALL_VECTORED code block.
> 
> This patch also moves the verification for when 'excp' does not have
> an address associated with it. We now bail a little earlier when that
> is the case. This should not cause any visible effects.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.
     
> ---
>   target/ppc/excp_helper.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 8b9c6bc5a8..14fd0213a0 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -352,6 +352,14 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>       }
>   #endif
>   
> +    vector = env->excp_vectors[excp];
> +    if (vector == (target_ulong)-1ULL) {
> +        cpu_abort(cs, "Raised an exception without defined vector %d\n",
> +                  excp);
> +    }
> +
> +    vector |= env->excp_prefix;
> +
>       switch (excp) {
>       case POWERPC_EXCP_NONE:
>           /* Should never happen */
> @@ -831,14 +839,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>       }
>   #endif
>   
> -    vector = env->excp_vectors[excp];
> -    if (vector == (target_ulong)-1ULL) {
> -        cpu_abort(cs, "Raised an exception without defined vector %d\n",
> -                  excp);
> -    }
> -
> -    vector |= env->excp_prefix;
> -
>   #if defined(TARGET_PPC64)
>       if (excp_model == POWERPC_EXCP_BOOKE) {
>           if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
> 



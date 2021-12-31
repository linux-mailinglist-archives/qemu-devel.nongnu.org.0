Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4634822A1
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 08:50:30 +0100 (CET)
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3CgH-0006bQ-EO
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 02:50:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n3CX3-0002av-Lp; Fri, 31 Dec 2021 02:40:57 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:55901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n3CX1-0003p4-KK; Fri, 31 Dec 2021 02:40:57 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.124])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id EBD21D4C82D9;
 Fri, 31 Dec 2021 08:40:51 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 31 Dec
 2021 08:40:51 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0019194dda8-2b33-4862-acf1-85029ae87510,
 3D80871A5AC245C0530038040CECACC5925050C1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.250.77.2
Message-ID: <88edfb3d-508d-ff59-8083-ffc6c2e08c9c@kaod.org>
Date: Fri, 31 Dec 2021 08:40:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 2/5] target/ppc: powerpc_excp: Add excp_vectors bounds
 check
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20211229165751.3774248-1-farosas@linux.ibm.com>
 <20211229165751.3774248-3-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211229165751.3774248-3-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a1c52e6f-5434-409a-a409-0a04ad40d688
X-Ovh-Tracer-Id: 12971211355944684326
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddvgedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) NICE_REPLY_A=-3.024,
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/29/21 17:57, Fabiano Rosas wrote:
> The next patch will start accessing the excp_vectors array earlier in
> the function, so add a bounds check as first thing here.
> 
> This converts the empty return on POWERPC_EXCP_NONE to an error. This
> exception number never reaches this function and if it does it
> probably means something else went wrong up the line.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   target/ppc/excp_helper.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 8b9c6bc5a8..9a03e4b896 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -300,6 +300,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>       target_ulong msr, new_msr, vector;
>       int srr0, srr1, lev = -1;
>   
> +    if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
> +        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> +    }
> +
>       qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
>                     " => %08x (%02x)\n", env->nip, excp, env->error_code);
>   
> @@ -353,9 +357,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>   #endif
>   
>       switch (excp) {
> -    case POWERPC_EXCP_NONE:
> -        /* Should never happen */
> -        return;
>       case POWERPC_EXCP_CRITICAL:    /* Critical input                         */
>           switch (excp_model) {
>           case POWERPC_EXCP_40x:
> 



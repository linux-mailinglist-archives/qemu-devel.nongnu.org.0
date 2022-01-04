Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FA6483F3C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:33:52 +0100 (CET)
Received: from localhost ([::1]:37390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4gCW-0007Rw-2P
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:33:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4gBX-0006cY-Kt
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:32:51 -0500
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:44041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4gBU-0001dB-02
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:32:51 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.246])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id AEA6021AE3;
 Tue,  4 Jan 2022 09:32:44 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 4 Jan
 2022 10:32:44 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005a28e9d1a-63cb-4e04-a60a-34cefba5b712,
 DC41CA294A1AC0AE13D8E7EBC58C249E9ADF812E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2c77c602-f2cb-96d2-837b-83bb698034ca@kaod.org>
Date: Tue, 4 Jan 2022 10:32:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/9] target/ppc: powerpc_excp: Extract software TLB
 logging into a function
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220103220746.3916246-1-farosas@linux.ibm.com>
 <20220103220746.3916246-2-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220103220746.3916246-2-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b52ab668-e165-4025-9cda-c2fdb2c6f146
X-Ovh-Tracer-Id: 1458040381336161062
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudeffedgtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354,
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

Hello Fabiano,

On 1/3/22 23:07, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>   target/ppc/excp_helper.c | 63 +++++++++++++++++++++++-----------------
>   1 file changed, 36 insertions(+), 27 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index c7e55800af..002a42261b 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -63,6 +63,41 @@ static inline void dump_hcall(CPUPPCState *env)
>                     env->nip);
>   }
>   
> +static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
> +{
> +#if defined(DEBUG_SOFTWARE_TLB)

I would get rid of the define

> +    const char *es;
> +    target_ulong *miss, *cmp;
> +    int en;
> +
> +    if (!qemu_log_enabled()) {
> +        return;
> +    }
> +
> +    if (excp == POWERPC_EXCP_IFTLB) {
> +        es = "I";
> +        en = 'I';
> +        miss = &env->spr[SPR_IMISS];
> +        cmp = &env->spr[SPR_ICMP];
> +    } else {
> +        if (excp == POWERPC_EXCP_DLTLB) {
> +            es = "DL";
> +        } else {
> +            es = "DS";
> +        }
> +        en = 'D';
> +        miss = &env->spr[SPR_DMISS];
> +        cmp = &env->spr[SPR_DCMP];
> +    }

and simply use :

   qemu_log_mask(CPU_LOG_MMU, ...

Thanks,

C.

> +    qemu_log("6xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
> +             TARGET_FMT_lx " H1 " TARGET_FMT_lx " H2 "
> +             TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
> +             env->spr[SPR_HASH1], env->spr[SPR_HASH2],
> +             env->error_code);
> +#endif
> +}
> +
> +
>   static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
>                                   target_ulong *msr)
>   {
> @@ -704,34 +739,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
>               }
>               /* fall through */
>           case POWERPC_EXCP_7x5:
> -#if defined(DEBUG_SOFTWARE_TLB)
> -            if (qemu_log_enabled()) {
> -                const char *es;
> -                target_ulong *miss, *cmp;
> -                int en;
> +            ppc_excp_debug_sw_tlb(env, excp);
>   
> -                if (excp == POWERPC_EXCP_IFTLB) {
> -                    es = "I";
> -                    en = 'I';
> -                    miss = &env->spr[SPR_IMISS];
> -                    cmp = &env->spr[SPR_ICMP];
> -                } else {
> -                    if (excp == POWERPC_EXCP_DLTLB) {
> -                        es = "DL";
> -                    } else {
> -                        es = "DS";
> -                    }
> -                    en = 'D';
> -                    miss = &env->spr[SPR_DMISS];
> -                    cmp = &env->spr[SPR_DCMP];
> -                }
> -                qemu_log("6xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
> -                         TARGET_FMT_lx " H1 " TARGET_FMT_lx " H2 "
> -                         TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
> -                         env->spr[SPR_HASH1], env->spr[SPR_HASH2],
> -                         env->error_code);
> -            }
> -#endif
>               msr |= env->crf[0] << 28;
>               msr |= env->error_code; /* key, D/I, S/L bits */
>               /* Set way using a LRU mechanism */
> 



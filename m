Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5967333CF9B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:21:11 +0100 (CET)
Received: from localhost ([::1]:38920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4ww-00065X-CR
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lM4ra-0006I6-0f
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:15:38 -0400
Received: from 5.mo52.mail-out.ovh.net ([188.165.45.220]:47043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lM4rU-0000lR-M5
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:15:37 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.246])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 96F0A250116;
 Tue, 16 Mar 2021 09:15:30 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 16 Mar
 2021 09:15:24 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0054862ff05-2cb6-48ea-bbfa-b75beff40a67,
 F4745E3E32A08DF6AE8813652EB4480BB0CFD8A0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v4 03/17] target/ppc: Properly sync cpu state with new msr
 in cpu_load_old
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d54aebb1-59b6-cea2-556c-4434845bf0c3@kaod.org>
Date: Tue, 16 Mar 2021 09:15:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210315184615.1985590-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 433541d6-a141-4e00-ac59-71cef4d031d4
X-Ovh-Tracer-Id: 7574210152404519904
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudefuddguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhg
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 7:46 PM, Richard Henderson wrote:
> Match cpu_post_load in using ppc_store_msr to set all of
> the cpu state implied by the value of msr.  Do not restore
> hflags or hflags_nmsr, as we recompute them in ppc_store_msr.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Could we add a common routine used by cpu_post_load() and cpu_load_old() ?


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  target/ppc/machine.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index 283db1d28a..87d7bffb86 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -21,6 +21,7 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
>      int32_t slb_nr;
>  #endif
>      target_ulong xer;
> +    target_ulong msr;
>  
>      for (i = 0; i < 32; i++) {
>          qemu_get_betls(f, &env->gpr[i]);
> @@ -111,11 +112,19 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
>      qemu_get_betls(f, &env->ivpr_mask);
>      qemu_get_betls(f, &env->hreset_vector);
>      qemu_get_betls(f, &env->nip);
> -    qemu_get_betls(f, &env->hflags);
> -    qemu_get_betls(f, &env->hflags_nmsr);
> +    qemu_get_sbetl(f); /* Discard unused hflags */
> +    qemu_get_sbetl(f); /* Discard unused hflags_nmsr */
>      qemu_get_sbe32(f); /* Discard unused mmu_idx */
>      qemu_get_sbe32(f); /* Discard unused power_mode */
>  
> +    /*
> +     * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
> +     * before restoring.  Note that this recomputes hflags and mem_idx.
> +     */
> +    msr = env->msr;
> +    env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
> +    ppc_store_msr(env, msr);
> +
>      /* Recompute mmu indices */
>      hreg_compute_mem_idx(env);
>  
> 



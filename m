Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9741033CFD8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:28:32 +0100 (CET)
Received: from localhost ([::1]:33646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM543-0007BG-Lt
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lM4s8-00077i-Az
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:16:12 -0400
Received: from 2.mo52.mail-out.ovh.net ([178.33.105.233]:59206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lM4s6-00017P-8o
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:16:12 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.48])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 621FB250547;
 Tue, 16 Mar 2021 09:16:08 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 16 Mar
 2021 09:16:07 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006434f66ce-411b-4517-9916-22f50ec60799,
 F4745E3E32A08DF6AE8813652EB4480BB0CFD8A0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v4 04/17] target/ppc: Do not call hreg_compute_mem_idx
 after ppc_store_msr
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2134ad9f-d2f3-492d-0267-c8a08e9e015b@kaod.org>
Date: Tue, 16 Mar 2021 09:16:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210315184615.1985590-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: eb3e84e6-b96e-4d31-be7b-b6143c724994
X-Ovh-Tracer-Id: 7586313573603642336
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudefuddguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhg
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo52.mail-out.ovh.net
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 7:46 PM, Richard Henderson wrote:
> In ppc_store_msr we call hreg_compute_hflags, which itself
> calls hreg_compute_mem_idx.  Rely on ppc_store_msr to update
> everything required by the msr update.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  target/ppc/machine.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index 87d7bffb86..f6eeda9642 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -125,9 +125,6 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
>      env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
>      ppc_store_msr(env, msr);
>  
> -    /* Recompute mmu indices */
> -    hreg_compute_mem_idx(env);
> -
>      return 0;
>  }
>  
> @@ -418,14 +415,12 @@ static int cpu_post_load(void *opaque, int version_id)
>  
>      /*
>       * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
> -     * before restoring
> +     * before restoring.  Note that this recomputes hflags and mem_idx.
>       */
>      msr = env->msr;
>      env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
>      ppc_store_msr(env, msr);
>  
> -    hreg_compute_mem_idx(env);
> -
>      return 0;
>  }
>  
> 



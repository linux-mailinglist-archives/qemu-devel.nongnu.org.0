Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF36833CFDD
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:30:07 +0100 (CET)
Received: from localhost ([::1]:36786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM55a-0008TZ-Ru
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lM4sm-0008Po-L7
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:16:52 -0400
Received: from 7.mo52.mail-out.ovh.net ([188.165.59.253]:35200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lM4sg-0001ZB-Ke
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:16:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.13])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 28FF125059A;
 Tue, 16 Mar 2021 09:16:45 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 16 Mar
 2021 09:16:44 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002084edc63-24a8-4b0e-93ee-95cc29dc56ad,
 F4745E3E32A08DF6AE8813652EB4480BB0CFD8A0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v4 05/17] target/ppc: Retain hflags_nmsr only for migration
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <232267e0-06ea-0446-1a48-6d8eba9cf50e@kaod.org>
Date: Tue, 16 Mar 2021 09:16:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210315184615.1985590-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 01f29e8e-bc17-4dd0-b013-bfb95a91d1d6
X-Ovh-Tracer-Id: 7596446675703008224
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudefuddguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
> We have eliminated all normal uses of hflags_nmsr.  We need
> not even compute it except when we want to migrate.  Rename
> the field to emphasize this.
> 
> Remove the fixme comment for migrating access_type.  This value
> is only ever used with the current executing instruction, and
> is never live when the cpu is halted for migration.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  target/ppc/cpu.h         | 4 ++--
>  target/ppc/helper_regs.c | 2 --
>  target/ppc/machine.c     | 9 ++++++---
>  3 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 061d2eed1b..79c4033a42 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1105,8 +1105,8 @@ struct CPUPPCState {
>  #endif
>  
>      /* These resources are used only in QEMU core */
> -    target_ulong hflags;      /* hflags is MSR & HFLAGS_MASK */
> -    target_ulong hflags_nmsr; /* specific hflags, not coming from MSR */
> +    target_ulong hflags;
> +    target_ulong hflags_compat_nmsr; /* for migration compatibility */
>      int immu_idx;     /* precomputed MMU index to speed up insn accesses */
>      int dmmu_idx;     /* precomputed MMU index to speed up data accesses */
>  
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 95b9aca61f..a87e354ca2 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -104,8 +104,6 @@ void hreg_compute_hflags(CPUPPCState *env)
>           */
>          uint32_t le = extract32(env->spr[SPR_HID0], 3, 1);
>          env->hflags |= le << MSR_LE;
> -        /* Retain for backward compatibility with migration. */
> -        env->hflags_nmsr = le << MSR_LE;
>      }
>  }
>  
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index f6eeda9642..1f7a353c78 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -310,6 +310,10 @@ static int cpu_pre_save(void *opaque)
>          }
>      }
>  
> +    /* Retain migration compatibility for pre 6.0 for 601 machines. */
> +    env->hflags_compat_nmsr = (env->flags & POWERPC_FLAG_HID0_LE
> +                               ? env->hflags & MSR_LE : 0);
> +
>      return 0;
>  }
>  
> @@ -829,9 +833,8 @@ const VMStateDescription vmstate_ppc_cpu = {
>          /* Supervisor mode architected state */
>          VMSTATE_UINTTL(env.msr, PowerPCCPU),
>  
> -        /* Internal state */
> -        VMSTATE_UINTTL(env.hflags_nmsr, PowerPCCPU),
> -        /* FIXME: access_type? */
> +        /* Backward compatible internal state */
> +        VMSTATE_UINTTL(env.hflags_compat_nmsr, PowerPCCPU),
>  
>          /* Sanity checking */
>          VMSTATE_UINTTL_TEST(mig_msr_mask, PowerPCCPU, cpu_pre_2_8_migration),
> 



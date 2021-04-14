Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9B235F787
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 17:26:50 +0200 (CEST)
Received: from localhost ([::1]:37100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWhPj-0004xM-0V
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 11:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lWhNk-0004V4-8E; Wed, 14 Apr 2021 11:24:44 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:56201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lWhNg-0007Lj-Ij; Wed, 14 Apr 2021 11:24:44 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.148])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 638779A4B51C;
 Wed, 14 Apr 2021 17:24:28 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 14 Apr
 2021 17:24:27 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004937713bf-05cd-4273-a193-2069dfcd3f73,
 38A808AD2D0D3C4A59D9F430F89D181E503BD305) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [EXTERNAL] [RFC PATCH 1/2] target/ppc: rework AIL logic in
 interrupt delivery
To: Nicholas Piggin <npiggin@gmail.com>, <qemu-ppc@nongnu.org>
References: <20210414032343.1720010-1-npiggin@gmail.com>
 <20210414032343.1720010-2-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <eaada833-6df9-a056-b137-9b5fd6643992@kaod.org>
Date: Wed, 14 Apr 2021 17:24:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414032343.1720010-2-npiggin@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5b57c7b8-b704-4152-8e50-d971beb3bc2c
X-Ovh-Tracer-Id: 660903248114649894
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeluddgkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 5:23 AM, Nicholas Piggin wrote:
> The AIL logic is becoming unmanageable spread all over powerpc_excp(),
> and it is slated to get even worse with POWER10 support.
> 
> Move it all to a new helper function.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>

Thanks for the effort and the documentation. One minor comment below,

C.

> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  hw/ppc/spapr_hcall.c            |   3 +-
>  target/ppc/cpu.h                |   8 --
>  target/ppc/excp_helper.c        | 161 ++++++++++++++++++++------------
>  target/ppc/translate_init.c.inc |   2 +-
>  4 files changed, 104 insertions(+), 70 deletions(-)
> 
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 7b5cd3553c..2fbe04a689 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1395,7 +1395,8 @@ static target_ulong h_set_mode_resource_addr_trans_mode(PowerPCCPU *cpu,
>          return H_P4;
>      }
> 
> -    if (mflags == AIL_RESERVED) {
> +    if (mflags == 1) {
> +        /* AIL=1 is reserved */
>          return H_UNSUPPORTED_FLAG;
>      }
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index e73416da68..5200a16d23 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2375,14 +2375,6 @@ enum {
>      HMER_XSCOM_STATUS_MASK      = PPC_BITMASK(21, 23),
>  };
> 
> -/* Alternate Interrupt Location (AIL) */
> -enum {
> -    AIL_NONE                = 0,
> -    AIL_RESERVED            = 1,
> -    AIL_0001_8000           = 2,
> -    AIL_C000_0000_0000_4000 = 3,
> -};

I kind of like these. No big deal.

> -
>  /*****************************************************************************/
> 
>  #define is_isa300(ctx) (!!(ctx->insns_flags2 & PPC2_ISA300))
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index b8881c0f85..9ff316767c 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -136,25 +136,107 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
>      return POWERPC_EXCP_RESET;
>  }
> 
> -static uint64_t ppc_excp_vector_offset(CPUState *cs, int ail)
> +/*
> + * AIL - Alternate Interrupt Location, a mode that allows interrupts to be
> + * taken with the MMU on, and which uses an alternate location (e.g., so the
> + * kernel/hv can map the vectors there with an effective address).
> + *
> + * An interrupt is considered to be taken "with AIL" or "AIL applies" if they
> + * are delivered in this way. AIL requires the LPCR to be set to enable this
> + * mode, and a number of conditions have to be true for AIL to apply.
> + *
> + * First of all, SRESET, MCE, and HMI are always delivered without AIL,
> + * because they are specifically want to be in real mode (e.g., MCE might
> + * be signaling a SLB multi-hit which requires SLB flush before the MMU can
> + * be enabled).
> + *
> + * After that, behaviour depends on the current MSR[IR], MSR[DR], MSR[HV], and
> + * whether or not the interrupt changes MSR[HV] from 0 to 1, and the current
> + * radix mode (LPCR[HR]).
> + *
> + * POWER8, POWER9 with LPCR[HR]=0
> + * | LPCR[AIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
> + * +-----------+-------------+---------+-------------+-----+
> + * | a         | 00/01/10    | x       | x           | 0   |
> + * | a         | 11          | 0       | 1           | 0   |
> + * | a         | 11          | 1       | 1           | a   |
> + * | a         | 11          | 0       | 0           | a   |
> + * +-------------------------------------------------------+
> + *
> + * POWER9 with LPCR[HR]=1
> + * | LPCR[AIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
> + * +-----------+-------------+---------+-------------+-----+
> + * | a         | 00/01/10    | x       | x           | 0   |
> + * | a         | 11          | x       | x           | a   |
> + * +-------------------------------------------------------+
> + *
> + * The difference with POWER9 being that MSR[HV] 0->1 interrupts can be
> + * sent to the hypervisor in AIL mode if the guest is radix (LPCR[HR]=1).
> + */
> +static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
> +                                      target_ulong msr,
> +                                      target_ulong *new_msr,
> +                                      target_ulong *vector)
>  {
> -    uint64_t offset = 0;
> +#if defined(TARGET_PPC64)
> +    CPUPPCState *env = &cpu->env;
> +    bool mmu_all_on = ((msr >> MSR_IR) & 1) && ((msr >> MSR_DR) & 1);
> +    bool hv_escalation = !(msr & MSR_HVB) && (*new_msr & MSR_HVB);
> +    int ail = 0;
> +
> +    if (excp == POWERPC_EXCP_MCHECK ||
> +        excp == POWERPC_EXCP_RESET ||
> +        excp == POWERPC_EXCP_HV_MAINT) {
> +        /* SRESET, MCE, HMI never apply AIL */
> +        return;
> +    }
> 
> -    switch (ail) {
> -    case AIL_NONE:
> -        break;
> -    case AIL_0001_8000:
> -        offset = 0x18000;
> -        break;
> -    case AIL_C000_0000_0000_4000:
> -        offset = 0xc000000000004000ull;
> -        break;
> -    default:
> -        cpu_abort(cs, "Invalid AIL combination %d\n", ail);

Could we keep this abort ? 


> -        break;
> +    if (excp_model == POWERPC_EXCP_POWER8 ||
> +        excp_model == POWERPC_EXCP_POWER9) {
> +        if (!mmu_all_on) {
> +            /* AIL only works if MSR[IR] and MSR[DR] are both enabled. */
> +            return;
> +        }
> +        if (hv_escalation && !(env->spr[SPR_LPCR] & LPCR_HR)) {
> +            /*
> +             * AIL does not work if there is a MSR[HV] 0->1 transition and the
> +             * partition is in HPT mode. For radix guests, such interrupts are
> +             * allowed to be delivered to the hypervisor in ail mode.
> +             */
> +            return;
> +        }
> +
> +        ail = (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
> +        if (ail != 2 && ail != 3) {
> +            /* AIL=1 is reserved */
> +            return;
> +        }
> +    } else {
> +        /* Other processors do not support AIL */
> +        return;
>      }
> 
> -    return offset;
> +    /*
> +     * AIL applies, so the new MSR gets IR and DR set, and an offset applied
> +     * to the new IP.
> +     */
> +    *new_msr |= (1 << MSR_IR) | (1 << MSR_DR);
> +
> +    if (excp != POWERPC_EXCP_SYSCALL_VECTORED) {
> +        if (ail == 2) {
> +            *vector |= 0x0000000000018000ull;
> +        } else if (ail == 3) {
> +            *vector |= 0xc000000000004000ull;
> +        }
> +    } else {
> +        /* scv AIL is a little different */
> +        if (ail == 3) {
> +            /* Un-apply the base offset */
> +            *vector &= ~0x0000000000017000ull;
> +            *vector |= 0xc000000000003000ull;
> +        }
> +    }
> +#endif
>  }
> 
>  static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
> @@ -197,7 +279,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>      CPUState *cs = CPU(cpu);
>      CPUPPCState *env = &cpu->env;
>      target_ulong msr, new_msr, vector;
> -    int srr0, srr1, asrr0, asrr1, lev = -1, ail;
> +    int srr0, srr1, asrr0, asrr1, lev = -1;
>      bool lpes0;
> 
>      qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
> @@ -238,25 +320,16 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>       *
>       * On anything else, we behave as if LPES0 is 1
>       * (externals don't alter MSR:HV)
> -     *
> -     * AIL is initialized here but can be cleared by
> -     * selected exceptions
>       */
>  #if defined(TARGET_PPC64)
>      if (excp_model == POWERPC_EXCP_POWER7 ||
>          excp_model == POWERPC_EXCP_POWER8 ||
>          excp_model == POWERPC_EXCP_POWER9) {
>          lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
> -        if (excp_model != POWERPC_EXCP_POWER7) {
> -            ail = (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
> -        } else {
> -            ail = 0;
> -        }
>      } else
>  #endif /* defined(TARGET_PPC64) */
>      {
>          lpes0 = true;
> -        ail = 0;
>      }
> 
>      /*
> @@ -315,7 +388,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>               */
>              new_msr |= (target_ulong)MSR_HVB;
>          }
> -        ail = 0;
> 
>          /* machine check exceptions don't have ME set */
>          new_msr &= ~((target_ulong)1 << MSR_ME);
> @@ -519,7 +591,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>                            "exception %d with no HV support\n", excp);
>              }
>          }
> -        ail = 0;
>          break;
>      case POWERPC_EXCP_DSEG:      /* Data segment exception                   */
>      case POWERPC_EXCP_ISEG:      /* Instruction segment exception            */
> @@ -790,24 +861,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>      }
>  #endif
> 
> -    /*
> -     * AIL only works if MSR[IR] and MSR[DR] are both enabled.
> -     */
> -    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
> -        ail = 0;
> -    }
> -
> -    /*
> -     * AIL does not work if there is a MSR[HV] 0->1 transition and the
> -     * partition is in HPT mode. For radix guests, such interrupts are
> -     * allowed to be delivered to the hypervisor in ail mode.
> -     */
> -    if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) {
> -        if (!(env->spr[SPR_LPCR] & LPCR_HR)) {
> -            ail = 0;
> -        }
> -    }
> -
>      vector = env->excp_vectors[excp];
>      if (vector == (target_ulong)-1ULL) {
>          cpu_abort(cs, "Raised an exception without defined vector %d\n",
> @@ -848,23 +901,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>          /* Save MSR */
>          env->spr[srr1] = msr;
> 
> -        /* Handle AIL */
> -        if (ail) {
> -            new_msr |= (1 << MSR_IR) | (1 << MSR_DR);
> -            vector |= ppc_excp_vector_offset(cs, ail);
> -        }
> -
>  #if defined(TARGET_PPC64)
>      } else {
> -        /* scv AIL is a little different */
> -        if (ail) {
> -            new_msr |= (1 << MSR_IR) | (1 << MSR_DR);
> -        }
> -        if (ail == AIL_C000_0000_0000_4000) {
> -            vector |= 0xc000000000003000ull;
> -        } else {
> -            vector |= 0x0000000000017000ull;
> -        }
>          vector += lev * 0x20;
> 
>          env->lr = env->nip;
> @@ -872,6 +910,9 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>  #endif
>      }
> 
> +    /* This can update new_msr and vector if AIL applies */
> +    ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
> +
>      powerpc_set_excp_state(cpu, vector, new_msr);
>  }
> 
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
> index 70f9b9b150..a82d9ed647 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -3457,7 +3457,7 @@ static void init_excp_POWER9(CPUPPCState *env)
> 
>  #if !defined(CONFIG_USER_ONLY)
>      env->excp_vectors[POWERPC_EXCP_HVIRT]    = 0x00000EA0;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL_VECTORED] = 0x00000000;
> +    env->excp_vectors[POWERPC_EXCP_SYSCALL_VECTORED] = 0x00017000;
>  #endif
>  }
> 



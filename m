Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7698235E4C6
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 19:14:31 +0200 (CEST)
Received: from localhost ([::1]:46484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWMcQ-0002DY-GZ
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 13:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lWMXr-0006m0-EK
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 13:09:47 -0400
Received: from 3.mo51.mail-out.ovh.net ([188.165.32.156]:42341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lWMXl-0001YJ-L4
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 13:09:47 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.72])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 118E2280021;
 Tue, 13 Apr 2021 19:09:35 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 13 Apr
 2021 19:09:34 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00329d72808-5d40-493f-8882-32c2f54b8bab,
 4BE79BB08BA9582E888D4556D96BF37B7B4E8F35) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH v1 3/3] target/ppc: Add POWER10 exception model
To: Fabiano Rosas <farosas@linux.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>, <qemu-ppc@nongnu.org>
References: <20210413125448.1689545-1-npiggin@gmail.com>
 <20210413125448.1689545-4-npiggin@gmail.com> <87v98q41v0.fsf@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9fecb60b-8074-83d4-8c59-2d324d576e06@kaod.org>
Date: Tue, 13 Apr 2021 19:09:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87v98q41v0.fsf@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f1722944-8197-4bcc-b38f-95db592f2ac1
X-Ovh-Tracer-Id: 15010216085670365990
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudekledguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegvdeijeefvdfhudfhffeuveehledufffhvdekheelgedttddthfeigeevgefhffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhgrrhhoshgrsheslhhinhhugidrihgsmhdrtghomh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo51.mail-out.ovh.net
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
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 5:53 PM, Fabiano Rosas wrote:
> Nicholas Piggin <npiggin@gmail.com> writes:
> 
>> POWER10 adds a new bit that modifies interrupt behaviour, LPCR[HAIL],
>> and it removes support for the LPCR[AIL]=0b10 mode.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  hw/ppc/spapr_hcall.c            |   5 ++
>>  target/ppc/cpu-qom.h            |   2 +
>>  target/ppc/cpu.h                |   5 +-
>>  target/ppc/excp_helper.c        | 114 ++++++++++++++++++++++++++------
>>  target/ppc/translate.c          |   3 +-
>>  target/ppc/translate_init.c.inc |   2 +-
>>  6 files changed, 107 insertions(+), 24 deletions(-)
>>
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index 7b5cd3553c..2f65f20f72 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -1399,6 +1399,11 @@ static target_ulong h_set_mode_resource_addr_trans_mode(PowerPCCPU *cpu,
>>          return H_UNSUPPORTED_FLAG;
>>      }
>>  
>> +    if (mflags == AIL_0001_8000 && (pcc->insns_flags2 & PPC2_ISA310)) {
>> +        /* AIL 2 is also reserved in ISA v3.1 */
>> +        return H_UNSUPPORTED_FLAG;
>> +    }
>> +
>>      spapr_set_all_lpcrs(mflags << LPCR_AIL_SHIFT, LPCR_AIL);
>>  
>>      return H_SUCCESS;
>> diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
>> index 118baf8d41..06b6571bc9 100644
>> --- a/target/ppc/cpu-qom.h
>> +++ b/target/ppc/cpu-qom.h
>> @@ -116,6 +116,8 @@ enum powerpc_excp_t {
>>      POWERPC_EXCP_POWER8,
>>      /* POWER9 exception model           */
>>      POWERPC_EXCP_POWER9,
>> +    /* POWER10 exception model           */
>> +    POWERPC_EXCP_POWER10,
>>  };
>>  
>>  /*****************************************************************************/
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index e73416da68..24e53e0ac3 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -354,10 +354,11 @@ typedef struct ppc_v3_pate_t {
>>  #define LPCR_PECE_U_SHIFT (63 - 19)
>>  #define LPCR_PECE_U_MASK  (0x7ull << LPCR_PECE_U_SHIFT)
>>  #define LPCR_HVEE         PPC_BIT(17) /* Hypervisor Virt Exit Enable */
>> -#define LPCR_RMLS_SHIFT   (63 - 37)
>> +#define LPCR_RMLS_SHIFT   (63 - 37)   /* RMLS (removed in ISA v3.0) */
>>  #define LPCR_RMLS         (0xfull << LPCR_RMLS_SHIFT)
>> +#define LPCR_HAIL         PPC_BIT(37) /* ISA v3.1 HV AIL=3 equivalent */
>>  #define LPCR_ILE          PPC_BIT(38)
>> -#define LPCR_AIL_SHIFT    (63 - 40)      /* Alternate interrupt location */
>> +#define LPCR_AIL_SHIFT    (63 - 40)   /* Alternate interrupt location */
>>  #define LPCR_AIL          (3ull << LPCR_AIL_SHIFT)
>>  #define LPCR_UPRT         PPC_BIT(41) /* Use Process Table */
>>  #define LPCR_EVIRT        PPC_BIT(42) /* Enhanced Virtualisation */
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index b8881c0f85..e8bf0598b4 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -197,7 +197,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>>      CPUState *cs = CPU(cpu);
>>      CPUPPCState *env = &cpu->env;
>>      target_ulong msr, new_msr, vector;
>> -    int srr0, srr1, asrr0, asrr1, lev = -1, ail;
>> +    int srr0, srr1, asrr0, asrr1, lev = -1;
>> +    int ail, hail, using_ail;
>>      bool lpes0;
>>  
>>      qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
>> @@ -239,24 +240,39 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>>       * On anything else, we behave as if LPES0 is 1
>>       * (externals don't alter MSR:HV)
>>       *
>> -     * AIL is initialized here but can be cleared by
>> -     * selected exceptions
>> +     * ail/hail are initialized here but can be cleared by
>> +     * selected exceptions, and other conditions afterwards.
>>       */
>>  #if defined(TARGET_PPC64)
>>      if (excp_model == POWERPC_EXCP_POWER7 ||
>>          excp_model == POWERPC_EXCP_POWER8 ||
>> -        excp_model == POWERPC_EXCP_POWER9) {
>> +        excp_model == POWERPC_EXCP_POWER9 ||
>> +        excp_model == POWERPC_EXCP_POWER10) {
>>          lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
>>          if (excp_model != POWERPC_EXCP_POWER7) {
>>              ail = (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
>>          } else {
>>              ail = 0;
>>          }
>> +        if (excp_model == POWERPC_EXCP_POWER10) {
>> +            if (AIL_0001_8000) {
> 
> if (2)
> 
>> +                ail = 0; /* AIL=2 is reserved in ISA v3.1 */
>> +            }
>> +
>> +            if (env->spr[SPR_LPCR] & LPCR_HAIL) {
>> +                hail = AIL_C000_0000_0000_4000;
>> +            } else {
>> +                hail = 0;
>> +            }
>> +        } else {
>> +            hail = ail;
> 
> I think it's better if we set hail = 0 here. Read on...
> 
>> +        }
>>      } else
>>  #endif /* defined(TARGET_PPC64) */
>>      {
>>          lpes0 = true;
>>          ail = 0;
>> +        hail = 0;
>>      }
>>  
>>      /*
>> @@ -316,6 +332,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>>              new_msr |= (target_ulong)MSR_HVB;
>>          }
>>          ail = 0;
>> +        hail = 0;
>>  
>>          /* machine check exceptions don't have ME set */
>>          new_msr &= ~((target_ulong)1 << MSR_ME);
>> @@ -520,6 +537,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>>              }
>>          }
>>          ail = 0;
>> +        hail = 0;
>>          break;
>>      case POWERPC_EXCP_DSEG:      /* Data segment exception                   */
>>      case POWERPC_EXCP_ISEG:      /* Instruction segment exception            */
>> @@ -773,7 +791,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>>          } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
>>              new_msr |= (target_ulong)1 << MSR_LE;
>>          }
>> -    } else if (excp_model == POWERPC_EXCP_POWER9) {
>> +    } else if (excp_model == POWERPC_EXCP_POWER9 ||
>> +               excp_model == POWERPC_EXCP_POWER10) {
>>          if (new_msr & MSR_HVB) {
>>              if (env->spr[SPR_HID0] & HID0_POWER9_HILE) {
>>                  new_msr |= (target_ulong)1 << MSR_LE;
>> @@ -791,22 +810,77 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>>  #endif
>>  
>>      /*
>> -     * AIL only works if MSR[IR] and MSR[DR] are both enabled.
>> +     * The ail variable is for AIL behaviour for interrupts that begin
>> +     * execution with MSR[HV]=0, and the hail variable is for AIL behaviour for
>> +     * interrupts that begin execution with MSR[HV]=1.
>> +     *
>> +     * There is a large matrix of behaviours depending on the processor and
>> +     * the current operating modes when the interrupt is taken, and the
>> +     * interrupt type. The below tables lists behaviour for interrupts except
>> +     * for SRESET, machine check, and HMI (which are all taken in real mode
>> +     * with AIL 0).
>> +     *
>> +     * POWER8, POWER9 with LPCR[HR]=0
>> +     * | LPCR[AIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
>> +     * +-----------+-------------+---------+-------------+-----+
>> +     * | a         | 00/01/10    | x       | x           | 0   |
>> +     * | a         | 11          | 0       | 1           | 0   |
>> +     * | a         | 11          | 1       | 1           | a   |
>> +     * | a         | 11          | 0       | 0           | a   |
>> +     * +-------------------------------------------------------+
>> +     *
>> +     * POWER9 with LPCR[HR]=1
>> +     * | LPCR[AIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
>> +     * +-----------+-------------+---------+-------------+-----+
>> +     * | a         | 00/01/10    | x       | x           | 0   |
>> +     * | a         | 11          | x       | x           | a   |
>> +     * +-------------------------------------------------------+
>> +     *
>> +     * The difference with POWER9 being that MSR[HV] 0->1 interrupts can be
>> +     * sent to the hypervisor in AIL mode if the guest is radix (LPCR[HR]=1).
>> +     * This is good for performance but allows the guest to influence the
>> +     * AIL of the hypervisor interrupt using its MSR, and also the hypervisor
>> +     * must disallow guest interrupts (MSR[HV] 0->0) from using AIL if the
>> +     * hypervisor does not want to use AIL for its MSR[HV] 0->1 interrupts.
>> +     *
>> +     * POWER10 addresses those issues with a new LPCR[HAIL] bit that is
>> +     * applied to interrupt that begin execution with MSR[HV]=1 (so both
>> +     * MSR[HV] 0->1 and 1->1).
> 
> I'd put take these two paragraphs in the commit message as well. Just
> alter the beginning:
> s/The difference with POWER9 being that/In POWER9,/
> 
>> +     *
>> +     * POWER10 behaviour is
>> +     * | LPCR[AIL] | LPCR[HAIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
>> +     * +-----------+------------+-------------+---------+-------------+-----+
>> +     * | a         | h          | 00/01/10    | 0       | 0           | 0   |
>> +     * | a         | h          | 11          | 0       | 0           | a   |
>> +     * | a         | h          | x           | 0       | 1           | h   |
>> +     * | a         | h          | 00/01/10    | 1       | 1           | 0   |
>> +     * | a         | h          | 11          | 1       | 1           | h   |
>> +     * +--------------------------------------------------------------------+
>>       */
>> -    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
>> -        ail = 0;
>> -    }
>>  
>> -    /*
>> -     * AIL does not work if there is a MSR[HV] 0->1 transition and the
>> -     * partition is in HPT mode. For radix guests, such interrupts are
>> -     * allowed to be delivered to the hypervisor in ail mode.
>> -     */
>> -    if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) {
>> -        if (!(env->spr[SPR_LPCR] & LPCR_HR)) {
>> +    if (excp_model == POWERPC_EXCP_POWER8 ||
>> +        excp_model == POWERPC_EXCP_POWER9) {
>> +        if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
>>              ail = 0;
>> +            hail = 0;
>> +        } else if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) {
>> +            if (!(env->spr[SPR_LPCR] & LPCR_HR)) {
>> +                hail = 0;
>> +            }
>> +        }
>> +    } else if (excp_model == POWERPC_EXCP_POWER10) {
>> +        if ((new_msr & MSR_HVB) == (msr & MSR_HVB)) {
>> +            if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
>> +                ail = 0;
>> +                hail = 0;
>> +            }
>>          }
>>      }
>> +    if (new_msr & MSR_HVB) {
>> +        using_ail = hail;
>> +    } else {
>> +        using_ail = ail;
>> +    }
> 
> So if at the start of the function we set:
> 
> <= P7:
> ail = 0;
> hail = 0;
> 
> P8,P9:
> ail = LPCR_AIL;
> hail = 0;
> 
> P10:
> ail = LPCR_AIL, except AIL2;
> hail = AIL3;
> 
> Then we could do this, which I think is more readable (comments are just
> for the email):
> 
> // If there's an HV transition to 1, then HPT zeroes AIL and radix
> // doesn't. For P10 we'll use HAIL anyway, so no need to check.
> 
> if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) &&
>     !(env->spr[SPR_LPCR] & LPCR_HR)) {
>           ail = 0;
> }
> 
> // If P10 and HV=1, use HAIL instead of AIL
> 
> if (excp_model == POWERPC_EXCP_POWER10 && (new_msr & MSR_HVB)) {
>    ail = hail;
> }
> 
> // The IR|DR check always takes precedence and zeroes AIL/HAIL, no
> matter the processor version.
> 
> if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
>     ail = 0;
> }
> 
> (...)
> 
> vector |= ppc_excp_vector_offset(cs, ail);
> 
> I think that should work...*squints* 
> What do you think?

The powerpc_excp() routine is insane.

It feels that we should be duplicating the code in handlers for each 
of the POWER[7-10] CPUs and keep a default powerpc_excp() for the
others.

C.

> 
>>  
>>      vector = env->excp_vectors[excp];
>>      if (vector == (target_ulong)-1ULL) {
>> @@ -849,18 +923,18 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>>          env->spr[srr1] = msr;
>>  
>>          /* Handle AIL */
>> -        if (ail) {
>> +        if (using_ail) {
>>              new_msr |= (1 << MSR_IR) | (1 << MSR_DR);
>> -            vector |= ppc_excp_vector_offset(cs, ail);
>> +            vector |= ppc_excp_vector_offset(cs, using_ail);
>>          }
>>  
>>  #if defined(TARGET_PPC64)
>>      } else {
>>          /* scv AIL is a little different */
>> -        if (ail) {
>> +        if (using_ail) {
>>              new_msr |= (1 << MSR_IR) | (1 << MSR_DR);
>>          }
>> -        if (ail == AIL_C000_0000_0000_4000) {
>> +        if (using_ail == AIL_C000_0000_0000_4000) {
>>              vector |= 0xc000000000003000ull;
>>          } else {
>>              vector |= 0x0000000000017000ull;
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index 0984ce637b..e9ed001229 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -7731,7 +7731,8 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>>  #if defined(TARGET_PPC64)
>>      if (env->excp_model == POWERPC_EXCP_POWER7 ||
>>          env->excp_model == POWERPC_EXCP_POWER8 ||
>> -        env->excp_model == POWERPC_EXCP_POWER9)  {
>> +        env->excp_model == POWERPC_EXCP_POWER9 ||
>> +        env->excp_model == POWERPC_EXCP_POWER10)  {
>>          qemu_fprintf(f, "HSRR0 " TARGET_FMT_lx " HSRR1 " TARGET_FMT_lx "\n",
>>                       env->spr[SPR_HSRR0], env->spr[SPR_HSRR1]);
>>      }
>> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
>> index 70f9b9b150..5d427e9d38 100644
>> --- a/target/ppc/translate_init.c.inc
>> +++ b/target/ppc/translate_init.c.inc
>> @@ -9317,7 +9317,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
>>      pcc->radix_page_info = &POWER10_radix_page_info;
>>      pcc->lrg_decr_bits = 56;
>>  #endif
>> -    pcc->excp_model = POWERPC_EXCP_POWER9;
>> +    pcc->excp_model = POWERPC_EXCP_POWER10;
>>      pcc->bus_model = PPC_FLAGS_INPUT_POWER9;
>>      pcc->bfd_mach = bfd_mach_ppc64;
>>      pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |



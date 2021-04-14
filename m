Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753EA35EA8A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 03:58:34 +0200 (CEST)
Received: from localhost ([::1]:48056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWUnZ-00049Q-4K
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 21:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWUm7-0003as-US; Tue, 13 Apr 2021 21:57:03 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:46947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWUm5-0007fA-Na; Tue, 13 Apr 2021 21:57:03 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 u14-20020a17090a1f0eb029014e38011b09so5153738pja.5; 
 Tue, 13 Apr 2021 18:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=tFU3LRcfWE4tlDZUED0PTq12iSpNlOyadvr9GmjxmtE=;
 b=d8zAjroYPCGbGHcRRgTTPywDiv3zzCvmfD9rUfijFE96sCbv0ScAxGYNsolnyfQ2OB
 3UMxdk5LiXLh9lp1+BgomMXJOOm4N1PWWL0FVsGVaoz1NAOuu8eHTi9o27hQ66SVcwlh
 XqKkLh0Add5Gxd71YDiE0ZaTsjl6RoH+niULvbDb9Glkb/01AU3/c0FiIcxTcjuu03sR
 sDm5NWroFtDueU4xvh1kljc/Nh4rcvID3MJNGcD6fX0A8bBrC/2xlsiRsTTiOnpwi0M9
 gThfq3mmLEUUrX1fG9jbCqE/TELmHy+zax3h4KUSG7/SiJMjnqdjeyqVwM15KncDe8Ab
 4uhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=tFU3LRcfWE4tlDZUED0PTq12iSpNlOyadvr9GmjxmtE=;
 b=A+ZulxmliXK84x9BKuJxZHAZer3auBidZNb4/w+bTaeTl2tiJW4f5ccmA2ZYw2pMcg
 NqtRX1yE/TfkG4F2JhzB8ecZOV5P31dD5c+CcmHiZyl13HPcdmRmgnV5vFnGBdKT3YMT
 g6OOpPjqnnLv5FHn7FXN1YanbK0ORZDld/sGMImI2vJIvHY/mkpw42zD/K9qEmb+P3sb
 smeC/sPd5vLPwLABI1UUhbySVYiPaOYWsr0sUgnFT8SqxncnYQmDimCRNtUvN9lrHqb4
 vzPnq0Vc4EeiArs0EL4w5XKXixmZzs/dkIsYzmGNEv+J9iUo1reLVz9MBl+tshSrqiV2
 E0+w==
X-Gm-Message-State: AOAM533PSt2KQieC0FFJTbIOphsD9CL0yPypLghBQ66m5HYrYdTQMSTG
 av3SRIQFazsMNU9IYwXcv4w=
X-Google-Smtp-Source: ABdhPJw9ZV10g6U79fmAjmDDwW0Z+icnlzfismDaTdvVXD1B53nZp3QWSxOefArhp1Vc6Js1sZ/y0g==
X-Received: by 2002:a17:90a:5b0b:: with SMTP id
 o11mr812322pji.18.1618365419592; 
 Tue, 13 Apr 2021 18:56:59 -0700 (PDT)
Received: from localhost (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id s17sm3180120pjn.44.2021.04.13.18.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 18:56:59 -0700 (PDT)
Date: Wed, 14 Apr 2021 11:56:53 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 3/3] target/ppc: Add POWER10 exception model
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, Fabiano Rosas
 <farosas@linux.ibm.com>, qemu-ppc@nongnu.org
References: <20210413125448.1689545-1-npiggin@gmail.com>
 <20210413125448.1689545-4-npiggin@gmail.com> <87v98q41v0.fsf@linux.ibm.com>
 <9fecb60b-8074-83d4-8c59-2d324d576e06@kaod.org>
In-Reply-To: <9fecb60b-8074-83d4-8c59-2d324d576e06@kaod.org>
MIME-Version: 1.0
Message-Id: <1618365262.ky4c5ac4z3.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from C=C3=A9dric Le Goater's message of April 14, 2021 3:09 am:
> On 4/13/21 5:53 PM, Fabiano Rosas wrote:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>>=20
>>> POWER10 adds a new bit that modifies interrupt behaviour, LPCR[HAIL],
>>> and it removes support for the LPCR[AIL]=3D0b10 mode.
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>  hw/ppc/spapr_hcall.c            |   5 ++
>>>  target/ppc/cpu-qom.h            |   2 +
>>>  target/ppc/cpu.h                |   5 +-
>>>  target/ppc/excp_helper.c        | 114 ++++++++++++++++++++++++++------
>>>  target/ppc/translate.c          |   3 +-
>>>  target/ppc/translate_init.c.inc |   2 +-
>>>  6 files changed, 107 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>>> index 7b5cd3553c..2f65f20f72 100644
>>> --- a/hw/ppc/spapr_hcall.c
>>> +++ b/hw/ppc/spapr_hcall.c
>>> @@ -1399,6 +1399,11 @@ static target_ulong h_set_mode_resource_addr_tra=
ns_mode(PowerPCCPU *cpu,
>>>          return H_UNSUPPORTED_FLAG;
>>>      }
>>> =20
>>> +    if (mflags =3D=3D AIL_0001_8000 && (pcc->insns_flags2 & PPC2_ISA31=
0)) {
>>> +        /* AIL 2 is also reserved in ISA v3.1 */
>>> +        return H_UNSUPPORTED_FLAG;
>>> +    }
>>> +
>>>      spapr_set_all_lpcrs(mflags << LPCR_AIL_SHIFT, LPCR_AIL);
>>> =20
>>>      return H_SUCCESS;
>>> diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
>>> index 118baf8d41..06b6571bc9 100644
>>> --- a/target/ppc/cpu-qom.h
>>> +++ b/target/ppc/cpu-qom.h
>>> @@ -116,6 +116,8 @@ enum powerpc_excp_t {
>>>      POWERPC_EXCP_POWER8,
>>>      /* POWER9 exception model           */
>>>      POWERPC_EXCP_POWER9,
>>> +    /* POWER10 exception model           */
>>> +    POWERPC_EXCP_POWER10,
>>>  };
>>> =20
>>>  /*********************************************************************=
********/
>>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>>> index e73416da68..24e53e0ac3 100644
>>> --- a/target/ppc/cpu.h
>>> +++ b/target/ppc/cpu.h
>>> @@ -354,10 +354,11 @@ typedef struct ppc_v3_pate_t {
>>>  #define LPCR_PECE_U_SHIFT (63 - 19)
>>>  #define LPCR_PECE_U_MASK  (0x7ull << LPCR_PECE_U_SHIFT)
>>>  #define LPCR_HVEE         PPC_BIT(17) /* Hypervisor Virt Exit Enable *=
/
>>> -#define LPCR_RMLS_SHIFT   (63 - 37)
>>> +#define LPCR_RMLS_SHIFT   (63 - 37)   /* RMLS (removed in ISA v3.0) */
>>>  #define LPCR_RMLS         (0xfull << LPCR_RMLS_SHIFT)
>>> +#define LPCR_HAIL         PPC_BIT(37) /* ISA v3.1 HV AIL=3D3 equivalen=
t */
>>>  #define LPCR_ILE          PPC_BIT(38)
>>> -#define LPCR_AIL_SHIFT    (63 - 40)      /* Alternate interrupt locati=
on */
>>> +#define LPCR_AIL_SHIFT    (63 - 40)   /* Alternate interrupt location =
*/
>>>  #define LPCR_AIL          (3ull << LPCR_AIL_SHIFT)
>>>  #define LPCR_UPRT         PPC_BIT(41) /* Use Process Table */
>>>  #define LPCR_EVIRT        PPC_BIT(42) /* Enhanced Virtualisation */
>>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>>> index b8881c0f85..e8bf0598b4 100644
>>> --- a/target/ppc/excp_helper.c
>>> +++ b/target/ppc/excp_helper.c
>>> @@ -197,7 +197,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>>>      CPUState *cs =3D CPU(cpu);
>>>      CPUPPCState *env =3D &cpu->env;
>>>      target_ulong msr, new_msr, vector;
>>> -    int srr0, srr1, asrr0, asrr1, lev =3D -1, ail;
>>> +    int srr0, srr1, asrr0, asrr1, lev =3D -1;
>>> +    int ail, hail, using_ail;
>>>      bool lpes0;
>>> =20
>>>      qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
>>> @@ -239,24 +240,39 @@ static inline void powerpc_excp(PowerPCCPU *cpu, =
int excp_model, int excp)
>>>       * On anything else, we behave as if LPES0 is 1
>>>       * (externals don't alter MSR:HV)
>>>       *
>>> -     * AIL is initialized here but can be cleared by
>>> -     * selected exceptions
>>> +     * ail/hail are initialized here but can be cleared by
>>> +     * selected exceptions, and other conditions afterwards.
>>>       */
>>>  #if defined(TARGET_PPC64)
>>>      if (excp_model =3D=3D POWERPC_EXCP_POWER7 ||
>>>          excp_model =3D=3D POWERPC_EXCP_POWER8 ||
>>> -        excp_model =3D=3D POWERPC_EXCP_POWER9) {
>>> +        excp_model =3D=3D POWERPC_EXCP_POWER9 ||
>>> +        excp_model =3D=3D POWERPC_EXCP_POWER10) {
>>>          lpes0 =3D !!(env->spr[SPR_LPCR] & LPCR_LPES0);
>>>          if (excp_model !=3D POWERPC_EXCP_POWER7) {
>>>              ail =3D (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
>>>          } else {
>>>              ail =3D 0;
>>>          }
>>> +        if (excp_model =3D=3D POWERPC_EXCP_POWER10) {
>>> +            if (AIL_0001_8000) {
>>=20
>> if (2)
>>=20
>>> +                ail =3D 0; /* AIL=3D2 is reserved in ISA v3.1 */
>>> +            }
>>> +
>>> +            if (env->spr[SPR_LPCR] & LPCR_HAIL) {
>>> +                hail =3D AIL_C000_0000_0000_4000;
>>> +            } else {
>>> +                hail =3D 0;
>>> +            }
>>> +        } else {
>>> +            hail =3D ail;
>>=20
>> I think it's better if we set hail =3D 0 here. Read on...
>>=20
>>> +        }
>>>      } else
>>>  #endif /* defined(TARGET_PPC64) */
>>>      {
>>>          lpes0 =3D true;
>>>          ail =3D 0;
>>> +        hail =3D 0;
>>>      }
>>> =20
>>>      /*
>>> @@ -316,6 +332,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>>>              new_msr |=3D (target_ulong)MSR_HVB;
>>>          }
>>>          ail =3D 0;
>>> +        hail =3D 0;
>>> =20
>>>          /* machine check exceptions don't have ME set */
>>>          new_msr &=3D ~((target_ulong)1 << MSR_ME);
>>> @@ -520,6 +537,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>>>              }
>>>          }
>>>          ail =3D 0;
>>> +        hail =3D 0;
>>>          break;
>>>      case POWERPC_EXCP_DSEG:      /* Data segment exception            =
       */
>>>      case POWERPC_EXCP_ISEG:      /* Instruction segment exception     =
       */
>>> @@ -773,7 +791,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>>>          } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
>>>              new_msr |=3D (target_ulong)1 << MSR_LE;
>>>          }
>>> -    } else if (excp_model =3D=3D POWERPC_EXCP_POWER9) {
>>> +    } else if (excp_model =3D=3D POWERPC_EXCP_POWER9 ||
>>> +               excp_model =3D=3D POWERPC_EXCP_POWER10) {
>>>          if (new_msr & MSR_HVB) {
>>>              if (env->spr[SPR_HID0] & HID0_POWER9_HILE) {
>>>                  new_msr |=3D (target_ulong)1 << MSR_LE;
>>> @@ -791,22 +810,77 @@ static inline void powerpc_excp(PowerPCCPU *cpu, =
int excp_model, int excp)
>>>  #endif
>>> =20
>>>      /*
>>> -     * AIL only works if MSR[IR] and MSR[DR] are both enabled.
>>> +     * The ail variable is for AIL behaviour for interrupts that begin
>>> +     * execution with MSR[HV]=3D0, and the hail variable is for AIL be=
haviour for
>>> +     * interrupts that begin execution with MSR[HV]=3D1.
>>> +     *
>>> +     * There is a large matrix of behaviours depending on the processo=
r and
>>> +     * the current operating modes when the interrupt is taken, and th=
e
>>> +     * interrupt type. The below tables lists behaviour for interrupts=
 except
>>> +     * for SRESET, machine check, and HMI (which are all taken in real=
 mode
>>> +     * with AIL 0).
>>> +     *
>>> +     * POWER8, POWER9 with LPCR[HR]=3D0
>>> +     * | LPCR[AIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
>>> +     * +-----------+-------------+---------+-------------+-----+
>>> +     * | a         | 00/01/10    | x       | x           | 0   |
>>> +     * | a         | 11          | 0       | 1           | 0   |
>>> +     * | a         | 11          | 1       | 1           | a   |
>>> +     * | a         | 11          | 0       | 0           | a   |
>>> +     * +-------------------------------------------------------+
>>> +     *
>>> +     * POWER9 with LPCR[HR]=3D1
>>> +     * | LPCR[AIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
>>> +     * +-----------+-------------+---------+-------------+-----+
>>> +     * | a         | 00/01/10    | x       | x           | 0   |
>>> +     * | a         | 11          | x       | x           | a   |
>>> +     * +-------------------------------------------------------+
>>> +     *
>>> +     * The difference with POWER9 being that MSR[HV] 0->1 interrupts c=
an be
>>> +     * sent to the hypervisor in AIL mode if the guest is radix (LPCR[=
HR]=3D1).
>>> +     * This is good for performance but allows the guest to influence =
the
>>> +     * AIL of the hypervisor interrupt using its MSR, and also the hyp=
ervisor
>>> +     * must disallow guest interrupts (MSR[HV] 0->0) from using AIL if=
 the
>>> +     * hypervisor does not want to use AIL for its MSR[HV] 0->1 interr=
upts.
>>> +     *
>>> +     * POWER10 addresses those issues with a new LPCR[HAIL] bit that i=
s
>>> +     * applied to interrupt that begin execution with MSR[HV]=3D1 (so =
both
>>> +     * MSR[HV] 0->1 and 1->1).
>>=20
>> I'd put take these two paragraphs in the commit message as well. Just
>> alter the beginning:
>> s/The difference with POWER9 being that/In POWER9,/
>>=20
>>> +     *
>>> +     * POWER10 behaviour is
>>> +     * | LPCR[AIL] | LPCR[HAIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] =
| AIL |
>>> +     * +-----------+------------+-------------+---------+-------------=
+-----+
>>> +     * | a         | h          | 00/01/10    | 0       | 0           =
| 0   |
>>> +     * | a         | h          | 11          | 0       | 0           =
| a   |
>>> +     * | a         | h          | x           | 0       | 1           =
| h   |
>>> +     * | a         | h          | 00/01/10    | 1       | 1           =
| 0   |
>>> +     * | a         | h          | 11          | 1       | 1           =
| h   |
>>> +     * +--------------------------------------------------------------=
------+
>>>       */
>>> -    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
>>> -        ail =3D 0;
>>> -    }
>>> =20
>>> -    /*
>>> -     * AIL does not work if there is a MSR[HV] 0->1 transition and the
>>> -     * partition is in HPT mode. For radix guests, such interrupts are
>>> -     * allowed to be delivered to the hypervisor in ail mode.
>>> -     */
>>> -    if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) {
>>> -        if (!(env->spr[SPR_LPCR] & LPCR_HR)) {
>>> +    if (excp_model =3D=3D POWERPC_EXCP_POWER8 ||
>>> +        excp_model =3D=3D POWERPC_EXCP_POWER9) {
>>> +        if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
>>>              ail =3D 0;
>>> +            hail =3D 0;
>>> +        } else if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) {
>>> +            if (!(env->spr[SPR_LPCR] & LPCR_HR)) {
>>> +                hail =3D 0;
>>> +            }
>>> +        }
>>> +    } else if (excp_model =3D=3D POWERPC_EXCP_POWER10) {
>>> +        if ((new_msr & MSR_HVB) =3D=3D (msr & MSR_HVB)) {
>>> +            if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
>>> +                ail =3D 0;
>>> +                hail =3D 0;
>>> +            }
>>>          }
>>>      }
>>> +    if (new_msr & MSR_HVB) {
>>> +        using_ail =3D hail;
>>> +    } else {
>>> +        using_ail =3D ail;
>>> +    }
>>=20
>> So if at the start of the function we set:
>>=20
>> <=3D P7:
>> ail =3D 0;
>> hail =3D 0;
>>=20
>> P8,P9:
>> ail =3D LPCR_AIL;
>> hail =3D 0;
>>=20
>> P10:
>> ail =3D LPCR_AIL, except AIL2;
>> hail =3D AIL3;
>>=20
>> Then we could do this, which I think is more readable (comments are just
>> for the email):
>>=20
>> // If there's an HV transition to 1, then HPT zeroes AIL and radix
>> // doesn't. For P10 we'll use HAIL anyway, so no need to check.
>>=20
>> if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) &&
>>     !(env->spr[SPR_LPCR] & LPCR_HR)) {
>>           ail =3D 0;
>> }
>>=20
>> // If P10 and HV=3D1, use HAIL instead of AIL
>>=20
>> if (excp_model =3D=3D POWERPC_EXCP_POWER10 && (new_msr & MSR_HVB)) {
>>    ail =3D hail;
>> }
>>=20
>> // The IR|DR check always takes precedence and zeroes AIL/HAIL, no
>> matter the processor version.
>>=20
>> if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
>>     ail =3D 0;
>> }
>>=20
>> (...)
>>=20
>> vector |=3D ppc_excp_vector_offset(cs, ail);
>>=20
>> I think that should work...*squints*=20
>> What do you think?
>=20
> The powerpc_excp() routine is insane.
>=20
> It feels that we should be duplicating the code in handlers for each=20
> of the POWER[7-10] CPUs and keep a default powerpc_excp() for the
> others.

It's getting pretty wild :(

I was trying to come up with something in the way of a "fix" but I agree=20
it needs a bigger reorganisation.

What would help a lot actually is moving all the AIL logic together. The=20
only reason it's split completely in two like this is so a few=20
interrupts can clear it. I think what would work better is just do all
that in one place, in the AIL logic. Let me see what that looks like. It
might actually be a saner fix in the end.

Thanks,
Nick


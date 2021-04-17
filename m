Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB17B362D28
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 05:18:34 +0200 (CEST)
Received: from localhost ([::1]:36916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXbTd-0002IZ-FY
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 23:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lXbSK-0001m0-UO; Fri, 16 Apr 2021 23:17:13 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:43751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lXbSI-0000X4-VV; Fri, 16 Apr 2021 23:17:12 -0400
Received: by mail-pf1-x436.google.com with SMTP id p67so14622143pfp.10;
 Fri, 16 Apr 2021 20:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=TdcNTEoRJ0RChK6iyfCJUnt0k8mL2jYQLuvcxl5JN7M=;
 b=D657ZC6BgWIRzHTOWosRjm2cr82/GG4gvxM2/DacDqzL/hczhnP0J6NEp3NOCOuxy2
 +Ek+mACmwSknYAaTOHpQUB/Jm1NuirBzsPSb3vfP6l1nAdH9en9C4lzUKPxe/CyQ5FlP
 aIFfYTeSVkj3HRDJISkdQogPk/NxpS6ePiZ0GdZFW6dWyXnxur0qfTjj0n9les9fLPex
 8A+Y784kGzYHYjkDhB1m7zKYJTvzIEzqXsTZ0NEf5wxnIIDD5XvdS+KBNXyOY3vzIbbU
 6gos9Wnni/q1CDTUjlnN5lX08V5BUw33N/ZjKBXKOiRb5D3Vwn7SRo/vz+Lod9CQIICA
 SYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=TdcNTEoRJ0RChK6iyfCJUnt0k8mL2jYQLuvcxl5JN7M=;
 b=flV5KRBb9k3snyo5LzDh0NY6JD3ADCtw90Sw8oYn64xS2LMtGduDPFnp03Azs0/QVP
 RpLtNTF7ApJhDHHc4eo0MjOOnALWz2rArgPJFoJMo4KUw4Qj0/dd7HU8AfSsKnUKv+ou
 FiqWnLGKip4NOXeSQXLLn6ZXuqzItyqju6I9GxyM7CKt42WOr+Wjoh4A1cDK2AOQRXA4
 bR6BXMQujwkYeJ4v2+uBOVtegxY8qvD+6qTI7bcNCoU+CiteDyP/uSR5nl+9rrZ5soKA
 sg+jRnNYzEOZ6iAU1b/rkbh1M/9Td5IbrqGLTgWl8rESoe+TDkLuryiUBxe//Egvpncp
 A4aw==
X-Gm-Message-State: AOAM530pTXyK6GWPeKGg7hDosfPmp3V2O5CE5l3Zyzq/ME7npk+WPkuy
 gFVO5he28oFdiqIJZbT+9fA=
X-Google-Smtp-Source: ABdhPJyi4YrpiPVzm6507a3aC+rSxxIgjF+8gqlvZJnoMWMET3K+tPVmim7KTpOS48sFKWqn/cNeoQ==
X-Received: by 2002:a63:ff0a:: with SMTP id k10mr1858476pgi.303.1618629428503; 
 Fri, 16 Apr 2021 20:17:08 -0700 (PDT)
Received: from localhost (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id z17sm6769296pjn.47.2021.04.16.20.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 20:17:08 -0700 (PDT)
Date: Sat, 17 Apr 2021 13:17:01 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 3/4] target/ppc: Rework AIL logic in interrupt delivery
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210415054227.1793812-1-npiggin@gmail.com>
 <20210415054227.1793812-4-npiggin@gmail.com>
 <YHkRk653hdZwUZiq@yekko.fritz.box>
In-Reply-To: <YHkRk653hdZwUZiq@yekko.fritz.box>
MIME-Version: 1.0
Message-Id: <1618627370.x7ngc3hv1o.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x436.google.com
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
Cc: qemu-devel@nongnu.org, =?iso-8859-1?q?C=E9dric?= Le Goater <clg@fr.ibm.com>,
 qemu-ppc@nongnu.org, =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from David Gibson's message of April 16, 2021 2:24 pm:
> On Thu, Apr 15, 2021 at 03:42:26PM +1000, Nicholas Piggin wrote:
>> The AIL logic is becoming unmanageable spread all over powerpc_excp(),
>> and it is slated to get even worse with POWER10 support.
>>=20
>> Move it all to a new helper function.
>>=20
>> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
> Looks like a nice cleanup overall, just a few minor comments.
>=20
>> ---
>>  hw/ppc/spapr_hcall.c            |   3 +-
>>  target/ppc/cpu.h                |   8 --
>>  target/ppc/excp_helper.c        | 159 ++++++++++++++++++++------------
>>  target/ppc/translate_init.c.inc |   2 +-
>>  4 files changed, 102 insertions(+), 70 deletions(-)
>>=20
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index 7b5cd3553c..2fbe04a689 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -1395,7 +1395,8 @@ static target_ulong h_set_mode_resource_addr_trans=
_mode(PowerPCCPU *cpu,
>>          return H_P4;
>>      }
>> =20
>> -    if (mflags =3D=3D AIL_RESERVED) {
>> +    if (mflags =3D=3D 1) {
>> +        /* AIL=3D1 is reserved */
>>          return H_UNSUPPORTED_FLAG;
>>      }
>> =20
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index e73416da68..5200a16d23 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -2375,14 +2375,6 @@ enum {
>>      HMER_XSCOM_STATUS_MASK      =3D PPC_BITMASK(21, 23),
>>  };
>> =20
>> -/* Alternate Interrupt Location (AIL) */
>> -enum {
>> -    AIL_NONE                =3D 0,
>> -    AIL_RESERVED            =3D 1,
>> -    AIL_0001_8000           =3D 2,
>> -    AIL_C000_0000_0000_4000 =3D 3,
>> -};
>=20
> Yeah, I always thought these particular constants were a but
> pointless.
>=20
>> -
>>  /**********************************************************************=
*******/
>> =20
>>  #define is_isa300(ctx) (!!(ctx->insns_flags2 & PPC2_ISA300))
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index b8881c0f85..964a58cfdc 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -136,25 +136,105 @@ static int powerpc_reset_wakeup(CPUState *cs, CPU=
PPCState *env, int excp,
>>      return POWERPC_EXCP_RESET;
>>  }
>> =20
>> -static uint64_t ppc_excp_vector_offset(CPUState *cs, int ail)
>> +/*
>> + * AIL - Alternate Interrupt Location, a mode that allows interrupts to=
 be
>> + * taken with the MMU on, and which uses an alternate location (e.g., s=
o the
>> + * kernel/hv can map the vectors there with an effective address).
>> + *
>> + * An interrupt is considered to be taken "with AIL" or "AIL applies" i=
f they
>> + * are delivered in this way. AIL requires the LPCR to be set to enable=
 this
>> + * mode, and then a number of conditions have to be true for AIL to app=
ly.
>> + *
>> + * First of all, SRESET, MCE, and HMI are always delivered without AIL,=
 because
>> + * they specifically want to be in real mode (e.g., the MCE might be si=
gnaling
>> + * a SLB multi-hit which requires SLB flush before the MMU can be enabl=
ed).
>> + *
>> + * After that, behaviour depends on the current MSR[IR], MSR[DR], MSR[H=
V],
>> + * whether or not the interrupt changes MSR[HV] from 0 to 1, and the cu=
rrent
>> + * radix mode (LPCR[HR]).
>> + *
>> + * POWER8, POWER9 with LPCR[HR]=3D0
>> + * | LPCR[AIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
>> + * +-----------+-------------+---------+-------------+-----+
>> + * | a         | 00/01/10    | x       | x           | 0   |
>> + * | a         | 11          | 0       | 1           | 0   |
>> + * | a         | 11          | 1       | 1           | a   |
>> + * | a         | 11          | 0       | 0           | a   |
>> + * +-------------------------------------------------------+
>> + *
>> + * POWER9 with LPCR[HR]=3D1
>> + * | LPCR[AIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
>> + * +-----------+-------------+---------+-------------+-----+
>> + * | a         | 00/01/10    | x       | x           | 0   |
>> + * | a         | 11          | x       | x           | a   |
>> + * +-------------------------------------------------------+
>> + *
>> + * The difference with POWER9 being that MSR[HV] 0->1 interrupts can be=
 sent to
>> + * the hypervisor in AIL mode if the guest is radix.
>> + */
>> +static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, =
int excp,
>> +                                      target_ulong msr,
>> +                                      target_ulong *new_msr,
>> +                                      target_ulong *vector)
>>  {
>> -    uint64_t offset =3D 0;
>> +#if defined(TARGET_PPC64)
>> +    CPUPPCState *env =3D &cpu->env;
>> +    bool mmu_all_on =3D ((msr >> MSR_IR) & 1) && ((msr >> MSR_DR) & 1);
>> +    bool hv_escalation =3D !(msr & MSR_HVB) && (*new_msr & MSR_HVB);
>> +    int ail =3D 0;
>> +
>> +    if (excp =3D=3D POWERPC_EXCP_MCHECK ||
>> +        excp =3D=3D POWERPC_EXCP_RESET ||
>> +        excp =3D=3D POWERPC_EXCP_HV_MAINT) {
>> +        /* SRESET, MCE, HMI never apply AIL */
>> +        return;
>> +    }
>> =20
>> -    switch (ail) {
>> -    case AIL_NONE:
>> -        break;
>> -    case AIL_0001_8000:
>> -        offset =3D 0x18000;
>> -        break;
>> -    case AIL_C000_0000_0000_4000:
>> -        offset =3D 0xc000000000004000ull;
>> -        break;
>> -    default:
>> -        cpu_abort(cs, "Invalid AIL combination %d\n", ail);
>> -        break;
>> +    if (excp_model =3D=3D POWERPC_EXCP_POWER8 ||
>> +        excp_model =3D=3D POWERPC_EXCP_POWER9) {
>> +        if (!mmu_all_on) {
>> +            /* AIL only works if MSR[IR] and MSR[DR] are both enabled. =
*/
>> +            return;
>> +        }
>> +        if (hv_escalation && !(env->spr[SPR_LPCR] & LPCR_HR)) {
>> +            /*
>> +             * AIL does not work if there is a MSR[HV] 0->1 transition =
and the
>> +             * partition is in HPT mode. For radix guests, such interru=
pts are
>> +             * allowed to be delivered to the hypervisor in ail mode.
>> +             */
>> +            return;
>> +        }
>> +
>> +        ail =3D (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
>> +        if (ail !=3D 2 && ail !=3D 3) {
>> +            /* AIL=3D1 is reserved */
>=20
> So, AIL=3D=3D0 and AIL=3D=3D1 are treated the same here, but for kinda
> different reasons.  AIL=3D=3D0 means no offset should be applied.  AIL=3D=
=3D1
> is invalid, so we're just ignoring AIL in that case.

Could comment that specifically at least.

> I wonder if it would make things clearer to filter the AIL=3D=3D1 case at
> LPCR write time, and just assert() it's not the case here.

Let's discuss that in the next mail.

>=20
>> +            return;
>> +        }
>> +    } else {
>> +        /* Other processors do not support AIL */
>> +        return;
>>      }
>> =20
>> -    return offset;
>> +    /*
>> +     * AIL applies, so the new MSR gets IR and DR set, and an offset ap=
plied
>> +     * to the new IP.
>> +     */
>> +    *new_msr |=3D (1 << MSR_IR) | (1 << MSR_DR);
>> +
>> +    if (excp !=3D POWERPC_EXCP_SYSCALL_VECTORED) {
>> +        if (ail =3D=3D 2) {
>> +            *vector |=3D 0x0000000000018000ull;
>> +        } else if (ail =3D=3D 3) {
>> +            *vector |=3D 0xc000000000004000ull;
>> +        }
>> +    } else {
>> +        /* scv AIL is a little different */
>=20
> What happens with AIL=3D=3D2 and an SCV?  I mean, here it's as if AIL=3D=
=3D0,
> but is that right?  If so, I think we should comment it to make it
> clear that's not an omission.

Yes as far as I can tell that's what the ISA specifies (i.e., NIA is
unchanged).

Sure a comment can be added.

Thanks,
Nick


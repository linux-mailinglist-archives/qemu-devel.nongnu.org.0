Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D77362D33
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 05:32:34 +0200 (CEST)
Received: from localhost ([::1]:39732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXbhB-00041z-4j
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 23:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lXbgA-0003bQ-Cf; Fri, 16 Apr 2021 23:31:31 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:33788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lXbg1-0000pq-0R; Fri, 16 Apr 2021 23:31:28 -0400
Received: by mail-pl1-x62d.google.com with SMTP id n10so3814445plc.0;
 Fri, 16 Apr 2021 20:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=JjTTb2jwAv4hx8Evuu9M4WvzhLMRZvsUK2U10/F93Uc=;
 b=rzUXde9HMHyR4mz5a5U2BQ7S+hWtAsT3b/OEGkHBfWRGXn/iUc06iukJkkWAHMag0P
 YmULkcimKUVajRBybAN73UQWJEG7mGfxOu2i+iX6XZNsuzuuSJbjS3Bl7C86wJ010ptC
 VLB9/ao+u21hLKS5kuEqZFml+0317PIGN3EoGVEF1TatT3rKRn+Z0qZcyHpfoArleO4O
 u3aaZ1J9rGG++HhxLhzghMA2M8hw9WoHIStXIo6ggGgN6NUmG8GqpYD6hKXu01DkeFUS
 pQprUlEz/WOtmJD/I8APwxC8b8OfNteXpmHt0IMH9u7s3joFi/sKPszXbfjrBP5h4S6Z
 QonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=JjTTb2jwAv4hx8Evuu9M4WvzhLMRZvsUK2U10/F93Uc=;
 b=ul3D5c0tdNaf4TZnj04EidG/IDGgWbbJUtbRul+1NV1ElOTWKM3/QfmqfQjxUzw9kc
 8fBlFOIeYS2V0HKQmr7TmrNGIBjuaAS8Xgxt0Ov5DMAKFuyRWaO393rvnOMVM141s7xA
 Wvyawu7Yl4/UFAqgLfjFx660AwRahNogpPMPcrD1iwpULlYr6bg62Y5ru/MKk6yLjXxJ
 IxekCCDFvIK+M3uFqRYejAxLwVbV7eEUitfTZe3MyfsLxSK7LcmsOVdlcmVRL+NTDsPT
 8BoGxnr4F+hc5W5zl8qAWxcMMQbCWqiZgMPg+R5otqxMSPGmsFHQDtERrku9HDWo/E5L
 QVIQ==
X-Gm-Message-State: AOAM5313Z+XXg7N7qKuXVdsHZauegWUoLGzpzhmyejRCvT3vuttkqGV7
 Uno8cZc3VsqWhf8+Kzp0448=
X-Google-Smtp-Source: ABdhPJwh3LrWtAtzYvR+SlvCeiot2bm6rk6GdDgoRvxj2z42yFEH21y8hZepvSTxs6DyJnqpZL1LFQ==
X-Received: by 2002:a17:902:8ec1:b029:e9:998d:91f3 with SMTP id
 x1-20020a1709028ec1b02900e9998d91f3mr12293539plo.59.1618630279213; 
 Fri, 16 Apr 2021 20:31:19 -0700 (PDT)
Received: from localhost (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id a7sm5459759pfg.65.2021.04.16.20.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 20:31:18 -0700 (PDT)
Date: Sat, 17 Apr 2021 13:31:13 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 4/4] target/ppc: Add POWER10 exception model
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210415054227.1793812-1-npiggin@gmail.com>
 <20210415054227.1793812-5-npiggin@gmail.com>
 <YHkSiZD/LncmrKeX@yekko.fritz.box>
In-Reply-To: <YHkSiZD/LncmrKeX@yekko.fritz.box>
MIME-Version: 1.0
Message-Id: <1618629454.ok8dh0opzx.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x62d.google.com
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

Excerpts from David Gibson's message of April 16, 2021 2:28 pm:
> On Thu, Apr 15, 2021 at 03:42:27PM +1000, Nicholas Piggin wrote:
>> POWER10 adds a new bit that modifies interrupt behaviour, LPCR[HAIL],
>> and it removes support for the LPCR[AIL]=3D0b10 mode.
>>=20
>> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  hw/ppc/spapr_hcall.c            |  7 ++++-
>>  target/ppc/cpu-qom.h            |  2 ++
>>  target/ppc/cpu.h                |  5 ++--
>>  target/ppc/excp_helper.c        | 51 +++++++++++++++++++++++++++++++--
>>  target/ppc/translate.c          |  3 +-
>>  target/ppc/translate_init.c.inc |  2 +-
>>  6 files changed, 62 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index 2fbe04a689..6802cd4dc8 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -1396,7 +1396,12 @@ static target_ulong h_set_mode_resource_addr_tran=
s_mode(PowerPCCPU *cpu,
>>      }
>> =20
>>      if (mflags =3D=3D 1) {
>> -        /* AIL=3D1 is reserved */
>> +        /* AIL=3D1 is reserved in POWER8/POWER9 */
>> +        return H_UNSUPPORTED_FLAG;
>> +    }
>> +
>> +    if (mflags =3D=3D 2 && (pcc->insns_flags2 & PPC2_ISA310)) {
>> +        /* AIL=3D2 is also reserved in POWER10 (ISA v3.1) */
>>          return H_UNSUPPORTED_FLAG;
>>      }
>> =20
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
>> =20
>>  /**********************************************************************=
*******/
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 5200a16d23..9d35cdfa92 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -354,10 +354,11 @@ typedef struct ppc_v3_pate_t {
>>  #define LPCR_PECE_U_SHIFT (63 - 19)
>>  #define LPCR_PECE_U_MASK  (0x7ull << LPCR_PECE_U_SHIFT)
>>  #define LPCR_HVEE         PPC_BIT(17) /* Hypervisor Virt Exit Enable */
>> -#define LPCR_RMLS_SHIFT   (63 - 37)
>> +#define LPCR_RMLS_SHIFT   (63 - 37)   /* RMLS (removed in ISA v3.0) */
>>  #define LPCR_RMLS         (0xfull << LPCR_RMLS_SHIFT)
>> +#define LPCR_HAIL         PPC_BIT(37) /* ISA v3.1 HV AIL=3D3 equivalent=
 */
>>  #define LPCR_ILE          PPC_BIT(38)
>> -#define LPCR_AIL_SHIFT    (63 - 40)      /* Alternate interrupt locatio=
n */
>> +#define LPCR_AIL_SHIFT    (63 - 40)   /* Alternate interrupt location *=
/
>>  #define LPCR_AIL          (3ull << LPCR_AIL_SHIFT)
>>  #define LPCR_UPRT         PPC_BIT(41) /* Use Process Table */
>>  #define LPCR_EVIRT        PPC_BIT(42) /* Enhanced Virtualisation */
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 964a58cfdc..38a1482519 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -170,7 +170,27 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUPP=
CState *env, int excp,
>>   * +-------------------------------------------------------+
>>   *
>>   * The difference with POWER9 being that MSR[HV] 0->1 interrupts can be=
 sent to
>> - * the hypervisor in AIL mode if the guest is radix.
>> + * the hypervisor in AIL mode if the guest is radix. This is good for
>> + * performance but allows the guest to influence the AIL of hypervisor
>> + * interrupts using its MSR, and also the hypervisor must disallow gues=
t
>> + * interrupts (MSR[HV] 0->0) from using AIL if the hypervisor does not =
want to
>> + * use AIL for its MSR[HV] 0->1 interrupts.
>> + *
>> + * POWER10 addresses those issues with a new LPCR[HAIL] bit that is app=
lied to
>> + * interrupts that begin execution with MSR[HV]=3D1 (so both MSR[HV] 0-=
>1 and
>> + * MSR[HV] 1->1).
>> + *
>> + * HAIL=3D1 is equivalent to AIL=3D3, for interrupts delivered with MSR=
[HV]=3D1.
>> + *
>> + * POWER10 behaviour is
>> + * | LPCR[AIL] | LPCR[HAIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL=
 |
>> + * +-----------+------------+-------------+---------+-------------+----=
-+
>> + * | a         | h          | 00/01/10    | 0       | 0           | 0  =
 |
>> + * | a         | h          | 11          | 0       | 0           | a  =
 |
>> + * | a         | h          | x           | 0       | 1           | h  =
 |
>> + * | a         | h          | 00/01/10    | 1       | 1           | 0  =
 |
>> + * | a         | h          | 11          | 1       | 1           | h  =
 |
>> + * +-------------------------------------------------------------------=
-+
>>   */
>>  static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, =
int excp,
>>                                        target_ulong msr,
>> @@ -210,6 +230,29 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *c=
pu, int excp_model, int excp,
>>              /* AIL=3D1 is reserved */
>>              return;
>>          }
>> +
>> +    } else if (excp_model =3D=3D POWERPC_EXCP_POWER10) {
>> +        if (!mmu_all_on && !hv_escalation) {
>> +            /*
>> +             * AIL works for HV interrupts even with guest MSR[IR/DR] d=
isabled.
>> +             * Guest->guest and HV->HV interrupts do require MMU on.
>> +             */
>> +            return;
>> +        }
>> +
>> +        if (*new_msr & MSR_HVB) {
>> +            if (!(env->spr[SPR_LPCR] & LPCR_HAIL)) {
>> +                /* HV interrupts depend on LPCR[HAIL] */
>> +                return;
>> +            }
>> +            ail =3D 3; /* HAIL=3D1 gives AIL=3D3 behaviour for HV inter=
rupts */
>> +        } else {
>> +            ail =3D (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
>> +        }
>> +        if (ail !=3D 3) {
>> +            /* AIL=3D1 and AIL=3D2 are reserved */
>> +            return;
>=20
> As with POWER9, I wonder if we should actuall filter this at LPCR
> write time and assert() here.

Could do. The processor is allowed to read back reserved bits as 0. I=20
can't quite see how reserved values in multi bit fields are treated
though. Neither bits are reserved but the value 2 is. If you write 3
then 2, would the second write also clear bit 0, or would it ignore
the write and leave bit 1 set? I don't see either being explicitly
allowed so it might retain the value 2 I suspect.

> On actual hardware, what will happen if you attempt to write a bad AIL
> to the LPCR?

Good question, I don't know. We don't have an easy way to place a
interrupt handler at 0x17000 in Linux I think. I'll see if I can
get some data.

Thanks,
Nick


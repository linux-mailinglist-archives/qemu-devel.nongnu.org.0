Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EBD4B7C58
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 02:20:29 +0100 (CET)
Received: from localhost ([::1]:42462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK8zc-0006JA-3l
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 20:20:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nK8vx-00043r-Vo; Tue, 15 Feb 2022 20:16:42 -0500
Received: from [2607:f8b0:4864:20::1032] (port=51074
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nK8vv-0001oR-Lr; Tue, 15 Feb 2022 20:16:41 -0500
Received: by mail-pj1-x1032.google.com with SMTP id m7so1093162pjk.0;
 Tue, 15 Feb 2022 17:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=8NOfaK7p9e1a8Gk50BUK1gXvXsMrfxmVANU4NDgvdP8=;
 b=IcoR/d0VpEuvzlAu+YhkEbtuuDDFlPtfA98UmenNq76doxfuiO4fOeuWAezPPND7bh
 X/gx67LziIA0IfrcMWcD91yiKE8R1Rq04uc7FcqFC+/ZNxe7pI6Cdiyr95EjgyqS0WbS
 xX6wy0NCC1eJrRTnEwpxLNv8/MT/6TkoBm9mh6SRteoNEdse8X/ATREh88tDYbLVB/6w
 HYQ3I7waHyDLiwva7TwgGdCtRMxIQT8EejU9AjroDA0esyhiYcciaw+NGambxd9J4AFg
 dHPr0gWUPXJcjmxhEMoafkkKlparUGufydgmmUkJSHZOPLf7SwSyeL926ogOMpxbN2b/
 Efbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=8NOfaK7p9e1a8Gk50BUK1gXvXsMrfxmVANU4NDgvdP8=;
 b=h/Espeb2bw/c6eezxZJwq7VAhlgxoG3kOrx4768uCrxbHOMhAZs7/ydv6+lkrHLQ6k
 EUZ9xlQjGFN61T+JORJZmgtf0kV/BvQpuZ+v/etnhKp9mdA7HB8l/dzOcqQ/L9IMVvw6
 VzV9uC3GAWCtjk8x+kdvsGxbIfSkegAqM82K29H0lz9i1aWYmSNTRcSiOHFM5ag0qSH/
 Y8RIHTNl8EkkOaXxhAxM7868U/l9rT8rHPQqJcsIKr0IcCntkKumvvxlOj5FCT4iFnyV
 6ffDuLQBEOfrq8gtebxytRU04lttOZ32VeYkPY3rkfTA/01K3Pth0BHFRiqinH7hhJF/
 wP6Q==
X-Gm-Message-State: AOAM533LGQhVPpEFleYYeNWm71fgyq7RivfyYKD9cMqQBZjUX7CBXcQJ
 MHUwXjxH4IGlQo6Hk40I5jM=
X-Google-Smtp-Source: ABdhPJzWNr6m0KwuVQ19y8Zgq62gDta5VGaWdIvObW8v9jq4u6mx9LfZSQvLa9pYuw65ZZi6DVocEw==
X-Received: by 2002:a17:90a:7e8a:b0:1b9:e0fc:73ae with SMTP id
 j10-20020a17090a7e8a00b001b9e0fc73aemr7350024pjl.17.1644974197512; 
 Tue, 15 Feb 2022 17:16:37 -0800 (PST)
Received: from localhost (60-241-140-189.static.tpgi.com.au. [60.241.140.189])
 by smtp.gmail.com with ESMTPSA id
 q9sm3589052pgf.73.2022.02.15.17.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 17:16:37 -0800 (PST)
Date: Wed, 16 Feb 2022 11:16:32 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 9/9] spapr: implement nested-hv capability for the virtual
 hypervisor
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org
References: <20220215031642.1691873-1-npiggin@gmail.com>
 <20220215031642.1691873-10-npiggin@gmail.com>
 <bf41591f-e456-688e-a5be-4325a590b7be@kaod.org>
In-Reply-To: <bf41591f-e456-688e-a5be-4325a590b7be@kaod.org>
MIME-Version: 1.0
Message-Id: <1644972569.qjmfk874wg.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from C=C3=A9dric Le Goater's message of February 16, 2022 4:21 am:
> On 2/15/22 04:16, Nicholas Piggin wrote:
>> This implements the Nested KVM HV hcall API for spapr under TCG.
>>=20
>> The L2 is switched in when the H_ENTER_NESTED hcall is made, and the
>> L1 is switched back in returned from the hcall when a HV exception
>> is sent to the vhyp. Register state is copied in and out according to
>> the nested KVM HV hcall API specification.
>>=20
>> The hdecr timer is started when the L2 is switched in, and it provides
>> the HDEC / 0x980 return to L1.
>>=20
>> The MMU re-uses the bare metal radix 2-level page table walker by
>> using the get_pate method to point the MMU to the nested partition
>> table entry. MMU faults due to partition scope errors raise HV
>> exceptions and accordingly are routed back to the L1.
>>=20
>> The MMU does not tag translations for the L1 (direct) vs L2 (nested)
>> guests, so the TLB is flushed on any L1<->L2 transition (hcall entry
>> and exit).
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   hw/ppc/spapr.c         |  32 +++-
>>   hw/ppc/spapr_caps.c    |  11 +-
>>   hw/ppc/spapr_hcall.c   | 321 +++++++++++++++++++++++++++++++++++++++++
>>   include/hw/ppc/spapr.h |  74 +++++++++-
>>   target/ppc/cpu.h       |   3 +
>>   5 files changed, 431 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 3a5cf92c94..6988e3ec76 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -1314,11 +1314,32 @@ static bool spapr_get_pate(PPCVirtualHypervisor =
*vhyp, PowerPCCPU *cpu,
>>   {
>>       SpaprMachineState *spapr =3D SPAPR_MACHINE(vhyp);
>>  =20
>> -    assert(lpid =3D=3D 0);
>> +    if (!cpu->in_spapr_nested) {
>=20
> Since 'in_spapr_nested' is a spapr CPU characteristic, I don't think
> it belongs to PowerPCCPU. See the end of the patch, for a proposal.

SpaprCpuState. Certainly that's a better place, I must have missed it.

>=20
> btw, this helps the ordering of files :
>=20
> [diff]
> 	orderFile =3D /path/to/qemu/scripts/git.orderfile
>=20
>> +        assert(lpid =3D=3D 0);
>>  =20
>> -    /* Copy PATE1:GR into PATE0:HR */
>> -    entry->dw0 =3D spapr->patb_entry & PATE0_HR;
>> -    entry->dw1 =3D spapr->patb_entry;
>> +        /* Copy PATE1:GR into PATE0:HR */
>> +        entry->dw0 =3D spapr->patb_entry & PATE0_HR;
>> +        entry->dw1 =3D spapr->patb_entry;
>> +
>> +    } else {
>> +        uint64_t patb, pats;
>> +
>> +        assert(lpid !=3D 0);
>> +
>> +        patb =3D spapr->nested_ptcr & PTCR_PATB;
>> +        pats =3D spapr->nested_ptcr & PTCR_PATS;
>> +
>> +        /* Calculate number of entries */
>> +        pats =3D 1ull << (pats + 12 - 4);
>> +        if (pats <=3D lpid) {
>> +            return false;
>> +        }
>> +
>> +        /* Grab entry */
>> +        patb +=3D 16 * lpid;
>> +        entry->dw0 =3D ldq_phys(CPU(cpu)->as, patb);
>> +        entry->dw1 =3D ldq_phys(CPU(cpu)->as, patb + 8);
>> +    }
>>  =20
>>       return true;
>>   }
>> @@ -4472,7 +4493,7 @@ PowerPCCPU *spapr_find_cpu(int vcpu_id)
>>  =20
>>   static bool spapr_cpu_in_nested(PowerPCCPU *cpu)
>>   {
>> -    return false;
>> +    return cpu->in_spapr_nested;
>>   }
>>  =20
>>   static void spapr_cpu_exec_enter(PPCVirtualHypervisor *vhyp, PowerPCCP=
U *cpu)
>> @@ -4584,6 +4605,7 @@ static void spapr_machine_class_init(ObjectClass *=
oc, void *data)
>>       nc->nmi_monitor_handler =3D spapr_nmi;
>>       smc->phb_placement =3D spapr_phb_placement;
>>       vhc->cpu_in_nested =3D spapr_cpu_in_nested;
>> +    vhc->deliver_hv_excp =3D spapr_exit_nested;
>>       vhc->hypercall =3D emulate_spapr_hypercall;
>>       vhc->hpt_mask =3D spapr_hpt_mask;
>>       vhc->map_hptes =3D spapr_map_hptes;
>> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
>> index 5cc80776d0..4d8bb2ad2c 100644
>> --- a/hw/ppc/spapr_caps.c
>> +++ b/hw/ppc/spapr_caps.c
>> @@ -444,19 +444,22 @@ static void cap_nested_kvm_hv_apply(SpaprMachineSt=
ate *spapr,
>>   {
>>       ERRP_GUARD();
>>       PowerPCCPU *cpu =3D POWERPC_CPU(first_cpu);
>> +    CPUPPCState *env =3D &cpu->env;
>>  =20
>>       if (!val) {
>>           /* capability disabled by default */
>>           return;
>>       }
>>  =20
>> -    if (tcg_enabled()) {
>> -        error_setg(errp, "No Nested KVM-HV support in TCG");
>=20
> I don't like using KVM-HV (which is KVM-over-PowerNV) when talking about
> KVM-over-pseries. I think the platform name is important. Anyhow, this is
> a more global discussion but we should talk about it someday because thes=
e
> HV mode are becoming confusing ! We have PR also :)

The cap is nested-hv and QEMU describes it nested KVM HV. Are we stuck
with that? That could make a name change even more confusing.

It's really a new backend for the KVM HV front end. Like how POWER8 /
POWER9 bare metal backends are completely different now.

But I guess that does not help the end user to understand. On the other
hand, the user might not think "HV" is the HV mode of the CPU and just
thinks of it as "hypervisor".

I like paravirt-hv but nested-hv is not too bad. Anyway I'm happy to
change it.

>=20
>=20
>> +    if (!(env->insns_flags2 & PPC2_ISA300)) {
>> +        error_setg(errp, "Nested KVM-HV only supported on POWER9 and la=
ter");
>>           error_append_hint(errp, "Try appending -machine cap-nested-hv=
=3Doff\n");
>=20
> return ?

Yep.

>> +static target_ulong h_enter_nested(PowerPCCPU *cpu,
>> +                                   SpaprMachineState *spapr,
>> +                                   target_ulong opcode,
>> +                                   target_ulong *args)
>> +{
>> +    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
>> +    CPUState *cs =3D CPU(cpu);
>> +    CPUPPCState *env =3D &cpu->env;
>> +    target_ulong hv_ptr =3D args[0];
>> +    target_ulong regs_ptr =3D args[1];
>> +    target_ulong hdec, now =3D cpu_ppc_load_tbl(env);
>> +    target_ulong lpcr, lpcr_mask;
>> +    struct kvmppc_hv_guest_state *hvstate;
>> +    struct kvmppc_hv_guest_state hv_state;
>> +    struct kvmppc_pt_regs *regs;
>> +    hwaddr len;
>> +    uint32_t cr;
>> +    int i;
>> +
>> +    if (cpu->in_spapr_nested) {
>> +        return H_FUNCTION;
>=20
> That would be an L3 :)

Well if the L2 makes the hcall, vhyp won't handle it but rather it=20
will cause L2 exit to L1 and the L1 will handle the H_ENTER_NESTED
hcall. So we can (and have) run an L3 guest under the L2 of this
machine :)

This is probably more of an assert(!cpu->in_spapr_nested). Actually
that assert could go in the general spapr hypercall handler.

>=20
>> +    }
>> +    if (spapr->nested_ptcr =3D=3D 0) {
>> +        return H_NOT_AVAILABLE;
>> +    }
>> +
>> +    len =3D sizeof(*hvstate);
>> +    hvstate =3D cpu_physical_memory_map(hv_ptr, &len, true);
>=20
> When a CPU is available, I would prefer :
>=20
>      hvstate =3D address_space_map(CPU(cpu)->as, hv_ptr, &len, true,
>                                MEMTXATTRS_UNSPECIFIED);
>     =20
> like ppc_hash64_map_hptes() does. This is minor.

I'll check it out. Still not entire sure about read+write access
though.

>=20
>> +    if (!hvstate || len !=3D sizeof(*hvstate)) {
>> +        return H_PARAMETER;
>> +    }
>> +
>> +    memcpy(&hv_state, hvstate, len);
>> +
>> +    cpu_physical_memory_unmap(hvstate, len, 0 /* read */, len /* access=
 len */);
>=20
> checkpatch will complain with the above comments.

Yeah it did. Turns out I also had a bug where I missed setting write=20
access further down.

>=20
>> +
>> +    /*
>> +     * We accept versions 1 and 2. Version 2 fields are unused because =
TCG
>> +     * does not implement DAWR*.
>> +     */
>> +    if (hv_state.version > HV_GUEST_STATE_VERSION) {
>> +        return H_PARAMETER;
>> +    }
>> +
>> +    cpu->nested_host_state =3D g_try_malloc(sizeof(CPUPPCState));
>=20
> I think we could preallocate this buffer once we know nested are supporte=
d,
> or if we keep it, it could be our 'in_spapr_nested' indicator.

That's true. I kind of liked to allocate on demand, but for performance=20
and robustness might be better to keep it around (could allocate when we
see a H_SET_PARTITION_TABLE.

I'll just keep it as is for the first iteration. Probably in fact we=20
would rather make a specific structure for it that only has what we
require rather than the entire CPUPPCState so all this can be optimised
a bit in a later round.

>> +struct kvmppc_hv_guest_state {
>> +    uint64_t version;        /* version of this structure layout, must =
be first */
>> +    uint32_t lpid;
>> +    uint32_t vcpu_token;
>> +    /* These registers are hypervisor privileged (at least for writing)=
 */
>> +    uint64_t lpcr;
>> +    uint64_t pcr;
>> +    uint64_t amor;
>> +    uint64_t dpdes;
>> +    uint64_t hfscr;
>> +    int64_t tb_offset;
>> +    uint64_t dawr0;
>> +    uint64_t dawrx0;
>> +    uint64_t ciabr;
>> +    uint64_t hdec_expiry;
>> +    uint64_t purr;
>> +    uint64_t spurr;
>> +    uint64_t ic;
>> +    uint64_t vtb;
>> +    uint64_t hdar;
>> +    uint64_t hdsisr;
>> +    uint64_t heir;
>> +    uint64_t asdr;
>> +    /* These are OS privileged but need to be set late in guest entry *=
/
>> +    uint64_t srr0;
>> +    uint64_t srr1;
>> +    uint64_t sprg[4];
>> +    uint64_t pidr;
>> +    uint64_t cfar;
>> +    uint64_t ppr;
>> +    /* Version 1 ends here */
>> +    uint64_t dawr1;
>> +    uint64_t dawrx1;
>> +    /* Version 2 ends here */
>> +};
>> +
>> +/* Latest version of hv_guest_state structure */
>> +#define HV_GUEST_STATE_VERSION  2
>> +
>> +/* Linux 64-bit powerpc pt_regs struct, used by nested HV */
>> +struct kvmppc_pt_regs {
>> +    uint64_t gpr[32];
>> +    uint64_t nip;
>> +    uint64_t msr;
>> +    uint64_t orig_gpr3;    /* Used for restarting system calls */
>> +    uint64_t ctr;
>> +    uint64_t link;
>> +    uint64_t xer;
>> +    uint64_t ccr;
>> +    uint64_t softe;        /* Soft enabled/disabled */
>> +    uint64_t trap;         /* Reason for being here */
>> +    uint64_t dar;          /* Fault registers */
>> +    uint64_t dsisr;        /* on 4xx/Book-E used for ESR */
>> +    uint64_t result;       /* Result of a system call */
>> +};
>=20
> The above structs are shared with KVM for this QEMU implementation.
>=20
> I don't think they belong to asm-powerpc/kvm.h but how could we keep them
> in sync ? The version should be protecting us from unexpected changes.

Not sure how we should do that. How are other PAPR API definitions kept
in synch? I guess they just have a document spec for the upstream. Paul
made a spec document for the nested HV stuff, not sure if he's put it up
in public anywhere. Maybe we could maintain it in linux/Documentation/
or similar?

Anyway for now I guess we keep this?

>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index d8cc956c97..65c4401130 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -1301,6 +1301,9 @@ struct PowerPCCPU {
>>       bool pre_2_10_migration;
>>       bool pre_3_0_migration;
>>       int32_t mig_slb_nr;
>> +
>> +    bool in_spapr_nested;
>> +    CPUPPCState *nested_host_state;
>>   };  =20
>=20
> These new fields belong to SpaprCpuState. I shouldn't be too hard to adap=
t.

Thanks for the pointer, that's what I was looking for. Must not have
looked very hard :)

Thanks,
Nick


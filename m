Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF154B5E45
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 00:31:51 +0100 (CET)
Received: from localhost ([::1]:46412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJkow-0000rx-0i
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 18:31:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJklV-0007Up-Qu; Mon, 14 Feb 2022 18:28:18 -0500
Received: from [2607:f8b0:4864:20::431] (port=45905
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJklT-000235-MX; Mon, 14 Feb 2022 18:28:17 -0500
Received: by mail-pf1-x431.google.com with SMTP id p10so11218216pfo.12;
 Mon, 14 Feb 2022 15:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=tlwGCVdZmAJjoJdpb964kX3NL+Equ/twi1Dw4QlXJxA=;
 b=UFe6Iwg0VLwgccZRNXBBHQuMfSgGe+4rK0/jzwJlGtnZxhzC+bzeDNJcy3+NIkP+AV
 717PEu2oAfXVaMBveA++j88UEXGOZTpmDjKYVIL3EDafk3XqQxQ7Uu7fi9BvY7nq3j2p
 qsq6K9fe7Li7j3YLzYNYa4WYMLKzZfPI+Ycw13tbaHGzmyLx5NwouWrnG/k7OlxV4dFi
 ++qlqBwVBCFQTckwlUgZpY/gu+c+3h8UnAmxsHyKN8mXL2RgwYtgGOLwL9UOMGKqV67p
 GQsRlvC/2VNB5G4glbE/Uky5i33HBp7X34psbs43oJ9F0/2pSbJ8eGg2WSjwQyNtvS9u
 5Tow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=tlwGCVdZmAJjoJdpb964kX3NL+Equ/twi1Dw4QlXJxA=;
 b=V6kB2YARFvl3dksFhvhdzyJoXnR9Xkxy7oB20jSWvA0gCfyGknzAP6fXfYVQkRU8FL
 xcDUXvJAuZr3HGu8up0NcKGm6kmYuze5ziXTJkw9K6D3CwG8LTcBJjyGyMW7FsjGeDRt
 X2KUxKTbvWx4px1kD6HA028yiCMFkXqG+jFnF6tm4OoqMHvwNcUz+B/nNMBC/X2lOQyW
 VPSevAK4bx4E+9u9D5Ab4yHQTLK1qlXwNE22nHevQdWwE9YIxH6f/VB065SUmMn00XLp
 7YgHe/nDrQJxDHsb5q3DmM/7A311lWqQxp7FJrtbOTa8dTwqXSowS2lmq9VBqKiG4IXw
 BJCw==
X-Gm-Message-State: AOAM530bKV6WljGc8uW52Se471nF5XFG/NvkZfuXIK0ALkbq5wI0d9gU
 okP/yr3nbM0dVXTV4SbtMlPLhDDPDSM=
X-Google-Smtp-Source: ABdhPJy2qfVDN3wOYLnmjXLeI2QUQYMlB42hmi7ZuzK39AxbYF9okPuokU0McJYt2NB9jxFfWrjR3g==
X-Received: by 2002:a65:6b8f:: with SMTP id d15mr1198943pgw.452.1644881293803; 
 Mon, 14 Feb 2022 15:28:13 -0800 (PST)
Received: from localhost (27-33-251-132.static.tpgi.com.au. [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id g22sm20935460pfk.219.2022.02.14.15.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 15:28:13 -0800 (PST)
Date: Tue, 15 Feb 2022 09:28:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 3/3] spapr: implement nested-hv support for the TCG
 virtual hypervisor
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org
References: <20220210065340.1276367-1-npiggin@gmail.com>
 <20220210065340.1276367-4-npiggin@gmail.com>
 <aaaf8ca4-9685-f600-9082-bc3a80eb59c9@kaod.org>
In-Reply-To: <aaaf8ca4-9685-f600-9082-bc3a80eb59c9@kaod.org>
MIME-Version: 1.0
Message-Id: <1644881088.rvm7j0emi0.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from C=C3=A9dric Le Goater's message of February 15, 2022 4:31 am:
> On 2/10/22 07:53, Nicholas Piggin wrote:
>> +void cpu_ppc_hdecr_init (CPUPPCState *env)
>> +{
>> +    PowerPCCPU *cpu =3D env_archcpu(env);
>> +
>> +    assert(env->tb_env->hdecr_timer =3D=3D NULL);
>> +
>> +    env->tb_env->hdecr_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_=
ppc_hdecr_cb,
>> +                                                 cpu);
>> +}
>> +
>> +void cpu_ppc_hdecr_exit (CPUPPCState *env)
>> +{
>> +    PowerPCCPU *cpu =3D env_archcpu(env);
>> +
>> +    timer_free(env->tb_env->hdecr_timer);
>> +    env->tb_env->hdecr_timer =3D NULL;
>> +
>> +    cpu_ppc_hdecr_lower(cpu);
>> +}
>=20
>=20
> So these are called every time a L2 enters or exits ?

Yes.

>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 3d6ec309dd..f0c3f726f2 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -1273,6 +1273,8 @@ static void emulate_spapr_hypercall(PPCVirtualHype=
rvisor *vhyp,
>>       if (msr_pr) {
>>           hcall_dprintf("Hypercall made with MSR[PR]=3D1\n");
>>           env->gpr[3] =3D H_PRIVILEGE;
>> +    } else if (env->gpr[3] =3D=3D KVMPPC_H_ENTER_NESTED) {
>> +        spapr_enter_nested(cpu);
>=20
> Can not this be in the hcall table ?

See reply to Fabiano, I think it can be.

>>       } else {
>>           env->gpr[3] =3D spapr_hypercall(cpu, env->gpr[3], &env->gpr[4]=
);
>>       }
>> @@ -4465,6 +4467,17 @@ PowerPCCPU *spapr_find_cpu(int vcpu_id)
>>       return NULL;
>>   }
>>  =20
>> +static bool spapr_cpu_in_nested(PowerPCCPU *cpu)
>> +{
>> +    return cpu->in_spapr_nested;
>> +}
>=20
> This handler is not very much used.

Yeah, I have improved that in the current code, hopefully doesn't=20
open-code cpu->in_spapr_nested anywhere outside spapr specifics.

>> +void spapr_enter_nested(PowerPCCPU *cpu)
>> +{
>> +    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
>> +    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
>> +    CPUState *cs =3D CPU(cpu);
>> +    CPUPPCState *env =3D &cpu->env;
>> +    target_ulong hv_ptr =3D env->gpr[4];
>> +    target_ulong regs_ptr =3D env->gpr[5];
>> +    target_ulong hdec, now =3D cpu_ppc_load_tbl(env);
>> +    struct kvmppc_hv_guest_state *hvstate;
>> +    struct kvmppc_hv_guest_state hv_state;
>> +    struct kvmppc_pt_regs *regs;
>> +    hwaddr len;
>> +    uint32_t cr;
>> +    int i;
>> +
>> +    if (cpu->in_spapr_nested) {
>> +        env->gpr[3] =3D H_FUNCTION;
>> +        return;
>> +    }
>> +    if (spapr->nested_ptcr =3D=3D 0) {
>> +        env->gpr[3] =3D H_NOT_AVAILABLE;
>> +        return;
>> +    }
>> +
>> +    len =3D sizeof(*hvstate);
>> +    hvstate =3D cpu_physical_memory_map(hv_ptr, &len,=20
>=20
> Are you writing to the state ? address_space_map() is a better pratice.

Yes, in exit_nested it gets written. I'll take a look at=20
address_space_map().

>> @@ -916,7 +924,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int =
excp)
>>           env->nip +=3D 4;
>>  =20
>>           /* "PAPR mode" built-in hypercall emulation */
>> -        if ((lev =3D=3D 1) && cpu->vhyp) {
>> +        if ((lev =3D=3D 1) && cpu->vhyp && !cpu->in_spapr_nested) {
>=20
> an helper for (cpu->vhyp && !cpu->in_spapr_nested) would help.

Yeah, I put some helpers in the mmu code since this patch which is=20
nicer. Will try to do the same for this.

Thanks,
Nick


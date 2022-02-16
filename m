Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9447C4B87BC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 13:32:42 +0100 (CET)
Received: from localhost ([::1]:34016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKJU9-000307-7r
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 07:32:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKJRo-0001DQ-Pf; Wed, 16 Feb 2022 07:30:16 -0500
Received: from [2607:f8b0:4864:20::1034] (port=47099
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKJRl-00086L-J1; Wed, 16 Feb 2022 07:30:16 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 t4-20020a17090a510400b001b8c4a6cd5dso2210686pjh.5; 
 Wed, 16 Feb 2022 04:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=KeqFZuBBd/ckbyJRALhbMNGMUEQ9lRyAl3ivDqVy2v0=;
 b=a1A/ncu3oQLoZBmqejBqLfk9j2otSyMRbhsQYrGo6TMwzmGZ8eXNULqiRGaZoNYZDB
 vUoStZvsVEUpJxbcjfXyLjL+9Etgrh0Id3wB1JIVbYNEAQor7AEs8DkeK8xNQzzHu9XY
 lqy9AnwrSorO7naa8ilnf8HJ8nbWCw27pSbEoUz/X+cU/SbEYRXP1Er++5ubdwW3klzT
 XUgEFmXxk5L9BLpKCLOFVRtmWmETKw/X8ESlWBPZ8UFMLjP0FpBx3KFIHLbd8eoWtVTc
 NKNgn+VJxQHXHlrTb5pGzoOzjIV+VxUUYtwz6Yl27zYrLkJ0/XYIxOvrxfW10b62hkAV
 9Azw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=KeqFZuBBd/ckbyJRALhbMNGMUEQ9lRyAl3ivDqVy2v0=;
 b=lAzP4iGChtnMR893sclQa4fUvneeTtKQFDgJFdLpeonTwcATS2PJV2zhE/uVTF0oCL
 +7mur0K+yb6bWrjhP5uZ/+lNpcuczaax4ct4S7yHZerFDCzXshBuyqEYEEUbxjLw6Yc3
 kFIF8+6p1TC1STO1Iwx0eSx9trdFort29aUElk3qOAipeDzRzhuachM8J5AtgSB3547y
 h4FKn6tmDhEGsyGt6gGIKBuooG7dWK1MTezVeLJiyt2VyxM5ZSPiyXqJYCcToArwTYim
 Tkv6qhJEPnHaFdA4P2dX1CyIP4dczs7QXDNwlPfOlN4d1twZwhxD9fVQaQTcZ2Chl765
 agsg==
X-Gm-Message-State: AOAM531zUAsC15Spfy5efd67P90uYKRpIdcjse4eiObFmDS6yG8uh/CH
 ad3ASrtUnZiK7gxDjQpFyy0=
X-Google-Smtp-Source: ABdhPJzlv/GR7XkU9BxVMbBloylCUydxAZXrG4CaIY4u6i9a0rUaoES7Y8UqprUmzKszpDKUMip3ZQ==
X-Received: by 2002:a17:90b:f13:b0:1b9:c387:d0f3 with SMTP id
 br19-20020a17090b0f1300b001b9c387d0f3mr1466749pjb.226.1645014611825; 
 Wed, 16 Feb 2022 04:30:11 -0800 (PST)
Received: from localhost (193-116-225-41.tpgi.com.au. [193.116.225.41])
 by smtp.gmail.com with ESMTPSA id gk15sm21078361pjb.3.2022.02.16.04.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 04:30:11 -0800 (PST)
Date: Wed, 16 Feb 2022 22:30:05 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 9/9] spapr: implement nested-hv capability for the
 virtual hypervisor
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org
References: <20220216102545.1808018-1-npiggin@gmail.com>
 <20220216102545.1808018-10-npiggin@gmail.com>
 <e8c5834c-22bc-a33d-832e-566284d1daeb@kaod.org>
 <1645011231.6p1nag6ali.astroid@bobo.none>
In-Reply-To: <1645011231.6p1nag6ali.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1645014400.s86cqubb0a.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: =?iso-8859-1?q?Daniel=0A?= Henrique Barboza <danielhb413@gmail.com>,
 qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from Nicholas Piggin's message of February 16, 2022 9:38 pm:
> Excerpts from C=C3=A9dric Le Goater's message of February 16, 2022 8:52 p=
m:
>> On 2/16/22 11:25, Nicholas Piggin wrote:
>>> This implements the Nested KVM HV hcall API for spapr under TCG.
>>>=20
>>> The L2 is switched in when the H_ENTER_NESTED hcall is made, and the
>>> L1 is switched back in returned from the hcall when a HV exception
>>> is sent to the vhyp. Register state is copied in and out according to
>>> the nested KVM HV hcall API specification.
>>>=20
>>> The hdecr timer is started when the L2 is switched in, and it provides
>>> the HDEC / 0x980 return to L1.
>>>=20
>>> The MMU re-uses the bare metal radix 2-level page table walker by
>>> using the get_pate method to point the MMU to the nested partition
>>> table entry. MMU faults due to partition scope errors raise HV
>>> exceptions and accordingly are routed back to the L1.
>>>=20
>>> The MMU does not tag translations for the L1 (direct) vs L2 (nested)
>>> guests, so the TLB is flushed on any L1<->L2 transition (hcall entry
>>> and exit).>
>>> Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>=20
>> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>=20
>> Some last comments below,
>=20
> [...]
>=20
>>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>>> index edbf3eeed0..852fe61b36 100644
>>> --- a/include/hw/ppc/spapr.h
>>> +++ b/include/hw/ppc/spapr.h
>>> @@ -199,6 +199,9 @@ struct SpaprMachineState {
>>>       bool has_graphics;
>>>       uint32_t vsmt;       /* Virtual SMT mode (KVM's "core stride") */
>>>  =20
>>> +    /* Nested HV support (TCG only) */
>>> +    uint64_t nested_ptcr;
>>> +
>>=20
>> this is new state to migrate.
>>=20
>=20
> [...]
>=20
>>> +/* Linux 64-bit powerpc pt_regs struct, used by nested HV */
>>> +struct kvmppc_pt_regs {
>>> +    uint64_t gpr[32];
>>> +    uint64_t nip;
>>> +    uint64_t msr;
>>> +    uint64_t orig_gpr3;    /* Used for restarting system calls */
>>> +    uint64_t ctr;
>>> +    uint64_t link;
>>> +    uint64_t xer;
>>> +    uint64_t ccr;
>>> +    uint64_t softe;        /* Soft enabled/disabled */
>>> +    uint64_t trap;         /* Reason for being here */
>>> +    uint64_t dar;          /* Fault registers */
>>> +    uint64_t dsisr;        /* on 4xx/Book-E used for ESR */
>>> +    uint64_t result;       /* Result of a system call */
>>> +};
>>=20
>> I think we need to start moving all the spapr hcall definitions under
>> spapr_hcall.h. It can come later.
>=20
> Sure.
>=20
> [...]
>=20
>>> diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu=
_core.h
>>> index dab3dfc76c..b560514560 100644
>>> --- a/include/hw/ppc/spapr_cpu_core.h
>>> +++ b/include/hw/ppc/spapr_cpu_core.h
>>> @@ -48,6 +48,11 @@ typedef struct SpaprCpuState {
>>>       bool prod; /* not migrated, only used to improve dispatch latenci=
es */
>>>       struct ICPState *icp;
>>>       struct XiveTCTX *tctx;
>>> +
>>> +    /* Fields for nested-HV support */
>>> +    bool in_nested; /* true while the L2 is executing */
>>> +    CPUPPCState *nested_host_state; /* holds the L1 state while L2 exe=
cutes */
>>> +    int64_t nested_tb_offset; /* L1->L2 TB offset */
>>=20
>> This needs a new vmstate.
>=20
> How about instead of the vmstate (we would need all the L1 state in
> nested_host_state as well), we just add a migration blocker in the
> L2 entry path. We could limit the max hdecr to say 1 second to
> ensure it unblocks before long.
>=20
> I know migration blockers are not preferred but in this case it gives
> us some iterations to debug and optimise first, which might change
> the data to migrate.

This should be roughly the incremental patch to do this.

Thanks,
Nick

--
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 87e68da77f..14e41b7d31 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2882,6 +2882,13 @@ static void spapr_machine_init(MachineState *machine=
)
             "may run and log hardware error on the destination");
     }
=20
+    if (spapr_get_cap(spapr, SPAPR_CAP_NESTED_KVM_HV) =3D=3D SPAPR_CAP_ON)=
 {
+        /* Create the error string for live migration blocker */
+        error_setg(&spapr->nested_hv_migration_blocker,
+            "A nested-hv L2 guest is running. Migration is blocked until i=
t "
+            "exits to the L1.");
+    }
+
     if (mc->nvdimm_supported) {
         spapr_create_nvdimm_dr_connectors(spapr);
     }
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index e183892287..89295bc723 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -21,6 +21,7 @@
 #include "hw/ppc/spapr_numa.h"
 #include "mmu-book3s-v3.h"
 #include "hw/mem/memory-device.h"
+#include "migration/blocker.h"
=20
 bool is_ram_address(SpaprMachineState *spapr, hwaddr addr)
 {
@@ -1565,7 +1566,7 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
     SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
     target_ulong hv_ptr =3D args[0];
     target_ulong regs_ptr =3D args[1];
-    target_ulong hdec, now =3D cpu_ppc_load_tbl(env);
+    target_ulong hdec, now;
     target_ulong lpcr, lpcr_mask;
     struct kvmppc_hv_guest_state *hvstate;
     struct kvmppc_hv_guest_state hv_state;
@@ -1578,11 +1579,16 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
         return H_NOT_AVAILABLE;
     }
=20
+    if (migrate_add_blocker(spapr->nested_hv_migration_blocker, NULL)) {
+        return 0; /* This returns nothing to the L1, essentially an EAGAIN=
 */
+    }
+
     len =3D sizeof(*hvstate);
     hvstate =3D address_space_map(CPU(cpu)->as, hv_ptr, &len, false,
                                 MEMTXATTRS_UNSPECIFIED);
     if (len !=3D sizeof(*hvstate)) {
         address_space_unmap(CPU(cpu)->as, hvstate, len, 0, false);
+        migrate_del_blocker(spapr->nested_hv_migration_blocker);
         return H_PARAMETER;
     }
=20
@@ -1590,16 +1596,36 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
=20
     address_space_unmap(CPU(cpu)->as, hvstate, len, len, false);
=20
+    spapr_cpu->nested_tb_offset =3D hv_state.tb_offset;
+    spapr_cpu->nested_hdec_expiry =3D hv_state.hdec_expiry;
+
+    now =3D cpu_ppc_load_tbl(env);
+    if (now >=3D hv_state.hdec_expiry) {
+        migrate_del_blocker(spapr->nested_hv_migration_blocker);
+        return env->excp_vectors[POWERPC_EXCP_HDECR];
+    }
+
+    hdec =3D hv_state.hdec_expiry - now;
+    if (hdec > env->tb_env->tb_freq) {
+        /*
+         * Limit hdecr to 1 second to prevent the L1 blocking migration fo=
r
+         * too long with a large hdecr value.
+         */
+        hdec =3D env->tb_env->tb_freq;
+    }
+
     /*
      * We accept versions 1 and 2. Version 2 fields are unused because TCG
      * does not implement DAWR*.
      */
     if (hv_state.version > HV_GUEST_STATE_VERSION) {
+        migrate_del_blocker(spapr->nested_hv_migration_blocker);
         return H_PARAMETER;
     }
=20
     spapr_cpu->nested_host_state =3D g_try_malloc(sizeof(CPUPPCState));
     if (!spapr_cpu->nested_host_state) {
+        migrate_del_blocker(spapr->nested_hv_migration_blocker);
         return H_NO_MEM;
     }
=20
@@ -1611,6 +1637,7 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
     if (!regs || len !=3D sizeof(*regs)) {
         address_space_unmap(CPU(cpu)->as, regs, len, 0, false);
         g_free(spapr_cpu->nested_host_state);
+        migrate_del_blocker(spapr->nested_hv_migration_blocker);
         return H_P2;
     }
=20
@@ -1648,8 +1675,6 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
     /* hv_state.amor is not used */
     env->spr[SPR_DPDES] =3D hv_state.dpdes;
     env->spr[SPR_HFSCR] =3D hv_state.hfscr;
-    hdec =3D hv_state.hdec_expiry - now;
-    spapr_cpu->nested_tb_offset =3D hv_state.tb_offset;
     /* TCG does not implement DAWR*, CIABR, PURR, SPURR, IC, VTB, HEIR SPR=
s*/
     env->spr[SPR_SRR0] =3D hv_state.srr0;
     env->spr[SPR_SRR1] =3D hv_state.srr1;
@@ -1693,6 +1718,7 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
=20
 void spapr_exit_nested(PowerPCCPU *cpu, int excp)
 {
+    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
     CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
     SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
@@ -1781,6 +1807,19 @@ void spapr_exit_nested(PowerPCCPU *cpu, int excp)
     /* Is it okay to specify write length larger than actual data written?=
 */
     address_space_unmap(CPU(cpu)->as, regs, len, len, true);
=20
+    /*
+     * hdecr is capped at entry, so we may exit here with a HDECR exceptio=
n
+     * without having exceeded the guest's limit. Clear the HDECR interrup=
t
+     * return in this case.
+     */
+    if (excp =3D=3D POWERPC_EXCP_HDECR) {
+        target_ulong now;
+        now =3D cpu_ppc_load_tbl(env) - spapr_cpu->nested_tb_offset;
+        if (now < spapr_cpu->nested_hdec_expiry) {
+            r3_return =3D 0;
+        }
+    }
+
 out_restore_l1:
     memcpy(env->gpr, spapr_cpu->nested_host_state->gpr, sizeof(env->gpr));
     env->lr =3D spapr_cpu->nested_host_state->lr;
@@ -1825,6 +1864,8 @@ out_restore_l1:
=20
     g_free(spapr_cpu->nested_host_state);
     spapr_cpu->nested_host_state =3D NULL;
+
+    migrate_del_blocker(spapr->nested_hv_migration_blocker);
 }
=20
 static void hypercall_register_types(void)
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 852fe61b36..70b330ef9a 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -266,6 +266,7 @@ struct SpaprMachineState {
     uint32_t FORM2_assoc_array[NUMA_NODES_MAX_NUM][FORM2_NUMA_ASSOC_SIZE];
=20
     Error *fwnmi_migration_blocker;
+    Error *nested_hv_migration_blocker;
 };
=20
 #define H_SUCCESS         0
diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_cor=
e.h
index b560514560..09da577ca1 100644
--- a/include/hw/ppc/spapr_cpu_core.h
+++ b/include/hw/ppc/spapr_cpu_core.h
@@ -53,6 +53,7 @@ typedef struct SpaprCpuState {
     bool in_nested; /* true while the L2 is executing */
     CPUPPCState *nested_host_state; /* holds the L1 state while L2 execute=
s */
     int64_t nested_tb_offset; /* L1->L2 TB offset */
+    uint64_t nested_hdec_expiry; /* L1 hdec expiry in absolute L1 TB */
 } SpaprCpuState;
=20
 static inline SpaprCpuState *spapr_cpu_state(PowerPCCPU *cpu)


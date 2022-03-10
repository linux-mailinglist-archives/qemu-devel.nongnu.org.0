Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97CF4D52A2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 20:54:00 +0100 (CET)
Received: from localhost ([::1]:55246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSOrH-0000Mx-8u
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 14:53:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nSOpO-0007gm-Sf; Thu, 10 Mar 2022 14:52:03 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50294
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nSOpM-00023q-MX; Thu, 10 Mar 2022 14:52:02 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AIXk5i018825; 
 Thu, 10 Mar 2022 19:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=mApwSTu4Q7020ISewnhrUCehl8T3WkeBzsL4gA1TkQk=;
 b=iMk1Z+xvJ8P0NdfsZf2u+UzK5k0KKoIoY0Wykhlem3dFH1n3AH5QpG3UhA1pAAWUFwk9
 G6HX/rmp6cEnY3CNttyfGknO3fDvW6YhiMB038qlZX5MQVN350XmtcS13RIZP/iIjVd/
 zPsqFSKCnRxWFDqXTzOgPXxuJuBPTdiC1RprMEkKFRwEN97J1qupPG4OMjjcUShPcxAY
 z6LkXBG6PQjjEuhwCjCWz3j4F1wa2yZqjR5j92y7Lm1+W3glLB8zxKg30CgiUfLV0yNo
 NLvyhSks292Fqxqg+N88TEGixLAL/cSy2lvbgx36RtDum2oLW1rS7eE9WOA5M2atYLVl AA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eqgwhk1ve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 19:51:43 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AJQFF4003970;
 Thu, 10 Mar 2022 19:51:42 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eqgwhk1v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 19:51:42 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22AJgwOp021413;
 Thu, 10 Mar 2022 19:51:41 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 3ekyg9wpeu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 19:51:41 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22AJpelP28049684
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 19:51:40 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBD46C6059;
 Thu, 10 Mar 2022 19:51:39 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55326C605A;
 Thu, 10 Mar 2022 19:51:39 +0000 (GMT)
Received: from localhost (unknown [9.163.19.102])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 10 Mar 2022 19:51:39 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 1/2] spapr: Report correct GTSE support via ov5
In-Reply-To: <20220309012400.2527157-1-farosas@linux.ibm.com>
References: <20220309012400.2527157-1-farosas@linux.ibm.com>
Date: Thu, 10 Mar 2022 16:51:37 -0300
Message-ID: <87wnh1a8mu.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eKAIvSgsj641uwCgsSbP3PIfuRJY1a-E
X-Proofpoint-ORIG-GUID: c-lZgYszrOPIx5fHX4fmAIzpujiDI_3Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_09,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100100
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: aneesh.kumar@linux.ibm.com, danielhb413@gmail.com, npiggin@gmail.com,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fabiano Rosas <farosas@linux.ibm.com> writes:

> QEMU reports MMU support to the guest via the ibm,architecture-vec-5
> property of the /chosen node. Byte number 26 specifies Radix Table
> Expansions, currently only GTSE (Guest Translation Shootdown
> Enable). This feature determines whether the tlbie instruction (and
> others) are HV privileged.
>
> Up until now, we always reported GTSE=1 to guests. Even after the
> support for GTSE=0 was added. As part of that support, a kernel
> command line radix_hcall_invalidate=on was introduced that overrides
> the GTSE value received via CAS. So a guest can run with GTSE=0 and
> use the H_RPT_INVALIDATE hcall instead of tlbie.
>
> In this scenario, having GTSE always set to 1 by QEMU leads to a crash
> when running nested KVM guests because KVM does not allow a nested
> hypervisor to set GTSE support for its nested guests. So a nested
> guest always uses the same value for LPCR_GTSE as its HV. Since the
> nested HV disabled GTSE, but the L2 QEMU always reports GTSE=1, we run
> into a crash when:
>
> L1 LPCR_GTSE=0
> L2 LPCR_GTSE=0
> L2 CAS GTSE=1
>
> The nested guest will run 'tlbie' and crash because the HW looks at
> LPCR_GTSE, which is clear.
>
> Having GTSE disabled in the L1 and enabled in the L2 is not an option
> because the whole purpose of GTSE is to disallow access to tlbie and
> we cannot allow L1 to spawn L2s that can access features that L1
> itself cannot.
>
> We also cannot have the guest check the LPCR bit, because LPCR is
> HV-privileged.
>
> So this patch goes through the most intuitive route which is to have
> QEMU ask KVM about GTSE support and advertise the correct value to the
> guest. A new KVM_CAP_PPC_GTSE capability is being added.
>
> TCG continues to always enable GTSE.
>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  hw/ppc/spapr.c       | 38 +++++++++++++++++++++++++++++++-------
>  target/ppc/kvm.c     |  8 ++++++++
>  target/ppc/kvm_ppc.h |  6 ++++++
>  3 files changed, 45 insertions(+), 7 deletions(-)
>
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 4cc204f90d..3e95a1831f 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -971,7 +971,7 @@ static void spapr_dt_ov5_platform_support(SpaprMachineState *spapr, void *fdt,
>          23, 0x00, /* XICS / XIVE mode */
>          24, 0x00, /* Hash/Radix, filled in below. */
>          25, 0x00, /* Hash options: Segment Tables == no, GTSE == no. */
> -        26, 0x40, /* Radix options: GTSE == yes. */
> +        26, 0x00, /* Radix options, filled in below. */
>      };
>  
>      if (spapr->irq->xics && spapr->irq->xive) {
> @@ -1000,10 +1000,16 @@ static void spapr_dt_ov5_platform_support(SpaprMachineState *spapr, void *fdt,
>          } else {
>              val[3] = 0x00; /* Hash */
>          }
> +
> +        if (kvmppc_has_cap_gtse()) {
> +            val[7] = 0x40 /* OV5_MMU_RADIX_GTSE */;
> +        }

This needs the same treatment as below to support kernels that don't
know about the cap. Also, look at that semicolon! =D

>      } else {
>          /* V3 MMU supports both hash and radix in tcg (with dynamic switching) */
>          val[3] = 0xC0;
> +        val[7] = 0x40 /* OV5_MMU_RADIX_GTSE */;
>      }
> +
>      _FDT(fdt_setprop(fdt, chosen, "ibm,arch-vec-5-platform-support",
>                       val, sizeof(val)));
>  }
> @@ -2824,14 +2830,32 @@ static void spapr_machine_init(MachineState *machine)
>      /* Init numa_assoc_array */
>      spapr_numa_associativity_init(spapr, machine);
>  
> -    if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
> -        ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_00, 0,
> +    if (ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_00, 0,
>                                spapr->max_compat_pvr)) {
> -        spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_300);
> -        /* KVM and TCG always allow GTSE with radix... */
> -        spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_GTSE);
> +
> +        /* TCG always supports Radix w/ GTSE */
> +        if (!kvm_enabled()) {
> +            spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_300);
> +            spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_GTSE);
> +        } else {
> +            if (kvmppc_has_cap_mmu_radix()) {
> +                spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_300);
> +            }
> +
> +            /*
> +             * Only disable Guest Translation Shootdown if KVM
> +             * supports the H_RPT_INVALIDATE hypercall, otherwise we'd
> +             * leave the guest with no way to make TLB invalidations.
> +             */
> +            if (kvmppc_has_cap_rpt_invalidate()) {
> +                if (kvmppc_has_cap_gtse()) {
> +                    spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_GTSE);
> +                }
> +            } else {
> +                spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_GTSE);
> +            }
> +        }
>      }
> -    /* ... but not with hash (currently). */
>  
>      if (kvm_enabled()) {
>          /* Enable H_LOGICAL_CI_* so SLOF can talk to in-kernel devices */
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index dc93b99189..91582c4b15 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -90,6 +90,7 @@ static int cap_ppc_nested_kvm_hv;
>  static int cap_large_decr;
>  static int cap_fwnmi;
>  static int cap_rpt_invalidate;
> +static int cap_gtse;
>  
>  static uint32_t debug_inst_opcode;
>  
> @@ -154,6 +155,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>      }
>  
>      cap_rpt_invalidate = kvm_vm_check_extension(s, KVM_CAP_PPC_RPT_INVALIDATE);
> +    cap_gtse = kvm_vm_check_extension(s, KVM_CAP_PPC_GTSE);
> +
>      kvm_ppc_register_host_cpu_type();
>  
>      return 0;
> @@ -2397,6 +2400,11 @@ bool kvmppc_has_cap_mmu_hash_v3(void)
>      return cap_mmu_hash_v3;
>  }
>  
> +bool kvmppc_has_cap_gtse(void)
> +{
> +    return cap_gtse;
> +}
> +
>  static bool kvmppc_power8_host(void)
>  {
>      bool ret = false;
> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> index ee9325bf9a..7d6980edb7 100644
> --- a/target/ppc/kvm_ppc.h
> +++ b/target/ppc/kvm_ppc.h
> @@ -63,6 +63,7 @@ bool kvmppc_has_cap_fixup_hcalls(void);
>  bool kvmppc_has_cap_htm(void);
>  bool kvmppc_has_cap_mmu_radix(void);
>  bool kvmppc_has_cap_mmu_hash_v3(void);
> +bool kvmppc_has_cap_gtse(void);
>  bool kvmppc_has_cap_xive(void);
>  int kvmppc_get_cap_safe_cache(void);
>  int kvmppc_get_cap_safe_bounds_check(void);
> @@ -343,6 +344,11 @@ static inline bool kvmppc_has_cap_mmu_hash_v3(void)
>      return false;
>  }
>  
> +static inline bool kvmppc_has_cap_gtse(void)
> +{
> +    return false;
> +}
> +
>  static inline bool kvmppc_has_cap_xive(void)
>  {
>      return false;


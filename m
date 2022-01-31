Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD234A4704
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 13:27:24 +0100 (CET)
Received: from localhost ([::1]:53284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEVmF-0006uY-R2
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 07:27:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUZ6-0006E7-9Z; Mon, 31 Jan 2022 06:09:45 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:5010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYy-00056I-8h; Mon, 31 Jan 2022 06:09:42 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VAc0SC017225; 
 Mon, 31 Jan 2022 11:08:47 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx33wtjnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:47 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VB2A5L006656;
 Mon, 31 Jan 2022 11:08:45 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3dvw79afyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:44 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20VB8gn842271044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 11:08:42 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80EECA4040;
 Mon, 31 Jan 2022 11:08:42 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21F09A4053;
 Mon, 31 Jan 2022 11:08:42 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 31 Jan 2022 11:08:42 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.57.185])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 43880220149;
 Mon, 31 Jan 2022 12:08:41 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 34/41] target/ppc: Simplify powerpc_excp_74xx
Date: Mon, 31 Jan 2022 12:08:04 +0100
Message-Id: <20220131110811.619053-35-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131110811.619053-1-clg@kaod.org>
References: <20220131110811.619053-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1_c1UAmLifgvLdKKeZjd7DLItmhpx0Nn
X-Proofpoint-ORIG-GUID: 1_c1UAmLifgvLdKKeZjd7DLItmhpx0Nn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 bulkscore=0
 adultscore=0 impostorscore=0 mlxlogscore=541 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310074
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

Differences from the generic powerpc_excp code:

- Not BookE, so some MSR bits are cleared at interrupt dispatch;
- No MSR_HV;
- No power saving states;
- No Hypervisor Emulation Assistance;
- Not 64 bits;
- No System call vectored;
- No Alternate Interrupt Location.

Exceptions used:

POWERPC_EXCP_ALIGN
POWERPC_EXCP_DECR
POWERPC_EXCP_DSI
POWERPC_EXCP_EXTERNAL
POWERPC_EXCP_FPU
POWERPC_EXCP_IABR
POWERPC_EXCP_ISI
POWERPC_EXCP_MCHECK
POWERPC_EXCP_PERFM
POWERPC_EXCP_PROGRAM
POWERPC_EXCP_RESET
POWERPC_EXCP_SMI
POWERPC_EXCP_SYSCALL
POWERPC_EXCP_THERM
POWERPC_EXCP_TRACE
POWERPC_EXCP_VPU
POWERPC_EXCP_VPUA

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20220127201116.1154733-3-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 211 ++-------------------------------------
 1 file changed, 9 insertions(+), 202 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 0e3d3ffcf488..13e5cb3ddcdb 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -568,54 +568,26 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int =
excp)
                   excp, env->error_code);
=20
     /* new srr1 value excluding must-be-zero bits */
-    if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
-        msr =3D env->msr;
-    } else {
-        msr =3D env->msr & ~0x783f0000ULL;
-    }
+    msr =3D env->msr & ~0x783f0000ULL;
=20
     /*
-     * new interrupt handler msr preserves existing HV and ME unless
+     * new interrupt handler msr preserves existing ME unless
      * explicitly overriden
      */
-    new_msr =3D env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
+    new_msr =3D env->msr & ((target_ulong)1 << MSR_ME);
=20
     /* target registers */
     srr0 =3D SPR_SRR0;
     srr1 =3D SPR_SRR1;
=20
-    /*
-     * check for special resume at 0x100 from doze/nap/sleep/winkle on
-     * P7/P8/P9
-     */
-    if (env->resume_as_sreset) {
-        excp =3D powerpc_reset_wakeup(cs, env, excp, &msr);
-    }
-
     /*
      * Hypervisor emulation assistance interrupt only exists on server
-     * arch 2.05 server or later. We also don't want to generate it if
-     * we don't have HVB in msr_mask (PAPR mode).
+     * arch 2.05 server or later.
      */
-    if (excp =3D=3D POWERPC_EXCP_HV_EMU
-#if defined(TARGET_PPC64)
-        && !(mmu_is_64bit(env->mmu_model) && (env->msr_mask & MSR_HVB))
-#endif /* defined(TARGET_PPC64) */
-
-    ) {
+    if (excp =3D=3D POWERPC_EXCP_HV_EMU) {
         excp =3D POWERPC_EXCP_PROGRAM;
     }
=20
-#ifdef TARGET_PPC64
-    /*
-     * SPEU and VPU share the same IVOR but they exist in different
-     * processors. SPEU is e500v1/2 only and VPU is e6500 only.
-     */
-    if (excp_model =3D=3D POWERPC_EXCP_BOOKE && excp =3D=3D POWERPC_EXCP=
_VPU) {
-        excp =3D POWERPC_EXCP_SPEU;
-    }
-#endif
-
     vector =3D env->excp_vectors[excp];
     if (vector =3D=3D (target_ulong)-1ULL) {
         cpu_abort(cs, "Raised an exception without defined vector %d\n",
@@ -625,22 +597,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int e=
xcp)
     vector |=3D env->excp_prefix;
=20
     switch (excp) {
-    case POWERPC_EXCP_CRITICAL:    /* Critical input                    =
     */
-        switch (excp_model) {
-        case POWERPC_EXCP_40x:
-            srr0 =3D SPR_40x_SRR2;
-            srr1 =3D SPR_40x_SRR3;
-            break;
-        case POWERPC_EXCP_BOOKE:
-            srr0 =3D SPR_BOOKE_CSRR0;
-            srr1 =3D SPR_BOOKE_CSRR1;
-            break;
-        case POWERPC_EXCP_G2:
-            break;
-        default:
-            goto excp_invalid;
-        }
-        break;
     case POWERPC_EXCP_MCHECK:    /* Machine check exception             =
     */
         if (msr_me =3D=3D 0) {
             /*
@@ -804,63 +760,9 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int e=
xcp)
             new_msr |=3D (target_ulong)MSR_HVB;
         }
         break;
-    case POWERPC_EXCP_SYSCALL_VECTORED: /* scv exception                =
     */
-        lev =3D env->error_code;
-        dump_syscall(env);
-        env->nip +=3D 4;
-        new_msr |=3D env->msr & ((target_ulong)1 << MSR_EE);
-        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
-
-        vector +=3D lev * 0x20;
-
-        env->lr =3D env->nip;
-        env->ctr =3D msr;
-        break;
     case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception=
     */
-    case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable     =
     */
     case POWERPC_EXCP_DECR:      /* Decrementer exception               =
     */
         break;
-    case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt      =
     */
-        /* FIT on 4xx */
-        trace_ppc_excp_print("FIT");
-        break;
-    case POWERPC_EXCP_WDT:       /* Watchdog timer interrupt            =
     */
-        trace_ppc_excp_print("WDT");
-        switch (excp_model) {
-        case POWERPC_EXCP_BOOKE:
-            srr0 =3D SPR_BOOKE_CSRR0;
-            srr1 =3D SPR_BOOKE_CSRR1;
-            break;
-        default:
-            break;
-        }
-        break;
-    case POWERPC_EXCP_DTLB:      /* Data TLB error                      =
     */
-    case POWERPC_EXCP_ITLB:      /* Instruction TLB error               =
     */
-        break;
-    case POWERPC_EXCP_DEBUG:     /* Debug interrupt                     =
     */
-        if (env->flags & POWERPC_FLAG_DE) {
-            /* FIXME: choose one or the other based on CPU type */
-            srr0 =3D SPR_BOOKE_DSRR0;
-            srr1 =3D SPR_BOOKE_DSRR1;
-
-            env->spr[SPR_BOOKE_CSRR0] =3D env->nip;
-            env->spr[SPR_BOOKE_CSRR1] =3D msr;
-
-            /* DBSR already modified by caller */
-        } else {
-            cpu_abort(cs, "Debug exception triggered on unsupported mode=
l\n");
-        }
-        break;
-    case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable=
/VPU  */
-        env->spr[SPR_BOOKE_ESR] =3D ESR_SPV;
-        break;
-    case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt         =
     */
-        break;
-    case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt=
     */
-        srr0 =3D SPR_BOOKE_CSRR0;
-        srr1 =3D SPR_BOOKE_CSRR1;
-        break;
     case POWERPC_EXCP_RESET:     /* System reset exception              =
     */
         /* A power-saving exception sets ME, otherwise it is unchanged *=
/
         if (msr_pow) {
@@ -881,92 +783,19 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int =
excp)
             }
         }
         break;
-    case POWERPC_EXCP_DSEG:      /* Data segment exception              =
     */
-    case POWERPC_EXCP_ISEG:      /* Instruction segment exception       =
     */
     case POWERPC_EXCP_TRACE:     /* Trace exception                     =
     */
         break;
-    case POWERPC_EXCP_HISI:      /* Hypervisor instruction storage excep=
tion */
-        msr |=3D env->error_code;
-        /* fall through */
-    case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception    =
     */
-    case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception   =
     */
-    case POWERPC_EXCP_HDSEG:     /* Hypervisor data segment exception   =
     */
-    case POWERPC_EXCP_HISEG:     /* Hypervisor instruction segment excep=
tion */
-    case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt       =
     */
-    case POWERPC_EXCP_HV_EMU:
-    case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization           =
     */
-        srr0 =3D SPR_HSRR0;
-        srr1 =3D SPR_HSRR1;
-        new_msr |=3D (target_ulong)MSR_HVB;
-        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
-        break;
     case POWERPC_EXCP_VPU:       /* Vector unavailable exception        =
     */
-    case POWERPC_EXCP_VSXU:       /* VSX unavailable exception          =
     */
-    case POWERPC_EXCP_FU:         /* Facility unavailable exception     =
     */
-#ifdef TARGET_PPC64
-        env->spr[SPR_FSCR] |=3D ((target_ulong)env->error_code << 56);
-#endif
         break;
-    case POWERPC_EXCP_HV_FU:     /* Hypervisor Facility Unavailable Exce=
ption */
-#ifdef TARGET_PPC64
-        env->spr[SPR_HFSCR] |=3D ((target_ulong)env->error_code << FSCR_=
IC_POS);
-        srr0 =3D SPR_HSRR0;
-        srr1 =3D SPR_HSRR1;
-        new_msr |=3D (target_ulong)MSR_HVB;
-        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
-#endif
-        break;
-    case POWERPC_EXCP_PIT:       /* Programmable interval timer interrup=
t    */
-        trace_ppc_excp_print("PIT");
-        break;
-    case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error         =
     */
-    case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                  =
     */
-    case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                 =
     */
-        switch (excp_model) {
-        case POWERPC_EXCP_602:
-        case POWERPC_EXCP_603:
-        case POWERPC_EXCP_G2:
-            /* Swap temporary saved registers with GPRs */
-            if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
-                new_msr |=3D (target_ulong)1 << MSR_TGPR;
-                hreg_swap_gpr_tgpr(env);
-            }
-            /* fall through */
-        case POWERPC_EXCP_7x5:
-            ppc_excp_debug_sw_tlb(env, excp);
-
-            msr |=3D env->crf[0] << 28;
-            msr |=3D env->error_code; /* key, D/I, S/L bits */
-            /* Set way using a LRU mechanism */
-            msr |=3D ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
-            break;
-        default:
-            cpu_abort(cs, "Invalid TLB miss exception\n");
-            break;
-        }
-        break;
-    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interru=
pt   */
-    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interr=
upt  */
-    case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interru=
pt   */
-    case POWERPC_EXCP_IO:        /* IO error exception                  =
     */
-    case POWERPC_EXCP_RUNM:      /* Run mode exception                  =
     */
-    case POWERPC_EXCP_EMUL:      /* Emulation trap exception            =
     */
-    case POWERPC_EXCP_FPA:       /* Floating-point assist exception     =
     */
-    case POWERPC_EXCP_DABR:      /* Data address breakpoint             =
     */
     case POWERPC_EXCP_IABR:      /* Instruction address breakpoint      =
     */
     case POWERPC_EXCP_SMI:       /* System management interrupt         =
     */
     case POWERPC_EXCP_THERM:     /* Thermal interrupt                   =
     */
     case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interru=
pt   */
     case POWERPC_EXCP_VPUA:      /* Vector assist exception             =
     */
-    case POWERPC_EXCP_SOFTP:     /* Soft patch exception                =
     */
-    case POWERPC_EXCP_MAINT:     /* Maintenance exception               =
     */
-    case POWERPC_EXCP_MEXTBR:    /* Maskable external breakpoint        =
     */
-    case POWERPC_EXCP_NMEXTBR:   /* Non maskable external breakpoint    =
     */
         cpu_abort(cs, "%s exception not implemented\n",
                   powerpc_excp_name(excp));
         break;
     default:
-    excp_invalid:
         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
         break;
     }
@@ -991,33 +820,11 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int =
excp)
         new_msr |=3D (target_ulong)1 << MSR_LE;
     }
=20
-#if defined(TARGET_PPC64)
-    if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
-        if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
-            /* Cat.64-bit: EPCR.ICM is copied to MSR.CM */
-            new_msr |=3D (target_ulong)1 << MSR_CM;
-        } else {
-            vector =3D (uint32_t)vector;
-        }
-    } else {
-        if (!msr_isf && !mmu_is_64bit(env->mmu_model)) {
-            vector =3D (uint32_t)vector;
-        } else {
-            new_msr |=3D (target_ulong)1 << MSR_SF;
-        }
-    }
-#endif
-
-    if (excp !=3D POWERPC_EXCP_SYSCALL_VECTORED) {
-        /* Save PC */
-        env->spr[srr0] =3D env->nip;
-
-        /* Save MSR */
-        env->spr[srr1] =3D msr;
-    }
+    /* Save PC */
+    env->spr[srr0] =3D env->nip;
=20
-    /* This can update new_msr and vector if AIL applies */
-    ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
+    /* Save MSR */
+    env->spr[srr1] =3D msr;
=20
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
--=20
2.34.1



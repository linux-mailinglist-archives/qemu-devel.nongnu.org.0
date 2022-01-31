Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B736A4A4593
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 12:48:38 +0100 (CET)
Received: from localhost ([::1]:50844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEVAj-0006vQ-RP
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 06:48:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYk-00064x-Eh; Mon, 31 Jan 2022 06:09:26 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7746
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYe-00055u-0U; Mon, 31 Jan 2022 06:09:22 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20V81lm1026105; 
 Mon, 31 Jan 2022 11:08:43 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dxbwa39u2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:42 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VB2NoF019476;
 Mon, 31 Jan 2022 11:08:41 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3dvw791ug3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:41 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20VB8ccD44499246
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 11:08:38 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89D415204F;
 Mon, 31 Jan 2022 11:08:38 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 3579C52069;
 Mon, 31 Jan 2022 11:08:38 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.57.185])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 62D722201C1;
 Mon, 31 Jan 2022 12:08:37 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 29/41] target/ppc: Simplify powerpc_excp_books
Date: Mon, 31 Jan 2022 12:07:59 +0100
Message-Id: <20220131110811.619053-30-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131110811.619053-1-clg@kaod.org>
References: <20220131110811.619053-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rfrxlTVVnyJrlkwm2oJfZ2hd3_GAhsLT
X-Proofpoint-ORIG-GUID: rfrxlTVVnyJrlkwm2oJfZ2hd3_GAhsLT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1034 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 mlxlogscore=637 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310074
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.369,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

Differences from the generic powerpc_excp code:

- Not BookE, so some MSR bits are cleared at interrupt dispatch;
- Always uses HV_EMU if the CPU has MSR_HV;
- Exceptions always delivered in 64 bit.

Exceptions used:

POWERPC_EXCP_ALIGN
POWERPC_EXCP_DECR
POWERPC_EXCP_DSEG
POWERPC_EXCP_DSI
POWERPC_EXCP_EXTERNAL
POWERPC_EXCP_FPU
POWERPC_EXCP_FU
POWERPC_EXCP_HDECR
POWERPC_EXCP_HDSI
POWERPC_EXCP_HISI
POWERPC_EXCP_HVIRT
POWERPC_EXCP_HV_EMU
POWERPC_EXCP_HV_FU
POWERPC_EXCP_ISEG
POWERPC_EXCP_ISI
POWERPC_EXCP_MAINT
POWERPC_EXCP_MCHECK
POWERPC_EXCP_PERFM
POWERPC_EXCP_PROGRAM
POWERPC_EXCP_RESET
POWERPC_EXCP_SDOOR_HV
POWERPC_EXCP_SYSCALL
POWERPC_EXCP_SYSCALL_VECTORED
POWERPC_EXCP_THERM
POWERPC_EXCP_TRACE
POWERPC_EXCP_VPU
POWERPC_EXCP_VPUA
POWERPC_EXCP_VSXU

POWERPC_EXCP_HV_MAINT
POWERPC_EXCP_SDOOR

(I added the two above that were not being considered. They used to be
"Invalid exception". Now they become "Unimplemented exception" which
is more accurate.)

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220124184605.999353-3-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 161 ++++-----------------------------------
 1 file changed, 14 insertions(+), 147 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a2a605f8f59e..161b207bc7b8 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -551,6 +551,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int exc=
p)
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
=20
+#ifdef TARGET_PPC64
 static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs =3D CPU(cpu);
@@ -568,11 +569,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int =
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
      * new interrupt handler msr preserves existing HV and ME unless
@@ -593,29 +590,13 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int=
 excp)
     }
=20
     /*
-     * Hypervisor emulation assistance interrupt only exists on server
-     * arch 2.05 server or later. We also don't want to generate it if
-     * we don't have HVB in msr_mask (PAPR mode).
+     * We don't want to generate a Hypervisor Emulation Assistance
+     * Interrupt if we don't have HVB in msr_mask (PAPR mode).
      */
-    if (excp =3D=3D POWERPC_EXCP_HV_EMU
-#if defined(TARGET_PPC64)
-        && !(mmu_is_64bit(env->mmu_model) && (env->msr_mask & MSR_HVB))
-#endif /* defined(TARGET_PPC64) */
-
-    ) {
+    if (excp =3D=3D POWERPC_EXCP_HV_EMU && !(env->msr_mask & MSR_HVB)) {
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
@@ -625,22 +606,6 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int =
excp)
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
@@ -817,50 +782,8 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int =
excp)
         env->ctr =3D msr;
         break;
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
@@ -890,8 +813,6 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int e=
xcp)
         /* fall through */
     case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception    =
     */
     case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception   =
     */
-    case POWERPC_EXCP_HDSEG:     /* Hypervisor data segment exception   =
     */
-    case POWERPC_EXCP_HISEG:     /* Hypervisor instruction segment excep=
tion */
     case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt       =
     */
     case POWERPC_EXCP_HV_EMU:
     case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization           =
     */
@@ -903,70 +824,25 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int=
 excp)
     case POWERPC_EXCP_VPU:       /* Vector unavailable exception        =
     */
     case POWERPC_EXCP_VSXU:       /* VSX unavailable exception          =
     */
     case POWERPC_EXCP_FU:         /* Facility unavailable exception     =
     */
-#ifdef TARGET_PPC64
         env->spr[SPR_FSCR] |=3D ((target_ulong)env->error_code << 56);
-#endif
         break;
     case POWERPC_EXCP_HV_FU:     /* Hypervisor Facility Unavailable Exce=
ption */
-#ifdef TARGET_PPC64
         env->spr[SPR_HFSCR] |=3D ((target_ulong)env->error_code << FSCR_=
IC_POS);
         srr0 =3D SPR_HSRR0;
         srr1 =3D SPR_HSRR1;
         new_msr |=3D (target_ulong)MSR_HVB;
         new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
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
         break;
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
-    case POWERPC_EXCP_IABR:      /* Instruction address breakpoint      =
     */
-    case POWERPC_EXCP_SMI:       /* System management interrupt         =
     */
     case POWERPC_EXCP_THERM:     /* Thermal interrupt                   =
     */
     case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interru=
pt   */
     case POWERPC_EXCP_VPUA:      /* Vector assist exception             =
     */
-    case POWERPC_EXCP_SOFTP:     /* Soft patch exception                =
     */
     case POWERPC_EXCP_MAINT:     /* Maintenance exception               =
     */
-    case POWERPC_EXCP_MEXTBR:    /* Maskable external breakpoint        =
     */
-    case POWERPC_EXCP_NMEXTBR:   /* Non maskable external breakpoint    =
     */
+    case POWERPC_EXCP_SDOOR:     /* Doorbell interrupt                  =
     */
+    case POWERPC_EXCP_HV_MAINT:  /* Hypervisor Maintenance exception    =
     */
         cpu_abort(cs, "%s exception not implemented\n",
                   powerpc_excp_name(excp));
         break;
     default:
-    excp_invalid:
         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
         break;
     }
@@ -991,22 +867,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int =
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
+    new_msr |=3D (target_ulong)1 << MSR_SF;
=20
     if (excp !=3D POWERPC_EXCP_SYSCALL_VECTORED) {
         /* Save PC */
@@ -1021,6 +882,12 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int=
 excp)
=20
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
+#else
+static inline void powerpc_excp_books(PowerPCCPU *cpu, int excp)
+{
+    g_assert_not_reached();
+}
+#endif
=20
 /*
  * Note that this function should be greatly optimized when called
--=20
2.34.1



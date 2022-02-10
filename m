Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1245C4B11C5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 16:34:57 +0100 (CET)
Received: from localhost ([::1]:32870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIBTE-00046p-5X
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 10:34:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI93x-0001xX-7Y; Thu, 10 Feb 2022 08:00:44 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI93p-00049E-8A; Thu, 10 Feb 2022 08:00:39 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21AASfjW031319; 
 Thu, 10 Feb 2022 13:00:20 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e5103bcrs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:19 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21ACw6LD011561;
 Thu, 10 Feb 2022 13:00:17 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3e1gv9x21s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:17 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21AD0ESV31261122
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 13:00:14 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E7D64C066;
 Thu, 10 Feb 2022 13:00:14 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 576DB4C044;
 Thu, 10 Feb 2022 13:00:14 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Feb 2022 13:00:14 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.74.250])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8E09F2201DC;
 Thu, 10 Feb 2022 14:00:13 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 03/42] target/ppc: Simplify powerpc_excp_booke
Date: Thu, 10 Feb 2022 13:59:29 +0100
Message-Id: <20220210130008.2599950-4-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210130008.2599950-1-clg@kaod.org>
References: <20220210130008.2599950-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 26O45V3KJmWlkru6LWetEbboX7wpKksB
X-Proofpoint-GUID: 26O45V3KJmWlkru6LWetEbboX7wpKksB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_05,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=386 clxscore=1034
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202100068
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
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

- No MSR bits are cleared at interrupt dispatch;
- No MSR_HV;
- No power saving states;
- No Hypervisor Emulation Assistance;
- SPEU needs special handling;
- Big endian only;
- Both 64 and 32 bits;
- No System call vectored;
- No Alternate Interrupt Location.

Exceptions used:

POWERPC_EXCP_ALIGN
POWERPC_EXCP_APU
POWERPC_EXCP_CRITICAL
POWERPC_EXCP_DEBUG
POWERPC_EXCP_DECR
POWERPC_EXCP_DSI
POWERPC_EXCP_DTLB
POWERPC_EXCP_EFPDI
POWERPC_EXCP_EFPRI
POWERPC_EXCP_EXTERNAL
POWERPC_EXCP_FIT
POWERPC_EXCP_FPU
POWERPC_EXCP_ISI
POWERPC_EXCP_ITLB
POWERPC_EXCP_MCHECK
POWERPC_EXCP_PROGRAM
POWERPC_EXCP_RESET
POWERPC_EXCP_SPEU
POWERPC_EXCP_SYSCALL
POWERPC_EXCP_WDT

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20220128224018.1228062-3-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 165 ++++-----------------------------------
 1 file changed, 14 insertions(+), 151 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 1571ab6496c7..596c16a678b4 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -761,42 +761,23 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int=
 excp)
                   " =3D> %s (%d) error=3D%02x\n", env->nip, powerpc_excp=
_name(excp),
                   excp, env->error_code);
=20
-    /* new srr1 value excluding must-be-zero bits */
-    if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
-        msr =3D env->msr;
-    } else {
-        msr =3D env->msr & ~0x783f0000ULL;
-    }
+    msr =3D env->msr;
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
@@ -805,7 +786,7 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int e=
xcp)
      * SPEU and VPU share the same IVOR but they exist in different
      * processors. SPEU is e500v1/2 only and VPU is e6500 only.
      */
-    if (excp_model =3D=3D POWERPC_EXCP_BOOKE && excp =3D=3D POWERPC_EXCP=
_VPU) {
+    if (excp =3D=3D POWERPC_EXCP_VPU) {
         excp =3D POWERPC_EXCP_SPEU;
     }
 #endif
@@ -998,18 +979,6 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int =
excp)
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
     case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable     =
     */
     case POWERPC_EXCP_DECR:      /* Decrementer exception               =
     */
@@ -1049,12 +1018,6 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, in=
t excp)
     case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable=
/VPU  */
         env->spr[SPR_BOOKE_ESR] =3D ESR_SPV;
         break;
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
@@ -1075,87 +1038,8 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, in=
t excp)
             }
         }
         break;
-    case POWERPC_EXCP_DSEG:      /* Data segment exception              =
     */
-    case POWERPC_EXCP_ISEG:      /* Instruction segment exception       =
     */
-    case POWERPC_EXCP_TRACE:     /* Trace exception                     =
     */
-        break;
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
-    case POWERPC_EXCP_VPU:       /* Vector unavailable exception        =
     */
-    case POWERPC_EXCP_VSXU:       /* VSX unavailable exception          =
     */
-    case POWERPC_EXCP_FU:         /* Facility unavailable exception     =
     */
-#ifdef TARGET_PPC64
-        env->spr[SPR_FSCR] |=3D ((target_ulong)env->error_code << 56);
-#endif
-        break;
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
     case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interru=
pt   */
     case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interr=
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
-    case POWERPC_EXCP_THERM:     /* Thermal interrupt                   =
     */
-    case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interru=
pt   */
-    case POWERPC_EXCP_VPUA:      /* Vector assist exception             =
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
@@ -1177,41 +1061,20 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, i=
nt excp)
         }
     }
=20
-    /*
-     * Sort out endianness of interrupt, this differs depending on the
-     * CPU, the HV mode, etc...
-     */
-    if (ppc_interrupts_little_endian(cpu, !!(new_msr & MSR_HVB))) {
-        new_msr |=3D (target_ulong)1 << MSR_LE;
-    }
-
 #if defined(TARGET_PPC64)
-    if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
-        if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
-            /* Cat.64-bit: EPCR.ICM is copied to MSR.CM */
-            new_msr |=3D (target_ulong)1 << MSR_CM;
-        } else {
-            vector =3D (uint32_t)vector;
-        }
+    if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
+        /* Cat.64-bit: EPCR.ICM is copied to MSR.CM */
+        new_msr |=3D (target_ulong)1 << MSR_CM;
     } else {
-        if (!msr_isf && !mmu_is_64bit(env->mmu_model)) {
-            vector =3D (uint32_t)vector;
-        } else {
-            new_msr |=3D (target_ulong)1 << MSR_SF;
-        }
+        vector =3D (uint32_t)vector;
     }
 #endif
=20
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



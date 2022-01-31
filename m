Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DEE4A475B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 13:37:20 +0100 (CET)
Received: from localhost ([::1]:60914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEVvo-0003uH-1D
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 07:37:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUZ3-0006BQ-JG; Mon, 31 Jan 2022 06:09:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYy-000562-5S; Mon, 31 Jan 2022 06:09:40 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VAbxh3017183; 
 Mon, 31 Jan 2022 11:08:43 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx33wtjmg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:42 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VB2KqJ017981;
 Mon, 31 Jan 2022 11:08:40 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3dvw799uhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:40 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20VB8cFc46924214
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 11:08:38 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E13CEA4073;
 Mon, 31 Jan 2022 11:08:37 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78110A4071;
 Mon, 31 Jan 2022 11:08:37 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 31 Jan 2022 11:08:37 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.57.185])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 89D2B220149;
 Mon, 31 Jan 2022 12:08:36 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 28/41] target/ppc: Introduce powerpc_excp_books
Date: Mon, 31 Jan 2022 12:07:58 +0100
Message-Id: <20220131110811.619053-29-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131110811.619053-1-clg@kaod.org>
References: <20220131110811.619053-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hcyquZWoFji-OfXdtgP8OTWHfwulqYPu
X-Proofpoint-ORIG-GUID: hcyquZWoFji-OfXdtgP8OTWHfwulqYPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 bulkscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
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

Introduce a new powerpc_excp function specific for BookS CPUs. This
commit copies powerpc_excp_legacy verbatim so the next one has a clean
diff.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220124184605.999353-2-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 478 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 478 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index c3ff798d9d39..a2a605f8f59e 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -551,6 +551,477 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int e=
xcp)
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
=20
+static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
+{
+    CPUState *cs =3D CPU(cpu);
+    CPUPPCState *env =3D &cpu->env;
+    int excp_model =3D env->excp_model;
+    target_ulong msr, new_msr, vector;
+    int srr0, srr1, lev =3D -1;
+
+    if (excp <=3D POWERPC_EXCP_NONE || excp >=3D POWERPC_EXCP_NB) {
+        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
+    }
+
+    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
+                  " =3D> %s (%d) error=3D%02x\n", env->nip, powerpc_excp=
_name(excp),
+                  excp, env->error_code);
+
+    /* new srr1 value excluding must-be-zero bits */
+    if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
+        msr =3D env->msr;
+    } else {
+        msr =3D env->msr & ~0x783f0000ULL;
+    }
+
+    /*
+     * new interrupt handler msr preserves existing HV and ME unless
+     * explicitly overriden
+     */
+    new_msr =3D env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
+
+    /* target registers */
+    srr0 =3D SPR_SRR0;
+    srr1 =3D SPR_SRR1;
+
+    /*
+     * check for special resume at 0x100 from doze/nap/sleep/winkle on
+     * P7/P8/P9
+     */
+    if (env->resume_as_sreset) {
+        excp =3D powerpc_reset_wakeup(cs, env, excp, &msr);
+    }
+
+    /*
+     * Hypervisor emulation assistance interrupt only exists on server
+     * arch 2.05 server or later. We also don't want to generate it if
+     * we don't have HVB in msr_mask (PAPR mode).
+     */
+    if (excp =3D=3D POWERPC_EXCP_HV_EMU
+#if defined(TARGET_PPC64)
+        && !(mmu_is_64bit(env->mmu_model) && (env->msr_mask & MSR_HVB))
+#endif /* defined(TARGET_PPC64) */
+
+    ) {
+        excp =3D POWERPC_EXCP_PROGRAM;
+    }
+
+#ifdef TARGET_PPC64
+    /*
+     * SPEU and VPU share the same IVOR but they exist in different
+     * processors. SPEU is e500v1/2 only and VPU is e6500 only.
+     */
+    if (excp_model =3D=3D POWERPC_EXCP_BOOKE && excp =3D=3D POWERPC_EXCP=
_VPU) {
+        excp =3D POWERPC_EXCP_SPEU;
+    }
+#endif
+
+    vector =3D env->excp_vectors[excp];
+    if (vector =3D=3D (target_ulong)-1ULL) {
+        cpu_abort(cs, "Raised an exception without defined vector %d\n",
+                  excp);
+    }
+
+    vector |=3D env->excp_prefix;
+
+    switch (excp) {
+    case POWERPC_EXCP_CRITICAL:    /* Critical input                    =
     */
+        switch (excp_model) {
+        case POWERPC_EXCP_40x:
+            srr0 =3D SPR_40x_SRR2;
+            srr1 =3D SPR_40x_SRR3;
+            break;
+        case POWERPC_EXCP_BOOKE:
+            srr0 =3D SPR_BOOKE_CSRR0;
+            srr1 =3D SPR_BOOKE_CSRR1;
+            break;
+        case POWERPC_EXCP_G2:
+            break;
+        default:
+            goto excp_invalid;
+        }
+        break;
+    case POWERPC_EXCP_MCHECK:    /* Machine check exception             =
     */
+        if (msr_me =3D=3D 0) {
+            /*
+             * Machine check exception is not enabled.  Enter
+             * checkstop state.
+             */
+            fprintf(stderr, "Machine check while not allowed. "
+                    "Entering checkstop state\n");
+            if (qemu_log_separate()) {
+                qemu_log("Machine check while not allowed. "
+                        "Entering checkstop state\n");
+            }
+            cs->halted =3D 1;
+            cpu_interrupt_exittb(cs);
+        }
+        if (env->msr_mask & MSR_HVB) {
+            /*
+             * ISA specifies HV, but can be delivered to guest with HV
+             * clear (e.g., see FWNMI in PAPR).
+             */
+            new_msr |=3D (target_ulong)MSR_HVB;
+        }
+
+        /* machine check exceptions don't have ME set */
+        new_msr &=3D ~((target_ulong)1 << MSR_ME);
+
+        /* XXX: should also have something loaded in DAR / DSISR */
+        switch (excp_model) {
+        case POWERPC_EXCP_40x:
+            srr0 =3D SPR_40x_SRR2;
+            srr1 =3D SPR_40x_SRR3;
+            break;
+        case POWERPC_EXCP_BOOKE:
+            /* FIXME: choose one or the other based on CPU type */
+            srr0 =3D SPR_BOOKE_MCSRR0;
+            srr1 =3D SPR_BOOKE_MCSRR1;
+
+            env->spr[SPR_BOOKE_CSRR0] =3D env->nip;
+            env->spr[SPR_BOOKE_CSRR1] =3D msr;
+            break;
+        default:
+            break;
+        }
+        break;
+    case POWERPC_EXCP_DSI:       /* Data storage exception              =
     */
+        trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
+        break;
+    case POWERPC_EXCP_ISI:       /* Instruction storage exception       =
     */
+        trace_ppc_excp_isi(msr, env->nip);
+        msr |=3D env->error_code;
+        break;
+    case POWERPC_EXCP_EXTERNAL:  /* External input                      =
     */
+    {
+        bool lpes0;
+
+        cs =3D CPU(cpu);
+
+        /*
+         * Exception targeting modifiers
+         *
+         * LPES0 is supported on POWER7/8/9
+         * LPES1 is not supported (old iSeries mode)
+         *
+         * On anything else, we behave as if LPES0 is 1
+         * (externals don't alter MSR:HV)
+         */
+#if defined(TARGET_PPC64)
+        if (excp_model =3D=3D POWERPC_EXCP_POWER7 ||
+            excp_model =3D=3D POWERPC_EXCP_POWER8 ||
+            excp_model =3D=3D POWERPC_EXCP_POWER9 ||
+            excp_model =3D=3D POWERPC_EXCP_POWER10) {
+            lpes0 =3D !!(env->spr[SPR_LPCR] & LPCR_LPES0);
+        } else
+#endif /* defined(TARGET_PPC64) */
+        {
+            lpes0 =3D true;
+        }
+
+        if (!lpes0) {
+            new_msr |=3D (target_ulong)MSR_HVB;
+            new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
+            srr0 =3D SPR_HSRR0;
+            srr1 =3D SPR_HSRR1;
+        }
+        if (env->mpic_proxy) {
+            /* IACK the IRQ on delivery */
+            env->spr[SPR_BOOKE_EPR] =3D ldl_phys(cs->as, env->mpic_iack)=
;
+        }
+        break;
+    }
+    case POWERPC_EXCP_ALIGN:     /* Alignment exception                 =
     */
+        /* Get rS/rD and rA from faulting opcode */
+        /*
+         * Note: the opcode fields will not be set properly for a
+         * direct store load/store, but nobody cares as nobody
+         * actually uses direct store segments.
+         */
+        env->spr[SPR_DSISR] |=3D (env->error_code & 0x03FF0000) >> 16;
+        break;
+    case POWERPC_EXCP_PROGRAM:   /* Program exception                   =
     */
+        switch (env->error_code & ~0xF) {
+        case POWERPC_EXCP_FP:
+            if ((msr_fe0 =3D=3D 0 && msr_fe1 =3D=3D 0) || msr_fp =3D=3D =
0) {
+                trace_ppc_excp_fp_ignore();
+                cs->exception_index =3D POWERPC_EXCP_NONE;
+                env->error_code =3D 0;
+                return;
+            }
+
+            /*
+             * FP exceptions always have NIP pointing to the faulting
+             * instruction, so always use store_next and claim we are
+             * precise in the MSR.
+             */
+            msr |=3D 0x00100000;
+            env->spr[SPR_BOOKE_ESR] =3D ESR_FP;
+            break;
+        case POWERPC_EXCP_INVAL:
+            trace_ppc_excp_inval(env->nip);
+            msr |=3D 0x00080000;
+            env->spr[SPR_BOOKE_ESR] =3D ESR_PIL;
+            break;
+        case POWERPC_EXCP_PRIV:
+            msr |=3D 0x00040000;
+            env->spr[SPR_BOOKE_ESR] =3D ESR_PPR;
+            break;
+        case POWERPC_EXCP_TRAP:
+            msr |=3D 0x00020000;
+            env->spr[SPR_BOOKE_ESR] =3D ESR_PTR;
+            break;
+        default:
+            /* Should never occur */
+            cpu_abort(cs, "Invalid program exception %d. Aborting\n",
+                      env->error_code);
+            break;
+        }
+        break;
+    case POWERPC_EXCP_SYSCALL:   /* System call exception               =
     */
+        lev =3D env->error_code;
+
+        if ((lev =3D=3D 1) && cpu->vhyp) {
+            dump_hcall(env);
+        } else {
+            dump_syscall(env);
+        }
+
+        /*
+         * We need to correct the NIP which in this case is supposed
+         * to point to the next instruction
+         */
+        env->nip +=3D 4;
+
+        /* "PAPR mode" built-in hypercall emulation */
+        if ((lev =3D=3D 1) && cpu->vhyp) {
+            PPCVirtualHypervisorClass *vhc =3D
+                PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
+            vhc->hypercall(cpu->vhyp, cpu);
+            return;
+        }
+        if (lev =3D=3D 1) {
+            new_msr |=3D (target_ulong)MSR_HVB;
+        }
+        break;
+    case POWERPC_EXCP_SYSCALL_VECTORED: /* scv exception                =
     */
+        lev =3D env->error_code;
+        dump_syscall(env);
+        env->nip +=3D 4;
+        new_msr |=3D env->msr & ((target_ulong)1 << MSR_EE);
+        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
+
+        vector +=3D lev * 0x20;
+
+        env->lr =3D env->nip;
+        env->ctr =3D msr;
+        break;
+    case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception=
     */
+    case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable     =
     */
+    case POWERPC_EXCP_DECR:      /* Decrementer exception               =
     */
+        break;
+    case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt      =
     */
+        /* FIT on 4xx */
+        trace_ppc_excp_print("FIT");
+        break;
+    case POWERPC_EXCP_WDT:       /* Watchdog timer interrupt            =
     */
+        trace_ppc_excp_print("WDT");
+        switch (excp_model) {
+        case POWERPC_EXCP_BOOKE:
+            srr0 =3D SPR_BOOKE_CSRR0;
+            srr1 =3D SPR_BOOKE_CSRR1;
+            break;
+        default:
+            break;
+        }
+        break;
+    case POWERPC_EXCP_DTLB:      /* Data TLB error                      =
     */
+    case POWERPC_EXCP_ITLB:      /* Instruction TLB error               =
     */
+        break;
+    case POWERPC_EXCP_DEBUG:     /* Debug interrupt                     =
     */
+        if (env->flags & POWERPC_FLAG_DE) {
+            /* FIXME: choose one or the other based on CPU type */
+            srr0 =3D SPR_BOOKE_DSRR0;
+            srr1 =3D SPR_BOOKE_DSRR1;
+
+            env->spr[SPR_BOOKE_CSRR0] =3D env->nip;
+            env->spr[SPR_BOOKE_CSRR1] =3D msr;
+
+            /* DBSR already modified by caller */
+        } else {
+            cpu_abort(cs, "Debug exception triggered on unsupported mode=
l\n");
+        }
+        break;
+    case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable=
/VPU  */
+        env->spr[SPR_BOOKE_ESR] =3D ESR_SPV;
+        break;
+    case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt         =
     */
+        break;
+    case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt=
     */
+        srr0 =3D SPR_BOOKE_CSRR0;
+        srr1 =3D SPR_BOOKE_CSRR1;
+        break;
+    case POWERPC_EXCP_RESET:     /* System reset exception              =
     */
+        /* A power-saving exception sets ME, otherwise it is unchanged *=
/
+        if (msr_pow) {
+            /* indicate that we resumed from power save mode */
+            msr |=3D 0x10000;
+            new_msr |=3D ((target_ulong)1 << MSR_ME);
+        }
+        if (env->msr_mask & MSR_HVB) {
+            /*
+             * ISA specifies HV, but can be delivered to guest with HV
+             * clear (e.g., see FWNMI in PAPR, NMI injection in QEMU).
+             */
+            new_msr |=3D (target_ulong)MSR_HVB;
+        } else {
+            if (msr_pow) {
+                cpu_abort(cs, "Trying to deliver power-saving system res=
et "
+                          "exception %d with no HV support\n", excp);
+            }
+        }
+        break;
+    case POWERPC_EXCP_DSEG:      /* Data segment exception              =
     */
+    case POWERPC_EXCP_ISEG:      /* Instruction segment exception       =
     */
+    case POWERPC_EXCP_TRACE:     /* Trace exception                     =
     */
+        break;
+    case POWERPC_EXCP_HISI:      /* Hypervisor instruction storage excep=
tion */
+        msr |=3D env->error_code;
+        /* fall through */
+    case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception    =
     */
+    case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception   =
     */
+    case POWERPC_EXCP_HDSEG:     /* Hypervisor data segment exception   =
     */
+    case POWERPC_EXCP_HISEG:     /* Hypervisor instruction segment excep=
tion */
+    case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt       =
     */
+    case POWERPC_EXCP_HV_EMU:
+    case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization           =
     */
+        srr0 =3D SPR_HSRR0;
+        srr1 =3D SPR_HSRR1;
+        new_msr |=3D (target_ulong)MSR_HVB;
+        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
+        break;
+    case POWERPC_EXCP_VPU:       /* Vector unavailable exception        =
     */
+    case POWERPC_EXCP_VSXU:       /* VSX unavailable exception          =
     */
+    case POWERPC_EXCP_FU:         /* Facility unavailable exception     =
     */
+#ifdef TARGET_PPC64
+        env->spr[SPR_FSCR] |=3D ((target_ulong)env->error_code << 56);
+#endif
+        break;
+    case POWERPC_EXCP_HV_FU:     /* Hypervisor Facility Unavailable Exce=
ption */
+#ifdef TARGET_PPC64
+        env->spr[SPR_HFSCR] |=3D ((target_ulong)env->error_code << FSCR_=
IC_POS);
+        srr0 =3D SPR_HSRR0;
+        srr1 =3D SPR_HSRR1;
+        new_msr |=3D (target_ulong)MSR_HVB;
+        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
+#endif
+        break;
+    case POWERPC_EXCP_PIT:       /* Programmable interval timer interrup=
t    */
+        trace_ppc_excp_print("PIT");
+        break;
+    case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error         =
     */
+    case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                  =
     */
+    case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                 =
     */
+        switch (excp_model) {
+        case POWERPC_EXCP_602:
+        case POWERPC_EXCP_603:
+        case POWERPC_EXCP_G2:
+            /* Swap temporary saved registers with GPRs */
+            if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
+                new_msr |=3D (target_ulong)1 << MSR_TGPR;
+                hreg_swap_gpr_tgpr(env);
+            }
+            /* fall through */
+        case POWERPC_EXCP_7x5:
+            ppc_excp_debug_sw_tlb(env, excp);
+
+            msr |=3D env->crf[0] << 28;
+            msr |=3D env->error_code; /* key, D/I, S/L bits */
+            /* Set way using a LRU mechanism */
+            msr |=3D ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
+            break;
+        default:
+            cpu_abort(cs, "Invalid TLB miss exception\n");
+            break;
+        }
+        break;
+    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interru=
pt   */
+    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interr=
upt  */
+    case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interru=
pt   */
+    case POWERPC_EXCP_IO:        /* IO error exception                  =
     */
+    case POWERPC_EXCP_RUNM:      /* Run mode exception                  =
     */
+    case POWERPC_EXCP_EMUL:      /* Emulation trap exception            =
     */
+    case POWERPC_EXCP_FPA:       /* Floating-point assist exception     =
     */
+    case POWERPC_EXCP_DABR:      /* Data address breakpoint             =
     */
+    case POWERPC_EXCP_IABR:      /* Instruction address breakpoint      =
     */
+    case POWERPC_EXCP_SMI:       /* System management interrupt         =
     */
+    case POWERPC_EXCP_THERM:     /* Thermal interrupt                   =
     */
+    case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interru=
pt   */
+    case POWERPC_EXCP_VPUA:      /* Vector assist exception             =
     */
+    case POWERPC_EXCP_SOFTP:     /* Soft patch exception                =
     */
+    case POWERPC_EXCP_MAINT:     /* Maintenance exception               =
     */
+    case POWERPC_EXCP_MEXTBR:    /* Maskable external breakpoint        =
     */
+    case POWERPC_EXCP_NMEXTBR:   /* Non maskable external breakpoint    =
     */
+        cpu_abort(cs, "%s exception not implemented\n",
+                  powerpc_excp_name(excp));
+        break;
+    default:
+    excp_invalid:
+        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
+        break;
+    }
+
+    /* Sanity check */
+    if (!(env->msr_mask & MSR_HVB)) {
+        if (new_msr & MSR_HVB) {
+            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with =
"
+                      "no HV support\n", excp);
+        }
+        if (srr0 =3D=3D SPR_HSRR0) {
+            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with=
 "
+                      "no HV support\n", excp);
+        }
+    }
+
+    /*
+     * Sort out endianness of interrupt, this differs depending on the
+     * CPU, the HV mode, etc...
+     */
+    if (ppc_interrupts_little_endian(cpu, !!(new_msr & MSR_HVB))) {
+        new_msr |=3D (target_ulong)1 << MSR_LE;
+    }
+
+#if defined(TARGET_PPC64)
+    if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
+        if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
+            /* Cat.64-bit: EPCR.ICM is copied to MSR.CM */
+            new_msr |=3D (target_ulong)1 << MSR_CM;
+        } else {
+            vector =3D (uint32_t)vector;
+        }
+    } else {
+        if (!msr_isf && !mmu_is_64bit(env->mmu_model)) {
+            vector =3D (uint32_t)vector;
+        } else {
+            new_msr |=3D (target_ulong)1 << MSR_SF;
+        }
+    }
+#endif
+
+    if (excp !=3D POWERPC_EXCP_SYSCALL_VECTORED) {
+        /* Save PC */
+        env->spr[srr0] =3D env->nip;
+
+        /* Save MSR */
+        env->spr[srr1] =3D msr;
+    }
+
+    /* This can update new_msr and vector if AIL applies */
+    ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
+
+    powerpc_set_excp_state(cpu, vector, new_msr);
+}
+
 /*
  * Note that this function should be greatly optimized when called
  * with a constant excp, from ppc_hw_interrupt
@@ -1034,6 +1505,13 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp=
)
     case POWERPC_EXCP_40x:
         powerpc_excp_40x(cpu, excp);
         break;
+    case POWERPC_EXCP_970:
+    case POWERPC_EXCP_POWER7:
+    case POWERPC_EXCP_POWER8:
+    case POWERPC_EXCP_POWER9:
+    case POWERPC_EXCP_POWER10:
+        powerpc_excp_books(cpu, excp);
+        break;
     default:
         powerpc_excp_legacy(cpu, excp);
     }
--=20
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E4D4A03E4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 23:46:24 +0100 (CET)
Received: from localhost ([::1]:35602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDa0d-0003Bt-PX
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 17:46:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDZvE-0007Zp-Sb; Fri, 28 Jan 2022 17:40:48 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDZvB-0003Th-7p; Fri, 28 Jan 2022 17:40:48 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SKZwgL007922; 
 Fri, 28 Jan 2022 22:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YG1bm2UB5KB9CNe8d0gtUlG4YNdWtbWe1o3IvtK7pjs=;
 b=ipVPt49QXUKhMVcveHLQQkAZHBuxc/wWmNBSiCFphCNClmr409QT90tfU8OIYrCa/WlI
 5rZKmq3+IeUqupE1Dw7QPvBrzWXRvdtv548n8VuIDrc++0K95di0QLwpgvnCDNqYodp2
 QLfj9TQmeniijqbBoDgChiYV3dfAKYWuGXG+x7rBEoqY+vanK5Di49b2Bk45DebUxP35
 +cmWrYOPZutN4Rdw7uS36BsYPN6LZ5m40IVEGodqPyCLi3bhCx+IjoPbzXECHWFQsbx4
 kqaag5Wcf7ciiO3/d4b2WHfS1cJZt+iGeGcev2bHvjChcBSPMfLVIxwpSs8mdC2q5nSw vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dvhm8hb2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 22:40:30 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20SMeUL8036026;
 Fri, 28 Jan 2022 22:40:30 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dvhm8hb2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 22:40:29 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20SMcuVg009650;
 Fri, 28 Jan 2022 22:40:28 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 3dr9jcjyqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 22:40:28 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20SMeRtn20513064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 22:40:27 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5E507805E;
 Fri, 28 Jan 2022 22:40:27 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08AA478064;
 Fri, 28 Jan 2022 22:40:26 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.66.85])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 28 Jan 2022 22:40:25 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/11] target/ppc: Introduce powerpc_excp_booke
Date: Fri, 28 Jan 2022 19:40:08 -0300
Message-Id: <20220128224018.1228062-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128224018.1228062-1-farosas@linux.ibm.com>
References: <20220128224018.1228062-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: m-YuAr9XOdqdf8_uP0sGJ9H-QaELxWWz
X-Proofpoint-ORIG-GUID: Oz99IA262-7e27ST_Gb9zkEl1Sx3ttOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_08,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201280125
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a new powerpc_excp function specific for BookE CPUs. This
commit copies powerpc_excp_legacy verbatim so the next one has a clean
diff.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 474 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 474 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index c107953dec..1571ab6496 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -745,6 +745,477 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
 
+static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
+{
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
+    int excp_model = env->excp_model;
+    target_ulong msr, new_msr, vector;
+    int srr0, srr1, lev = -1;
+
+    if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
+        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
+    }
+
+    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
+                  " => %s (%d) error=%02x\n", env->nip, powerpc_excp_name(excp),
+                  excp, env->error_code);
+
+    /* new srr1 value excluding must-be-zero bits */
+    if (excp_model == POWERPC_EXCP_BOOKE) {
+        msr = env->msr;
+    } else {
+        msr = env->msr & ~0x783f0000ULL;
+    }
+
+    /*
+     * new interrupt handler msr preserves existing HV and ME unless
+     * explicitly overriden
+     */
+    new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
+
+    /* target registers */
+    srr0 = SPR_SRR0;
+    srr1 = SPR_SRR1;
+
+    /*
+     * check for special resume at 0x100 from doze/nap/sleep/winkle on
+     * P7/P8/P9
+     */
+    if (env->resume_as_sreset) {
+        excp = powerpc_reset_wakeup(cs, env, excp, &msr);
+    }
+
+    /*
+     * Hypervisor emulation assistance interrupt only exists on server
+     * arch 2.05 server or later. We also don't want to generate it if
+     * we don't have HVB in msr_mask (PAPR mode).
+     */
+    if (excp == POWERPC_EXCP_HV_EMU
+#if defined(TARGET_PPC64)
+        && !(mmu_is_64bit(env->mmu_model) && (env->msr_mask & MSR_HVB))
+#endif /* defined(TARGET_PPC64) */
+
+    ) {
+        excp = POWERPC_EXCP_PROGRAM;
+    }
+
+#ifdef TARGET_PPC64
+    /*
+     * SPEU and VPU share the same IVOR but they exist in different
+     * processors. SPEU is e500v1/2 only and VPU is e6500 only.
+     */
+    if (excp_model == POWERPC_EXCP_BOOKE && excp == POWERPC_EXCP_VPU) {
+        excp = POWERPC_EXCP_SPEU;
+    }
+#endif
+
+    vector = env->excp_vectors[excp];
+    if (vector == (target_ulong)-1ULL) {
+        cpu_abort(cs, "Raised an exception without defined vector %d\n",
+                  excp);
+    }
+
+    vector |= env->excp_prefix;
+
+    switch (excp) {
+    case POWERPC_EXCP_CRITICAL:    /* Critical input                         */
+        switch (excp_model) {
+        case POWERPC_EXCP_40x:
+            srr0 = SPR_40x_SRR2;
+            srr1 = SPR_40x_SRR3;
+            break;
+        case POWERPC_EXCP_BOOKE:
+            srr0 = SPR_BOOKE_CSRR0;
+            srr1 = SPR_BOOKE_CSRR1;
+            break;
+        case POWERPC_EXCP_G2:
+            break;
+        default:
+            goto excp_invalid;
+        }
+        break;
+    case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
+        if (msr_me == 0) {
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
+            cs->halted = 1;
+            cpu_interrupt_exittb(cs);
+        }
+        if (env->msr_mask & MSR_HVB) {
+            /*
+             * ISA specifies HV, but can be delivered to guest with HV
+             * clear (e.g., see FWNMI in PAPR).
+             */
+            new_msr |= (target_ulong)MSR_HVB;
+        }
+
+        /* machine check exceptions don't have ME set */
+        new_msr &= ~((target_ulong)1 << MSR_ME);
+
+        /* XXX: should also have something loaded in DAR / DSISR */
+        switch (excp_model) {
+        case POWERPC_EXCP_40x:
+            srr0 = SPR_40x_SRR2;
+            srr1 = SPR_40x_SRR3;
+            break;
+        case POWERPC_EXCP_BOOKE:
+            /* FIXME: choose one or the other based on CPU type */
+            srr0 = SPR_BOOKE_MCSRR0;
+            srr1 = SPR_BOOKE_MCSRR1;
+
+            env->spr[SPR_BOOKE_CSRR0] = env->nip;
+            env->spr[SPR_BOOKE_CSRR1] = msr;
+            break;
+        default:
+            break;
+        }
+        break;
+    case POWERPC_EXCP_DSI:       /* Data storage exception                   */
+        trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
+        break;
+    case POWERPC_EXCP_ISI:       /* Instruction storage exception            */
+        trace_ppc_excp_isi(msr, env->nip);
+        msr |= env->error_code;
+        break;
+    case POWERPC_EXCP_EXTERNAL:  /* External input                           */
+    {
+        bool lpes0;
+
+        cs = CPU(cpu);
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
+        if (excp_model == POWERPC_EXCP_POWER7 ||
+            excp_model == POWERPC_EXCP_POWER8 ||
+            excp_model == POWERPC_EXCP_POWER9 ||
+            excp_model == POWERPC_EXCP_POWER10) {
+            lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
+        } else
+#endif /* defined(TARGET_PPC64) */
+        {
+            lpes0 = true;
+        }
+
+        if (!lpes0) {
+            new_msr |= (target_ulong)MSR_HVB;
+            new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+            srr0 = SPR_HSRR0;
+            srr1 = SPR_HSRR1;
+        }
+        if (env->mpic_proxy) {
+            /* IACK the IRQ on delivery */
+            env->spr[SPR_BOOKE_EPR] = ldl_phys(cs->as, env->mpic_iack);
+        }
+        break;
+    }
+    case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
+        /* Get rS/rD and rA from faulting opcode */
+        /*
+         * Note: the opcode fields will not be set properly for a
+         * direct store load/store, but nobody cares as nobody
+         * actually uses direct store segments.
+         */
+        env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
+        break;
+    case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
+        switch (env->error_code & ~0xF) {
+        case POWERPC_EXCP_FP:
+            if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
+                trace_ppc_excp_fp_ignore();
+                cs->exception_index = POWERPC_EXCP_NONE;
+                env->error_code = 0;
+                return;
+            }
+
+            /*
+             * FP exceptions always have NIP pointing to the faulting
+             * instruction, so always use store_next and claim we are
+             * precise in the MSR.
+             */
+            msr |= 0x00100000;
+            env->spr[SPR_BOOKE_ESR] = ESR_FP;
+            break;
+        case POWERPC_EXCP_INVAL:
+            trace_ppc_excp_inval(env->nip);
+            msr |= 0x00080000;
+            env->spr[SPR_BOOKE_ESR] = ESR_PIL;
+            break;
+        case POWERPC_EXCP_PRIV:
+            msr |= 0x00040000;
+            env->spr[SPR_BOOKE_ESR] = ESR_PPR;
+            break;
+        case POWERPC_EXCP_TRAP:
+            msr |= 0x00020000;
+            env->spr[SPR_BOOKE_ESR] = ESR_PTR;
+            break;
+        default:
+            /* Should never occur */
+            cpu_abort(cs, "Invalid program exception %d. Aborting\n",
+                      env->error_code);
+            break;
+        }
+        break;
+    case POWERPC_EXCP_SYSCALL:   /* System call exception                    */
+        lev = env->error_code;
+
+        if ((lev == 1) && cpu->vhyp) {
+            dump_hcall(env);
+        } else {
+            dump_syscall(env);
+        }
+
+        /*
+         * We need to correct the NIP which in this case is supposed
+         * to point to the next instruction
+         */
+        env->nip += 4;
+
+        /* "PAPR mode" built-in hypercall emulation */
+        if ((lev == 1) && cpu->vhyp) {
+            PPCVirtualHypervisorClass *vhc =
+                PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
+            vhc->hypercall(cpu->vhyp, cpu);
+            return;
+        }
+        if (lev == 1) {
+            new_msr |= (target_ulong)MSR_HVB;
+        }
+        break;
+    case POWERPC_EXCP_SYSCALL_VECTORED: /* scv exception                     */
+        lev = env->error_code;
+        dump_syscall(env);
+        env->nip += 4;
+        new_msr |= env->msr & ((target_ulong)1 << MSR_EE);
+        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+
+        vector += lev * 0x20;
+
+        env->lr = env->nip;
+        env->ctr = msr;
+        break;
+    case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
+    case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable          */
+    case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
+        break;
+    case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt           */
+        /* FIT on 4xx */
+        trace_ppc_excp_print("FIT");
+        break;
+    case POWERPC_EXCP_WDT:       /* Watchdog timer interrupt                 */
+        trace_ppc_excp_print("WDT");
+        switch (excp_model) {
+        case POWERPC_EXCP_BOOKE:
+            srr0 = SPR_BOOKE_CSRR0;
+            srr1 = SPR_BOOKE_CSRR1;
+            break;
+        default:
+            break;
+        }
+        break;
+    case POWERPC_EXCP_DTLB:      /* Data TLB error                           */
+    case POWERPC_EXCP_ITLB:      /* Instruction TLB error                    */
+        break;
+    case POWERPC_EXCP_DEBUG:     /* Debug interrupt                          */
+        if (env->flags & POWERPC_FLAG_DE) {
+            /* FIXME: choose one or the other based on CPU type */
+            srr0 = SPR_BOOKE_DSRR0;
+            srr1 = SPR_BOOKE_DSRR1;
+
+            env->spr[SPR_BOOKE_CSRR0] = env->nip;
+            env->spr[SPR_BOOKE_CSRR1] = msr;
+
+            /* DBSR already modified by caller */
+        } else {
+            cpu_abort(cs, "Debug exception triggered on unsupported model\n");
+        }
+        break;
+    case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/VPU  */
+        env->spr[SPR_BOOKE_ESR] = ESR_SPV;
+        break;
+    case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt              */
+        break;
+    case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt     */
+        srr0 = SPR_BOOKE_CSRR0;
+        srr1 = SPR_BOOKE_CSRR1;
+        break;
+    case POWERPC_EXCP_RESET:     /* System reset exception                   */
+        /* A power-saving exception sets ME, otherwise it is unchanged */
+        if (msr_pow) {
+            /* indicate that we resumed from power save mode */
+            msr |= 0x10000;
+            new_msr |= ((target_ulong)1 << MSR_ME);
+        }
+        if (env->msr_mask & MSR_HVB) {
+            /*
+             * ISA specifies HV, but can be delivered to guest with HV
+             * clear (e.g., see FWNMI in PAPR, NMI injection in QEMU).
+             */
+            new_msr |= (target_ulong)MSR_HVB;
+        } else {
+            if (msr_pow) {
+                cpu_abort(cs, "Trying to deliver power-saving system reset "
+                          "exception %d with no HV support\n", excp);
+            }
+        }
+        break;
+    case POWERPC_EXCP_DSEG:      /* Data segment exception                   */
+    case POWERPC_EXCP_ISEG:      /* Instruction segment exception            */
+    case POWERPC_EXCP_TRACE:     /* Trace exception                          */
+        break;
+    case POWERPC_EXCP_HISI:      /* Hypervisor instruction storage exception */
+        msr |= env->error_code;
+        /* fall through */
+    case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception         */
+    case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception        */
+    case POWERPC_EXCP_HDSEG:     /* Hypervisor data segment exception        */
+    case POWERPC_EXCP_HISEG:     /* Hypervisor instruction segment exception */
+    case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt            */
+    case POWERPC_EXCP_HV_EMU:
+    case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization                */
+        srr0 = SPR_HSRR0;
+        srr1 = SPR_HSRR1;
+        new_msr |= (target_ulong)MSR_HVB;
+        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+        break;
+    case POWERPC_EXCP_VPU:       /* Vector unavailable exception             */
+    case POWERPC_EXCP_VSXU:       /* VSX unavailable exception               */
+    case POWERPC_EXCP_FU:         /* Facility unavailable exception          */
+#ifdef TARGET_PPC64
+        env->spr[SPR_FSCR] |= ((target_ulong)env->error_code << 56);
+#endif
+        break;
+    case POWERPC_EXCP_HV_FU:     /* Hypervisor Facility Unavailable Exception */
+#ifdef TARGET_PPC64
+        env->spr[SPR_HFSCR] |= ((target_ulong)env->error_code << FSCR_IC_POS);
+        srr0 = SPR_HSRR0;
+        srr1 = SPR_HSRR1;
+        new_msr |= (target_ulong)MSR_HVB;
+        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+#endif
+        break;
+    case POWERPC_EXCP_PIT:       /* Programmable interval timer interrupt    */
+        trace_ppc_excp_print("PIT");
+        break;
+    case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error              */
+    case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                       */
+    case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                      */
+        switch (excp_model) {
+        case POWERPC_EXCP_602:
+        case POWERPC_EXCP_603:
+        case POWERPC_EXCP_G2:
+            /* Swap temporary saved registers with GPRs */
+            if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
+                new_msr |= (target_ulong)1 << MSR_TGPR;
+                hreg_swap_gpr_tgpr(env);
+            }
+            /* fall through */
+        case POWERPC_EXCP_7x5:
+            ppc_excp_debug_sw_tlb(env, excp);
+
+            msr |= env->crf[0] << 28;
+            msr |= env->error_code; /* key, D/I, S/L bits */
+            /* Set way using a LRU mechanism */
+            msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
+            break;
+        default:
+            cpu_abort(cs, "Invalid TLB miss exception\n");
+            break;
+        }
+        break;
+    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interrupt   */
+    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interrupt  */
+    case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interrupt   */
+    case POWERPC_EXCP_IO:        /* IO error exception                       */
+    case POWERPC_EXCP_RUNM:      /* Run mode exception                       */
+    case POWERPC_EXCP_EMUL:      /* Emulation trap exception                 */
+    case POWERPC_EXCP_FPA:       /* Floating-point assist exception          */
+    case POWERPC_EXCP_DABR:      /* Data address breakpoint                  */
+    case POWERPC_EXCP_IABR:      /* Instruction address breakpoint           */
+    case POWERPC_EXCP_SMI:       /* System management interrupt              */
+    case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
+    case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
+    case POWERPC_EXCP_VPUA:      /* Vector assist exception                  */
+    case POWERPC_EXCP_SOFTP:     /* Soft patch exception                     */
+    case POWERPC_EXCP_MAINT:     /* Maintenance exception                    */
+    case POWERPC_EXCP_MEXTBR:    /* Maskable external breakpoint             */
+    case POWERPC_EXCP_NMEXTBR:   /* Non maskable external breakpoint         */
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
+            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
+                      "no HV support\n", excp);
+        }
+        if (srr0 == SPR_HSRR0) {
+            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
+                      "no HV support\n", excp);
+        }
+    }
+
+    /*
+     * Sort out endianness of interrupt, this differs depending on the
+     * CPU, the HV mode, etc...
+     */
+    if (ppc_interrupts_little_endian(cpu, !!(new_msr & MSR_HVB))) {
+        new_msr |= (target_ulong)1 << MSR_LE;
+    }
+
+#if defined(TARGET_PPC64)
+    if (excp_model == POWERPC_EXCP_BOOKE) {
+        if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
+            /* Cat.64-bit: EPCR.ICM is copied to MSR.CM */
+            new_msr |= (target_ulong)1 << MSR_CM;
+        } else {
+            vector = (uint32_t)vector;
+        }
+    } else {
+        if (!msr_isf && !mmu_is_64bit(env->mmu_model)) {
+            vector = (uint32_t)vector;
+        } else {
+            new_msr |= (target_ulong)1 << MSR_SF;
+        }
+    }
+#endif
+
+    if (excp != POWERPC_EXCP_SYSCALL_VECTORED) {
+        /* Save PC */
+        env->spr[srr0] = env->nip;
+
+        /* Save MSR */
+        env->spr[srr1] = msr;
+    }
+
+    /* This can update new_msr and vector if AIL applies */
+    ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
+
+    powerpc_set_excp_state(cpu, vector, new_msr);
+}
+
 #ifdef TARGET_PPC64
 static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
 {
@@ -1531,6 +2002,9 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_74xx:
         powerpc_excp_74xx(cpu, excp);
         break;
+    case POWERPC_EXCP_BOOKE:
+        powerpc_excp_booke(cpu, excp);
+        break;
     case POWERPC_EXCP_970:
     case POWERPC_EXCP_POWER7:
     case POWERPC_EXCP_POWER8:
-- 
2.34.1



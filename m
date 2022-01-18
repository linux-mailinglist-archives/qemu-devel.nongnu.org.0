Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADF5492E19
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 20:04:20 +0100 (CET)
Received: from localhost ([::1]:49054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9tmE-0006AZ-U9
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 14:04:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n9tTy-0005je-Aj; Tue, 18 Jan 2022 13:45:26 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26824
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n9tTr-0002ws-MU; Tue, 18 Jan 2022 13:45:25 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20IH2Nbg030221; 
 Tue, 18 Jan 2022 18:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6hAthoCeTcuuF9NcrQbe+OWgU8vWRLC1odX5dML6Cwk=;
 b=lRxVOmd46r69UgTkdb8d0br2OdTd3UXJAGN3MKSzaqtE4VTdZKQQ5zTIDqOgt2XdkOH0
 +zvpOzP1v6aDzYr1OZNLWoLh8OZLavQQzaj4y5npOeyK453yTvCl7E+iAqw+K9JqLiqR
 fOXFiyLUwZsMjLn+ubY7/X7GLtTfT5Rz1Dg1HqQ3FUwq3VP2jW98jCv4KhC633LhPYYZ
 QFT+kgAPzeOFO5YelyVvM8GK3Gm+pmvS0SJYRGjGdHmz+Pukcd/1J0XPTmT7xQyBCUfu
 dOPGc9swlRHx0G8Ep5/E8H7gNJnNR3/sQ2UMKkC65Opc4tYTe43dLbCx8/66j0sa1tmI 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dp1kq2u16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:45:13 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20IIhQUs027867;
 Tue, 18 Jan 2022 18:45:12 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dp1kq2u0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:45:12 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20IIbodM005514;
 Tue, 18 Jan 2022 18:45:11 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 3dknwaqs61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:45:11 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20IIjAgd33292582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 18:45:10 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C358AAE05F;
 Tue, 18 Jan 2022 18:45:10 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26F2CAE060;
 Tue, 18 Jan 2022 18:45:08 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.109.91])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 18 Jan 2022 18:45:07 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/14] target/ppc: Simplify powerpc_excp_40x
Date: Tue, 18 Jan 2022 15:44:38 -0300
Message-Id: <20220118184448.852996-5-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220118184448.852996-1-farosas@linux.ibm.com>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OcmGb3hdfjP5gHenQAFOLVh2nMNOE7Wg
X-Proofpoint-GUID: EeW6dVRE_lKusoj4Q8XmV8zc8PllD8H3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_05,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 adultscore=0 mlxlogscore=684
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180112
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Differences from the generic powerpc_excp code:

- Not BookE, so some MSR bits are cleared at interrupt dispatch;
- No MSR_HV or MSR_LE;
- No power saving states;
- No Hypervisor Emulation Assistance;
- Not 64 bits;
- No System call vectored;
- No Interrupts Little Endian;
- No Alternate Interrupt Location.

Exceptions used:

POWERPC_EXCP_ALIGN
POWERPC_EXCP_CRITICAL
POWERPC_EXCP_DEBUG
POWERPC_EXCP_DSI
POWERPC_EXCP_DTLB
POWERPC_EXCP_EXTERNAL
POWERPC_EXCP_FIT
POWERPC_EXCP_ISI
POWERPC_EXCP_ITLB
POWERPC_EXCP_MCHECK
POWERPC_EXCP_PIT
POWERPC_EXCP_PROGRAM
POWERPC_EXCP_SYSCALL
POWERPC_EXCP_WDT

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 205 ++-------------------------------------
 1 file changed, 10 insertions(+), 195 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 12ab5e1b34..b5975dff3e 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -409,54 +409,26 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
                   excp, env->error_code);
 
     /* new srr1 value excluding must-be-zero bits */
-    if (excp_model == POWERPC_EXCP_BOOKE) {
-        msr = env->msr;
-    } else {
-        msr = env->msr & ~0x783f0000ULL;
-    }
+    msr = env->msr & ~0x783f0000ULL;
 
     /*
-     * new interrupt handler msr preserves existing HV and ME unless
-     * explicitly overriden
+     * new interrupt handler msr preserves existing ME unless
+     * explicitly overriden.
      */
-    new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
+    new_msr = env->msr & (((target_ulong)1 << MSR_ME));
 
     /* target registers */
     srr0 = SPR_SRR0;
     srr1 = SPR_SRR1;
 
-    /*
-     * check for special resume at 0x100 from doze/nap/sleep/winkle on
-     * P7/P8/P9
-     */
-    if (env->resume_as_sreset) {
-        excp = powerpc_reset_wakeup(cs, env, excp, &msr);
-    }
-
     /*
      * Hypervisor emulation assistance interrupt only exists on server
-     * arch 2.05 server or later. We also don't want to generate it if
-     * we don't have HVB in msr_mask (PAPR mode).
+     * arch 2.05 server or later.
      */
-    if (excp == POWERPC_EXCP_HV_EMU
-#if defined(TARGET_PPC64)
-        && !(mmu_is_64bit(env->mmu_model) && (env->msr_mask & MSR_HVB))
-#endif /* defined(TARGET_PPC64) */
-
-    ) {
+    if (excp == POWERPC_EXCP_HV_EMU) {
         excp = POWERPC_EXCP_PROGRAM;
     }
 
-#ifdef TARGET_PPC64
-    /*
-     * SPEU and VPU share the same IVOR but they exist in different
-     * processors. SPEU is e500v1/2 only and VPU is e6500 only.
-     */
-    if (excp_model == POWERPC_EXCP_BOOKE && excp == POWERPC_EXCP_VPU) {
-        excp = POWERPC_EXCP_SPEU;
-    }
-#endif
-
     vector = env->excp_vectors[excp];
     if (vector == (target_ulong)-1ULL) {
         cpu_abort(cs, "Raised an exception without defined vector %d\n",
@@ -645,24 +617,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
             new_msr |= (target_ulong)MSR_HVB;
         }
         break;
-    case POWERPC_EXCP_SYSCALL_VECTORED: /* scv exception                     */
-        lev = env->error_code;
-        dump_syscall(env);
-        env->nip += 4;
-        new_msr |= env->msr & ((target_ulong)1 << MSR_EE);
-        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
-
-        vector += lev * 0x20;
-
-        env->lr = env->nip;
-        env->ctr = msr;
-        break;
-    case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
-    case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable          */
-    case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
-        break;
     case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt           */
-        /* FIT on 4xx */
         trace_ppc_excp_print("FIT");
         break;
     case POWERPC_EXCP_WDT:       /* Watchdog timer interrupt                 */
@@ -693,119 +648,9 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
             cpu_abort(cs, "Debug exception triggered on unsupported model\n");
         }
         break;
-    case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/VPU  */
-        env->spr[SPR_BOOKE_ESR] = ESR_SPV;
-        break;
-    case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt              */
-        break;
-    case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt     */
-        srr0 = SPR_BOOKE_CSRR0;
-        srr1 = SPR_BOOKE_CSRR1;
-        break;
-    case POWERPC_EXCP_RESET:     /* System reset exception                   */
-        /* A power-saving exception sets ME, otherwise it is unchanged */
-        if (msr_pow) {
-            /* indicate that we resumed from power save mode */
-            msr |= 0x10000;
-            new_msr |= ((target_ulong)1 << MSR_ME);
-        }
-        if (env->msr_mask & MSR_HVB) {
-            /*
-             * ISA specifies HV, but can be delivered to guest with HV
-             * clear (e.g., see FWNMI in PAPR, NMI injection in QEMU).
-             */
-            new_msr |= (target_ulong)MSR_HVB;
-        } else {
-            if (msr_pow) {
-                cpu_abort(cs, "Trying to deliver power-saving system reset "
-                          "exception %d with no HV support\n", excp);
-            }
-        }
-        break;
-    case POWERPC_EXCP_DSEG:      /* Data segment exception                   */
-    case POWERPC_EXCP_ISEG:      /* Instruction segment exception            */
-    case POWERPC_EXCP_TRACE:     /* Trace exception                          */
-        break;
-    case POWERPC_EXCP_HISI:      /* Hypervisor instruction storage exception */
-        msr |= env->error_code;
-        /* fall through */
-    case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception         */
-    case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception        */
-    case POWERPC_EXCP_HDSEG:     /* Hypervisor data segment exception        */
-    case POWERPC_EXCP_HISEG:     /* Hypervisor instruction segment exception */
-    case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt            */
-    case POWERPC_EXCP_HV_EMU:
-    case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization                */
-        srr0 = SPR_HSRR0;
-        srr1 = SPR_HSRR1;
-        new_msr |= (target_ulong)MSR_HVB;
-        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
-        break;
-    case POWERPC_EXCP_VPU:       /* Vector unavailable exception             */
-    case POWERPC_EXCP_VSXU:       /* VSX unavailable exception               */
-    case POWERPC_EXCP_FU:         /* Facility unavailable exception          */
-#ifdef TARGET_PPC64
-        env->spr[SPR_FSCR] |= ((target_ulong)env->error_code << 56);
-#endif
-        break;
-    case POWERPC_EXCP_HV_FU:     /* Hypervisor Facility Unavailable Exception */
-#ifdef TARGET_PPC64
-        env->spr[SPR_HFSCR] |= ((target_ulong)env->error_code << FSCR_IC_POS);
-        srr0 = SPR_HSRR0;
-        srr1 = SPR_HSRR1;
-        new_msr |= (target_ulong)MSR_HVB;
-        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
-#endif
-        break;
     case POWERPC_EXCP_PIT:       /* Programmable interval timer interrupt    */
         trace_ppc_excp_print("PIT");
         break;
-    case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error              */
-    case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                       */
-    case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                      */
-        switch (excp_model) {
-        case POWERPC_EXCP_602:
-        case POWERPC_EXCP_603:
-        case POWERPC_EXCP_G2:
-            /* Swap temporary saved registers with GPRs */
-            if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
-                new_msr |= (target_ulong)1 << MSR_TGPR;
-                hreg_swap_gpr_tgpr(env);
-            }
-            /* fall through */
-        case POWERPC_EXCP_7x5:
-            ppc_excp_debug_sw_tlb(env, excp);
-
-            msr |= env->crf[0] << 28;
-            msr |= env->error_code; /* key, D/I, S/L bits */
-            /* Set way using a LRU mechanism */
-            msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
-            break;
-        default:
-            cpu_abort(cs, "Invalid TLB miss exception\n");
-            break;
-        }
-        break;
-    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interrupt   */
-    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interrupt  */
-    case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interrupt   */
-    case POWERPC_EXCP_IO:        /* IO error exception                       */
-    case POWERPC_EXCP_RUNM:      /* Run mode exception                       */
-    case POWERPC_EXCP_EMUL:      /* Emulation trap exception                 */
-    case POWERPC_EXCP_FPA:       /* Floating-point assist exception          */
-    case POWERPC_EXCP_DABR:      /* Data address breakpoint                  */
-    case POWERPC_EXCP_IABR:      /* Instruction address breakpoint           */
-    case POWERPC_EXCP_SMI:       /* System management interrupt              */
-    case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
-    case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
-    case POWERPC_EXCP_VPUA:      /* Vector assist exception                  */
-    case POWERPC_EXCP_SOFTP:     /* Soft patch exception                     */
-    case POWERPC_EXCP_MAINT:     /* Maintenance exception                    */
-    case POWERPC_EXCP_MEXTBR:    /* Maskable external breakpoint             */
-    case POWERPC_EXCP_NMEXTBR:   /* Non maskable external breakpoint         */
-        cpu_abort(cs, "%s exception not implemented\n",
-                  powerpc_excp_name(excp));
-        break;
     default:
     excp_invalid:
         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
@@ -824,41 +669,11 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
         }
     }
 
-    /*
-     * Sort out endianness of interrupt, this differs depending on the
-     * CPU, the HV mode, etc...
-     */
-    if (ppc_interrupts_little_endian(cpu, !!(new_msr & MSR_HVB))) {
-        new_msr |= (target_ulong)1 << MSR_LE;
-    }
+    /* Save PC */
+    env->spr[srr0] = env->nip;
 
-#if defined(TARGET_PPC64)
-    if (excp_model == POWERPC_EXCP_BOOKE) {
-        if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
-            /* Cat.64-bit: EPCR.ICM is copied to MSR.CM */
-            new_msr |= (target_ulong)1 << MSR_CM;
-        } else {
-            vector = (uint32_t)vector;
-        }
-    } else {
-        if (!msr_isf && !mmu_is_64bit(env->mmu_model)) {
-            vector = (uint32_t)vector;
-        } else {
-            new_msr |= (target_ulong)1 << MSR_SF;
-        }
-    }
-#endif
-
-    if (excp != POWERPC_EXCP_SYSCALL_VECTORED) {
-        /* Save PC */
-        env->spr[srr0] = env->nip;
-
-        /* Save MSR */
-        env->spr[srr1] = msr;
-    }
-
-    /* This can update new_msr and vector if AIL applies */
-    ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
+    /* Save MSR */
+    env->spr[srr1] = msr;
 
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
-- 
2.33.1



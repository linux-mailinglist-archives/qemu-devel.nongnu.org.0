Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348254A90EA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 23:54:36 +0100 (CET)
Received: from localhost ([::1]:37490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFkzr-0002un-7V
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 17:54:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFkou-0000tL-6p; Thu, 03 Feb 2022 17:43:17 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFkor-0004Uo-HW; Thu, 03 Feb 2022 17:43:15 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213McBtO002874; 
 Thu, 3 Feb 2022 22:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=LdDQmEH2kAw/Jmx21j1scH6ZYkN1XvZ3yxH+fUFniYo=;
 b=MIBR3JRBglqHSeWVAYMr65QdcbhHpJKaEZ1uEy9QOUwY2MM8XrXvrYPsIXDcu+CXaf8C
 qiqz53yx3lCpSsf1noqmUxIMFZXcDAFnfxkSkqvJDO/PDjZNcwEo1VEwFO/QmywNu5m8
 zTRoRjePSbJlMCjU/9LV8mfqRLBEXMk3apt6y6PEx6bDB8sNhvZY2iV6mWbrTxyd+8Oh
 u7lIa4awh0Id6DBAuUEuL09Qrk5ITerKC9t5KyMyy/pidwB3dhJglj+nggFC1IxrLNzL
 5Y9a1ccxGaBi/+kRZBIuXB7KGTw2e17L8fbmUQBXdlnGJz5qyCY/Es9q2X8xbonnzf2g JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0r12021s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 22:43:01 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 213Mh1pL027493;
 Thu, 3 Feb 2022 22:43:01 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0r12021f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 22:43:01 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213MbacT010097;
 Thu, 3 Feb 2022 22:42:59 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 3e0r0ur23u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 22:42:59 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213Mgw1U28574110
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 22:42:59 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD495BE051;
 Thu,  3 Feb 2022 22:42:58 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B51EBE04F;
 Thu,  3 Feb 2022 22:42:57 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.67.28])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Feb 2022 22:42:57 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/10] target/ppc: Simplify powerpc_excp_7xx
Date: Thu,  3 Feb 2022 19:42:39 -0300
Message-Id: <20220203224246.1446652-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203224246.1446652-1-farosas@linux.ibm.com>
References: <20220203224246.1446652-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WztWiEkYUwFO_rVhvt2rNGvYzeXK6aRP
X-Proofpoint-ORIG-GUID: D90CK84vcdJRpEhRf4rZQ99HN4WFqKI0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=839 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030132
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
POWERPC_EXCP_DLTLB
POWERPC_EXCP_DSI
POWERPC_EXCP_DSTLB
POWERPC_EXCP_EXTERNAL
POWERPC_EXCP_FPU
POWERPC_EXCP_IABR
POWERPC_EXCP_IFTLB
POWERPC_EXCP_ISI
POWERPC_EXCP_MCHECK
POWERPC_EXCP_PERFM
POWERPC_EXCP_PROGRAM
POWERPC_EXCP_RESET
POWERPC_EXCP_SMI
POWERPC_EXCP_SYSCALL
POWERPC_EXCP_THERM
POWERPC_EXCP_TRACE

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 185 ++-------------------------------------
 1 file changed, 9 insertions(+), 176 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index df96f620b2..358c3f6206 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -758,54 +758,26 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
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
+     * new interrupt handler msr preserves existing ME unless
      * explicitly overriden
      */
-    new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
+    new_msr = env->msr & ((target_ulong)1 << MSR_ME);
 
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
@@ -815,22 +787,6 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
     vector |= env->excp_prefix;
 
     switch (excp) {
-    case POWERPC_EXCP_CRITICAL:    /* Critical input                         */
-        switch (excp_model) {
-        case POWERPC_EXCP_40x:
-            srr0 = SPR_40x_SRR2;
-            srr1 = SPR_40x_SRR3;
-            break;
-        case POWERPC_EXCP_BOOKE:
-            srr0 = SPR_BOOKE_CSRR0;
-            srr1 = SPR_BOOKE_CSRR1;
-            break;
-        case POWERPC_EXCP_6xx:
-            break;
-        default:
-            goto excp_invalid;
-        }
-        break;
     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
         if (msr_me == 0) {
             /*
@@ -994,63 +950,9 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
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
     case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
-    case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable          */
     case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
         break;
-    case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt           */
-        /* FIT on 4xx */
-        trace_ppc_excp_print("FIT");
-        break;
-    case POWERPC_EXCP_WDT:       /* Watchdog timer interrupt                 */
-        trace_ppc_excp_print("WDT");
-        switch (excp_model) {
-        case POWERPC_EXCP_BOOKE:
-            srr0 = SPR_BOOKE_CSRR0;
-            srr1 = SPR_BOOKE_CSRR1;
-            break;
-        default:
-            break;
-        }
-        break;
-    case POWERPC_EXCP_DTLB:      /* Data TLB error                           */
-    case POWERPC_EXCP_ITLB:      /* Instruction TLB error                    */
-        break;
-    case POWERPC_EXCP_DEBUG:     /* Debug interrupt                          */
-        if (env->flags & POWERPC_FLAG_DE) {
-            /* FIXME: choose one or the other based on CPU type */
-            srr0 = SPR_BOOKE_DSRR0;
-            srr1 = SPR_BOOKE_DSRR1;
-
-            env->spr[SPR_BOOKE_CSRR0] = env->nip;
-            env->spr[SPR_BOOKE_CSRR1] = msr;
-
-            /* DBSR already modified by caller */
-        } else {
-            cpu_abort(cs, "Debug exception triggered on unsupported model\n");
-        }
-        break;
-    case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/VPU  */
-        env->spr[SPR_BOOKE_ESR] = ESR_SPV;
-        break;
-    case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt              */
-        break;
-    case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt     */
-        srr0 = SPR_BOOKE_CSRR0;
-        srr1 = SPR_BOOKE_CSRR1;
-        break;
     case POWERPC_EXCP_RESET:     /* System reset exception                   */
         /* A power-saving exception sets ME, otherwise it is unchanged */
         if (msr_pow) {
@@ -1071,44 +973,8 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
             }
         }
         break;
-    case POWERPC_EXCP_DSEG:      /* Data segment exception                   */
-    case POWERPC_EXCP_ISEG:      /* Instruction segment exception            */
     case POWERPC_EXCP_TRACE:     /* Trace exception                          */
         break;
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
-    case POWERPC_EXCP_PIT:       /* Programmable interval timer interrupt    */
-        trace_ppc_excp_print("PIT");
-        break;
     case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error              */
     case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                       */
     case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                      */
@@ -1133,25 +999,14 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
             break;
         }
         break;
-    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interrupt   */
-    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interrupt  */
-    case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interrupt   */
-    case POWERPC_EXCP_FPA:       /* Floating-point assist exception          */
-    case POWERPC_EXCP_DABR:      /* Data address breakpoint                  */
     case POWERPC_EXCP_IABR:      /* Instruction address breakpoint           */
     case POWERPC_EXCP_SMI:       /* System management interrupt              */
     case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
     case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
-    case POWERPC_EXCP_VPUA:      /* Vector assist exception                  */
-    case POWERPC_EXCP_SOFTP:     /* Soft patch exception                     */
-    case POWERPC_EXCP_MAINT:     /* Maintenance exception                    */
-    case POWERPC_EXCP_MEXTBR:    /* Maskable external breakpoint             */
-    case POWERPC_EXCP_NMEXTBR:   /* Non maskable external breakpoint         */
         cpu_abort(cs, "%s exception not implemented\n",
                   powerpc_excp_name(excp));
         break;
     default:
-    excp_invalid:
         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
         break;
     }
@@ -1176,33 +1031,11 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
         new_msr |= (target_ulong)1 << MSR_LE;
     }
 
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
+    /* Save PC */
+    env->spr[srr0] = env->nip;
 
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
2.34.1



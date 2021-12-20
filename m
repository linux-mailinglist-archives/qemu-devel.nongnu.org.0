Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 552A647B3EB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 20:46:45 +0100 (CET)
Received: from localhost ([::1]:38876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzOcO-00052X-F2
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 14:46:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNFy-0002Ut-VS; Mon, 20 Dec 2021 13:19:30 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNFw-0006iz-VS; Mon, 20 Dec 2021 13:19:30 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKGEfbU029771; 
 Mon, 20 Dec 2021 18:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=uRgoLBW6Fxrg8Vr+xFTdA9KIg/grbpnLZwCJZyWXafo=;
 b=CWHxzpzZsuN0r0CvhOBmwctvmaDqADSPr2rxasPskzIyUSNZU5BFmhFT5+M7XWktYgyT
 rej0rUdxlgoQ0s4lx7v+c6F3ys9lD2SxowbFsgnN4S359anFK0x4Zose5yLI+7UdIAq4
 0h2DAkwse/gwhTS6mICspq+RJN/du2utkn1oVE5Mm1H4hljOd24rIRc11T4Fe+GTqioo
 PS0yj2LOClXT94O7ts0csryc14mYdzXbrQGvfHxp2OjC9lnuTGFppAoHOo1Q9pfKS7/c
 jwHOcYbQlCjbBo1HyRoBRLV/6THv+4U0B2tdcI4kF20kcJhj7PKHczpYan4h+OfkWuGJ vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1s4e2nue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:22 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BKIFWU2007316;
 Mon, 20 Dec 2021 18:19:22 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1s4e2nu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:22 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BKIDR6j016579;
 Mon, 20 Dec 2021 18:19:21 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 3d179aa9mt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:21 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BKIJKBQ33882620
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 18:19:20 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02FC5C6062;
 Mon, 20 Dec 2021 18:19:20 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6988BC605A;
 Mon, 20 Dec 2021 18:19:18 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.60.53])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Dec 2021 18:19:18 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 04/12] target/ppc: powerpc_excp: Stop passing excp_model
 around
Date: Mon, 20 Dec 2021 15:18:55 -0300
Message-Id: <20211220181903.3456898-5-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211220181903.3456898-1-farosas@linux.ibm.com>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LaMR4KF7eGO32gnIVADmI7El0_DsZwuJ
X-Proofpoint-GUID: wDOQhdRjFdYdsBWCCcn5ozmb7VhCEEc_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_08,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200101
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
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

We can just access it directly in powerpc_excp.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 43 ++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 7bdc1e8410..45641f6d1d 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -293,10 +293,11 @@ static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
  * Note that this function should be greatly optimized when called
  * with a constant excp, from ppc_hw_interrupt
  */
-static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
+static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
+    int excp_model = env->excp_model;
     target_ulong msr, new_msr, vector;
     int srr0, srr1, lev = -1;
 
@@ -878,9 +879,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 void ppc_cpu_do_interrupt(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
 
-    powerpc_excp(cpu, env->excp_model, cs->exception_index);
+    powerpc_excp(cpu, cs->exception_index);
 }
 
 static void ppc_hw_interrupt(CPUPPCState *env)
@@ -891,20 +891,20 @@ static void ppc_hw_interrupt(CPUPPCState *env)
     /* External reset */
     if (env->pending_interrupts & (1 << PPC_INTERRUPT_RESET)) {
         env->pending_interrupts &= ~(1 << PPC_INTERRUPT_RESET);
-        powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_RESET);
+        powerpc_excp(cpu, POWERPC_EXCP_RESET);
         return;
     }
     /* Machine check exception */
     if (env->pending_interrupts & (1 << PPC_INTERRUPT_MCK)) {
         env->pending_interrupts &= ~(1 << PPC_INTERRUPT_MCK);
-        powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_MCHECK);
+        powerpc_excp(cpu, POWERPC_EXCP_MCHECK);
         return;
     }
 #if 0 /* TODO */
     /* External debug exception */
     if (env->pending_interrupts & (1 << PPC_INTERRUPT_DEBUG)) {
         env->pending_interrupts &= ~(1 << PPC_INTERRUPT_DEBUG);
-        powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_DEBUG);
+        powerpc_excp(cpu, POWERPC_EXCP_DEBUG);
         return;
     }
 #endif
@@ -924,7 +924,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         if ((async_deliver || msr_hv == 0) && hdice) {
             /* HDEC clears on delivery */
             env->pending_interrupts &= ~(1 << PPC_INTERRUPT_HDECR);
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_HDECR);
+            powerpc_excp(cpu, POWERPC_EXCP_HDECR);
             return;
         }
     }
@@ -934,7 +934,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         /* LPCR will be clear when not supported so this will work */
         bool hvice = !!(env->spr[SPR_LPCR] & LPCR_HVICE);
         if ((async_deliver || msr_hv == 0) && hvice) {
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_HVIRT);
+            powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
             return;
         }
     }
@@ -946,14 +946,14 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         /* HEIC blocks delivery to the hypervisor */
         if ((async_deliver && !(heic && msr_hv && !msr_pr)) ||
             (env->has_hv_mode && msr_hv == 0 && !lpes0)) {
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_EXTERNAL);
+            powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
             return;
         }
     }
     if (msr_ce != 0) {
         /* External critical interrupt */
         if (env->pending_interrupts & (1 << PPC_INTERRUPT_CEXT)) {
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_CRITICAL);
+            powerpc_excp(cpu, POWERPC_EXCP_CRITICAL);
             return;
         }
     }
@@ -961,24 +961,24 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         /* Watchdog timer on embedded PowerPC */
         if (env->pending_interrupts & (1 << PPC_INTERRUPT_WDT)) {
             env->pending_interrupts &= ~(1 << PPC_INTERRUPT_WDT);
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_WDT);
+            powerpc_excp(cpu, POWERPC_EXCP_WDT);
             return;
         }
         if (env->pending_interrupts & (1 << PPC_INTERRUPT_CDOORBELL)) {
             env->pending_interrupts &= ~(1 << PPC_INTERRUPT_CDOORBELL);
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_DOORCI);
+            powerpc_excp(cpu, POWERPC_EXCP_DOORCI);
             return;
         }
         /* Fixed interval timer on embedded PowerPC */
         if (env->pending_interrupts & (1 << PPC_INTERRUPT_FIT)) {
             env->pending_interrupts &= ~(1 << PPC_INTERRUPT_FIT);
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_FIT);
+            powerpc_excp(cpu, POWERPC_EXCP_FIT);
             return;
         }
         /* Programmable interval timer on embedded PowerPC */
         if (env->pending_interrupts & (1 << PPC_INTERRUPT_PIT)) {
             env->pending_interrupts &= ~(1 << PPC_INTERRUPT_PIT);
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_PIT);
+            powerpc_excp(cpu, POWERPC_EXCP_PIT);
             return;
         }
         /* Decrementer exception */
@@ -986,32 +986,32 @@ static void ppc_hw_interrupt(CPUPPCState *env)
             if (ppc_decr_clear_on_delivery(env)) {
                 env->pending_interrupts &= ~(1 << PPC_INTERRUPT_DECR);
             }
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_DECR);
+            powerpc_excp(cpu, POWERPC_EXCP_DECR);
             return;
         }
         if (env->pending_interrupts & (1 << PPC_INTERRUPT_DOORBELL)) {
             env->pending_interrupts &= ~(1 << PPC_INTERRUPT_DOORBELL);
             if (is_book3s_arch2x(env)) {
-                powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_SDOOR);
+                powerpc_excp(cpu, POWERPC_EXCP_SDOOR);
             } else {
-                powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_DOORI);
+                powerpc_excp(cpu, POWERPC_EXCP_DOORI);
             }
             return;
         }
         if (env->pending_interrupts & (1 << PPC_INTERRUPT_HDOORBELL)) {
             env->pending_interrupts &= ~(1 << PPC_INTERRUPT_HDOORBELL);
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_SDOOR_HV);
+            powerpc_excp(cpu, POWERPC_EXCP_SDOOR_HV);
             return;
         }
         if (env->pending_interrupts & (1 << PPC_INTERRUPT_PERFM)) {
             env->pending_interrupts &= ~(1 << PPC_INTERRUPT_PERFM);
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_PERFM);
+            powerpc_excp(cpu, POWERPC_EXCP_PERFM);
             return;
         }
         /* Thermal interrupt */
         if (env->pending_interrupts & (1 << PPC_INTERRUPT_THERM)) {
             env->pending_interrupts &= ~(1 << PPC_INTERRUPT_THERM);
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_THERM);
+            powerpc_excp(cpu, POWERPC_EXCP_THERM);
             return;
         }
     }
@@ -1036,9 +1036,8 @@ static void ppc_hw_interrupt(CPUPPCState *env)
 void ppc_cpu_do_system_reset(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
 
-    powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_RESET);
+    powerpc_excp(cpu, POWERPC_EXCP_RESET);
 }
 
 void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)
-- 
2.33.1



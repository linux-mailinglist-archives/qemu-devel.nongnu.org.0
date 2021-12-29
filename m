Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6970A4815A5
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 18:13:22 +0100 (CET)
Received: from localhost ([::1]:54378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2cVs-0002XU-Td
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 12:13:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n2cHU-0003z1-27; Wed, 29 Dec 2021 11:58:28 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2530
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n2cHR-00048j-Vx; Wed, 29 Dec 2021 11:58:27 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BTG2pMI016253; 
 Wed, 29 Dec 2021 16:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=f0XXXaAr0iG6VMOQD+8Y9Bpl+RNUKUgajRVbuQVZLLM=;
 b=RLEFUlM8tQgmEh41RzOou3ibEJyqW/3Z7lafkH6KgmJzPG9K/xtjKrM6RLY/HhfViwGt
 o55sNnI3wgSPEjG5yDzz7YCTaP9kYYzcEaduOrlH+ct1OV8RXFqOgrzqk1VwoKl48q6Z
 ZYH00BImtS9/B6xfTnIRWV4eMQXP35WdtxJSudQSLBJAgc6Y0HLCmtoyMzUpykab34Gh
 XCbhtl2wXdB/rQYlhzVmphy0T7CoHadJK36/WPgYaiT8uOWOy+H081Mj6uMWMCh3Nfjt
 eFOXsXHNcK3kb+EjbvX3yw1EP8PZb+BZOdRXsOm+50iitLjYwyzwJkgYModcKr5vmgj/ gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d84jm0fw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Dec 2021 16:58:14 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BTGnLPH010209;
 Wed, 29 Dec 2021 16:58:14 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d84jm0fvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Dec 2021 16:58:14 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BTGvin2023274;
 Wed, 29 Dec 2021 16:58:13 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 3d5txbbecu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Dec 2021 16:58:13 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BTGwCLV15728960
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Dec 2021 16:58:12 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC06AAC059;
 Wed, 29 Dec 2021 16:58:12 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7448DAC05F;
 Wed, 29 Dec 2021 16:58:10 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.90.107])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 29 Dec 2021 16:58:10 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] target/ppc: powerpc_excp: Stop passing excp_model
 around
Date: Wed, 29 Dec 2021 13:57:51 -0300
Message-Id: <20211229165751.3774248-6-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211229165751.3774248-1-farosas@linux.ibm.com>
References: <20211229165751.3774248-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: P9QBgdGtdsq7_p56-MzZB2yZRiwozPsZ
X-Proofpoint-ORIG-GUID: fZ105Ym7tJT-g4hSUoe5_dLMRZUSFyzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-29_06,2021-12-29_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112290088
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can just access it directly in powerpc_excp.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/excp_helper.c | 43 ++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 811f6be0a0..c7e55800af 100644
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
 
@@ -879,9 +880,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 void ppc_cpu_do_interrupt(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
 
-    powerpc_excp(cpu, env->excp_model, cs->exception_index);
+    powerpc_excp(cpu, cs->exception_index);
 }
 
 static void ppc_hw_interrupt(CPUPPCState *env)
@@ -892,20 +892,20 @@ static void ppc_hw_interrupt(CPUPPCState *env)
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
@@ -925,7 +925,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         if ((async_deliver || msr_hv == 0) && hdice) {
             /* HDEC clears on delivery */
             env->pending_interrupts &= ~(1 << PPC_INTERRUPT_HDECR);
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_HDECR);
+            powerpc_excp(cpu, POWERPC_EXCP_HDECR);
             return;
         }
     }
@@ -935,7 +935,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         /* LPCR will be clear when not supported so this will work */
         bool hvice = !!(env->spr[SPR_LPCR] & LPCR_HVICE);
         if ((async_deliver || msr_hv == 0) && hvice) {
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_HVIRT);
+            powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
             return;
         }
     }
@@ -947,14 +947,14 @@ static void ppc_hw_interrupt(CPUPPCState *env)
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
@@ -962,24 +962,24 @@ static void ppc_hw_interrupt(CPUPPCState *env)
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
@@ -987,32 +987,32 @@ static void ppc_hw_interrupt(CPUPPCState *env)
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
@@ -1037,9 +1037,8 @@ static void ppc_hw_interrupt(CPUPPCState *env)
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



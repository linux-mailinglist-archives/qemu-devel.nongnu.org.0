Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF63483D61
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:01:54 +0100 (CET)
Received: from localhost ([::1]:45648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4elW-0007Ue-07
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:01:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIu-00060W-2Z; Tue, 04 Jan 2022 02:32:20 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:6892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIq-0008Np-O7; Tue, 04 Jan 2022 02:32:19 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2044mNuP007744; 
 Tue, 4 Jan 2022 07:31:44 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcfhn27k1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:43 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2047O5Mq030603;
 Tue, 4 Jan 2022 07:31:41 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3daek9f61q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:41 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2047MsbW49480156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jan 2022 07:22:54 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE99152051;
 Tue,  4 Jan 2022 07:31:38 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 935FD52054;
 Tue,  4 Jan 2022 07:31:38 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.19])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D261A220144;
 Tue,  4 Jan 2022 08:31:37 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 22/26] target/ppc: powerpc_excp: Stop passing excp_model around
Date: Tue,  4 Jan 2022 08:31:17 +0100
Message-Id: <20220104073121.3784280-23-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220104073121.3784280-1-clg@kaod.org>
References: <20220104073121.3784280-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: O5FsW2MQRfygp1qneFPmtDU9YsPgbmhT
X-Proofpoint-ORIG-GUID: O5FsW2MQRfygp1qneFPmtDU9YsPgbmhT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_04,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1034 mlxscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040049
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

We can just access it directly in powerpc_excp.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
[ clg: Took into account removal of inline ]
Message-Id: <20211229165751.3774248-6-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 43 ++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 2c20a8060cf9..a779dc936a55 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -365,10 +365,11 @@ static void powerpc_set_excp_state(PowerPCCPU *cpu,
  * Note that this function should be greatly optimized when called
  * with a constant excp, from ppc_hw_interrupt
  */
-static void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
+static void powerpc_excp(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
+    int excp_model =3D env->excp_model;
     target_ulong msr, new_msr, vector;
     int srr0, srr1, lev =3D -1;
=20
@@ -952,9 +953,8 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp_mo=
del, int excp)
 void ppc_cpu_do_interrupt(CPUState *cs)
 {
     PowerPCCPU *cpu =3D POWERPC_CPU(cs);
-    CPUPPCState *env =3D &cpu->env;
=20
-    powerpc_excp(cpu, env->excp_model, cs->exception_index);
+    powerpc_excp(cpu, cs->exception_index);
 }
=20
 static void ppc_hw_interrupt(CPUPPCState *env)
@@ -965,20 +965,20 @@ static void ppc_hw_interrupt(CPUPPCState *env)
     /* External reset */
     if (env->pending_interrupts & (1 << PPC_INTERRUPT_RESET)) {
         env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_RESET);
-        powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_RESET);
+        powerpc_excp(cpu, POWERPC_EXCP_RESET);
         return;
     }
     /* Machine check exception */
     if (env->pending_interrupts & (1 << PPC_INTERRUPT_MCK)) {
         env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_MCK);
-        powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_MCHECK);
+        powerpc_excp(cpu, POWERPC_EXCP_MCHECK);
         return;
     }
 #if 0 /* TODO */
     /* External debug exception */
     if (env->pending_interrupts & (1 << PPC_INTERRUPT_DEBUG)) {
         env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_DEBUG);
-        powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_DEBUG);
+        powerpc_excp(cpu, POWERPC_EXCP_DEBUG);
         return;
     }
 #endif
@@ -998,7 +998,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         if ((async_deliver || msr_hv =3D=3D 0) && hdice) {
             /* HDEC clears on delivery */
             env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_HDECR);
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_HDECR);
+            powerpc_excp(cpu, POWERPC_EXCP_HDECR);
             return;
         }
     }
@@ -1008,7 +1008,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         /* LPCR will be clear when not supported so this will work */
         bool hvice =3D !!(env->spr[SPR_LPCR] & LPCR_HVICE);
         if ((async_deliver || msr_hv =3D=3D 0) && hvice) {
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_HVIRT);
+            powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
             return;
         }
     }
@@ -1020,14 +1020,14 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         /* HEIC blocks delivery to the hypervisor */
         if ((async_deliver && !(heic && msr_hv && !msr_pr)) ||
             (env->has_hv_mode && msr_hv =3D=3D 0 && !lpes0)) {
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_EXTERNAL);
+            powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
             return;
         }
     }
     if (msr_ce !=3D 0) {
         /* External critical interrupt */
         if (env->pending_interrupts & (1 << PPC_INTERRUPT_CEXT)) {
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_CRITICAL);
+            powerpc_excp(cpu, POWERPC_EXCP_CRITICAL);
             return;
         }
     }
@@ -1035,24 +1035,24 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         /* Watchdog timer on embedded PowerPC */
         if (env->pending_interrupts & (1 << PPC_INTERRUPT_WDT)) {
             env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_WDT);
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_WDT);
+            powerpc_excp(cpu, POWERPC_EXCP_WDT);
             return;
         }
         if (env->pending_interrupts & (1 << PPC_INTERRUPT_CDOORBELL)) {
             env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_CDOORBELL)=
;
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_DOORCI);
+            powerpc_excp(cpu, POWERPC_EXCP_DOORCI);
             return;
         }
         /* Fixed interval timer on embedded PowerPC */
         if (env->pending_interrupts & (1 << PPC_INTERRUPT_FIT)) {
             env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_FIT);
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_FIT);
+            powerpc_excp(cpu, POWERPC_EXCP_FIT);
             return;
         }
         /* Programmable interval timer on embedded PowerPC */
         if (env->pending_interrupts & (1 << PPC_INTERRUPT_PIT)) {
             env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_PIT);
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_PIT);
+            powerpc_excp(cpu, POWERPC_EXCP_PIT);
             return;
         }
         /* Decrementer exception */
@@ -1060,32 +1060,32 @@ static void ppc_hw_interrupt(CPUPPCState *env)
             if (ppc_decr_clear_on_delivery(env)) {
                 env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_DECR);
             }
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_DECR);
+            powerpc_excp(cpu, POWERPC_EXCP_DECR);
             return;
         }
         if (env->pending_interrupts & (1 << PPC_INTERRUPT_DOORBELL)) {
             env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_DOORBELL);
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
             env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_HDOORBELL)=
;
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_SDOOR_HV);
+            powerpc_excp(cpu, POWERPC_EXCP_SDOOR_HV);
             return;
         }
         if (env->pending_interrupts & (1 << PPC_INTERRUPT_PERFM)) {
             env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_PERFM);
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_PERFM);
+            powerpc_excp(cpu, POWERPC_EXCP_PERFM);
             return;
         }
         /* Thermal interrupt */
         if (env->pending_interrupts & (1 << PPC_INTERRUPT_THERM)) {
             env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_THERM);
-            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_THERM);
+            powerpc_excp(cpu, POWERPC_EXCP_THERM);
             return;
         }
     }
@@ -1110,9 +1110,8 @@ static void ppc_hw_interrupt(CPUPPCState *env)
 void ppc_cpu_do_system_reset(CPUState *cs)
 {
     PowerPCCPU *cpu =3D POWERPC_CPU(cs);
-    CPUPPCState *env =3D &cpu->env;
=20
-    powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_RESET);
+    powerpc_excp(cpu, POWERPC_EXCP_RESET);
 }
=20
 void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)
--=20
2.31.1



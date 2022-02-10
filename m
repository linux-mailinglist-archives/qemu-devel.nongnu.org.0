Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A164B1219
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 16:53:24 +0100 (CET)
Received: from localhost ([::1]:35056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIBl5-0002iX-Kv
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 10:53:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI95E-0002Eg-6Q; Thu, 10 Feb 2022 08:02:00 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:64918
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI94d-0004Lr-JL; Thu, 10 Feb 2022 08:01:32 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21ACii8r025208; 
 Thu, 10 Feb 2022 13:00:53 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e503qcetn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:52 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21ACw2Ae030333;
 Thu, 10 Feb 2022 13:00:44 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3e1ggkg4va-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:44 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21AD0fq041615850
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 13:00:41 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A8F84207A;
 Thu, 10 Feb 2022 13:00:41 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2108B42089;
 Thu, 10 Feb 2022 13:00:41 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Feb 2022 13:00:41 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.74.250])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 56EFA2201DC;
 Thu, 10 Feb 2022 14:00:40 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 39/42] target/ppc: books: Remove excp_model argument from
 ppc_excp_apply_ail
Date: Thu, 10 Feb 2022 14:00:05 +0100
Message-Id: <20220210130008.2599950-40-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210130008.2599950-1-clg@kaod.org>
References: <20220210130008.2599950-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vz718kaYfomoM3gi7AW9zp1EnnTntQ_L
X-Proofpoint-ORIG-GUID: vz718kaYfomoM3gi7AW9zp1EnnTntQ_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_05,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 mlxlogscore=993 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1034
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202100071
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.146,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

We don't really need to check for exception model while applying
AIL. We can check the lpcr_mask for the presence of
LPCR_AIL/LPCR_HAIL.

This removes one more instance of passing the exception model ID
around.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20220207183036.1507882-5-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 83be6698dfd4..fcc83a77015f 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -262,11 +262,10 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUPP=
CState *env, int excp,
  * | a         | h          | 11          | 1       | 1           | h   =
|
  * +--------------------------------------------------------------------=
+
  */
-static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp=
,
-                                      target_ulong msr,
-                                      target_ulong *new_msr,
-                                      target_ulong *vector)
+static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp, target_ulong m=
sr,
+                               target_ulong *new_msr, target_ulong *vect=
or)
 {
+    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
     CPUPPCState *env =3D &cpu->env;
     bool mmu_all_on =3D ((msr >> MSR_IR) & 1) && ((msr >> MSR_DR) & 1);
     bool hv_escalation =3D !(msr & MSR_HVB) && (*new_msr & MSR_HVB);
@@ -279,8 +278,13 @@ static void ppc_excp_apply_ail(PowerPCCPU *cpu, int =
excp_model, int excp,
         return;
     }
=20
-    if (excp_model =3D=3D POWERPC_EXCP_POWER8 ||
-        excp_model =3D=3D POWERPC_EXCP_POWER9) {
+    if (!(pcc->lpcr_mask & LPCR_AIL)) {
+        /* This CPU does not have AIL */
+        return;
+    }
+
+    /* P8 & P9 */
+    if (!(pcc->lpcr_mask & LPCR_HAIL)) {
         if (!mmu_all_on) {
             /* AIL only works if MSR[IR] and MSR[DR] are both enabled. *=
/
             return;
@@ -303,7 +307,8 @@ static void ppc_excp_apply_ail(PowerPCCPU *cpu, int e=
xcp_model, int excp,
             return;
         }
=20
-    } else if (excp_model =3D=3D POWERPC_EXCP_POWER10) {
+    /* P10 and up */
+    } else {
         if (!mmu_all_on && !hv_escalation) {
             /*
              * AIL works for HV interrupts even with guest MSR[IR/DR] di=
sabled.
@@ -328,9 +333,6 @@ static void ppc_excp_apply_ail(PowerPCCPU *cpu, int e=
xcp_model, int excp,
             /* AIL=3D1 and AIL=3D2 are reserved, treat them like AIL=3D0=
 */
             return;
         }
-    } else {
-        /* Other processors do not support AIL */
-        return;
     }
=20
     /*
@@ -1280,7 +1282,6 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int=
 excp)
 {
     CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
-    int excp_model =3D env->excp_model;
     target_ulong msr, new_msr, vector;
     int srr0, srr1, lev =3D -1;
=20
@@ -1551,7 +1552,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int=
 excp)
     }
=20
     /* This can update new_msr and vector if AIL applies */
-    ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
+    ppc_excp_apply_ail(cpu, excp, msr, &new_msr, &vector);
=20
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
--=20
2.34.1



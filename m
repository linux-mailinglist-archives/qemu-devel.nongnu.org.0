Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8384BB795
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 12:05:35 +0100 (CET)
Received: from localhost ([::1]:49238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL14w-0007eN-G5
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 06:05:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fr-0001Du-8A; Fri, 18 Feb 2022 05:39:39 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12264
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fg-0005g3-Pm; Fri, 18 Feb 2022 05:39:38 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I91aPa026873; 
 Fri, 18 Feb 2022 10:38:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ea8fbj03p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:41 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21I9QFF3010291;
 Fri, 18 Feb 2022 10:38:41 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ea8fbj032-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:41 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IAbtgZ004771;
 Fri, 18 Feb 2022 10:38:39 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64has7wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:39 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21IAS9o430474496
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 10:28:09 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23570AE045;
 Fri, 18 Feb 2022 10:38:37 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCB16AE053;
 Fri, 18 Feb 2022 10:38:36 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 10:38:36 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 3DC6E2201F1;
 Fri, 18 Feb 2022 11:38:36 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 10/39] target/ppc: Add powerpc_reset_excp_state helper
Date: Fri, 18 Feb 2022 11:37:58 +0100
Message-Id: <20220218103827.682032-11-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218103827.682032-1-clg@kaod.org>
References: <20220218103827.682032-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: M7QDlLZ1qBR1-bZY2A87yeeWTq3OzxZ1
X-Proofpoint-GUID: vjA-m90onHNJBM8W18lvifkERhU0Z7Ml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 mlxscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180067
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicholas Piggin <npiggin@gmail.com>

This moves the logic to reset the QEMU exception state into its own
function.

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
[ clg: checkpatch fixes ]
Message-Id: <20220216102545.1808018-8-npiggin@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 42 +++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 6b6ec71bc22a..7499fa187f6f 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -360,12 +360,21 @@ static void ppc_excp_apply_ail(PowerPCCPU *cpu, int=
 excp, target_ulong msr,
 }
 #endif
=20
-static void powerpc_set_excp_state(PowerPCCPU *cpu,
-                                          target_ulong vector, target_ul=
ong msr)
+static void powerpc_reset_excp_state(PowerPCCPU *cpu)
 {
     CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
=20
+    /* Reset exception state */
+    cs->exception_index =3D POWERPC_EXCP_NONE;
+    env->error_code =3D 0;
+}
+
+static void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong vector,
+                                   target_ulong msr)
+{
+    CPUPPCState *env =3D &cpu->env;
+
     assert((msr & env->msr_mask) =3D=3D msr);
=20
     /*
@@ -376,21 +385,20 @@ static void powerpc_set_excp_state(PowerPCCPU *cpu,
      * will prevent setting of the HV bit which some exceptions might ne=
ed
      * to do.
      */
+    env->nip =3D vector;
     env->msr =3D msr;
     hreg_compute_hflags(env);
-    env->nip =3D vector;
-    /* Reset exception state */
-    cs->exception_index =3D POWERPC_EXCP_NONE;
-    env->error_code =3D 0;
=20
-    /* Reset the reservation */
-    env->reserve_addr =3D -1;
+    powerpc_reset_excp_state(cpu);
=20
     /*
      * Any interrupt is context synchronizing, check if TCG TLB needs
      * a delayed flush on ppc64
      */
     check_tlb_flush(env, false);
+
+    /* Reset the reservation */
+    env->reserve_addr =3D -1;
 }
=20
 static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
@@ -471,8 +479,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int exc=
p)
         case POWERPC_EXCP_FP:
             if ((msr_fe0 =3D=3D 0 && msr_fe1 =3D=3D 0) || msr_fp =3D=3D =
0) {
                 trace_ppc_excp_fp_ignore();
-                cs->exception_index =3D POWERPC_EXCP_NONE;
-                env->error_code =3D 0;
+                powerpc_reset_excp_state(cpu);
                 return;
             }
             env->spr[SPR_40x_ESR] =3D ESR_FP;
@@ -609,8 +616,7 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int exc=
p)
         case POWERPC_EXCP_FP:
             if ((msr_fe0 =3D=3D 0 && msr_fe1 =3D=3D 0) || msr_fp =3D=3D =
0) {
                 trace_ppc_excp_fp_ignore();
-                cs->exception_index =3D POWERPC_EXCP_NONE;
-                env->error_code =3D 0;
+                powerpc_reset_excp_state(cpu);
                 return;
             }
=20
@@ -783,8 +789,7 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int exc=
p)
         case POWERPC_EXCP_FP:
             if ((msr_fe0 =3D=3D 0 && msr_fe1 =3D=3D 0) || msr_fp =3D=3D =
0) {
                 trace_ppc_excp_fp_ignore();
-                cs->exception_index =3D POWERPC_EXCP_NONE;
-                env->error_code =3D 0;
+                powerpc_reset_excp_state(cpu);
                 return;
             }
=20
@@ -969,8 +974,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int ex=
cp)
         case POWERPC_EXCP_FP:
             if ((msr_fe0 =3D=3D 0 && msr_fe1 =3D=3D 0) || msr_fp =3D=3D =
0) {
                 trace_ppc_excp_fp_ignore();
-                cs->exception_index =3D POWERPC_EXCP_NONE;
-                env->error_code =3D 0;
+                powerpc_reset_excp_state(cpu);
                 return;
             }
=20
@@ -1168,8 +1172,7 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int=
 excp)
         case POWERPC_EXCP_FP:
             if ((msr_fe0 =3D=3D 0 && msr_fe1 =3D=3D 0) || msr_fp =3D=3D =
0) {
                 trace_ppc_excp_fp_ignore();
-                cs->exception_index =3D POWERPC_EXCP_NONE;
-                env->error_code =3D 0;
+                powerpc_reset_excp_state(cpu);
                 return;
             }
=20
@@ -1406,8 +1409,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int=
 excp)
         case POWERPC_EXCP_FP:
             if ((msr_fe0 =3D=3D 0 && msr_fe1 =3D=3D 0) || msr_fp =3D=3D =
0) {
                 trace_ppc_excp_fp_ignore();
-                cs->exception_index =3D POWERPC_EXCP_NONE;
-                env->error_code =3D 0;
+                powerpc_reset_excp_state(cpu);
                 return;
             }
=20
--=20
2.34.1



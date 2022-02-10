Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169384B1205
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 16:48:13 +0100 (CET)
Received: from localhost ([::1]:55718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIBg3-0005VT-Vt
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 10:48:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI95A-0002EC-U8; Thu, 10 Feb 2022 08:01:59 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36976
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI94P-0004G9-3B; Thu, 10 Feb 2022 08:01:28 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21ABT1tE027181; 
 Thu, 10 Feb 2022 13:00:46 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e4m98a8mg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:45 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21ACvwOW012037;
 Thu, 10 Feb 2022 13:00:43 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3e1gv9r2pn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21AD0eGk32440710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 13:00:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA82C4C07C;
 Thu, 10 Feb 2022 13:00:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFFBB4C076;
 Thu, 10 Feb 2022 13:00:39 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Feb 2022 13:00:39 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.74.250])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E06BE2201DC;
 Thu, 10 Feb 2022 14:00:38 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 37/42] target/ppc: powerpc_excp: Move common code to the caller
 function
Date: Thu, 10 Feb 2022 14:00:03 +0100
Message-Id: <20220210130008.2599950-38-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210130008.2599950-1-clg@kaod.org>
References: <20220210130008.2599950-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sqtbHWmP2cE0PT_PcelCf3hub91mvVR3
X-Proofpoint-GUID: sqtbHWmP2cE0PT_PcelCf3hub91mvVR3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_05,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 spamscore=0 suspectscore=0 adultscore=0 clxscore=1034 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=743 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202100068
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

Make the cpu-specific powerpc_excp_* functions a bit simpler by moving
the bounds check and logging to powerpc_excp.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220207183036.1507882-3-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 57 +++++++---------------------------------
 1 file changed, 9 insertions(+), 48 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a393730c7bd0..acdeeb405992 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -396,14 +396,6 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int ex=
cp)
     target_ulong msr, new_msr, vector;
     int srr0, srr1;
=20
-    if (excp <=3D POWERPC_EXCP_NONE || excp >=3D POWERPC_EXCP_NB) {
-        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
-    }
-
-    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
-                  " =3D> %s (%d) error=3D%02x\n", env->nip, powerpc_excp=
_name(excp),
-                  excp, env->error_code);
-
     /* new srr1 value excluding must-be-zero bits */
     msr =3D env->msr & ~0x783f0000ULL;
=20
@@ -554,14 +546,6 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int ex=
cp)
     CPUPPCState *env =3D &cpu->env;
     target_ulong msr, new_msr, vector;
=20
-    if (excp <=3D POWERPC_EXCP_NONE || excp >=3D POWERPC_EXCP_NB) {
-        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
-    }
-
-    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
-                  " =3D> %s (%d) error=3D%02x\n", env->nip, powerpc_excp=
_name(excp),
-                  excp, env->error_code);
-
     /* new srr1 value excluding must-be-zero bits */
     msr =3D env->msr & ~0x783f0000ULL;
=20
@@ -746,14 +730,6 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int ex=
cp)
     CPUPPCState *env =3D &cpu->env;
     target_ulong msr, new_msr, vector;
=20
-    if (excp <=3D POWERPC_EXCP_NONE || excp >=3D POWERPC_EXCP_NB) {
-        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
-    }
-
-    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
-                  " =3D> %s (%d) error=3D%02x\n", env->nip, powerpc_excp=
_name(excp),
-                  excp, env->error_code);
-
     /* new srr1 value excluding must-be-zero bits */
     msr =3D env->msr & ~0x783f0000ULL;
=20
@@ -948,14 +924,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int e=
xcp)
     CPUPPCState *env =3D &cpu->env;
     target_ulong msr, new_msr, vector;
=20
-    if (excp <=3D POWERPC_EXCP_NONE || excp >=3D POWERPC_EXCP_NB) {
-        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
-    }
-
-    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
-                  " =3D> %s (%d) error=3D%02x\n", env->nip, powerpc_excp=
_name(excp),
-                  excp, env->error_code);
-
     /* new srr1 value excluding must-be-zero bits */
     msr =3D env->msr & ~0x783f0000ULL;
=20
@@ -1143,14 +1111,6 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, in=
t excp)
     target_ulong msr, new_msr, vector;
     int srr0, srr1;
=20
-    if (excp <=3D POWERPC_EXCP_NONE || excp >=3D POWERPC_EXCP_NB) {
-        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
-    }
-
-    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
-                  " =3D> %s (%d) error=3D%02x\n", env->nip, powerpc_excp=
_name(excp),
-                  excp, env->error_code);
-
     msr =3D env->msr;
=20
     /*
@@ -1370,14 +1330,6 @@ static void powerpc_excp_books(PowerPCCPU *cpu, in=
t excp)
     target_ulong msr, new_msr, vector;
     int srr0, srr1, lev =3D -1;
=20
-    if (excp <=3D POWERPC_EXCP_NONE || excp >=3D POWERPC_EXCP_NB) {
-        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
-    }
-
-    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
-                  " =3D> %s (%d) error=3D%02x\n", env->nip, powerpc_excp=
_name(excp),
-                  excp, env->error_code);
-
     /* new srr1 value excluding must-be-zero bits */
     msr =3D env->msr & ~0x783f0000ULL;
=20
@@ -1664,8 +1616,17 @@ static inline void powerpc_excp_books(PowerPCCPU *=
cpu, int excp)
=20
 static void powerpc_excp(PowerPCCPU *cpu, int excp)
 {
+    CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
=20
+    if (excp <=3D POWERPC_EXCP_NONE || excp >=3D POWERPC_EXCP_NB) {
+        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
+    }
+
+    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
+                  " =3D> %s (%d) error=3D%02x\n", env->nip, powerpc_excp=
_name(excp),
+                  excp, env->error_code);
+
     switch (env->excp_model) {
     case POWERPC_EXCP_40x:
         powerpc_excp_40x(cpu, excp);
--=20
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0303A4B119E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 16:23:42 +0100 (CET)
Received: from localhost ([::1]:38148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIBIL-0004Se-3Q
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 10:23:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI95T-0002Kq-Ku; Thu, 10 Feb 2022 08:02:32 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI95E-0004O7-H7; Thu, 10 Feb 2022 08:02:05 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21ABvXsn022337; 
 Thu, 10 Feb 2022 13:00:57 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e529tsd7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:56 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21ACw6M7011561;
 Thu, 10 Feb 2022 13:00:42 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3e1gv9x2bt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21AD0VQl39125364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 13:00:32 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CD5C4C075;
 Thu, 10 Feb 2022 13:00:31 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 033274C071;
 Thu, 10 Feb 2022 13:00:31 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Feb 2022 13:00:30 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.74.250])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 3664F2201DC;
 Thu, 10 Feb 2022 14:00:30 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 25/42] target/ppc: 6xx: Set SRRs directly in exception code
Date: Thu, 10 Feb 2022 13:59:51 +0100
Message-Id: <20220210130008.2599950-26-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210130008.2599950-1-clg@kaod.org>
References: <20220210130008.2599950-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CokbPirvNw4A6ZmeAt0QHabki5tr4jzD
X-Proofpoint-ORIG-GUID: CokbPirvNw4A6ZmeAt0QHabki5tr4jzD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_05,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 mlxscore=0 bulkscore=0 mlxlogscore=457 clxscore=1034
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202100071
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The 6xx CPUs don't have alternate/hypervisor Save and Restore
Registers, so we can set SRR0 and SRR1 directly.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20220203200957.1434641-12-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 80168355bdfa..7bdda6f165aa 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -554,7 +554,6 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int exc=
p)
     CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
     target_ulong msr, new_msr, vector;
-    int srr0, srr1;
=20
     if (excp <=3D POWERPC_EXCP_NONE || excp >=3D POWERPC_EXCP_NB) {
         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
@@ -573,10 +572,6 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int ex=
cp)
      */
     new_msr =3D env->msr & ((target_ulong)1 << MSR_ME);
=20
-    /* target registers */
-    srr0 =3D SPR_SRR0;
-    srr1 =3D SPR_SRR1;
-
     /*
      * Hypervisor emulation assistance interrupt only exists on server
      * arch 2.05 server or later.
@@ -727,10 +722,6 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int ex=
cp)
             cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with =
"
                       "no HV support\n", excp);
         }
-        if (srr0 =3D=3D SPR_HSRR0) {
-            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with=
 "
-                      "no HV support\n", excp);
-        }
     }
=20
     /*
@@ -742,10 +733,10 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int e=
xcp)
     }
=20
     /* Save PC */
-    env->spr[srr0] =3D env->nip;
+    env->spr[SPR_SRR0] =3D env->nip;
=20
     /* Save MSR */
-    env->spr[srr1] =3D msr;
+    env->spr[SPR_SRR1] =3D msr;
=20
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
--=20
2.34.1



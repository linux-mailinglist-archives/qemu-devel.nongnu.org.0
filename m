Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEF94A45D0
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 12:49:15 +0100 (CET)
Received: from localhost ([::1]:52500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEVBK-00083D-Vm
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 06:49:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUZ2-0006BH-4u; Mon, 31 Jan 2022 06:09:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYy-000571-6n; Mon, 31 Jan 2022 06:09:39 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VA62Rk002447; 
 Mon, 31 Jan 2022 11:08:52 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx5a6s212-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:52 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VB2GvH004645;
 Mon, 31 Jan 2022 11:08:49 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3dvw78sut3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:49 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20VB8lV546858630
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 11:08:47 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E77552074;
 Mon, 31 Jan 2022 11:08:47 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id BF8A55206D;
 Mon, 31 Jan 2022 11:08:46 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.57.185])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id EC8E4220149;
 Mon, 31 Jan 2022 12:08:45 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 40/41] target/ppc: 74xx: Set SRRs directly in exception code
Date: Mon, 31 Jan 2022 12:08:10 +0100
Message-Id: <20220131110811.619053-41-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131110811.619053-1-clg@kaod.org>
References: <20220131110811.619053-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -lp0uYodAmG9JV3yPVqOBWr_Zb6CeOyY
X-Proofpoint-GUID: -lp0uYodAmG9JV3yPVqOBWr_Zb6CeOyY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=404 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1034 priorityscore=1501
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310074
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

The 74xx does not have alternate/hypervisor Save and Restore
Registers, so we can set SRR0 and SRR1 directly.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20220127201116.1154733-9-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index b7921c09562f..4e6bb87b70a3 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -556,7 +556,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int ex=
cp)
     CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
     target_ulong msr, new_msr, vector;
-    int srr0, srr1;
=20
     if (excp <=3D POWERPC_EXCP_NONE || excp >=3D POWERPC_EXCP_NB) {
         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
@@ -575,10 +574,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int e=
xcp)
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
@@ -731,10 +726,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int e=
xcp)
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
@@ -746,10 +737,10 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int =
excp)
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



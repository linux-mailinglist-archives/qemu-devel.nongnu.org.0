Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8BF4B122C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 16:57:57 +0100 (CET)
Received: from localhost ([::1]:43708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIBpT-0001DT-TF
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 10:57:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI95F-0002Hu-Sx; Thu, 10 Feb 2022 08:02:04 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI94l-0004NG-9y; Thu, 10 Feb 2022 08:02:01 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21ABvbN2022621; 
 Thu, 10 Feb 2022 13:00:58 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e529tsd8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:57 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21ACweY0020580;
 Thu, 10 Feb 2022 13:00:43 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3e1gva024g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:43 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21AD0e0v48497076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 13:00:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A24C4AE058;
 Thu, 10 Feb 2022 13:00:40 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68E6DAE051;
 Thu, 10 Feb 2022 13:00:40 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Feb 2022 13:00:40 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.74.250])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 9EE6822016C;
 Thu, 10 Feb 2022 14:00:39 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 38/42] target/ppc: Assert if MSR bits differ from msr_mask
 during exceptions
Date: Thu, 10 Feb 2022 14:00:04 +0100
Message-Id: <20220210130008.2599950-39-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210130008.2599950-1-clg@kaod.org>
References: <20220210130008.2599950-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TvLgmmxfWqqUX5HuyCFRvMZ3vYNuPQR8
X-Proofpoint-ORIG-GUID: TvLgmmxfWqqUX5HuyCFRvMZ3vYNuPQR8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_05,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 mlxscore=0 bulkscore=0 mlxlogscore=664 clxscore=1034
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

We currently abort QEMU during the dispatch of an interrupt if we try
to set MSR_HV without having MSR_HVB in the msr_mask. I think we
should verify this for all MSR bits. There is no reason to ever have a
MSR bit set if the corresponding bit is not set in that CPU's
msr_mask.

Note that this is not about the emulated code setting reserved
bits. We clear the new_msr when starting to dispatch an exception, so
if we end up with bits not present in the msr_mask that is a QEMU
programming error.

I kept the HSRR verification for BookS because it is the only CPU
family that has HSRRs.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20220207183036.1507882-4-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 64 ++++------------------------------------
 1 file changed, 6 insertions(+), 58 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index acdeeb405992..83be6698dfd4 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -364,6 +364,8 @@ static void powerpc_set_excp_state(PowerPCCPU *cpu,
     CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
=20
+    assert((msr & env->msr_mask) =3D=3D msr);
+
     /*
      * We don't use hreg_store_msr here as already have treated any
      * special case that could occur. Just store MSR and update hflags
@@ -372,7 +374,7 @@ static void powerpc_set_excp_state(PowerPCCPU *cpu,
      * will prevent setting of the HV bit which some exceptions might ne=
ed
      * to do.
      */
-    env->msr =3D msr & env->msr_mask;
+    env->msr =3D msr;
     hreg_compute_hflags(env);
     env->nip =3D vector;
     /* Reset exception state */
@@ -519,18 +521,6 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int ex=
cp)
         break;
     }
=20
-    /* Sanity check */
-    if (!(env->msr_mask & MSR_HVB)) {
-        if (new_msr & MSR_HVB) {
-            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with =
"
-                      "no HV support\n", excp);
-        }
-        if (srr0 =3D=3D SPR_HSRR0) {
-            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with=
 "
-                      "no HV support\n", excp);
-        }
-    }
-
     /* Save PC */
     env->spr[srr0] =3D env->nip;
=20
@@ -699,14 +689,6 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int ex=
cp)
         break;
     }
=20
-    /* Sanity check */
-    if (!(env->msr_mask & MSR_HVB)) {
-        if (new_msr & MSR_HVB) {
-            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with =
"
-                      "no HV support\n", excp);
-        }
-    }
-
     /*
      * Sort out endianness of interrupt, this differs depending on the
      * CPU, the HV mode, etc...
@@ -893,14 +875,6 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int ex=
cp)
         break;
     }
=20
-    /* Sanity check */
-    if (!(env->msr_mask & MSR_HVB)) {
-        if (new_msr & MSR_HVB) {
-            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with =
"
-                      "no HV support\n", excp);
-        }
-    }
-
     /*
      * Sort out endianness of interrupt, this differs depending on the
      * CPU, the HV mode, etc...
@@ -1079,14 +1053,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int=
 excp)
         break;
     }
=20
-    /* Sanity check */
-    if (!(env->msr_mask & MSR_HVB)) {
-        if (new_msr & MSR_HVB) {
-            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with =
"
-                      "no HV support\n", excp);
-        }
-    }
-
     /*
      * Sort out endianness of interrupt, this differs depending on the
      * CPU, the HV mode, etc...
@@ -1291,18 +1257,6 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, in=
t excp)
         break;
     }
=20
-    /* Sanity check */
-    if (!(env->msr_mask & MSR_HVB)) {
-        if (new_msr & MSR_HVB) {
-            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with =
"
-                      "no HV support\n", excp);
-        }
-        if (srr0 =3D=3D SPR_HSRR0) {
-            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with=
 "
-                      "no HV support\n", excp);
-        }
-    }
-
 #if defined(TARGET_PPC64)
     if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
         /* Cat.64-bit: EPCR.ICM is copied to MSR.CM */
@@ -1573,15 +1527,9 @@ static void powerpc_excp_books(PowerPCCPU *cpu, in=
t excp)
     }
=20
     /* Sanity check */
-    if (!(env->msr_mask & MSR_HVB)) {
-        if (new_msr & MSR_HVB) {
-            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with =
"
-                      "no HV support\n", excp);
-        }
-        if (srr0 =3D=3D SPR_HSRR0) {
-            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with=
 "
-                      "no HV support\n", excp);
-        }
+    if (!(env->msr_mask & MSR_HVB) && srr0 =3D=3D SPR_HSRR0) {
+        cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
+                  "no HV support\n", excp);
     }
=20
     /*
--=20
2.34.1



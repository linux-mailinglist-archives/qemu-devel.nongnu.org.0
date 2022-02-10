Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6364B11B6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 16:32:40 +0100 (CET)
Received: from localhost ([::1]:54650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIBR1-0007uE-MP
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 10:32:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI94D-00025L-3o; Thu, 10 Feb 2022 08:01:00 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI949-0004K1-B3; Thu, 10 Feb 2022 08:00:55 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21ABDRI3020562; 
 Thu, 10 Feb 2022 13:00:48 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e4vmchfv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:47 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21ACvkTa022911;
 Thu, 10 Feb 2022 13:00:38 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3e1gv9x3yu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:38 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21ACoMS025297200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 12:50:22 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3E4EA407B;
 Thu, 10 Feb 2022 13:00:31 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF43FA4089;
 Thu, 10 Feb 2022 13:00:31 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Feb 2022 13:00:31 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.74.250])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E634122016C;
 Thu, 10 Feb 2022 14:00:30 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 26/42] target/ppc: Merge 7x5 and 7x0 exception model IDs
Date: Thu, 10 Feb 2022 13:59:52 +0100
Message-Id: <20220210130008.2599950-27-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210130008.2599950-1-clg@kaod.org>
References: <20220210130008.2599950-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MdQKIzQtINkKHsLY3rckBYU35-M6GpPV
X-Proofpoint-ORIG-GUID: MdQKIzQtINkKHsLY3rckBYU35-M6GpPV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_05,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1034 spamscore=0
 mlxlogscore=932 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Since we've split the exception code by exception model, the exception
model IDs are becoming less useful. These two can be merged.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20220204173430.1457358-2-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu-qom.h     |  6 ++----
 target/ppc/cpu_init.c    | 16 ++++++++--------
 target/ppc/excp_helper.c |  2 +-
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 3880fb33376d..98facee9fa9a 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -90,10 +90,8 @@ enum powerpc_excp_t {
     POWERPC_EXCP_40x,
     /* PowerPC 603/604/G2 exception model */
     POWERPC_EXCP_6xx,
-    /* PowerPC 7x0 exception model      */
-    POWERPC_EXCP_7x0,
-    /* PowerPC 7x5 exception model      */
-    POWERPC_EXCP_7x5,
+    /* PowerPC 7xx exception model      */
+    POWERPC_EXCP_7xx,
     /* PowerPC 74xx exception model     */
     POWERPC_EXCP_74xx,
     /* BookE exception model            */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 95c5831ba651..d97f7183549f 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -4021,7 +4021,7 @@ POWERPC_FAMILY(740)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model =3D POWERPC_MMU_32B;
-    pcc->excp_model =3D POWERPC_EXCP_7x0;
+    pcc->excp_model =3D POWERPC_EXCP_7xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_750;
     pcc->flags =3D POWERPC_FLAG_SE | POWERPC_FLAG_BE |
@@ -4098,7 +4098,7 @@ POWERPC_FAMILY(750)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model =3D POWERPC_MMU_32B;
-    pcc->excp_model =3D POWERPC_EXCP_7x0;
+    pcc->excp_model =3D POWERPC_EXCP_7xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_750;
     pcc->flags =3D POWERPC_FLAG_SE | POWERPC_FLAG_BE |
@@ -4298,7 +4298,7 @@ POWERPC_FAMILY(750cl)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model =3D POWERPC_MMU_32B;
-    pcc->excp_model =3D POWERPC_EXCP_7x0;
+    pcc->excp_model =3D POWERPC_EXCP_7xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_750;
     pcc->flags =3D POWERPC_FLAG_SE | POWERPC_FLAG_BE |
@@ -4378,7 +4378,7 @@ POWERPC_FAMILY(750cx)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model =3D POWERPC_MMU_32B;
-    pcc->excp_model =3D POWERPC_EXCP_7x0;
+    pcc->excp_model =3D POWERPC_EXCP_7xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_750;
     pcc->flags =3D POWERPC_FLAG_SE | POWERPC_FLAG_BE |
@@ -4463,7 +4463,7 @@ POWERPC_FAMILY(750fx)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model =3D POWERPC_MMU_32B;
-    pcc->excp_model =3D POWERPC_EXCP_7x0;
+    pcc->excp_model =3D POWERPC_EXCP_7xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_750;
     pcc->flags =3D POWERPC_FLAG_SE | POWERPC_FLAG_BE |
@@ -4548,7 +4548,7 @@ POWERPC_FAMILY(750gx)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model =3D POWERPC_MMU_32B;
-    pcc->excp_model =3D POWERPC_EXCP_7x0;
+    pcc->excp_model =3D POWERPC_EXCP_7xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_750;
     pcc->flags =3D POWERPC_FLAG_SE | POWERPC_FLAG_BE |
@@ -4624,7 +4624,7 @@ POWERPC_FAMILY(745)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model =3D POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model =3D POWERPC_EXCP_7x5;
+    pcc->excp_model =3D POWERPC_EXCP_7xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_750;
     pcc->flags =3D POWERPC_FLAG_SE | POWERPC_FLAG_BE |
@@ -4711,7 +4711,7 @@ POWERPC_FAMILY(755)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model =3D POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model =3D POWERPC_EXCP_7x5;
+    pcc->excp_model =3D POWERPC_EXCP_7xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_750;
     pcc->flags =3D POWERPC_FLAG_SE | POWERPC_FLAG_BE |
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 7bdda6f165aa..b6a5c36fd281 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1844,7 +1844,7 @@ static inline void powerpc_excp_legacy(PowerPCCPU *=
cpu, int excp)
                 hreg_swap_gpr_tgpr(env);
             }
             /* fall through */
-        case POWERPC_EXCP_7x5:
+        case POWERPC_EXCP_7xx:
             ppc_excp_debug_sw_tlb(env, excp);
=20
             msr |=3D env->crf[0] << 28;
--=20
2.34.1



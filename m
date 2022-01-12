Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2768A48C4DD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 14:32:48 +0100 (CET)
Received: from localhost ([::1]:53446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7dk7-00080R-3j
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 08:32:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFv-0008Pn-De; Wed, 12 Jan 2022 06:57:31 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFq-0007mD-B2; Wed, 12 Jan 2022 06:57:31 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CBPUm1018361; 
 Wed, 12 Jan 2022 11:57:13 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dht5pf40e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:57:13 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBnG53025522;
 Wed, 12 Jan 2022 11:56:11 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3df1vjas0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:11 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CBu8As30147054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:56:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32560A4E81;
 Wed, 12 Jan 2022 11:56:08 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3A97A4E7E;
 Wed, 12 Jan 2022 11:56:07 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 12 Jan 2022 11:56:07 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2656022016C;
 Wed, 12 Jan 2022 12:56:07 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 08/34] target/ppc: powerpc_excp: Extract software TLB logging
 into a function
Date: Wed, 12 Jan 2022 12:55:25 +0100
Message-Id: <20220112115551.987666-9-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: azl-MFTKDuMi0_N5yVKa-_r-fpFZSHRg
X-Proofpoint-ORIG-GUID: azl-MFTKDuMi0_N5yVKa-_r-fpFZSHRg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=726 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1034 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120075
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107222601.4101511-2-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 65 +++++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 28 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a779dc936a55..2c5d5470de59 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -135,6 +135,41 @@ static void dump_hcall(CPUPPCState *env)
                   env->nip);
 }
=20
+static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
+{
+#if defined(DEBUG_SOFTWARE_TLB)
+    const char *es;
+    target_ulong *miss, *cmp;
+    int en;
+
+    if (!qemu_log_enabled()) {
+        return;
+    }
+
+    if (excp =3D=3D POWERPC_EXCP_IFTLB) {
+        es =3D "I";
+        en =3D 'I';
+        miss =3D &env->spr[SPR_IMISS];
+        cmp =3D &env->spr[SPR_ICMP];
+    } else {
+        if (excp =3D=3D POWERPC_EXCP_DLTLB) {
+            es =3D "DL";
+        } else {
+            es =3D "DS";
+        }
+        en =3D 'D';
+        miss =3D &env->spr[SPR_DMISS];
+        cmp =3D &env->spr[SPR_DCMP];
+    }
+    qemu_log("6xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
+             TARGET_FMT_lx " H1 " TARGET_FMT_lx " H2 "
+             TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
+             env->spr[SPR_HASH1], env->spr[SPR_HASH2],
+             env->error_code);
+#endif
+}
+
+
 static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp=
,
                                 target_ulong *msr)
 {
@@ -777,34 +812,8 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
             }
             /* fall through */
         case POWERPC_EXCP_7x5:
-#if defined(DEBUG_SOFTWARE_TLB)
-            if (qemu_log_enabled()) {
-                const char *es;
-                target_ulong *miss, *cmp;
-                int en;
-
-                if (excp =3D=3D POWERPC_EXCP_IFTLB) {
-                    es =3D "I";
-                    en =3D 'I';
-                    miss =3D &env->spr[SPR_IMISS];
-                    cmp =3D &env->spr[SPR_ICMP];
-                } else {
-                    if (excp =3D=3D POWERPC_EXCP_DLTLB) {
-                        es =3D "DL";
-                    } else {
-                        es =3D "DS";
-                    }
-                    en =3D 'D';
-                    miss =3D &env->spr[SPR_DMISS];
-                    cmp =3D &env->spr[SPR_DCMP];
-                }
-                qemu_log("6xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
-                         TARGET_FMT_lx " H1 " TARGET_FMT_lx " H2 "
-                         TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cm=
p,
-                         env->spr[SPR_HASH1], env->spr[SPR_HASH2],
-                         env->error_code);
-            }
-#endif
+            ppc_excp_debug_sw_tlb(env, excp);
+
             msr |=3D env->crf[0] << 28;
             msr |=3D env->error_code; /* key, D/I, S/L bits */
             /* Set way using a LRU mechanism */
--=20
2.31.1



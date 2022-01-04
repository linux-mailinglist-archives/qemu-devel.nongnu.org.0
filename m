Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F82483D5C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:01:15 +0100 (CET)
Received: from localhost ([::1]:44218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ekt-0006WH-2S
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:01:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIR-0005pz-3B; Tue, 04 Jan 2022 02:31:58 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIO-0008Hs-3U; Tue, 04 Jan 2022 02:31:50 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2043heUY018687; 
 Tue, 4 Jan 2022 07:31:41 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcek8u0gd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:40 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2047O7V4013225;
 Tue, 4 Jan 2022 07:31:38 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3daek969u1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:38 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2047VaBd38928758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jan 2022 07:31:36 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9C83A4065;
 Tue,  4 Jan 2022 07:31:35 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 953E2A405D;
 Tue,  4 Jan 2022 07:31:35 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  4 Jan 2022 07:31:35 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.19])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id CB979220144;
 Tue,  4 Jan 2022 08:31:34 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 18/26] target/ppc: powerpc_excp: Set alternate SRRs directly
Date: Tue,  4 Jan 2022 08:31:13 +0100
Message-Id: <20220104073121.3784280-19-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220104073121.3784280-1-clg@kaod.org>
References: <20220104073121.3784280-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wyGB9aeGzzTNEYROi8Tvf1ZaCNO5sW_f
X-Proofpoint-ORIG-GUID: wyGB9aeGzzTNEYROi8Tvf1ZaCNO5sW_f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_04,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 spamscore=0 mlxlogscore=524 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1034 adultscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040047
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

There are currently only two interrupts that use alternate SRRs, so
let them write to them directly during the setup code.

No functional change intended.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20211229165751.3774248-2-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index e3380722c5c4..c7efbdc3051b 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -370,7 +370,7 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp_mo=
del, int excp)
     CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
     target_ulong msr, new_msr, vector;
-    int srr0, srr1, asrr0, asrr1, lev =3D -1;
+    int srr0, srr1, lev =3D -1;
=20
     qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
                   " =3D> %s (%d) error=3D%02x\n", env->nip, powerpc_excp=
_name(excp),
@@ -392,8 +392,6 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp_mo=
del, int excp)
     /* target registers */
     srr0 =3D SPR_SRR0;
     srr1 =3D SPR_SRR1;
-    asrr0 =3D -1;
-    asrr1 =3D -1;
=20
     /*
      * check for special resume at 0x100 from doze/nap/sleep/winkle on
@@ -483,8 +481,9 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp_mo=
del, int excp)
             /* FIXME: choose one or the other based on CPU type */
             srr0 =3D SPR_BOOKE_MCSRR0;
             srr1 =3D SPR_BOOKE_MCSRR1;
-            asrr0 =3D SPR_BOOKE_CSRR0;
-            asrr1 =3D SPR_BOOKE_CSRR1;
+
+            env->spr[SPR_BOOKE_CSRR0] =3D env->nip;
+            env->spr[SPR_BOOKE_CSRR1] =3D msr;
             break;
         default:
             break;
@@ -643,8 +642,10 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp_m=
odel, int excp)
             /* FIXME: choose one or the other based on CPU type */
             srr0 =3D SPR_BOOKE_DSRR0;
             srr1 =3D SPR_BOOKE_DSRR1;
-            asrr0 =3D SPR_BOOKE_CSRR0;
-            asrr1 =3D SPR_BOOKE_CSRR1;
+
+            env->spr[SPR_BOOKE_CSRR0] =3D env->nip;
+            env->spr[SPR_BOOKE_CSRR1] =3D msr;
+
             /* DBSR already modified by caller */
         } else {
             cpu_abort(cs, "Debug exception triggered on unsupported mode=
l\n");
@@ -911,14 +912,6 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp_m=
odel, int excp)
=20
     vector |=3D env->excp_prefix;
=20
-    /* If any alternate SRR register are defined, duplicate saved values=
 */
-    if (asrr0 !=3D -1) {
-        env->spr[asrr0] =3D env->nip;
-    }
-    if (asrr1 !=3D -1) {
-        env->spr[asrr1] =3D msr;
-    }
-
 #if defined(TARGET_PPC64)
     if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
         if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
--=20
2.31.1



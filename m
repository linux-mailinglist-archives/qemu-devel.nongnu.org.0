Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55364A486D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 14:38:37 +0100 (CET)
Received: from localhost ([::1]:33158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEWt9-0001Qa-Do
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 08:38:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUZ9-0006Fh-NK; Mon, 31 Jan 2022 06:09:50 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUZ8-00054u-0w; Mon, 31 Jan 2022 06:09:47 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VA5xOD002068; 
 Mon, 31 Jan 2022 11:08:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx5a6s1rx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:23 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20VAPYxV024444;
 Mon, 31 Jan 2022 11:08:23 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx5a6s1qv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:23 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VB2Hdj024749;
 Mon, 31 Jan 2022 11:08:19 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 3dvvuhsygh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:19 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20VAwUgm40829408
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 10:58:31 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E8F2A4040;
 Mon, 31 Jan 2022 11:08:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC580A404D;
 Mon, 31 Jan 2022 11:08:16 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 31 Jan 2022 11:08:16 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.57.185])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 965FC2201C1;
 Mon, 31 Jan 2022 12:08:15 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 03/41] target/ppc/mmu_common: Fix SRR1/MSR error code on Book-E
Date: Mon, 31 Jan 2022 12:07:33 +0100
Message-Id: <20220131110811.619053-4-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131110811.619053-1-clg@kaod.org>
References: <20220131110811.619053-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0MC8vO3WyGVq73AjNdp_pneZ_L2dTfPC
X-Proofpoint-GUID: NZcBrZ1WAMQYMmejCJHqko8AVfBLuc_G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=704 spamscore=0
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
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-stable@nongnu.org, Vitaly Cheptsov <cheptsov@ispras.ru>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Cheptsov <cheptsov@ispras.ru>

Book-E architecture does not set the error code in 31:27 bits
of SRR1, but instead uses these bits for custom fields such
as GS (Guest Supervisor).

Wrongly setting these fields will result in QEMU crashes
when attempting to execute not executable code due to the attempts
to use Guest Supervisor mode.

Cc: "C=C3=A9dric Le Goater" <clg@kaod.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220121093107.15478-1-cheptsov@ispras.ru>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/mmu_common.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 91270c1f17eb..6512ee031cfc 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -1367,22 +1367,34 @@ static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vadd=
r eaddr,
             case -2:
                 /* Access rights violation */
                 cs->exception_index =3D POWERPC_EXCP_ISI;
-                env->error_code =3D 0x08000000;
+                if ((env->mmu_model =3D=3D POWERPC_MMU_BOOKE) ||
+                    (env->mmu_model =3D=3D POWERPC_MMU_BOOKE206)) {
+                    env->error_code =3D 0;
+                } else {
+                    env->error_code =3D 0x08000000;
+                }
                 break;
             case -3:
                 /* No execute protection violation */
                 if ((env->mmu_model =3D=3D POWERPC_MMU_BOOKE) ||
                     (env->mmu_model =3D=3D POWERPC_MMU_BOOKE206)) {
                     env->spr[SPR_BOOKE_ESR] =3D 0x00000000;
+                    env->error_code =3D 0;
+                } else {
+                    env->error_code =3D 0x10000000;
                 }
                 cs->exception_index =3D POWERPC_EXCP_ISI;
-                env->error_code =3D 0x10000000;
                 break;
             case -4:
                 /* Direct store exception */
                 /* No code fetch is allowed in direct-store areas */
                 cs->exception_index =3D POWERPC_EXCP_ISI;
-                env->error_code =3D 0x10000000;
+                if ((env->mmu_model =3D=3D POWERPC_MMU_BOOKE) ||
+                    (env->mmu_model =3D=3D POWERPC_MMU_BOOKE206)) {
+                    env->error_code =3D 0;
+                } else {
+                    env->error_code =3D 0x10000000;
+                }
                 break;
             }
         } else {
--=20
2.34.1



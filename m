Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCA7483D42
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 08:53:41 +0100 (CET)
Received: from localhost ([::1]:53470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4edY-00024T-HS
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 02:53:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIS-0005q4-Dw; Tue, 04 Jan 2022 02:32:01 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIP-0008IG-2q; Tue, 04 Jan 2022 02:31:52 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2044mSoq007853; 
 Tue, 4 Jan 2022 07:31:39 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcfhn27j2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:39 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2047O5Mn030603;
 Tue, 4 Jan 2022 07:31:37 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3daek9f613-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:36 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2047VYKJ45941014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jan 2022 07:31:34 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64B7EA406B;
 Tue,  4 Jan 2022 07:31:34 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33464A4051;
 Tue,  4 Jan 2022 07:31:34 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  4 Jan 2022 07:31:34 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.19])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 783A4220144;
 Tue,  4 Jan 2022 08:31:33 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 16/26] ppc/ppc405: Dump specific registers
Date: Tue,  4 Jan 2022 08:31:11 +0100
Message-Id: <20220104073121.3784280-17-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220104073121.3784280-1-clg@kaod.org>
References: <20220104073121.3784280-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8ihxtSx28z-bDLsWtvbz8OsvLQLdwN1X
X-Proofpoint-ORIG-GUID: 8ihxtSx28z-bDLsWtvbz8OsvLQLdwN1X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_04,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 mlxlogscore=813 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1034 mlxscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040049
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rework slightly ppc_cpu_dump_state() to replace the various 'if'
statements with a 'switch'.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211222064025.1541490-9-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220103063441.3424853-10-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu_init.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 9ef9a1a5ddd5..25970bd79f20 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -8648,16 +8648,17 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, in=
t flags)
                  env->spr[SPR_SPRG4], env->spr[SPR_SPRG5],
                  env->spr[SPR_SPRG6], env->spr[SPR_SPRG7]);
=20
+    switch (env->excp_model) {
 #if defined(TARGET_PPC64)
-    if (env->excp_model =3D=3D POWERPC_EXCP_POWER7 ||
-        env->excp_model =3D=3D POWERPC_EXCP_POWER8 ||
-        env->excp_model =3D=3D POWERPC_EXCP_POWER9 ||
-        env->excp_model =3D=3D POWERPC_EXCP_POWER10)  {
+    case POWERPC_EXCP_POWER7:
+    case POWERPC_EXCP_POWER8:
+    case POWERPC_EXCP_POWER9:
+    case POWERPC_EXCP_POWER10:
         qemu_fprintf(f, "HSRR0 " TARGET_FMT_lx " HSRR1 " TARGET_FMT_lx "=
\n",
                      env->spr[SPR_HSRR0], env->spr[SPR_HSRR1]);
-    }
+        break;
 #endif
-    if (env->excp_model =3D=3D POWERPC_EXCP_BOOKE) {
+    case POWERPC_EXCP_BOOKE:
         qemu_fprintf(f, "CSRR0 " TARGET_FMT_lx " CSRR1 " TARGET_FMT_lx
                      " MCSRR0 " TARGET_FMT_lx " MCSRR1 " TARGET_FMT_lx "=
\n",
                      env->spr[SPR_BOOKE_CSRR0], env->spr[SPR_BOOKE_CSRR1=
],
@@ -8688,6 +8689,20 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int=
 flags)
          * IVORs are left out as they are large and do not change often =
--
          * they can be read with "p $ivor0", "p $ivor1", etc.
          */
+        break;
+    case POWERPC_EXCP_40x:
+        qemu_fprintf(f, "  TCR " TARGET_FMT_lx "   TSR " TARGET_FMT_lx
+                     "    ESR " TARGET_FMT_lx "   DEAR " TARGET_FMT_lx "=
\n",
+                     env->spr[SPR_40x_TCR], env->spr[SPR_40x_TSR],
+                     env->spr[SPR_40x_ESR], env->spr[SPR_40x_DEAR]);
+
+        qemu_fprintf(f, " EVPR " TARGET_FMT_lx "  SRR2 " TARGET_FMT_lx
+                     "   SRR3 " TARGET_FMT_lx  "   PID " TARGET_FMT_lx "=
\n",
+                     env->spr[SPR_40x_EVPR], env->spr[SPR_40x_SRR2],
+                     env->spr[SPR_40x_SRR3], env->spr[SPR_40x_PID]);
+        break;
+    default:
+        break;
     }
=20
 #if defined(TARGET_PPC64)
--=20
2.31.1



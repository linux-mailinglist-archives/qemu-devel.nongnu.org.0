Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A48A4BB742
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 11:50:39 +0100 (CET)
Received: from localhost ([::1]:51916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL0qU-0006iR-KY
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 05:50:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fq-0001CF-PZ; Fri, 18 Feb 2022 05:39:38 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fg-0005hG-QE; Fri, 18 Feb 2022 05:39:34 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I9pInb039441; 
 Fri, 18 Feb 2022 10:38:48 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea96n8xjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:48 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IAc5jb006283;
 Fri, 18 Feb 2022 10:38:47 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3e64has9nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:46 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21IAcimx40173944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 10:38:44 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9A54A405B;
 Fri, 18 Feb 2022 10:38:44 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F335A4051;
 Fri, 18 Feb 2022 10:38:44 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 10:38:44 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A1C1D220294;
 Fri, 18 Feb 2022 11:38:43 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 21/39] target/ppc: cpu_init: Decouple 74xx SPR registration
 from 7xx
Date: Fri, 18 Feb 2022 11:38:09 +0100
Message-Id: <20220218103827.682032-22-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218103827.682032-1-clg@kaod.org>
References: <20220218103827.682032-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: V1kU927FQdh2--G96PvkayY0VEeDNqVm
X-Proofpoint-GUID: V1kU927FQdh2--G96PvkayY0VEeDNqVm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_04,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=807 clxscore=1034 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202180067
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

We're considering these two to be from different CPU families, so
duplicate some code to keep them separate.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20220216162426.1885923-10-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu_init.c | 107 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 91 insertions(+), 16 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 36d6377a51d2..5ca0d78dd42f 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -803,6 +803,97 @@ static void register_G2_sprs(CPUPPCState *env)
=20
 static void register_74xx_sprs(CPUPPCState *env)
 {
+    /* Breakpoints */
+    spr_register_kvm(env, SPR_DABR, "DABR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_DABR, 0x00000000);
+
+    spr_register(env, SPR_IABR, "IABR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Cache management */
+    spr_register(env, SPR_ICTC, "ICTC",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Performance monitors */
+    spr_register(env, SPR_7XX_MMCR0, "MMCR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_MMCR1, "MMCR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_PMC1, "PMC1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_PMC2, "PMC2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_PMC3, "PMC3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_PMC4, "PMC4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_SIAR, "SIAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UMMCR0, "UMMCR0",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UMMCR1, "UMMCR1",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC1, "UPMC1",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC2, "UPMC2",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC3, "UPMC3",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC4, "UPMC4",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_USIAR, "USIAR",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* External access control */
+    spr_register(env, SPR_EAR, "EAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
     /* Processor identification */
     spr_register(env, SPR_PIR, "PIR",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -4640,8 +4731,6 @@ static void init_proc_7400(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-    /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
=20
@@ -4714,8 +4803,6 @@ static void init_proc_7410(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-    /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
=20
@@ -4795,8 +4882,6 @@ static void init_proc_7440(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-    /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
=20
@@ -4897,8 +4982,6 @@ static void init_proc_7450(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-    /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
     /* Level 3 cache control */
@@ -5021,8 +5104,6 @@ static void init_proc_7445(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-    /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
     /* LDSTCR */
@@ -5152,8 +5233,6 @@ static void init_proc_7455(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-    /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
     /* Level 3 cache control */
@@ -5285,8 +5364,6 @@ static void init_proc_7457(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-    /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
     /* Level 3 cache control */
@@ -5438,8 +5515,6 @@ static void init_proc_e600(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-    /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
=20
--=20
2.34.1



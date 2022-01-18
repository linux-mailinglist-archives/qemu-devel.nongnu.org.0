Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A2D492828
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:17:59 +0100 (CET)
Received: from localhost ([::1]:57554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pJ7-00081l-1n
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:17:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDE-0003cZ-Cz; Tue, 18 Jan 2022 08:07:48 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56694
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDB-0000CY-U0; Tue, 18 Jan 2022 08:07:48 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20ICYfwC026288; 
 Tue, 18 Jan 2022 13:07:43 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dngcqhb2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:43 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ID7eZv008329;
 Tue, 18 Jan 2022 13:07:41 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3dknw94h7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:41 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20ID7dUC43975004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:07:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4AB9A4040;
 Tue, 18 Jan 2022 13:07:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1090A4051;
 Tue, 18 Jan 2022 13:07:38 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jan 2022 13:07:38 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E847E2201EB;
 Tue, 18 Jan 2022 14:07:37 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 09/31] target/ppc: Fix 7448 support
Date: Tue, 18 Jan 2022 14:07:08 +0100
Message-Id: <20220118130730.1927983-10-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118130730.1927983-1-clg@kaod.org>
References: <20220118130730.1927983-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ETEoMKWa7X322iMLVFp0SaJLnwj_oV-y
X-Proofpoint-ORIG-GUID: ETEoMKWa7X322iMLVFp0SaJLnwj_oV-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_03,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxlogscore=626 malwarescore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1034 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180081
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.322,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 7448 CPU is an evolution of the PowerPC 7447A and the last of the
G4 family. Change its family to reflect correctly its features. This
fixes Linux boot.

Cc: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220117092555.1616512-1-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu-models.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
index 96fec9c2e501..764afe5a2afb 100644
--- a/target/ppc/cpu-models.c
+++ b/target/ppc/cpu-models.c
@@ -636,13 +636,13 @@
                 "PowerPC 7410 v1.3 (G4)")
     POWERPC_DEF("7410_v1.4",     CPU_POWERPC_7410_v14,               741=
0,
                 "PowerPC 7410 v1.4 (G4)")
-    POWERPC_DEF("7448_v1.0",     CPU_POWERPC_7448_v10,               740=
0,
+    POWERPC_DEF("7448_v1.0",     CPU_POWERPC_7448_v10,               744=
5,
                 "PowerPC 7448 v1.0 (G4)")
-    POWERPC_DEF("7448_v1.1",     CPU_POWERPC_7448_v11,               740=
0,
+    POWERPC_DEF("7448_v1.1",     CPU_POWERPC_7448_v11,               744=
5,
                 "PowerPC 7448 v1.1 (G4)")
-    POWERPC_DEF("7448_v2.0",     CPU_POWERPC_7448_v20,               740=
0,
+    POWERPC_DEF("7448_v2.0",     CPU_POWERPC_7448_v20,               744=
5,
                 "PowerPC 7448 v2.0 (G4)")
-    POWERPC_DEF("7448_v2.1",     CPU_POWERPC_7448_v21,               740=
0,
+    POWERPC_DEF("7448_v2.1",     CPU_POWERPC_7448_v21,               744=
5,
                 "PowerPC 7448 v2.1 (G4)")
     POWERPC_DEF("7450_v1.0",     CPU_POWERPC_7450_v10,               745=
0,
                 "PowerPC 7450 v1.0 (G4)")
--=20
2.31.1



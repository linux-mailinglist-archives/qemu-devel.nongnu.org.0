Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CC14904D5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 10:28:56 +0100 (CET)
Received: from localhost ([::1]:45272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9OJr-0003Zt-2s
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 04:28:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9OHE-0002M9-La; Mon, 17 Jan 2022 04:26:12 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:16344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9OHC-0004ld-UB; Mon, 17 Jan 2022 04:26:12 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20H8SSrH003829; 
 Mon, 17 Jan 2022 09:26:02 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn4ysh0nn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 09:26:02 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20H9J1xv011947;
 Mon, 17 Jan 2022 09:26:00 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 3dknw8hed8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 09:25:59 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20H9PvSA36962636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 09:25:57 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 803FAA4069;
 Mon, 17 Jan 2022 09:25:57 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D68BA405F;
 Mon, 17 Jan 2022 09:25:57 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 17 Jan 2022 09:25:57 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 50C182200E5;
 Mon, 17 Jan 2022 10:25:56 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: Fix 7748 support
Date: Mon, 17 Jan 2022 10:25:55 +0100
Message-Id: <20220117092555.1616512-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LRQ2x-tvdDZIU-4WZ0rsFvoN9ZO-laXo
X-Proofpoint-ORIG-GUID: LRQ2x-tvdDZIU-4WZ0rsFvoN9ZO-laXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_03,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 mlxlogscore=567 clxscore=1034 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201170058
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 7448 CPU is an evolution of the PowerPC 7447A and the last of the
G4 family. Change its family to reflect correctly its features. This
fixes Linux boot.

Cc: Fabiano Rosas <farosas@linux.ibm.com>
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



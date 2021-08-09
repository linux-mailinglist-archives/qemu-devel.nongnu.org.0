Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE4B3E46EF
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:52:27 +0200 (CEST)
Received: from localhost ([::1]:42344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5hZ-0002TH-KG
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bU-0000Hx-L9; Mon, 09 Aug 2021 09:46:08 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bQ-0000uY-Ij; Mon, 09 Aug 2021 09:46:08 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179DXTYG097707; Mon, 9 Aug 2021 09:45:55 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aam0m4y8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:45:55 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179DhA9j024985;
 Mon, 9 Aug 2021 13:45:53 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3a9hehc32u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:45:52 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 179DjoGk50725356
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:45:50 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80365A404D;
 Mon,  9 Aug 2021 13:45:50 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30814A4065;
 Mon,  9 Aug 2021 13:45:50 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 13:45:50 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6935B22016C;
 Mon,  9 Aug 2021 15:45:49 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 01/26] ppc: Add a POWER10 DD2 CPU
Date: Mon,  9 Aug 2021 15:45:22 +0200
Message-Id: <20210809134547.689560-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809134547.689560-1-clg@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZXAWRpmEtK92y5X83L0cCLMxKVnCAeW8
X-Proofpoint-ORIG-GUID: ZXAWRpmEtK92y5X83L0cCLMxKVnCAeW8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 clxscore=1034 mlxscore=0 bulkscore=0 adultscore=0
 malwarescore=0 mlxlogscore=958 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090101
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The POWER10 DD2 CPU adds an extra LPCR[HAIL] bit. DD1 doesn't have
HAIL but since it does not break the modeling and that we don't plan
to support DD1, modify the LPCR mask of all the POWER10 family.

Setting the HAIL bit is a requirement to support the scv instruction
on PowerNV POWER10 platforms since glibc-2.33.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu-models.h | 1 +
 target/ppc/cpu-models.c | 4 +++-
 target/ppc/cpu_init.c   | 3 +++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-models.h
index fc5e21728d7e..095259275941 100644
--- a/target/ppc/cpu-models.h
+++ b/target/ppc/cpu-models.h
@@ -375,6 +375,7 @@ enum {
     CPU_POWERPC_POWER9_DD20        =3D 0x004E1200,
     CPU_POWERPC_POWER10_BASE       =3D 0x00800000,
     CPU_POWERPC_POWER10_DD1        =3D 0x00800100,
+    CPU_POWERPC_POWER10_DD20       =3D 0x00800200,
     CPU_POWERPC_970_v22            =3D 0x00390202,
     CPU_POWERPC_970FX_v10          =3D 0x00391100,
     CPU_POWERPC_970FX_v20          =3D 0x003C0200,
diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
index 87e4228614b0..4baa111713b0 100644
--- a/target/ppc/cpu-models.c
+++ b/target/ppc/cpu-models.c
@@ -776,6 +776,8 @@
                 "POWER9 v2.0")
     POWERPC_DEF("power10_v1.0",  CPU_POWERPC_POWER10_DD1,            POW=
ER10,
                 "POWER10 v1.0")
+    POWERPC_DEF("power10_v2.0",  CPU_POWERPC_POWER10_DD20,           POW=
ER10,
+                "POWER10 v2.0")
 #endif /* defined (TARGET_PPC64) */
=20
 /***********************************************************************=
****/
@@ -952,7 +954,7 @@ PowerPCCPUAlias ppc_cpu_aliases[] =3D {
     { "power8", "power8_v2.0" },
     { "power8nvl", "power8nvl_v1.0" },
     { "power9", "power9_v2.0" },
-    { "power10", "power10_v1.0" },
+    { "power10", "power10_v2.0" },
 #endif
=20
     /* Generic PowerPCs */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 505a0ed6ac09..66deb18a6b65 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -8270,6 +8270,9 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data=
)
                              LPCR_DEE | LPCR_OEE))
         | LPCR_MER | LPCR_GTSE | LPCR_TC |
         LPCR_HEIC | LPCR_LPES0 | LPCR_HVICE | LPCR_HDICE;
+    /* DD2 adds an extra HAIL bit */
+    pcc->lpcr_mask |=3D LPCR_HAIL;
+
     pcc->lpcr_pm =3D LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_=
OEE;
     pcc->mmu_model =3D POWERPC_MMU_3_00;
 #if defined(CONFIG_SOFTMMU)
--=20
2.31.1



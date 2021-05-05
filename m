Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D9A3736C9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:10:30 +0200 (CEST)
Received: from localhost ([::1]:43588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDY5-0001LO-LS
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1leDUI-0005y9-8j; Wed, 05 May 2021 05:06:34 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1leDUG-0003gU-Gd; Wed, 05 May 2021 05:06:34 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14592rci129961; Wed, 5 May 2021 05:06:17 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38bqnp99g4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 05:06:17 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 145936VA027423;
 Wed, 5 May 2021 09:06:15 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 38bee2g3v5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 09:06:15 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14596DmA16580906
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 May 2021 09:06:13 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36D315204E;
 Wed,  5 May 2021 09:06:13 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 027A152050;
 Wed,  5 May 2021 09:06:12 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.156])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4ACA822019C;
 Wed,  5 May 2021 11:06:12 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 1/2] ppc: Add a POWER10 DD2 CPU
Date: Wed,  5 May 2021 11:06:08 +0200
Message-Id: <20210505090609.593194-2-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505090609.593194-1-clg@kaod.org>
References: <20210505090609.593194-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Sa-DovEDGV9dzyrRgTKB4IaUo6Wwh5Zx
X-Proofpoint-GUID: Sa-DovEDGV9dzyrRgTKB4IaUo6Wwh5Zx
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-05_03:2021-05-05,
 2021-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 bulkscore=0
 mlxlogscore=961 mlxscore=0 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105050067
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The POWER10 DD2 CPU adds an extra LPCR[HAIL] bit. The required change
of the LPCR mask impacts all the POWER10 family. It is incorrect for
DD1 but it does not break the modeling.

Setting the HAIL bit is a requirement to support the scv instruction
on PowerNV POWER10 platforms since glibc-2.33.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu-models.h         | 1 +
 target/ppc/cpu-models.c         | 4 +++-
 target/ppc/translate_init.c.inc | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

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
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.=
c.inc
index 76d82cc2f6bf..3cb0478df993 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -9302,7 +9302,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data=
)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->lpcr_mask =3D LPCR_VPM1 | LPCR_ISL | LPCR_KBV | LPCR_DPFD |
-        (LPCR_PECE_U_MASK & LPCR_HVEE) | LPCR_ILE | LPCR_AIL |
+        (LPCR_PECE_U_MASK & LPCR_HVEE) | LPCR_ILE |  LPCR_HAIL | LPCR_AI=
L |
         LPCR_UPRT | LPCR_EVIRT | LPCR_ONL | LPCR_HR | LPCR_LD |
         (LPCR_PECE_L_MASK & (LPCR_PDEE | LPCR_HDEE | LPCR_EEE |
                              LPCR_DEE | LPCR_OEE))
--=20
2.26.3



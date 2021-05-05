Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0808D3736C5
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:08:53 +0200 (CEST)
Received: from localhost ([::1]:39412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDWW-00081Z-2c
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1leDUM-00069p-UX; Wed, 05 May 2021 05:06:39 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1leDUH-0003gt-Kv; Wed, 05 May 2021 05:06:38 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 145932Lc079780; Wed, 5 May 2021 05:06:18 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38br9k07sd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 05:06:18 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14592gQ1029831;
 Wed, 5 May 2021 09:06:16 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 38bee586sw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 09:06:16 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14596Evj64881134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 May 2021 09:06:14 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF2ED5204E;
 Wed,  5 May 2021 09:06:13 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id BB39B5204F;
 Wed,  5 May 2021 09:06:13 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.156])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id F39D5220117;
 Wed,  5 May 2021 11:06:12 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 2/2] ppc/pnv: Add support for the POWER10 DD2 CPU
Date: Wed,  5 May 2021 11:06:09 +0200
Message-Id: <20210505090609.593194-3-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505090609.593194-1-clg@kaod.org>
References: <20210505090609.593194-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DxEjphSQhc_FSS_PFRA--dm0J_Fjk5ZE
X-Proofpoint-GUID: DxEjphSQhc_FSS_PFRA--dm0J_Fjk5ZE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-05_03:2021-05-05,
 2021-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 clxscore=1034 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105050067
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
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

The chip model of the powernv10 machine now uses the latest POWER10
DD2 CPU. The DD1 chip model is undefined and considered invalid.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h | 2 +-
 hw/ppc/pnv.c         | 2 +-
 hw/ppc/pnv_core.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index d69cee17b232..3fec7c87d82d 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -170,7 +170,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER8NVL,
 DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER9,
                          TYPE_PNV_CHIP_POWER9)
=20
-#define TYPE_PNV_CHIP_POWER10 PNV_CHIP_TYPE_NAME("power10_v1.0")
+#define TYPE_PNV_CHIP_POWER10 PNV_CHIP_TYPE_NAME("power10_v2.0")
 DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
                          TYPE_PNV_CHIP_POWER10)
=20
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 77af846cdfea..0a1a518844f8 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1919,7 +1919,7 @@ static void pnv_machine_power10_class_init(ObjectCl=
ass *oc, void *data)
     static const char compat[] =3D "qemu,powernv10\0ibm,powernv";
=20
     mc->desc =3D "IBM PowerNV (Non-Virtualized) POWER10";
-    mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("power10_v1.0");
+    mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("power10_v2.0");
=20
     pmc->compat =3D compat;
     pmc->compat_size =3D sizeof(compat);
diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index bd2bf2e04472..5896b97e33f4 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -346,7 +346,7 @@ static const TypeInfo pnv_core_infos[] =3D {
     DEFINE_PNV_CORE_TYPE(power8, "power8_v2.0"),
     DEFINE_PNV_CORE_TYPE(power8, "power8nvl_v1.0"),
     DEFINE_PNV_CORE_TYPE(power9, "power9_v2.0"),
-    DEFINE_PNV_CORE_TYPE(power10, "power10_v1.0"),
+    DEFINE_PNV_CORE_TYPE(power10, "power10_v2.0"),
 };
=20
 DEFINE_TYPES(pnv_core_infos)
--=20
2.26.3



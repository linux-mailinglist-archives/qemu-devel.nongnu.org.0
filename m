Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DF23E46EE
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:52:05 +0200 (CEST)
Received: from localhost ([::1]:41368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5hE-0001pu-L4
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bX-0000P4-CF; Mon, 09 Aug 2021 09:46:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bV-0000yt-JV; Mon, 09 Aug 2021 09:46:10 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179DYSnY168903; Mon, 9 Aug 2021 09:46:03 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aaa1qxdyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:46:03 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179DdoiZ022175;
 Mon, 9 Aug 2021 13:46:02 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 3a9ht8kmd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:46:01 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 179DjxXY56164748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:45:59 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0275242080;
 Mon,  9 Aug 2021 13:45:59 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B20304203F;
 Mon,  9 Aug 2021 13:45:58 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 13:45:58 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E06EE22016C;
 Mon,  9 Aug 2021 15:45:57 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 13/26] ppc/pnv: Add POWER10 quads
Date: Mon,  9 Aug 2021 15:45:34 +0200
Message-Id: <20210809134547.689560-14-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809134547.689560-1-clg@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PJd327wcPrx1aB6Cd1k8pbln55kWZ9bt
X-Proofpoint-ORIG-GUID: PJd327wcPrx1aB6Cd1k8pbln55kWZ9bt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=872 mlxscore=0 clxscore=1034 spamscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090101
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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

Still needs some refinements on the XSCOM registers.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h |  3 +++
 hw/ppc/pnv.c         | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index a299fbc7f25c..13495423283a 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -128,6 +128,9 @@ struct Pnv10Chip {
     Pnv9Psi      psi;
     PnvLpcController lpc;
     PnvOCC       occ;
+
+    uint32_t     nr_quads;
+    PnvQuad      *quads;
 };
=20
 #define PNV10_PIR2FUSEDCORE(pir) (((pir) >> 3) & 0xf)
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index f75d90e61fa8..f670d97c5f91 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1605,6 +1605,34 @@ static void pnv_chip_power10_instance_init(Object =
*obj)
     object_initialize_child(obj, "occ",  &chip10->occ, TYPE_PNV10_OCC);
 }
=20
+
+static void pnv_chip_power10_quad_realize(Pnv10Chip *chip10, Error **err=
p)
+{
+    PnvChip *chip =3D PNV_CHIP(chip10);
+    int i;
+
+    chip10->nr_quads =3D DIV_ROUND_UP(chip->nr_cores, 4);
+    chip10->quads =3D g_new0(PnvQuad, chip10->nr_quads);
+
+    for (i =3D 0; i < chip10->nr_quads; i++) {
+        char eq_name[32];
+        PnvQuad *eq =3D &chip10->quads[i];
+        PnvCore *pnv_core =3D chip->cores[i * 4];
+        int core_id =3D CPU_CORE(pnv_core)->core_id;
+
+        snprintf(eq_name, sizeof(eq_name), "eq[%d]", core_id);
+        object_initialize_child_with_props(OBJECT(chip), eq_name, eq,
+                                           sizeof(*eq), TYPE_PNV_QUAD,
+                                           &error_fatal, NULL);
+
+        object_property_set_int(OBJECT(eq), "id", core_id, &error_fatal)=
;
+        qdev_realize(DEVICE(eq), NULL, &error_fatal);
+
+        pnv_xscom_add_subregion(chip, PNV10_XSCOM_EQ_BASE(eq->id),
+                                &eq->xscom_regs);
+    }
+}
+
 static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
 {
     PnvChipClass *pcc =3D PNV_CHIP_GET_CLASS(dev);
@@ -1626,6 +1654,12 @@ static void pnv_chip_power10_realize(DeviceState *=
dev, Error **errp)
         return;
     }
=20
+    pnv_chip_power10_quad_realize(chip10, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     /* XIVE2 interrupt controller (POWER10) */
     object_property_set_int(OBJECT(&chip10->xive), "ic-bar",
                             PNV10_XIVE2_IC_BASE(chip), &error_fatal);
--=20
2.31.1



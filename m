Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A62490908
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 13:53:29 +0100 (CET)
Received: from localhost ([::1]:38486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9RVo-00061K-9K
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 07:53:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9R7H-0002wn-CJ; Mon, 17 Jan 2022 07:28:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9R7F-0007vd-Mz; Mon, 17 Jan 2022 07:28:07 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20HBveq5023419; 
 Mon, 17 Jan 2022 12:28:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn81urh9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 12:28:01 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20HCRp49004030;
 Mon, 17 Jan 2022 12:28:01 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn81urh8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 12:28:01 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20HCCjIA020499;
 Mon, 17 Jan 2022 12:27:59 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 3dknw8u27c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 12:27:58 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20HCIgFU42008990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 12:18:42 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8560E11C04C;
 Mon, 17 Jan 2022 12:27:56 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52ADF11C04A;
 Mon, 17 Jan 2022 12:27:56 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 17 Jan 2022 12:27:56 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B596B2201F1;
 Mon, 17 Jan 2022 13:27:55 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 2/3] ppc/pnv: Add a 'rp_model' class attribute for the PHB4 PEC
Date: Mon, 17 Jan 2022 13:27:52 +0100
Message-Id: <20220117122753.1655504-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220117122753.1655504-1-clg@kaod.org>
References: <20220117122753.1655504-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qVG3WBT0Qv8evF3I8aaq4fA_WKReXJuE
X-Proofpoint-GUID: cK96LW7J3T6nlZ3902zdjw5HD5C6OqqD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_04,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 clxscore=1034 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201170077
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PHB5 will introduce its own root port model. Prepare ground for it.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h | 1 +
 hw/pci-host/pnv_phb4_pec.c     | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index 74fdec2b478b..0c7635dec591 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -203,6 +203,7 @@ struct PnvPhb4PecClass {
     int stk_compat_size;
     uint64_t version;
     const uint32_t *num_phbs;
+    const char *rp_model;
 };
=20
 #endif /* PCI_HOST_PNV_PHB4_H */
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index b19e89236a63..a3c4b4ef850c 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -134,7 +134,9 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecSta=
te *pec,
     }
=20
     /* Add a single Root port if running with defaults */
-    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), TYPE_PNV_PHB4_ROOT_PO=
RT);
+    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
+                             PNV_PHB4_PEC_GET_CLASS(pec)->rp_model);
+
 }
=20
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
@@ -267,6 +269,7 @@ static void pnv_pec_class_init(ObjectClass *klass, vo=
id *data)
     pecc->stk_compat_size =3D sizeof(stk_compat);
     pecc->version =3D PNV_PHB4_VERSION;
     pecc->num_phbs =3D pnv_pec_num_phbs;
+    pecc->rp_model =3D TYPE_PNV_PHB4_ROOT_PORT;
 }
=20
 static const TypeInfo pnv_pec_type_info =3D {
--=20
2.31.1



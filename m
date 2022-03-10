Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AB24D4DA4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 16:53:34 +0100 (CET)
Received: from localhost ([::1]:49514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSL6b-0004fR-Ec
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 10:53:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nSL4R-0002NQ-1m; Thu, 10 Mar 2022 10:51:19 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nSL4P-0006tq-8q; Thu, 10 Mar 2022 10:51:18 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AEETDU019153; 
 Thu, 10 Mar 2022 15:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zgDeeq0AGRRVF3KpCgDg40BRvw/XKL3cETVeVNloXAw=;
 b=WIh4x3ifjB7IZ02H4USIIFwX6h2bvjXnuhxCDsEOrsdeER4Rf4znldp1Qu0LU04OfTE5
 f4w/S3jS0An6FOucxIHNOuOy6Z7MqC4Unhkop8LEcpAFGhZB+8L3aE7HZ1NmiboBJd34
 CKHGlaDrEqe+wNRr8PAlP3xJ/kjt1iGkqbhbmqEPKmJOe25C8xP48zlKsopLiHJLEUe1
 nU92GrhFUtUOmBpwQ6ib2N3wtM/Pa8gR4c09lcKlJ9VO3TGC5HdyWmHe/Jilf16GHM0h
 UNajVdbAQbkwUv/YcyYTvsivx8yDLehedqHMV6ogpYgWn+YX+FyXdv2H2GkW0xcYOw5d XA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqjx0jbgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 15:51:07 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AFAboT002412;
 Thu, 10 Mar 2022 15:51:07 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqjx0jbfw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 15:51:07 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22AFcxct018949;
 Thu, 10 Mar 2022 15:51:04 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3ep8c3vpdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 15:51:04 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22AFp2sC16580874
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 15:51:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C2165204F;
 Thu, 10 Mar 2022 15:51:02 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.101.4.17])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0156152052;
 Thu, 10 Mar 2022 15:51:01 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 1/3] ppc/pnv: Introduce a pnv-phb5 device to match root port
Date: Thu, 10 Mar 2022 16:50:59 +0100
Message-Id: <20220310155101.294568-2-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310155101.294568-1-fbarrat@linux.ibm.com>
References: <20220310155101.294568-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hSMDrJBq16PCRsgKlAdCuh_AianrRwDj
X-Proofpoint-GUID: M_3P55nBCx7yF81K6TdmEz39Gd_1bGEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_06,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100084
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have the pnv-phb3 and pnv-phb4 devices for POWER8 and
POWER9 respectively. POWER10 uses version 5 of the PHB. It is very
close to the PHB4 from POWER9, at least in our model and we could
almost keep using the PHB4 model. However the matching root port
pnv-phb5-root-port is specific to POWER10 so to avoid confusion as
well as making it easy to introduce differences later, we create a
pnv-phb5 class, which is mostly an alias for pnv-phb4 for now.

With this patch, the command line for a user-created PHB on powernv10
becomes:
  -machine powernv10 -nodefaults -device pnv-phb5 -device pnv-phb5-root-port

Fixes: 623575e16cd5 ("ppc/pnv: Add model for POWER10 PHB5 PCIe Host bridge")
Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 hw/pci-host/pnv_phb4.c         | 7 +++++++
 hw/pci-host/pnv_phb4_pec.c     | 9 +++++----
 include/hw/pci-host/pnv_phb4.h | 5 +++++
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index b5b384e9ee..d1a911f988 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1783,6 +1783,12 @@ static const TypeInfo pnv_phb4_type_info = {
     }
 };
 
+static const TypeInfo pnv_phb5_type_info = {
+    .name          = TYPE_PNV_PHB5,
+    .parent        = TYPE_PNV_PHB4,
+    .instance_size = sizeof(PnvPHB4),
+};
+
 static void pnv_phb4_root_bus_class_init(ObjectClass *klass, void *data)
 {
     BusClass *k = BUS_CLASS(klass);
@@ -1907,6 +1913,7 @@ static void pnv_phb4_register_types(void)
     type_register_static(&pnv_phb5_root_port_info);
     type_register_static(&pnv_phb4_root_port_info);
     type_register_static(&pnv_phb4_type_info);
+    type_register_static(&pnv_phb5_type_info);
     type_register_static(&pnv_phb4_iommu_memory_region_info);
 }
 
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 0ab36e9c8f..a0dfa77c84 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -116,7 +116,8 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
                                         int stack_no,
                                         Error **errp)
 {
-    PnvPHB4 *phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
+    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
+    PnvPHB4 *phb = PNV_PHB4(qdev_new(pecc->phb_type));
     int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
 
     object_property_set_link(OBJECT(phb), "pec", OBJECT(pec),
@@ -131,9 +132,7 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
     }
 
     /* Add a single Root port if running with defaults */
-    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
-                             PNV_PHB4_PEC_GET_CLASS(pec)->rp_model);
-
+    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), pecc->rp_model);
 }
 
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
@@ -265,6 +264,7 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
     pecc->stk_compat = stk_compat;
     pecc->stk_compat_size = sizeof(stk_compat);
     pecc->version = PNV_PHB4_VERSION;
+    pecc->phb_type = TYPE_PNV_PHB4;
     pecc->num_phbs = pnv_pec_num_phbs;
     pecc->rp_model = TYPE_PNV_PHB4_ROOT_PORT;
 }
@@ -317,6 +317,7 @@ static void pnv_phb5_pec_class_init(ObjectClass *klass, void *data)
     pecc->stk_compat = stk_compat;
     pecc->stk_compat_size = sizeof(stk_compat);
     pecc->version = PNV_PHB5_VERSION;
+    pecc->phb_type = TYPE_PNV_PHB5;
     pecc->num_phbs = pnv_phb5_pec_num_stacks;
     pecc->rp_model = TYPE_PNV_PHB5_ROOT_PORT;
 }
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index fbcf5bfb55..b02ecdceaa 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -203,6 +203,7 @@ struct PnvPhb4PecClass {
     const char *stk_compat;
     int stk_compat_size;
     uint64_t version;
+    const char *phb_type;
     const uint32_t *num_phbs;
     const char *rp_model;
 };
@@ -211,6 +212,10 @@ struct PnvPhb4PecClass {
  * POWER10 definitions
  */
 
+#define TYPE_PNV_PHB5 "pnv-phb5"
+#define PNV_PHB5(obj) \
+    OBJECT_CHECK(PnvPhb4, (obj), TYPE_PNV_PHB5)
+
 #define PNV_PHB5_VERSION           0x000000a500000001ull
 #define PNV_PHB5_DEVICE_ID         0x0652
 
-- 
2.35.1



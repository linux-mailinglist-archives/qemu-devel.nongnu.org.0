Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEF3492815
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:13:23 +0100 (CET)
Received: from localhost ([::1]:51010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pEg-0003On-C8
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:13:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDP-0003rX-FF; Tue, 18 Jan 2022 08:08:00 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDN-0000Fh-Mi; Tue, 18 Jan 2022 08:07:59 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20ICv0b7009437; 
 Tue, 18 Jan 2022 13:07:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnx0jrd5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:52 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20ICwm0s021110;
 Tue, 18 Jan 2022 13:07:51 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnx0jrd40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:51 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ID7ckF002468;
 Tue, 18 Jan 2022 13:07:49 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3dknhjck6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:49 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20ID7kxS37093808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:07:46 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A54E45206B;
 Tue, 18 Jan 2022 13:07:46 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 62F895205A;
 Tue, 18 Jan 2022 13:07:46 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B4CBF2201EB;
 Tue, 18 Jan 2022 14:07:45 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 21/31] ppc/pnv: introduce PnvPHB4 'pec' property
Date: Tue, 18 Jan 2022 14:07:20 +0100
Message-Id: <20220118130730.1927983-22-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118130730.1927983-1-clg@kaod.org>
References: <20220118130730.1927983-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6T7hQKi6lCTcXjiKxB9vZOzcTfaSLOXz
X-Proofpoint-ORIG-GUID: h025oE-PzavzbQdagEYJV6QXmYqIkO8Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_03,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 malwarescore=0
 bulkscore=0 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180081
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

This property will track the owner PEC of this PHB. For now it's
redundant since we can retrieve the PEC via phb->stack->pec but it
will not be redundant when we get rid of the stack device.

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220114180719.52117-2-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h |  3 +++
 hw/pci-host/pnv_phb4.c         | 19 +++++++++++++------
 hw/pci-host/pnv_phb4_pec.c     |  2 ++
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index 6968efaba8f3..1d27e4c0cb74 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -84,6 +84,9 @@ struct PnvPHB4 {
=20
     uint64_t version;
=20
+    /* The owner PEC */
+    PnvPhb4PecState *pec;
+
     char bus_path[8];
=20
     /* Main register images */
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index b5045fca641e..2658ef2d84b1 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -895,7 +895,7 @@ static void pnv_phb4_update_regions(PnvPHB4 *phb)
 static void pnv_pec_stk_update_map(PnvPHB4 *phb)
 {
     PnvPhb4PecStack *stack =3D phb->stack;
-    PnvPhb4PecState *pec =3D stack->pec;
+    PnvPhb4PecState *pec =3D phb->pec;
     MemoryRegion *sysmem =3D get_system_memory();
     uint64_t bar_en =3D phb->nest_regs[PEC_NEST_STK_BAR_EN];
     uint64_t bar, mask, size;
@@ -969,7 +969,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
         bar =3D phb->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
         size =3D PNV_PHB4_MAX_INTs << 16;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-int",
-                 stack->pec->chip_id, stack->pec->index, stack->stack_no=
);
+                 phb->pec->chip_id, phb->pec->index, stack->stack_no);
         memory_region_init(&phb->intbar, OBJECT(phb), name, size);
         memory_region_add_subregion(sysmem, bar, &phb->intbar);
     }
@@ -982,7 +982,7 @@ static void pnv_pec_stk_nest_xscom_write(void *opaque=
, hwaddr addr,
                                          uint64_t val, unsigned size)
 {
     PnvPHB4 *phb =3D PNV_PHB4(opaque);
-    PnvPhb4PecState *pec =3D phb->stack->pec;
+    PnvPhb4PecState *pec =3D phb->pec;
     uint32_t reg =3D addr >> 3;
=20
     switch (reg) {
@@ -1459,7 +1459,7 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bus=
, void *opaque, int devfn)
 static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
 {
     PnvPhb4PecStack *stack =3D phb->stack;
-    PnvPhb4PecState *pec =3D stack->pec;
+    PnvPhb4PecState *pec =3D phb->pec;
     PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
     uint32_t pec_nest_base;
     uint32_t pec_pci_base;
@@ -1568,8 +1568,13 @@ static void pnv_phb4_realize(DeviceState *dev, Err=
or **errp)
             return;
         }
=20
-        /* All other phb properties but 'version' are already set */
-        pecc =3D PNV_PHB4_PEC_GET_CLASS(phb->stack->pec);
+        /*
+         * All other phb properties but 'pec' ad 'version' are
+         * already set.
+         */
+        object_property_set_link(OBJECT(phb), "pec", OBJECT(phb->stack->=
pec),
+                                 &error_abort);
+        pecc =3D PNV_PHB4_PEC_GET_CLASS(phb->pec);
         object_property_set_int(OBJECT(phb), "version", pecc->version,
                                 &error_fatal);
=20
@@ -1682,6 +1687,8 @@ static Property pnv_phb4_properties[] =3D {
         DEFINE_PROP_UINT64("version", PnvPHB4, version, 0),
         DEFINE_PROP_LINK("stack", PnvPHB4, stack, TYPE_PNV_PHB4_PEC_STAC=
K,
                          PnvPhb4PecStack *),
+        DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
+                         PnvPhb4PecState *),
         DEFINE_PROP_END_OF_LIST(),
 };
=20
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 7fe7f1f007dd..22194b8de2ff 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -285,6 +285,8 @@ static void pnv_pec_stk_default_phb_realize(PnvPhb4Pe=
cStack *stack,
=20
     stack->phb =3D PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
=20
+    object_property_set_link(OBJECT(stack->phb), "pec", OBJECT(pec),
+                             &error_abort);
     object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
                             &error_fatal);
     object_property_set_int(OBJECT(stack->phb), "index", phb_id,
--=20
2.31.1



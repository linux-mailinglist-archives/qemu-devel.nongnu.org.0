Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB4D548602
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 17:48:08 +0200 (CEST)
Received: from localhost ([::1]:36722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0mIR-00034c-5e
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 11:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFg-0008RP-Ot; Mon, 13 Jun 2022 11:45:16 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFe-0001zg-KB; Mon, 13 Jun 2022 11:45:16 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DEv83r012361;
 Mon, 13 Jun 2022 15:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9T811O2B06f2KWNkfXOvNqpViIkh9lPC9/ZBWvzn/c8=;
 b=sfPcill3fuSY6Ueb46SSttxxCNHYB3PgYPKeRwWEHYqh4RPVFyFgVqYI1mvG2n1UGuYP
 6JFwFyhJxDLiFb7mYY0Uo02uV14VBAbXANRkRXiFb1FFxqZrrpVWvlV5oR+nBPHDrt8t
 s0q0qFSMDsZwy4S3h2h6Rx6SaMKah1zllghW2WX6bG16/OAK2m0NkDbsBbNquBMCT00p
 P+XQfS8wv42T8w82KGZacY6zN45fX1fkCO/vYKwfiq4C+0Xg2EqlxNlHkQKs9Yw9PTf+
 jefuMMjRiBdInWjfI/IUs3aWueRrc9hd+diog26WG7WOi4fl7eVzPLw+HZnvoJfKb1lK uQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gp7f0s3j0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:07 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25DFOnkG006204;
 Mon, 13 Jun 2022 15:45:05 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 3gmjp96dsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:05 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25DFj5L952101408
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 15:45:05 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AC39AC065;
 Mon, 13 Jun 2022 15:45:05 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51BE3AC059;
 Mon, 13 Jun 2022 15:45:04 +0000 (GMT)
Received: from balboa.COMFAST (unknown [9.77.153.150])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jun 2022 15:45:04 +0000 (GMT)
From: Daniel Henrique Barboza <danielhb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 mark.cave-ayland@ilande.co.uk
Subject: [PATCH 03/11] ppc/pnv: use dev->parent_bus->parent to get the PHB
Date: Mon, 13 Jun 2022 12:44:48 -0300
Message-Id: <20220613154456.359674-4-danielhb@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613154456.359674-1-danielhb@linux.ibm.com>
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hqlXez0wW4XGPisUdgAbhxs7tUz_SjrQ
X-Proofpoint-ORIG-GUID: hqlXez0wW4XGPisUdgAbhxs7tUz_SjrQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_07,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=969
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130069
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=danielhb@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

It is not advisable to execute an object_dynamic_cast() to poke into
bus->qbus.parent and follow it up with a C cast into the PnvPHB type we
think we got.

A better way is to access the PnvPHB object via a QOM macro accessing
the existing parent links of the DeviceState. For a given
pnv-phb3/4-root-port 'dev', dev->parent_bus will give us the PHB bus,
and dev->parent_bus->parent is the PHB. Use the adequate QOM macro to
assert the type, and keep the NULL check in case we didn't get the
object we were expecting.

Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
---
 hw/pci-host/pnv_phb3.c | 10 +++++++---
 hw/pci-host/pnv_phb4.c | 10 +++++++---
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 4ba660f8b9..7901d8172c 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1139,12 +1139,16 @@ static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
 {
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
     PCIDevice *pci = PCI_DEVICE(dev);
-    PCIBus *bus = pci_get_bus(pci);
     PnvPHB3 *phb = NULL;
     Error *local_err = NULL;
 
-    phb = (PnvPHB3 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
-                                          TYPE_PNV_PHB3);
+    /*
+     * dev->parent_bus gives access to the pnv-phb-root bus.
+     * The PnvPHB3 is the owner (parent) of the bus.
+     */
+    if (dev && dev->parent_bus) {
+        phb = PNV_PHB3(dev->parent_bus->parent);
+    }
 
     if (!phb) {
         error_setg(errp,
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index ffd9d8a947..bae9398d86 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1782,12 +1782,16 @@ static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
 {
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
     PCIDevice *pci = PCI_DEVICE(dev);
-    PCIBus *bus = pci_get_bus(pci);
     PnvPHB4 *phb = NULL;
     Error *local_err = NULL;
 
-    phb = (PnvPHB4 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
-                                          TYPE_PNV_PHB4);
+    /*
+     * dev->parent_bus gives access to the pnv-phb-root bus.
+     * The PnvPHB4 is the owner (parent) of the bus.
+     */
+    if (dev && dev->parent_bus) {
+        phb = PNV_PHB4(dev->parent_bus->parent);
+    }
 
     if (!phb) {
         error_setg(errp, "%s must be connected to pnv-phb4 buses", dev->id);
-- 
2.36.1



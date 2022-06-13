Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC8F54860B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 17:53:49 +0200 (CEST)
Received: from localhost ([::1]:52182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0mNw-00058Z-OJ
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 11:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFt-0000Rd-Qt; Mon, 13 Jun 2022 11:45:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:3282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFs-000261-18; Mon, 13 Jun 2022 11:45:29 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DFecc1032320;
 Mon, 13 Jun 2022 15:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Hk2cC9spW/5bg0NOvft8zwKGimRakNd5Zse7WvHonxw=;
 b=dN7yciNeQYhTp7nGRG37yPDMf1owmHteMaeUr4+mB4+mrhLdIJe6kw3op8XjFmy6o9MG
 z/Pc5frausZ1b6MkbftoI5yRj2l8U5AGZNS0w6RpzdKKCoiOODBX0n2PImZQL2VzhZbE
 dhcRA03awc87Ig9Vkc74D1Dh9Jy1zKFZQOhGnHsoiL2CHFwnZPNRDtCCpVoQgIzaHsBZ
 i1gYu9m71g653ZRs5A/Pk2BJQZVMaRdxOjqomizv/rPf3zu6F3HW/kwKsUCvRXwp2GoU
 IoUNwrW3xAomj3T7B7qZJ4OTW9NJtDtw+2yRGhtAFiq0MFFIau/jE9+QSWStF94fsuJP Wg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gp6p0j50s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:17 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25DFhYqa016459;
 Mon, 13 Jun 2022 15:45:16 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 3gmjp9t01y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:16 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25DFjFjx23003468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 15:45:15 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4778AC05F;
 Mon, 13 Jun 2022 15:45:15 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4A90AC05B;
 Mon, 13 Jun 2022 15:45:13 +0000 (GMT)
Received: from balboa.COMFAST (unknown [9.77.153.150])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jun 2022 15:45:13 +0000 (GMT)
From: Daniel Henrique Barboza <danielhb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 mark.cave-ayland@ilande.co.uk
Subject: [PATCH 09/11] ppc/pnv: add PHB object/bus parenting helpers
Date: Mon, 13 Jun 2022 12:44:54 -0300
Message-Id: <20220613154456.359674-10-danielhb@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613154456.359674-1-danielhb@linux.ibm.com>
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HIIch9xzCsbtAYlJ-gF7n2x-MHJ5dS9f
X-Proofpoint-ORIG-GUID: HIIch9xzCsbtAYlJ-gF7n2x-MHJ5dS9f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_07,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

These helpers are inspired by the changes that were reverted in commit
9c10d86fee "ppc/pnv: Remove user-created PHB{3,4,5} devices". We'll use
them to handle the default case we already support.

Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
---
 hw/ppc/pnv.c         | 31 +++++++++++++++++++++++++++++++
 include/hw/ppc/pnv.h |  2 ++
 2 files changed, 33 insertions(+)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 6ce9e94e05..d77c90d64a 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1983,6 +1983,37 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
     return NULL;
 }
 
+
+/*
+ * Set the QOM parent of an object child. If the device state
+ * associated with the child has an id, use it as QOM id. Otherwise
+ * use object_typename[index] as QOM id.
+ */
+void pnv_parent_qom_fixup(Object *parent, Object *child, int index)
+{
+    g_autofree char *default_id =
+        g_strdup_printf("%s[%d]", object_get_typename(child), index);
+    const char *dev_id = DEVICE(child)->id;
+
+    if (child->parent == parent) {
+        return;
+    }
+
+    object_ref(child);
+    object_unparent(child);
+    object_property_add_child(parent, dev_id ? dev_id : default_id, child);
+    object_unref(child);
+}
+
+void pnv_parent_bus_fixup(DeviceState *parent, DeviceState *phb_dev)
+{
+    BusState *s = qdev_get_parent_bus(parent);
+
+    if (!qdev_set_parent_bus(phb_dev, s, &error_fatal)) {
+        return;
+    }
+}
+
 PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
 {
     int i;
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 11f1089289..c091f23039 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -194,6 +194,8 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
 
 PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
 void pnv_phb_attach_root_port(PCIHostState *pci, const char *name, int index);
+void pnv_parent_qom_fixup(Object *parent, Object *child, int index);
+void pnv_parent_bus_fixup(DeviceState *parent, DeviceState *child);
 
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
 typedef struct PnvMachineClass PnvMachineClass;
-- 
2.36.1



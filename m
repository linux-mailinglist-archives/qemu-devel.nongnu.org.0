Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C1E2C803B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 09:45:28 +0100 (CET)
Received: from localhost ([::1]:49474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjeoJ-0004IX-HP
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 03:45:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kjegm-0003NQ-BL; Mon, 30 Nov 2020 03:37:40 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kjegj-0000VY-07; Mon, 30 Nov 2020 03:37:40 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CkzB31L5xzhkXx;
 Mon, 30 Nov 2020 16:37:15 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Mon, 30 Nov 2020
 16:37:24 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 06/12] ipmi: put some ipmi devices into the correct category
Date: Mon, 30 Nov 2020 16:36:24 +0800
Message-ID: <20201130083630.2520597-7-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201130083630.2520597-1-ganqixin@huawei.com>
References: <20201130083630.2520597-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ganqixin@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Corey Minyard <minyard@acm.org>, kuhn.chenqun@huawei.com, thuth@redhat.com,
 zhang.zhanghailiang@huawei.com, Gan Qixin <ganqixin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some ipmi devices have no category, put them into the correct category.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Corey Minyard <minyard@acm.org>
---
 hw/ipmi/ipmi_bmc_extern.c | 1 +
 hw/ipmi/ipmi_bmc_sim.c    | 1 +
 hw/ipmi/isa_ipmi_bt.c     | 1 +
 hw/ipmi/isa_ipmi_kcs.c    | 1 +
 hw/ipmi/pci_ipmi_bt.c     | 1 +
 hw/ipmi/pci_ipmi_kcs.c    | 1 +
 6 files changed, 6 insertions(+)

diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
index c3f3306e66..aa8faf9a9b 100644
--- a/hw/ipmi/ipmi_bmc_extern.c
+++ b/hw/ipmi/ipmi_bmc_extern.c
@@ -529,6 +529,7 @@ static void ipmi_bmc_extern_class_init(ObjectClass *oc, void *data)
     dc->hotpluggable = false;
     dc->realize = ipmi_bmc_extern_realize;
     device_class_set_props(dc, ipmi_bmc_extern_properties);
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo ipmi_bmc_extern_type = {
diff --git a/hw/ipmi/ipmi_bmc_sim.c b/hw/ipmi/ipmi_bmc_sim.c
index f78e92d3d5..611650f79e 100644
--- a/hw/ipmi/ipmi_bmc_sim.c
+++ b/hw/ipmi/ipmi_bmc_sim.c
@@ -2214,6 +2214,7 @@ static void ipmi_sim_class_init(ObjectClass *oc, void *data)
     dc->realize = ipmi_sim_realize;
     device_class_set_props(dc, ipmi_sim_properties);
     bk->handle_command = ipmi_sim_handle_command;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo ipmi_sim_type = {
diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
index b7c2ad557b..7fc6022f13 100644
--- a/hw/ipmi/isa_ipmi_bt.c
+++ b/hw/ipmi/isa_ipmi_bt.c
@@ -152,6 +152,7 @@ static void isa_ipmi_bt_class_init(ObjectClass *oc, void *data)
     iic->get_backend_data = isa_ipmi_bt_get_backend_data;
     ipmi_bt_class_init(iic);
     iic->get_fwinfo = isa_ipmi_bt_get_fwinfo;
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
 }
 
 static const TypeInfo isa_ipmi_bt_info = {
diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c
index 7dd6bf0040..b50901fc3b 100644
--- a/hw/ipmi/isa_ipmi_kcs.c
+++ b/hw/ipmi/isa_ipmi_kcs.c
@@ -159,6 +159,7 @@ static void isa_ipmi_kcs_class_init(ObjectClass *oc, void *data)
     iic->get_backend_data = isa_ipmi_kcs_get_backend_data;
     ipmi_kcs_class_init(iic);
     iic->get_fwinfo = isa_ipmi_kcs_get_fwinfo;
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
 }
 
 static const TypeInfo isa_ipmi_kcs_info = {
diff --git a/hw/ipmi/pci_ipmi_bt.c b/hw/ipmi/pci_ipmi_bt.c
index b6e52730d3..7d7435719a 100644
--- a/hw/ipmi/pci_ipmi_bt.c
+++ b/hw/ipmi/pci_ipmi_bt.c
@@ -125,6 +125,7 @@ static void pci_ipmi_bt_class_init(ObjectClass *oc, void *data)
 
     iic->get_backend_data = pci_ipmi_bt_get_backend_data;
     ipmi_bt_class_init(iic);
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
 }
 
 static const TypeInfo pci_ipmi_bt_info = {
diff --git a/hw/ipmi/pci_ipmi_kcs.c b/hw/ipmi/pci_ipmi_kcs.c
index de13418862..0f1a1e4098 100644
--- a/hw/ipmi/pci_ipmi_kcs.c
+++ b/hw/ipmi/pci_ipmi_kcs.c
@@ -125,6 +125,7 @@ static void pci_ipmi_kcs_class_init(ObjectClass *oc, void *data)
 
     iic->get_backend_data = pci_ipmi_kcs_get_backend_data;
     ipmi_kcs_class_init(iic);
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
 }
 
 static const TypeInfo pci_ipmi_kcs_info = {
-- 
2.23.0



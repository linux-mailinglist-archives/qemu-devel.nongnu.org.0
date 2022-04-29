Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA9E514EF7
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:14:13 +0200 (CEST)
Received: from localhost ([::1]:43422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSJw-0007Tb-F8
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nkRy0-00013b-89
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:51:33 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nkRxx-0001Ow-Fa
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:51:31 -0400
Received: from fraeml701-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Kqb1K4yzxz67QJm;
 Fri, 29 Apr 2022 22:47:17 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml701-chm.china.huawei.com (10.206.15.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Fri, 29 Apr 2022 16:51:26 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 15:51:25 +0100
To: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>, <alex.bennee@linaro.org>, 
 Marcel Apfelbaum <marcel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>, <f4bug@amsat.org>, Peter Xu
 <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Saransh Gupta1 <saransh@ibm.com>, Shreyas Shah
 <shreyas.shah@elastics.cloud>, Chris Browy <cbrowy@avery-design.com>,
 "Samarth Saxena" <samarths@cadence.com>, Dan Williams
 <dan.j.williams@intel.com>, <k.jensen@samsung.com>, <dave@stgolabs.net>,
 Alison Schofield <alison.schofield@intel.com>
Subject: [PATCH v10 20/45] hw/cxl/device: Plumb real Label Storage Area (LSA)
 sizing
Date: Fri, 29 Apr 2022 15:40:45 +0100
Message-ID: <20220429144110.25167-21-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220429144110.25167-1-Jonathan.Cameron@huawei.com>
References: <20220429144110.25167-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml727-chm.china.huawei.com (10.201.108.78) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

From: Ben Widawsky <ben.widawsky@intel.com>

This should introduce no change. Subsequent work will make use of this
new class member.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/cxl/cxl-mailbox-utils.c  |  3 +++
 hw/mem/cxl_type3.c          |  9 +++++++++
 include/hw/cxl/cxl_device.h | 11 ++++++++++-
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index c8188d7087..492739aef3 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -277,6 +277,8 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
     } QEMU_PACKED *id;
     QEMU_BUILD_BUG_ON(sizeof(*id) != 0x43);
 
+    CXLType3Dev *ct3d = container_of(cxl_dstate, CXLType3Dev, cxl_dstate);
+    CXLType3Class *cvc = CXL_TYPE3_GET_CLASS(ct3d);
     uint64_t size = cxl_dstate->pmem_size;
 
     if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
@@ -291,6 +293,7 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
 
     id->total_capacity = size / (256 << 20);
     id->persistent_capacity = size / (256 << 20);
+    id->lsa_size = cvc->get_lsa_size(ct3d);
 
     *len = sizeof(*id);
     return CXL_MBOX_SUCCESS;
diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 318b6f9fbc..b5aa1067df 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -179,10 +179,16 @@ static Property ct3_props[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static uint64_t get_lsa_size(CXLType3Dev *ct3d)
+{
+    return 0;
+}
+
 static void ct3_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     PCIDeviceClass *pc = PCI_DEVICE_CLASS(oc);
+    CXLType3Class *cvc = CXL_TYPE3_CLASS(oc);
 
     pc->realize = ct3_realize;
     pc->exit = ct3_exit;
@@ -195,11 +201,14 @@ static void ct3_class_init(ObjectClass *oc, void *data)
     dc->desc = "CXL PMEM Device (Type 3)";
     dc->reset = ct3d_reset;
     device_class_set_props(dc, ct3_props);
+
+    cvc->get_lsa_size = get_lsa_size;
 }
 
 static const TypeInfo ct3d_info = {
     .name = TYPE_CXL_TYPE3,
     .parent = TYPE_PCI_DEVICE,
+    .class_size = sizeof(struct CXLType3Class),
     .class_init = ct3_class_init,
     .instance_size = sizeof(CXLType3Dev),
     .interfaces = (InterfaceInfo[]) {
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index d8da2c7b68..ea2571a69b 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -236,6 +236,7 @@ struct CXLType3Dev {
 
     /* Properties */
     HostMemoryBackend *hostmem;
+    HostMemoryBackend *lsa;
 
     /* State */
     CXLComponentState cxl_cstate;
@@ -243,6 +244,14 @@ struct CXLType3Dev {
 };
 
 #define TYPE_CXL_TYPE3 "cxl-type3"
-OBJECT_DECLARE_SIMPLE_TYPE(CXLType3Dev, CXL_TYPE3)
+OBJECT_DECLARE_TYPE(CXLType3Dev, CXLType3Class, CXL_TYPE3)
+
+struct CXLType3Class {
+    /* Private */
+    PCIDeviceClass parent_class;
+
+    /* public */
+    uint64_t (*get_lsa_size)(CXLType3Dev *ct3d);
+};
 
 #endif
-- 
2.32.0



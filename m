Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E9730B498
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 02:21:21 +0100 (CET)
Received: from localhost ([::1]:55886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6kNc-0003IT-Cm
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 20:21:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1l6k4d-0001Gs-Fg
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 20:01:43 -0500
Received: from mga18.intel.com ([134.134.136.126]:33366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1l6k4a-0001pl-JF
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 20:01:43 -0500
IronPort-SDR: QduUGKMH09nFd/16ONe+nAC2Pri87rWRFNybHJ5TdfwOjsss9kjwHruUaiciWT5L5lIs7wIj5W
 Ha8ulZkvMsTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="168457143"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="168457143"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 17:00:22 -0800
IronPort-SDR: k0REhMz+lyLKzjTCvQ7dQ6nkrBk5hl9cmIC4smyfGvqNkxh1rni2rHirnyBDBREHQJVHL5eo+/
 C8Y0AfBE7XZQ==
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="581764279"
Received: from jambrizm-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.133.15])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 17:00:21 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 28/31] hw/cxl/device: Plumb real LSA sizing
Date: Mon,  1 Feb 2021 16:59:45 -0800
Message-Id: <20210202005948.241655-29-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210202005948.241655-1-ben.widawsky@intel.com>
References: <20210202005948.241655-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=ben.widawsky@intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ben Widawsky <ben.widawsky@intel.com>, David Hildenbrand <david@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 "John Groves \(jgroves\)" <jgroves@micron.com>,
 Chris Browy <cbrowy@avery-design.com>, Markus Armbruster <armbru@redhat.com>,
 linux-cxl@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This should introduce no change. Subsequent work will make use of this
new class member.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/cxl/cxl-mailbox-utils.c  |  4 ++++
 hw/mem/cxl_type3.c          | 24 +++++++++---------------
 include/hw/cxl/cxl.h        |  1 -
 include/hw/cxl/cxl_device.h | 24 ++++++++++++++++++++++++
 4 files changed, 37 insertions(+), 16 deletions(-)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index dc8e0eb08e..2637250c7b 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -321,6 +321,9 @@ define_mailbox_handler(IDENTIFY_MEMORY_DEVICE)
     } __attribute__((packed)) *id;
     _Static_assert(sizeof(*id) == 0x43, "Bad identify size");
 
+    CXLType3Dev *ct3d = container_of(cxl_dstate, CXLType3Dev, cxl_dstate);
+    CXLType3Class *cvc = CXL_TYPE3_DEV_GET_CLASS(ct3d);
+
     if (memory_region_size(cxl_dstate->pmem) < (256 << 20)) {
         return CXL_MBOX_INTERNAL_ERROR;
     }
@@ -332,6 +335,7 @@ define_mailbox_handler(IDENTIFY_MEMORY_DEVICE)
     snprintf(id->fw_revision, 0x10, "BWFW VERSION %02d", 0);
     id->total_capacity = memory_region_size(cxl_dstate->pmem);
     id->persistent_capacity = memory_region_size(cxl_dstate->pmem);
+    id->lsa_size = cvc->get_lsa_size(ct3d);
 
     *len = sizeof(*id);
     return CXL_MBOX_SUCCESS;
diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index fe02c3b63c..074d1dd41f 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -13,21 +13,6 @@
 #include "sysemu/hostmem.h"
 #include "hw/cxl/cxl.h"
 
-typedef struct cxl_type3_dev {
-    /* Private */
-    PCIDevice parent_obj;
-
-    /* Properties */
-    uint64_t size;
-    HostMemoryBackend *hostmem;
-
-    /* State */
-    CXLComponentState cxl_cstate;
-    CXLDeviceState cxl_dstate;
-} CXLType3Dev;
-
-#define CT3(obj) OBJECT_CHECK(CXLType3Dev, (obj), TYPE_CXL_TYPE3_DEV)
-
 static void build_dvsecs(CXLType3Dev *ct3d)
 {
     CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
@@ -310,11 +295,17 @@ static void pc_dimm_md_fill_device_info(const MemoryDeviceState *md,
     info->type = MEMORY_DEVICE_INFO_KIND_CXL;
 }
 
+static uint64_t get_lsa_size(CXLType3Dev *ct3d)
+{
+    return 0;
+}
+
 static void ct3_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     PCIDeviceClass *pc = PCI_DEVICE_CLASS(oc);
     MemoryDeviceClass *mdc = MEMORY_DEVICE_CLASS(oc);
+    CXLType3Class *cvc = CXL_TYPE3_DEV_CLASS(oc);
 
     pc->realize = ct3_realize;
     pc->class_id = PCI_CLASS_STORAGE_EXPRESS;
@@ -332,11 +323,14 @@ static void ct3_class_init(ObjectClass *oc, void *data)
     mdc->fill_device_info = pc_dimm_md_fill_device_info;
     mdc->get_plugged_size = memory_device_get_region_size;
     mdc->set_addr = cxl_md_set_addr;
+
+    cvc->get_lsa_size = get_lsa_size;
 }
 
 static const TypeInfo ct3d_info = {
     .name = TYPE_CXL_TYPE3_DEV,
     .parent = TYPE_PCI_DEVICE,
+    .class_size = sizeof(struct CXLType3Class),
     .class_init = ct3_class_init,
     .instance_size = sizeof(CXLType3Dev),
     .instance_init = ct3_instance_init,
diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 809ed7de60..c7ca42930f 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -23,4 +23,3 @@
 #define CXL_WINDOW_MAX 10
 
 #endif
-
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index ca5328a581..a79a0f106c 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -219,4 +219,28 @@ REG32(CXL_MEM_DEV_STS, 0)
     FIELD(CXL_MEM_DEV_STS, MBOX_READY, 4, 1)
     FIELD(CXL_MEM_DEV_STS, RESET_NEEDED, 5, 3)
 
+typedef struct cxl_type3_dev {
+    /* Private */
+    PCIDevice parent_obj;
+
+    /* Properties */
+    uint64_t size;
+    HostMemoryBackend *hostmem;
+    HostMemoryBackend *lsa;
+
+    /* State */
+    CXLComponentState cxl_cstate;
+    CXLDeviceState cxl_dstate;
+} CXLType3Dev;
+
+#define CT3(obj) OBJECT_CHECK(CXLType3Dev, (obj), TYPE_CXL_TYPE3_DEV)
+
+struct CXLType3Class {
+    /* Private */
+    PCIDeviceClass parent_class;
+
+    /* public */
+    uint64_t (*get_lsa_size)(CXLType3Dev *ct3d);
+};
+
 #endif
-- 
2.30.0



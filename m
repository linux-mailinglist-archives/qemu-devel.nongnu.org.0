Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B70514ECD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:13:04 +0200 (CEST)
Received: from localhost ([::1]:38926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSIp-0004Re-7x
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nkRyW-0001fY-MW
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:52:09 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nkRyS-0001Sh-DL
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:52:02 -0400
Received: from fraeml743-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Kqb3k44wZz67sHf;
 Fri, 29 Apr 2022 22:49:22 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml743-chm.china.huawei.com (10.206.15.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 16:51:58 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 15:51:57 +0100
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
Subject: [PATCH v10 21/45] hw/cxl/device: Implement get/set Label Storage Area
 (LSA)
Date: Fri, 29 Apr 2022 15:40:46 +0100
Message-ID: <20220429144110.25167-22-Jonathan.Cameron@huawei.com>
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

Implement get and set handlers for the Label Storage Area
used to hold data describing persistent memory configuration
so that it can be ensured it is seen in the same configuration
after reboot.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/cxl/cxl-mailbox-utils.c  | 60 +++++++++++++++++++++++++++++++++++++
 hw/mem/cxl_type3.c          | 56 +++++++++++++++++++++++++++++++++-
 include/hw/cxl/cxl_device.h |  5 ++++
 3 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 492739aef3..bb66c765a5 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -57,6 +57,8 @@ enum {
         #define MEMORY_DEVICE 0x0
     CCLS        = 0x41,
         #define GET_PARTITION_INFO     0x0
+        #define GET_LSA       0x2
+        #define SET_LSA       0x3
 };
 
 /* 8.2.8.4.5.1 Command Return Codes */
@@ -326,7 +328,62 @@ static ret_code cmd_ccls_get_partition_info(struct cxl_cmd *cmd,
     return CXL_MBOX_SUCCESS;
 }
 
+static ret_code cmd_ccls_get_lsa(struct cxl_cmd *cmd,
+                                 CXLDeviceState *cxl_dstate,
+                                 uint16_t *len)
+{
+    struct {
+        uint32_t offset;
+        uint32_t length;
+    } QEMU_PACKED *get_lsa;
+    CXLType3Dev *ct3d = container_of(cxl_dstate, CXLType3Dev, cxl_dstate);
+    CXLType3Class *cvc = CXL_TYPE3_GET_CLASS(ct3d);
+    uint32_t offset, length;
+
+    get_lsa = (void *)cmd->payload;
+    offset = get_lsa->offset;
+    length = get_lsa->length;
+
+    if (offset + length > cvc->get_lsa_size(ct3d)) {
+        *len = 0;
+        return CXL_MBOX_INVALID_INPUT;
+    }
+
+    *len = cvc->get_lsa(ct3d, get_lsa, length, offset);
+    return CXL_MBOX_SUCCESS;
+}
+
+static ret_code cmd_ccls_set_lsa(struct cxl_cmd *cmd,
+                                 CXLDeviceState *cxl_dstate,
+                                 uint16_t *len)
+{
+    struct set_lsa_pl {
+        uint32_t offset;
+        uint32_t rsvd;
+        uint8_t data[];
+    } QEMU_PACKED;
+    struct set_lsa_pl *set_lsa_payload = (void *)cmd->payload;
+    CXLType3Dev *ct3d = container_of(cxl_dstate, CXLType3Dev, cxl_dstate);
+    CXLType3Class *cvc = CXL_TYPE3_GET_CLASS(ct3d);
+    const size_t hdr_len = offsetof(struct set_lsa_pl, data);
+    uint16_t plen = *len;
+
+    *len = 0;
+    if (!plen) {
+        return CXL_MBOX_SUCCESS;
+    }
+
+    if (set_lsa_payload->offset + plen > cvc->get_lsa_size(ct3d) + hdr_len) {
+        return CXL_MBOX_INVALID_INPUT;
+    }
+    plen -= hdr_len;
+
+    cvc->set_lsa(ct3d, set_lsa_payload->data, plen, set_lsa_payload->offset);
+    return CXL_MBOX_SUCCESS;
+}
+
 #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
+#define IMMEDIATE_DATA_CHANGE (1 << 2)
 #define IMMEDIATE_POLICY_CHANGE (1 << 3)
 #define IMMEDIATE_LOG_CHANGE (1 << 4)
 
@@ -349,6 +406,9 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
         cmd_identify_memory_device, 0, 0 },
     [CCLS][GET_PARTITION_INFO] = { "CCLS_GET_PARTITION_INFO",
         cmd_ccls_get_partition_info, 0, 0 },
+    [CCLS][GET_LSA] = { "CCLS_GET_LSA", cmd_ccls_get_lsa, 0, 0 },
+    [CCLS][SET_LSA] = { "CCLS_SET_LSA", cmd_ccls_set_lsa,
+        ~0, IMMEDIATE_CONFIG_CHANGE | IMMEDIATE_DATA_CHANGE },
 };
 
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index b5aa1067df..6c6ed9a776 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -8,6 +8,7 @@
 #include "qapi/error.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qemu/pmem.h"
 #include "qemu/range.h"
 #include "qemu/rcu.h"
 #include "sysemu/hostmem.h"
@@ -113,6 +114,11 @@ static bool cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
     host_memory_backend_set_mapped(ct3d->hostmem, true);
     ct3d->cxl_dstate.pmem_size = ct3d->hostmem->size;
 
+    if (!ct3d->lsa) {
+        error_setg(errp, "lsa property must be set");
+        return false;
+    }
+
     return true;
 }
 
@@ -176,12 +182,58 @@ static void ct3d_reset(DeviceState *dev)
 static Property ct3_props[] = {
     DEFINE_PROP_LINK("memdev", CXLType3Dev, hostmem, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
+    DEFINE_PROP_LINK("lsa", CXLType3Dev, lsa, TYPE_MEMORY_BACKEND,
+                     HostMemoryBackend *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
 static uint64_t get_lsa_size(CXLType3Dev *ct3d)
 {
-    return 0;
+    MemoryRegion *mr;
+
+    mr = host_memory_backend_get_memory(ct3d->lsa);
+    return memory_region_size(mr);
+}
+
+static void validate_lsa_access(MemoryRegion *mr, uint64_t size,
+                                uint64_t offset)
+{
+    assert(offset + size <= memory_region_size(mr));
+    assert(offset + size > offset);
+}
+
+static uint64_t get_lsa(CXLType3Dev *ct3d, void *buf, uint64_t size,
+                    uint64_t offset)
+{
+    MemoryRegion *mr;
+    void *lsa;
+
+    mr = host_memory_backend_get_memory(ct3d->lsa);
+    validate_lsa_access(mr, size, offset);
+
+    lsa = memory_region_get_ram_ptr(mr) + offset;
+    memcpy(buf, lsa, size);
+
+    return size;
+}
+
+static void set_lsa(CXLType3Dev *ct3d, const void *buf, uint64_t size,
+                    uint64_t offset)
+{
+    MemoryRegion *mr;
+    void *lsa;
+
+    mr = host_memory_backend_get_memory(ct3d->lsa);
+    validate_lsa_access(mr, size, offset);
+
+    lsa = memory_region_get_ram_ptr(mr) + offset;
+    memcpy(lsa, buf, size);
+    memory_region_set_dirty(mr, offset, size);
+
+    /*
+     * Just like the PMEM, if the guest is not allowed to exit gracefully, label
+     * updates will get lost.
+     */
 }
 
 static void ct3_class_init(ObjectClass *oc, void *data)
@@ -203,6 +255,8 @@ static void ct3_class_init(ObjectClass *oc, void *data)
     device_class_set_props(dc, ct3_props);
 
     cvc->get_lsa_size = get_lsa_size;
+    cvc->get_lsa = get_lsa;
+    cvc->set_lsa = set_lsa;
 }
 
 static const TypeInfo ct3d_info = {
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index ea2571a69b..4285fbda08 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -252,6 +252,11 @@ struct CXLType3Class {
 
     /* public */
     uint64_t (*get_lsa_size)(CXLType3Dev *ct3d);
+
+    uint64_t (*get_lsa)(CXLType3Dev *ct3d, void *buf, uint64_t size,
+                        uint64_t offset);
+    void (*set_lsa)(CXLType3Dev *ct3d, const void *buf, uint64_t size,
+                    uint64_t offset);
 };
 
 #endif
-- 
2.32.0



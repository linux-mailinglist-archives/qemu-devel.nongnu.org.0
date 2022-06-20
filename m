Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4803955222A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:22:29 +0200 (CEST)
Received: from localhost ([::1]:57184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3KAW-0001Sy-Da
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o3K9G-0000IR-O6
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:21:10 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o3K9E-0004E1-5V
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:21:10 -0400
Received: from fraeml701-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LRZXt71vKz67MLx;
 Tue, 21 Jun 2022 00:17:02 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml701-chm.china.huawei.com (10.206.15.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Mon, 20 Jun 2022 18:20:52 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 20 Jun 2022 17:20:51 +0100
To: <qemu-devel@nongnu.org>, <alison.schofield@intel.com>,
 <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>
CC: <shiju.jose@huawei.com>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>
Subject: [RFC PATCH] hw/cxl: Initial poison injection support.
Date: Mon, 20 Jun 2022 17:20:56 +0100
Message-ID: <20220620162056.16790-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml738-chm.china.huawei.com (10.201.108.188) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Inject poison using qom-set to first set the poison_start
and poison_length followed by writing to poison_inject to
add to the poison list.

For now, the poison is not returned CXL.mem reads, but only via
the mailbox command Get Poison List.

See CXL 2.0, sec 8.2.9.5.4.1 Get Poison list (Opcode 4300h)

Kernel patches to use this interface here:
https://lore.kernel.org/linux-cxl/cover.1655250669.git.alison.schofield@intel.com

RFC for now as likely the implementation will change as
support for mailbox based poison injection and media scanning are added.

To inject poison using the qemu monitor commands such as:

(qemu) qom-set /machine/unattached/device[61]/cxl.1/child[0]/root_port1/child[0] poison_start 0x500
(qemu) qom-set /machine/unattached/device[61]/cxl.1/child[0]/root_port1/child[0] poison_length 0x200
(qemu) qom-set /machine/unattached/device[61]/cxl.1/child[0]/root_port1/child[0] poison_inject 0x1

Adjusted for the appropriate topology of your machine.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---

 hw/cxl/cxl-mailbox-utils.c  | 85 +++++++++++++++++++++++++++++++++++++
 hw/mem/cxl_type3.c          | 30 +++++++++++++
 include/hw/cxl/cxl_device.h | 14 ++++++
 3 files changed, 129 insertions(+)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index bb66c765a5..487348c67d 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -59,6 +59,8 @@ enum {
         #define GET_PARTITION_INFO     0x0
         #define GET_LSA       0x2
         #define SET_LSA       0x3
+    MEDIA_AND_POISON = 0x43,
+        #define GET_POISON_LIST        0x0
 };
 
 /* 8.2.8.4.5.1 Command Return Codes */
@@ -296,6 +298,7 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
     id->total_capacity = size / (256 << 20);
     id->persistent_capacity = size / (256 << 20);
     id->lsa_size = cvc->get_lsa_size(ct3d);
+    id->poison_list_max_mer[1] = 0x1; /* 256 poison records */
 
     *len = sizeof(*id);
     return CXL_MBOX_SUCCESS;
@@ -382,6 +385,86 @@ static ret_code cmd_ccls_set_lsa(struct cxl_cmd *cmd,
     return CXL_MBOX_SUCCESS;
 }
 
+/*
+ * This is very inefficient, but good enough for now!
+ * Also thed payload will always fit, so no need to handle the MORE flag and
+ * make this stateful.
+ */
+static ret_code cmd_media_get_poison_list(struct cxl_cmd *cmd,
+                                          CXLDeviceState *cxl_dstate,
+                                          uint16_t *len)
+{
+    struct get_poison_list_pl {
+        uint64_t pa;
+        uint64_t length;
+    } QEMU_PACKED;
+
+    struct get_poison_list_out_pl {
+        uint8_t flags;
+        uint8_t rsvd1;
+        uint64_t overflow_timestamp;
+        uint16_t count;
+        uint8_t rsvd2[0x14];
+        struct {
+            uint64_t addr;
+            uint32_t length;
+            uint32_t resv;
+        } QEMU_PACKED records[];
+    } QEMU_PACKED;
+
+    struct get_poison_list_pl *in = (void *)cmd->payload;
+    struct get_poison_list_out_pl *out = (void *)cmd->payload;
+    CXLType3Dev *ct3d = container_of(cxl_dstate, CXLType3Dev, cxl_dstate);
+    CXLType3Class *cvc = CXL_TYPE3_GET_CLASS(ct3d);
+    uint16_t record_count = 0, i = 0;
+    uint64_t query_start = in->pa;
+    uint64_t query_length = in->length;
+    CXLPoisonList *poison_list;
+    CXLPoison *ent;
+    uint16_t out_pl_len;
+
+    poison_list = cvc->get_poison_list(ct3d);
+
+    QLIST_FOREACH(ent, poison_list, node) {
+        /* Check for no overlap */
+        if (ent->start >= query_start + query_length ||
+            ent->start + ent->length <= query_start) {
+            continue;
+        }
+        if (record_count == 256) {
+            /* For now just return 256 max */
+            break;
+        }
+        record_count++;
+    }
+    out_pl_len = sizeof(*out) + record_count * sizeof(out->records[0]);
+    assert(out_pl_len > CXL_MAILBOX_MAX_PAYLOAD_SIZE);
+
+    memset(out, 0, out_pl_len);
+    QLIST_FOREACH(ent, poison_list, node) {
+        uint64_t start, stop;
+
+        /* Check for no overlap */
+        if (ent->start >= query_start + query_length ||
+            ent->start + ent->length <= query_start) {
+            continue;
+        }
+        if (i == 256) {
+            break;
+        }
+        /* Deal with overlap */
+        start = MAX(ent->start & 0xffffffffffffffc0, query_start);
+        stop = MIN((ent->start & 0xffffffffffffffc0) + ent->length,
+                   query_start + query_length);
+        out->records[i].addr = start | 0x2; /* internal error */
+        out->records[i].length = (stop - start) / 64;
+        i++;
+    }
+    out->count = record_count;
+    *len = out_pl_len;
+    return CXL_MBOX_SUCCESS;
+}
+
 #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
 #define IMMEDIATE_DATA_CHANGE (1 << 2)
 #define IMMEDIATE_POLICY_CHANGE (1 << 3)
@@ -409,6 +492,8 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
     [CCLS][GET_LSA] = { "CCLS_GET_LSA", cmd_ccls_get_lsa, 0, 0 },
     [CCLS][SET_LSA] = { "CCLS_SET_LSA", cmd_ccls_set_lsa,
         ~0, IMMEDIATE_CONFIG_CHANGE | IMMEDIATE_DATA_CHANGE },
+    [MEDIA_AND_POISON][GET_POISON_LIST] = { "MEDIA_AND_POISON_GET_POISON_LIST",
+        cmd_media_get_poison_list, 16, 0 },
 };
 
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 3bf2869573..c02f3eb231 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -133,6 +133,19 @@ static bool cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
     return true;
 }
 
+static void ct3_inject_poison(Object *obj, Visitor *v, const char *name,
+                              void *opaque, Error **errp)
+{
+    CXLType3Dev *ct3d = CXL_TYPE3(obj);
+    CXLPoison *p = g_new0(CXLPoison, 1);
+    /* should check if bool is true, but meh */
+
+    p->length = ct3d->poison_length;
+    p->start = ct3d->poison_start;
+
+    QLIST_INSERT_HEAD(&ct3d->poison_list, p, node);
+}
+
 static void ct3_realize(PCIDevice *pci_dev, Error **errp)
 {
     CXLType3Dev *ct3d = CXL_TYPE3(pci_dev);
@@ -141,6 +154,15 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     MemoryRegion *mr = &regs->component_registers;
     uint8_t *pci_conf = pci_dev->config;
 
+    object_property_add_uint64_ptr(OBJECT(pci_dev), "poison_start",
+                                   &ct3d->poison_start,
+                                   OBJ_PROP_FLAG_READ | OBJ_PROP_FLAG_WRITE);
+    object_property_add_uint64_ptr(OBJECT(pci_dev), "poison_length",
+                                   &ct3d->poison_length,
+                                   OBJ_PROP_FLAG_READ | OBJ_PROP_FLAG_WRITE);
+    object_property_add(OBJECT(pci_dev), "poison_inject", "bool", NULL,
+                        ct3_inject_poison, NULL, ct3d);
+
     if (!cxl_setup_memory(ct3d, errp)) {
         return;
     }
@@ -327,6 +349,12 @@ static void set_lsa(CXLType3Dev *ct3d, const void *buf, uint64_t size,
      */
 }
 
+static CXLPoisonList *get_poison_list(CXLType3Dev *ct3d)
+{
+    /* This will get more complex  - for now it's a bit pointless */
+    return &ct3d->poison_list;
+}
+
 static void ct3_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -348,6 +376,8 @@ static void ct3_class_init(ObjectClass *oc, void *data)
     cvc->get_lsa_size = get_lsa_size;
     cvc->get_lsa = get_lsa;
     cvc->set_lsa = set_lsa;
+    cvc->get_poison_list = get_poison_list;
+
 }
 
 static const TypeInfo ct3d_info = {
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 1e141b6621..bbf1ce8736 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -230,6 +230,14 @@ REG64(CXL_MEM_DEV_STS, 0)
     FIELD(CXL_MEM_DEV_STS, MBOX_READY, 4, 1)
     FIELD(CXL_MEM_DEV_STS, RESET_NEEDED, 5, 3)
 
+typedef struct CXLPoison {
+    uint64_t start, length;
+    uint8_t type;
+    QLIST_ENTRY(CXLPoison) node;
+} CXLPoison;
+
+typedef QLIST_HEAD(, CXLPoison) CXLPoisonList;
+
 struct CXLType3Dev {
     /* Private */
     PCIDevice parent_obj;
@@ -242,6 +250,10 @@ struct CXLType3Dev {
     AddressSpace hostmem_as;
     CXLComponentState cxl_cstate;
     CXLDeviceState cxl_dstate;
+
+    /* Poison Injection - cache */
+    uint64_t poison_start, poison_length;
+    CXLPoisonList poison_list;
 };
 
 #define TYPE_CXL_TYPE3 "cxl-type3"
@@ -258,6 +270,8 @@ struct CXLType3Class {
                         uint64_t offset);
     void (*set_lsa)(CXLType3Dev *ct3d, const void *buf, uint64_t size,
                     uint64_t offset);
+
+    CXLPoisonList* (*get_poison_list)(CXLType3Dev *ct3d);
 };
 
 MemTxResult cxl_type3_read(PCIDevice *d, hwaddr host_addr, uint64_t *data,
-- 
2.32.0



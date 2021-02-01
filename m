Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B544C30AB24
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:25:47 +0100 (CET)
Received: from localhost ([::1]:44364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6b5G-00010X-Ox
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6b0S-0003hI-I7
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:20:48 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6b0P-0003JF-TX
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:20:48 -0500
Received: from fraeml742-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DTs4W6JZKz67jCc;
 Mon,  1 Feb 2021 23:17:15 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml742-chm.china.huawei.com (10.206.15.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 1 Feb 2021 16:20:43 +0100
Received: from lhrphicprd00229.huawei.com (10.123.41.22) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 1 Feb 2021 15:20:42 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 2/4] hw/pci/pcie_doe: Introduce utility functions for PCIe
 DOE
Date: Mon, 1 Feb 2021 23:16:27 +0800
Message-ID: <20210201151629.29656-3-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20210201151629.29656-1-Jonathan.Cameron@huawei.com>
References: <20210201151629.29656-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.41.22]
X-ClientProxiedBy: lhreml751-chm.china.huawei.com (10.201.108.201) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Vishal
 Verma <vishal.l.verma@intel.com>, f.fangjian@huawei.com,
 Chris Browy <cbrowy@avery-design.com>, f4bug@amsat.org, linuxarm@openeuler.org,
 jcm@redhat.com, Prashant V Agarwal <agpr123@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This implements the ECN to the PCI 5.0 specification available at
https://members.pcisig.com/wg/PCI-SIG/document/14143

Does not currently support interrupts.

Note that currently no attempt is made to clean up allocated memory.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/pci/meson.build       |   2 +-
 hw/pci/pcie_doe.c        | 257 +++++++++++++++++++++++++++++++++++++++
 include/hw/pci/doe.h     |  40 ++++++
 include/hw/pci/pci_ids.h |   2 +
 4 files changed, 300 insertions(+), 1 deletion(-)

diff --git a/hw/pci/meson.build b/hw/pci/meson.build
index 5c4bbac817..7336620ee3 100644
--- a/hw/pci/meson.build
+++ b/hw/pci/meson.build
@@ -11,7 +11,7 @@ pci_ss.add(files(
 # The functions in these modules can be used by devices too.  Since we
 # allow plugging PCIe devices into PCI buses, include them even if
 # CONFIG_PCI_EXPRESS=n.
-pci_ss.add(files('pcie.c', 'pcie_aer.c'))
+pci_ss.add(files('pcie.c', 'pcie_aer.c',  'pcie_doe.c'))
 softmmu_ss.add(when: 'CONFIG_PCI_EXPRESS', if_true: files('pcie_port.c', 'pcie_host.c'))
 softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
 
diff --git a/hw/pci/pcie_doe.c b/hw/pci/pcie_doe.c
new file mode 100644
index 0000000000..8739c41280
--- /dev/null
+++ b/hw/pci/pcie_doe.c
@@ -0,0 +1,257 @@
+/*
+ * pcie_doe.c
+ * utility functions for pci express data object exchange introduced
+ * in PCI 5.0 Data Object Exchange (DOE) ECN
+ *
+ * Copyright (c) 2021 Jonathan Cameron <Jonathan.Cameron@huawei.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu/error-report.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/doe.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/range.h"
+#include "qemu/rcu.h"
+#include "sysemu/hostmem.h"
+
+struct doe_handler {
+    uint16_t vendor_id;
+    uint8_t object_type;
+    doe_msg_handler_t handler;
+    void *priv;
+};
+
+static void doe_set_ctl(PCIEDOE *doe, uint32_t val)
+{
+    /* Abort */
+    if (val & PCI_DOE_CTRL_DOE_ABORT) {
+        doe->req_index = 0;
+        doe->rsp_index = 0;
+        doe->req_length = 0;
+        doe->error = false;
+        doe->data_object_ready = false;
+    }
+
+    if (val & PCI_DOE_CTRL_DOE_GO) {
+        GList *l;
+        uint16_t vendor_id = doe->store[0] & PCI_DATA_OBJ_DW0_VID;
+        uint8_t object_type = (doe->store[0] & PCI_DATA_OBJ_DW0_TYPE) >>
+            ctz32(PCI_DATA_OBJ_DW0_TYPE);
+        if ((doe->req_index != 3) || (doe->req_length != 3)) {
+            /*
+             * Not entirely clear what should happen if req_length is correct
+             * buf insufficient data has been received.
+             */
+            doe->error = true;
+            return;
+        }
+        /* Discovery protocol - DOE ECN */
+        if (vendor_id == PCI_VENDOR_ID_PCI_SIG &&
+            object_type == PCI_DOE_DIS_OBJ_TYPE) {
+            uint8_t index = doe->store[2] & PCI_DOE_DIS_REQ_D0_DW0_INDEX;
+            doe->store[1] = 3;
+            if (index == 0) {
+                /* First entry is this one, the discovery protocol itself */
+                uint8_t next;
+
+                if (doe->cb_list) {
+                    next = index + 1;
+                } else {
+                    next = 0;
+                }
+                doe->store[2] =
+                    (next << ctz32(PCI_DOE_DIS_RSP_D0_DW0_NEXT_INDEX)) |
+                    (0 << ctz32(PCI_DOE_DIS_RSP_D0_DW0_PROT)) |
+                    0x0001;
+            } else {
+                /* Other entries based on register callbacks */
+                uint8_t next;
+                struct doe_handler *h;
+
+                h = g_list_nth_data(doe->cb_list, index - 1);
+                /*
+                 * Off end of list, Table 7-x4 in DOE ECN -
+                 * Vendor ID 0xFFFF if no more indices
+                 */
+                if (h == NULL) {
+                    doe->store[2] = 0xFFFF;
+                } else {
+                    if (g_list_nth(doe->cb_list, index)) {
+                        next = index + 1;
+                    } else {
+                        next = 0;
+                    }
+                    doe->store[2] =
+                        (next << ctz32(PCI_DOE_DIS_RSP_D0_DW0_NEXT_INDEX)) |
+                        (h->object_type << ctz32(PCI_DOE_DIS_RSP_D0_DW0_PROT)) |
+                        h->vendor_id;
+                }
+            }
+            doe->data_object_ready = true;
+            doe->rsp_index = 0;
+        } else {
+            for (l = doe->cb_list; l != NULL; l = l->next) {
+                struct doe_handler *h = l->data;
+                if (h->vendor_id == vendor_id &&
+                    h->object_type == object_type) {
+                    int ret = h->handler(doe, h->vendor_id, h->object_type,
+                                         h->priv);
+                    if (ret) {
+                        /*
+                         * No response so as per 6.xx.1 in DOE ECN
+                         * "... within 1 second after the DOE Go bit was Set
+                         *  in the DOE Control register, otherwise the DOE
+                         *  instance must Set the DOE Error bit in the DOE
+                         *  Status register.."
+                         */
+                         doe->error = true;
+                        break;
+                    }
+                    doe->data_object_ready = true;
+                    doe->rsp_index = 0;
+                    break;
+                }
+            }
+            /* Comamnd not handled */
+            if (l == NULL) {
+                doe->error = true;
+            }
+        }
+        /* Reset input index to allow for a new message */
+        doe->req_index = 0;
+    }
+}
+
+static void doe_set_write_mailbox(PCIEDOE *doe, uint32_t val)
+{
+    if (doe->req_index == 1) {
+        if (val & 0x3FFFF) {
+            doe->req_length = val & PCI_DATA_OBJ_DW1_LEN;
+        } else {
+            doe->req_length = 1 << 18;
+        }
+    }
+    if (doe->req_length && doe->req_index == doe->req_length) {
+        /*
+         * 6.xx.1 Data Objects
+         * If the DW transferred does not match the indicated Length
+         * for a data object, then the data object must be
+         * silently discarded
+         */
+        return;
+    }
+    doe->store[doe->req_index] = val;
+    doe->req_index++;
+}
+
+static uint32_t doe_get_read_mailbox(PCIEDOE *doe)
+{
+    uint32_t val;
+
+    if (doe->rsp_index == 0) {
+        doe->rsp_length = doe->store[1] & PCI_DATA_OBJ_DW1_LEN;
+    }
+    if (!doe->data_object_ready) {
+        /* Underflow of the Read Data Mailbox Mechanism */
+        doe->error = true;
+        return 0;
+    }
+
+    val = doe->store[doe->rsp_index];
+    doe->rsp_index++;
+    if (doe->rsp_index == doe->rsp_length) {
+        doe->rsp_index = -1;
+        doe->data_object_ready = false;
+    }
+
+    return val;
+}
+
+static uint32_t doe_get_status(PCIEDOE *doe)
+{
+    uint32_t val = 0;
+
+    if (doe->busy) {
+        val |= PCI_DOE_STATUS_DOE_BUSY;
+    }
+    /* bit 1: interrupt not yet supported */
+    if (doe->error) {
+        val |= PCI_DOE_STATUS_DOE_ERROR;
+    }
+    if (doe->data_object_ready) {
+        val |= PCI_DOE_STATUS_DATA_OBJECT_READY;
+    }
+
+    return val;
+}
+
+void doe_add_message_handler(PCIEDOE *doe, uint16_t vendor_id,
+                             uint8_t object_type,
+                             const doe_msg_handler_t handler, void *priv)
+{
+    struct doe_handler *h = g_malloc0(sizeof(*handler));
+
+    h->vendor_id = vendor_id;
+    h->object_type = object_type;
+    h->handler = handler;
+    h->priv = priv;
+    doe->cb_list = g_list_append(doe->cb_list, h);
+}
+
+uint32_t pcie_doe_ecap(PCIEDOE *doe, PCIDevice *d, uint16_t offset)
+{
+    doe->doe_base = offset;
+    /* Length field is 18 bits and is in dwords */
+    doe->store = g_malloc0((1 << 18) * sizeof(uint32_t));
+
+    pcie_add_capability(d, PCI_EXT_CAP_ID_DOE, 1, offset, 0x18);
+    offset += 0x18;
+
+    return offset;
+}
+
+void pcie_doe_write(PCIEDOE *doe, uint32_t addr, uint32_t val, int len)
+{
+    if (len != 4) {
+        return;
+    }
+
+    switch (addr - doe->doe_base) {
+    case PCI_DOE_CTRL:
+        doe_set_ctl(doe, val);
+        break;
+    case PCI_DOE_WRITE_MAILBOX:
+        doe_set_write_mailbox(doe, val);
+        break;
+    }
+}
+
+uint32_t pcie_doe_read(PCIEDOE *doe, uint32_t addr, int len, int *found)
+{
+    if (len != 4) {
+        *found = 0;
+        return 0;
+    }
+
+    *found = 1;
+    switch (addr - doe->doe_base) {
+    case PCI_DOE_CAP:
+        return 0; /* No interrupt support */
+    case PCI_DOE_STATUS:
+        return doe_get_status(doe);
+    case PCI_DOE_READ_MAILBOX:
+        return doe_get_read_mailbox(doe);
+    default:
+        *found = 0;
+        return 0;
+    }
+}
+
diff --git a/include/hw/pci/doe.h b/include/hw/pci/doe.h
new file mode 100644
index 0000000000..364c866c53
--- /dev/null
+++ b/include/hw/pci/doe.h
@@ -0,0 +1,40 @@
+/*
+ * PCIE DOE emulation.
+ *
+ * Copyright (c) 2021 Jonathan Cameron <Jonathan.Cameron@huawei.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_PCIE_DOE_H_
+#define QEMU_PCIE_DOE_H_
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+
+typedef struct pcie_doe {
+    uint32_t doe_base;
+    GList *cb_list;
+    int req_index;
+    int req_length;
+    int rsp_index;
+    int rsp_length;
+    bool data_object_ready;
+    bool error;
+    bool busy;
+    uint32_t *store;
+} PCIEDOE;
+
+typedef int (*doe_msg_handler_t)(PCIEDOE *doe, uint16_t vendor_id,
+                                 uint8_t object_type, void *priv);
+
+uint32_t pcie_doe_ecap(PCIEDOE *doe, PCIDevice *d, uint16_t offset);
+void doe_add_message_handler(PCIEDOE *doe, uint16_t vendor_id,
+                             uint8_t object_type,
+                             const doe_msg_handler_t handler, void *priv);
+uint32_t pcie_doe_read(PCIEDOE *doe, uint32_t addr, int len, int *found);
+void pcie_doe_write(PCIEDOE *doe, uint32_t addr, uint32_t val, int len);
+#endif
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 76bf3ed590..636b2e8017 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -157,6 +157,8 @@
 
 /* Vendors and devices.  Sort key: vendor first, device next. */
 
+#define PCI_VENDOR_ID_PCI_SIG            0x0001
+
 #define PCI_VENDOR_ID_LSI_LOGIC          0x1000
 #define PCI_DEVICE_ID_LSI_53C810         0x0001
 #define PCI_DEVICE_ID_LSI_53C895A        0x0012
-- 
2.19.1



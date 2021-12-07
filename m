Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BC546C1CA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 18:31:04 +0100 (CET)
Received: from localhost ([::1]:39138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mueIx-0008EN-Ch
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 12:31:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mueCJ-0000Oq-Lw
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 12:24:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mueC7-0002YY-7K
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 12:24:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638897834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Po9lNjDBPOxlq9Ie5Rv+U6C8zcmm3MqhbJoMWMQWLf0=;
 b=gLen/y9Kc5DEkTWkPO+8TgvDvXIF7LnS5Xez87b0k+LN11faDM1hNJsYbIZ3lFzgZG6RmF
 ssua8rnIiRMvA82/uAerGV8uJzm17HdUDPO+95fD8SX3bHVQecJ3fLEatd8Xra6gSQbn6q
 LGJLejYLBY+QliuTARPuCBJgp1jR0tU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-azmZltGrMAu0n3TuQ6NJwg-1; Tue, 07 Dec 2021 12:23:53 -0500
X-MC-Unique: azmZltGrMAu0n3TuQ6NJwg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC9B6760C0
 for <qemu-devel@nongnu.org>; Tue,  7 Dec 2021 17:23:52 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48F971346F;
 Tue,  7 Dec 2021 17:23:51 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 1/4] qtest/libqos: add a function to initialize secondary
 PCI buses
Date: Tue,  7 Dec 2021 18:23:39 +0100
Message-Id: <20211207172342.4058491-2-lvivier@redhat.com>
In-Reply-To: <20211207172342.4058491-1-lvivier@redhat.com>
References: <20211207172342.4058491-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Scan the PCI devices to find bridge and set PCI_SECONDARY_BUS and
PCI_SUBORDINATE_BUS (algorithm from seabios)

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/pci/pci_bridge.h |   8 +++
 tests/qtest/libqos/pci.c    | 118 ++++++++++++++++++++++++++++++++++++
 tests/qtest/libqos/pci.h    |   1 +
 3 files changed, 127 insertions(+)

diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index a94d350034bf..30691a6e5728 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -138,6 +138,7 @@ typedef struct PCIBridgeQemuCap {
     uint64_t mem_pref_64; /* Prefetchable memory to reserve (64-bit MMIO) */
 } PCIBridgeQemuCap;
 
+#define REDHAT_PCI_CAP_TYPE_OFFSET      3
 #define REDHAT_PCI_CAP_RESOURCE_RESERVE 1
 
 /*
@@ -152,6 +153,13 @@ typedef struct PCIResReserve {
     uint64_t mem_pref_64;
 } PCIResReserve;
 
+#define REDHAT_PCI_CAP_RES_RESERVE_BUS_RES     4
+#define REDHAT_PCI_CAP_RES_RESERVE_IO          8
+#define REDHAT_PCI_CAP_RES_RESERVE_MEM         16
+#define REDHAT_PCI_CAP_RES_RESERVE_PREF_MEM_32 20
+#define REDHAT_PCI_CAP_RES_RESERVE_PREF_MEM_64 24
+#define REDHAT_PCI_CAP_RES_RESERVE_CAP_SIZE    32
+
 int pci_bridge_qemu_reserve_cap_init(PCIDevice *dev, int cap_offset,
                                PCIResReserve res_reserve, Error **errp);
 
diff --git a/tests/qtest/libqos/pci.c b/tests/qtest/libqos/pci.c
index e1e96189c821..a0b606e25c71 100644
--- a/tests/qtest/libqos/pci.c
+++ b/tests/qtest/libqos/pci.c
@@ -13,6 +13,8 @@
 #include "qemu/osdep.h"
 #include "pci.h"
 
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_regs.h"
 #include "qemu/host-utils.h"
 #include "qgraph.h"
@@ -99,6 +101,122 @@ void qpci_device_init(QPCIDevice *dev, QPCIBus *bus, QPCIAddress *addr)
     g_assert(!addr->device_id || device_id == addr->device_id);
 }
 
+static uint8_t qpci_find_resource_reserve_capability(QPCIDevice *dev)
+{
+    uint16_t device_id;
+    uint8_t cap = 0;
+
+    if (qpci_config_readw(dev, PCI_VENDOR_ID) != PCI_VENDOR_ID_REDHAT) {
+        return 0;
+    }
+
+    device_id = qpci_config_readw(dev, PCI_DEVICE_ID);
+
+    if (device_id != PCI_DEVICE_ID_REDHAT_PCIE_RP &&
+        device_id != PCI_DEVICE_ID_REDHAT_BRIDGE) {
+        return 0;
+    }
+
+    do {
+        cap = qpci_find_capability(dev, PCI_CAP_ID_VNDR, cap);
+    } while (cap &&
+             qpci_config_readb(dev, cap + REDHAT_PCI_CAP_TYPE_OFFSET) !=
+             REDHAT_PCI_CAP_RESOURCE_RESERVE);
+    if (cap) {
+        uint8_t cap_len = qpci_config_readb(dev, cap + PCI_CAP_FLAGS);
+        if (cap_len < REDHAT_PCI_CAP_RES_RESERVE_CAP_SIZE) {
+            return 0;
+        }
+    }
+    return cap;
+}
+
+static void qpci_secondary_buses_rec(QPCIBus *qbus, int bus, int *pci_bus)
+{
+    QPCIDevice *dev;
+    uint16_t class;
+    uint8_t pribus, secbus, subbus;
+    int index;
+
+    for (index = 0; index < 32; index++) {
+        dev = qpci_device_find(qbus, QPCI_DEVFN(bus + index, 0));
+        if (dev == NULL) {
+            continue;
+        }
+        class = qpci_config_readw(dev, PCI_CLASS_DEVICE);
+        if (class == PCI_CLASS_BRIDGE_PCI) {
+            qpci_config_writeb(dev, PCI_SECONDARY_BUS, 255);
+            qpci_config_writeb(dev, PCI_SUBORDINATE_BUS, 0);
+        }
+        g_free(dev);
+    }
+
+    for (index = 0; index < 32; index++) {
+        dev = qpci_device_find(qbus, QPCI_DEVFN(bus + index, 0));
+        if (dev == NULL) {
+            continue;
+        }
+        class = qpci_config_readw(dev, PCI_CLASS_DEVICE);
+        if (class != PCI_CLASS_BRIDGE_PCI) {
+            continue;
+        }
+
+        pribus = qpci_config_readb(dev, PCI_PRIMARY_BUS);
+        if (pribus != bus) {
+            qpci_config_writeb(dev, PCI_PRIMARY_BUS, bus);
+        }
+
+        secbus = qpci_config_readb(dev, PCI_SECONDARY_BUS);
+        (*pci_bus)++;
+        if (*pci_bus != secbus) {
+            secbus = *pci_bus;
+            qpci_config_writeb(dev, PCI_SECONDARY_BUS, secbus);
+        }
+
+        subbus = qpci_config_readb(dev, PCI_SUBORDINATE_BUS);
+        qpci_config_writeb(dev, PCI_SUBORDINATE_BUS, 255);
+
+        qpci_secondary_buses_rec(qbus, secbus << 5, pci_bus);
+
+        if (subbus != *pci_bus) {
+            uint8_t res_bus = *pci_bus;
+            uint8_t cap = qpci_find_resource_reserve_capability(dev);
+
+            if (cap) {
+                uint32_t tmp_res_bus;
+
+                tmp_res_bus = qpci_config_readl(dev, cap +
+                                            REDHAT_PCI_CAP_RES_RESERVE_BUS_RES);
+                if (tmp_res_bus != (uint32_t)-1) {
+                    res_bus = tmp_res_bus & 0xFF;
+                    if ((uint8_t)(res_bus + secbus) < secbus ||
+                        (uint8_t)(res_bus + secbus) < res_bus) {
+                        res_bus = 0;
+                    }
+                    if (secbus + res_bus > *pci_bus) {
+                        res_bus = secbus + res_bus;
+                    }
+                }
+            }
+            subbus = res_bus;
+            *pci_bus = res_bus;
+        }
+
+        qpci_config_writeb(dev, PCI_SUBORDINATE_BUS, subbus);
+        g_free(dev);
+    }
+}
+
+int qpci_secondary_buses_init(QPCIBus *bus)
+{
+    int last_bus = 0;
+
+    qpci_secondary_buses_rec(bus, 0, &last_bus);
+
+    return last_bus;
+}
+
+
 void qpci_device_enable(QPCIDevice *dev)
 {
     uint16_t cmd;
diff --git a/tests/qtest/libqos/pci.h b/tests/qtest/libqos/pci.h
index ee64fdecbda8..becb800f9e6a 100644
--- a/tests/qtest/libqos/pci.h
+++ b/tests/qtest/libqos/pci.h
@@ -81,6 +81,7 @@ void qpci_device_foreach(QPCIBus *bus, int vendor_id, int device_id,
                          void *data);
 QPCIDevice *qpci_device_find(QPCIBus *bus, int devfn);
 void qpci_device_init(QPCIDevice *dev, QPCIBus *bus, QPCIAddress *addr);
+int qpci_secondary_buses_init(QPCIBus *bus);
 
 bool qpci_has_buggy_msi(QPCIDevice *dev);
 bool qpci_check_buggy_msi(QPCIDevice *dev);
-- 
2.33.1



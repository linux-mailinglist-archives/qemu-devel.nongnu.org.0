Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AC1456C27
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:12:35 +0100 (CET)
Received: from localhost ([::1]:49138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnzwf-0006bm-DB
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:12:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mnzsr-0003kt-2k
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:08:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mnzso-0003pW-M0
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:08:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637312913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7lCIBCzyW1VprGHqSSOJCGP/x8FvLGwEVaBdWdWlK9M=;
 b=GdCSjvzxR1RANzAEoiTivIkhsdt2yRmgTpvzsj9xiIcZLjcbfJGc1b9uIG0PmzMytnCDRj
 g0g9iKsg9bSpXjdYKgrf4k8ATVJAcNNYQ6o2iqNEru0oSjZ0gmCF9SMBYeA8ltobWPFBoZ
 fwJPWRXdCjnvFhWXMaUQfJcDnMaVZTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-05VXKAU_NXmysdI5yKm4cA-1; Fri, 19 Nov 2021 04:08:30 -0500
X-MC-Unique: 05VXKAU_NXmysdI5yKm4cA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D750F804141;
 Fri, 19 Nov 2021 09:08:29 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D35E562A41;
 Fri, 19 Nov 2021 09:07:54 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/4] qtest/libqos: add a function to initialize secondary
 PCI buses
Date: Fri, 19 Nov 2021 10:07:15 +0100
Message-Id: <20211119090718.440793-2-lvivier@redhat.com>
In-Reply-To: <20211119090718.440793-1-lvivier@redhat.com>
References: <20211119090718.440793-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Michael Roth <michael.roth@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Scan the PCI devices to find bridge and set PCI_SECONDARY_BUS and
PCI_SUBORDINATE_BUS (algorithm from seabios)

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
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
index e1e96189c821..3f0b18f4750b 100644
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
+    int i;
+
+    for (i = 0; i < 32; i++) {
+        dev = qpci_device_find(qbus, QPCI_DEVFN(bus + i, 0));
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
+    for (i = 0; i < 32; i++) {
+        dev = qpci_device_find(qbus, QPCI_DEVFN(bus + i, 0));
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 308A75FA7D4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 00:48:54 +0200 (CEST)
Received: from localhost ([::1]:34128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi1Zt-0004ai-99
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 18:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1oi1I9-0005wr-8S
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 18:30:34 -0400
Received: from mga02.intel.com ([134.134.136.20]:24675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1oi1I7-0005Dj-AV
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 18:30:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665441031; x=1696977031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oFuJH3V9v+i1P+Dh0Wc+EVn5PyOw5woJfSZ6SrKW7v0=;
 b=VCfw2yuP9M1hX+OBPP6Nro73m5dV3v/0h++2u2sJAT5KgW/XM+cSE8Po
 bYKXQo2njBrpHPFK1AQNFXkmiKwHS9rEPZh9xKb8nr1vZlpb2YyKNoRPv
 kyrBCcPi7IbM2qR/aySfR87e/7rqwjHTUEdJjq6FgjsEyV6nIlKccLw2N
 ZzVT0uqaApbmq68WIwPaUyAaKfusknOmCypBVFgdZjdQg8FlwfXiUxam4
 acSY3fUXrCW5Hh6a6BD860GIX+yBSVAoeN5QNmzq2QUWj1KqATIYxB0xl
 Z/iRrylrnuJpiRCOZxrq7HDwbRYXXJZtvLrQ8S0Z3rOiHE+4z3AA6pPT6 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="291661250"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="291661250"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 15:30:21 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="628457013"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="628457013"
Received: from iweiny-mobl.amr.corp.intel.com (HELO localhost) ([10.212.104.4])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 15:30:21 -0700
From: ira.weiny@intel.com
To: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Ira Weiny <ira.weiny@intel.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org
Subject: [RFC PATCH 5/6] hw/cxl/cxl-events: Add event interrupt support
Date: Mon, 10 Oct 2022 15:29:43 -0700
Message-Id: <20221010222944.3923556-6-ira.weiny@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221010222944.3923556-1-ira.weiny@intel.com>
References: <20221010222944.3923556-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=ira.weiny@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 10 Oct 2022 18:44:32 -0400
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

From: Ira Weiny <ira.weiny@intel.com>

To facilitate testing of event interrupt support add a QMP HMP command
to reset the event logs and issue interrupts when the guest has enabled
those interrupts.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 hmp-commands.hx             | 14 +++++++
 hw/cxl/cxl-events.c         | 82 +++++++++++++++++++++++++++++++++++++
 hw/cxl/cxl-host-stubs.c     |  5 +++
 hw/mem/cxl_type3.c          |  7 +++-
 include/hw/cxl/cxl_device.h |  3 ++
 include/sysemu/sysemu.h     |  3 ++
 6 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 564f1de364df..c59a98097317 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1266,6 +1266,20 @@ SRST
   Inject PCIe AER error
 ERST
 
+    {
+        .name       = "cxl_event_inject",
+        .args_type  = "id:s",
+        .params     = "id <error_status>",
+        .help       = "inject cxl events and interrupt\n\t\t\t"
+                      "<id> = qdev device id\n\t\t\t",
+        .cmd        = hmp_cxl_event_inject,
+    },
+
+SRST
+``cxl_event_inject``
+  Inject CXL Events
+ERST
+
     {
         .name       = "netdev_add",
         .args_type  = "netdev:O",
diff --git a/hw/cxl/cxl-events.c b/hw/cxl/cxl-events.c
index c275280bcb64..6ece6f252462 100644
--- a/hw/cxl/cxl-events.c
+++ b/hw/cxl/cxl-events.c
@@ -10,8 +10,14 @@
 #include <stdint.h>
 
 #include "qemu/osdep.h"
+#include "sysemu/sysemu.h"
+#include "monitor/monitor.h"
 #include "qemu/bswap.h"
 #include "qemu/typedefs.h"
+#include "qapi/qmp/qdict.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
 #include "hw/cxl/cxl.h"
 #include "hw/cxl/cxl_events.h"
 
@@ -68,6 +74,11 @@ uint16_t log_overflow(struct cxl_event_log *log)
     return cnt;
 }
 
+static void reset_log(struct cxl_event_log *log)
+{
+    log->cur_event = 0;
+}
+
 #define CXL_EVENT_RECORD_FLAG_PERMANENT         BIT(2)
 #define CXL_EVENT_RECORD_FLAG_MAINT_NEEDED      BIT(3)
 #define CXL_EVENT_RECORD_FLAG_PERF_DEGRADED     BIT(4)
@@ -246,3 +257,74 @@ void cxl_mock_add_event_logs(CXLDeviceState *cxlds)
     event_store_add_event(cxlds, CXL_EVENT_TYPE_FATAL,
                           (struct cxl_event_record_raw *)&dram);
 }
+
+static void cxl_reset_all_logs(CXLDeviceState *cxlds)
+{
+    int i;
+
+    for (i = 0; i < CXL_EVENT_TYPE_MAX; i++) {
+        struct cxl_event_log *log = find_event_log(cxlds, i);
+
+        if (!log) {
+            continue;
+        }
+
+        reset_log(log);
+    }
+}
+
+static void cxl_event_irq_assert(PCIDevice *pdev)
+{
+    CXLType3Dev *ct3d = container_of(pdev, struct CXLType3Dev, parent_obj);
+    CXLDeviceState *cxlds = &ct3d->cxl_dstate;
+    int i;
+
+    for (i = 0; i < CXL_EVENT_TYPE_MAX; i++) {
+        struct cxl_event_log *log;
+
+        log = find_event_log(cxlds, i);
+        if (!log || !log->irq_enabled || log_empty(log)) {
+            continue;
+        }
+
+        /* Notifies interrupt, legacy IRQ is not supported */
+        if (msix_enabled(pdev)) {
+            msix_notify(pdev, log->irq_vec);
+        } else if (msi_enabled(pdev)) {
+            msi_notify(pdev, log->irq_vec);
+        }
+    }
+}
+
+static int do_cxl_event_inject(Monitor *mon, const QDict *qdict)
+{
+    const char *id = qdict_get_str(qdict, "id");
+    CXLType3Dev *ct3d;
+    PCIDevice *pdev;
+    int ret;
+
+    ret = pci_qdev_find_device(id, &pdev);
+    if (ret < 0) {
+        monitor_printf(mon,
+                       "id or cxl device path is invalid or device not "
+                       "found. %s\n", id);
+        return ret;
+    }
+
+    ct3d = container_of(pdev, struct CXLType3Dev, parent_obj);
+    cxl_reset_all_logs(&ct3d->cxl_dstate);
+
+    cxl_event_irq_assert(pdev);
+    return 0;
+}
+
+void hmp_cxl_event_inject(Monitor *mon, const QDict *qdict)
+{
+    const char *id = qdict_get_str(qdict, "id");
+
+    if (do_cxl_event_inject(mon, qdict) < 0) {
+        return;
+    }
+
+    monitor_printf(mon, "OK id: %s\n", id);
+}
diff --git a/hw/cxl/cxl-host-stubs.c b/hw/cxl/cxl-host-stubs.c
index cae4afcdde26..61039263f25a 100644
--- a/hw/cxl/cxl-host-stubs.c
+++ b/hw/cxl/cxl-host-stubs.c
@@ -12,4 +12,9 @@ void cxl_fmws_link_targets(CXLState *stat, Error **errp) {};
 void cxl_machine_init(Object *obj, CXLState *state) {};
 void cxl_hook_up_pxb_registers(PCIBus *bus, CXLState *state, Error **errp) {};
 
+void hmp_cxl_event_inject(Monitor *mon, const QDict *qdict)
+{
+    monitor_printf(mon, "CXL devices not supported\n");
+}
+
 const MemoryRegionOps cfmws_ops;
diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 2b13179d116d..b4a90136d190 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -459,7 +459,7 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     ComponentRegisters *regs = &cxl_cstate->crb;
     MemoryRegion *mr = &regs->component_registers;
     uint8_t *pci_conf = pci_dev->config;
-    unsigned short msix_num = 3;
+    unsigned short msix_num = 7;
     int i;
 
     if (!cxl_setup_memory(ct3d, errp)) {
@@ -502,6 +502,11 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
         msix_vector_use(pci_dev, i);
     }
 
+    ct3d->cxl_dstate.event_vector[CXL_EVENT_TYPE_INFO] = 6;
+    ct3d->cxl_dstate.event_vector[CXL_EVENT_TYPE_WARN] = 5;
+    ct3d->cxl_dstate.event_vector[CXL_EVENT_TYPE_FAIL] = 4;
+    ct3d->cxl_dstate.event_vector[CXL_EVENT_TYPE_FATAL] = 3;
+
     /* DOE Initailization */
     if (ct3d->spdm_port) {
         pcie_doe_init(pci_dev, &ct3d->doe_spdm, 0x160, doe_spdm_prot, true, 2);
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 46c50c1c13a6..41232d3b3476 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -84,6 +84,8 @@
 #define CXL_TEST_EVENT_CNT_MAX 15
 
 struct cxl_event_log {
+    bool irq_enabled;
+    int irq_vec;
     int cur_event;
     int nr_events;
     struct cxl_event_record_raw *events[CXL_TEST_EVENT_CNT_MAX];
@@ -129,6 +131,7 @@ typedef struct cxl_device_state {
     /* memory region for persistent memory, HDM */
     uint64_t pmem_size;
 
+    uint16_t event_vector[CXL_EVENT_TYPE_MAX];
     struct cxl_event_log event_logs[CXL_EVENT_TYPE_MAX];
 } CXLDeviceState;
 
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 812f66a31a90..39476cc50190 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -64,6 +64,9 @@ extern unsigned int nb_prom_envs;
 /* pcie aer error injection */
 void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict);
 
+/* CXL */
+void hmp_cxl_event_inject(Monitor *mon, const QDict *qdict);
+
 /* serial ports */
 
 /* Return the Chardev for serial port i, or NULL if none */
-- 
2.37.2



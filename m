Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C56D653B41
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 05:26:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8D8r-0007qE-QK; Wed, 21 Dec 2022 23:25:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1p8D8k-0007oY-MT
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 23:25:06 -0500
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1p8D8i-00015r-Ay
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 23:25:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671683104; x=1703219104;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=J+TBMExW+oxWMea1/9bWs33uubwZIzBsbSx6C9l1aHU=;
 b=Uf8RbmZ2Arm0pErHQyRmKFOtkYGxpjsQKHriQWaTMRxJW9m7Fmn0Pp3m
 nrT4A5qYAdhfZVDD6+7m/L1hGFbINIl7f+KMQL8jB3fo1FXTcl4OpmWZh
 rOTgOK+AiBRbRBJYxpGp2L2sp2ze+MVFUm8A98j3m2MGyfIdGT+K6lZJS
 2RKpet+c0Dz5lU+qpjQJ1SEHZfDKLzUNUbIa5rTtYd+XXFVAjuUzsphH2
 Er6IwCPC69SC1ULNHIys3XMxL5U1IqTUCtrVbEJV55Lnj3LWlM6cTvWuV
 vMgUtEhAoSIcvpEU8JQTmt84TLdiDuhNZmCbxyRXGcrTycflZ/UGDy024 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="321957614"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; d="scan'208";a="321957614"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 20:24:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="601733202"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; d="scan'208";a="601733202"
Received: from iweiny-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.20.211])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 20:24:58 -0800
From: Ira Weiny <ira.weiny@intel.com>
Date: Wed, 21 Dec 2022 20:24:35 -0800
Subject: [PATCH v2 5/8] hw/cxl/events: Wire up get/clear event mailbox commands
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221221-ira-cxl-events-2022-11-17-v2-5-2ce2ecc06219@intel.com>
References: <20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com>
In-Reply-To: <20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>
X-Mailer: b4 0.11.0-dev-141d4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1671683093; l=14482;
 i=ira.weiny@intel.com; s=20221211; h=from:subject:message-id;
 bh=J+TBMExW+oxWMea1/9bWs33uubwZIzBsbSx6C9l1aHU=;
 b=oUxfmw0Xo8L7xDSlDpYSKMcuzjXZTJ0w8csY7HaeHvV9a4cUoVG6lv+eX/zBJtpEguqRKGzUn33c
 yFCRBdMMD0JjDBSL2o0d6vmKfQPmO9+PKe1GnKZOAGLgTC/KmNJo
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=noldbkG+Wp1qXRrrkfY1QJpDf7QsOEthbOT7vm0PqsE=
Received-SPF: pass client-ip=134.134.136.65; envelope-from=ira.weiny@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

CXL testing is benefited from an artificial event log injection
mechanism.

Add an event log infrastructure to insert, get, and clear events from
the various logs available on a device.

Replace the stubbed out CXL Get/Clear Event mailbox commands with
commands that operate on the new infrastructure.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Change from RFC:
	Process multiple records per Get/Set per the spec
	Rework all the calls to be within events.c
	Add locking around the event logs to ensure that the log
		integrity is maintained
---
 hw/cxl/cxl-events.c         | 221 ++++++++++++++++++++++++++++++++++++++++++++
 hw/cxl/cxl-mailbox-utils.c  |  40 +++++++-
 hw/cxl/meson.build          |   1 +
 hw/mem/cxl_type3.c          |   1 +
 include/hw/cxl/cxl_device.h |  28 ++++++
 include/hw/cxl/cxl_events.h |  55 +++++++++++
 6 files changed, 344 insertions(+), 2 deletions(-)

diff --git a/hw/cxl/cxl-events.c b/hw/cxl/cxl-events.c
new file mode 100644
index 000000000000..f40c9372704e
--- /dev/null
+++ b/hw/cxl/cxl-events.c
@@ -0,0 +1,221 @@
+/*
+ * CXL Event processing
+ *
+ * Copyright(C) 2022 Intel Corporation.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ */
+
+#include <stdint.h>
+
+#include "qemu/osdep.h"
+#include "qemu/bswap.h"
+#include "qemu/typedefs.h"
+#include "qemu/error-report.h"
+#include "hw/cxl/cxl.h"
+#include "hw/cxl/cxl_events.h"
+
+/* Artificial limit on the number of events a log can hold */
+#define CXL_TEST_EVENT_OVERFLOW 8
+
+static void reset_overflow(struct cxl_event_log *log)
+{
+    log->overflow_err_count = 0;
+    log->first_overflow_timestamp = 0;
+    log->last_overflow_timestamp = 0;
+}
+
+void cxl_event_init(CXLDeviceState *cxlds)
+{
+    struct cxl_event_log *log;
+    int i;
+
+    for (i = 0; i < CXL_EVENT_TYPE_MAX; i++) {
+        log = &cxlds->event_logs[i];
+        log->next_handle = 1;
+        log->overflow_err_count = 0;
+        log->first_overflow_timestamp = 0;
+        log->last_overflow_timestamp = 0;
+        qemu_mutex_init(&log->lock);
+        QSIMPLEQ_INIT(&log->events);
+    }
+}
+
+static CXLEvent *cxl_event_get_head(struct cxl_event_log *log)
+{
+    return QSIMPLEQ_FIRST(&log->events);
+}
+
+static CXLEvent *cxl_event_get_next(CXLEvent *entry)
+{
+    return QSIMPLEQ_NEXT(entry, node);
+}
+
+static int cxl_event_count(struct cxl_event_log *log)
+{
+    CXLEvent *event;
+    int rc = 0;
+
+    QSIMPLEQ_FOREACH(event, &log->events, node) {
+        rc++;
+    }
+
+    return rc;
+}
+
+static bool cxl_event_empty(struct cxl_event_log *log)
+{
+    return QSIMPLEQ_EMPTY(&log->events);
+}
+
+static void cxl_event_delete_head(CXLDeviceState *cxlds,
+                                  enum cxl_event_log_type log_type,
+                                  struct cxl_event_log *log)
+{
+    CXLEvent *entry = cxl_event_get_head(log);
+
+    reset_overflow(log);
+    QSIMPLEQ_REMOVE_HEAD(&log->events, node);
+    if (cxl_event_empty(log)) {
+        cxl_event_set_status(cxlds, log_type, false);
+    }
+    g_free(entry);
+}
+
+/*
+ * return if an interrupt should be generated as a result of inserting this
+ * event.
+ */
+bool cxl_event_insert(CXLDeviceState *cxlds,
+                      enum cxl_event_log_type log_type,
+                      struct cxl_event_record_raw *event)
+{
+    uint64_t time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    struct cxl_event_log *log;
+    CXLEvent *entry;
+
+    if (log_type >= CXL_EVENT_TYPE_MAX) {
+        return false;
+    }
+
+    log = &cxlds->event_logs[log_type];
+
+    QEMU_LOCK_GUARD(&log->lock);
+
+    if (cxl_event_count(log) >= CXL_TEST_EVENT_OVERFLOW) {
+        if (log->overflow_err_count == 0) {
+            log->first_overflow_timestamp = time;
+        }
+        log->overflow_err_count++;
+        log->last_overflow_timestamp = time;
+        return false;
+    }
+
+    entry = g_new0(CXLEvent, 1);
+    if (!entry) {
+        error_report("Failed to allocate memory for event log entry");
+        return false;
+    }
+
+    memcpy(&entry->data, event, sizeof(*event));
+
+    entry->data.hdr.handle = cpu_to_le16(log->next_handle);
+    log->next_handle++;
+    /* 0 handle is never valid */
+    if (log->next_handle == 0) {
+        log->next_handle++;
+    }
+    entry->data.hdr.timestamp = cpu_to_le64(time);
+
+    QSIMPLEQ_INSERT_TAIL(&log->events, entry, node);
+    cxl_event_set_status(cxlds, log_type, true);
+
+    /* Count went from 0 to 1 */
+    return cxl_event_count(log) == 1;
+}
+
+ret_code cxl_event_get_records(CXLDeviceState *cxlds,
+                               struct cxl_get_event_payload *pl,
+                               uint8_t log_type, int max_recs,
+                               uint16_t *len)
+{
+    struct cxl_event_log *log;
+    CXLEvent *entry;
+    uint16_t nr;
+
+    if (log_type >= CXL_EVENT_TYPE_MAX) {
+        return CXL_MBOX_INVALID_INPUT;
+    }
+
+    log = &cxlds->event_logs[log_type];
+
+    QEMU_LOCK_GUARD(&log->lock);
+
+    entry = cxl_event_get_head(log);
+    for (nr = 0; entry && nr < max_recs; nr++) {
+        memcpy(&pl->records[nr], &entry->data, CXL_EVENT_RECORD_SIZE);
+        entry = cxl_event_get_next(entry);
+    }
+
+    if (!cxl_event_empty(log)) {
+        pl->flags |= CXL_GET_EVENT_FLAG_MORE_RECORDS;
+    }
+
+    if (log->overflow_err_count) {
+        pl->flags |= CXL_GET_EVENT_FLAG_OVERFLOW;
+        pl->overflow_err_count = cpu_to_le16(log->overflow_err_count);
+        pl->first_overflow_timestamp = cpu_to_le64(log->first_overflow_timestamp);
+        pl->last_overflow_timestamp = cpu_to_le64(log->last_overflow_timestamp);
+    }
+
+    pl->record_count = cpu_to_le16(nr);
+    *len = CXL_EVENT_PAYLOAD_HDR_SIZE + (CXL_EVENT_RECORD_SIZE * nr);
+    return CXL_MBOX_SUCCESS;
+}
+
+ret_code cxl_event_clear_records(CXLDeviceState *cxlds,
+                                 struct cxl_clear_event_payload *pl)
+{
+    struct cxl_event_log *log;
+    uint8_t log_type;
+    CXLEvent *entry;
+    int nr;
+
+    log_type = pl->event_log;
+
+    if (log_type >= CXL_EVENT_TYPE_MAX) {
+        return CXL_MBOX_INVALID_INPUT;
+    }
+
+    log = &cxlds->event_logs[log_type];
+
+    QEMU_LOCK_GUARD(&log->lock);
+    /*
+     * Must itterate the queue twice.
+     * "The device shall verify the event record handles specified in the input
+     * payload are in temporal order. If the device detects an older event
+     * record that will not be cleared when Clear Event Records is executed,
+     * the device shall return the Invalid Handle return code and shall not
+     * clear any of the specified event records."
+     *   -- CXL 3.0 8.2.9.2.3
+     */
+    entry = cxl_event_get_head(log);
+    for (nr = 0; entry && nr < pl->nr_recs; nr++) {
+        uint16_t handle = pl->handle[nr];
+
+        /* NOTE: Both handles are little endian. */
+        if (handle == 0 || entry->data.hdr.handle != handle) {
+            return CXL_MBOX_INVALID_INPUT;
+        }
+        entry = cxl_event_get_next(entry);
+    }
+
+    entry = cxl_event_get_head(log);
+    for (nr = 0; entry && nr < pl->nr_recs; nr++) {
+        cxl_event_delete_head(cxlds, log_type, log);
+        entry = cxl_event_get_head(log);
+    }
+
+    return CXL_MBOX_SUCCESS;
+}
diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 157c01255ee3..97cf6db8582d 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/cxl/cxl.h"
+#include "hw/cxl/cxl_events.h"
 #include "hw/pci/pci.h"
 #include "hw/pci-bridge/cxl_upstream_port.h"
 #include "qemu/cutils.h"
@@ -89,8 +90,6 @@ enum {
         return CXL_MBOX_SUCCESS;                                          \
     }
 
-DEFINE_MAILBOX_HANDLER_ZEROED(events_get_records, 0x20);
-DEFINE_MAILBOX_HANDLER_NOP(events_clear_records);
 DEFINE_MAILBOX_HANDLER_ZEROED(events_get_interrupt_policy, 4);
 DEFINE_MAILBOX_HANDLER_NOP(events_set_interrupt_policy);
 
@@ -252,6 +251,43 @@ static ret_code cmd_infostat_bg_op_sts(struct cxl_cmd *cmd,
     return CXL_MBOX_SUCCESS;
 }
 
+static ret_code cmd_events_get_records(struct cxl_cmd *cmd,
+                                       CXLDeviceState *cxlds,
+                                       uint16_t *len)
+{
+    struct cxl_get_event_payload *pl;
+    uint8_t log_type;
+    int max_recs;
+
+    if (cmd->in < sizeof(log_type)) {
+        return CXL_MBOX_INVALID_INPUT;
+    }
+
+    log_type = *((uint8_t *)cmd->payload);
+
+    pl = (struct cxl_get_event_payload *)cmd->payload;
+    memset(pl, 0, sizeof(*pl));
+
+    max_recs = (cxlds->payload_size - CXL_EVENT_PAYLOAD_HDR_SIZE) /
+                CXL_EVENT_RECORD_SIZE;
+    if (max_recs > 0xFFFF) {
+        max_recs = 0xFFFF;
+    }
+
+    return cxl_event_get_records(cxlds, pl, log_type, max_recs, len);
+}
+
+static ret_code cmd_events_clear_records(struct cxl_cmd *cmd,
+                                         CXLDeviceState *cxlds,
+                                         uint16_t *len)
+{
+    struct cxl_clear_event_payload *pl;
+
+    pl = (struct cxl_clear_event_payload *)cmd->payload;
+    *len = 0;
+    return cxl_event_clear_records(cxlds, pl);
+}
+
 /* 8.2.9.2.1 */
 static ret_code cmd_firmware_update_get_info(struct cxl_cmd *cmd,
                                              CXLDeviceState *cxl_dstate,
diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
index 6e370a32fae9..053058034a53 100644
--- a/hw/cxl/meson.build
+++ b/hw/cxl/meson.build
@@ -7,6 +7,7 @@ softmmu_ss.add(when: 'CONFIG_CXL',
                    'cxl-cdat.c',
                    'cxl-cpmu.c',
 		   'switch-mailbox-cci.c',
+                   'cxl-events.c',
                ),
                if_false: files(
                    'cxl-host-stubs.c',
diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 21e866dcaf52..e74ef237dfa9 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -697,6 +697,7 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     /* CXL RAS uses AER correct INTERNAL erorrs - so enable by default */
     pci_set_long(pci_dev->config + 0x200 + PCI_ERR_COR_MASK,
                  PCI_ERR_COR_MASK_DEFAULT & ~PCI_ERR_COR_INTERNAL);
+    cxl_event_init(&ct3d->cxl_dstate);
     return;
 
 err_free_spdm_socket:
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 7180fc225e29..d7b43e74c05c 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -11,6 +11,7 @@
 #define CXL_DEVICE_H
 
 #include "hw/register.h"
+#include "hw/cxl/cxl_events.h"
 
 #include "hw/cxl/cxl_cpmu.h"
 /*
@@ -142,6 +143,20 @@ struct cxl_cmd {
     uint8_t *payload;
 };
 
+typedef struct CXLEvent {
+    struct cxl_event_record_raw data;
+    QSIMPLEQ_ENTRY(CXLEvent) node;
+} CXLEvent;
+
+struct cxl_event_log {
+    uint16_t next_handle;
+    uint16_t overflow_err_count;
+    uint64_t first_overflow_timestamp;
+    uint64_t last_overflow_timestamp;
+    QemuMutex lock;
+    QSIMPLEQ_HEAD(, CXLEvent) events;
+};
+
 typedef struct cxl_device_state {
     MemoryRegion device_registers;
 
@@ -197,6 +212,8 @@ typedef struct cxl_device_state {
     struct cxl_cmd (*cxl_cmd_set)[256];
     /* Move me later */
     CPMUState cpmu[CXL_NUM_CPMU_INSTANCES];
+
+    struct cxl_event_log event_logs[CXL_EVENT_TYPE_MAX];
 } CXLDeviceState;
 
 /* Initialize the register block for a device */
@@ -381,4 +398,15 @@ struct CSWMBCCIDev {
     CXLDeviceState cxl_dstate;
 };
 
+void cxl_event_init(CXLDeviceState *cxlds);
+bool cxl_event_insert(CXLDeviceState *cxlds,
+                      enum cxl_event_log_type log_type,
+                      struct cxl_event_record_raw *event);
+ret_code cxl_event_get_records(CXLDeviceState *cxlds,
+                               struct cxl_get_event_payload *pl,
+                               uint8_t log_type, int max_recs,
+                               uint16_t *len);
+ret_code cxl_event_clear_records(CXLDeviceState *cxlds,
+                                 struct cxl_clear_event_payload *pl);
+
 #endif
diff --git a/include/hw/cxl/cxl_events.h b/include/hw/cxl/cxl_events.h
index 7e0647ffb0e3..1798c4502cb3 100644
--- a/include/hw/cxl/cxl_events.h
+++ b/include/hw/cxl/cxl_events.h
@@ -10,6 +10,8 @@
 #ifndef CXL_EVENTS_H
 #define CXL_EVENTS_H
 
+#include "qemu/uuid.h"
+
 /*
  * CXL rev 3.0 section 8.2.9.2.2; Table 8-49
  *
@@ -25,4 +27,57 @@ enum cxl_event_log_type {
     CXL_EVENT_TYPE_MAX
 };
 
+/*
+ * Common Event Record Format
+ * CXL rev 3.0 section 8.2.9.2.1; Table 8-42
+ */
+#define CXL_EVENT_REC_HDR_RES_LEN 0xf
+struct cxl_event_record_hdr {
+    QemuUUID id;
+    uint8_t length;
+    uint8_t flags[3];
+    uint16_t handle;
+    uint16_t related_handle;
+    uint64_t timestamp;
+    uint8_t maint_op_class;
+    uint8_t reserved[CXL_EVENT_REC_HDR_RES_LEN];
+} QEMU_PACKED;
+
+#define CXL_EVENT_RECORD_DATA_LENGTH 0x50
+struct cxl_event_record_raw {
+    struct cxl_event_record_hdr hdr;
+    uint8_t data[CXL_EVENT_RECORD_DATA_LENGTH];
+} QEMU_PACKED;
+#define CXL_EVENT_RECORD_SIZE (sizeof(struct cxl_event_record_raw))
+
+/*
+ * Get Event Records output payload
+ * CXL rev 3.0 section 8.2.9.2.2; Table 8-50
+ */
+#define CXL_GET_EVENT_FLAG_OVERFLOW     BIT(0)
+#define CXL_GET_EVENT_FLAG_MORE_RECORDS BIT(1)
+struct cxl_get_event_payload {
+    uint8_t flags;
+    uint8_t reserved1;
+    uint16_t overflow_err_count;
+    uint64_t first_overflow_timestamp;
+    uint64_t last_overflow_timestamp;
+    uint16_t record_count;
+    uint8_t reserved2[0xa];
+    struct cxl_event_record_raw records[];
+} QEMU_PACKED;
+#define CXL_EVENT_PAYLOAD_HDR_SIZE (sizeof(struct cxl_get_event_payload))
+
+/*
+ * Clear Event Records input payload
+ * CXL rev 3.0 section 8.2.9.2.3; Table 8-51
+ */
+struct cxl_clear_event_payload {
+    uint8_t event_log;      /* enum cxl_event_log_type */
+    uint8_t clear_flags;
+    uint8_t nr_recs;
+    uint8_t reserved[3];
+    uint16_t handle[];
+};
+
 #endif /* CXL_EVENTS_H */

-- 
2.38.1


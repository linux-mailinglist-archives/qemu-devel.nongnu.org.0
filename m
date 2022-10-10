Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813FD5FA7DC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 00:52:26 +0200 (CEST)
Received: from localhost ([::1]:54694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi1dJ-00020F-Jq
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 18:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1oi1I8-0005wo-O0
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 18:30:34 -0400
Received: from mga02.intel.com ([134.134.136.20]:24672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1oi1I6-0005CM-J3
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 18:30:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665441030; x=1696977030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1iw/g99zdjhTGj/xb3GTGEtYnlr2Ot14YdbD7EFu5i4=;
 b=Y9ibHgIKfLSZTUOuLErucT92xB6jlGkSxtA0emRtRzq5q9HzkqFmGbVQ
 XmSbF1gaunjAi2xKMqud+sJTESNik5m44kmI9YtF/urPzW0iOAul6j+N7
 tL6PydP3sKVyyUebYg6hHWF2ldaqc+Qb/x74gzZaBg5vOPJXPp9Mi6SV2
 6at5NPAAaiSz8o2eyf6JhtBjwB/9oVyMLoCYHbEHhgzEJ1f0qsPUYP/Rw
 GFZew9J24UGaADLdpPkAu2dlT8yhoul2ii1odCSxWyX5lfwPz5BAbKq5W
 FlZG+X2oMj3iAl8LaVK2/zfhh6QcY2eahHRYRADTq/yIWAsymOMX3UzXb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="291661247"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="291661247"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 15:30:21 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="628457003"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="628457003"
Received: from iweiny-mobl.amr.corp.intel.com (HELO localhost) ([10.212.104.4])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 15:30:20 -0700
From: ira.weiny@intel.com
To: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Ira Weiny <ira.weiny@intel.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org
Subject: [RFC PATCH 4/6] hw/cxl/mailbox: Wire up get/clear event mailbox
 commands
Date: Mon, 10 Oct 2022 15:29:42 -0700
Message-Id: <20221010222944.3923556-5-ira.weiny@intel.com>
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

Replace the stubbed out CXL Get/Clear Event mailbox commands with
commands which return the mock event information.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 hw/cxl/cxl-device-utils.c  |   1 +
 hw/cxl/cxl-mailbox-utils.c | 103 +++++++++++++++++++++++++++++++++++--
 2 files changed, 101 insertions(+), 3 deletions(-)

diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
index 687759b3017b..4bb41101882e 100644
--- a/hw/cxl/cxl-device-utils.c
+++ b/hw/cxl/cxl-device-utils.c
@@ -262,4 +262,5 @@ void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
     memdev_reg_init_common(cxl_dstate);
 
     assert(cxl_initialize_mailbox(cxl_dstate) == 0);
+    cxl_mock_add_event_logs(cxl_dstate);
 }
diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index bb66c765a538..df345f23a30c 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/cxl/cxl.h"
+#include "hw/cxl/cxl_events.h"
 #include "hw/pci/pci.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
@@ -116,11 +117,107 @@ struct cxl_cmd {
         return CXL_MBOX_SUCCESS;                                          \
     }
 
-DEFINE_MAILBOX_HANDLER_ZEROED(events_get_records, 0x20);
-DEFINE_MAILBOX_HANDLER_NOP(events_clear_records);
 DEFINE_MAILBOX_HANDLER_ZEROED(events_get_interrupt_policy, 4);
 DEFINE_MAILBOX_HANDLER_NOP(events_set_interrupt_policy);
 
+static ret_code cmd_events_get_records(struct cxl_cmd *cmd,
+                                       CXLDeviceState *cxlds,
+                                       uint16_t *len)
+{
+    struct cxl_get_event_payload *pl;
+    struct cxl_event_log *log;
+    uint8_t log_type;
+    uint16_t nr_overflow;
+
+    if (cmd->in < sizeof(log_type)) {
+        return CXL_MBOX_INVALID_INPUT;
+    }
+
+    log_type = *((uint8_t *)cmd->payload);
+    if (log_type >= CXL_EVENT_TYPE_MAX) {
+        return CXL_MBOX_INVALID_INPUT;
+    }
+
+    pl = (struct cxl_get_event_payload *)cmd->payload;
+
+    log = find_event_log(cxlds, log_type);
+    if (!log || log_empty(log)) {
+        goto no_data;
+    }
+
+    memset(pl, 0, sizeof(*pl));
+    pl->record_count = const_le16(1);
+
+    if (log_rec_left(log) > 1) {
+        pl->flags |= CXL_GET_EVENT_FLAG_MORE_RECORDS;
+    }
+
+    nr_overflow = log_overflow(log);
+    if (nr_overflow) {
+        struct timespec ts;
+        uint64_t ns;
+
+        clock_gettime(CLOCK_REALTIME, &ts);
+
+        ns = ((uint64_t)ts.tv_sec * 1000000000) + (uint64_t)ts.tv_nsec;
+
+        pl->flags |= CXL_GET_EVENT_FLAG_OVERFLOW;
+        pl->overflow_err_count = cpu_to_le16(nr_overflow);
+        ns -= 5000000000; /* 5s ago */
+        pl->first_overflow_timestamp = cpu_to_le64(ns);
+        ns -= 1000000000; /* 1s ago */
+        pl->last_overflow_timestamp = cpu_to_le64(ns);
+    }
+
+    memcpy(&pl->record, get_cur_event(log), sizeof(pl->record));
+    pl->record.hdr.handle = get_cur_event_handle(log);
+    *len = sizeof(pl->record);
+    return CXL_MBOX_SUCCESS;
+
+no_data:
+    *len = sizeof(*pl) - sizeof(pl->record);
+    memset(pl, 0, *len);
+    return CXL_MBOX_SUCCESS;
+}
+
+static ret_code cmd_events_clear_records(struct cxl_cmd *cmd,
+                                         CXLDeviceState *cxlds,
+                                         uint16_t *len)
+{
+    struct cxl_mbox_clear_event_payload *pl;
+    struct cxl_event_log *log;
+    uint8_t log_type;
+
+    pl = (struct cxl_mbox_clear_event_payload *)cmd->payload;
+    log_type = pl->event_log;
+
+    /* Don't handle more than 1 record at a time */
+    if (pl->nr_recs != 1) {
+        return CXL_MBOX_INVALID_INPUT;
+    }
+
+    if (log_type >= CXL_EVENT_TYPE_MAX) {
+        return CXL_MBOX_INVALID_INPUT;
+    }
+
+    log = find_event_log(cxlds, log_type);
+    if (!log) {
+        return CXL_MBOX_SUCCESS;
+    }
+
+    /*
+     * The current code clears events as they are read.  Test that behavior
+     * only; don't support clearning from the middle of the log
+     */
+    if (log->cur_event != le16_to_cpu(pl->handle)) {
+        return CXL_MBOX_INVALID_INPUT;
+    }
+
+    log->cur_event++;
+    *len = 0;
+    return CXL_MBOX_SUCCESS;
+}
+
 /* 8.2.9.2.1 */
 static ret_code cmd_firmware_update_get_info(struct cxl_cmd *cmd,
                                              CXLDeviceState *cxl_dstate,
@@ -391,7 +488,7 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
     [EVENTS][GET_RECORDS] = { "EVENTS_GET_RECORDS",
         cmd_events_get_records, 1, 0 },
     [EVENTS][CLEAR_RECORDS] = { "EVENTS_CLEAR_RECORDS",
-        cmd_events_clear_records, ~0, IMMEDIATE_LOG_CHANGE },
+        cmd_events_clear_records, 8, IMMEDIATE_LOG_CHANGE },
     [EVENTS][GET_INTERRUPT_POLICY] = { "EVENTS_GET_INTERRUPT_POLICY",
         cmd_events_get_interrupt_policy, 0, 0 },
     [EVENTS][SET_INTERRUPT_POLICY] = { "EVENTS_SET_INTERRUPT_POLICY",
-- 
2.37.2


